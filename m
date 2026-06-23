Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C84E1547C0
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782196872; cv=none; b=JGAypw0Qjot7SGZ18lVog4JsIK/7Fe7dPEdGl0bEip9+zT9yXr3iI0bIaLkPLnw4VMcJZkf1Z4+pzErK/Sod8iBqLgpF/hLJHa9zyUSs5VlUnH58Xh8s7758APPS/3Rti5l18F+XhRikYsCA2nbnoSY9uwXvYxaYecQerriM3j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782196872; c=relaxed/simple;
	bh=Kl6fDb8nMLegJK1M2zOllTyeaPaukBF3EDgG5U3Qj0A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iRg/N/+pggfhtzd8QQzi3q+qc0S32iFAJgOc67rI+XMkuOtbRwzZwa9OCq5sJskFSOGP82gfZBZhl7KFGsuXxJ6G83eowNhG5rjs76EHlkWAd2XoLSs8fAHF0pJCCitPayS1bnQFuYQ9dnoTy65zt37Wu3y0wvBPQRDLzMbr+PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HHjJt0Vw; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HHjJt0Vw"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-697cd68d7adso2067855a12.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782196869; x=1782801669; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zD8Tb/E+kGWpnoDfwo14I4a+o1/b1jYnhYlX9w1IRw=;
        b=HHjJt0VwHvElmLshy+LSpvb7s/OSqn7bbI/VVZ5Ybk8TWRVCfI1l/uMgUZ++ftNPsX
         dNds1TUvD+C+srvZEZTAb3cx6LDpag4n0/Fmp7X1FhPFAETTCuwtUE/UXABhNKwbU4vd
         m1h9c5CBcFvbKG1Qf/jXzwSpO3IXMdDCHVPyJvfLSFpEBN8bBwuNVMWQduDut5J8s7yR
         IoGeg8zg/HcyFiH4cKpjIGgyI36JoXiL7PHX/rSQ419FYO5dnw22XYWbFMeUhfSL0gZu
         f+Ha7LVgB0/dgirY3fedSxhJHL0l2pa3yHcQCEDgQFFb+9prtErjCEZM4k7b2UkMS7+a
         sNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782196869; x=1782801669;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zD8Tb/E+kGWpnoDfwo14I4a+o1/b1jYnhYlX9w1IRw=;
        b=rShA8iciUx6jVSy4P78MuC7+THn0GHjakQvBtsTxZAYVTkMLisA+jgFqaBuScQJObM
         J1KZDslpC0xyAFFaJOxZcz2IfN01UqOlY//PgsJWUY6foSjhudHGbDMsHxpolWtiBkZb
         qhlBGFCprD24oIEgxrXgo18Mu5uExlltUzFZaoxVpChfksQwXTSPSAVyaWWRoJ10P+b7
         Oyf21yhFjKmYsvZIovgke/a+q6gLkRJi8ZHDpbFXsUEc2xkd/8lO8y309ui9W1nEoVaQ
         0mes+l8TCM/rCR5KjvljjtPX9Ciz0ungSHWppY9vjgXzkuoGKwx5SdTBc286aGBTEu79
         a9Rg==
X-Forwarded-Encrypted: i=1; AFNElJ+AlFwV620HbneJsb8Lc+fqCfSB9Ksbes2tKYlVDbyMm9vDOxbjb8pI/cA9JfknSuLp7jHW7jXhUsBr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2tsYPDbNRzU0CCJ09zKu1r2Qb0BHzgLQr+qL+GrVteLTuA8xt
	Z/s0irWagN7c3krcFIO04IU34+zn3eMegnnIkGnUe1+lJo+ORzlVhm5cGzdDKiyGR4I=
X-Gm-Gg: AfdE7cnrow2/paMWEZfvqszZy3T1muileyoqjO25hLG56zZbWtXbGrP54+tU8kBcx2U
	sUWH9D4WCDit9NvvG28UGgZcVgZ3jIzh6GvbJtluBPU5wYGwBuupdx6WwvZpVxPzqwdnYjjgvH+
	kKw+emDU8OIAho5E4TSGYFqTG0gyBjqADA9LggtNtUm6XRAWVPc9L2hqXyO54InyAQ2O/4L4J/a
	2+kyxCAKzqJWRFbKYdPBZVFbn8Yb1Zs5RencgbqfeG9vJHhR3GkU44npCjJAA9uDAAY94hr+QIB
	Y7lNmo1Vg1PvDhRloYZnfR52FuKvsAIPPncbqeMhMTZwI67Xp1bH/PC+33qbWZ8Zw86+RUqdqoF
	TjTDghE9DSreP9iPIV3onPBi1DFHk/PayZuLzeuPscHPXgDaKW9pWl+f0UsGZXlMgrqJHsx1jQg
	44ibzshOn4c50qt1YjcNZhpdxU2BXXPzrv5U/43MTA2Gxr/laXY4Cv6lkWbeynmvm8UuLJb8pQs
	67QKEH30AQzk51Taw59eCW+9g==
X-Received: by 2002:a17:907:25cd:b0:c00:de33:a74f with SMTP id a640c23a62f3a-c107efc1f86mr63377966b.25.1782196869474;
        Mon, 22 Jun 2026 23:41:09 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac9406sm462110966b.38.2026.06.22.23.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 08:41:08 +0200
Message-Id: <DJG82APM4N9N.82THXPQ5MIE5@fairphone.com>
Cc: <mchehab@kernel.org>, <bod@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder
 binding
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>,
 <linux-media@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>

Hi Atanas,

On Fri Jun 12, 2026 at 9:44 PM CEST, Atanas Filipov wrote:
> Add device-tree binding for the standalone Qualcomm JPEG encoder
> hardware block (separate from CAMSS media pipelines).
>
> Document required resources briefly and scope initial support to
> currently used compatibles in this series, including SM8250,
> QCM6490, and SM8550 class platforms.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-enc=
oder.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.ya=
ml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 000000000000..83f19719a869
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
> +  - Hariram Purushothaman <hariramp@quicinc.com>
> +
> +description: |
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm =
SoCs.
> +
> +  The JPEG hardware IP version 4.2.0 is shared across SM8250, QCM6490, S=
M8550
> +  and related derivatives.  Platforms based on the SM8550 register layou=
t and
> +  interrupt wiring can reuse the qcom,sm8550-jenc fallback compatible, p=
rovided
> +  the correct register base address and IOMMU stream IDs are supplied in=
 the
> +  DTS node.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: qcom,sm8250-jenc
> +      - items:
> +          - enum:
> +              - qcom,qcm6490-jenc

Any reason why here and in other places you specifically reference
qcm6490 instead of sc7280 which is what essentially any other compatible
and files for Kodiak is named after? It makes it sound like this is not
applicable to SC7280/SM7325 and *specific* to QCM6490 inside the Kodiak
family.

I supposed qcom,kodiak-jenc could also work but not sure we should
change up the naming scheme halfway.

Regards
Luca
