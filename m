Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1151D3BE165
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515764; cv=none; b=fNtWQlljO1jZSHz4GX9y284HJmP9GykrbygWXqNOKPGhiFlbEtoo5AnLlVh7hKG2PktV1OH6clg6ipEStDBqIId/GdiZTDF08KokjpUnVXMcnBnTyEhF1QHku9O2X6bLUdm+i5SbUYOwgyaLhuhNpQDuI7njtznUepc7qTU6U2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515764; c=relaxed/simple;
	bh=J+rhQyRTfoZzJ0GI7GG9EXyupU3nMVnHvjxZxGN6brQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Njkw91frwuWgLEMv3yACiowyCAYcf9Alznh4EoYCufOOIMFlNc1GlUm0N97SG2CiQ04MGXVlC1L31ZxfjXdH7rWj8qABXf6K6jvNBVgoCf1/rKLaEQuYC/iFPaz8UQpqgemDdbAO5m7tAICpG5zvnb/E3gq/PX1bMrOatb9171g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L52QhdVO; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L52QhdVO"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso908272a12.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515761; x=1775120561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXPKOAWpcR9xHk9hAzrUFCp6rLb1/uw3dh+uChYT9mc=;
        b=L52QhdVOzz/ndoThLufo6fEDjpf1zvoBSHkgmCa5IF+23bPvzJADXmj8QRy9WlXtd7
         wqtLnUWwHBGHlJMAsW/bKdKJabVWK64vBAqyi+Fh/f2IhVO0fh1wsY8ZWT4B/aTh23pD
         k3OaYxPcH4QYnGr4498LAF8Sy/atplEWcs7vyItje2XfiCFdvww981ie9BSCooyiClS5
         WAEqapKtwaJKZcI86lRymWWVSwAnVjS+l3EH6o1eQNDmofDJvMvnjfdavb6AEPNA8z/3
         K3IzjxdqxJUG5olCozkQ+9OStPr/yuh8IHTPuSeTCyZ4pp/flYmpyEbo3ID0SeGli+UL
         YDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515761; x=1775120561;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXPKOAWpcR9xHk9hAzrUFCp6rLb1/uw3dh+uChYT9mc=;
        b=Nzu7HWYT3PpQPTyLqEgzvxEd+linCXWCv0qyQRLzLDJlio7llTicIp10Fq+hQQEbc3
         ak6ZnKfzv/e6dD6RL2b33fHtdBQx2AKCT/xy0eD6bT0uzPWhMJkRq+USQAifJJpRSjgF
         dMGcw+wjvfEF2k/1Y2nSaB5NqCFk/0PHu3iJ4dnoy5qIgNAtX1GbikEdF4Fc3L20GV5D
         rKc0FEs3RYKykqfizu0Aw9lLTb3o0R/DoIgRUnXBJ3IoealmVIAy2N6RxndWIQNvMQnM
         BN26is8zkrl8NZWaF4Q/vDYcvbhy2lfjW82UJuMj94v1/6omy/GlBwmy4iYFjxxOzjCg
         4oew==
X-Forwarded-Encrypted: i=1; AJvYcCVjDk3+M5upyOfcnPQ1SHwW9vo2vmuBMrscG9JoJqV1EAskzRTOusDUU4LfR7/0WC/pl71AxOEX25FT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6r3Ftij8Azi6DaNAs5/p9hGQW29l1cNl8e3rII+EibMeUmwnA
	lwibmscwkcCwzWiMmZMchNfH9H20vcU78L4RRsVME4cBhjuY2ZPPsmzBoAu8IohSO2c=
X-Gm-Gg: ATEYQzyQq3BsZ6rn09SryJyak3CZ3VJ7fSdNWVDp39wLsEB6xl8DLdwUa+56216OGAZ
	P5TwkMjlfvnZJ9uHLXPHSTdJTAcIBkqvnBn4gPOvVwgOFI1xp3f50Drs+knSzm8I+x0/cPdners
	WkrscigoY0ODsGAlVzdsAjZtget2G8bpv00/3WeYhQARt+3FoMl28JvcTEF9/wdUvi7Pn/sX7Ip
	WxNfIpZhWPMJ8kNxSXag/fhV1aFHLm8EJhu1lhVmngUF/zPtFgXaYQ66Px+2oI4r04894Whr8uI
	LdoVxcPeH9+PuX3nkWKNwqlfY0cLUl35z4UtR6DRRWqMH4U+0erAMQlBBIBu04P412qdKm8GyXJ
	VsMsZVLQ88EBFWks9ADTyutfLdeTrwaAAKM9dLXk00E4qqASDgkaPPtfpK4LBxjpAI3C6IM/a6D
	ruYX92940dE2SQFsC7IBFUABeSkOCBME0Fh/1RWyEIEzlE
X-Received: by 2002:a17:906:e097:b0:b97:ba90:edb2 with SMTP id a640c23a62f3a-b9a599a5322mr343969666b.50.1774515760204;
        Thu, 26 Mar 2026 02:02:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Yedaya Katsman <yedaya.ka@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
References: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
Subject: Re: (subset) [PATCH v7 0/3] Add support for the Samsung S6E8FC0
 DSI and M1906F9 display panel
Message-Id: <177451575929.103892.7506565955077481700.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:39 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Fri, 20 Mar 2026 16:41:37 +0200, Yedaya Katsman wrote:
> This adds a driver to support the Samsung S6E8FC0 DSI controller with the
> M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> generated using linux-mdss-dsi-panel-driver-generator[0].
> 
> The mdss reset dependency makes the screen work more reliably.
> 
> [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: panel: Add Samsung S6E8FC0-M1906F9
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f4693b88bc730cddc6d69f6f11b64e6d93a8e373
[2/3] drm: panel: Add Samsung S6E8FC0 DSI controller for M1906F9 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/49837b6babe71fac84cda2a0d3cf9c085bf3a2f9

-- 
Neil

