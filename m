Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D23148DA
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 18:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050755; cv=none; b=EL7r6oxSsOrVNaE8MXxT57Ar1x501WE64z5ZQMbFIBsAA5xULaNE4hbLFBcqlg+mpRRU5osHkYexERWixwmfH/V4C/buRqrgS7Xd2oN59UP1mGNZfWmbJeU2ud4uEn3ineWd3ZYzZ5x2wD2GQQlmWyfyYxp1Gb90ZRl4amIfmtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050755; c=relaxed/simple;
	bh=LkhE8m+FX6AuSpoPLQUnrWMhefBQMsfJn9+Id6kBR/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f46uww4QKCdEt9+5j+q56MBtKMseOV4q3eTHZtDqIYMgG+5fd6HdYB1eANMA66KhKe6qQGq+xlKkpDvyb9dyVWXVk1IY7gOnoyDzZCnqPXWamnDg3kMDSpwk25aA6SB3xQdQYPT38E96Kjz9AiVOOoHqb+hYXsiZowuEk98jm6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcPzojyN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcPzojyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F651F0089B;
	Sat,  3 Oct 2026 18:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791050754;
	bh=3o5ZOf2dD2+21qzs75suHgbSdYLMd6lvM7hRaaQO/hw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DcPzojyN7hsyGlB1oPyz5NIMvuDJuuDxSWpcShdww7VP/g0Zjsty0xqp+nn4snSFm
	 JRmBNsXbT6bR1GE1jbB2x6id1EnZtYFeGTinOAwMqBGVIFwPzUwjRIjGUaA5JAZI+F
	 Qa6uTUeiBswuFLXJ/sX/s3eFypPCv/vWGUm0/ZtSILh7PPlM4GXtoiaitzHe5D2pOn
	 njCsZFZKBBaoj2NA0jni4yjJG6owQlYrBb+yElDv28f5ng/WQ7s+WKA+kZKs02r65G
	 4rQuN+dzL7uebuO+HTYVy9lH215KYMPd+z5kvl6sWyCoxAtTFe0kxh+1pXQ1FJugpK
	 HSnt3QvXpZhPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/11] dt-bindings: remoteproc: qcom: adsp: Add
 SDM670 ADSP compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261003175659.23536-5-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 18:05:53 +0000
Message-Id: <20261003180553.E5F651F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: schema bypass due to compatible string in standalon=
e enum
--

commit fe965abba1a50ee3f23c3149e9b465705dc13459
Author: Richard Acayan <mailingradian@gmail.com>

dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible

The commit adds the SDM670 ADSP compatible string to the qcom,adsp binding.
It splits the compatible property into a oneOf block to allow the SDM670
compatible to fallback to SDM845.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml =
b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index 7e8ecae8e6cb6..6cf1f11efe041 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -15,19 +15,26 @@ description:
> =20
>  properties:
>    compatible:
[ ... ]
> +    oneOf:
> +      - enum:
> +          - qcom,msm8226-adsp-pil
[ ... ]
> +          - qcom,sdm660-cdsp-pas
> +          - qcom,sdm670-adsp-pas

[Severity: Medium]
Does adding qcom,sdm670-adsp-pas to this standalone enum branch bypass the
fallback requirement?

Because oneOf only requires a single branch to match, a device tree node
specifying only "qcom,sdm670-adsp-pas" matches this enum branch and passes
schema validation.

This bypasses the fallback enforcement in the items branch below, allowing
DTS nodes to be introduced without the required fallback string. Without
the fallback string, older kernels may fail to probe the device.

> +          - qcom,sdm845-adsp-pas
> +          - qcom,sdm845-cdsp-pas
> +          - qcom,sdm845-slpi-pas
> +
> +      - items:
> +          - enum:
> +              - qcom,sdm670-adsp-pas
> +          - const: qcom,sdm845-adsp-pas
> =20
>    reg:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003175659.2353=
6-1-mailingradian@gmail.com?part=3D4
