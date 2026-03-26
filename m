Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E245C3988E4
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774528481; cv=pass; b=GyK9nMvmgcX06AjyWTMAdOLMKdD9xzacYpY3blkqM/4xf/RWjISr6RpSK10EKAIBy21pTPGk8F+qTflt8ZgjiyyRvx//sP89etcr24CATd1rmYzZPqUh6edYzYULHlp7s0gi5wqrRC52agh3aU2IWWL05cK8EUVURaRNCe55puU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774528481; c=relaxed/simple;
	bh=L+4+cBfFgjRVu3c6cuK68SoH4vuUvAH87VW8dhUcjhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmCVfldHjDI7Pf0UgTGThaCcbLS9gIaH+KwKPyaPRt5MmmLrlnW+700aUtcHEVfqpfW+zvMUI2qLRfjL8otKPhWpCMt2ZDbUIwQDXqxihvSEFk1lEQ/d0znB57j8tJ2lXjJG0VNQxlq6aAut516hw9pJ2Hm5iS7kz2DtJaLqqPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CYD/O+9j; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYD/O+9j"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a298acb395so1246847e87.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528478; cv=none;
        d=google.com; s=arc-20240605;
        b=dku8D1wx76gu9WulmKYh2vxxBH55rzY2un1hf7rsGDM9D2At9HekOqwCzCLLlgLe72
         vvfgE0NZg9UN1T3Og6BCcc4++zeONoYfIj90Z5yLXZeu5qLlMdu/sC+jjLIOFlN3xTgQ
         0Q39JqD4BNpfVcsKgmziK3XUIqTvgOifkfJzaL4GSj0DEJeQ3Os/aT7XunPYdtBtqtQ/
         wtcRy604C37TmU7/BE/6R9BL8TCaRj9ptP94dzQqTXve9qCf5Te83+9NEurdmZ1RNOLK
         Hm0PLxjJEKdS0EdiEz2kszDH/QBtU9Ue6x8aRqk+UE8URgAJYDXtrNJ8kNzO7IJkjR23
         MuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=whbb87R02VpuWnrdM86dwQGbuC6f1dMRJ8XJxXPbpSk=;
        fh=rzxZh60TY4HgO66r5CkAcTUYE2C6HaVranrBWyzeNP0=;
        b=jZ5nk45cgd5DyYv1XhsXsvQ/h/mgEZTSh1naV6IjvvrOZbw1a/y7bz3dYHpsK+E+XI
         Cp6cfakh8OYxpoz7x/cmsAD0501jM/ao+832OfzvbHH21n5LAPsiP1oISbCBpdW+pDY+
         itezzeOOLjq1KVMh0moc544AuFRA9KcKrWQwZ/SQOvNITRYWO/QifDmIZHa2U7x/8ICO
         IspkjMMl4Gc85lkXlBVtlL0UIpNQjDdfGRV4MDE4ATvQYh1EuyF5t7clmATPkp09cX3w
         Psdmewp3bj/zeuGsuPl+cKQYJ7Jxap7Fd0+bgyDIENnpPS2+k7aJoJ0lu9FSrtU3MSz2
         xBwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774528478; x=1775133278; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=whbb87R02VpuWnrdM86dwQGbuC6f1dMRJ8XJxXPbpSk=;
        b=CYD/O+9j3q3h0pAFEM9o3a5mk51M6+0GVZEEeJ52Usbq42iXsEY/sLSKyrrvOPuoJe
         8T5vzjEy8CeioOqyOVxCTrnHcxbVvfB9a69XVmv3fh+Eo06wWAOge9YjVq3Cu0craXjU
         Nk9RNoJQU1DpRBwA/CJRfX+Px6gRz/MFHWM+RQ/d/yL5dpTC9UsARnsRPYNEBWPJ7Abg
         XDda7/uHEuxBbnqq7SSxc193N2kA5tDCijFWQowpEWyGCmTW7IpVNlJOqv5wfq240rOX
         KbRWyAMO6dqSHWheji+RSKuSJg2or/EuW/nj0OKqbhYIC3CCdRHwIIqZJjhq/Xtab8JB
         evOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528478; x=1775133278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whbb87R02VpuWnrdM86dwQGbuC6f1dMRJ8XJxXPbpSk=;
        b=U4T0k3I6Udyq0q0fBRYO0oTIa+9jz0VOdA1dOs/v39cztDAjde2wWx/bhCBPb+yPAl
         lG8mcT5lOjlBXDZ0l1QW7BBG6yDbD5urh2gOrtTmSYtR28ulM8G+x2CyKLkno0EU2Of1
         +OsXCNsR8VxMHE2xW1ssYkcje9L0D3RuYSOpmyZQjf/W6KQECk1NqG6XCty1K2rK5Y8d
         uch/92P3CUYjbq+ahFcG2VsMx92UaUXrC4bzOgeDlZwOrEZeUyAfYmOezjqHawp9pehL
         siPmEtGizqTZcIwqWeFE8OouAMf8Fh4VplyVkd19N/4MZL/4OWHyhfQNI7Wabwjq1Gia
         RDTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwC0kbc+E5BNIa/jfngFO+xwVLZbgEMjv8gVNQ6YxL+7OB2doR4thxGs4/IzIWa+FUM8YegIaVx3Uv@vger.kernel.org
