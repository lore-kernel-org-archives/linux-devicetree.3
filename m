Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8633793B8
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068150; cv=none; b=Y1R0Z/9QFgdtWvP736A/OCn22ZNgn3g5bB+d/nXh3caNxyKViGtufJZFZCWwu6vIvdHo++44HgcUrxDEPe4F1QIIvJJgImbeRdXhEkcaNi5BKp/1plE7y6zdu1HsChu+QTuUFeISSWW18RzRyr/D2z72YsJuI9I3Wa4Yw+nR/xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068150; c=relaxed/simple;
	bh=x+hF6cksfI3/bvnsU93PkG7h4HttSPYkRpLHTklFAIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M1v3ejvLc/LlUcnWBCLXf5qS/1QMICjfU/jkz6o4f1lKMLHKcZYWC5sjt3kMrYBMrTqGbCf5vyHqfbKDlHHlpzrKtsoG7WUk1xc5eLf01ul2hT/z6sRrumEkZJMqNKOWUlmFTgSpSevUYn7dwZ9MahuoZbwr0MJs112e94Dbi1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dzZz2YBX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dzZz2YBX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso3107025e9.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783068143; x=1783672943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMSN/w8D8c3Ml2NelVlRwSQRShVwiaFWi/GCztB5J24=;
        b=dzZz2YBXlc8gg0yRe3EtMSku6hPMdwgYSbiQpZz9WxI7C7WfAC3jdbzcgrO5bmtDnE
         5SN9GDsoC7vWfrU6lfV5F0r0NlSGUMOWunKaaYJ3j8boyvwQ9cFzzQoKzly1w9fH0/tK
         2TrW9e1nSmY4RIKc6Z7wBNkukelyycNZeZMAzDOI3EuAUElGGrZVRPwXNKdJ76IEQI2F
         Um8UYuG7SOk12idi4QvdzOx+GhsCmli2NDVwvC1taU8oA8I+oYncL0VkXedtRUwGAf3P
         lPbWdq3d9Y0giq5lucWXxhU87qfwTn3PKSrXX9zgZ1TftmS7q/+hBFAJ37YTK96aGvBU
         ZcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068143; x=1783672943;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rMSN/w8D8c3Ml2NelVlRwSQRShVwiaFWi/GCztB5J24=;
        b=UaoJzPVRrLgBk23aez6x5DECXmGcd0QQvuUNkfZlBXXbVvqEuqy9HQmaNoUXvkUkCZ
         znvoUfsjxse45zxa6fO65tR6abOXmA2ya1YJSLBphsw7NC0m8zVCd/KBuYb4EPnmpoJn
         gQ4T0ZwIEl2oTeuBC7Uw0yuZxt1DImmd9PheZd6W15vYP0TATS/XB0fOVqwtcRjo1eEP
         rq151ng+AhsWMAx1aYN4Txnss1dtG3jJOsluRxyHsfvNzy6wu4KAsHhk/ZCnmEbdgKtq
         tr9ugpqide2ZRyOgpf6UnA650+NudyoH+CkV8Y3qfvKNpoBWm5rmOM3vE/G1Nc9vokVJ
         P3+g==
X-Forwarded-Encrypted: i=1; AFNElJ8re1B9wcU4C8kZgMpYkWjiCkVYygp2B6+aLOnbtqeztm1yB0kZ4+RAdj/D5+eBGMCmEcT02eZoorst@vger.kernel.org
X-Gm-Message-State: AOJu0Yx52HoP5I80fcOz6A7F8RtX/J64IVv61Y0HW+U79HeEcWvCvhrT
	5bpuUkFN4oqIOntccxS+9iH7KlEOPRzmrxsxhXEqw4Sv5Z7qHtV57NTmzhnbvMNKGtg=
X-Gm-Gg: AfdE7ck9UMcgUrplY+gZzL3ZmoAWILK+Huxg90Etbes4Q6JSyHXBKmooXFksxARbxYW
	m7lkilqQgd25bl+JQIXzXz+ECPGSps14u7EQB04AimqrRUd+d19T1bJLpXahUIonbh7ew0KGW2T
	gZ0nMZvStk6KYU5QGWw1qwRRAwoTLL4oLoYBY5rSiBQrwGqNJZK7Ee2Ms95aazDpfcnF8je+w7E
	j8h0/P9UZbhIxPG9Z2m7e+/PWK+G0E9x1QZywDdPpOak7y3Hvkdsfrl5j7cLu2L4EvZd4f/pTr3
	afituxWDxYiQHPic/978NPdhU05Uo3LhiZk5dM9vm/xeeG4ANOAuUGBg9w/CQJLzKYIP4Pru7pK
	zwuMu8IUNtspxx4rSvYuj2hKuYRIPUlq6R+UzEg/tlzOpZJK0UOHdSTiudBKUhXLHN0OCtFzmF3
	y/311zFNNVDf0VcyFRPU+v0YPAv/Yo+6wZVg==
X-Received: by 2002:a05:600d:8649:10b0:492:6eff:7d02 with SMTP id 5b1f17b1804b1-493c2b974bamr115602665e9.30.1783068143284;
        Fri, 03 Jul 2026 01:42:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm30001575e9.4.2026.07.03.01.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:42:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ayushi.makhija@oss.qualcomm.com, rajeevny@qti.qualcomm.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260701-ili7807s-v4-0-c7d76d4780a5@oss.qualcomm.com>
References: <20260701-ili7807s-v4-0-c7d76d4780a5@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] drm/panel: add support for Ilitek ILI7807S DSI
 panels
Message-Id: <178306814218.3165305.10784888600083150493.b4-ty@b4>
Date: Fri, 03 Jul 2026 10:42:22 +0200
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

On Wed, 01 Jul 2026 16:42:48 +0530, Arpit Saini wrote:
> Add DT bindings and a DRM panel driver for panels based on the Ilitek
> ILI7807S display controller. The first supported panel is the DLC
> DLC0697 1080x1920@60Hz MIPI DSI panel.
> 
> Changes in v4:
> - Use active-low reset GPIO semantics: define reset-gpios as active-low
>   in DT and use hold=1/drop=0 in the driver (Dmitry Baryshkov)
> - Replace raw DCS writes with proper helpers: mipi_dsi_dcs_set_tear_on_multi(),
>   MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, MIPI_DCS_WRITE_CONTROL_DISPLAY,
>   MIPI_DCS_WRITE_POWER_SAVE (Dmitry Baryshkov)
> - Use mipi_dsi_dcs_set_display_brightness_multi() with 0x1fff initial
>   brightness (Dmitry Baryshkov)
> - Move MIPI_DSI_MODE_LPM to probe(), drop toggling in on()/off()
>   (Dmitry Baryshkov)
> - Express .clock as arithmetic expression for clarity (Dmitry Baryshkov)
> - Update panel physical dimensions width_mm/height_mm (Dmitry Baryshkov)
> - Link to v3: https://lore.kernel.org/r/20260624-ili7807s-v3-0-ddf37052a289@oss.qualcomm.com
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: add Ilitek ILI7807S panel controller
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/447a76a99e242fd04eaea33ecd9a6d73992e49a0
[2/2] drm/panel: add Ilitek ILI7807S panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dd7ec83f456734de8efc115eac671e5add82777a

-- 
Neil

