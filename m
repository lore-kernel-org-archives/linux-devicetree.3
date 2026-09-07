Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F794E80C4
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788760; cv=none; b=FfxVo5nv2QwZa81U4VL5UNbBwVAvY4T2EqXaVD5SV1AfCGjIzSse1JNrMTGuxoT453jnLq5u551sJdZrdeFn7w5dHdqpXfShoNpLHOvymBX8FIz0GKmbb8sYT4vsPg6r5UUx4DPmPtmriEac7HqLONU8zVRbeRRXA6YAihDNhAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788760; c=relaxed/simple;
	bh=F072WVYbbwavkuXGOrAMh6r/Lml0KYfT4jtwkGsvwqM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QzpkHYSKQBR6rPpHcP0dhL0HrW8YIT9cEYbLvHLEOUfZ5Vknb2wgtqFOHDJKwDkNyPgSH7GxhhRq17f/83rwQ/skW2lvl1CFuBp5CRoz6sLo8QFd/3GLAfLFyYUTv3kK4Pdo8I2kDwLf6jCqT1zV6oqeFEIFyKArkDBwj24xB4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JU2JfC/O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JU2JfC/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B791F00A3A
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788788755;
	bh=09GdrrxqP8hxA4xlT9pQgz3BcddJWV+nZLh9fVqDpiI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JU2JfC/Obo1dJCY/WonqQuvyoBIxnFCgSgjjNNyk2GwbpGkF1W9IsUkQ9K/HFax+m
	 QGryOpaMNqVcPQxavxfOPUw/5Wv+54DsCPCKtoYu9oTrzxaptvKCWjfq/0NED94Api
	 ppCCkyYs1722s0OnT5Z6jfDXy8Un1cXIbm3No2Hg0H1cyalRcZ1ygfdPtLAcjwNi+p
	 W4fYe786/FvtFMHZiWDpnWJ/7QjpGQC0IbRu8SapHe1srwqEnQPU9bx8DIUD+uD118
	 nG4yL4Gmb/kUsX6egYi0gYtDkazrLBCILwwV0eTnBMhOV5N4y3alJUjVpSpdKOPBYi
	 K5cPVYbsWGdnQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a20c95e412so30085431fa.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:45:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxgMSJyzLnqSGsvUE9PT6Kp49cJcySmguRKwCAe1csqPS944zFn7Sn/nscgJ28NB8Rd4/5kkqG7DTn6@vger.kernel.org
X-Gm-Message-State: AFuF++nSrarwo11knWFdKbTuiP7kRdV9OW/3IuNijxDSzjaZnQhc68aa
	IVVvb9TwtPVABeJRVuHSUc/80XFRG0KKMq1MrSTpWBIg9XaIBM563QO2kkIN1rNQ4Lk9ZWzvkkk
	35DDNoxfcKWs418TAkWocq9Ka7ad1DSJdSfaMcSZi4A==
X-Received: by 2002:a2e:bea3:0:b0:3a2:74a:6fcf with SMTP id
 38308e7fff4ca-3a371ae8322mr26023941fa.4.1788788753680; Mon, 07 Sep 2026
 06:45:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Sep 2026 06:45:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Sep 2026 06:45:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260907-b4-shikra_crypto_changse-v6-1-0676f61894b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-1-0676f61894b3@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 06:45:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=MckdJyEvOq73Fi+Q-sr1aoL6QzvHsNq-3k62RSi9sy08A@mail.gmail.com>
X-Gm-Features: AcwNN1UFcAR1_KaMGXfspzHJkPXAon7-UWdEjcMhN-WSomM_t1oqXNANQz_bWZY
Message-ID: <CAMRc=MckdJyEvOq73Fi+Q-sr1aoL6QzvHsNq-3k62RSi9sy08A@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: crypto: Adjust Shikra compatible hierarchy
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sep 2026 14:03:36 +0200, Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> said:
> Shikra reuses the same QCE integration as Agatti and should follow the
> corresponding binding requirements too.
>
> Move the Shikra compatible to the appropriate binding hierarchy
> (matching qcom,qcm2290-qce) to reflect the underlying hardware
> description.
>
> Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index 5a653757ee75..fcf725bfa36b 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -39,6 +39,7 @@ properties:
>                - qcom,msm8996-qce
>                - qcom,qcm2290-qce
>                - qcom,sdm845-qce
> +              - qcom,shikra-qce
>                - qcom,sm6115-qce
>            - const: qcom,ipq4019-qce
>            - const: qcom,qce
> @@ -54,7 +55,6 @@ properties:
>                - qcom,qcs8300-qce
>                - qcom,sa8775p-qce
>                - qcom,sc7280-qce
> -              - qcom,shikra-qce
>                - qcom,sm6350-qce
>                - qcom,sm8250-qce
>                - qcom,sm8350-qce
> @@ -133,6 +133,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,qcm2290-qce
> +              - qcom,shikra-qce
>                - qcom,sm6115-qce
>      then:
>        properties:
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Note: Shikra changes have not been released yet so this doesn't break anything.

Bart
