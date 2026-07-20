Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D183B636A
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533729; cv=none; b=O1PeC06UjKHZ79JWdZN1W++5NZlcQrw4ejRcrluk+RRjxnOBI1o649qjR5MKctQ8bdPonIJPoGVoMtHsHGqpt9NR0+8fyIq7QHNlA38rYECMH6RQ1hX8EwaxZb/x2PMMMB27rY+bhqYN28auZJuCEKuKR/Y8/LtoPOgR3v52XE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533729; c=relaxed/simple;
	bh=wKuABAW0HAWJJM4eFst7Pehk9Hw5ixl9MYcPvboCBrI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XagF3TWXollkEc9RMIjekxsDjJjWscZUGNHnQm1a++MV3bJ2LSKn42H03uJ9Dbyb3V51Qcrq7RiAhgx0J1AftmRJSDlX0Kpszpai9hLel3PUfYzQdt5nhtFhU21wytKCXh5uNAr5ZnH6FqdbXJcKo13pnA3XqJhB5C+uT8rrrr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiF6Ys5y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiF6Ys5y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FB81F000E9;
	Mon, 20 Jul 2026 07:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784533727;
	bh=Jxk0L8eSm3pZpEeL0pqiXKcHVBt0FpS3yNYNA6IPYd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eiF6Ys5yQyaCCna/+MfIzoe5qo11YUGEOrp4blyCrOTeQedPNqHGtoh443trFBprR
	 raknA53EkPHPVwWHQ6UYblY95Q4IyoBguLZvE1RL3WBe7fec9xm1/s8cWiEcOaGkRU
	 P/HolVcIFKKI29wpVcY9dzEdTktagLm1AY8WsTKHCGz5mZpHOa/XrB+fRc/hurcFII
	 gE0DL7dXfdRL8mm2RNSsENOqMicHEoaHJP4gP/0kVB4u9iMy2EOngjz0N0WwhauBY8
	 k/OYdHnGxpPC2VsLwSciDska0PBJJhWVDk7xDwyP+755UKna9QtGtS7SvRKiEQluR3
	 4/kKH1WvCidnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: firmware: add mbedtee,tee binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xing Loong" <xing.xl.loong@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720073558.799755-3-xing.xl.loong@gmail.com>
References: <20260720073558.799755-1-xing.xl.loong@gmail.com>
 <20260720073558.799755-3-xing.xl.loong@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 07:48:46 +0000
Message-Id: <20260720074847.61FB81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The YAML examples will fail `make dt_binding_check` with `dtc` comp=
ilation errors due to unresolved phandle references.
- [Low] Top-level `items` for `memory-region-names` is defined as an object=
 `enum` rather than a list, leading to unnecessary schema complexity and by=
passing strict sequence expectations.
--

--- Patch [2]: [PATCH v3 2/3] dt-bindings: firmware: add mbedtee,tee bindin=
g ---
commit 2b2356c421476302d4bae45809eeb06223db44ab
Author: Xing Loong <xing.xl.loong@gmail.com>

dt-bindings: firmware: add mbedtee,tee binding
   =20
This commit adds a new device tree binding for MbedTEE, a Trusted
Execution Environment. It supports communication via shared memory ring
buffers on ARM and RISC-V platforms.

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
Does this top-level enum definition bypass the strict sequence expectations
for *-names properties?

Typically, items should be an ordered list of elements. Defining it as an e=
num
here allows the names to appear in any order, which is later overridden in =
the
allOf branches. Could this be simplified by defining the exact list of const
elements at the top level?

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    firmware {
> +        mbedtee {
> +            compatible =3D "mbedtee,tee";
> +            interrupts =3D <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
> +            memory-region =3D <&t2r_ring>, <&t2r_shm>;
> +            memory-region-names =3D "t2r-ring", "t2r-shm";
> +        };
> +    };
> +
> +  - |
> +    firmware {
> +        mbedtee {
> +            compatible =3D "mbedtee,tee";
> +            msi-parent =3D <&imsic>;
> +            memory-region =3D <&t2r_ring>, <&t2r_shm>, <&r2t_ring>;
> +            memory-region-names =3D "t2r-ring", "t2r-shm", "r2t-ring";
> +        };
> +    };

[Severity: Low]
Will these examples fail make dt_binding_check with dtc compilation errors?

The phandles like <&t2r_ring>, <&t2r_shm>, <&r2t_ring>, and <&imsic> are us=
ed
here but are not defined as stub nodes anywhere in the example blocks. The
device tree compiler generally cannot resolve these phandles without the st=
ub
definitions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720073558.7997=
55-1-xing.xl.loong@gmail.com?part=3D2
