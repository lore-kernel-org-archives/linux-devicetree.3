Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2CC30DD30
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005695; cv=none; b=uMnSa12SheM4/ZqrJOSNevDzxLQwTWJfYB0PT9AB+2oytLH1s5nROvPnFOh/KrEXMNGs1n6TnzgGB32E4gh4I6Qq+mZNv4SZEV4fpsTbh29usWnj1YrPWLMTOKYvLkRhsDg8p9Xg34SME34z7ot4btHbFQVgS/5+bS1fAsGqo78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005695; c=relaxed/simple;
	bh=01XzJAN7ZQ9KmAZrs/Mp+427irZmkzqxCbwA1obWb7w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YbgVUh/Va84o9ti8QN2AHq/wMWievRJj1khS1iNZCLOXbj5yUGK01BUzAd9EZYTUKhoe+ZMn9qN9KoGkpAKd/5SfFdNRn7ian4lAx5raMeFFwIcHmLnSdWb96oNekiIl0+YiTawO2WusHB0wSCpR6Tk2fuRVYp5F/R1yxo5owps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APXuh9fA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APXuh9fA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C7B1F000E9;
	Thu,  2 Jul 2026 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005693;
	bh=OfxB+4eob962IBGwuxqZk+f5BNGB5u/kytdByCVnMqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=APXuh9fANNfL3g97frE419O2o5ft+/5U3UeqDMeBqgco7yGihf2CymidVVgfYaJIV
	 TZc2LtFjjFkYDjuvei/GDnwGiOLNTPNaTIR96wnP7l5F3ruvtI/4Pq/xeloLIFhg4/
	 2gdzHGtTS5SHQK5pAtz5AGh/JArxySqXBfTEvISkzPwyR2zfCPmrMiPFwHEneHk0MI
	 w7IqlTSmq18VkvBnyzSk4ndQJYQ7g9lrAzNgdHwXyHjGZfveyXBR3o4r+gWx0yfoGw
	 XT8EswslTy7RjWj+5JqD4NytIhldWJ7JJWp6Ox6anbe03P1+kC6QIB+Mgr2cY1ZhHH
	 Q4hZ643zFJ2Bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: firmware: add mbedtee,tee binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xing Loong" <xing.xl.loong@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260702151115.544016-3-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
 <20260702151115.544016-1-xing.xl.loong@gmail.com>
 <20260702151115.544016-3-xing.xl.loong@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 15:21:33 +0000
Message-Id: <20260702152133.86C7B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `memory-region-names` property incorrectly defines `items` as a=
n object instead of an array of schemas.
- [Low] The provided DT binding examples contain malformed root-level nodes=
 that will cause `dt_binding_check` to fail.
--

commit 5f6618bd551455752fa4251daab79dbc393c89d6
Author: Xing Loong <xing.xl.loong@gmail.com>

dt-bindings: firmware: add mbedtee,tee binding

This commit introduces a new device tree binding for MbedTEE, a Trusted
Execution Environment for embedded systems. It supports both ARM/AArch64
using SMC and RISC-V using IMSIC configurations, communicating via shared
memory ring buffers.

> diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml =
b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml

[ ... ]

> +  memory-region-names:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      enum:
> +        - t2r-ring
> +        - t2r-shm
> +        - r2t-ring

[Severity: Low]
Does this items definition violate the dt-schema constraints for properties
ending in -names?

dt-schema typically requires an array of schemas for items to enforce strict
sequence order, rather than an enum object. This could cause make
dt_binding_check to fail against the core meta-schema.

[ ... ]

> +examples:
> +  - |
> +    /* ARM TrustZone (SMC) */
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    firmware {
> +      mbedtee {
> +        compatible =3D "mbedtee,tee";
> +        interrupts =3D <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
> +        memory-region =3D <&mbedtee_t2r_ring>, <&mbedtee_t2r_shm>;
> +        memory-region-names =3D "t2r-ring", "t2r-shm";
> +      };
> +    };
> +
> +    /* memory-region phandle targets */
> +    mbedtee_t2r_ring: t2r-ring {};
> +    mbedtee_t2r_shm: t2r-shm {};

[Severity: Low]
Will placing these memory region nodes at the root level instead of inside a
reserved-memory node cause dt_binding_check to reject the example?

The root node schema typically rejects arbitrary children lacking compatible
strings.

[ ... ]

> +    /* msi-parent phandle target */
> +    imsic: imsic {
> +      msi-controller;
> +      #msi-cells =3D <0>;
> +    };

[Severity: Low]
Can this dummy node cause schema validation failures?

It lacks a compatible string and is placed directly at the root level, which
dt-schema usually flags as malformed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702151115.5440=
16-1-xing.xl.loong@gmail.com?part=3D2
