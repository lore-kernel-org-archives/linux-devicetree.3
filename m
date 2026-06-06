Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AEE4071CE
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780739259; cv=none; b=fYoUZtmbkRqCQB4BnKY3p4c7etUYFSvdlISwcd8RY4CempfUWYmNoEUlP4Cwy8H3GsyDLdZpI40EnD0aaegI6z7m1CkHwMa7ScuZsAUn8tOhGN6AvHzzVoV0tR0XtmT4lHbD2CEXVQFx5Lm9pZuM+82AIsZNnmuD1ggVRxrJFVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780739259; c=relaxed/simple;
	bh=dfbJ+EWcu+qwX4wc1kVeJ9LjStQyA+kApQ1hLf4EzsM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=rYBIckVKfZ3gXdEH4Y1D9H1SHuRHhjhYZ/UupZ/7zMq8XLBE1Sqv5WTpRqEC4bmbFN1BbJGfBW5Z7kgcbp+DA+eBuSqBL2I+INTKNOsdERAUUJqy227wcq5YBrb9lCWN/4xdX9sMh3tetbxX5cNODrxGc12hwUe1OSqvlngO9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKmKzDwN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKmKzDwN"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso1728582a91.2
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780739258; x=1781344058; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q7DKTHGkbe2VJFMOg9H6r7IIduPY9wGngpns0hKbcc=;
        b=pKmKzDwNbR2FHrwFxVz4M/mn8WVyZh/pqPimAIboo4buQc4d32hm1Q1qSbv9zIjDSu
         yepl4/tImwDB/cmfmxK1J64Kf5ZgZJsmw29Ut0+hmcyvY0Y8FfcTryq2gxTNyfQX/Lvy
         jw8Xg2fgl72dVKisL6mgYRnmObvU/of/U2vg6YcqOwsQ6UwsBpjrRZ2lZnLuP7MuoDxl
         oXTtGrFE9LeeoG0iG0IQRwnCuNh550KLgVeXv2KC9v/hYOfyN3d1PvcBcP1+1Jbxpr/h
         43SOLZKOKULI4ETeW1VUFxZt6x2vDoaBkVou/u7e65RajSoKYjv+Bqh1EeX4WEkqqLEH
         wIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780739258; x=1781344058;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5q7DKTHGkbe2VJFMOg9H6r7IIduPY9wGngpns0hKbcc=;
        b=SqJzPfYVNQY3PNhipbHWhpWCCb/di/s2XTHPSHWoGCtA2SJhhNMTWx3HaXmU2S6OhZ
         G2XnwsAQxv4SSTC4UsdLpwoMvmhcI3Y65G0PuPWPJkGR5KQqof/fPMS7+dt01zkiGsv3
         3UioPch8VnBh/0PYDwO1s7dA0oxbcw/WCv0QHslzj+F+0HXnmbCW+ppgPywA6KR07/Rt
         w+S/IdxShhcC7U82bCdllsG88VA1EfGpO42qXR2E8UQ5WJrP61WrOG/TJFHZuvLsBboe
         2rR/+wVgY6jIeGpKKuYnFTE4Fe/TqLl/3hx6nDqUJbvbxaaUXKL4l7AvMQdQWPrNlUB4
         xPzg==
X-Forwarded-Encrypted: i=1; AFNElJ+kaLHTHa2x3hhCFLLw0UQIWasdqUkWuFBVMwAO4m8feSnOe0CnQVP9RyCBTP52TBEiYZUAVuuQBwJV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6LvGeqJFwkxRseWB6esm96w6ib8cI0fQIBWTF1h8sbxzyj1F3
	NTjzwkEyTI/FnEwPvx6MEB5qZDtXQXLlVYWxyeYGDq+cWZPCtWLs0U8n1iZ5K1By
X-Gm-Gg: Acq92OFydTbFKSzskvtyKybaou8WzB2H8iaq1WX7F6LTeADvs4Ex7KlyOIqfTUlWqQI
	45TO5Cuu4mChHx2hiAKJJbEsnoAHdSj8LGfk2edojlgbFLVnTOZD4ZFwnFVTXQp8F1UVQMEZI53
	ZvhhQ3V8kZBikioUOhmV+E5slW3StOccEUJd9AOoEfyS7vqnKmhWonT9iCkhJ0Cah/phvORkIPh
	W93KtdlQLvaY9Z54TKsluFD8R2rthQwUq0PHe4UvT4jhBxhMjyWWSIGJiudgQeMzkccwvQbaNcc
	FTyRNndSojxW8WwTdH3SNtN8Qk7hvUW10AmZTCYPZQxhCf+qpmdfKc+h/p/xp2ocdqEb/JN6KP6
	gJY129xeWozFO50Ef8JCSKPExqel27Dmp3u9Y5bYH/3JCPnAx4Rip1oqRAsDJliy/BrJTA7p/ZH
	qkP1idSm+00XUPFzokDGPcC8oWTz8+zSDYHpsPOGs42hQ=
X-Received: by 2002:a17:90b:3d01:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-370f0095c8emr8326135a91.15.1780739257767;
        Sat, 06 Jun 2026 02:47:37 -0700 (PDT)
Received: from [10.46.148.203] ([2001:19f0:8001:53c:5400:4ff:fe86:d241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8521sm9146350a91.15.2026.06.06.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 02:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4>
 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4>
 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
Date: Sat, 06 Jun 2026 17:46:25 +0800
Message-Id: <178073918523.417326.15121723011916371966.b4-reply@b4>
X-Mailer: b4 0.15.2

On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
> 在 2026-06-06六的 17:22 +0800，Pengyu Luo写道：
> 
> > On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> > 
> > The magnetic keyboard (USB HID) can't be connected somehow, others
> > are
> > fine, such as the spi touchscreen (not upstream yet), which utilizes
> > DMA definitely. My config is here https://pastebin.com/SdjuyJYk
> 
> Is this a defconfig?
> 

Yes.

> BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected too for
> exhibiting the problem (because there should be "public" GPI DMA
> consumers to trigger the stuck/reset).
> 

Is this still necessary? I checked the fedora discussion and your GPI
DMA fix. And GPI DMA is only for the QUP-supported peripherals as the
binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml

> > Which device are you testing? Please attach more information if
> > possible.
> 
> My device is gaokun3 too, although I used the mainline device tree.


