Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230D8380FDE
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818165; cv=none; b=AYYC+hronldUa+1G9ElDu6UJseOM+x2O8b+Yygo2188WsFdSgFyJCkdlEpvToX4VlrHlb63iz36AQZuzkVckw/shDImIMCpAj8rapQOM4n9cDMwEvqvH0ppJ/dV9YlLJ0stoGspgR24Xew6eBLGr5a3C1Q1SUDMOum6xpXPr7QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818165; c=relaxed/simple;
	bh=eCKrm6szzx9YQXbKKhrcfkGoKGha3qKP48ft/cMlmnY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dzyk9aeHycG1BTvcjGUEXwOQdGpWU/uiPhLGLkvfTLsIvgqwr+BSMj3+x+d6j1zX0SLeg2G4ZC0C8Ypv0uMlIQ6KywQjUfxXGwWAe1R1XTgZaV6VC95Ls145OxZJR3S7HSa/nZtwbyYFY+NC7RiNUtDvML/gN8TId3HRqIlWtlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGNaiLJg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGNaiLJg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A511F000E9;
	Thu, 27 Aug 2026 08:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787818161;
	bh=up6YWx+OTFWQeRv+ub/kP6yBoNTkOHPjVwpo16Bofms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nGNaiLJgE0nl9x1oS9KSkCgWkHnEsydWeW7qFQma6fosjsmsRFPpRHdGW90wOxAIA
	 L1RZvC37T/ATxTXT7uxNdrcPK74KUWFJsSyqoOjzR3OMz6HnMBPa/7w/R6mXut96JE
	 AZXsCDO4nhvmFxvgHKJcoi3LrBPLufT0DHoofCQcBcqr34dHAJ9k5pQgRckW6waRIQ
	 3A2CTa6v3i7HRRZMqDiDcvy7PskpILAY110fFRnervEv4lD1g9aM5JKdi3IvBzInX2
	 67Rlb7/fYmGi6vBbQBOXE0omNupS5scMeNVtz3VNg9bY01ynDfNcQATp1WG/RIFzrg
	 2XoPLfjfk5KqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] drivers: greybus: Add software SVC
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: conor+dt@kernel.org, robh@kernel.org, ojeda@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-gb-uart-transport-v2-5-a03bb1f5fbd1@beagleboard.org>
References: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
 <20260827-gb-uart-transport-v2-5-a03bb1f5fbd1@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 08:09:21 +0000
Message-Id: <20260827080921.B2A511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] `Msg<P>` unsoundly implements `AsBytes` for an unconstrained `P`, =
allowing types with pointers, padding, or interior mutability to be read as=
 bytes.
- [High] Kconfig `GREYBUS_SOFTSVC` relies on the `kernel::greybus` Rust mod=
ule but lacks a dependency on `RUST_GREYBUS_ABSTRACTIONS`.
- [High] The `message_send` function calls `intf_by_id`, which acquires a `=
Mutex` (`self.intf_map.lock()`), but `message_send` can be called from atom=
ic contexts.
- [Medium] Integer underflow panic in `Svc::intf_by_id` if `id` is 0.
--

commit 7f12c32b073d73645edd3aaf941609c3637db70d
Author: Ayush Singh <ayush@beagleboard.org>

drivers: greybus: Add software SVC implementation

This commit adds gb-softsvc, a Rust implementation of the Greybus SVC
(Supervisory Controller) that lives in the kernel. It provides an SVC
emulation for host drivers on transports without a native SVC.

Link: https://lore.kernel.org/all/20260622-nova-exports-v5-0-6191773fc977@n=
vidia.com/

> diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
> index 3bf3b86914423..381d1a6ee135c 100644
> --- a/drivers/greybus/Kconfig
> +++ b/drivers/greybus/Kconfig

[ ... ]

> @@ -48,5 +48,17 @@ config GREYBUS_ES2
>  	  To compile this code as a module, choose M here: the module
>  	  will be called gb-es2.ko
> =20
> +config GREYBUS_SOFTSVC
> +	tristate "Greybus software SVC"
> +	depends on RUST

[Severity: High]
Will this fail to build if RUST_GREYBUS_ABSTRACTIONS is disabled?
Since this driver relies on the kernel::greybus Rust module, it seems it
needs a dependency on RUST_GREYBUS_ABSTRACTIONS to ensure the abstractions
are compiled in.

> +	help
> +	  Select this option to enable a software implementation of the
> +	  Greybus SVC (Supervisory Controller) running in the kernel. It can

[ ... ]

> diff --git a/drivers/greybus/gb_softsvc.rs b/drivers/greybus/gb_softsvc.rs
> new file mode 100644
> index 0000000000000..79e2752e42ba0
> --- /dev/null
> +++ b/drivers/greybus/gb_softsvc.rs

[ ... ]

> +#[repr(C, packed)]
> +struct Msg<P> {
> +    hdr: protocols::GbOperationMsgHdr,
> +    payload: P,
> +}
> +
> +// SAFETY: `Msg` is a POD type with no padding and no interior mutabilit=
y.
> +unsafe impl<P> kernel::transmute::AsBytes for Msg<P> {}

[Severity: High]
Does this implementation allow unsound transmutations for unconstrained typ=
es?
Because P is generic and lacks bounds, any type could be instantiated here,
including types with pointers, padding, or interior mutability. Should this
implementation require P: kernel::transmute::AsBytes to ensure the type
is actually safe to read as bytes?

[ ... ]

> +#[pin_data]
> +struct Svc {
> +    #[pin]
> +    svc_operation_id: SpinLock<IdPool>,
> +    // Pos 0 =3D INTF_ID_START
> +    #[pin]
> +    intf_map: Mutex<[Option<Arc<dyn InterfaceOps>>; INTF_MAP_LEN]>,
> +}

[ ... ]

> +    fn intf_by_id(&self, id: u8) -> Result<Arc<dyn InterfaceOps>> {
> +        let id =3D id - INTF_ID_START;

[Severity: Medium]
Can this subtraction underflow and cause a kernel panic?
If a malformed message or core bug routes a message to the AP interface
(where id is 0), id - INTF_ID_START will underflow since INTF_ID_START
is 1.

> +        let guard =3D self.intf_map.lock();
> +
> +        guard
> +            .get(usize::from(id))
> +            .ok_or(code::ENODEV)?
> +            .as_ref()
> +            .ok_or(code::ENODEV)
> +            .cloned()
> +    }

[ ... ]

> +#[vtable]
> +impl hd::HdDriver for GbHdDriver {
> +    fn message_send(
> +        data: &Self,
> +        dest_cport_id: u16,
> +        msg: &greybus::Message,
> +        gfp_mask: Flags,
> +    ) -> Result {
> +        if dest_cport_id =3D=3D protocols::GB_SVC_CPORT_ID {
> +            data.0.handler(msg)
> +        } else {
> +            let conn =3D msg.operation().connection();
> +            let intf =3D data.0.intf_by_id(conn.interface().unwrap().id(=
))?;

[Severity: High]
Can this lead to a scheduling-while-atomic oops?

The Greybus core can call message_send() from atomic contexts (which is why
it passes a gfp_mask). However, intf_by_id() acquires intf_map.lock(), which
is a sleepable Mutex. Should intf_map use a SpinLock instead to prevent
sleeping in atomic context?

> +
> +            let mut buf =3D KVec::with_capacity(msg.header().size().into=
(), gfp_mask)?;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-gb-uart-tr=
ansport-v2-0-a03bb1f5fbd1@beagleboard.org?part=3D5
