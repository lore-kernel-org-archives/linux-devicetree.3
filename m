Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFD44734D9
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788805263; cv=none; b=e9JBzKGR08jYASbrf2558UJ7hwxcWza9305iqRPZzrrAVBRpm8cQvu3IAkIZMLPQyy2ERTAKZaDcqw3ZXHaKbFliC53gmo2PAVil9ZNc5fMiSyVAZ9vPrNg/nG2Yn8wGIwVZPpWCSZsSqpBe99TPqWBZIdN+Xz7f1Bh9fH3Jdv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788805263; c=relaxed/simple;
	bh=JPBmu+VKCYvoWumv4nqFnIu8Z1qq9RWdxTPp7qsik+w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cS98VSjajvr+ofkzlTjN6jbDifLQ2Q6kKQRaZTeJmvFNprhsxrKo2n4LXla2+xGyqchapdPxPmc8CYFXW7dYNGiIEElA7/mfy0oobUTsxYy9xRqk0mCBb7zp3pl2JSDKyOrGn/MObV0UHvqLb6Hz0fvPu0RBYzbEpcyj8rmP47g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khDsTyFA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khDsTyFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA1F1F00A3A;
	Mon,  7 Sep 2026 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788805249;
	bh=06hpguzDnEIukFrX5ipD+5qtiVJC4W69wWzVWRbw56M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=khDsTyFA/RWgAQZQdGQF7kJZWtbAmoG27pFV66jl1kNnbDi5siKKRQnjecXNrr4NP
	 T2WnacBQbo1QWtedeTMyaFHmJcwA9q2UxTh0wE0Atl6ZifLAMKCzZRDbpIvs3Iuq+j
	 WSY37fQcg9iK3mZIWD0dN21zbBmua1nAPW9bD/+exNaKURxRjy32HciODmOoIF4LKS
	 SYFRwdgG0AjBMJlGOYvMcxUdTpb2U2XkJg6v04/gK/o6EsA9ultiwxoDxjZE7Oz2/T
	 dxaoxrJEu0borKzEupuyu1STTjttd1opekP1VVdZOuIUoB8d/RtWYvHKtnf9lBKb6w
	 9y1GEGZCBNK2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord Ride
 sound card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 18:20:48 +0000
Message-Id: <20260907182049.6DA1F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Casting `clk_disable_unprepare` to `(void (*)(void *))` causes a C=
ontrol Flow Integrity (CFI) violation when the cleanup action is executed.
--

commit a3caa5181a58d82be436be2044f000032a4ea1ab
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: dt-bindings: qcom,sm8250: Add Nord Ride sound card
   =20
Document the bindings for the Qualcomm Nord Ride board specific sound card.
The bindings are the same as for other newer Qualcomm ADSP sound cards, thus
keep them in existing qcom,sm8250.yaml file.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/D=
ocumentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 1536fcd96d687..bdbaa8c822fcd 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -38,6 +38,7 @@ properties:
>            - fairphone,fp5-sndcard
>            - qcom,apq8096-sndcard
>            - qcom,glymur-sndcard
> +          - qcom,nord-ride-sndcard
>            - qcom,qcm6490-idp-sndcard
>            - qcom,qcs615-sndcard
>            - qcom,qcs6490-rb3gen2-sndcard

[Severity: High]
Does casting clk_disable_unprepare to (void (*)(void *)) cause a Control Fl=
ow
Integrity (CFI) violation when the cleanup action is executed?

Looking at pcm1681_i2c_probe() in sound/soc/codecs/pcm1681.c:

sound/soc/codecs/pcm1681.c:pcm1681_i2c_probe() {
    ...
	ret =3D devm_add_action_or_reset(&client->dev,
				       (void (*)(void *))clk_disable_unprepare,
				       priv->sclk);
    ...
}

Because clk_disable_unprepare() takes a struct clk *, casting it to
void (*)(void *) and registering it as a devm action means the type hashes
will not match on kernels built with CONFIG_CFI_CLANG.

When the device is unbound (which can happen naturally if a subsequent step
in the probe path fails, or by an administrator via sysfs), the devres
cleanup indirectly calls this action. Can this trigger a CFI panic during
cleanup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-nord-asoc-=
driver-support-v1-0-997d3b20cf43@oss.qualcomm.com?part=3D4
