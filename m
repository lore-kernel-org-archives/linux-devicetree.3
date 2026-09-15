Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F6A3C1D65
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483031; cv=pass; b=Jt03Jb1yp93TLw97vqlF3PDrOqS+raq+4ONB1vIOKxvbETrQC/jKJDbpMxV2KJxYmeUopI2wj8Rpt6P4nLwfmgq5Tfn/QDUjqWn2QMSItlYb18k26ZObBRemdTGAzSh1GhEQ2wZ2tznOtUv7YugNb8eLPCiaHpbstljmnUlcQGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483031; c=relaxed/simple;
	bh=s9zHSd0QhzvZUu3ozdcfCjxb9AQPmCffjwKW+F9l7K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+DzrRFBVKK9r3Eu18drfdlaG6tcCyQ0eQS6yZ2XCqZuWYIkr9RUx1TUomB6wjJEqPp07L4mNVVS4nufgVjZTMIeq1/QZ6wcoV/J5EPJ2MzgjW6J+OpoV+687i0Dm36wq8vMgsthvUwIyx3RzC1D3r1DIlOK9hvnY+nQiqHek6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfz715TX; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfz715TX"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9c0cd47bbso5282894a12.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483028; cv=none;
        d=google.com; s=arc-20260327;
        b=J7i6Md69vTIBLB2nddR/hX9xEjxhi5PpqhBl5dERT+vOWldkcn7npN2Dgw7l1js2hC
         I1DgJArCpNI41aNdZigCCTO50wZNp/ga9WdnpFyb4M02R9eZRiXoD6zTVyMXyWa607ij
         b4iwTawl7MmnIlk0K7Mav68gxML9L7vrDCOO8zR5AhOpCFMi5fg0+fo5PDlfW9W6Fazv
         xPe3ygIUh62hMdI2ofGL68ThCIG47XIP5/SajiJgFjfaD1vjZ346bt61NWOhbTN2BWMc
         oKxgKnMAfjOcbHdS+9Kdkz1PIGcz312T15H4R59jOCTU43cIUOZJwpt1dHRo3i4szDni
         Zf2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        fh=Bc2H4uH9sItIWSjhCQGfcnMqC1RJdwXLRmbPvcrpB1k=;
        b=HM15RXBwDVN67yMUzFibdbul5cQqLuFRN3SzL5JATVHJrI1TLcu/yXERsKAh9f+/Dl
         1CQTrw9Vf4rbRWzYLLg5CcYCatuF0YX1nzeU8pgYBLO8inTm03Y7zHDJgyeXQZYzoEtB
         QO7LKdo+dLRXhWuYrHzLFtD2Sf3622QmFnUe9Fcw5z++G9v64ahDPxJcRqirSuU779Vm
         P8mFUZF9FnTOd1vS0XSqa9YOKobNAtwMHiHyTp0yELOWVI5FSJGOKAGIxDex3SNoO2Zj
         dVDhOcECDK7WsfJF0rJKs+7o6cXXY8HPsXbvpCcgRFzmSROmUNi/h5ak1tmeAmH/08Gd
         Mfig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483028; x=1790087828; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        b=zfz715TXNoXEV9KaE3Aaj/3yTGBhUmh2AosnAcRP3TcD3JDi7lUcg3gQpW4mFVOjNB
         iYJyjdB7oPf08lCBQmz9tLR40AIGJP3cGrX93fbToI5O0rFxf1L0UZNVgy3mmMpHIwAT
         WvUYcil2fwHN+758ozC9LK4mg3W5vRTSVTNMdff5BSdwoQrpOvCtgPdCpqizJ9efC3Aq
         tRj4QczYOIMq/COov+mQ8au+EYGGxz5QC5oLz4vvxSGWUzmxrQPVsyzqLFGSg4/dSK/v
         PsrPZzmNvZ0UYYu3RKtT2YWTe8SzZ5FgsfxWm+HokKMCiO7mPXu+yoKa30Hhxqe0wqt9
         6P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483028; x=1790087828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D77DzhDZ72+rZ/B0lquPWAieMQAEtWanQKfhdNjgaGs=;
        b=K6Ev/B7c529SCzH2KD7gL6/g1+Nu8tBkXQ4CQMWsiIEldOg1OZtuwwyN1wNwscbhKr
         sEJ8VDNGiN13NH2kUiCTfCm6XY3q6+Ys9nTrT0Fr6nfzBxP1nUSK4EsgCeyo3oHF42S1
         kkdmsDzhByfv7lhb7pG9PIZWK1knLo8lbJZrEDQpLZvJqaGvTRGUPBhevhD1v3sDJ3eY
         l/FmjFUsHJkvFsPHs+fEfs1uhsD2P1Fs7wPntUVG54CpV74Kh/haPlGpEhoXjDayt1X3
         AJLwkAWJ/UvRXughPaRgh4DAcnf9fWoGVYxQPjQybNuU17RcxAsKgHa3agBF7Gp6/5Qc
         Pt3g==
