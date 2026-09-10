Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150C34CCE
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022971; cv=none; b=pNUPEsDm3OAWRH7xcelhGgMiN1k/fxLTV1oIjNsX7/E7o3xwMIRlBr4JiDVgoQbXhrZv8n07IXQ+MLgXJdF3Pu5BTlyXLJAqhrA/v8wjZDy2PeEolzxKxuv7zr3MZ/XYqvsER5J+dRP66fco+WcL/WoTR5w8MrbCRo2f800iGRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022971; c=relaxed/simple;
	bh=Q6zUosfQ8vNGuJdn+fQxY1iN+k3pvK22c/+Gok38kno=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AgQ/ffSdtFgeVvBLCG9TsYwDUyeM4p69iSCcAow+v0SCf4NQxiEWwE0KrCgPlzOUw3C/bEvqZ/F+p4n7wCN1MDXS8jDaJO4NQSIDrEiQyt1rplRwriaZdpCd/wZ7sXa0q/vq4LBfEQbzKrG/6OJQF4iQSCf2wHvSMc/MkZu3szg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZe9nXPc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZe9nXPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09671F000FF;
	Thu, 10 Sep 2026 06:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789022970;
	bh=mXGpPyXYvZ3j7D0rUTphMsrS3P5WISM4Xskza5C1CQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SZe9nXPcRXW9EBUz/Y4CfPyiwKb1izGC1Ce3+D1FrzMEMidgIlMd4LhQaP8ufIVhg
	 ocHLiKV1nPbYgtVGdteErdX1LVOPk+ofRHjaYQIVr6z3xEfF2DcwZwkqg4jJk47qul
	 ZHN8WxCZ2Lrr4OfcSyeebT/65gUMKqFIWUWeIHt4PwTae+LvPayC2xzqQSGVJ8izvK
	 PCi/AIUPfW0XMLZpPpuFQ+lm/eHxn4HlI12/bp3qtixipJVHKIko8G3UtgVff2Ftc/
	 Ix0DDZFUMEHEkl5Y22S8QXNAY6BEvM54a8F592GHuADWGToL/9CRYzTeyHbpUvoJjY
	 IdeFANjayvBKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: light: add as7343
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chang Yu" <marcus.yu.56@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910063813.56419-2-marcus.yu.56@gmail.com>
References: <20260910063813.56419-1-marcus.yu.56@gmail.com>
 <20260910063813.56419-2-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 06:49:29 +0000
Message-Id: <20260910064929.F09671F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The generic LED property `led-max-microamp` was incorrectly adde=
d with a vendor prefix (`ams,led-max-microamp`), contradicting the commit m=
essage and standard property conventions.
--

commit bc94ab43a595b8c728d510d6725b14dbeb5f151f
Author: Chang Yu <marcus.yu.56@gmail.com>

dt-bindings: iio: light: add as7343

Add binding for AMS AS7343 which is a 14-channel multi-spectral sensor
with i2c address of 0x39.

> diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml =
b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> new file mode 100644
> index 0000000000000..6b8a05be00430
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
[ ... ]
> +  vdd-supply: true
> +
> +  ams,led-max-microamp:

[Severity: Medium]
Should this property be defined without the vendor prefix?

The generic LED property led-max-microamp is added here with a vendor
prefix (ams,led-max-microamp), which contradicts standard property
conventions and the stated intent in the patch version changelog.

Device trees written for this device will use this vendor-prefixed
property, creating permanent ABI baggage. If a driver later implements
this feature and correctly parses the standard led-max-microamp, it will
break compatibility with these early device trees or force the driver to
parse both properties.

> +    description:
> +      The driver current for the external LED connected to the LDR pin.
> +    minimum: 4000
> +    maximum: 258000
> +    multipleOf: 2000
> +    default: 12000
> +
[ ... ]
> +        multispectral-sensor@39 {
> +            compatible =3D "ams,as7343";
> +            reg =3D <0x39>;
> +            interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> +            vdd-supply =3D <&vdd_regulator>;
> +            ams,led-max-microamp =3D <14000>;

[Severity: Medium]
Would it be better to also remove the vendor prefix from this property in t=
he
device tree example?

> +            sync-gpios =3D <&gpio0 6 GPIO_ACTIVE_LOW>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910063813.5641=
9-1-marcus.yu.56@gmail.com?part=3D1
