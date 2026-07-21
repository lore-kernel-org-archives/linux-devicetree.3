Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6DC3C2790
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649798; cv=none; b=c8wD8gK81omFy3Mecd0bRPWYy0qFhTpc56Xr4F0re4LgQ1LPW/krRfOuLAWRx2W5PZgwCqnY9om6J/RiKadMaD9h+PZPBtgEqqtSRzXRxXVRx+8AjYi7oaVjfuCNGETqpeH/ge8630m6LFNDcdMAKjvZqaWpQgfI1FXOo9kU4Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649798; c=relaxed/simple;
	bh=F91h6n8FFVYoKklv5GYSN4zC3t3EfBUS/5oge0dVl38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lbQ/c4PRpqnbs/O0AUTo7L0KCfFjJemT9el5fD+sgsmbYBoZKCzB2wGtOG3LAmmhnStnirZ3OyTVZigxfdJh//1BcqMdaktKyGP2DPcY1ySHw2iaLdYcC9aj5UWN5xtIO/+uhzKRM8/OVlh5M+MqcHhGLv/4aigZ+VST98nOddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ud11f5Rt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ud11f5Rt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D1D1F00A3E;
	Tue, 21 Jul 2026 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784649797;
	bh=YkTKlIzt3pE3SY28kvKd0nK5ZFd1MChHP45uOnu/lJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ud11f5RtVe78ptQi/r+WzKl3m4wbK5f+G61XzZZq2DDs6PBnae7ikEW9UjbTS6p1/
	 l/mwykJ+VFf1iRLprRZjnfwabXLgojkeUkIBOYWuMBfzSTPw1kgT4/ErDagbKiWuWm
	 PN8weUAWY90wtMtb0NUc7a13GlGkTvTy5wr7TbVVUZ3AmKiJ/G+7CsUUdj3iWhMNwe
	 yqcp9Hg9hrIUb7riNOboBO4UWx45p0mjMIGhwYepiYYuoN5jWAjvm4pea6NpGB/rd2
	 qAdbYVWnLvLEL6lUmhWKT5vQygdTWINt2Y7RNrqD54SSJ3U5rVzJOAn0cdDpdf7GqV
	 DLJ8mR3LQD+qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260721-dt-bindings-qcom-soc-naming-v3-1-8f275c9d3412@oss.qualcomm.com>
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
 <20260721-dt-bindings-qcom-soc-naming-v3-1-8f275c9d3412@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 16:03:16 +0000
Message-Id: <20260721160317.67D1D1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Schema validation regression for existing legacy compatibles using =
new SoC codenames
--

--- Patch [1]: [PATCH v3 1/4] dt-bindings: arm: qcom-soc: Include Eliza, Ka=
anapali and others in SoC names ---
commit 3874df0576bde7993596a9073b5a401dc452d1e8
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names

This commit updates the schema checking for proper SoC compatible naming st=
yle
to include several new Qualcomm SoC codenames. It expands both the schema
select block and the properties constraints to support these new names.

> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Docume=
ntation/devicetree/bindings/arm/qcom-soc.yaml
> index 27261039d56f6..fecf9dc05b67e 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -25,7 +25,7 @@ select:
>      compatible:
>        oneOf:
>          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd=
[amx]|sm|x1[ep])[0-9]+.*$"
> -        - pattern: "^qcom,.*(glymur|milos).*$"
> +        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|mil=
os|nord|shikra).*$"
>    required:
>      - compatible
> =20
> @@ -36,7 +36,7 @@ properties:
>        - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm=
|x1[ep])[0-9]+(pro)?-.*$"
>        - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
>        - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
> -      - pattern: "^qcom,(glymur|milos)-.*$"
> +      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|n=
ord|shikra)-.*$"
> =20
>        # Legacy namings - variations of existing patterns/compatibles are=
 OK,
>        # but do not add completely new entries to these:

[Severity: Low]
Will this cause dtbs_check validation to fail for existing upstream device
trees?

Adding these new SoC codenames to the select regex above causes the schema =
to
suddenly evaluate nodes using the legacy vendor,IP-SoC format, such as
qcom,scm-eliza or qcom,apss-wdt-kaanapali.

Since these strings start with an IP block identifier, they will not match
the new "^qcom,(eliza|kaanapali...)-.*$" pattern. Because they are not
included in the legacy regex whitelist below it, valid existing nodes will
fail validation against all allowed patterns.

Is there a way to validate these existing legacy compatibles without allowi=
ng
new ones?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dt-binding=
s-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com?part=3D1
