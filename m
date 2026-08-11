Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E842E009
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440686; cv=none; b=kUgADARotwCPeJ7L095vhpR5SkHhcqQFQlnMsR8CM7n0V6CAwPsTuftGW+C9WNwRxaXnv4e/kuO6QCalrrm3gThc4eCCwPbQT39p1Ke2uadODm4FsyJdfuC3BvEa10coR+5K1JjcgoACxR6cRA2Jjnzt2sft5sFKvV322GyNXHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440686; c=relaxed/simple;
	bh=8QXwmcpvLOgS2HJEcrVuGl3PSKJiGBxtH2I13j0yeZA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=EH0z27A4DhFqSlZguzLn/22d/xFDTGZeCPbXeYGzZ1t8+7TudZATOuDxEUESUWilWvD+C4g6Cd8kEOsYjY8Vz1UtSM1IUWQc6+XM+ALaomiIoGRgpKG0bflWt20ld02lP8SH7XDHzTp/RJ8si+OA6atFxgHnhNYblsQFQH8FYds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyk18MWH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyk18MWH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso7590795ad.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440685; x=1787045485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24lOYUM9cZxkUEGLRg6JPIJ8J7Sm+k+/AF/RPaqeH9Q=;
        b=lyk18MWH3cpWuRrJa34S3ofIqp+Sfl4k2izTx9zDN4o0Tkx5V5kKXyAaUtxyKP7nf/
         KSZlWbU2ZcxU3Uy8AmbXgYuUn5aK6HLDqyKrJROXvzwzgxlaEOphmZyR6InS+5JKd1uL
         0mAyD2NfhFMEP8Jc/UdIh8LH0dcZwMIoI5vwFCjZW24bXZZ6znSVF6b8peNarhZ00Hng
         J3o21LzWuQfo0IZcF6FqG9zCSBl5Z2lCYz0Hk/IROCNaA9QdiouqkQfEwgtHLNl1OJ8m
         MjswBXSo45pACCZnkKE0DpHtOGexSZIvbZdBcHyg2PDBDUx7ao9nFLI0Vl4q/TGh7Gw4
         1aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440685; x=1787045485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24lOYUM9cZxkUEGLRg6JPIJ8J7Sm+k+/AF/RPaqeH9Q=;
        b=bZ7kuFVWWxPGu5AU+2oNLgQD8qyzAM9Akiqk5uJ54h6WbHgTE9P5L/D0F8/REfSmL/
         iof6YqpyZQAn3IvF5L77I1FfUg8r0ry2SYPMTUVX3+lMfapmxGG7A/gz0pac8kqXNbY9
         HRwB8EuQ4pY1nljyaNKMXz8KH/zmOHsbvT/YhIcgxtLANnPxdfo/vQtbMEsqvM2jC5cG
         a1nofP4lnBfJLGiQN8IdzkI9Q3RfPUJ7TilDwaWo89rP5bGPiqhpowM71Aa5Gn5LQQL/
         wFvP0yNsuVAb8RjWTbGFOjg1fFYR2YVepEc9vBPYyuwXE8kUH7eKOHVCsKtnW4PFWX8W
         pFVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPL0Yq1eQvEAQIKcVWmeZg5V7JEvd+1J+BGBEg0u5/y/5abUMzv3uJhl/so8GYL1SkktQLzpW5vZ4t@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/m9pd9xs/78iTMza2RtXE4w/TNO85HDtrCYYIoiA8g9cS5o+p
	Yh2MjHtrXhIgQp/x/+2Fst+Sh6Xf6vH5s4GM156HfCfT+7MeW4IkHQqH
X-Gm-Gg: AR+sD10ZuKW5ycZKlaawjK0F2IjtdZ8gbOGGR+9B/5KdboM1URxNmIsYsyphMBIZpOW
	4aTGoojH58Xdv5nSJqwnO/DRHn01dmFS30xep57veFsjDalmfCITVdJqBY9WvPq5F64tDyGAU5m
	VvntghNZjrU+9gXCku8nnd6nep1oSprhzA6GfxLbTvbk2K8y6saAGvcGPF3Kl5+16AnKFd33mWn
	ssYrlwPaV6cCMnVo+Ee7bT+eZCSF5XSlibURDwecOrnRyuohNtsF9Q1vs1i8cyE4b3JskaSTnlQ
	mtGhe8H1wRWBklvtA3phsmDKxFtVRgW3Qaui2i7hZ2YcGhq+EIt7uaXU0Hs38jwq+5pA6O812IA
	jrH1aZZd7nern1gWEuoSuNnHxu2zfa/EHCr7HJkojLeS1J3F08TQ5E0YnsRinQhuWSd81/hpFS7
	Thh9cWANYZg+/V63PYLpf13VFQQ41o3pntSasAeyYbQ/3vRTUqoqCCT7EYZjz0TeB3LXDSKuB6T
	K+Qnsl4li6PA243MYYb3CLDVRzhIeYsTa2qd0j9ais=
X-Received: by 2002:a17:903:944:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2d31792b495mr25426375ad.15.1786440684729;
        Tue, 11 Aug 2026 02:31:24 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f3f33csm4781325ad.26.2026.08.11.02.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:31:24 -0700 (PDT)
Message-ID: <73033a32-4efe-4ed2-9319-ffb205d28719@gmail.com>
Date: Tue, 11 Aug 2026 02:31:22 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+guptarud.gmail.com@kernel.org
Cc: andersson@kernel.org, broonie@kernel.org, conor+dt@kernel.org,
 conor.dooley@microchip.com, david@ixit.cz, devicetree@vger.kernel.org,
 guptarud@gmail.com, konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org,
 krzk+dt@kernel.org, lee@kernel.org, lgirdwood@gmail.com, linusw@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, phone-devel@vger.kernel.org,
 robh@kernel.org
References: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
Subject: Re: [PATCH v6 0/3] Samsung Expressatt: Camera Flash
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


https://lore.kernel.org/all/20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com/#t

This series seems to have fallen in between the cracks. Should I resend 
this patch series?


Thanks,

Rudraksha

