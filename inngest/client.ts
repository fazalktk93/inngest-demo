import type { AppCSVFileUploaded } from '@/inngest/importContactsFromCSVFile';
import type {
  AppEmailOpened,
  AppUserSignedUp,
} from '@/inngest/customerOnboarding';
import { EventSchemas, Inngest } from 'inngest';

// Initialize Inngest without the eventKey for local development
const inngest = new Inngest({
  id: 'Inngest Demo',
  schemas: new EventSchemas().fromUnion<AppCSVFileUploaded | AppUserSignedUp | AppEmailOpened>(),
});

export default inngest;
