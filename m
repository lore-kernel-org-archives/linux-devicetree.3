Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A383A2556
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997190; cv=none; b=GEJBjEPHR6W9eGzzOBXiJ6AtZzXIAxv6B0ZBo8pkCTQxqudTJvyJXPXVMWhQbZnt8zxKxNAkNkQ8NIr5gswbm97XBjTh9ixyNYRFU/qWzKki/xllpuP7eFibqsEif9wYY8a2XE0mp2wPLnxsxapgIe6kpLu7rSkdHqFp3Z/jimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997190; c=relaxed/simple;
	bh=4jZzdoyxLr4KMotqoQgIWbeujOwSAFTrPXxUvq1Gksw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UQ4hNaEYD3sv3YHPIGYcoXcboU99mtdh1AnHfgDP/o89U0rsFP2LK1+2ocjrVLmQXwyuO48W//tXTUA5lZxpuqrr0GrfUrfv4SVtA53f3cog8soUFv5k8f61QITu5/43BgjzFxk7pbtfsyOyL8rXveKoddRD1z3vrASp9YK5T6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqF9oau1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqF9oau1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C311F00893;
	Tue,  9 Jun 2026 09:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780997189;
	bh=qEFAcFAScRlrK4OzOXGOP4zg7R+FxU8Wj1u83zmTcCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZqF9oau1MRlMT2Pw40M8hIsfLt15RMSEOz+W0lAOrphB/21Hxvv2dQ1WE9aNVcDhe
	 Vt8h1Jb7NYMYsuixIh6Erp9/eevyvI5UMNjppQ9FTdOAgYU2mFv9YkM+nFAUFPPc1u
	 v5l4kyfzBtd3S8b++ISUoUyFMp6Flarudgi+unAByGbSeo1cvLrD7ElFx4YgxoqCsN
	 j+/O6Bv0ihz4BuSi8oXrMripYzVW69H6kWdTg81xJXfWkKm5yj1UQKnD9y8Px9Zmww
	 5BwKceezbkTer+BoBD4khsASM//yTeNoVZmk1WZ2g+RVsvz8m+B8T8U/NUvQzbEaSC
	 2r/bpw50Ne2Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] bindings: power: supply: qcom,pmic-glink: Document
 thermal-mitigation
Reply-To: sashiko-reviews@lists.linux.dev
To: DhruvinRajpura <dhruvin.rajpura@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609-cooling_device_reg-v1-1-e15bddcb0086@qti.qualcomm.com>
References: <20260609-cooling_device_reg-v1-1-e15bddcb0086@qti.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 09:26:28 +0000
Message-Id: <20260609092629.39C311F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `#cooling-cells` property in the `qcom,pmic-glink.yaml` =
schema breaks devicetree validation.
--

commit 0b39bda76eaec494654108cde4e92f788edf6f16
Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

bindings: power: supply: qcom,pmic-glink: Document thermal-mitigation

This commit documents the qcom,thermal-mitigation property for the PMIC
GLINK schema. It defines an array of fast charge current limits used by the
thermal framework for battery throttling.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.y=
aml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index ff01d2f3ee5be..fcb69ebaa7cb5 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -58,6 +58,16 @@ properties:
>        The array should contain a gpio entry for each PMIC Glink connecto=
r, in reg order.
>        It is defined that GPIO active level means "CC2" or Reversed/Flipp=
ed orientation.
> =20
> +  qcom,thermal-mitigation:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Array of fast charge current limit values for different system the=
rmal

[Severity: Medium]
Does this introduce a regression by missing the #cooling-cells property?

By adding qcom,thermal-mitigation, the device acts as a thermal framework
cooling provider. For a platform devicetree to actually reference this
cooling provider in a thermal zone, the provider node must declare the
#cooling-cells property.

Since the schema limits which properties can be added, won't platforms
fail validation when they try to declare #cooling-cells to wire up this new
capability?

> +      mitigation levels. This should be a flat array that denotes the ma=
ximum
> +      charging current (in uA) for each thermal level. Elements should b=
e listed
> +      in monotonically decreasing (non-increasing) order.
> +    minItems: 1
> +    maxItems: 10
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-cooling_de=
vice_reg-v1-0-e15bddcb0086@qti.qualcomm.com?part=3D1
