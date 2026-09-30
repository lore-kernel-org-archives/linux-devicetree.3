Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1F34F30F0
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781023; cv=none; b=LXbdlYGvJIdyDSsCPjhl6C6N8jylp/cMC75e57WdITXCgIJ7dY8jLOw+tzXefY6hs5kmhAp3B2R1wsvVDxfA4f5epmowft7S4BXrG44HFWkNq1+v1pRDRL4QcP5Fcu4XtrjpsW6+NpxeXqcxzOHDQ4BnkMcuzlfm27IM4kPI73M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781023; c=relaxed/simple;
	bh=0OxRhuVbi3oxUlatW0tIcyIVYkE96Nbu7bqC/b0fLyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUo/oN9nRChnqsweW0ROYfDaJREbCupUv2z+Xnopu2fgC5UpoQNEsBqKmmZepmWkAsaq575nGeten8ovy5h1ZAEKyAV1crJHfdSVLwn0E9QbDgJdMoCXPtbofqhNqlwEZk+HVQUUGd40GCuIN9+ao+tm8P7fC4E3hvUT8WFYk8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he0CNuvm; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he0CNuvm"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba43157c71so605e87.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781010; x=1791385810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPmto+vUBoK3BPeCZ82QESLiZxY5p21rVFK/tfyP4vM=;
        b=he0CNuvmm7mjhNkF4WGGazuow9mh5t+GmnSTZSQy5jsvCel0poBTrP51IwdlwBLnJz
         SOl/VdtAqwaENxDFiRJhFspv8fOnReUXgu1QoU3fPJpQUvQltdg9KSBwHLnw1jXWmApV
         xOcG8/PIYF7JINRm9JaI9wkkjoCI0VMKH+45R1UwoUUR76LiJBm9fC4BxYPIGyIwrZLE
         MsRxtkJjNgUG89WHmbwNtXugRbmNbzJSRU+Xf8opZxMshnembivB8FS79EJpauf4cx7c
         kLRSSR1LMpWgkQ54bUUXCf7KtLFC+X4LNwv1jPXXkjnpT1nEANYfQTKJtPM9HdCn7d3J
         f2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781010; x=1791385810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPmto+vUBoK3BPeCZ82QESLiZxY5p21rVFK/tfyP4vM=;
        b=M4WCfEqku00kPsIPFZR98N8hnBOvtgCiMUUULuThj2H5Fv9/dOFR1uyhtXjF2Ne258
         YXM+eNcDe7zmrjMoDXMwsoLuFCsIaewdXwPnscQTCbCA5NNtXlgkBzuP8rzgMrtgkjSZ
         8obMbOwiQcjKSDOIytuNO9Wx88mojpsYQduByAqJiW/70kFrGnnU3Ll4OTnGag09nVCa
         KW3QOid0HgEbKuBki0iAxCpLxHUOe2VW9jIOVGCZ0iD7Lo2WcP1MonJ1F8j+MMVMM8Yu
         q+viQ0g4CpLHFvfajI9ZPGbVC3iQiJdM2COgUPpKjRycxJXEahZqMued7NueQhzPnCAH
         026A==
X-Forwarded-Encrypted: i=1; AKwUvBzf4IKEQON7B49mT6GrDvU2ODLp/LabNsw75gUChu3cX8nGvgP2UDx9bJI8W0vruodb5v5u1mDZ8mVs@vger.kernel.org
X-Gm-Message-State: AFq9FYKO2q1le5QNWQAmXY5MaLbUUzajY8X/kUNtSvEeOc0MQwUDMhER
	HJCgDjVsUvucP34spSWfja5CFPwqXVdrMQc3yL/4+k26JVqk6I/ZEBx6
X-Gm-Gg: AYBFou3NKB3eZmCHm9IwaiSEthtL6lB8VYwsbPXFmghlqGduWkEJ3TPnleMNJruiN0W
	8BQi7nsL1N00IzfWnm7Dw+wIE54YCUwKlNdMS6Yi8jpePJHc7ufD5b6k872OzxOkhXnokMqvone
	NqXC6fPbejnH35YZ7cnraNJZOXuJSaxUsAfzpTRo5FdpFYVkzez0iDgzZ6TtjaZWUHVH4/3L3+f
	AOEYdLB1JhV/uRNdDoQ9GQ/VZyAIT6xnq2STR2BRTcf57oeDSi80BpwPMTeBSwgiIOC2J+piLmY
	MYdx6zlOOl1dmEoRnnK20GEqCvwIyjk1Y2+kdPEd55lEoOYTqO8oXv6t7PMaaCof438aoIJk92Q
	cfQbUadgFBReSp3vHkyupjUQCs6pVdIRwRGAu9QdLRsbEbxT5CMwdrLzE3dgjt0IW0JsQZ9TOvV
	449Knqxn1KlJF8/TmhkxndvpwJJPFTgRUzrmz7x5YVEIotB6LdUc9VlZsMQbVO60g3nhQPbGqUc
	Pl7X0xTw+t58/uGkuplAsd49tiBytg=
X-Received: by 2002:a05:6512:3ba3:b0:5b8:f955:29e7 with SMTP id 2adb3069b0e04-5ba402c323emr870452e87.6.1790781009538;
        Wed, 30 Sep 2026 08:10:09 -0700 (PDT)
Received: from [10.249.180.52] (m-37-0-171-147.cust.tele2.lt. [37.0.171.147])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42faaa70sm29075e87.27.2026.09.30.08.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:10:09 -0700 (PDT)
Message-ID: <82fded25-6338-4aa1-8bb1-a49834cca8ba@gmail.com>
Date: Wed, 30 Sep 2026 18:10:03 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH RESEND v3 0/3] arm64: dts: qcom: sm7125-samsung:
 add initial device tree for SM7125 Samsung platform
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Vitalii Skorkin <nikroksm@mail.ru>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
 <179065170983.2673486.1587443995547415765.b4-ty@b4>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <179065170983.2673486.1587443995547415765.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> 
> Applied, thanks!
> 
> [1/3] dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
>       commit: 0f14172198733b780f22d546516ccf8a7ed77733
> [2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125 platform
>       commit: 6320b4c31b70a39a06de27a8019a45632beef32a
> 
> Best regards,
Hello Bjorn,

I noticed that the patch for device tree compatible documentation was
picked up, but the patch for device trees themselves was not. Is there
any issue with it I should resolve?

Respectfully,
Erikas
