Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2225642E8E7
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213391; cv=none; b=q3+M/Az3Y6U5QUoDxiBHytq1X8M2Atp3Edxu9Bn/pN+9N4T/PrecgZF0kRDlFyfsPt1WbA6az7+IEKYISV8vQIqygrMNynlZXyOl6Ty+f8lNVPVyHQnGnWV4rDda4JkwThy3Z8SH6wgYcEUx4tV12/k9uinVFs6nHY8veZke8yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213391; c=relaxed/simple;
	bh=A8omiOrzIneChK7Z4hBrVONUy/wwmjJ9JQDv5GOvpus=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsNx+G+4QQkOwwApBDF5sDjt9Cl3+BtDAOcergQKLaj9RkdRZiJ7vHHzv0VcE21wPSHIWjZpq65Dlor6eaJn9xAwEbLyIMlSJXNjxLWyDZpWcyS2QT55ksovpJO+TNwqkvlvUon0qp2fWBMN+9VOJ7obXwFUG4fCwEGRUS4IyOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izXSsCbU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izXSsCbU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90EA1F00AC4
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784213389;
	bh=0ZyxegXh9SghFaz+yYbYnHQqtvetyhgfvDvPkgba2Kw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=izXSsCbU6UgaNJXI7JE/2yGpX4EL7MemPM12te1Pn+AglhZWKp0beKJQUB2XCYoTp
	 rIsTIC4AeTSLQ4Ugy0rKnjDbDxpAauyemYh1jaB4pvyDe1mcX268Ov8t63I3myrGi8
	 BUbCvKGpZ9fHFIj+tlTGiMP1RxBRbg9263MhqYs0xQokpUuxFhINi8DF+xBcP6lG8z
	 YLd2m1VJGxxHtGFv1Nj5cJNQsywNapPMN43vDELlgApEL5xrMabXRhPNwGZWxNLYyL
	 vWxjjxZFti8GfqqeZPG4YfsTJ1j4aZfSJqOL9QnyURJm8RxZ2fGnk6tJ36IPBZjc77
	 uAhisJZNQIGMw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so5090063e87.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrMvOwXRKytQnh58iZm6/POWi4geJy8UWR3wAl2ILxa4EZrySso9vpS2sbrJ5ml2sUKQQ5xGb1Nf7PX@vger.kernel.org
X-Gm-Message-State: AOJu0YzUzVa8Ee3o3E4STR5KOZVUe7I738ovkpTHG+FfB9V+eTyVp5Vk
	J9tYBwi3OSiNZ/DwLrg+a2yr7vYXIdzWZFpLjHMREVQBOVRBtLaSr1R1wrz1Y//BKlEhgJZDirU
	l7Pic9FiLrZEtlM6oFpSfatQubKXipYTkoaA1T8gwQQ==
X-Received: by 2002:ac2:4e05:0:b0:5b2:8c8d:5ee with SMTP id
 2adb3069b0e04-5b28c8d06e0mr347456e87.48.1784213388518; Thu, 16 Jul 2026
 07:49:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 07:49:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 07:49:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260716142605.2398433-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com> <20260716142605.2398433-5-shengchao.guo@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 07:49:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfugz33hRuhGYDcka1+px7q5m6Kfo9HyLxiv1K5s028Gg@mail.gmail.com>
X-Gm-Features: AUfX_mx6Z2cnegmdTpUxqzADNkqzjnPDRgXzazKBil78ZEh67oKaSYo4pqmtSuE
Message-ID: <CAMRc=Mfugz33hRuhGYDcka1+px7q5m6Kfo9HyLxiv1K5s028Gg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] dt-bindings: arm: qcom: Document Nord reference boards
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 16:25:59 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Nord is a new generation of SoC series from Qualcomm which includes
> SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
> Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index bd184f062ec0..7ca4e75ea09f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -396,6 +396,12 @@ properties:
>                - xiaomi,sagit
>            - const: qcom,msm8998
>
> +      - items:
> +          - enum:
> +              - qcom,iq10-rrd
> +              - qcom,sa8797p-ride
> +          - const: qcom,nord
> +
>        - description: Qualcomm Technologies, Inc. Robotics RB1
>          items:
>            - enum:
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
