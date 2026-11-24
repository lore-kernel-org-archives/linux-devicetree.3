Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795523318;
	b=xmTW1em0CZLZetgEih46foYANw1ljhFbbcsRZr4FxzNpRdaTCAgHI+y+yPfz2pl5W9fU
	 5xpGEG80WLbNTeWBIS1WGzFk/RvGopr2y+TIHj8JTiX+jU9DnPHIlXuJ42E5wox6nFh0P
	 178PRIDZDGqlnimdZ11jTcOYOZEBa3cD4U0Fl0O0Pt+3inWihVQQYRgzR0O7+4kDp2xdk
	 L8RlP8z2dXFAgiGUUGhvmhOZ5ICZaulY6Qq7auj10I+uF4kcl7T0qOP5Rm45ifPRKjpg4
	 UJrSVTqOrWcJPVWPGzucyyL4Ap54lHYw+vFrTk/K+XX78byJIY6Lt3mCJS9saljOfVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
	b=0lTgRqF+JQPe/B2/KTxsTWoNAPoBRhQYN9owOkvkhXHgOf5/36xjFLlicva+KG6TJ+Qp
	 g6uAI/XlWpaWHBV9pqEUrHxHkabSXi/9t/TgtJtXBuwg70xWBQqxQWeofIGb6WGdzanc2
	 24wWgdhN6F8H/OsvhjLJ4usbpMonGEOBJXhL3jKxc9xLiMq/tA+XKiP7KHWe8ubrIWUou
	 Gc4AP5DbJw4M6XMAwQUE2SnApDamfT3V88msa7D9KnUuDmEmAg362TstqiMTqGVEJQIvL
	 J8UoGtbkQeDGWJE90Rwq4b/1SpdJ0tnB7WcVMFzshjHQoJDMRhdHdBMQ1yW1l2pvfBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="RMx/Wp5n";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A801D606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A801D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RMx/Wp5n
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so6979425a12.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 04:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795523316; cv=none;
        d=google.com; s=arc-20260327;
        b=pBbTVZuYaTHd9UJTk9H2BORETaLRk8y4Qt0Pzgxp6JXWjindNNBvQML4DXeSGkypk+
         R4Oo7tTjubi0UAZsgZihVDXyQMwedNT2XdYDS3hU4EmW06uholbqxKwfoV18jXh0kogC
         zE5cWXgrkwumWeb3ucCpo89//ytrKiTCs24Pqtsu7uISbs7CtXojODgm2bxR6RrGOYsx
         zHnGsTf7/eOGgfqa4SOaZhZ8zVPlFu4r5+FU1+vZoLJzKt252tFTVjFYz9cC2/CAjl6l
         r7RMblHa2MTefIqO5BlXcLCOwg+MLvdoGtK48VaEp1wHoOgpR/eN0cydAozf0js/CpEA
         ILUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
        fh=bzCXutk0XV2MeSJqAobFkcF0VNnZ2kHIIiAwpB20ifI=;
        b=oh+EbNHZ+WpUbA5R8wmn9pKRWYuFemeMdAu/2o+qm5xj3BhfstbKITjINZ7FykIDLX
         sI4MOjvX1Onf3lV7xwSZrgTFJawDwpb/xGYmWiUO3lNKjHnhQNypDxHnoih4k2aDo2mJ
         zOfK5++yz7Om6wrOBBQA6Pvdjp/teH42+ZzP8d1KEVaFGLgGM8y+JRcMeLfv95sjDHpZ
         BNtg98ATFubPLMfiTsUQ6bFxIHPxX6vLt8hV6Y9jYG+phV1E9Nzq7lJEI1bKiwHsUfeE
         R7YiZXo3dcOtYSG8YXbQ5JY3IQfveJZaldHrAEu08zRjWbgJvwTXZSBnSkwXuWpgMNgO
         sB6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795523316; x=1796128116; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
        b=RMx/Wp5nh2hga/5Ka4gbv6FcsmqZUMeY9mBxA7edn2B7jINKD4jjjzT8+5a9jbkxdD
         IjJG9XwbrMOIYpZgI3NjsSHaVLzTGFArKhI8Zcyah9fdiHrrT5txVZl+RONOVd+wtcvO
         wkfV29zyPlBX5wIPX/ngyUWhdiEV/njhJ+ahWe2OenTnL2qkZfoJnG/3nRi2PcAIL/bi
         NlwjsRw9AfAGbmlWoo2czBvq3ouPopxR/bpZCe3EcduRzokf0haHFNnyie/VvgRElRJm
         z/eoNlqQR0gfeyla2HNqaxw36496VoE1cCbPyZvWPUtxfvfgYmZ9HY/fhmcfrMSWkoR+
         8Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523316; x=1796128116;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
        b=VgWK7AvxoK4t3ADa2Ov8K4W0bH+xvYKIOn/zUrwSDZaUL3YuDvVePXrk3YBfm0eVm/
         EUvmuzbXq2L+PZ/vBMh9f7yFuKfNZBPdi/ZU8FAffkZiBPo+hKoizkFoKOMWYLUXcuoL
         irjA794YZpFd3HONnlwTdicG5UxGoC88yxgx/6X29MPzDZKMu9G4/z6RIpmcO73B127d
         4lhtxDslJGqBkqaV18SJc3w+LV5e2lJKDTTy2rWJU8nIkoiGWpcofbgTzVsLClPgQaVM
         ukxbty+vmTPJ1/iN7CMKHhzI1XPw8dplyiN8tEa6HXt5YXFyGb42mUXR6C5tvL9KfQXV
         ciMg==
