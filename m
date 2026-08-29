Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0273644CB
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 06:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983856; cv=none; b=T7uZoMme+n3hT9QLmoc1tB4HjsU3ge3WcJ5+lNVBFN+u3O9LI3gGcGskj3epg/ZYtZ1nilel2kSf4yi+DgwjlRi5k/BMMLkPKD/XbewjWEZ9iLUC2RhQFgaEgIRRatBlE+WEceV9PAW+aqBLWEojw+ceZNPMCWp1/20gx52ealo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983856; c=relaxed/simple;
	bh=vAhBYxRf/k44OrKcMigp6jFn2COQ9KABXWSPKWqHtyc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T37rkADkaheZSp6AXyYW83XLEYigNEk71Wij1FOo+1ctkKJMgDOX8tfSrwzK3iiQRLwf4m5OLa9E/bP6yadFTQS+UZmUxE7KkEtQn+YfZKjZWmrzyLFj3/sqbMrDhdFkIh5UjzXm16Zkla6SuRAc6yXl9ZqEO5nYSi1Dl0Z5JMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bob+aqIG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bob+aqIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4A91F000E9;
	Sat, 29 Aug 2026 06:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787983855;
	bh=g91ClDow0I/pFL9EwOtBgTcmG49Hqa94l8vuMuG0f3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bob+aqIGHM+vpDijzs5GW4xkaogKl5RE3EqAQ90NXrGzR1RXtaitzY6em7ZdOsxR5
	 o5cTuBfwVwY/wYXnSNvXJMlnS38MKFbnnCqMiJBlATF2hlAttWRAHqfTdc6j3g5uyu
	 1WToc8gWjDjmWHL3smPAVRBquuZ2yxH23Cb8P9YAArx4DiAwz+wDWoVBWeWpabt+Sr
	 ttgxXSUXvBXW6TrwE3kgOQApXqYyyVPFU2xB3G6rtkuA9X/rr88ZSPc8F+JxY13GqS
	 jU8vw6PqpQCKw+TWnEr5tRlWKkBO2ZCKvD/Qkx4B5QsVrqZ8PJgZLfrStzaTyQRcVl
	 KmF78eGumAh+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: iio: dac: add adi,ad5710r.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260829-iio-ad5710r-upstream-v4-2-8af3121c7d21@analog.com>
References: <20260829-iio-ad5710r-upstream-v4-0-8af3121c7d21@analog.com>
 <20260829-iio-ad5710r-upstream-v4-2-8af3121c7d21@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 06:10:54 +0000
Message-Id: <20260829061055.2F4A91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree example and schema documentation incorrectly requir=
e and include a header from an unrelated device (`adi,ad74413r.h`) to confi=
gure the AD5710R's channel functions.
--

commit 3746051355b5551010e58f435b49ff4409ec4699
Author: Kim Seer Paller <kimseer.paller@analog.com>

dt-bindings: iio: dac: add adi,ad5710r.yaml

This commit introduces device tree bindings for the Analog Devices
AD5710R/AD5711R DACs. It defines properties for power supplies, SPI
configuration, and per-channel output types.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml b=
/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml
> new file mode 100644
> index 0000000000000..259866ca87cff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml
[ ... ]
> +      adi,ch-func:
> +        description:
> +          Channel output type. Use CH_FUNC_VOLTAGE_OUTPUT for voltage
> +          output or CH_FUNC_CURRENT_OUTPUT for current output.

[Severity: Low]
Does this documentation suggest macros that don't exist for this specific=20
device? It seems these macros are not provided in any device-specific=20
header for the AD5710R, which might confuse users trying to configure the=20
channel output type.

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [1, 2]
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/iio/addac/adi,ad74413r.h>

[Severity: Low]
Is this include directive for an unrelated device intentional here?

Including a device-specific header for an entirely different component=20
creates an illogical dependency. This masks the missing macro definitions=20
mentioned above by coupling the configuration to an inappropriate source.=20

Could this break or cause confusion if the ad74413r bindings are ever=20
refactored?

> +
> +    spi {
> +        #address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829-iio-ad5710=
r-upstream-v4-0-8af3121c7d21@analog.com?part=3D2
