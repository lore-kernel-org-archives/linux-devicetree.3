Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DAD17DFFA
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218736; cv=none; b=q1tNqODKy9Zmd39Fy3HzZdgZ8XLOwnELD0HBcMRGfycpyFrXJstv+yK1rWMfUf5CAaMIAAXQivjXbiZvUXWUueWOjzIAMQoyRzDZBAIH2frjdiWRFTaWqUAIRFuS0Ufw7+4igq4r91Ny4fzPVFi59TZMsv5SGU2jRaZ4TRtm4wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218736; c=relaxed/simple;
	bh=gbD5wd7Op0aspgd8wgKkvdIYdbWJlefuooWFJaQiSlU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q797eUFzec0P5NAGdJbeQf1lfY2Pn04KGPNsPrauVjndw3nPb8AXjdvfrien61xtccjfGhdZk8i9HtBuDPsnq1T7ljHpS/ckFHa8mjNRfm4AWMBtVivwglvLoSGDUbGnyKUskxDIeZcmKcis8LRlhI4sG/wZc2c+InqtYjemBHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFr1vbmj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFr1vbmj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F201F000E9;
	Thu, 20 Aug 2026 09:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787218731;
	bh=AzZBt0h/MYFiUsr0SjOrohWFL/UTVeVmsaDTO2auYrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MFr1vbmjz2HcQSctaLvkYraTvLtJ/ZtRhbY5FQidtArr1Qvqiv0OwTpy3o+M6bz2C
	 E72uOvFqa2sVJZ6SPN1I0ajRcJJhHYi1HZrXFVaJb8yWnnF+Dw0+GOCu8F2JIc54DG
	 7qnDbC71CDWjlIoFkUhvLYXO27K5R5x4j46GXgmGaaiAG0bmBwnehlXqojgYqJsryY
	 7yXhVnSiTfqBmWi60CM4n2co1digkc08J1bT+raOpkX6651GasSlBQ3RHmxIoodIGo
	 ptFA4FUa9e3oEYYUGabViD4eIqL41LV6Jp5ug38dcMNFHMjzYOv13+TM7zV1ON8Fp0
	 2UEHpnw9c3KkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] greybus: Add Rust UART node driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: ojeda@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820-gb-uart-transport-v1-6-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-6-282da14ab7b7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:38:50 +0000
Message-Id: <20260820093850.C3F201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Incorrect extraction of payload leaves part of the CRC in the mess=
age due to an off-by-one calculation.
- [High] The transmit CRC is incorrectly computed over the HDLC-escaped byt=
e stream instead of the raw payload.
- [High] Unbounded memory allocation in the serial receive path allows an a=
ttacker to exhaust kernel memory.
- [High] Allocating memory with `GFP_KERNEL` while holding a spinlock cause=
s a 'scheduling while atomic' kernel panic.
- [High] GbNode is registered with the Greybus core in `probe` before the s=
erdev device is fully initialized, allowing premature and unsafe calls to `=
write`.
- [High] `GbNode::write` performs multiple non-atomic `write_all` operation=
s to the UART without serialization, risking interleaved frames if called c=
oncurrently.
- [Medium] Returning early upon a buffer push failure clears the HDLC escap=
e state prematurely, causing an infinite receive stall.
- [Low] Rust imports do not follow the kernel vertical import style.
--

--- Patch [6]: [PATCH 6/7] greybus: Add Rust UART node driver ---
commit 763ce224c179bf0f26e68cd794db14b2b9027390
Author: Ayush Singh <ayush@beagleboard.org>

greybus: Add Rust UART node driver

This commit adds a driver for Greybus nodes attached over a plain serial
port. The node is registered with the software SVC (gb-softsvc), which
handles the SVC protocol on behalf of the AP. Greybus messages are carried
over HDLC framing on the wire.

[ ... ]

> diff --git a/drivers/greybus/gb_uart_node.rs b/drivers/greybus/gb_uart_no=
de.rs
> new file mode 100644
> index 0000000000000..1258122467585
> --- /dev/null
> +++ b/drivers/greybus/gb_uart_node.rs
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Greybus UART Node driver
> +
> +use kernel::crc_ccitt::crc_ccitt;
> +use kernel::device::AsBusDevice;
> +use kernel::device::{Bound, Core};
> +use kernel::error::code;
> +use kernel::sync::aref::ARef;
> +use kernel::sync::{Arc, SpinLock};
> +use kernel::{new_spinlock, of, prelude::*, serdev};

[Severity: Low]
Do these imports violate the kernel's vertical import guidelines for Rust
code?

[ ... ]

