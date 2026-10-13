Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E035E1D5
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896877; cv=none; b=ahfWcPrF1k+4VpzCq2I78G9+k2AiTTll86SOchgKrHffnjeE224+c6SD7Nl95zS2IRIbaiNaoniuRPjntx6hgE3yZ7VyVpwTy2dUJMkw/gaNHOUV/VYyfAF1ZffRTL3cNOGUk66pyp7oljJ42y2JoIT6VGYyjuSrseNGxqFCTYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896877; c=relaxed/simple;
	bh=0xbvjh0qVnVnxjHTJSiLmD0m4hgDtlYxlp2IfFAvr8I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HTSPfDwnAl5vtQ1LxvqzZfEFd2vqQE75M2u9edqR4anO6ztTfxjFmgX1rSeUPxY9NfPikyz5muQ9eZvL5Tcu6KVCOGILdoSGz7AWYT7KFMprWl+LtqcdjEg/ylPiPap5l6sHaUZHGRfTaYis1V2F7WZhm8f9uWDgMmu/mEgDfoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iO8B2ogb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iO8B2ogb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92091F00893;
	Tue, 13 Oct 2026 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896876;
	bh=Pc111dWqD/+4hadu/mUCBmEBatSWytrOd9+u2A89lYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iO8B2ogbtlj8MfmbdobnKAX3bci2GMg26LTk/cZECpB6xyZ1mSQflfl4/rARdYTkK
	 K8HqWct43Y5N+S8DxOMm4dKCfLvFvfqqdSdJDs4wf7VETpaOBc1ARAZdQtkIvkwMXx
	 sRWQOWEme1vwhJi99oWEi47912e/ZWmLaCrHsGmf1kMXb807MmqCNKieO+0BdmUpnB
	 xJXEl+/nESErgjmuepzraO+5BgNUh2KYXRuYZgULD82mpI7lBlibPUFs8Q9EnXCjGW
	 CGPyJyAj5pmOodaoFNHnGMs58CtuFv7ovoqV6RCj2B+6M7wW7ZlEWc7x7qtUb74ml2
	 FepDslQ4iyYyg==
Message-ID: <sashiko-outbox-169773@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] drivers: greybus: Add software SVC
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261013-gb-uart-transport-v3-5-81d0a8a1acf7@beagleboard.org>
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
 <20261013-gb-uart-transport-v3-5-81d0a8a1acf7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:07:55 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] locking: dropping trait object inside SpinLock causes atomic conte=
xt violation
- [Medium] gb_softsvc: operation_id leak when core drops SVC requests
- [Low] build: missing Make rule for exported header breaks compilation
--

commit 004105b6fb260c2da6da56325f81d73a5407f5e0
Author: Ayush Singh <ayush@beagleboard.org>

drivers: greybus: Add software SVC implementation
   =20
A Greybus network requires an SVC (Supervisory Controller) to bring
interfaces up, assign device IDs and connect CPorts to the AP. On a
UniPro network the SVC is a real entity on the bus, but transports that
merely carry Greybus messages - a UART, an I2C bus, a network link -
have no such entity, so every host driver for those transports ends up
open-coding an SVC emulation of its own.

[ ... ]

> diff --git a/drivers/greybus/gb_softsvc.rs b/drivers/greybus/gb_softsvc.rs
> new file mode 100644
> index 0000000000000..144e2364aa59c
> --- /dev/null
> +++ b/drivers/greybus/gb_softsvc.rs

[ ... ]

> +    fn map_remove(&self, primary_id: u8, intf_count: u8, dev: &kernel::d=
evice::Device) {
> +        let id =3D match primary_id.checked_sub(INTF_ID_START) {
> +            Some(x) =3D> x,
> +            None =3D> {
> +                dev_warn!(dev, "Invalid interace id");
> +                return;
> +            }
> +        };
> +        let mut guard =3D self.intf_map.lock();
> +
> +        for i in 0..intf_count {
> +            let _ =3D guard[usize::from(id + i)].take();

[Severity: High]
Does taking the item out of the SpinLock guard here drop the trait object
while atomic context is still active?

If this is the last reference to the Arc, the Drop implementation of the
underlying dyn InterfaceOps (provided by external host drivers) will be
executed synchronously. If the driver's Drop routine performs any sleepable
operations (like taking a mutex or flushing a workqueue to cleanly tear down
the transport), could this trigger a 'BUG: scheduling while atomic' kernel
panic?

Should the items be moved out of the lock and dropped after the guard is
released?

> +        }
> +    }

[ ... ]

> +    fn send_request<P: AsBytes>(&self, hd: &hd::Device, ty: u8, payload:=
 P) -> Result<()> {
> +        let msg =3D Msg::request(self.new_operation_id()?, ty, payload);
> +        hd.data_rcvd(protocols::GB_SVC_CPORT_ID, msg.as_bytes());
> +        Ok(())
> +    }

[Severity: Medium]
Is there a mechanism to prevent operation_id leaks if the core drops SVC
requests?

When gb_softsvc sends a request via hd.data_rcvd(), the greybus core might
drop the request early (for instance, if the GFP_ATOMIC memory allocation
fails in gb_operation_create_incoming() or gb_operation_get_active() fails
in gb_connection_recv_request() in drivers/greybus/operation.c).

If the core silently drops the message without calling
gb_operation_request_handle() or sending a response back to the SVC,
could the svc_operation_id IdPool leak IDs until find_unused_id() fails
with EOVERFLOW, preventing the soft SVC from sending further requests?

[ ... ]

> diff --git a/drivers/greybus/gb_softsvc_exports.c b/drivers/greybus/gb_so=
ftsvc_exports.c
> new file mode 100644
> index 0000000000000..a0e360c4d137f
> --- /dev/null
> +++ b/drivers/greybus/gb_softsvc_exports.c
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 BeagleBoard.org. All right=
s reserved.
> +
> +/*
> + * Exports Rust symbols from the `gb_softsvc` crate for use by dependent=
 modules.
> + *
> + * This is a workaround until the build system supports Rust cross-module
> + * dependencies natively.
> + */
> +
> +#include <linux/export.h>
> +
> +#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sy=
m)
> +
> +#include "exports_gb_softsvc_generated.h"

[Severity: Low]
Does the Makefile lack a target rule to generate exports_gb_softsvc_generat=
ed.h?

Compiling the kernel with CONFIG_GREYBUS_SOFTSVC enabled seems to
unconditionally fail at build time because the generated header is included
here but never built.

If the generation rule is introduced later in the series, will this break
bisectability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gb-uart-tr=
ansport-v3-0-81d0a8a1acf7@beagleboard.org?part=3D5
