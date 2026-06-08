Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3262EEE82
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939768; cv=none; b=EhfqrS2asZ5DmH7INgq0MqgdgVkLW0IblnpkWDd1nLpLiw/bpU1SRC5k1pMnqxtg9O6K+ZcgvPqLlBg742avjCR0AovFU/BZDYdSBqVRQI+Iyh+/05cnf5FBQg51e7HpVrnrq6sjHXKqb7LXTU7yPJSpxlxH4O6R4w+oI1ihgwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939768; c=relaxed/simple;
	bh=oe7qms3UaSlOlCTPTZEFBMKvg1bbkKRBLBTN/ZH3ofA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X2rCWKb5gph5uCcfdNnSVSqW9XJcW4Tgf6CvECCHvWfTYLXcJ+fgviyAnA3uEFHKkwnkE6iQ6Am5vpb+v5NitKnE9xM2BLAVG6MeIHhQsM5+/lgH8Jq1pB4d2bcVAh9U41NECsCXJbEgrqRTMF1e5YMEunkfaskVUePN35ZdvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aA90DDjl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aA90DDjl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B661F00893;
	Mon,  8 Jun 2026 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780939767;
	bh=0tF8K7590xiwGSGep8zCUI64HtA3hVitqLxKRhzUFSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aA90DDjlG4MRo6kB2Puw+MQKRl21po6VuH1IMr/d84zmDR//4IXz5y0B+maVXof9P
	 5cNBNLI6xANXSEepu9NAcyfswZA3Z+XKky7YHuVjPYW2QsYDoJ4Ulj8EExULqhUzGc
	 6x9c3VcpYfNzFHINHdYlXVGmqPAdEQQUUC8QClfzidBr9RusR2Uh19wQuHHZ9C6KCJ
	 WdJBK6SgbJrwqc1obqXKUHU1BURNL49eevP2rV8IEWOjE7zkD5u7HDQMDhi8CUQKcW
	 kENlE8cyQ8pLQUCyLNv+Z8HyqZT2+JGEwBdMpksRSXf/etnAjhqPd9jLSCB/bZRdjV
	 tdCFw5TbxIlkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] ASoC: dt-bindings: qcom: Add Shikra rx and va
 macro codecs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608172023.2965292-2-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608172023.2965292-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 17:29:26 +0000
Message-Id: <20260608172927.48B661F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `qcom,shikra-lpass-rx-macro` and `qcom,shikra-lp=
ass-va-macro` compatible strings are omitted from the `allOf` conditional b=
locks that enforce clock constraints.
--

commit 77e5c459dc08293ac11d98a0baa94f68830a66ac
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: dt-bindings: qcom: Add Shikra rx and va macro codecs
   =20
Add bindings for Qualcomm shikra rx and va  macro codec.
   =20
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.=
yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> index 2eed2277511f8..07fe0dc51801b 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> @@ -19,6 +19,7 @@ properties:
>            - qcom,sm8450-lpass-rx-macro
>            - qcom,sm8550-lpass-rx-macro
>            - qcom,sc8280xp-lpass-rx-macro
> +          - qcom,shikra-lpass-rx-macro

[Severity: Medium]
Should this new compatible string also be included in one of the allOf
conditional blocks below to enforce constraints on clocks and clock-names?
Without it, those properties might not be fully validated for this
hardware variant.

>        - items:
>            - enum:
>                - qcom,kaanapali-lpass-rx-macro
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.=
yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index 5c42b2b323ee4..d43adaa2fbff9 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -19,6 +19,7 @@ properties:
>            - qcom,sm8450-lpass-va-macro
>            - qcom,sm8550-lpass-va-macro
>            - qcom,sc8280xp-lpass-va-macro
> +          - qcom,shikra-lpass-va-macro

[Severity: Medium]
Similarly, does qcom,shikra-lpass-va-macro need to be added to an allOf
conditional block to ensure its specific clock constraints are evaluated
during validation?

>        - items:
>            - enum:
>                - qcom,glymur-lpass-va-macro

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608172023.2965=
292-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D1