X-Forwarded-Encrypted: i=1; AL+hErHSf6ZE+I5gzjZK7rO+x1yYnjcAXGuheiI48Wr7MEbZbbob3VmN543CgiXkK6InYtB9ebTJUKClJcxH@vger.kernel.org
X-Gm-Message-State: APuU4Z9wKhqQCUOnGmHeQ/Oep0Gb7lGN7lC1RoKqcyj2imCPS6ZdV5xG
	rE9n8GufWSlAwaN41eIZhleB8IJe0LaOjZO1DtsZAM0OWOzaWavZR6bvbkAWeWYw0HrkZkmu+N1
	fiiRvgBe6+cw1D51sdS9qNVMWFBc7SeQ8Ze42WAIuhA==
X-Gm-Gg: AZFdTZfGgU4DBEO0JkomFJTZvVUo+nwzjKP/rMn0aCaytl5nWklSelegAcDS1PduC+/
	RF5Knb1ihblGdPmkAHf6BJ6ymu0NSAfRi0inC8Tjx0bkMfFNpo2VNyV5bgP69oMilfvn9zUgIia
	fxJsHc97vwAEgvMbviHjvdLOF7oG1KTk1fklslIJryumfFcWIxP29gRX2Yphvwk1IVsvqPnZUNu
	eA88ZfX8X42k85sz+c6/zrrw01cj7+SJ3Estc4m1qh8rPKjKMth5F/H90SP4UVsD5OpvNMDkE4G
	faxNLUlxsqlyGx7FjbXKXyjZVI5j6hOufmBt6GNgFMoJTANAdEs4ZpLbNo5KRCN/+c9uDB06xwb
	CeCdiCz0L3s3Wrj/n3WAam7INznXGDijz98kNq3i9VAOlOsQQIm0pyKCuUNSdqb4XrqQphYo=
X-Received: by 2002:a05:6402:1ed4:b0:6ba:6598:1392 with SMTP id
 4fb4d7f45d1cf-6ba6598149bmr7679171a12.8.1795523315933; Tue, 24 Nov 2026
 04:28:35 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org> <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
In-Reply-To: <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 12:28:24 +0000
X-Gm-Features: Aa3M54o6_q2ze_X5WV0lDS-4k9Z9r9IbiOz5WhjT-SYs0fIiqKLT_L-3r-75L7Q
Message-ID: <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

Thanks for your series; it's great to see more Laguna support being posted.

On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
>
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
>
> The Application Processor communicates with CPM over a pair of mailbox
> channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> reset, interrupt services, and more.

[..]

+++ b/drivers/soc/google/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config GOOGLE_CPM_MBA
+       tristate "Google Tensor CPM MailBox Array Interface"
+       depends on ARCH_GOOGLE || COMPILE_TEST
+       depends on MAILBOX

Should we also have "depends on OF"?

+       select AUXILIARY_BUS
+       help
+         Driver for interfacing with the Central Power Manager (CPM) MailBox
+         Array (MBA) found on Google Tensor SoCs. The driver provides APIs for
+         communication between the Application Processor and the CPM, and
+         is required by CPM client drivers such as clock, reset, power
+         domain, and more.

> diff --git a/drivers/soc/google/google-cpm-mba.c b/drivers/soc/google/google-cpm-mba.c
> new file mode 100644
> index 000000000000..629a071e202c
> --- /dev/null
> +++ b/drivers/soc/google/google-cpm-mba.c
> @@ -0,0 +1,964 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Google MailBox Array (MBA) CPM Interface
> + *
> + * Copyright 2023-2026 Google LLC
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/jiffies.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
> +#include <linux/mailbox/goog-mba-message.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>

