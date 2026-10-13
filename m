Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199915038E6
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898377; cv=none; b=fySQTYtCGw5UB32z8Hxn24WosxRpehG4x+VoEUk3kE2mjgUgS6VQc07umeV7pECjJJRLc65mtMB4xhkBpiPWJQGFHS2iqV/XDZtHXHQZRt8tiNCKvqL8FpqXTqffioLf7AV+VbaKD8txO3kRgdMBMb17/1d3R1c1FJ3xgaqIgos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898377; c=relaxed/simple;
	bh=gjALEt35CI0MbKrSEdcvoDMlawVfX84fnI1h282cLEE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KJXLDBCGobL0VqyfN1fQ9N2vRzk4hGw9sP7NmJh39MF0t9cghspTI4pklYaPx2X0QpX+Sc51+ubDmLHP+3NniJjrLaT5ZFHe204N4iaJgP7yZy5vkcZhIA5Q5dpezZRxwYaVcEIMTQu1xxqaeqLZw2PnIV4FY3k1t6S8Vb2OJZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l94NxA1k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l94NxA1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626AD1F000FF;
	Tue, 13 Oct 2026 13:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898375;
	bh=J2wdwm9/NLoUYcDu1mQQpCRYzDeQ/VqG34+SbdqGvS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l94NxA1k3y6Q5E9O31DCMbxeJ7F6iUSrU5uciT2NnHkN6DUVIV2mFLzvBtL3QxQ1v
	 Al+wC6C1ISH9g4DjZ0g31POnh2dyFzgeTViuXWpwlLKxtujVewxbahfB06HO9qTFfE
	 nfrp6mTA+wUVhTKLibf4+kgxMqxIBHs7VikJMHDUM1VS9wI/9wuybQ/w5Ni9PX4yY8
	 LrIGqqiufdN9ZrMuUye/tv/rKg4u/p3y2sCOxiHUo75GXGXD8PLtWLviyclJoeYOei
	 6XInPjPTMrub+o4ApNKwgHc4guTby1JNjLbjQJqfhhJNSOrReoTKn79vaBoXvIoX5P
	 yR7R8/fpLvvag==
Message-ID: <sashiko-outbox-169822@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] greybus: Add Rust UART node driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261013-gb-uart-transport-v3-7-81d0a8a1acf7@beagleboard.org>
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
 <20261013-gb-uart-transport-v3-7-81d0a8a1acf7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:32:54 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] greybus: UAF in GbNode::write due to concurrent serdev unbind
- [High] gb_uart_node: hardcoded 256-byte HDLC limit drops Greybus messages
--

commit 3275429a0af2d87e184830cd9fec54db8ff56af7
Author: Ayush Singh <ayush@beagleboard.org>

    greybus: Add Rust UART node driver
   =20
    Add a driver for Greybus nodes attached over a plain serial port. The
    node is registered with the software SVC (gb-softsvc), which handles the
    SVC protocol on behalf of the AP, so no dedicated coprocessor running
    SVC firmware is needed.

    [0]: https://lore.kernel.org/all/20260622-nova-exports-v5-0-6191773fc97=
7@nvidia.com/

> diff --git a/drivers/greybus/gb_uart_node.rs b/drivers/greybus/gb_uart_no=
de.rs
> new file mode 100644
> index 0000000000000..f719ee35e8f38
> --- /dev/null
> +++ b/drivers/greybus/gb_uart_node.rs
> @@ -0,0 +1,253 @@

[ ... ]
> +struct HdlcRx {
> +    rx_buf: KVec<u8>,
> +    rx_in_esc: bool,
> +    rx_overflow: bool,
> +    sdev: ARef<serdev::Device>,
> +    node: gb_softsvc::Module,
> +}
> +
> +impl HdlcRx {
> +    fn new(sdev: ARef<serdev::Device>, node: gb_softsvc::Module) -> Resu=
lt<Self> {
> +        Ok(Self {
> +            node,
> +            sdev,
> +            rx_buf: KVec::with_capacity(HDLC_MAX_FRAME_LEN, GFP_KERNEL)?,

[Severity: High]
Does limiting the HDLC buffer to 256 bytes cause Greybus messages to be
dropped?

Looking at HdlcRx::rx(), if the buffer exceeds HDLC_MAX_FRAME_LEN, it clears
the buffer and drops the frame. Greybus payloads (plus headers and CRC) can
easily exceed 256 bytes, especially after HDLC byte escaping which can
increase the size of the payload.

> +            rx_in_esc: false,
> +            rx_overflow: false,
> +        })
> +    }

[ ... ]
> +    fn rx(&mut self, data: &[u8]) -> usize {
> +        for i in data.iter() {
> +            match *i {

[ ... ]
> +                _ =3D> {
> +                    let c =3D if self.rx_in_esc { *i ^ HDLC_XOR } else {=
 *i };
> +                    self.rx_in_esc =3D false;
> +
> +                    if self.rx_buf.push_within_capacity(c).is_err() {
> +                        dev_warn!(self.sdev.as_ref(), "buffer overflow. =
Dropping frame");
> +
> +                        self.rx_overflow =3D true;
> +                        self.rx_buf.clear();
> +                    }
> +                }
> +            }
> +        }

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
Is it possible for GbNode::write() to race with GbUartNode::unbind() and
cause a use-after-free?

Looking at GbUartNode::unbind(), it drops HdlcRx and its gb_softsvc::Module.
However, if another thread is currently holding an Arc<GbNode> (for example,
in GbHdDriver::message_send() via intf_by_id()) and is preempted before
calling intf.write():

Thread 1                                Thread 2
GbHdDriver::message_send()
  intf =3D intf_by_id(...)
  // Preempted
                                        GbUartNode::unbind()
                                          this.rx.lock().take()
                                          // Device is no longer Bound

  intf.write()

When the preempted thread resumes and calls GbNode::write(), it will execute
the unsafe cast to serdev::Device<Bound>. At this point, the device might no
longer be in the Bound state, leading to undefined behavior or a
use-after-free.=20

Does GbUartNode::unbind() need to synchronize and wait for all active
Arc<GbNode> references to be dropped before returning?

> +
> +        let mut buf =3D KVec::with_capacity(HDLC_MAX_FRAME_LEN, gfp_mask=
)?;

[Severity: High]
Can this fixed-capacity allocation fail for valid Greybus messages?=20

Since HDLC escaping can potentially double the size of the payload, should
this dynamically allocate the TX buffer based on the actual size of the data
to accommodate the worst-case HDLC escaped size?

> +
> +        let mut crc =3D 0xffff;

[ ... ]
> +    fn unbind<'bound>(_: &'bound serdev::Device<Core<'_>>, this: Pin<&Se=
lf::Data<'bound>>) {
> +        // Getting a bound device is not possible after this point. So d=
rop HdlcRx.
> +        // This also drops HdlcRx::node, which should ensure that GbNode=
::write will not be called
> +        // after this point.
> +        let _ =3D this.rx.lock().take();
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gb-uart-tr=
ansport-v3-0-81d0a8a1acf7@beagleboard.org?part=3D7
