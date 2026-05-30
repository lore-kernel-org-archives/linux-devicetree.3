Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA82288D0
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110601; cv=none; b=QVEs3LxM+0k7QceJ6yPKJDE7YJdgpeARw9EyL/zkdiY4EyMo/TrsYg4jG+I1T7VKDdBemlexu5PPmwWCWSR1C5GOGjSUq41K/tTyTkr3OE+LaYuxnE1xgAbl8B7R5xaIGvOAGBEk6HSS3Hihs98lvWlcbh1oqyN/ZMj6nAM8yOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110601; c=relaxed/simple;
	bh=QIi8X+umvf+5WWJRqzL3XIk/bEXzOKcn7byPM5c5bQo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p8xKjKXAtW/MKewFWrLbptzUMCKPudLDqM5ad4AV/LXdo61eL5XiJwniq8fOt2G+Z1qdIf+D19cFOMZ4d1Xo3xnbzaUdvwZNSG7SdHu8nwazwUFgANAPNY+Lr8GXsQfXQJhJm6rGtS1KQ1IUTCUYv1H1R5hOhg26qrItQabOsqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMyjj25i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMyjj25i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D071F00893;
	Sat, 30 May 2026 03:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780110599;
	bh=kMlak6Kw1RZMdjqBjJ1+3feD2782Ls/NluqoF2x4GTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kMyjj25iAYk9KkUCzUDor/wKjI4LdimXB7Pt/1ib8RE5nvDpk6dwSsg/r9nsuY3Ht
	 9OjLq5fhnG1lXMpH4wsFRh1B/TM84wnpeausOMhN1M1FYQF5QYlKaTaXcYkRaJezjq
	 /msLQ+jH1H5e5Vl+zmaXfqtyWHMW0FF4vCjY+NAGf2vBjxiQ6ngMdINr3eosnTh/61
	 geRzsx/hPNQQlPeY6QeYkpSB5lxqEhro4Ybg0MU5vq8IUcdBCCmRcjFSrlw1jWXOIR
	 t4vjt6A0FU4Nnm7LNy9gSmSatBNHs1byT5T9OG769Ku1C4pKs6islrnKu394x2KOFl
	 EGE3p8m8Gfarw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/2] platform: Add initial synology microp driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Probst via B4 Relay" <devnull+markus.probst.posteo.de@kernel.org>
Cc: ojeda@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260530-synology_microp_initial-v13-2-aa2bb9c56efc@posteo.de>
References: <20260530-synology_microp_initial-v13-2-aa2bb9c56efc@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 03:09:58 +0000
Message-Id: <20260530030959.42D071F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] The dynamically allocated name for the conditionally registere=
d alert LED is dropped prematurely, leaving a dangling pointer in the LED s=
ubsystem.
- [Medium] Concurrent LED operations can interleave serial commands, corrup=
ting the communication protocol with the microcontroller.
- [Medium] Setting an LED's brightness to a non-zero value fails to overrid=
e and disable hardware blinking.
- [Low] The config SYNOLOGY_MICROP depends on a non-existent symbol RUST_SE=
RIAL_DEV_BUS_ABSTRACTIONS.
--

commit 1779a8eccc4d1fbf66dab42036dc8b8505625855
Author: Markus Probst <markus.probst@posteo.de>

platform: Add initial synology microp driver

Add an initial synology microp driver, written in Rust. The driver targets a
microcontroller found in Synology NAS devices to support controlling of the
power led, status led, alert led and usb led.

> diff --git a/drivers/platform/synology_microp/Kconfig b/drivers/platform/=
synology_microp/Kconfig
> new file mode 100644
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
Does RUST_SERIAL_DEV_BUS_ABSTRACTIONS exist in the kernel tree?

Kconfig guidelines state that all dependencies must correspond to a valid
config definition.

Could this missing symbol cause silent build failures by preventing the
driver from ever being enabled?