X-Gm-Message-State: AOJu0YxR2J3X4L7LiSZdHptKK4HLq+HcAgNkj+MFLdgDp5QNPW83+2FO
	xVW1KmL2MhIN5t3Ckegon2acpOVSYAHQDhvu2Aqyu7PzKWV34eWcd3zUNvmHLisYsgu1AikjPev
	EADphsGB2trNSQwDAMM7tvD/XXjCv1XXRlcVLC9Qbmw==
X-Gm-Gg: ATEYQzwUhe2aVOd43fZQbujP2pAoADROWQxux1sy9WJFemvLGV8pwqgXb+ZEdbucy8t
	wzYqJhhSXDobNZZ07bQjJR616ryXn0bLjKRSs3LfdzHvizgobGSSMxUFMiCybRXQ9G7Fsz4/sTI
	kATtA4JJ+aMmTVTL1lYfNktzzxHJi43ffv1/fB33MhcH+USTNuFYv274OgI+0hk1OcUtSgyJMx4
	dRBuqSmArVdTLP6+ZfojGQG60YI9iCNTr9EH1SgJ/R11YEhqLFYLsGu8/S27pWHty11Jkb+U0cN
	ENlN0N4=
X-Received: by 2002:a05:6512:224c:b0:5a2:a568:65dc with SMTP id
 2adb3069b0e04-5a2a5686674mr633975e87.29.1774528478029; Thu, 26 Mar 2026
 05:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325-ipq9650_sdhc-v1-1-53cf7ba11087@oss.qualcomm.com>
In-Reply-To: <20260325-ipq9650_sdhc-v1-1-53cf7ba11087@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2026 13:34:02 +0100
X-Gm-Features: AQROBzARZ36FCtAuNnlkbnt6Q97KUANYiNkFWS4I0NgJYn-2Ep_TtXNHwsftZn8
Message-ID: <CAPDyKFpRqE43N8S5ndpv4EG+hpvLCPrnC_i41TATTGnTYTjpOA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: sdhci-msm: add IPQ9650 compatible
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Mar 2026 at 12:40, Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
> The IPQ9650 supports eMMC with an SDHCI controller. Add the appropriate
> compatible to the documentation.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index fd1d5b04e755..695a95e8f35d 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -43,6 +43,7 @@ properties:
>                - qcom,ipq5424-sdhci
>                - qcom,ipq6018-sdhci
>                - qcom,ipq9574-sdhci
> +              - qcom,ipq9650-sdhci
>                - qcom,kaanapali-sdhci
>                - qcom,milos-sdhci
>                - qcom,qcm2290-sdhci
>
> ---
> base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
> change-id: 20260325-ipq9650_sdhc-9b75ee9ed5ca
>
> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
