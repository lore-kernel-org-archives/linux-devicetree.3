Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4F3EC829
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868168; cv=none; b=VUl+F7sTfS0FrxacB/07ze02JAYAbonYfkEhQmpI7mm2mTmoHJ17AIh/vUiS1eRMB31nyNiRR/4sEWrsg1IA2YyQA8100w16wPRExk/3Eb9GeW1RKXX2+6syUSfp1VgLiK1U/uZ5XfVNJvC+YkQvGgxtAYJDYS79i4mT9J9RAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868168; c=relaxed/simple;
	bh=X7ezJkQffmSWH2Fm3Ao3NuuHYihqVIO4XTrsc1jB+vo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eCyGCQKhKJa3ELn9ytk0DUWwlhsgRa4RZ88xSJbwEaOczpHvTW0qqWsZP/bSJo7iax0I0stipfzBUF5cmy1Ee1c1GFQOfazvbEu3sTqTwHs8xNymjFol8R5R4/AAqTBD99mAhioBo6puY25rygBM6ztMcL3DTSIAuoH6kHgSlhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1payYng; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1payYng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E981F000E9;
	Tue,  4 Aug 2026 18:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785868166;
	bh=Z/P0OMPa871RAWjCUBZ3LJKo0DC9Ee1mzgcGS04/8No=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y1payYngmIBStx+HthPtwnFkSCsEFL8E/4HuN+kYw97Yvp0vUw0CKe+B6FAr2AK/T
	 GPEfZJY7qnIUDL1zysANSDGZjvHPZ5qq8Ne9wfkXiz94yE+VK+EF6GDIMw7k6djhS8
	 z2fX3PAmKhcdWmsMx/RPQAu74oODhMT2T8tkSC+wX/rbkesBHNdiZUflL9cYkCDnGw
	 oBtpFyXxHWOOcfoxMiwn+JvTxn3Wp0bJvpG5zaIpMa6tv5bHga9fKngPmrKdtS707k
	 6AAzqy70BBFBfjj1xHxQEfffgQvvLhXf16ad5OubHJ5mCKeU+xKmWzzoKREtbWyc6g
	 TD+Mf/G4PNEcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/10] dt-bindings: clock: qcom: Add support for
 CAMCC for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-6-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-6-39067760dc3c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 18:29:25 +0000
Message-Id: <20260804182926.71E981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding unconditionally requires `#power-domain-cells` for a=
ll compatibles, incorrectly forcing the BIST MCLK controller (`qcom,eliza-c=
ambistmclkcc`) to act as a power domain provider.
--

--- Patch [6]: [PATCH v9 06/10] dt-bindings: clock: qcom: Add support for C=
AMCC for Eliza ---
commit 3b7afe439852001ef758258be71850042fc0ea32
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add support for CAMCC for Eliza

This commit adds compatible strings for the Eliza camera and camera BIST
clock controllers to the Milos camcc binding. It also includes new header
files for the clocks and modifies the schema to require the
#power-domain-cells property.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yam=
l b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> index c4aba40e316ca..cf7df47acbe7f 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
[ ... ]
> @@ -8,16 +8,23 @@ title: Qualcomm Camera Clock & Reset Controller on Milos
> =20
>  maintainers:
>    - Luca Weiss <luca.weiss@fairphone.com>
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> =20
>  description: |
>    Qualcomm camera clock control module provides the clocks, resets and p=
ower
>    domains on Milos.
> =20
> -  See also: include/dt-bindings/clock/qcom,milos-camcc.h
> +  See also:
> +    include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
> +    include/dt-bindings/clock/qcom,eliza-camcc.h
> +    include/dt-bindings/clock/qcom,milos-camcc.h
> =20
>  properties:
>    compatible:
> -    const: qcom,milos-camcc
> +    enum:
> +      - qcom,eliza-cambistmclkcc
> +      - qcom,eliza-camcc
> +      - qcom,milos-camcc
> =20
>    clocks:
>      items:
[ ... ]
> @@ -44,6 +51,7 @@ required:
>    - clocks
>    - power-domains
>    - required-opps
> +  - '#power-domain-cells'

[Severity: Medium]
Does adding #power-domain-cells to the global required properties force
the qcom,eliza-cambistmclkcc hardware to incorrectly act as a power domain
provider?

Looking at the new header include/dt-bindings/clock/qcom,eliza-cambistmclkc=
c.h,
the BIST MCLK controller appears to define only clocks, lacking any power
domains or resets.

Because #power-domain-cells is now unconditionally required here, will a
device tree node for the BIST controller fail dtbs_check if it accurately
omits the #power-domain-cells property? Would it be appropriate to isolate
the unique constraints for qcom,eliza-cambistmclkcc using a conditional blo=
ck?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-eliza-mm-c=
c-v9-v9-0-39067760dc3c@oss.qualcomm.com?part=3D6
