Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983805;
	b=lDHrzbW4VRuXdJUcKx81ZTFixOSc2uPsn1WKonL6bvQ34p+wSDuo5Tuv3w8UrmNpE8RC
	 fIetNrO0fM1vHIp9A83slEtPyddjLcx8+Hc/ahnRZ5VqAlzbC83BcF0PC75a8stdZt5Br
	 AbOnZgfJANPg63lVtGObZAIEHGC1+KYSMKLT7Z+Ly7OPwgDcn69CNOCab1BOfCn6px/Wv
	 fDWG1wEJ6xkAVGq/qMkuk78cQ0XKVbhELG7ctRtuilv3vUzq5Gee5kWlR1sVuhoqxBNor
	 j04Y/K2ecM879ycrytNeMI16BdtMj2MbWM/JdEIhuRJgvDE/wK8opx6SFO7YKGn606Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983805;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=90JgQE87497KuokZ8gkpalyce3j+JfQ+uxfPeT9UCq8=;
	b=eNkhlmjNctNnpdlifid6em0gS+4mjBNGO4fNBAotUYtBpWxwIGlSq0Fhyu5e4ojGOcSL
	 Jk0IvRb5Hy4AgHSuP80XmVMsUyKM+hcibFcqBL+9eGRePrI3CB05VOfmcN++WuFYRx4uq
	 +8kDKEvV2eYNYjjmChH0EkOxIBuXzXEhsciLe2U/xZPQtMUK+q4zicqLyhoqHmO5hAO3V
	 /GVNotBZkSRbf8U8dzmHICZiCdUd1x2JW4hbQp9E1TMT+F/GD2D75BqUgIHd4bW2mistj
	 adkZLWHTGrTdJA4uoxYcBMQqoamU89EI6qpS/jU1u6ErB2pHMNrmNA3xOJpTVgaejpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2tdsqTP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE3C606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2tdsqTP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E27F1F000C4;
	Wed, 18 Nov 2026 06:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794983805;
	bh=90JgQE87497KuokZ8gkpalyce3j+JfQ+uxfPeT9UCq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L2tdsqTPQThZtUz3p2AIvveV6E+og9XlTCzfL9V1OVm75Huqb8RBSPOdE2iCplq1T
	 01nK/1CvFgwgK9MTOIDkJHrCdmFv6zLBmq61mLJHja/l3nhxy+nyAAuxy+zTDqL3/9
	 H/0RHHkn8YxUJ8HAnSYcRnCISIqLCKfnW8jM6ECc5KMF5fINrwDpNijKr0X2+cDYQM
	 V/tfkYVaI1oSzMEzQs0Kl/T5GIdrReje/IBGYSTGMOQOo3xnrAzBOSLg7hdERNmSou
	 EoJ88T4UzYas0K1GlsQL6EDJQmIst3NLoWTLFyLSfh1IzRkhNs2nluWlevrYINlBzu
	 KGWZo8t96Md5g==
Message-ID: <sashiko-outbox-220262@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH vV 1/2] dt-bindings: ipmi: Convert starfive,kcs-bmc to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mason Huo" <mason.huo@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118062526.1436893-2-mason.huo@starfivetech.com>
References: <20261118062526.1436893-1-mason.huo@starfivetech.com>
 <20261118062526.1436893-2-mason.huo@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 06:36:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: ipmi: wrong conversion commit message and schema
  filename/$id
- [Low] dt-bindings: ipmi: starfive,kcs-bmc relies on undocumented
  starfive,sio-id
--

commit fc7a7047c07e19a8497c2d87d2a38e97878efe8c
Author: Mason Huo <mason.huo@starfivetech.com>

dt-bindings: ipmi: Convert starfive,kcs-bmc to DT schema

This commit adds a DT schema binding for StarFive JHB100 BMC KCS devices.

> diff --git a/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml=
 b/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
> new file mode 100644
> index 0000000000000..2cb91d321a324
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/starfive,kcs-bmc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ipmi/starfive,kcs-bmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive BMC KCS Devices
> +
> +maintainers:
> +  - Mason Huo <mason.huo@starfivetech.com>
> +
> +description:
> +  The StarFive BMC SoCs use Keyboard-Controller-Style (KCS) interfaces on
> +  the eSPI bus for in-band IPMI communication with their host. The KCS
> +  channels are part of a Super I/O (SIO) block and each channel occupies=
 a
> +  0x100 byte register window, starting at offset 0x200 of the SIO regist=
er
> +  space. A channel is identified by its register offset and the
> +  "starfive,sio-id" of the parent SIO node.

[Severity: Low]
Where are the parent SIO node and its starfive,sio-id property documented?
Neither the parent StarFive SIO binding nor starfive,sio-id exists in any
DT schema, the example below omits the parent node, and
Documentation/devicetree/bindings/writing-bindings.rst advises against
adding custom instance index properties.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jhb100-kcs-bmc

[Severity: Low]
Should the schema filename and $id be starfive,jhb100-kcs-bmc.yaml to match
the sole compatible string, as required by
Documentation/devicetree/bindings/writing-bindings.rst?

Also, the commit subject and message state that this converts an existing
starfive,kcs-bmc binding to DT schema format, but no prior StarFive KCS
binding existed in the tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118062526.1436=
893-1-mason.huo@starfivetech.com?part=3D1
