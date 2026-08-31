Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D7749C4CD
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186567; cv=none; b=Q5kuIqLcbwZ6YKDB3PoU122zZV0ldnYSodgjxXCmDS24Q7qh2xHIZYQW0IdStJ5XRrMkpAf+03wrwJ/BTJD+JQRychWUpEI+WQXGV/OdaJ3Fs70tQqGusBoJzu22BlehiqpaHQCmVP6fqlXWcIe2Gof0S3lQ5FeUGx+0D9mi+6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186567; c=relaxed/simple;
	bh=c/AO9mlLPLcxcm5WfZp7uIom46VnbsPApFS71v5t4U8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W1Tyji+3sCEfMHIN2+XzFYs/yfRaXlxFlscyJNnlPvkl+oSJon5U/AAdngpM2v8+0JQC05qs8Jd5p6SdBpwrG1E5t1hh/1oStcigrJEwUNNwwRg1tVwO8u5fLIS15Y8VbiJiHuVIPe3L6Pe2LwKXEnpXveCQ/db510e+NVTLYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjoHbGIU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjoHbGIU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so33971475e9.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788186564; x=1788791364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42dtUqvN0sDvzTs9n0Ajnz+iSZsJQO3TYWIEYeQ7is0=;
        b=ZjoHbGIU6MrztwPzKXnzHv+HzW9paeCF+KhzpUy3AdkJfm5tfqrU2K2YYmSzVWhCu3
         Lsv8nwPAhE57pOHyuc2s8QtxxGZH67Hcs8Yz+hqJRHgP+a/IFGOFgp/Vithq4J3y/gkX
         TZCQiXCoxzIpQ0AmMx6+4tyAepuRVd7O6S9FNMTPoh1t9IWWgNErroUhtiUT5CRMGhiZ
         +pjeYTOMM64p9CODy7FwaOqWSrXnX+dOZec4aSC0iXBmWfKRGJrAOkVpuMMLo+xLwEU+
         yQ9ufmG34Jbo5ha70wmqXAidU4slqOttyx6b3gqXHQwEmllrMFd1rnP20lAZb26s3uQJ
         iZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186564; x=1788791364;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42dtUqvN0sDvzTs9n0Ajnz+iSZsJQO3TYWIEYeQ7is0=;
        b=UZ01SytzB4AYUbxxwDdENpyLaQvtCOxTIPdrGSRuBDecb0iqYMcFua73Dwqe3H2nqP
         kQqBgfHM2MJYJD15dX0u7xWUWVBIor+aGVNPezP2gio24ai/i3C7Aen981vdeUIMi1pR
         qe3N/mcwNzbnvoKbfMPC9bjKTPd8JCuEs9YS4eAlRBw47ugV1zY8L8akarq4mKx8iu1R
         zFuCLVhxbMgteotj8ShaIqc1oucwVKX9cZ3UMK948lMLo6Rgb55wj8DiTfaDGm99B86n
         h37ezGw5neK0d7mb3IVECK8k//9FFp43ovSF5cgTc9vMYzFSwrI0sn+R2UahKFbqiAJT
         raRQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1/2heg7lmIbY+BvineqAFm6ncOQFa/VN1u0Co5v5jWbfdRH5FZAKVmZkLYAWUYk55YTE2P9N69ZJH@vger.kernel.org
X-Gm-Message-State: AFuF++nWFR/xjkOwDQfq6D6YjESluF+h8Z6f/vM6mIokgGQi/YF1gqzj
	s/bMmX5DrolexQtaT4xusai7ab0buqBdnA1qQE0syiM3R5OH3IA/Vnru8FCi+bmMdQs=
X-Gm-Gg: AR+sD122d1Ybyb5yKyebcPotz7cGvxcFgZtCVp7TRjkxOF5RDtAX64vWi+UVDj3gxjl
	ocUjRQN4ekGi2rvGFBqTYS8FF3zBOgoZQLnB8gtdQjjxSqCSvaMy9NJ2inuDHWbNlJM1w7YVY3P
	xA7nHYzSfxx435UpOT+LYMbHNQ0l1WApePbkD4WhxU8pQqv9ccWJVDo9isANyif5R9E8FVTmxCT
	9W0r7Ch2hLEWrYzG7RgfA9TDfK69FNueQzrC9loa8lsoeogSNB7c2n7PN8JgnbsdQOS97d3h5D0
	iLrzvr8aD20EjcnzkLoZIRYStn+5F4r3VJSUQlypxXK05SNToly8Bq0HRattmz+/lV+n2BWMkeB
	arZNkaLXYoBgu7ZWEIDObJjCX3oycnemg+ELMXMb3WsX8CeQZ3NXH4jFG/gUMohLps1l+tQgdAu
	ktctN016xte77ceeArC1g3PeGTcfeCjFl+5X1Ney86vTTmdpA0lp5wITjPugZh6z2Tz98pAToLx
	G3y3if2n26QlA==
X-Received: by 2002:a05:600c:c0cf:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49b91c51e62mr367747135e9.14.1788186564317;
        Mon, 31 Aug 2026 07:29:24 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm145266605e9.2.2026.08.31.07.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:29:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260808-ili7836a-v1-0-07a7becc5636@gmail.com>
References: <20260808-ili7836a-v1-0-07a7becc5636@gmail.com>
Subject: Re: [PATCH 0/2] drm/panel: add Ilitek ILI7836A panel driver
Message-Id: <178818656303.2615924.4877103512503955677.b4-ty@b4>
Date: Mon, 31 Aug 2026 16:29:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Sat, 08 Aug 2026 14:01:13 -0500, Aaron Kling wrote:
> Add support for the Ilitek ILI7836A DDIC.
> 
> This depends on the Retroid Pocket dt series [0] for the vendor prefix
> patch. That series depends on the AYN dt series [1] to apply cleanly.
> 
> [0] https://lore.kernel.org/linux-arm-msm/20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com/
> [1] https://lore.kernel.org/linux-arm-msm/20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com/
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: add Ilitek ILI7836A OLED driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1b59be32378e9ff5e9d1fc1168e46362701c751b
[2/2] drm/panel: add Ilitek ILI7836A panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8a78143d94bbc9ed471d57599563bee0757493f4

-- 
Neil

