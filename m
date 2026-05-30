Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7C32DA775
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780182969; cv=none; b=cTZovOkW7nBNr/+Z8vlzrDq1Cz5Xsdyp9n1FkRIELyAQAMyYL+0uA549FRGZSn3yicSDQzyqJx2D9MSlGKpz+1oo15Xj0hs2vrdW0vBCnO7g//CrT6gGihcYZ+ofcDL3QaxEzT6SRi08g01HDGZ37q7aNOrYuO8QaFYLGNc+FEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780182969; c=relaxed/simple;
	bh=/VwIiDoyRsLv/0hx4Xfd63DxDvlaCLxPcv+LPOGF9VI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BH5A0lM++rQlql5Z8jRcXv+V78LghV1Tc5abI6S2iwh+2qmOO1fRiBuLY5jpJSfzI6uRdxCL+NYu5GXETn9O5tKQM4eZUGs2xK9RTCwtGsCUrgfBn9MtkuwOaStzbCgqgfZfNhXSPU1mg/p2PrkdiQqX2katCvRV2KW0hp6ptkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWgHY24Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWgHY24Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A0E1F00893;
	Sat, 30 May 2026 23:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780182968;
	bh=J47J06LpU6hOLVDeoOX3Di4h24EF6iAPS0KVyB822iI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TWgHY24Z9j8JeJPpWaaXXO6s/xdWzJmcp/wJAfsOEsOqONF+2HiIbXn8NxT3CNXmr
	 APw/JCv+32R9s07Ok/t6hpKqMxyklLAQQu4rGHlr0OkNEAEWYcoVfwl4cQZ8oyK08C
	 8x09jo1BWXLXXF1MfiIXTzV14dSPcgBRurqUBe3L/DjltDFKG/CUd68X778Kfqbfpa
	 Vs7w51tXweMMueKoM1nFdzVTKqlKiVKwJHVaf5wvSII9wjDLDSQh7ewUyYwGugIb9z
	 97IUrqaf7Ms8ZNb5pAEUUIzu6bnrNkkUEKhLY7Ao1FtakSjIpcqPhJqtrrfc7SwCPk
	 QKNu2T8j0NCKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/2] platform: Add initial synology microp driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst via B4 Relay" <devnull+markus.probst.posteo.de@kernel.org>
Cc: ojeda@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260531-synology_microp_initial-v14-2-1377d425b24b@posteo.de>
References: <20260531-synology_microp_initial-v14-2-1377d425b24b@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 23:16:07 +0000
Message-Id: <20260530231607.C6A0E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Use-after-free of dynamically allocated LED device names.
- [High] Concurrent operations across different LEDs can interleave multi-b=
yte commands over the shared serial bus.
- [Medium] Setting a non-zero brightness fails to clear the hardware blink =
state.
- [Medium] StatusLedHandler::blink_set fails to update its internal blink s=
tate when stopping a blink while subled intensity is 0.
- [Low] Dependency on a non-existent Kconfig symbol 'RUST_SERIAL_DEV_BUS_AB=
STRACTIONS'.
--

commit 667b721a5d920b45bcf6f6fe67ef8c56b057c3be
Author: Markus Probst <markus.probst@posteo.de>

platform: Add initial synology microp driver

Add a initial synology microp driver, written in Rust.
The driver targets a microcontroller found in Synology NAS devices. It
currently only supports controlling of the power led, status led, alert
led and usb led.

> diff --git a/drivers/platform/synology_microp/Kconfig b/drivers/platform/=
synology_microp/Kconfig
> new file mode 100644
> index 0000000000000..8878cfb7bcddb
> --- /dev/null
> +++ b/drivers/platform/synology_microp/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config SYNOLOGY_MICROP
> +	tristate "Synology Microp driver"
> +	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
> +	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS

[Severity: Low]
Does the dependency RUST_SERIAL_DEV_BUS_ABSTRACTIONS exist?

Searching the tree doesn't show this symbol, which might cause silent build
failures or make the driver unselectable.

