Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583840;
	b=ah2FZBpNqKwVcNQS4eJVVxVGPIKCpuJ5RGn4jUOWcA+rOxn6brPQ7gS023zRr+ybDCaI
	 eDV8Q9DC7mEpnITN7/6SLOsuchIg3Wsv1ZvBnTOfTVrwhW/P5g+R1Vupy0Y2utys4aBQz
	 Og7jvdHR0n6UllotzKtii9pjPwXxvWG5kE4wXmFfgBVrVuwxDD2bY9iAa8YBhM+6p85V2
	 FwbjaeqA4G0EpJ8Stw8TBjAUQXGXy+VP9aV9ovbGxzVH0GkHK6MigmddaWr1LRLCZArDB
	 +YxXH1ly/myjsMQXBHAwIjyq30b4eij1eUAqVPuXlmsUi6gce/An2K66Jg6cHp3vfOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583840;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SAuzxK5nMBzxkfONGE4e6gO716qaQkE80UKwzu9wOjg=;
	b=S4mBBr8aBaQCGIDrn1DPR+ffjloWa6HWuHmXtXSRmNz+jH/Qqs5CSWNt+nBrvqmoKCJn
	 pt2DYIRSm8sBrwchmnDBR80lFQhCOXn9RAUclCWABSwyLhIT5KK9InmG25B/Zs94VmH5z
	 I6LHI5C6qLKoLizMBaTTvjN7qV0xtNGKnlO70isJsSAbJ5J3uwjI96V4gNU+PvqCVhLJN
	 lhLGHwsMWveFDsrHQ/vPq5JYP1iNhtd/6elxUfN8lbHb+bXjZ81OsC7EWG5KYVoxXnNO0
	 r9nyDSDBqW1hRBULS51hFpXION3sA7U7omB+ZFE9a7P9bIDzb+xRSs9MVje68pDogYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJTQRZ8f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA69606A32C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJTQRZ8f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5911F000C7;
	Wed, 21 Oct 2026 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583839;
	bh=SAuzxK5nMBzxkfONGE4e6gO716qaQkE80UKwzu9wOjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NJTQRZ8fs7rX6KUaLhYMFpGrraididi4KGsGr9Xq6zPsAQvZknD4+PqQoZOFXYnyT
	 uI5RYsKQ0lscra4wR4GaRN/g4eceCTKMOUIy+ziN8/C03VtIpNgBTCS1V2yY25TNBz
	 CWWAFsexqZnaZ4qE5ppC6MlDmlVYaKTtJUHw7aVsvIRq/basIkWA0kFsH7d/bdZxsr
	 fP4LvT807kxx7OeLz14LjG741z2+oGZoNYdMGPCfvtNLsMObj1QJ0Yv9JdWVsDWtfp
	 V5y6l9pzFOOz8Ufvoyse174hiDVL/z/hw01btd9TmmptJ496kCk5cftfapxk+YHJJ8
	 Ytm1g0R3lNuTw==
Message-ID: <sashiko-outbox-180196@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] greybus: Add Rust UART node driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261021-gb-uart-transport-v4-6-c308ce821d45@beagleboard.org>
References: <20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org>
 <20261021-gb-uart-transport-v4-6-c308ce821d45@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 11:57:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] greybus: gb_uart_node: unsound as_bound() cast in GbNode::write() =
races unbind
- [High] greybus: gb_uart_node: unescaped TX buffer size in GbNode::write()
- [Medium] greybus: gb_uart_node: check for partial writes in GbNode::write=
()
- [Low] greybus: gb_uart_node: import style and stale comments in Makefile =
and commit
--

commit 7c4e3ad2ab622fa6f666582d5e991d3653169d06
Author: Ayush Singh <ayush@beagleboard.org>

greybus: Add Rust UART node driver

This commit adds a Rust serdev driver for Greybus nodes attached over a
serial port using Hdlc framing, registering the interface with the software
Greybus service (gb-softsvc).

> diff --git a/drivers/greybus/Makefile b/drivers/greybus/Makefile
> index 0fa802fdf6caf..bf4d08f728fe2 100644
> --- a/drivers/greybus/Makefile
> +++ b/drivers/greybus/Makefile
[ ... ]
> @@ -66,3 +72,7 @@ endif
>  # Output gb_softsvc's crate metadata for use by gb_uart_node at compile =
time.
>  RUSTFLAGS_gb_softsvc.o +=3D \
>  	--emit=3Dmetadata=3D$(objtree)/$(obj)/libgb_softsvc.rmeta
> +
> +# Allow nova-drm to import nova-core's types.
> +$(obj)/gb_uart_node.o: $(obj)/gb_softsvc.o
> +RUSTFLAGS_gb_uart_node.o :=3D -L $(objtree)/$(obj) --extern gb_softsvc

