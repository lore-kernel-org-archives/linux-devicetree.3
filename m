Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1592EEE91
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782441626; cv=none; b=gYwdVnjjpiy/TmitbSgs1qLFcT/CczueviWr66Wg9IKcrxzwUr7uS/Sse/IqjN6S7Dsute9zzPo7p9efx56wvNur3BqT879p79xFzMv7YEugwmDmjDBeL4aM2pXg1IKoaz6Xwy7m89Gh/CbIwlYInNBMJHjbpbip4T/LOOb5QYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782441626; c=relaxed/simple;
	bh=+yRAJjWfFWlML44jZ18XJNI9O8J39uZJzRFjL/cFQwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HR8mgnwd+VlnFQuQdWrDZ9sxj5osTpSHmjwStH0RI3qjaEh3c2Z+wPPWEDvp/PjQqDrevs2peamLGgIk6OqvcdvpbKGfEucArneX6mRWGdI8F4z/hsF/Cp/QtTSLyJc7tOJOZSTY1S1TlmAR0Kj7v0HU58huNInZSu3Kg7YGs5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHMY7Ek1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHMY7Ek1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207961F000E9;
	Fri, 26 Jun 2026 02:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782441625;
	bh=/PL9oomt3ZKtbciTTHCiSkVGAAkeKkmkCachkGoxpDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gHMY7Ek1vasACjy+K/WHbLK+WY7whExw4CpEDbQ8VxoqqQBySawaA1QMzOUfdhtwt
	 NrO+y/pTEL/ntAc5Im52nAo30hEGvGD6C7qYQzvaEqAtt59txGPoUiHCq5wrB9vge7
	 ktZ6Odq1ScK/+qaDs8QWypJEkFc+6+m6rn5tq2BGFVd7GCLAE0pEeJefMAWq2RJFDv
	 +qnhS1n4KzICvrcl39K7tyk6je1bL8/VOPXTYbKxmc+DtargMeScjrzTBrJrR+OFM7
	 +te3ueBts4i8yFeFdXpXayJZWX1sXiYMj8O4lMOgZctrkmuCmp63vYH2uqPZ+vEcRo
	 oheUzrzS76OTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 9/9] ASoC: es8328: Add DAPM routes from MIC inputs to
 Mic Bias
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <dcf1f8ae4f1f192a1d63e9fe7044b0218119b5eb.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
 <dcf1f8ae4f1f192a1d63e9fe7044b0218119b5eb.1782439646.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 02:40:24 +0000
Message-Id: <20260626024025.207961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardcoding board-specific 'Mic Bias' routes to generic multipurp=
ose input pins in the codec driver violates DAPM architecture and causes a =
power regression.
--

commit 864cdd66179a2d1429284999cab86b202f471e82
Author: Binbin Zhou <zhoubinbin@loongson.cn>

ASoC: es8328: Add DAPM routes from MIC inputs to Mic Bias

This commit adds DAPM routes connecting the ES8328 generic microphone input
pins (LINPUT1/2, RINPUT1/2) directly to the internal Mic Bias generator.
This is intended to ensure proper bias voltage is applied when these pins
are used for microphone recording.

> diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
> index 9838fe42cb6fc..aaa6646ad4c5e 100644
> --- a/sound/soc/codecs/es8328.c
> +++ b/sound/soc/codecs/es8328.c
[ ... ]
> @@ -405,6 +405,11 @@ static const struct snd_soc_dapm_route es8328_dapm_r=
outes[] =3D {
> =20
>  	{ "Mic Bias", NULL, "Mic Bias Gen" },
> =20
> +	{ "LINPUT1", NULL, "Mic Bias" },
> +	{ "RINPUT1", NULL, "Mic Bias" },
> +	{ "LINPUT2", NULL, "Mic Bias" },
> +	{ "RINPUT2", NULL, "Mic Bias" },

[Severity: Medium]
Does adding these unconditional routes in the codec driver violate DAPM
architectural guidelines by hardcoding board-specific external connections?

Since LINPUT1/2 and RINPUT1/2 are generic multipurpose analog inputs that
can be configured as either microphones or line-level inputs, forcing DAPM
to always power the internal Mic Bias generator when these inputs are active
could cause a power regression on boards that use them as Line-In.

Should this external physical connection between a microphone bias pin and =
the
microphone jack be specified in the machine driver's device tree via the
audio-routing property (for example, "Mic Jack", "Mic Bias") instead of bei=
ng
hardcoded globally in the generic codec driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782439646.gi=
t.zhoubinbin@loongson.cn?part=3D9
