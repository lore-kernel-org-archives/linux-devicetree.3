Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAF436B047
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515757; cv=none; b=TNDkZJvAiH27iF1PyKDMUcQL/Pe45eyt+fmcDBFiKye6H6b/V0jvI++sb5jsVhcGyDkngmZko1v8m6esBtCN+txF7fKneVyrYTXrcf7BhdoOFqEZf2gQtNV0eppQ0Xz4AxLeUzvFTjuS4pZEXsRDOCZPpfn/fFO7sQiBvL2ff84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515757; c=relaxed/simple;
	bh=Y5TUtL3qwR6CH6Df5dxrSWhYp82PygO+Kjo3xGwmpg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CLOJfQmPux5r5xXcwHjlS20L6cSZC6peJtvaAGrZdbl7wTzb5sEERvnJgumdt7ASKCnlodmAvwFlIot+NQYeB0D2wCp9tuJHQ8gWIKkkuhn1Dlf3wJAY/Ee5G7H6Fp90Nu2X7xIN2KY7Hu1doEEAJuZI/skVF49d7B2EbbLiD9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV6WNwwZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hV6WNwwZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso399936f8f.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515755; x=1775120555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/Ix3s+Tgcoiyysg+QDxh6RK5P6qQb9s+C3grnl5iwo=;
        b=hV6WNwwZWY50dI6MFnnZXEdRzdsmVmZDUHscCURad8f5gC6MUEs7Y5DIqS+7wyJvlu
         JYLkHfNIqr1WOaAjnELDNXXZWRfv7ty3ABL291Dm8ZxLKQkQtGCfpKt0oVV2R7o2zq4h
         7MoR5i8M8Zt0Ay1Nb5+JXnJ98Kfmkn00AI2dvr8AqwRMQLtKX8wECipaIr+OrKHJufyU
         L+2YJAHgiuVqFNc252Wgx4sJ1P/koTpiqgSU3eWHv9Zkk1hxkU2t+tkUyolWIZYqUpUK
         RO6Wu1ZpSwrmbvyMOaI2gTqq1101wgjpjciiDgUgoQf7ke4GjsUmNrak1MHcSP1ZNjHR
         Lksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515755; x=1775120555;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/Ix3s+Tgcoiyysg+QDxh6RK5P6qQb9s+C3grnl5iwo=;
        b=fXSkH5DwuFE0X+rSJKEXJAwZmRj181+ggmX6YCfDBz1WsqRgARcm376SuhTfKHv0iv
         Yx0s9sCkdjHRsOyQpFpbR4atdY0R1py0Qwya82YVP4Wbfib34ECu7/wmGcaQahL1TRFw
         JVpALNc0YScxKs5GLgk4E7fKrgAczUjE/J1VWyFxy9iQw4PKbWr3A2HPqfitsutrqQWB
         ESgpCG1ksS7Ygf9KcvXSQBUZhjgXArPpceaNli64sdQTUY07zP6PvLxyqYV4q3p0ZYmc
         /cJCUN1BFxTpEtDD7OWDr6CQRZZHqSkjTi/H1KSkcUsFQyGIdsuyKUHM1ByZMUc6T5du
         BRkw==
X-Forwarded-Encrypted: i=1; AJvYcCUIELjFNmPAlRjRHn3uveD9nOsWekKuva23uVOqtko+RP5oQu97ckiBBHNtKbqRwl1yFLYd8cWBMonL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2H9h0COENEFS9nAtGui2oBXd01c9Zqn23STrQtVXslf+bY5a3
	zyWtu02YKdhR4brJSykQAhip+dJYb31n33QB2Bd0k7JwCrXcM0CKGEim9IUclIjJA5A=
X-Gm-Gg: ATEYQzyPlmzZR1LR4qMD1uMWvQOCgMUo9D3w4KzUuXOrprP8mNP8YGJwQG2mx3ctlih
	juelkm2gOwMnn0m2fNSXrKe2U6ThuNAFrsoRYQijz78d32kE68/Vz0weEkcgn/3ex07Z6zMFRa6
	VWqG6qylgXlvLprYmjlPC+GclNYOR7eAzcg7xJvmlOEmvzmnjo8r/bBPVGMvxpIfFF8Yujjoh6N
	VOWT7FqYFmpHyjoXXHhfpJmuDlAo7MUYUNttlKVxTqdjp8UmujsF3NJ6XAKRtY5Rnxhq70jx/Iv
	UMm6W/TWItP+GGlNBMKGwxfHI+/ZvuXhyv6TrGSEujjaRysF9tdtc9bQHVt5HRyEdoAZNtdPhae
	FYW/zgOYK5+hupDlceJBoDROI0I+rqds+EFofBqhHwqAQR2U85smtdIkj6xi84ZjPd0dMnIzgZc
	5+VhQRGmMcgt6zYpFPPk9IeTki4T18mxBqMzWq7NUghpiJ
X-Received: by 2002:a05:6000:18a5:b0:43b:5095:d101 with SMTP id ffacd0b85a97d-43b889f58d5mr10149259f8f.27.1774515754445;
        Thu, 26 Mar 2026 02:02:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
Subject: Re: (subset) [PATCH 0/4] arm64: dts: imx8mp-skov: add new 7"
 variant
Message-Id: <177451575363.103892.5315410631400617574.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:33 +0100
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

On Wed, 25 Mar 2026 12:31:58 +0100, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 7" panel than the existing ones.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: simple: Add JuTouch JT070TM041 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/87535f27061f3443e813a64f59fb1b0fcb916e08
[2/4] drm/panel: simple: add JuTouch JT070TM041
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7a5b966952c0232d7083a496261880fc11cc8c4a

-- 
Neil

