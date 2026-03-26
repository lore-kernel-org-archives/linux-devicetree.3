Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7053BB9F4
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515761; cv=none; b=c+Lv8QXNEz6GS1gHdRP1POmrLo4qvD4q/sLHzpHHgnFBcGmmpElTgL8sX3E49+gx+Lge4anY5HH7bdW0XPnmi+SBNssVyvr/trpSx+1NxcQ0FbCqJGFtar/yCjDVDMZH7pKbaQz71eKWYtOecubME6xfi63N+Ha38DY6pKNqzRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515761; c=relaxed/simple;
	bh=807Ne1Y9uBnLW+q48+Lb85aSjXQzwhaHaQlGx3XMnWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zii+pfNPKsKywXwWQApRBtjVsqnkVRJzqTphT7Qf/uzgJy3lPpl4Zt+xsZZ/J4qNtu3TO3n0+1PEGNIL/P0pGuSuDJxzAHw0iGODBCgXaqbBb5kfsUUqnAJnXRGxwaAv2L8pEDJUifzQO3gF8yqJMhHw4BiSmwOri7YldwX2Ul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b6jLtqur; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6jLtqur"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439bcec8613so458318f8f.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515758; x=1775120558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hREPPe0C3+Lmwx2tkDyEQDqCZUnz8ZDMuws56ODjtSM=;
        b=b6jLtqursYuQabYuJHgWSYfbIUGun8CzrEHYUuZF6tiVqlZ/H3irOSd4Pzao3cUx0y
         68b8wWUZfup2f9fJsF067fYoVm1OXdpq4ygHHI0EWNh4OMRZFEV/oKVy/UdYlWl5ISF9
         FqEQGwV38heYaRJ0gK30a7W4C6OJKYig/IgiCGErG7/YAl77yHDbs8fHIBDFjgo9QZ8+
         y6P8qk0qAFRfihFwKibpjC7GEA0jSB1fBPnTulB8t2JPNxEZqkcU4QSH4EUxGUYYBLp4
         SYmEJPU3RkPapnB6fiz1h7UCdThZyKg7MVvYZhjGQxB0Q2rL8JVRIYHAW1TQ2pYTBzqY
         2w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515758; x=1775120558;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hREPPe0C3+Lmwx2tkDyEQDqCZUnz8ZDMuws56ODjtSM=;
        b=cz9c6om2Hr56erjXxRl5wU6pS0fwsAw77xvsYKIhlIEvKe8duC5cPYsBdp0zUehD2e
         l9yKcPNae7+LoWjJDxEvLgxfQmGQ35If729IzYJa2z49gCJhpRIpKsa7wflbMUejdsEp
         f5AUXzk3oLwRRJxA4ofo3yth0IjcuzE3bss/N+DwcikmVYu1bVTWPxS6jNNFd09NE7ax
         KNm1FXVBtaOORt1sEw1H+0ngaAVmkX/7dROFy5cVXAzeKwbdWQWV0vcBODw1BTlatUAO
         W1PwwygrMoSHFGrms2atL5IxyLO6HF/NIdJY537peilIEHCsvP7k3PYbQtzpunjT7c98
         VHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/WnNqwvUZmyzqpmWt1s3fAwAdEc0MMkvaIEznKFv3uynhtqmx6eNvGbVircTa1BFF36ZTml8yEbNs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0C8aj8t7JE76q52aHZgebWIvXe5WWZQeVeu585QFZ8kdMHiVR
	TNiEUY3pG77uC5hSZQ32uqowuFhSadvz0lL4LALY6iK02S6GEHj9kYcscq+YoEgVq3c=
X-Gm-Gg: ATEYQzy1CIR21CBrCC34hwVDGc2Ex5btP2J88jViSzyVttPP42HcmPo8BxZZbB5x1VL
	+D+WKsrp4vafgemL8Lpx60QKfJDfd4VKTBEo+SCP8eWX/OFUskut7gFCMtHmoqYJ4rWDVHVywoF
	uMcW3pD04KO33gmDq7nuZZGfuJnfcQrHSq8iTMp7uQVnyGPQ/so0uukH81RD3er3eRVvpbJVzKp
	Ov0mKo0kx2GekRFjX89du+R+RT7LpriczN7VpTmRvFW9TCkosjHT34vrkj0DgR1yiz7XVUIwrZz
	RyTcBwj9sPEW1sfdelzNlLZWVQ8/lF4C/nQdFS2+onwvJi4dy9/Wsh+uJSVNTyLT8PQfEGMCrE8
	lpusbNPWixwDfdod4buEDoPHV/iBm7FKzhdbVEMwYfZqn6UDAFwKr6kbk+ZMxC6oyHw5bHa3dP1
	sy8YS/hijvzVOGc32q8x9iqyPX8sVRa2g9+a9OIizQj/lJ
X-Received: by 2002:a05:600c:630d:b0:485:3586:1e28 with SMTP id 5b1f17b1804b1-48716034eb4mr98838765e9.18.1774515758363;
        Thu, 26 Mar 2026 02:02:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260313-dt-bindings-display-panel-clean-v2-1-d49615218f92@oss.qualcomm.com>
References: <20260313-dt-bindings-display-panel-clean-v2-1-d49615218f92@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: Align style of "true"
 properties
Message-Id: <177451575750.103892.1923752988731034667.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:37 +0100
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

On Fri, 13 Mar 2026 09:20:54 +0100, Krzysztof Kozlowski wrote:
> For code readability, several bindings which list allowed properties
> with ": true" syntax group them in one place, without line breaks
> between each.  Align a few bindings to match this style.  No functional
> impact.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: display: panel: Align style of "true" properties
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a00e773b4a5ce23dd831044283e134466e3f337a

-- 
Neil

