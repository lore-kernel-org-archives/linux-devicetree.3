Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E692989B5
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044448; cv=none; b=NgeN98EIrKoAncfV6VppWlLj/FnHS030Yuvm3sgasBWVutsuMK22MKbwGZhBS0H8iQNcJ2HL25bXZJTKjxxUFgv41c1fb2DsU4lRXwISqlBQx8U2lo0IUxCbxhaUxDMtsX7uCfqbm6WRoK7KlcVq2IAW1fTg3v8i+WJrzYvXhfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044448; c=relaxed/simple;
	bh=TvZbR9QU2ogqOh/p7Se6P4IsY5XM1ldWVqwu2R9YJho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R4O9JzIB7lSddNI6aV+TBuG8iMcHgIwnNyOUzH8w9mmcgBQpZASiYcLVIrlbJN2xGOm/WUzLQ+qpnybdX2+sdBB8NEcpEYsa8rn8/1GhAOo6GhRZy/aYkj9TAYxK1mn5GTf/iaGRANdUXZRGRJAiGXV3FMozQ+5NWkhhEqeKkVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFspNwMZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFspNwMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAF0C2BCB0;
	Sun, 17 May 2026 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044448;
	bh=TvZbR9QU2ogqOh/p7Se6P4IsY5XM1ldWVqwu2R9YJho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lFspNwMZoozUnHSdvTkVkQOYIgBmq4Ppn4Ivnz6hJddHMCegSLhwzHdubPqCdB3Yn
	 fkVUydSk/fKZXT6cSdOgYOQuaO9E1gkfFm5/01/k4Oji50k9F6EyrnKie7zXlbe8AM
	 Zi/e9Nc2+/VveH0SS9+uUvUe8ifO74LgWfGpeLIZ6kAL8xG88Ba18HXOcx6IMRDo6j
	 d38TaPYCTmKnwgJVLylMN6+D8UUG9CS5QVY0K+XsolE5pGco95q0yvbEgGmC1Q2gXT
	 wZx/vXFZSugxZ3B/oaDrDNMvc09o8ze3IkxS7yBJ7WThmnTYsZsgNG2tk9ba/Zil53
	 oF4utXJYwvv5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/13] docs: iio: add documentation for ad9910 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260517-ad9910-iio-driver-v5-13-31599c88314a@analog.com>
References: <20260517-ad9910-iio-driver-v5-13-31599c88314a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 19:00:47 +0000
Message-Id: <20260517190047.DEAF0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Abuse of IIO channels to create a configuration hierarchy and prop=
erty namespace.
- [High] Implicit multiplexer switching and '-EBUSY' reads on inactive DRG =
attributes breaks state save/restore tools.
- [Medium] Overloading the `scale_roc` numerical attribute with a magic sen=
tinel value to enable pin-controlled mode.
--

commit f680c44805df9c1351d6484cf4f4d1ff94df8c8c
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

docs: iio: add documentation for ad9910 driver
   =20
Add documentation for the AD9910 DDS IIO driver, which describes channels,
DDS modes, attributes and ABI usage examples.

> diff --git a/Documentation/iio/ad9910.rst b/Documentation/iio/ad9910.rst
> new file mode 100644
> index 0000000000000..dbcf8f8a1dda4
> --- /dev/null
> +++ b/Documentation/iio/ad9910.rst
> @@ -0,0 +1,666 @@
[ ... ]
> +Channel hierarchy
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The driver exposes the following IIO output channels, each identified by=
 a
> +unique channel number and a human-readable label. The ``phy`` channel is=
 the
> +root of the hierarchy. Changing its ``sampling_frequency`` reconfigures =
the
> +system clock (SYSCLK) which affects all other channels. Most of the
> +mode-specific channels have an ``enable`` attribute that turns the mode =
on/off.
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Channel
> +     - Label
> +     - Parent
> +     - Description
> +
> +   * - ``out_altvoltage100``
> +     - ``phy``
> +     -
> +     - Physical output: system clock and profile control.
> +       See `Physical channel`_.
> +
> +   * - ``out_altvoltage110`` ... ``out_altvoltage117``
> +     - ``profile0`` ... ``profile7``
> +     - ``phy``
> +     - Single tone control: frequency, phase, amplitude.

Are these multiple IIO channels actually representing distinct physical
signal paths (e.g., individual DAC outputs)?

In the IIO subsystem, channels should typically represent actual hardware
inputs or outputs rather than software configuration namespaces or internal
modes. Since the AD9910 has a single physical output, exposing these
mode-specific groups (like phy, profile0-7, parallel_port, etc.) as
separate out_altvoltage channels might severely confuse generic userspace
clients like libiio, which could incorrectly detect 15+ distinct voltage
outputs.

Could this configuration hierarchy be mapped to IIO device attributes or a
single channel's extended attributes instead?

[ ... ]
> +Digital ramp generator (DRG)
> +----------------------------
> +
> +The DRG produces linear frequency, phase or amplitude sweeps using dedic=
ated
> +hardware. It is controlled through three channels: a parent control chan=
nel
> +(``digital_ramp_generator``) and two child ramp channels
> +(``digital_ramp_up``, ``digital_ramp_down``).
> +
> +The DRG can target only one destination at a time (frequency, phase or
> +amplitude). Destination selection follows a "last write wins" policy: wr=
iting
> +any value (including zero) to a destination-specific attribute (e.g.
> +``frequency``, ``frequency_roc``, ``phase``, ``phase_roc``, ``scale`` or
> +``scale_roc``) switches the DRG destination accordingly. Reading an attr=
ibute
> +whose destination is not currently active returns ``-EBUSY``.

Could returning -EBUSY on read operations for inactive attributes prevent
generic userspace diagnostic and state-tracking tools (like iio_info or
sysfsutils) from successfully querying the device's full state?

Additionally, the implicit "last write wins" behavior might cause state
restoration tools to inadvertently scramble the active DRG destination,
since they typically write sysfs attributes in an arbitrary or alphabetical
order.

Would it be better to use an explicit multiplexer attribute (e.g.,
drg_destination) and allow inactive attributes to remain readable?

[ ... ]
> +Output Shift Keying (OSK)
> +-------------------------
> +
> +OSK controls the output amplitude envelope, allowing the output to be ra=
mped
> +on/off rather than switched abruptly.
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Attribute
> +     - Unit
> +     - Description
> +
> +   * - ``en``
> +     - boolean (0 or 1)
> +     - Enable/disable OSK.
> +
> +   * - ``scale``
> +     - fractional
> +     - Target amplitude for the OSK ramp. 14-bit ASF field. Range: :math=
:`[0, 1)`.
> +
> +   * - ``scale_roc``
> +     - 1/s
> +     - Amplitude scale rate of change. Writing a non-zero value enables
> +       automatic OSK and selects the closest hardware step size. Writing=
 ``0``
> +       disables automatic ramping (manual control of the ASF register us=
ing
> +       ``scale``). Writing the maximum available value enables pin-contr=
olled
> +       immediate transition with no ramping.

Is overloading this numerical rate-of-change attribute with a magic sentinel
value (the maximum available value) to enable pin-controlled mode the
intended sysfs design?

This approach might make the UAPI brittle and difficult to discover,
especially if the maximum calculated rate changes due to clock
configurations. Could a dedicated boolean or enum attribute be used to
enable the pin-controlled mode instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-ad9910-iio=
-driver-v5-0-31599c88314a@analog.com?part=3D13
