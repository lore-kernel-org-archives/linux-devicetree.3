Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6762F3C10
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236856; cv=none; b=KhCWieHBgEEYyJ1c1bcIwQD9IMjQtuqYy3X0FMznN6lLWbh1t40jOaSG4OnZ4Yw8/BKoia3i9h61jY8l0jttmPIEZBa4MqTfpmNuWmvcETekjcr+Jxrk6htCmhpNBK90bcxAd248Ls1hvEGtXWxgW9Qv77+X8Vy5iiRdHiv5c08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236856; c=relaxed/simple;
	bh=a3lizhhXI1MG3yfM1RiHnRP8myZIypv9M2m67o913yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=et5JRdvoz+pSqmUEaSsYYsQNmh3tP7JTtpBLdSZR9+a6SoHDEpZEorkxZzWdsWDRkxXKKVmOmjM5n9rQkl+o6PKpX+cjvSCr0R6qrunE/XSWnCo2hJNHI9dYfOmUxXk8t9gvWsF4jA2P7U2orWFk9VlLVBOqM+RFjawYaLuNDiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KXP8nR4H; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXP8nR4H"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-393933b8c6dso2619441fa.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778236851; x=1778841651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEkF3pc9bhfhCarf9YxEykAlIQMDnou3BooF7anlTP8=;
        b=KXP8nR4HJOK+h0PfJrwU2lJVPMGIhwrcZehGSmceJrktvSzO68PRNahBuufWl3X3sw
         BGq6xhqRc5c4bF6J9QOf7Vs0syLf+/a1KKuvUuytpN/f4GegsPtOVKBq12ZQFJYdsww4
         +IuE8bShCBFiY+bb9mbNOKqWRT7CJ92xw9jFjIsS6BCFEd9/bczSYANk8MhFn4X2vPPK
         cSNL/0QRcjNYSf6VggNoD5ghyMI7k5V3n19MUgRpOOfYbnHObls4SyQeCuZh6Lk3QgpB
         h0kew+w3w9TyDwl99SaIzvgKgV0SYZ0C84ft7O2FhxMSWZB2J8NCK52IVTZJ1Q6mQBeP
         /45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236851; x=1778841651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEkF3pc9bhfhCarf9YxEykAlIQMDnou3BooF7anlTP8=;
        b=g3Pz/tW0JoeG9ZIB1PRJP9jLLgDf5Kb4wDNuNIriIrBRGWZpBu7xmPcYwKgPJhPMlZ
         ccAcn1RNyIjyKwJ8CHlsPJWPLFFlrx1Qadbf99GrBTytjRn6EGSa076swdLL+wkcWP05
         2B24/QZ3ilKmePnNfAVqmOnH1+6lurn8t9krrkTnqhPjMNJDEk3UY9/7zxWwcEkQnZqX
         0dlENGithcjmnLcVzqyvZlEd4e85vB5AHY0qypVWo2zXF+GmmA8Mxpb+wNuSLIzsqrlN
         cbDe0NW6ZjoivUIS5YKKAQ12t7m/eWubKITRIwd4rqnALoo7b6Bx4YRZCZ4MBSpeqVr1
         4lcg==
X-Forwarded-Encrypted: i=1; AFNElJ+6hNLAXCVZc2GO4PTuDc51Ih6EwXZSEKlM2CyxduoO2N1IbAdXEFqaWBaBGCE00axe0rxpfwtxwlRy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59/VFk9hx29Tcs5vpLYMvv6DkuCuX/vKaWrvyFGvCYjKbeGit
	Yz6coZuOpgqRHx/gNtzJ6KG6JE6GSxvnqyMMsZP7GhRRdgy4TYkwkGP8OoFEBqAfaCE=
X-Gm-Gg: Acq92OEpSbJWg7sQligWZqXJVHKNqRchCgjNNIN8CW1+Hc7/cdNvk74pzpAcb6LCeDe
	2chitsukvYJQwkLVPEW28LrfC3Ls06491jE/pitwR2cGMTnEtlqnZE1Rok647UUmpnfurlX/s7w
	SfQN2qWj0ofyWxEGSl02nOijXXwKDTIW19WZDR0pzUawmZRwp1EEMP3eTr7Ix1QanUe4bwaFw9o
	FRYI+4jctiuIyed4lwdYH/uuw85B37k0JUaoiimlrcGQg+fbkaeotS1oC1hE05DsV/7NL+1ln4N
	tIojcVUABFxEum2/qceD3z4PvxTuHVQSF6IS/fHgmcGwZffzvXVgX7ZfYNMPhhULMRKqieq6+Pv
	DLt6if7wz5i17LhzOX2Y/4gO4KDFkhCts1DYvkicktEo5dOdmLfLAJcwzroPL2pgqZ8BMCA9A9T
	OrdwrOJi/pxA0IPAX1uHEYXip47TyZc7FYIop47LpzKiU0EE1Jv6RPkV4Fr9xcbX0fwZQ9lIWo8
	vGvYQ==
X-Received: by 2002:a05:6512:3e0a:b0:5a4:a67:fb6c with SMTP id 2adb3069b0e04-5a88853f56cmr2037006e87.5.1778236851277;
        Fri, 08 May 2026 03:40:51 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d2cfsm418262e87.25.2026.05.08.03.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:40:50 -0700 (PDT)
Message-ID: <4c6dc418-a778-4e14-a57c-249c8350875c@linaro.org>
Date: Fri, 8 May 2026 13:40:41 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <20260508-knp-camera-v1-3-a18e289163fd@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-knp-camera-v1-3-a18e289163fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 11:36, Hangxiang Ma wrote:
> Define pinctrl definitions to enable camera master clocks on Kaanapali.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
