Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5163F9A1A
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218834; cv=none; b=ifIzYZzVe69NSuaiVuuPASisEmoKVNUEywUucbiDa6bltXfltRaLC32Lnu/pIEoW414VY8lXZvrxMtF5UzeBBhNOLcS36KlsgU+5+al6IZuURGI1HuSnx9Z5RCoxWHLqm1bIdlOBLmHsaM5OY9o8AufK/6XNV2UEwz10496qVL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218834; c=relaxed/simple;
	bh=5WdFALh7CXsqQLAC3RvX/GJ/SzIkD0WZW6ujCBB/dOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EcuHPUpsXBd6iO5uHVh0T8hcNiimoiffvf+jU3zpT8SEylBiAiZHx0k0oQFvYV2ZFztvSy98TyytY0nx6kkduu6eU5dKYDTqcqMdW4CoRzJ62/ABnCL/Z6aV67PLrg9o5grRRObl/QE6Y3njDiVXSdvC9ZSfaJoMQ5GfUaCJbCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6Doplwt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6Doplwt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CD81F000E9;
	Thu, 20 Aug 2026 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787218827;
	bh=D5O5v5kdiMBxeAvoq/yBatfwzhujZca4Dn6km+Co3Jc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a6DoplwtWc3G3s6FHQNyVe087faGn9ffAfVzUqQx0v0VX2la+pUFqt6o19PZL2Tdq
	 gQmVya4MPD21Ss2ZFRulpWJiSwxMoUteo42gWikD78md7o+ID6nswzAnJoHp4MQzz0
	 CMjJqVBU0yYKNZjGW8mFqfaDHgHad92sGfUubzz9WT7BDn8NeBERcCDVknOcjEl88J
	 4jHHUJXWG4bJA6jLYgnc0fZ1zttGAZCRx6HuvL+lawzTbuDzmCkGbmUNsercKutlfc
	 B6gyfv6xSDnbnNsSVytRslyBSj5z9C684RWGQsS8B/3RzndRCdj48Q07RJtik3QqSQ
	 UrHSK49tjuCCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] drivers: greybus: Add software SVC implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, ojeda@kernel.org, robh@kernel.org
In-Reply-To: <20260820-gb-uart-transport-v1-5-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-5-282da14ab7b7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:40:26 +0000
Message-Id: <20260820094026.B6CD81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Calling `Module::new` with an empty slice panics the kernel.
- [High] Out-of-bounds bitmap access in `release_operation_id` crashes the =
kernel.
- [High] Unconditionally calling `msg.sent(0)` followed by returning an err=
or causes a double-free of the operation.
- [High] Initialization error path permanently leaks `GLOBAL_STATE`.
- [High] InterfaceOps are leaked in Svc::module_insert() if send_request() =
fails.
- [High] Incorrect endianness conversions for Greybus SVC constant values b=
reak big-endian platforms.
- [Medium] `module_insert` hardcodes `intf_count` to 1, breaking support fo=
r modules with multiple interfaces.
- [Low] Copy-paste errors in `gb_softsvc_exports.c` metadata.
--

--- Patch [5]: [PATCH 5/7] drivers: greybus: Add software SVC implementatio=
n ---
commit ae94a156cc024cc7dae613127a7c0c6694200c02
Author: Ayush Singh <ayush@beagleboard.org>

drivers: greybus: Add software SVC implementation

A Greybus network requires an SVC (Supervisory Controller) to bring
interfaces up, assign device IDs and connect CPorts to the AP. This adds
gb-softsvc, a Rust implementation of the SVC that lives in the kernel
and registers itself as a Greybus host device.

> diff --git a/drivers/greybus/gb_softsvc.rs b/drivers/greybus/gb_softsvc.rs
> new file mode 100644
> index 0000000000000..0d125a1a2cc8f
> --- /dev/null
> +++ b/drivers/greybus/gb_softsvc.rs
> @@ -0,0 +1,472 @@
[ ... ]
> +const SVC_VERSION_MAJOR: u8 =3D 0;
> +const SVC_VERSION_MINOR: u8 =3D 1;
> +const ENDO_ID: u16 =3D u16::from_le(0x4755);

[Severity: High]
Are u16::from_le() and u32::from_le() being used correctly here?

Constructor functions like GbSvcHelloRequest::new() expect native-endian
arguments and internally convert them to little-endian. Applying from_le()
followed by the internal to_le() cancels out the byte swap on big-endian
platforms, causing the data to be transmitted in native big-endian format
instead of the required little-endian.

