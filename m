Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79813CB574
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818426; cv=none; b=e6JTDDBMmnjAfWARMTamwc0KvSAREYMO2u2wXfyVOpzieGsKKcJ9ublFJzf73fP6dlBUJunODOY+NOFS8BNgcTbsXS8jx9HNJAwEINxNUUbJVEE78T93d8sHGH0adeBWIhc1jinq9zUT3u1BQV7rWvw4KAcRWxGPlXjvVffGo1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818426; c=relaxed/simple;
	bh=nkIIQWBryudLs4D9pMiquDy9alQgIUc7r/yAAQefTrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jd9jdmYmKbSOa7sY8A4qCguromhHdhEgOvENWI9e/9+IDjWjubhUzqAmEjewoCMBHFR7AzXUVwpZhzjSDd8Ey9fWpYD6pC2+fojxJ15XenUak10Msqqyqae34RqQuIqswsT2KXf1t1aq3QzmV3ehQhLGJ852Nk8YNOnxC5jWKNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5mAY5w5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5mAY5w5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7931F000E9;
	Thu, 27 Aug 2026 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787818415;
	bh=yfi6Cw+GVIFf2aHxuRikoIMhgtrF941LbQS8J1Fdppw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h5mAY5w5HQFf1/aES0eZ6Dkbf6MFw17PerRHSxRdBrAv7SHhjT3BOkZZau/Xm0Uu9
	 L1fhhOErF0yqBIdXQQsj6zAVYp58KrYkrpfLb4OxD2EX+WgV+Soo7oEySdrqZOzWTA
	 UmSiBO21jRBEqwo3AAScnqqUm9RrpY5nekmf29WKi33NkHzfczj7fPpSmPBjEjVxzY
	 U2lBYb2VPo6q4DZ6yMKJO0/tZBkrZB6ozzo1xkeJUEcuEgbacqu9BB6PdeP9qnWiiS
	 SmOph62/snMdHWrkrB7Kvs7h3Vr28TO8JCmJTmSYHORNq38jd4QSPNTW58xiWa95VV
	 sTOb5hfnq8Gfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] greybus: Add Rust UART node driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260827-gb-uart-transport-v2-7-a03bb1f5fbd1@beagleboard.org>
References: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
 <20260827-gb-uart-transport-v2-7-a03bb1f5fbd1@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 08:13:34 +0000
Message-Id: <20260827081335.6B7931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Strict 256-byte capacity limitation in HDLC buffers will drop vali=
d Greybus messages.
- [High] Incorrect RX buffer overflow handling treats the tail of oversized=
 frames as new messages.
- [High] Dropping `gb_softsvc::Module` while holding a spinlock causes slee=
ping in atomic context (deadlock/panic).
- [High] `GbNode::write` unsafely assumes the serdev device is bound and ra=
ces with driver `unbind`, leading to Use-After-Free.
- [High] Concurrent calls to `GbNode::write` lack serialization, corrupting=
 the HDLC protocol stream.
- [Medium] Unbounded log spam in the UART RX path when receiving overlong f=
rames or invalid CRCs.
- [Low] The config `GREYBUS_UART_NODE` depends on a non-existent config sym=
bol, making it impossible to enable the driver.
- [Low] Import formatting violates the vertical import style guideline.
- [Low] Makefile comments contain copy-paste errors referencing the wrong s=
ubsystem (`nova-core`).
--

commit 3bb7b1d9bc5abe108b82d7471de8f5bbfb1088d6
Author: Ayush Singh <ayush@beagleboard.org>

greybus: Add Rust UART node driver
   =20
Add a driver for Greybus nodes attached over a plain serial port. The
node is registered with the software SVC (gb-softsvc), which handles the
SVC protocol on behalf of the AP, so no dedicated coprocessor running
SVC firmware is needed.

Link: https://lore.kernel.org/all/20260622-nova-exports-v5-0-6191773fc977@n=
vidia.com/

> diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
> index 381d1a6ee135c..34de913af287e 100644
> --- a/drivers/greybus/Kconfig
> +++ b/drivers/greybus/Kconfig
> @@ -60,5 +60,20 @@ config GREYBUS_SOFTSVC
>  	  To compile this code as a module, choose M here: the module
>  	  will be called gb-softsvc.ko
> =20
> +config GREYBUS_UART_NODE
> +	tristate "Greybus UART node transport"
> +	depends on RUST
> +	depends on GREYBUS_SOFTSVC
> +	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS

[Severity: Low]
Is RUST_SERIAL_DEV_BUS_ABSTRACTIONS defined anywhere in the kernel tree?

It appears this config symbol does not exist, which causes an unmet depende=
ncy
that will silently break the build configuration and prevent this driver fr=
om
being compiled.

[ ... ]
> diff --git a/drivers/greybus/Makefile b/drivers/greybus/Makefile
> index e6f5941288027..81151963c01ea 100644
> --- a/drivers/greybus/Makefile
> +++ b/drivers/greybus/Makefile
[ ... ]
> +# Output nova-core's crate metadata for use by nova-drm at compile time.
> +RUSTFLAGS_gb_softsvc.o +=3D \
> +	--emit=3Dmetadata=3D$(objtree)/$(obj)/libgb_softsvc.rmeta
> +
> +# Allow nova-drm to import nova-core's types.

[Severity: Low]
This isn't a bug, but should these comments be updated to reflect the Greyb=
us
subsystem instead of nova-core and nova-drm?

> +$(obj)/gb_uart_node.o: $(obj)/gb_softsvc.o
> +RUSTFLAGS_gb_uart_node.o :=3D -L $(objtree)/$(obj) --extern gb_softsvc
> diff --git a/drivers/greybus/gb_uart_node.rs b/drivers/greybus/gb_uart_no=
de.rs
> new file mode 100644
> index 0000000000000..3eb4f8ab36554
> --- /dev/null
> +++ b/drivers/greybus/gb_uart_node.rs
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Greybus UART Node driver
> +
> +use kernel::{
> +    alloc::Flags,
> +    crc_ccitt::crc_ccitt,
> +    device::{
> +        AsBusDevice,
> +        Bound,
> +        Core, //
> +    },
> +    error::code,
> +    new_spinlock, of,

[Severity: Low]
This isn't a bug, but does this formatting follow the kernel vertical import
style guideline? Putting new_spinlock and of on the same line violates the
one-item-per-line rule.

> +    prelude::*,
> +    serdev,
> +    sync::{
> +        aref::ARef,
> +        Arc,
> +        SpinLock, //
> +    },
> +};
> +
> +use zerocopy::little_endian;
> +use zerocopy_derive::{FromBytes, Immutable, KnownLayout};
> +
> +const HDLC_MAX_FRAME_LEN: usize =3D 256;

[Severity: High]
Does a strict 256-byte capacity limitation in HDLC buffers drop valid Greyb=
us
messages?

Greybus protocol supports dynamic payload sizes that can easily exceed 256
bytes. Furthermore, HDLC byte escaping (fill_buf) can double the size of the
payload on the wire.

Any message exceeding 256 bytes (after escaping) will cause
push_within_capacity() to fail, resulting in valid messages being dropped.