[ ... ]
> diff --git a/drivers/platform/synology_microp/command.rs b/drivers/platfo=
rm/synology_microp/command.rs
> new file mode 100644
> --- /dev/null
> +++ b/drivers/platform/synology_microp/command.rs
[ ... ]
> +impl Command {
> +    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result {
> +        dev.write_all(
> +            match self {
[ ... ]
> +                Self::EsataLed(led::State::Off) =3D> &[0x4C, 0x45, 0x33],
> +            },
> +            serdev::Timeout::Max,
> +        )?;
> +        dev.wait_until_sent(serdev::Timeout::Max);
> +        Ok(())
> +    }
> +}

[Severity: Medium]
Since multiple LEDs share the same serdev bus, can their operations (like
brightness_set and blink_set) be called concurrently from different sysfs
contexts?

Without a driver-wide lock protecting the dev.write_all() and
dev.wait_until_sent() sequence here, could concurrent calls interleave
bytes in the UART transmit buffer and corrupt the communication protocol
with the microcontroller?

[ ... ]
> diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform/s=
ynology_microp/led.rs
> new file mode 100644
> --- /dev/null
> +++ b/drivers/platform/synology_microp/led.rs
[ ... ]
> +impl Data {
> +    pub(super) fn register<'a>(
> +        dev: &'a serdev::Device<Bound>,
> +        model: &'a Model,
> +    ) -> impl PinInit<Self, Error> + 'a {
> +        pin_init_scope(move || {
> +            if let Some(color) =3D model.led_alert {
> +                let name =3D
> +                    CString::try_from_fmt(fmt!("synology:{}:alarm", colo=
r.as_c_str().to_str()?))?;
> +                devres::register(
> +                    dev.as_ref(),
> +                    led::DeviceBuilder::new().color(color).name(&name).b=
uild(

[Severity: Critical]
Since the name variable is a local CString scoped to the if let block, won't
it be dropped at the end of the block?

The LED core doesn't copy the string, so could passing the reference &name
leave a dangling pointer that triggers a use-after-free when sysfs,
tracepoints, or triggers access it later?

> +                        dev,
> +                        try_pin_init!(LedHandler {
> +                            blink <- new_mutex!(false),
> +                            command: Command::AlertLed,
> +                        }),
> +                    ),
> +                    GFP_KERNEL,
> +                )?;
> +            }
[ ... ]
> +    fn brightness_set(
> +        &self,
> +        dev: &Self::Bus,
> +        _classdev: &led::Device<Self>,
> +        brightness: u32,
> +    ) -> Result<()> {
> +        let mut blink =3D self.blink.lock();
> +        (self.command)(if brightness =3D=3D 0 {
> +            *blink =3D false;
> +            State::Off
> +        } else if *blink {
> +            State::Blink
> +        } else {
> +            State::On
> +        })

[Severity: Medium]
The LED subsystem API semantics normally dictate that writing a non-zero
value to the brightness sysfs file must stop any active hardware blinking
and turn the LED solid on.

By preserving State::Blink here when brightness is greater than 0, does this
force users to explicitly write 0 to brightness to stop the blinking before
they can turn it solid on?

> +        .write(dev)?;
> +
> +        Ok(())
> +    }
[ ... ]
> +    fn brightness_set(
> +        &self,
> +        dev: &Self::Bus,
> +        classdev: &led::MultiColorDevice<Self>,
> +        brightness: u32,
> +    ) -> Result<()> {
[ ... ]
> +        Command::StatusLed(
> +            color,
> +            if subled_brightness =3D=3D 0 {
> +                State::Off
> +            } else if *blink {
> +                State::Blink
> +            } else {
> +                State::On
> +            },
> +        )

[Severity: Medium]
Similarly to the standard LedHandler, does preserving State::Blink here
when setting a non-zero brightness break the LED subsystem expectation
that brightness > 0 overrides and stops blinking?

> +        .write(dev)
> +    }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530-synology_m=
icrop_initial-v13-0-aa2bb9c56efc@posteo.de?part=3D2