[Severity: Low]
This isn't a bug, but should this comment in drivers/greybus/Makefile refer
to gb-uart-node and gb-softsvc instead of nova-drm and nova-core?

> diff --git a/drivers/greybus/gb_uart_node.rs b/drivers/greybus/gb_uart_no=
de.rs
> new file mode 100644
> index 0000000000000..f3779737c75eb
> --- /dev/null
> +++ b/drivers/greybus/gb_uart_node.rs
> @@ -0,0 +1,257 @@
[ ... ]
> +use zerocopy::little_endian;
> +use zerocopy_derive::{FromBytes, Immutable, KnownLayout};

[Severity: Low]
Should this zerocopy_derive import in drivers/greybus/gb_uart_node.rs use t=
he
vertical import style from Documentation/rust/coding-guidelines.rst?

> +
> +/// Most greybus implementations will have a limit on greybus message le=
ngth. The theoretical limit
> +/// is [`u16::MAX`], but the real limits are much more modest. 256 seems=
 to be the limit I use on
> +/// most of my peers, but let's use 512 to be on safe side in kernel. Th=
e only real big request that
> +/// I frequently encounter is manifest_get. However, if camera protocol =
ends up being supported at
> +/// some point, this might need to be increased.
> +const HDLC_MAX_FRAME_LEN: usize =3D 512;
> +const HDLC_FRAME_HEADER_LEN: usize =3D
> +    2 * size_of_val(&HDLC_FRAME) + 2 * size_of::<u16>() + 2 * size_of::<=
u8>();
> +const HDLC_MAX_MSG_LEN: usize =3D HDLC_MAX_FRAME_LEN - HDLC_FRAME_HEADER=
_LEN;
> +
> +const HDLC_FRAME: u8 =3D 0x7E;
> +const HDLC_ESC: u8 =3D 0x7D;
> +const HDLC_XOR: u8 =3D 0x20;
[ ... ]
> +struct GbNode {
> +    sdev: ARef<serdev::Device>,
> +}
> +
> +impl GbNode {
> +    const fn new(sdev: ARef<serdev::Device>) -> Self {
> +        Self { sdev }
> +    }
> +
> +    fn fill_buf(mut crc: u16, data: &[u8], buf: &mut KVec<u8>) -> Result=
<u16> {
> +        for i in data {
> +            crc =3D crc_ccitt(crc, &[*i]);
> +            if *i =3D=3D HDLC_ESC || *i =3D=3D HDLC_FRAME {
> +                buf.push_within_capacity(HDLC_ESC)?;
> +                buf.push_within_capacity(i ^ HDLC_XOR)?;
> +            } else {
> +                buf.push_within_capacity(*i)?;
> +            }
> +        }
> +
> +        Ok(crc)
> +    }
> +}
> +
> +impl gb_softsvc::InterfaceOps for GbNode {
> +    fn write(&self, data: &[u8], cport: u16, gfp_mask: Flags) -> Result<=
()> {
> +        // SAFETY: `GbNode` only exists while its serdev driver is bound=
, so the device is in the
> +        // `Bound` state for the duration of this call.
> +        let bound: &serdev::Device<Bound> =3D
> +            unsafe { serdev::Device::from_device(self.sdev.as_ref().as_b=
ound()) };

[Severity: High]
Can GbNode::write() in drivers/greybus/gb_uart_node.rs outlive the bound
state of the serdev device and race with driver unbind?

In GbUartNode::init(), GbNode is wrapped in an Arc and registered with
gb_softsvc::Module::new(). When GbHdDriver::message_send() in
drivers/greybus/gb_softsvc.rs sends a message, Svc::intf_by_id() clones the
Arc<dyn InterfaceOps> and drops intf_map's spinlock before calling
intf.write():

drivers/greybus/gb_softsvc.rs:Svc::intf_by_id() {
        let id =3D id - INTF_ID_START;
        let guard =3D self.intf_map.lock();

        guard
            .get(usize::from(id))
            .ok_or(code::ENODEV)?
            .as_ref()
            .ok_or(code::ENODEV)
            .cloned()
}

If the serdev device is unbound concurrently (or if HdlcRx::new() fails in
GbUartNode::init() after gb_softsvc::Module::new() succeeds),
serdev::PrivateData::drop() in rust/kernel/serdev.rs drops GbUartNode ->
HdlcRx -> gb_softsvc::Module. Module::drop() -> Svc::module_remove() ->
Svc::map_remove() removes the entry from intf_map without waiting for cloned
Arc<GbNode> references to finish, and PrivateData::drop() immediately closes
the serdev device:

rust/kernel/serdev.rs:PrivateData::drop() {
            unsafe { (*self.driver.get()).assume_init_drop() };
            *active =3D false;
        }
        drop(active);

        // SAFETY: We have exclusive access to `self.open`.
        if unsafe { *self.open.get() } {
            // SAFETY: `self.sdev.as_raw()` is guaranteed to be a pointer t=
o a valid
            // `struct serdev_device`.
            unsafe { bindings::serdev_device_close(self.sdev.as_raw()) };
        }
}

Can an in-flight GbNode::write() then call bound.write_all(&buf, 0) (which
calls serdev_device_write() with an infinite timeout) concurrently with or
after serdev_device_close(), violating the Device::as_bound() safety
requirement and racing against ttyport_close() tearing down serport->tty?

> +
> +        // Drop messages which are bigger than what is supported.
> +        if data.len() > HDLC_MAX_MSG_LEN {
> +            return Err(code::E2BIG);
> +        }
> +
> +        let mut buf =3D KVec::with_capacity(HDLC_MAX_FRAME_LEN, gfp_mask=
)?;
> +
> +        let mut crc =3D 0xffff;
> +
> +        buf.push_within_capacity(HDLC_FRAME)?;
> +
> +        crc =3D Self::fill_buf(crc, &[ADDRESS_GREYBUS, 0x03], &mut buf)?;
> +        crc =3D Self::fill_buf(crc, &cport.to_le_bytes(), &mut buf)?;
> +        crc =3D Self::fill_buf(crc, data, &mut buf)?;
> +
> +        crc ^=3D 0xffff;
> +        Self::fill_buf(crc, &crc.to_le_bytes(), &mut buf)?;
> +
> +        buf.push_within_capacity(HDLC_FRAME)?;

[Severity: High]
Does GbNode::write() in drivers/greybus/gb_uart_node.rs fail when byte
stuffing expands a valid frame beyond 512 bytes?

HDLC_MAX_MSG_LEN is computed from HDLC_MAX_FRAME_LEN (512) minus the 8-byte
unescaped header/trailer overhead (504 bytes), and buf is allocated with
KVec::with_capacity(HDLC_MAX_FRAME_LEN, gfp_mask).

However, GbNode::fill_buf() escapes every 0x7d or 0x7e byte in cport, data,
and crc into two bytes using buf.push_within_capacity(), which does not
reallocate. Won't any valid message up to 504 bytes whose escaped length
exceeds 512 bytes fail in push_within_capacity()?

> +
> +        bound.write_all(&buf, 0)?;
> +
> +        Ok(())
> +    }
> +}

