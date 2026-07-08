Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99344BC91
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522739; cv=none; b=eU8ah+k7Rq1ccJ9al+JguB8TZAHhlO9DN5L35lNshXv2b+E+OVI3kholBIuEaBXBqgNb1HBEYnS1qZ6p0NuUVB8dm506QO+7zX13MHJvC+uyg5R6x5muvdYhXqwIYYsn+69125QudaoMFZqdvmTCy9Rlv3tezKSTVHFe+3qdjZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522739; c=relaxed/simple;
	bh=MJfGSBSfcUBJ1CNxF+ndoiy5VQORzg1w4jrvzEd4Qfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZTsrpk5pt1RJl/Q8fj5lvtwRDq/QOsKFAg8uI/zDT7iv20Ran3Ed6ndaNlYu/MnRRkuTziwS16Hxeyio5OLQSIA9la4obTdcXst0F68mVfFhbRPAM0IrPxraSWAGTFUoCHVHrV5i7b2NB0UDiQ1AGbQmvZEW8X3pR6PIFQ6bNiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaJevFJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaJevFJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840DC1F000E9;
	Wed,  8 Jul 2026 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522737;
	bh=0mSVtth4iZ2D8384/fa98ERUfGVGAgJ5Gxx68BMz02o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SaJevFJ9jVK1Ks0k/mgksdSYErgXmSlXixUXynX73SmroPjVkiRNvWadLJKJfozUz
	 V9Q30uxG2Hzct+QFX90UhU58Kuubdfy09ifzv0DqUy4v09Q9sQJD+sg1GFf7wqnzdp
	 CvN7jacxoBrfM59c5DBwwV4qLYoSMp1CO450jkqMjZnU/w/o1Y1HF0wqeIjjQI4art
	 3akb1cia/SXwpxNb8OUeKt/KB2Cxw3Wwqtjd5AHddQ7BEgQq7ioS+hubmILTXpXfA1
	 yhS60mAodqlN++uHUsDlmK82Lm1JB8wB6Kst0XBDmwfsZZQfOT2dQCOIsq8mccKIVN
	 vvczWSYv54S1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] dtc: dt-check-style: Add more DTS test cases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-dts-style-checker-v4-7-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
 <20260708-dts-style-checker-v4-7-c175e6401150@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:58:56 +0000
Message-Id: <20260708145857.840DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing semicolons at the end of node definitions in multiple newly=
 added Device Tree Source (DTS) test cases.
--

--- Patch [7]: [PATCH v4 7/7] dtc: dt-check-style: Add more DTS test cases =
---
commit 62a01452b76be437a860d7d26f7c0086f5c3e54e
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Add more DTS test cases

Add a few more test cases for valid and incorrect DTS for
dt-check-style.

> diff --git a/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts b=
/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
> new file mode 100644
> index 0000000000000..dffc81cffbeb5
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts

[ ... ]

> +	pmu-2 {
> +		compatible =3D "example,pmu";
> +
> +		/* Just reference labels to avoid strict warnings */
> +		example,foo =3D <&foo>, <&label_bar>;
> +	}

[Severity: Low]
Does this node definition need a trailing semicolon? It looks like it ends
with } instead of };.

> +};

> diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name=
-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-o=
rder.dts
> new file mode 100644
> index 0000000000000..19fb800e719fb
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.=
dts

[ ... ]

> +	pmu {
> +		compatible =3D "example,pmu";
> +
> +		/* Just reference labels to avoid strict warnings */
> +		example,foo =3D <&foo>, <&label_bar>;
> +	}

[Severity: Low]
Is a trailing semicolon missing from the pmu node definition?

> +};

[ ... ]

> diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node=
-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-o=
rder.dts
> new file mode 100644
> index 0000000000000..66547a1cd2b5a
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.=
dts

[ ... ]

> +	serial@30000 {
> +		compatible =3D "example,serial";
> +		reg =3D <0x30000 0x1000>;
> +	};
> +}

[Severity: Low]
Should this soc override block end with a semicolon?

> diff --git a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts =
b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
> new file mode 100644
> index 0000000000000..b1032885ad486
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts

[ ... ]

> +	pmu-2 {
> +		compatible =3D "example,pmu";
> +
> +		/* Just reference labels to avoid strict warnings */
> +		example,foo =3D <&foo>, <&label_bar>;
> +	}

[Severity: Low]
Could there be a missing trailing semicolon at the end of this node?

> +};

> diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-nam=
e-order.dts b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name=
-order.dts
> new file mode 100644
> index 0000000000000..33ce562b72a39
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order=
.dts

[ ... ]

> +	pmu {
> +		compatible =3D "example,pmu";
> +
> +		/* Just reference labels to avoid strict warnings */
> +		example,foo =3D <&foo>, <&label_bar>;
> +	}

[Severity: Low]
Does this node definition also require a semicolon?

> +};

[ ... ]

> diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-nod=
e-order.dts b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node=
-order.dts
> new file mode 100644
> index 0000000000000..d9f1f533beebd
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order=
.dts

[ ... ]

> +	serial@30000 {
> +		compatible =3D "example,serial";
> +		reg =3D <0x30000 0x1000>;
> +	};
> +}

[Severity: Low]
Should this block end with }; to be a valid Device Tree syntax?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-dts-style-=
checker-v4-0-c175e6401150@oss.qualcomm.com?part=3D7
