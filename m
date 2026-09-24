Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2946367F58
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258374; cv=none; b=fCGCJBuaUUsKzBITdtQQonQMLQfcr1LQbILMaJpPehaZPzoU1FM35ec+cBG2LNZi9xHDJrYjAkCdv1MBW0SBL/P1QmRAOWt5g8rQMD7Hp/Q7kc/p8N2oPpdSFuXU9q6do+XMi5j0zjwMOW+9mkQ3bhSpEEBo2gMyDV2qfvWlI6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258374; c=relaxed/simple;
	bh=qshy+6nZ3RJGli/ZVqdBIAx8yp/sIRUh9OJadxCU2JM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A1EDa5jBQBeR333MTcgRaCsvkkbR1ESt24nKAbycTT7VInVMwQ8BixZoAY4fnYcH3XKl9tMd0zzhcsHSWbO4L8tIGta6xUh4RV18HpS0PAWWuYF8NbvqiD/R2KylKOfdQCDzoOz1oCPYTAHNybejTnltm1aErenhKDz/6Z8peBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m3bJHpc+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m3bJHpc+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so12171155e9.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790258371; x=1790863171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVb+5eFFzuO8SrTG5231sDQzK1ApgWpQTmIUYa2esqA=;
        b=m3bJHpc+84eYP3/6EB4l5V74nL+MyrCr5xWZGBl+BkuXt+be9p1y40yx1K+QKEztke
         Jj/rTMD9pnWS8jIGhbQQCqkuB35sHekdgTPDav/dNp0qhv1IblM4lwxGMl0d46ZWEIty
         xN2rgfBhJHJS7EwCPjItC9hD4WvFwQT23lzxydLo/IRIVAfP/IsHPJZJJynQXNcW4+JC
         wzmbQ/9VYvPfx46O+fgWfBTWQTK8BFFbiS55vZntPX9CGxFCv/93lZMEsbnfg6NT0oJU
         +9/WbIQO2rRB/tBzpvTo+9CtuzutF0U4poBtvmBpMdaOqYSXyviwclpG4lB+lkfXS2aq
         rsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258371; x=1790863171;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVb+5eFFzuO8SrTG5231sDQzK1ApgWpQTmIUYa2esqA=;
        b=n7kHewkNfh5mOghnuXtSOQhlSihbDl+A6a7XBUn1lu53G92rawT47NzQQiZgg28PO1
         EJutT4SNKCsE7E22pADNXSi06YuIzRh41MXY/EZT3OxdjW8Q7BghYBMuTLnXIqRFPeOi
         BZ7fGv8A6Lz1BtNyR1r5CL7+7Cilar24ogwJ89ZDzuf1XVGJPIwU3gj3T+dSI/UeJhDr
         sJ5UMRq9FWInb+JiQirQmUeO62/FVTOPIrNfLd5MNcdQLv7QN6mZ6Jpqicgh0h7yOEwL
         5CFB4RxiENQSrzQW8d8VbMJhronBaSDSq8eJWkuoQbH+G0AYRd/oAfUvvab7Cczmve/K
         oZoA==
X-Forwarded-Encrypted: i=1; AKwUvBz2cIxbjz3D7rhpPBIKy9k5vVL8dzQnVKZwfh8B4X47jlmelGOsNIoCyX5vuKEHu6aqJ9X77ZDC7CTB@vger.kernel.org
X-Gm-Message-State: AFuF++kSwUlaipEFlWdCD0V4pZoHTW1fLaRnsbmv2e262j3RqvA8JyDr
	v7331qNYjz3iY7Bz/MiEuOL2dXg9TxX5oX4vLJIuVWT7tjep60MB2dOdUsS6bDTlrxg=
X-Gm-Gg: AYBFou2ASyZSVRPLmqQkjoYSWQNb8v2TKSdXW4xAeJwEGGZlGzUDUa0uEVrIDQIjays
	Pa3ZItf9+brALgtvGbVti0O6zraPvS3Tq3FA94jPSLFwuC3cl61GSFHuMSc0oOsnw77REXSLEHp
	nHOuheUYzWKErWgWKRPExgmJ4G6ctQvhBPUVkDTirlDVJpwfUNKJVFnO0gPap3uhetXD0EvZ+LY
	ocdWAcJDJdrdNYevdSgt6cnMBkdzuk+MForr3/kWcuQfrVg5PZ5hA2o1TCwIdQ0XDDEiO114h0q
	ZI+tPXOGYm38CSFt/PE//65fh4c7F4myje/FDoepriNgef6o9tePrkDI78b9vGRcKkfRT/PfKot
	uedHYQeqHBBHUdGmg7p9k+SIIAsiRIcIAxtIkdYeaJboh62FF0uN79+BJE0JFBOGWUJHJcLJoeR
	4mQxmMZOpoz4RCA+H2O3vDXdNWmLCM7ZU0dUhQ+7cyP3rZQlzo1365B9O+7UFPcjLJKYgPOW6L/
	2T6az7WLVLWQ5VWr/Tm
X-Received: by 2002:a05:600c:3b01:b0:49f:ce78:3570 with SMTP id 5b1f17b1804b1-49fe670bb82mr41434195e9.33.1790258370793;
        Thu, 24 Sep 2026 06:59:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm15799213f8f.19.2026.09.24.06.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:59:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
References: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] drm/panel: Add BOE DV215FHM-R01 LVDS panel
 support
Message-Id: <179025836975.3234093.5704563992134575173.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:59:29 +0200
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

On Thu, 03 Sep 2026 09:04:16 +0530, Vishnu Saini wrote:
> This series adds support for the BOE DV215FHM-R01 21.5" FHD
> (1920x1080) dual-channel LVDS panel.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add boe,dv215fhm-r01 compatible
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/fbbf93ab8bcb29ea741b99e7cd9bc2120c2a52b1
[2/2] drm/panel: simple: Add BOE DV215FHM-R01 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/92be213ad653a6b785bf465f0d259b4eba6d9207

-- 
Neil

