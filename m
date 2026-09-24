Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA54AD4CD
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280043; cv=none; b=A7Bd85VxQ5vilEpa4uID53v2DATEGzBm8LcI9ShJrLeTElH5+mSfM1NSyacEDCt4vUR9oSYu8SPljCXx8gnEDL0RhKSA4R4aCJA5uT7KuaiKFfA0h8aqTBk+JN5lJQIMgDVVffge5LPoHfXcP/1iFicQUpJ8MSIdyDmWUhFLWKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280043; c=relaxed/simple;
	bh=800XYnUFGFmLVgaPHONWcqohdi4VWbF2CAwETY0CmUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzh0ogBcaOXnKuvrAFrQUZ+jPghhRw3ZIz97OLntSBtGMvox/iupI8zDlGcNNw0f88DvQllbaaZT92HQQWYqbXnTTZUvMrwWedNIz0vI5O/Wpc+DRXltqcKHl0oi62PEDuz4eoWXwoK1RzD3DGf3+skdFtTDM2gQeQaMp94qXyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ow6egLXd; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ow6egLXd"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso1362585e9.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280040; x=1790884840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Waq+q+bs9tZHLy6mj9/0dS73pghCJzNJ2Bb0y33c6Wk=;
        b=Ow6egLXdUfKSeLXNcN8inGMHH3j/Nv1eS8h+/efytKaVamRQ6LVbRzuFW7soKKy3Ob
         mrqn0EFF9pmnf0epea4MS0EuJHFitUwlwgFN4VnkHG6VCEyW9h9BkfLdpPIcmNgXk+Ph
         GRzHJN6GAgwoV397ugVtvyZuIm1sEX2dWCKER5AzJ7PZrOJ4fjz1ABPUG3k1HVbF3EGC
         U78OOQc46HLOLbHoAU7+CGYKUNRxbegg83yCO3/K42ufzixIhwwb9yacysP0W8Gf8M8g
         eajEAlBZN6RN3lvbKiAEgkkNii9A99u20tuIjfBtoVYMUPsSAi4in0VRvJK46Sm72eRK
         LzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280040; x=1790884840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Waq+q+bs9tZHLy6mj9/0dS73pghCJzNJ2Bb0y33c6Wk=;
        b=bX0mUeau2+hgHFgC8NC1h13yzr2uvLru9eNyWkHM9z/zJClsMnX2qmrVKK4uwFSpBU
         wT5UaZpuEBdhJp3yFOrkZAUt7RZmav5myiWzntTqlfPT9bhSjvCZ8Fzxm0WmCLDKkQYZ
         rIVgBgWlIqpCKUMXr9ahJJwx7rqSfcyOG/XWPvTX3shBtftehND/JfjruTUiEwR0hYIZ
         WfJbwtqiAe42ZxJTjm0obKOnyCs1eZiMz53PqqAHeztl+nXWfEJcBpf4LrvDMeaNW4pl
         ONvf2D6HlJimlj+iuJlYhR+kJm2aeGWtAxtDm6TKPqB6pHWFDT9Gtnsw0zA4+Fj/l+iM
         VoPg==
X-Forwarded-Encrypted: i=1; AKwUvBwspXBGdi32ayD3uHoVL9C8boSoZMdMMhkNNHhXXNl0tTHXKKxOwE7RLnf00Wp7ivBqVRjmx11c+VyU@vger.kernel.org
X-Gm-Message-State: AFuF++mL1vPbxF5at0iesqS2+RKemEaGiM4YXVsjSHyjZtbkI/7wgPqE
	N11MLnmcVvDpt5KX5qIC4zYAl9WuLhEguZP57EE8FR8XN5fY7jBDbzOp
X-Gm-Gg: AYBFou3gDsjyqF5iq/alLOWWyL6RrwopOMBFX5ogwEcBLW7A4S9L+Gzj26lTRoSrkPo
	/JsL3q2z1Mw85cBM1vsP9wgrIJK/8F8W8Zv7Cr4Zg1cFjovlGoIIFuQj0rPAyPPmd0VldFYjG12
	vwPum1tW30xg7Gioj1xjHrLY+2kmfPDJMXuYC6yFEDKx7egbmqgZzcWCrfRfkNi/QYdTyO/o8a2
	w+a6DsZJQfctcg3bXXlNwzMqNXc2U//Xe/MMM9q1++7CQTxnFxjmp3f4Hyz/LkzS4y2AY8bXVKp
	1qmuPpics1J1pH7z4FW597oTz5Rt7H2U7R2ff/zKRjKgxoj/b9yP8iDeG4t9tYQ3+pqiBIO/W6X
	U8B2LJ5c8Pl5sRRawog+dfYrzQV4ykk99kW5dFeJ1e1ZKhLmgj0pJgD2/Iv0RdPwepFWriTM/qk
	m5eIDL5KWm33jXJeAr5yQQHLKJbgI/Iua/W4avo3BahZdzMmZV3/leog9TAnH4gEm7pJ/NT4fyV
	nCVh3aHqlK/ZGvf//cO+21enCcyS6sYgik=
X-Received: by 2002:a05:600c:6207:b0:49f:bd3c:bc20 with SMTP id 5b1f17b1804b1-49fe66ff476mr67110105e9.27.1790280039460;
        Thu, 24 Sep 2026 13:00:39 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff069ceebsm1872715e9.3.2026.09.24.13.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:00:38 -0700 (PDT)
Date: Thu, 24 Sep 2026 22:00:35 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 03/11] drm/panel: s6e3ha8: Really assert reset on the
 failure
Message-ID: <20260924200035.GA194087@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-3-08d5c7bf72fc@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-crosshatch-panel-v2-3-08d5c7bf72fc@ixit.cz>

Hi all,

LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

> Due to incorrect implementation 0 == asserted, thus when driver fails it
> needs to assert reset.

> Minimal fix for stable; the polarity convention is corrected properly
> later in this series.

> Fixes: 779679d3c1640 ("drm/panel: Add support for S6E3HA8 panel driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> index 078523df48860..835121b322f4a 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -179,17 +179,17 @@ static int s6e3ha8_amb577px01_wqhd_prepare(struct drm_panel *panel)
>  	ret = regulator_bulk_enable(ARRAY_SIZE(s6e3ha8_supplies), priv->supplies);
>  	if (ret < 0)
>  		return ret;
>  	mipi_dsi_msleep(&ctx, 120);
>  	s6e3ha8_amb577px01_wqhd_reset(priv);

>  	ret = s6e3ha8_amb577px01_wqhd_on(priv);
>  	if (ret < 0) {
> -		gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +		gpiod_set_value_cansleep(priv->reset_gpio, 0);
>  		goto err;
>  	}

>  	drm_dsc_pps_payload_pack(&pps, &priv->dsc);

>  	samsung_dsi_test_key_on_lvl1(&ctx);
>  	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
>  	samsung_dsi_test_key_off_lvl1(&ctx);