> +
> +const HDLC_FRAME: u8 =3D 0x7E;
[ ... ]
> +impl HdlcRx {
> +    fn new(sdev: ARef<serdev::Device>, node: gb_softsvc::Module) -> Resu=
lt<Self> {
> +        Ok(Self {
> +            node,
> +            sdev,
> +            rx_buf: KVec::with_capacity(HDLC_MAX_FRAME_LEN, GFP_KERNEL)?,
> +            rx_in_esc: false,
> +        })
> +    }
> +
> +    fn frame_finish(&self) -> Result<()> {
> +        if self.rx_buf.len() < 4 {
> +            return Err(code::EFAULT);
> +        }
> +
> +        let crc =3D crc_ccitt(0xffff, &self.rx_buf);
> +        if crc !=3D HDLC_EXPECTED_CRC {
> +            dev_warn!(self.sdev.as_ref(), "CRC failed {}", crc);

[Severity: Medium]
Could this dev_warn!() be used to flood the kernel log?

If an attacker or a noisy line continuously sends invalid frames at high ba=
ud
rates, it would cause a Denial of Service. Should this be
dev_warn_ratelimited!()?

> +            return Ok(());
> +        }
[ ... ]
> +    fn rx(&mut self, data: &[u8]) -> usize {
> +        for i in data.iter() {
> +            match *i {
> +                HDLC_FRAME =3D> {
> +                    if !self.rx_buf.is_empty() {
> +                        if let Err(e) =3D self.frame_finish() {
> +                            dev_warn!(self.sdev.as_ref(), "bad frame: {e=
:?}\n");
> +                        }
> +                    }
> +
> +                    self.rx_buf.clear();
> +                    self.rx_in_esc =3D false;
> +                }
> +                HDLC_ESC =3D> self.rx_in_esc =3D true,
> +                _ =3D> {
> +                    let c =3D if self.rx_in_esc { *i ^ HDLC_XOR } else {=
 *i };
> +                    self.rx_in_esc =3D false;
> +
> +                    if self.rx_buf.push_within_capacity(c).is_err() {
> +                        dev_warn!(self.sdev.as_ref(), "buffer overflow. =
Dropping frame");
> +
> +                        self.rx_buf.clear();
> +                        self.rx_in_esc =3D false;

[Severity: High]
Does clearing the buffer here correctly discard the rest of the overgrown f=
rame?

The loop continues processing the remaining bytes of the exact same oversiz=
ed
frame, erroneously pushing them into the newly empty buffer.

When the HDLC_FRAME delimiter arrives to mark the end of the oversized mess=
age,
frame_finish() is incorrectly called on this trailing garbage, which could =
lead
to corrupted data being processed if the CRC randomly matches.

Additionally, could this dev_warn!() cause an unbounded log spam?=20
dev_warn_ratelimited!() is generally preferred when reading from noisy line=
s.

> +                    }
> +                }
> +            }
> +        }
> +
> +        data.len()
> +    }
> +}
[ ... ]
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
Does this unsafely assume the serdev device is bound and race with driver u=
nbind?

GbNode::write can be invoked asynchronously by the Greybus core. When the
device is removed, GbUartNode::unbind drops the subsystem state but does not
synchronize with concurrently executing write calls.

This casts the serdev device to Bound without taking any locks that would
serialize it against unbind. If write is preempted and executes concurrently
with or finishes after unbind returns, it will call bound.write_all on an
unbound or freed serdev device, leading to a Use-After-Free.

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
> +
> +        bound.write_all(&buf, 0)?;

[Severity: High]
Is it possible for concurrent calls to GbNode::write to interleave bytes he=
re?

The Greybus subsystem can submit messages concurrently from multiple connec=
tions
or cports, leading to parallel calls to GbNode::write.

Because there is no SpinLock or Mutex in GbNode to serialize these writes,
concurrent executions of write_all will interleave bytes from different fra=
mes
at the serdev layer, completely destroying the HDLC protocol stream and
resulting in unparsable messages at the receiver.

> +
> +        Ok(())
> +    }
> +}
[ ... ]
> +    fn unbind<'bound>(_: &'bound serdev::Device<Core<'_>>, this: Pin<&Se=
lf::Data<'bound>>) {
> +        // Getting a bound device is not possible after this point. So d=
rop HdlcRx.
> +        let _ =3D this.rx.lock().take();

[Severity: High]
Does dropping this.rx.lock().take() directly cause a panic due to sleeping =
in atomic context?

In Rust, 'let _ =3D expr;' evaluates expr as a temporary, which drops at th=
e end
of the statement in reverse order of creation. So the Option<HdlcRx> (creat=
ed
second by take()) drops before the SpinLockGuard (created first by lock()).

Dropping HdlcRx drops gb_softsvc::Module, which deregisters the Greybus host
device. This operation sleeps and acquires mutexes. Doing this while the
spinlock is held will trigger a "scheduling while atomic" BUG or deadlock.

> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-gb-uart-tr=
ansport-v2-0-a03bb1f5fbd1@beagleboard.org?part=3D7