[Severity: Medium]
Can bound.write_all(&buf, 0) in GbNode::write() return a partial write count
without returning an error?

In drivers/tty/serdev/core.c, if serdev_device_write() writes part of the
buffer and is then interrupted while waiting for space, it returns the numb=
er
of bytes written so far:

drivers/tty/serdev/core.c:serdev_device_write() {
	if (timeout <=3D 0 && written =3D=3D 0) {
		if (timeout =3D=3D -ERESTARTSYS)
			return -ERESTARTSYS;
		else
			return -ETIMEDOUT;
	}

	return written;
}

serdev::Device::write_all() in rust/kernel/serdev.rs wraps that positive co=
unt
as Ok(written). Since GbNode::write() ignores the returned usize and returns
Ok(()), won't a partial write leave a truncated frame on the wire without t=
he
closing 0x7e flag while reporting to gb-softsvc that the message was sent?

> +
> +#[pin_data]
> +struct GbUartNode {
> +    #[pin]
> +    rx: SpinLock<HdlcRx>,
> +}
> +
> +impl GbUartNode {
> +    fn init(sdev: &serdev::Device<Core<'_>>) -> Result<HdlcRx> {
> +        if sdev
> +            .set_baudrate(
> +                sdev.as_ref()
> +                    .fwnode()
> +                    .and_then(|fwnode| fwnode.property_read(c"current-sp=
eed").optional())
> +                    .unwrap_or(115200),
> +            )
> +            .is_err()
> +        {
> +            return Err(EINVAL);
> +        }

[Severity: Low]
In GbUartNode::init() in drivers/greybus/gb_uart_node.rs, the driver reads
the "current-speed" property, whereas the commit description states that po=
rt
parameters are taken from "baudrate" if present. Should the commit message =
be
updated to say "current-speed"?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-gb-uart-tr=
ansport-v4-0-c308ce821d45@beagleboard.org?part=3D6
