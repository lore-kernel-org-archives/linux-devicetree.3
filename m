Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744454;
	b=DEs0FIj8Na9is2Bw87t22HnWZGw1Ton3B0gxXUohQmPDtAgDWIY3EWn6slj7tbkfE4wc
	 Gx2JbZo96drV6+6zYTZ8Ygk+W0J3znr6lmt1/jngOV6F1CZb2Sf0Ea8f6PVaFVur0KfQ4
	 b98hdmCzKQUfivdh+RsUstHsEN20uNUo3+YvTsgkiFW43+Qq9yaFW1M02YTR3R0GL2+4s
	 r/os6I7OxnaS3cGEret04xpgbDKC2L5fuGLyrD+FMQmuFBPIwFufoNZdb1dUmBq/XvcB4
	 xZYpaoOVFOkHdh7H/LwkU959ntc4HJ8I4pJjAt45MwIb0VeQBADVGtMbei2sWfm1ymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
	b=lJ17rRBHe66CUwKGoOA2eDyMNF838WocEJ7bmDyHGoxMhwexXEkODMpdUgYytTqFr6by
	 bj06QdMdXrYJ/V/Un4QZt6Oh1FOrPxtLvzjVroSIj64xRw0HXbentT96iscnIppIO4qmK
	 f9oSYxAk3Z+fWhuZ9jeF1FVQXwEDFPpsebIZfvJTpZeXPAq2wLgEU6Xrxt6sxjq6vB9xE
	 lvYVD1gpXdrr9w6VPxmBNKFOkF2LINjaC+yND62n5gp0Ew5IOPhg9izcQyJGqiXQJrkN5
	 ua1/F5UKd+RBhwuiOzoF+9OVdLbvZx07ZhJw4XpYuj93VV0x1zYJA5hrMehrG3h5xRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ivnCHnZa;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7726E606A32D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 12:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7726E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ivnCHnZa
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso14410335e9.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 04:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744453; x=1795349253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
        b=ivnCHnZaftDoBq4Gu8kkVFXEzJgGlSRM+LgtFJVDlwfFAb/n3HudZkR736adgQgnJo
         ytYa2blxe4Py/DJASfqDUlFkMCck4XodHVmszliN+mxK1P1sXE5p+NVwnf90ghioz0ct
         5X45X8tkFPDaTUmpOO3RLQ1RZTBvOCS93yaN2xwsw5751TvRzY4y2XhuaPT1zW9IvuIJ
         cLviT9GDTLT5Yr6iPOmFHAScweTYW3K4zm3ouhq1mL9m9vmuznAgU499um/26kIZJLdo
         OvYCeppsIzJ7QBnAVNOfhlt8PxTcbnxf5+SWgLmRGkm26V3e7O2aqmyGCum+rO8SW1A+
         k7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744453; x=1795349253;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
        b=MEAC2Jm/Q4ciBIZUtgqYtcmDagiM8wyeP3y27W+gPZkHq7R16VEILnZCm2LIihsItX
         Zmf/r3Bd/ehnqgcZS9wEV32TIIv7emsTAiA67uh/51Tx/Gg/TaImntCYv4eDo/O670j7
         of4D/577WYfxOfwJaWONVonZRMcQK3E7nUNrRJ85yrxGpIA1RFEwajcyukhWUrf3X+Yu
         V6d11SPOVEG1FLivgpLVQrtl6uWwvNmXuchqSNI68FOCrT6FGYnyfMgPngrPR2UV5up4
         Hjh7IvKXWk3blgKCOy5/J32wl/6Q4os/g4OyreGsQ04ilZ39dguUe8ZVkCwDljp3gCvU
         ehAA==
X-Forwarded-Encrypted: i=1; AL+hErFevW66glH1JFe62bYLWj7s4KaiW8xq9AKtduJUiz3bowP0VpMpV+bmpr5muWGTH3gh2FWkKd++6MB6@vger.kernel.org
X-Gm-Message-State: APuU4Z/9JXFm/c9G4JteTRro8jnXnRVew0rpD+yVUpD67oW2O3m7BDvB
	GQ98ZOigbSnqH7ESwLBzivnJ1Mki/VrUFm/uPS6poWor9AVDzN/zd0a5mCzSkxYDLIc=
X-Gm-Gg: AYBFou18ijOAFylI5g13kEbkKzZdUk1UG0b3IFFFAcAzxMZcVJf0g8P8WmYi6HWl0bn
	7Rwe9t7sDXDmSVCJ5BM2whcV6V0g9kz5jXtenfdA4Yi3b/f5DOL6+OfS9Dch1qdQtLs+gm1DzEp
	mWIBBYrFLhUZOS2XG2Jsk4N0DfRZzC6tWajZJCIFlV46/TE1Lhox6iZRW/LoBRI7SYBLqmy0OUx
	cPJIRAqq3AYXb8TEeMoHOek0W5EAKzdBUedC5fVLVZeVMdUvjrihYqd2GjVz1uh1e2Y78D0evf+
	BSY0Hv6g72Cxy6qgvfXddFbRbrtcX01C01qUsUJB2egYS6CqzZIPThYj5r7EMiQXI0xik49po39
	C0jDWxIfx/3vGBMp73jXdW3EyEm6okUNGK6XNs5+DAoHzNlS8PJP09JrdebMlox4yZpsC9DTOp1
	/q+SxY+PuNBuKWC0bCIpu1F3p6RpNikiZE14g9GoRiObA3nwgM/DyvFHJR3p7yg4ZDATUBmzCIF
	46BJhGgAPv3oSCwzpta6KlhNAay/1aISqyCc6jLkrg6+PQC9maOtTWSwzaBLpA1mzHiZ7cVVAO1
	n4c+Pxq+JaNA/3L37cDMWdUXf/yA1QTdqHLwYybm2zXF+3tYdZYlY8GMYXxRR3ex
X-Received: by 2002:a05:600c:3d92:b0:4bb:6c01:de81 with SMTP id 5b1f17b1804b1-4bb6c01e02fmr25950745e9.19.1794744452736;
        Sun, 15 Nov 2026 04:07:32 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm189440575e9.4.2026.11.15.04.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:07:32 -0800 (PST)
Message-ID: <d4fcf0ac-571e-4d3e-ada6-a732d68dc18c@linaro.org>
Date: Sun, 15 Nov 2026 12:07:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 17/23] arm64: dts: qcom: sm8750-qrd: Enable S5KJN1
 camera sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> Enable CAMSS, CCI1 and CSIPHY3 on the SM8750 QRD board. The S5KJN1
> camera sensor is connected to CCI1 I2C bus 0, uses MCLK3 at 24 MHz and
> connects to CSIPHY3 over a 4-lane D-PHY link.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
