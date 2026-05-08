Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345883451B5
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237080; cv=none; b=nT/3sHv1xks7mY2JNLdWQA4hbtnBcEVFYZiSCkM+4XkUdb4TVOQiYk/LJ3aq4w08bWBIKptDKq8eFxZqtxHAtQYzxcseC6x0CNtJU6IROXiZlDTecS9m4DuUKIq5YuMRfVuIlWIyDVzuY812N02BvzJTgoKmLubSG9wt9WN3Ryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237080; c=relaxed/simple;
	bh=0bx3yKXhPMK4J1zq8iXEQSWVFgnCPO0orgXPyudyoOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=snFgNwXVqVProAs3buZitkXdsabmFHVKStd+l//W7kI+7xLxtt3ZGaFovKvwubJAbNflW8orqfg1paEI8c01/ssCl+r2PpyBgw/UVXoaLZYQQDZPOPglUWR37QM1fNJJKOPZ5qdTBI2fLCDz3JiQhPiCUDWU+xmuxs+wCNAbObY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H01ZnAi8; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H01ZnAi8"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a3ffd11fa2so94975e87.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778237077; x=1778841877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJqY3ZoDty2H3SIkLL/QDfyOI4hnZOLLYoA1CC1Va3Y=;
        b=H01ZnAi8I6UJbJO0XsBQr28YIQdQBTj81oFbHjBAjIm8+0bhiO2yoBF/jfnwOF0vLh
         JFJyMGSpCQg8AmOCpvWGSlS0n4znkVvl5eqpg1wjqtjnEeIkT8pU4UhOUhNn4ifr2cyx
         b7M+XDvn/UK3Gi+BuwD62vvNXdAl7yIeXgjUN0AREEeG9cv9V9JIHOu8AukRSRBtGqfl
         JrgA8ILagYdRU4L4kQJohQnp45TxoPtrbiAo5SXNtEUrMm7uRQ+jycl/G58CmZtNCQpa
         jWSqoTF35bxEljGQ6vOObl4hLmN3cxyuk8g+aV+2pa7XNZBz0OP/WP543cpq3ROpF7BI
         0xUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237077; x=1778841877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJqY3ZoDty2H3SIkLL/QDfyOI4hnZOLLYoA1CC1Va3Y=;
        b=Q5YLSFHpZ7XNnch1k9dUDk3Qztw9B1fD0nIm81xvxMIjosKgp77oi8OYZoTE2wL80E
         stFOHYn3OA3DErm9r2RjscM33hFjkdBnmX50U7fAs35/NW5sXu72zEvk2LdU7wqomdUK
         YEvBvV3iwSRFm4yMvnonD/TWIWNQJhyEtaa2aM7Xq8IlXHnr0KtxVOJpBSB58JZt4H8g
         LQ0HhYvbid4ynf3m7MZqXWtg4jmvDkQRWgniyU5TW4vsMUfnOC/oP/ExVNxnkzFVJzXB
         G4MtcBQ+NsT2tJ7It2JF4fVvK+Ugl0MEECednEtwNUufaMRxBEKqdQxklsP8jbUahdmz
         KqQA==
X-Forwarded-Encrypted: i=1; AFNElJ/iM5YO6WRSAAIsRbiwm+boC2Pg2us/g9soCCTl4thACQ9FNnOC2n+vypcmThuBokQtvd0hv21N6CbX@vger.kernel.org
X-Gm-Message-State: AOJu0YwaCgKn/Wl7yWtOB+nCBMdqjZjDNoXslXo4JHhifClYpXCDt6YH
	pBJIn78+99Ce4kbViJPoXGg3FGvTKDRrypYscIhGoj0CAdONWz3PAnqxc/Xn3vtuL4s=
X-Gm-Gg: Acq92OFdJRNi9dgaMqLbpytruOr650VBMnvbrVC5xRKo1Lyb+udYEuB+PgdztOkQdh1
	LIZD3JDQnNHoU0BFtcislIOk58RPXSYBrWgL+KvXA8JSJHgNZQVpexBE+YbC3HpIwk8RI2xAuUe
	w4UDFzFT2+rsoKD4F6pIHbiwW0db/5AyIv+ZI8LRtszZpGJf4UcWdh6FYj4b6RKg1sBmSQjKegn
	Dg2eikTKYwmxrTK7vEI0Hrz6lTbhZxUUVhJ/FQFlW6vX94plwh0+k0Ktic6gNr6lghFZ27SLTYq
	GRjwn/uralWtrvJfKbpSS+CNKsNzbAUq1SqL3bZDtThxwTm4LwaDnFyoXmjlVOhe0lwkTOB8SGM
	Kzspu/yj3ituDdtMHbiUqHI9+r43MSmILizfZndvp8otoZjAVMWGLfpHjMsI7vJNLBhVV9T7iAN
	IFEBoKA2HWr384BmScQo8vbGrQKq72HJcCzYufDXRyDQ68tlQGkbWsB/+aqdMFW8hBmYYqiuX3I
	nJGEpJybnTMqP2S
X-Received: by 2002:a05:6512:15a3:b0:5a2:7798:9990 with SMTP id 2adb3069b0e04-5a887ad990cmr1755661e87.1.1778237077328;
        Fri, 08 May 2026 03:44:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18d66sm3854561fa.6.2026.05.08.03.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:44:37 -0700 (PDT)
Message-ID: <04b15dcc-d418-4982-8fd1-6d2e5eef6e49@linaro.org>
Date: Fri, 8 May 2026 13:44:36 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kaanapali: Add CCI definitions
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <20260508-knp-camera-v1-2-a18e289163fd@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-knp-camera-v1-2-a18e289163fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 11:36, Hangxiang Ma wrote:
> Qualcomm Kaanapali SoC has three Camera Control Interface (CCI). Each
> controller contains two I2C hosts.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