> +    fn frame_finish(&self) -> Result<()> {
> +        if self.rx_buf.len() < 4 {
> +            return Err(code::EFAULT);
> +        }
> +
> +        let crc =3D crc_ccitt(0xffff, &self.rx_buf);
> +        if crc !=3D HDLC_EXPECTED_CRC {
> +            dev_warn!(self.sdev.as_ref(), "CRC failed {}", crc);
> +            return Ok(());
> +        }
> +
> +        let addr =3D self.rx_buf[0];
> +        let _ctrl =3D self.rx_buf[1];
> +        let payload =3D &self.rx_buf[2..self.rx_buf.len() - size_of::<u8=
>()];

[Severity: High]
Does this slice operation incorrectly leave 1 byte of the 2-byte CRC append=
ed
to the payload? The CRC is 16-bit, so it appears subtracting size_of::<u8>()
would retain part of the CRC in the message.

[ ... ]

> +    fn rx(&mut self, data: &[u8]) -> usize {
> +        for (count, i) in data.iter().enumerate() {
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
> +                    if self.rx_buf.push(c, GFP_KERNEL).is_err() {

[Severity: High]
Is there a bounds or MTU capacity check missing here? It looks like a
malfunctioning or malicious device on the serial port streaming endless
non-framing bytes could cause the vector to grow infinitely until kernel
memory is exhausted.

[Severity: Medium]
If the buffer push fails and we return early, does this clear the HDLC
escape state prematurely?

The escape state is mutated right before the error check:
    self.rx_in_esc =3D false;
    if self.rx_buf.push(c, GFP_KERNEL).is_err() {

When the serdev core retries passing the failed byte, the escape state
would already be lost, potentially causing an infinite receive stall.

[Severity: High]
Is it safe to use GFP_KERNEL here?

GbUartNode::receive() acquires a spinlock using this.rx.try_lock(), which
disables preemption. It then calls guard.rx(data), which invokes this
buffer push allocation.

Will allocating memory with GFP_KERNEL while holding a spinlock cause a
scheduling while atomic kernel panic?

> +                        return count;
> +                    }
> +                }
> +            }
> +        }

[ ... ]

> +    fn write_all(mut crc: u16, bound: &serdev::Device<Bound>, data: &[u8=
]) -> Result<u16> {
> +        for i in data {
> +            if *i =3D=3D HDLC_ESC || *i =3D=3D HDLC_FRAME {
> +                let buf =3D &[HDLC_ESC, i ^ HDLC_XOR];
> +                bound.write_all(buf, 0)?;
> +                crc =3D crc_ccitt(crc, buf);

[Severity: High]
Is the transmit CRC incorrectly computed over the HDLC-escaped byte stream
instead of the raw payload?

GbNode::write_all() computes the CRC using crc_ccitt() on the escaped byte
sequence rather than the original raw byte. Could this result in an invalid
CRC that gets rejected by standard receivers?

[ ... ]

> +impl gb_softsvc::InterfaceOps for GbNode {
> +    fn write(&self, data: &[u8], cport: u16) -> Result<()> {
> +        // SAFETY: `GbNode` only exists while its serdev driver is bound=
, so the device is in the
> +        // `Bound` state for the duration of this call.
> +        let bound: &serdev::Device<Bound> =3D
> +            unsafe { serdev::Device::from_device(self.sdev.as_ref().as_b=
ound()) };

[Severity: High]
Could this unsafe block invalidly assume the serdev device is fully bound
before probe completes?

GbUartNode::probe() calls Self::init(), which registers the module with
gb_softsvc. If a write callback is invoked synchronously or asynchronously
before probe finishes, this assumption might be violated.

> +
> +        let mut crc =3D 0xffff;
> +
> +        bound.write_all(&[HDLC_FRAME], 0)?;
> +
> +        crc =3D Self::write_all(crc, bound, &[ADDRESS_GREYBUS, 0x03])?;
> +        crc =3D Self::write_all(crc, bound, &cport.to_le_bytes())?;
> +        crc =3D Self::write_all(crc, bound, data)?;

[Severity: High]
Does GbNode::write() perform multiple non-atomic write_all operations to the
UART without serialization?

Since the Greybus core can send messages concurrently from different threads
for different CPorts, could interleaving these writes result in corrupted
HDLC framing and dropped packets on the wire?

[ ... ]

> +    fn probe<'bound>(
> +        sdev: &'bound serdev::Device<Core<'_>>,
> +        _info: Option<&'bound Self::IdInfo>,
> +    ) -> impl PinInit<Self, Error> + 'bound {
> +        dev_dbg!(sdev.as_ref(), "Probe gb_uart_node.\n");
> +        let rx =3D Self::init(sdev);

[Severity: High]
Is GbNode prematurely registered with the Greybus core here?

Calling Self::init() registers the module before the serdev device is
fully initialized, allowing premature and unsafe calls to GbNode::write().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-gb-uart-tr=
ansport-v1-0-282da14ab7b7@beagleboard.org?part=3D6