X-Forwarded-Encrypted: i=1; AKwUvBxISLZNEKKT7dbOCN1wwetJ8H/HW/3YIsRn0drWjE0+yEdBQ46ipB6DlYEugPAMx/8YrbpbO0+Hy0gJ@vger.kernel.org
X-Gm-Message-State: AFuF++kIasL67ZT/Usu/Kw0b2eAWhJyIf5/ewCLT7KU/4t3HedWbsym0
	doNrudWnQMAWQD9rkqJWlEHPC1Kuul/U9A+efp7b97eD1Z0dW1RX/KUHSGdeUN9Q8wqemkrbzKS
	8whvXtdX0+xzfCB1ZGj9538E3aziRFEpOLA6fnbwt0g==
X-Gm-Gg: AYBFou3KyeT7gNHgM9v3DKvRXs3FBccUVwqof16cVzczVW8+dHinUuDwe14R+OuzK+F
	YDbAAZ2Bl2K+jIvUGFAskC3seUSHOW8LR6rU4nHIVT8/r6VDlbFGWQ1wYNVQSj/F/3P5k6X91/O
	oMzW7iVlS60oJiJiqsEzCFLrLBIRjwCOAscbIoxz2flf8qcbX9rWQMlmW2+kXaHe5qHvBUdp6wu
	7vJF3+Tz8rnBJ+N/tJN8J30wYnQHT/y7G/5OQsBtR74km32FoJBuvxY3rilVJ+aprG2OPfle++H
	3KgtxmKrncgGzVEyyIgEyBXctkaDwnr18aZkdz7GNoYBRZKzl4VgUVBi5ySVh2YhFo6tNQ+kSJC
	sbRB8sLoEqNc27Q==
X-Received: by 2002:a05:6402:321f:b0:6a6:32fa:54f4 with SMTP id
 4fb4d7f45d1cf-6a9f62147e2mr5365012a12.19.1789483028305; Tue, 15 Sep 2026
 07:37:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913123740.203698-1-tturner@lineageos.org> <20260913123740.203698-2-tturner@lineageos.org>
In-Reply-To: <20260913123740.203698-2-tturner@lineageos.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:36:56 +0100
X-Gm-Features: AcwNN1UA7ww0ycDC66g2CaA2kAQpsW144jRswzivDAFwsftYfjODQouGwyp4baQ
Message-ID: <CADrjBPoud7_Bn-BgMX4+MTOyk9Un8M1B-nR1RX3SO3avBqv4GQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for
 Samsung Galaxy A21s (SM-A217F)
To: Thomas Turner <tturner@lineageos.org>
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas_turner@talktalk.net, alexey.klimov@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 13:37, Thomas Turner <tturner@lineageos.org> wrote:
>
> Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
> based on the Samsung Exynos850 SoC.
>
> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Changes in v2:
>  - Sort via alphabetical order
>
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 753b3ba1b607..021250497da9 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -232,6 +232,7 @@ properties:
>        - description: Exynos850 based boards
>          items:
>            - enum:
> +              - samsung,a217f                   # Samsung Galaxy A21s (SM-A217F)
>                - winlink,e850-96                 # WinLink E850-96
>            - const: samsung,exynos850
>
> --
> 2.47.3
>