[ ... ]
> diff --git a/drivers/platform/synology_microp/command.rs b/drivers/platfo=
rm/synology_microp/command.rs
[ ... ]
> +impl Command {
> +    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result {
> +        dev.write_all(
> +            match self {

[Severity: High]
Can concurrent LED operations interleave multi-byte commands over the shared
serial bus?

Since LedHandler and StatusLedHandler can be invoked concurrently via sysfs,
they lock their own local blink mutex but do not lock a shared driver-level
mutex before calling Command::write().

Since dev.write_all() and dev.wait_until_sent() are called concurrently
without mutual exclusion for multi-byte sequences (for example, the 3-byte
sequence for AlertLed), the bytes could interleave.

Could this send corrupted command streams to the hardware?

[ ... ]
> diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform/s=
ynology_microp/led.rs
[ ... ]
> +#[pin_data]
> +pub(crate) struct Data<'bound> {
> +    #[pin]
> +    status: led::MultiColorDevice<'bound, StatusLedHandler>,
> +    power_name: CString,
> +    #[pin]
> +    power: led::Device<'bound, LedHandler>,

[Severity: Critical]
Does declaring power_name before power lead to a use-after-free during
device unbind?

Rust drops struct fields strictly in declaration order. If power_name is
dropped before power, the underlying C struct led_classdev (which only
stores the raw string pointer) might be left with a dangling pointer before
the LED device is finally unregistered.

[ ... ]
> +                alert: {
> +                    if let Some(color) =3D model.led_alert {
> +                        let name =3D CString::try_from_fmt(fmt!(
> +                            "synology:{}:alarm",
> +                            color.as_c_str().to_str()?
> +                        ))?;
> +                        Some(KBox::pin_init(
> +                            led::DeviceBuilder::new().color(color).name(=
&name).build(

[Severity: Critical]
Is the name variable dropped at the end of this block, resulting in a
dangling pointer?

The C struct led_classdev does not copy the string assigned to its name
field, it merely stores the raw pointer.

Once this block ends, the local CString goes out of scope, which leaves a
dangling pointer in the LED device for its entire lifetime. This could cause
memory corruption when the device name is accessed via sysfs.

[ ... ]
> +    fn brightness_set<'bound>(
> +        &self,
> +        dev: &'bound Self::Bus,
> +        _classdev: &led::Device<'bound, Self>,
> +        brightness: u32,
> +    ) -> Result<()> {
> +        let mut blink =3D self.blink.lock();
> +        (self.command)(if brightness =3D=3D 0 {
> +            *blink =3D false;
> +            State::Off
> +        } else if *blink {
> +            State::Blink
> +        } else {

[Severity: Medium]
Should setting a non-zero brightness clear the active hardware blink state?

According to the LED subsystem semantics, setting a non-zero brightness
should clear any active hardware blinking and set the LED to solid on.

Here, if the internal blink state is true, the driver commands State::Blink
instead of solid on, and leaves the internal blink variable as true. This
prevents userspace from stopping a blink by simply setting the brightness.

[ ... ]
> +        Command::StatusLed(
> +            color,
> +            if subled_brightness =3D=3D 0 {
> +                State::Off
> +            } else if *blink {
> +                State::Blink
> +            } else {

[Severity: Medium]
Similarly, for the multicolor status LED, should a non-zero subled
brightness clear the active hardware blink state instead of continuing
to command State::Blink?

[ ... ]
> +    fn blink_set<'bound>(
> +        &self,
> +        dev: &'bound Self::Bus,
> +        classdev: &led::MultiColorDevice<'bound, Self>,
> +        delay_on: &mut usize,
> +        delay_off: &mut usize,
> +    ) -> Result<()> {
> +        let mut blink =3D self.blink.lock();
> +        *blink =3D true;
> +
> +        let (color, subled_intensity) =3D if classdev.subleds()[1].inten=
sity =3D=3D 0 {
> +            (StatusLedColor::Green, classdev.subleds()[0].intensity)
> +        } else {
> +            (StatusLedColor::Amber, classdev.subleds()[1].intensity)
> +        };
> +        Command::StatusLed(
> +            color,
> +            if *delay_on =3D=3D 0 && *delay_off !=3D 0 {
> +                *blink =3D false;
> +                State::Off
> +            } else if subled_intensity =3D=3D 0 {
> +                State::Off
> +            } else if *delay_on !=3D 0 && *delay_off =3D=3D 0 {

[Severity: Medium]
If a user attempts to stop blinking but the subled intensity is 0, does the
internal blink state diverge from the requested state?

The blink state is unconditionally set to true at the beginning of the
function. If the subled_intensity =3D=3D 0 branch is taken, it commands
State::Off but fails to set blink to false.

Later, if the subled intensity increases, brightness_set will see that blink
is still true and erroneously command the LED to blink instead of staying
solidly on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-synology_m=
icrop_initial-v14-0-1377d425b24b@posteo.de?part=3D2
