Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFFF2F8EBE
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237163; cv=none; b=K6+++AS58xmVgOjErsWkB00tUpyMgKTwZEMHNSI+C2CL6asPMvsEmJWJlNAa2zNPweRPyHjrx2Dlls6HY+VrF/0n+ZDIdS0dmnT7Kd4E5lMObM9HtBXWaXtdw6pzIVb80fEi21xhlDkXB7sMkuH/aMZ1f2xnFQpzvbnPCFM1kBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237163; c=relaxed/simple;
	bh=LaqsU+HZ7CHIVovwL8Ig8BXz2wdY0ZmLbnAwBHpQ6qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTICg/f50sPJjXudGBPWvI0x986sQmyj0vToPwxsdj4Sl9ZDdnLmylDD9r+NnBtKZn/ePGqK7MB8vapznwjYm/UfcYrfigrty5aTTLPXo1T7XP1sI849b0l2XrzpB3O+VM7l3zsyrXcqadqlSzhdPxf2BC1OqKNo55tm0rmKDlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRJv0tnX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRJv0tnX"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a86deb4092so139450e87.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778237161; x=1778841961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XafNOw0YwX+rd6WDZaFCoyodLaJfPwidN6Ns/nppWrU=;
        b=RRJv0tnXU5LSm6EpVZB9R5U124dTrSAVbtIgNcuaj44BcvLwpzUZAvIgVW+dmzKoGy
         kJoc9vVoFgYjDuxSAt5e7f0CiGTDLCit/BqgOnacSO2/aUwBiEOeVfjkFIlaN9sVuWBU
         vGoRYjm665rYOUjxtzgDFtcqlZlZKONncSiQfZrqmOrXViikDFoeXCL0QArZVwbHqA/q
         P0L9kC8VydXzIp/XwICBEdwYZe66yXVfNzw9RZhjHbT2+/e6deq+ly0DwJdmjwYFAc+m
         JckYtfMWGgpx6K+ya9q+/IXzHY/Y11DIcRGt2IR0+LEJxi60s2Qwp+O2RkF0c7NixE9w
         Ynzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237161; x=1778841961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XafNOw0YwX+rd6WDZaFCoyodLaJfPwidN6Ns/nppWrU=;
        b=jNGkJSFCqiDGLUZUXQB2if05PiUPLYj8m5zYBXAQ/f05/TXHB1LYX0oeNhcajBKlyg
         c8dQt01vHbxoYLxrHalcURASxm0Wnrk9EybBH3gf7SORu4QMCHzNYGgZB4Onr4EZSQ2H
         tNHigGdLpvpf/NLf6THqeQ9mR5IwPaiXy8CPptumF9G5XDOJ5B9kOMlfw3XRJo3s/766
         gINncOMbg95KKivXR0p5xTeCF88834eQeBXsOVzxLDcluRPRDJZQci6oYZFX+5fYFb0u
         AYNKhNTLhy/cayPH1R/JRQhe/0xz4Vfq74/Y77CtD2VAAweq2XJBXD1e/3QTHbQvNCaq
         +SCg==
X-Forwarded-Encrypted: i=1; AFNElJ8vdti58HbqFpLKsKkQnXRuAH68Jg3D8A1WjaO2MCa8pGK+T/vtdq9mHhxmq48LkxrosZQsUvJeFBzo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkd+9DK6JKRuUP9j0FdxcxVmCVh7HK5xLiNTbHaw3Y5TGXrhLh
	V1FttFJE6i8uVXuEgF2G4ptlJ7d+RwMO6nonwJEZiU/fyVm2ienihg61QO8tPg5yDgI=
X-Gm-Gg: Acq92OE8AsBUN/jt32O3QY5Ffh6ahNLtKbthnDm6bdLg1mqIix7EWZI7OfNv8Q2yjYn
	OjME13/8ANTRtWlomnkf6o8jVNV6NfZS0+rXRC18Rp23rAYZbDi1gac0h6EXJB1VdZaFfvMHhWW
	jxuFG8lydKtH4v3p5I39CLsv8SAH3m/XrTmMJr9t8AUPxPcrChCadrbLzS6hufeTUSY2VOGjkFm
	jWY9kXhNGtf/6slYVDfLC0DLcTmOlnXQft22maE04XUBv4PIso/n/l4F/KHM5nBsiz3kHHb3WNG
	7vD9zfrG/Qfcw45GIAjwVI0ga5KvyBxylnPx2wmZADPXX+Mv9jmyP7iJwrohcufDoP+i0/jGVAV
	M30GxAUWP21yv+olvKsjGtsmqh1Z36fIx9BajiTl/HJPTHpMx7DioecowukAlG37yxXpFP9l61Q
	5cF5Z9sGcAltKYogvcEdGRdgBwUCAjDLhSivHMXnOoiGh5LP4CtOkovuGUZkn2Q+fXbiGPAI0xS
	DNWYQ==
X-Received: by 2002:a05:6512:3d93:b0:5a7:4048:af21 with SMTP id 2adb3069b0e04-5a887ced024mr1959239e87.7.1778237160560;
        Fri, 08 May 2026 03:46:00 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955dfbfsm409718e87.46.2026.05.08.03.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:46:00 -0700 (PDT)
Message-ID: <12d6054c-5f77-4ae1-b8ee-77cec2038693@linaro.org>
Date: Fri, 8 May 2026 13:45:59 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: kaanapali: Add camss node
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <20260508-knp-camera-v1-1-a18e289163fd@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-knp-camera-v1-1-a18e289163fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 11:36, Hangxiang Ma wrote:
> Add node for the Kaanapali camera subsystem.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
