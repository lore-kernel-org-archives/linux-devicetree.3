Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E273009D6
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785610966; cv=none; b=Rj5c5KwfjaG2BAzvnw3PWRC0SxDEQzfqjqZDdj3lcIVf0qw38O3sLnCAvexH9NL3jBKCUUcx4909q1d7Pe5ePrDf3PF/M+0pR8dZqdndpfTDGDyg3hKChtEoytxx2nj5RMXpn+oLwH2yTjBhZOL49An1UrDapyVUFArBsEGkFg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785610966; c=relaxed/simple;
	bh=ONgjSmtJqhZYCOi4k3AvcYjqSx3slhnNZpj2V8m1SnY=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ibl4sq5Mnw+JnA2B9rULzESEgjniyM6sCchDTfqjAd6yGizzwUsZ2nzGlP7gLk4Sn5tiGQSe6NoF3puY76+6+rqJUkcrd1ggEIhZG37/ElkTardzmIT6lH20mI5vpTjKw5xU0KQox5pzMo79161SMUUddTsPcezSN40aCu3udlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=onSSLjcG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="onSSLjcG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4955158f26aso5608415e9.3
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 12:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785610963; x=1786215763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cDiTNkfT7RBUUTIaN/X9QMQFiUy4egwCdPKgzjjC28=;
        b=onSSLjcGqQ8O2m5+rJc1gnLOZ+gXdLnhyvzO6y3lg+5qNMDkTW0cyXR2Gr8FSmu+eH
         TSKX8nsnarSQYA+MPeBhZvCUDa0geEdEXcMaLEhDbmAHbHhgD85PjSkVYSLpb4AN3l2E
         nw8459hDB6gRejhkqb6LM6KEp4TvzVowHu1YBQe5RLVLZvsGUIjkAiFinE0N8YPw8Ujr
         c00wh3nrbqsPCx08fKUBPGN5E5NniCbsow8H/14dd2WDRj2+6grOY51sSB67Df3ESUPr
         dEF8QFySDIN8L9JHXiKDjXuvz8LkVwEmCZ+IQjKnNuevEg4J6XkThc7qX2cMHyZxm9gy
         NIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785610963; x=1786215763;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+cDiTNkfT7RBUUTIaN/X9QMQFiUy4egwCdPKgzjjC28=;
        b=jgcQHXLdHpBC1e0STQjwaMp+khORmz/x0KbBuKPPX4O34xcmrOaCY6thi8PNpNz748
         rOyYnyGTEru37SpSbndPygLqIacZ8fpsasm4avN5JcR8SEEU9ahSV6MTFv0kxA5o92Uf
         VGhGG7N2VZgGgnAQF5NuGHevKN21RAGTJ2SNLOIbueNnl+IM4IG4EjFykPzmkKAVLFfF
         7raRQLxbjB/+10Jvg+vjoYIGsOhGBYUmi+VxZNuw5P3RXdrknpPN4eJxZ6GCJ+br1HWZ
         j0XVu1WPLKdZEAydWskMQKQ5riSb/8v9bYo6558+gNwILJ48GS5DONQ3RR2LcdSwx03C
         xMMg==
X-Forwarded-Encrypted: i=1; AHgh+RrJxvKTTzqWmlv4Nd7YNXkeV+Dmu1gxeHiIqxzjUj/0NvjyVhGtRhg4DN5e3h0/SmxlpAXTiasxH7TX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx87jqZUYrldXfyNTYD+eqYzrQa+stQIrGkwaT9F5E079i5PnzO
	Ys2NlxXycBIYUM8LaivO3prVfxMjC0g2UyCkcD3VxkD4zE7SllFQOlCR
X-Gm-Gg: AR+sD11qgYwALgOtfdQ4aTA127kdysmdRZAMZatD+648Wpc4d2XwS4ZRtHu4uvhoa1O
	ro0cfeiq4BrXHhAyyWAvB13LYbMnYH+xESKNoEFrjqIFShbeg8LkJcFxo+dAmKkIDP/qBXdwYtt
	XRLh+o/BJB8iJv427ddtRniHnAsXvYgeacZ1HW4NGmtSYMM33IVu9xtRV51lu45viBWpJ548C/G
	u2dXWx+9vbPi9l+LMpxo9RnWeRjQrYH6onDCppgcEhriou22fkicy142RErw11RriKg0to4QIbi
	4IEDTeLjozDPsf4ciKv94VraPlfA6vnd6DDYCuRMh8vGaZAs6ym9tfsDiqqzmN0yTn+ec5j7CMt
	DedvL6PitI8OR8tSleMqTwIOxcHjS+XVl+5UK7RDbt2OLL7t4lM611RZNpsqPU8MocRPVJpzRMx
	kOSwwlcmCZenoWlPee1W+WsvIZdBoK3Mx56zwqPfWq89XB4Hq9iPpfy40=
X-Received: by 2002:a05:600c:1553:b0:498:ee7:e40a with SMTP id 5b1f17b1804b1-4980ee7e62amr59215235e9.16.1785610962658;
        Sat, 01 Aug 2026 12:02:42 -0700 (PDT)
Received: from [172.23.0.7] ([64.188.68.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm122720995e9.13.2026.08.01.12.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 12:02:42 -0700 (PDT)
From: Neko <nekodevelopper@gmail.com>
X-Google-Original-From: Neko <neko@altlinux.org>
Message-ID: <8b4fc7c7-a0c5-477b-b03a-dd1e7c2467b9@altlinux.org>
Date: Sat, 1 Aug 2026 22:02:40 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 3/3] arm64: dts: qcom: sm7325-nothing-spacewar: Add UW
 camera actuator
To: Danila Tikhonov <danila@mainlining.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
 Achill Gilgenast <achill@achill.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-3-38978de67963@mainlining.org>
Content-Language: en-US
In-Reply-To: <20260801-dw9800w-clean-v1-3-38978de67963@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/26 9:04 PM, Danila Tikhonov wrote:
> Add a node for the Dongwoon DW9800W actuator, used for focus of the
> ultra-wide camera sensor.
>
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---
>   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts

Tested-by: Vasiliy Doylov <neko@altlinux.org>

