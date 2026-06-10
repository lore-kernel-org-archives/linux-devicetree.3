Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D11371885
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082111; cv=none; b=uDt9z+qwRgLurMLIgfxVN05Xh8yXHXt/KPTAO9Q+BfYfO8WKK7F0PEyRWdz9C9LD6gp4h1lkgI+cJBDxG211wHCYljpxtAoXDHO64eaCqWSC2KWy23VW4QO1bUfSJppynfm1pysxDrbIX0jmWntuzwMQL+zll4TKsdav7bA4BP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082111; c=relaxed/simple;
	bh=6Rg2Ul7Fyi77ORk9j086xg0wLokvHp9xy8SWChl6n3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D1cQ4BhITkBqnGglXSXi2Ui/kskqXsXA/IodktMuWyTdYaGlLdUQogVpwGh97ygWP08KFoi1T49yXmqsb5egcELb3WAj+1D7cZ3dSJh3VpvL/YzI7OU2tx8p6SAGZHjsHWqA3TGZzCP2JWwtVMXuYgKWtmIlIAgex+1aCnAe+k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJtIEPGc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJtIEPGc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC91D1F00893;
	Wed, 10 Jun 2026 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082109;
	bh=zZoyF2OrIAVoOzypWbOD9neqIyKs0Ciw9sPwebmmGRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oJtIEPGcx8LwCsJdTMHVEhC+9vFI3GxNj5q02qSBOZRQGNaFRoA2KEi2AgWy014wK
	 6FRPEoTHeqztAStYKI6UTtUt5EWfkuS50v6I9u/WFENRhGpnfYRW+lOPZaubqPdsGb
	 IRgmW/ZXJB33Yrmb6w1FI11SYWWURhR4NDPvpYrUGLXgrncWkXMOAe5NDrOqkW6TwV
	 C2LOCoi5c5w6oKOm6inS7asLaM1G8+Kk9XuULlwKoTiIDg2+dzMq/H6nHyIEk57LQa
	 CRnWnBmzmwoogfV5PdaDPJSs59QE8EBPQRKg2LLadZAzNAen5BXPfX685r/WH3UuDp
	 YkLTb5HtfUFGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 2/9] dt-bindings: firmware: arm,scmi: Add
 Qualcomm Generic Extension Protocol
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-2-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-2-f3f68c608f25@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 09:01:43 +0000
Message-Id: <20260610090148.CC91D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding `qcom,generic-scmi.yaml` to the unconditional `anyOf` blo=
ck silently bypasses strict schema validation for all other vendor schemas =
(e.g., `nxp,imx95-scmi.yaml`).
--

commit 4cdbbb0bcf03bec0f34cb611707f09de406a9cfa
Author: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>

dt-bindings: firmware: arm,scmi: Add Qualcomm Generic Extension Protocol

This commit adds the binding schema for the Qualcomm SCMI Generic Extension
Protocol to support Bus DVFS on several SoCs.

> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/D=
ocumentation/devicetree/bindings/firmware/arm,scmi.yaml
> index d06cca9273c48..aedc57dd3b389 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -24,6 +24,7 @@ description: |
> =20
>  anyOf:
>    - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
> +  - $ref: /schemas/firmware/qcom,generic-scmi.yaml

[Severity: Medium]
Does adding qcom,generic-scmi.yaml to the unconditional anyOf block silently
bypass strict schema validation for all other vendor schemas?

Due to JSON Schema evaluation rules, an additionalProperties: true keyword =
in
the newly added QCOM schema evaluates to boolean true and annotates all
properties it matches as evaluated.

If an NXP device tree has an invalid property (for example, wrong types ins=
ide
protocol@81 or protocol@84), it correctly fails the nxp,imx95-scmi.yaml
schema. However, because it is evaluated against the unconditional anyOf bl=
ock
here, it then falls back to qcom,generic-scmi.yaml.

Since the QCOM schema does not define NXP's specific properties, it accepts
them via its additionalProperties: true directive and annotates them as
evaluated. The anyOf condition is thus satisfied, and the top-level
unevaluatedProperties: false check in arm,scmi.yaml passes, silently
suppressing the NXP schema validation failure.

Should vendor schemas be conditionally applied based on compatible strings
(for example, using if: properties: compatible: contains: ...) instead of
being placed into an unconditional anyOf list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-rfc_v7_scm=
i_memlat-v7-0-f3f68c608f25@oss.qualcomm.com?part=3D2