Missing `#include <linux/slab.h>` header here as later it calls
kfree(), kzalloc_obj().
This can cause "implicit declaration of function kfree / kzalloc_obj"
errors with COMPILE_TEST. Also similar issue in clk-cpm.c

> +
> +#include <soc/google/google-cpm-mba.h>
> +
> +#include "google-cpm-mba.h"
> +

[..]
> +static bool cpm_iface_is_valid_req(struct cpm_data *cpm,
> +                                  struct cpm_request *cpm_req)
> +{
> +       struct device *dev = cpm->dev;
> +
> +       if (!cpm_req) {
> +               dev_err(dev, "cpm_req is NULL\n");
> +               return false;
> +       }
> +
> +       if (!cpm_req->req_msg) {
> +               dev_err(dev, "cpm_req->req_msg is NULL\n");
> +               return false;
> +       }
> +
> +       if (cpm_req->msg_type > RESPONSE_MSG || cpm_req->msg_type < ONEWAY_MSG) {
> +               dev_err(dev, "Invalid msg_type: %d\n", cpm_req->msg_type);
> +               return false;
> +       }

Should cpm_req->dst_id also be range checked?

> +
> +       if (cpm_is_request_msg(cpm_req) && !cpm_req->resp_msg) {
> +               dev_err(dev, "cpm_req->resp_msg is NULL when msg_type is REQUEST_MSG\n");
> +               return false;
> +       }
> +
> +       if (cpm_is_response_msg(cpm_req)) {
> +               if (!goog_mba_q_get_valid(&cpm_req->resp_context)) {
> +                       dev_err(dev, "Invalid valid bit in resp_context: %#x\n",
> +                               cpm_req->resp_context);
> +                       return false;
> +               }
> +
> +               if (!cpm_is_response_header(&cpm_req->resp_context)) {
> +                       dev_err(dev, "Invalid response type in resp_context: %#x\n",
> +                               cpm_req->resp_context);
> +                       return false;
> +               }
> +       }
> +
> +       return true;
> +}
> +

[..]

> +
> +static int cpm_init_q_mode_proto(struct cpm_data *cpm)
> +{
> +       struct cpm_payload msg_payload = {};
> +       struct cpm_request req = {
> +               .msg_type = ONEWAY_MSG,
> +               .req_msg = &msg_payload,
> +       };
> +
> +       return __cpm_send_message(cpm, &req, GOOG_MBA_Q_INIT_PROTO_VAL, 0);

Do we want this to have an infinite timeout? If the CPM firmware never
responds, it will hang the boot (as MAX_SCHEDULE_TIMEOUT doesn't arm a
timer).
I guess it is game over anyway if the CPM firmware is dead, but it
would be nice to log an error and return from probe()


> +}
> +
> +static int cpm_init_q_mode(struct cpm_data *cpm)
> +{
> +       int ret;
> +
> +       ret = cpm_init_q_mode_proto(cpm);
> +       if (ret < 0)
> +               return ret;
> +
> +       cpm->seq_num = GOOG_MBA_Q_MIN_SEQ_VAL;
> +
> +       return 0;
> +}
> +
> +static void cpm_adev_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +       of_node_put(dev->of_node);
> +       kfree(adev);
> +}
> +
> +static void cpm_unregister_adev_action(void *data)
> +{
> +       struct auxiliary_device *adev = data;
> +
> +       auxiliary_device_delete(adev);
> +       auxiliary_device_uninit(adev);
> +}
> +

Can we use devm_auxiliary_device_create() instead of open coding these?

> +static int cpm_register_adev(struct cpm_data *cpm, const char *name)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = kzalloc_obj(*adev, GFP_KERNEL);
> +       if (!adev)
> +               return -ENOMEM;
> +
> +       adev->name = name;
> +       adev->id = 0;
> +       adev->dev.parent = cpm->dev;
> +       adev->dev.release = cpm_adev_release;
> +       device_set_of_node_from_dev(&adev->dev, cpm->dev);
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret) {
> +               of_node_put(adev->dev.of_node);
> +               kfree(adev);
> +               return ret;
> +       }
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(cpm->dev, cpm_unregister_adev_action, adev);
> +}
> +

[..]

> +
> +MODULE_DESCRIPTION("Google MBA CPM interface");
> +MODULE_AUTHOR("Lucas Wei <lucaswei@google.com>");

I think you should add Lucas Wei's SoB tag to the patch as part of the DCO

regards,

Peter
