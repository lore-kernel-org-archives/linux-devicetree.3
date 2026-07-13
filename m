Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA25305695
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938967; cv=none; b=uT0YiGboL3950h9AL7P9JfvfLMqaURqNGX3p+kNjUpA2OBrPM6mvMVKipVY09la5fT1pOWrLEwkrmk4H1HXDLgKAPatzMwKz4zdKwNFhQ0pMeNLEXoJJUNVpDLzRT0X2fnB97gwmzEknVg8Z+HEOdGYPHIu7WowiIcLG9NrAcXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938967; c=relaxed/simple;
	bh=EZRWkBHJvfwOkatt9ry4B1VLUgpQHZMSxGUTdhTewfQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gMab6PVRUtBVTmm4/MlGT3ZahGVsD4mkLW31Py2dOORsfFy44oJSgk0apSuUXV4cB52BY9kKEJVTzxfrc0MCjzbEaoyg0nSx/GN+17RMgYQtF5PKTHL+JqqdR5tW3LFSh+5QxUlqAjocR3Rv4/iqHEuB2vPNPZMwJX3ssJjtlCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyFtOLTA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyFtOLTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DF41F000E9;
	Mon, 13 Jul 2026 10:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783938966;
	bh=letGyiOJDx3Ww5kDXdAcn6tL1RnS5hrMBVL2Mr+Qbg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZyFtOLTA2jG9saKuC/10Lpokyd51ENwOtdtHtCYcHpLowa99Rb7DHdluEtvvx180B
	 r9YaWirjbNWB97M6zhvvXfrbJIfh/Smwlk6BAWx65qtxY/lakpIOfVj70zCt4Gedj5
	 dedwNcn+Jf0x5pZfAjuzm80y296GA0Zo/Q7hHN9vx13SipXQ4aq0PKZw7ORFIBZBtP
	 ymjJ2sEiZhag11TA437Ec4KvgXYxb09f9OtsXlaUboyd7k4cXwgh3FP3XhLu5oRlt6
	 CQAseAZ6krfUYzj5Oj43zDTJxEoDqWVJ6+UpspaItSOUUzngjZUYTwNnrGygGGDZNO
	 LOSmSHD2z/9Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sneh Mankad" <sneh.mankad@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:36:05 +0000
Message-Id: <20260713103605.D6DF41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit incorrectly removes the `#power-domain-cells` provide=
r property and replaces it with a consumer property (`power-domains`), brea=
king schema validation for existing device trees and misrepresenting the ha=
rdware architecture.
- [Low] The modified example code introduces an unresolved phandle (`&clust=
er_pd`), which causes `make dt_binding_check` to fail.
--

--- Patch [1]: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document=
 power-domains property ---
commit eb530c220bf421a5d64eb53cfa4eaaad646e6a1d
Author: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

dt-bindings: interrupt-controller: mpm: Document power-domains property

This commit removes the #power-domain-cells property and replaces it with a
power-domains property for the MPM device binding schema.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,=
mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.=
yaml
> index ebb40c48950ab..3f9645fbc3c20 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
[ ... ]
> @@ -68,8 +68,8 @@ properties:
>          - description: MPM pin number
>          - description: GIC SPI number for the MPM pin
> =20
> -  '#power-domain-cells':
> -    const: 0
> +  power-domains:
> +    maxItems: 1

[Severity: Medium]
Does this change accurately reflect the hardware architecture?

Looking at the driver implementation in drivers/irqchip/irq-qcom-mpm.c,
qcom_mpm_probe() registers a PM domain provider:

    ret =3D of_genpd_add_provider_simple(np, genpd);

This driver natively implements a PM domain provider, which relies on the
#power-domain-cells property being present in the device tree.

Additionally, existing in-tree device trees (such as agatti.dtsi) currently
declare #power-domain-cells =3D <0>; in their mpm nodes. Removing this
provider property and replacing it with a consumer property will likely cau=
se
dtbs_check to fail for those existing boards.

> =20
>  required:
>    - compatible
[ ... ]
> @@ -113,6 +113,6 @@ examples:
>                                 <24 79>,
>                                 <86 183>,
>                                 <91 260>;
> -            #power-domain-cells =3D <0>;
> +            power-domains =3D <&cluster_pd>;

[Severity: Low]
Is the cluster_pd phandle defined in this example block?

Adding an unresolved phandle reference to the examples section typically
causes the dtc compiler to fail with a 'Reference to non-existent node
or label' error when running make dt_binding_check.

>          };
>      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-b4-shikra_=
lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com?part=3D1