[ ... ]
> +    fn new() -> impl PinInit<Self, Error> {
> +        pin_init!(Self {
> +            intf_map <- new_mutex!(init_array_from_fn(|_| None)),
> +            svc_operation_id <- new_spinlock!(IdPool::with_capacity(u16:=
:MAX.into(), GFP_KERNEL)?)

[Severity: High]
The ID pool is initialized with a capacity of u16::MAX (65535), making valid
indices 0 to 65534.  If an untrusted remote endpoint sends a message with
operation_id =3D 65535, does this pass the out-of-bounds ID directly to
release_id() in release_operation_id()?

[ ... ]
> +    fn release_operation_id(&self, id: u16) {
> +        let mut ida =3D self.svc_operation_id.lock();
> +        ida.release_id(id as usize);
> +    }
[ ... ]
> +    fn map_insert(&self, intfs: &[Arc<dyn InterfaceOps>]) -> Result<u8> {
> +        fn inner(
> +            intf_map: &[Option<Arc<dyn InterfaceOps>>; INTF_MAP_LEN],
> +            count: usize,
> +        ) -> Result<u8> {
> +            for (id, window) in intf_map.windows(count).enumerate() {

[Severity: High]
If a caller passes an empty slice of interfaces to Module::new(), won't
count be 0? Calling .windows(0) on a slice unconditionally panics in
Rust, which would crash the kernel.

> +                if window.iter().all(|x| x.is_none()) {
> +                    return Ok(id as u8);
> +                }
> +            }
[ ... ]
> +    fn module_insert(&self, hd: &hd::Device, intfs: &[Arc<dyn InterfaceO=
ps>]) -> Result<u8> {
> +        let intf_id =3D self.map_insert(intfs)?;
> +        let payload =3D protocols::GbSvcModuleInsertedRequest::new(intf_=
id, 1, 0);

[Severity: Medium]
Does hardcoding the intf_count to 1 prevent the Greybus core from
discovering subsequent interfaces when intfs.len() > 1?

> +        self.send_request(hd, protocols::GB_SVC_TYPE_MODULE_INSERTED, pa=
yload)?;

[Severity: High]
If self.send_request() fails, the function returns an error, but the
interfaces were already inserted into intf_map via self.map_insert().
Since Module::new() aborts on this error path, Module::drop will never
be called to clean up.  Does this permanently leak the slots in intf_map
and the Arc<dyn InterfaceOps> references?

> +
> +        Ok(intf_id)
> +    }
[ ... ]
> +    fn dme_peer_get(&self, hd: &hd::Device, hdr: &protocols::GbOperation=
MsgHdr) {
> +        let payload =3D protocols::GbSvcDmePeerGetResponse::new(0, u32::=
from_le(0x0126));

[Severity: High]
This seems to have the same endianness cancellation issue as ENDO_ID when
used on big-endian architectures.

> +        self.send_response(hd, hdr, payload);
> +    }
[ ... ]
> +impl hd::HdDriver for GbHdDriver {
> +    fn message_send(data: &Self, dest_cport_id: u16, msg: greybus::Messa=
ge) -> Result {
> +        let res =3D data.message_send_inner(dest_cport_id, &msg);
> +        msg.sent(0);

[Severity: High]
If message_send_inner() returns an error, msg.sent(0) will incorrectly
report success to the Greybus core, causing it to drop its reference to the
operation structure. When the error is then returned to the caller, it may =
also
drop the reference. Could this sequence result in a double-free?

> +
> +        res
> +    }
[ ... ]
> +impl kernel::Module for GreybusSoftSvc {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        pr_info!("gb_softsvc (init)\n");
> +
> +        // SAFETY: This runs once at module init, before anything else c=
an reach GLOBAL_STATE.
> +        unsafe { GLOBAL_STATE.init() };
> +
> +        let faux =3D faux::Registration::new(c_str!("gb-softsvc"), None)=
?;
> +        let svc =3D Arc::pin_init(Svc::new(), GFP_KERNEL)?;
> +        let data =3D GbHdDriver(svc.clone());
> +
> +        let dev =3D faux.as_ref().as_ref();
> +        let hd =3D hd::Registration::new(dev, GB_OPERATION_SIZE_MAX, CPO=
RT_ID_MAX + 1, Ok(data))?;
> +
> +        let global_state =3D GlobalState::new(svc.clone(), hd.as_ref().i=
nto());
> +        let _ =3D GLOBAL_STATE.lock().replace(global_state);
> +
> +        svc.send_version(hd.as_ref())?;

[Severity: High]
If svc.send_version() fails, module initialization is aborted and
GreybusSoftSvc::drop() will not be called. Does this leave GLOBAL_STATE
populated, permanently leaking the Arc<Svc> and ARef<hd::Device> references?

> +
> +        Ok(GreybusSoftSvc {
> +            _hd: hd,
> +            _faux: faux,
> +        })
> +    }
> +}
[ ... ]
> +    pub fn submit_message(&self, cport: u16, msg: &[u8]) -> Result<()> {
> +        let intf =3D self
> +            .gb_hd
> +            .find_connection_by_intf(self.id, cport)

[Severity: Medium]
In addition to hardcoding the interface count to 1 earlier, using self.id
here instead of allowing the caller to specify the interface ID seems to
prevent routing messages for any interfaces beyond the first one.

> +            .ok_or(code::EINVAL)?;
> +        self.gb_hd.data_rcvd(intf.hd_cport_id(), msg);
> +
> +        Ok(())
> +    }
[ ... ]
> diff --git a/drivers/greybus/gb_softsvc_exports.c b/drivers/greybus/gb_so=
ftsvc_exports.c
> new file mode 100644
> index 0000000000000..38b99c4de6eec
> --- /dev/null
> +++ b/drivers/greybus/gb_softsvc_exports.c
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +/*
> + * Exports Rust symbols from the nova_core crate for use by dependent mo=
dules.

[Severity: Low]
Are the references to NVIDIA and the nova_core crate here accidental
copy-paste errors from another driver?

> + *
> + * This is a workaround until the build system supports Rust cross-module
> + * dependencies natively.
> + */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-gb-uart-tr=
ansport-v1-0-282da14ab7b7@beagleboard.org?part=3D5
