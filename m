Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287833E1231
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033991; cv=none; b=YHYufy2ZtIyPcJyDKDAvcO3GzPeiyd1bBQOIxmBI5GPjrMoFGAdigp1siCkDUNrnk00YkhRUaTSwAf1h2KHRm5U+RsYvJF40gJUcH409GgSA3PpPS2cxwrTageTqNYmPIawXkMi4xHRDLypwj+8QrZrE0m8ldsdJF1PsKk7/BU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033991; c=relaxed/simple;
	bh=BiQ3UnIcsWTb7ey/lR9ToPIW5ytIRmWcUKzrlFMS53o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=arP8+UE63KIlcKBnu6xvGQes/RPtIpDdB5qOM5l92ysiQGktzXXC/Ac45UFDE7pNYiZQAu+mSejfqxtDPFgrmElFo/cLgYlyxLnzMWCmDbXpfDONDoKQzG2taKfYjVmbS/zX+ql7EgD/7T+K2OgblY1bvkn5yvr4mYH2vJImVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZ1ka2R5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZ1ka2R5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9D91F000FF;
	Thu, 10 Sep 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033984;
	bh=AdpdQ5bF22bswgv82SPcY6vENElLOtAt19B2JUvM4KI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TZ1ka2R5G46W8njE+o++WIrrB+558kS10hFe4Nu3yQDrjGqJip2upb2y3eOA0f6bb
	 kdqQMMChJyigx1uHfTPlpdRIB5Nfa9bLk2O/5lSlhocQgJMqIqWXyV/8nZ3f9nDuuc
	 HnDGckxDXyEkKR5PRIGj/1twLrNiRKLqOKwkRFwjrFLVHZjZ9Ex6oEDp/2anl4+pMi
	 4+ubevKeUx8Fb7nYiQi83Y05z0dcNmOVnpTj5DA8+72gachi4jRZMWq1mzYtDbPqDC
	 Bln6G55immHf9n4wqtY0LN9z18APGSakhMSu6VwGk24KSwIXPIog442r+FVkh5Yf0L
	 CGb2SKT3wtXmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910-add_shikra_support-v2-1-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-1-fdd2129c696c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:53:03 +0000
Message-Id: <20260910095304.2B9D91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `if-then` conditional constraints for the newly added `q=
com,shikra-lpass-rx-macro` and `qcom,shikra-lpass-va-macro` compatible stri=
ngs.
--

commit fd8a851e254921359c89e0a86263375bd7af870d
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: dt-bindings: qcom: Add Shikra RX and VA macro compatibles

Add bindings for Qualcomm shikra rx and va macro codec.
Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.=
yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> index 4988e7ed6e34b..d2f68b02566b8 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> @@ -19,6 +19,7 @@ properties:
>            - qcom,sm8450-lpass-rx-macro
>            - qcom,sm8550-lpass-rx-macro
>            - qcom,sc8280xp-lpass-rx-macro
> +          - qcom,shikra-lpass-rx-macro

[Severity: Medium]
Is there a missing update to the conditional constraints in the allOf secti=
on
for this new compatible string?

When validating a device tree containing the qcom,shikra-lpass-rx-macro
node, the schema validation might fall back to the loose top-level limits
instead of strictly enforcing the required clocks for this hardware variant
(e.g. mclk, npl, macro, dcodec, fsgen). Device trees with invalid clock
configurations could silently pass dt_binding_check validation.

Could we ensure the corresponding if-then block is added to enforce
constraints for clocks and clock-names?

>        - items:
>            - enum:
>                - qcom,eliza-lpass-rx-macro
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.=
yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index aea31fbdad376..23f00de82cd36 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -19,6 +19,7 @@ properties:
>            - qcom,sm8450-lpass-va-macro
>            - qcom,sm8550-lpass-va-macro
>            - qcom,sc8280xp-lpass-va-macro
> +          - qcom,shikra-lpass-va-macro

[Severity: Medium]
Similarly, does the new qcom,shikra-lpass-va-macro compatible string also
need a matching conditional constraint block in the allOf section?

Like the rx-macro binding, schema validation could fall back to loose
top-level limits instead of strictly enforcing the required clocks for this
variant. This allows device trees with invalid clock configurations to
silently pass validation.

Should we add the required constraints for this variant as well?

>        - items:
>            - enum:
>                - qcom,eliza-lpass-va-macro

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-add_shikra=
_support-v2-0-fdd2129c696c@oss.qualcomm.com?part=3D1
