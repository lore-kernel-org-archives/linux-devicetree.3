Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5E03B27EE
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726217; cv=none; b=PF1iE10kj3qbyoVpvd7+955mxHTtcbZSyjF7gwzr3pN9+SkKiatp/JSgTXSCV9OcaGkNPA0joCvmVXCTCnByvBRN0ok6YJdpRVHmjBAl+4n4zDGskDY05lLaTW0sEgUg+Qj1IYHKMu9gXgWmWO+mK97BsgGEJlDVCzpJbkQehyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726217; c=relaxed/simple;
	bh=iko3ZMq1VcoBbjrOB88oRT+wjsUB37QQ+unEQMTF6Ts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mdVR2l/6cfirpGAv4qEJJPK2WVRdsmb1/UJrYxeStejZ1uYj7eE2L04N4JKWo4i0WvK5v2bjXyLtTfeC7oQTT6VTYC4fWmnu5AJppnW7jY66qOCm8RiNOF9uWJyrliX1+c2EBVHh8GRj1xPgF1GtJkUOmuverilRUsI0M6OosWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZJKFtal; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VRDSMsEi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZJKFtal";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VRDSMsEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775726200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TgulYGZEezauT5N2y6RRbPYOtNJoV6tHbCggzEseWxk=;
	b=aZJKFtalTrmaUvvCzIU8rMunRJ9q1bY2F8yC0T5UBzgAYb3FcvvDXaFX4PzM3xzRq0/9U0
	/UsuB/Px/hsZHTYtNISadycEUYcDqQU7RuNFjpagmdPqocWEGmWSTzJVV5DyPJYkojbE3B
	kvySC+72VlCMApnG/YGmJWbn9u6igF8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-TkaaePhQMF2Cn5tDzGtU6g-1; Thu, 09 Apr 2026 05:16:39 -0400
X-MC-Unique: TkaaePhQMF2Cn5tDzGtU6g-1
X-Mimecast-MFC-AGG-ID: TkaaePhQMF2Cn5tDzGtU6g_1775726198
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488d2cd2674so591835e9.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775726198; x=1776330998; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TgulYGZEezauT5N2y6RRbPYOtNJoV6tHbCggzEseWxk=;
        b=VRDSMsEiXft22BANVwF13eJddy1KP3F8JNASGSoc5YPLVcYAHUeRNz2cI4l0Bh767Y
         wgn3nmhx0nzX5OO5MUyVu3MfAqXv1PtaDVct4glql6aYAwbpKUoLxhCWj+lhD7MoBcNJ
         2FJT3kZxXCLlL/CO1E11Ah3wRsrphoS0ZHaL32wTRFKLKr+/pIJhZO8eRoSCHxJ/QbGA
         402STQ/5UOjPLY6owSV/Q/VIzgwXQlhtCS/4PoU3fQTXdzUv+dTnnwcgmU5KdRWc+8sp
         VwaZrt5bEHeFAHXTxgtuXR70ONCUR6D/guVgYn15Ml/L5tkamTQD1COhExfmQqSSbxR/
         0HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726198; x=1776330998;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgulYGZEezauT5N2y6RRbPYOtNJoV6tHbCggzEseWxk=;
        b=ZDW6tqMerElnDAYXHJ4slpMKgNfgZ3dplmyu5UYQtNnTfCV+KhnCx+Q0YsjUdhw4Qt
         cQBt2IP7vWYPnbuxVP3HWffBI8D28yDO3NLHyHiujnNCLt5jFbcA6EMVY5aWwl0dIq9p
         PJ8ETfUQuq/+JOSSRY1xRfOeMHbwXyhjsu+cPFodXqYSoG1r7Syegs9wyJ4kkKtXELYE
         vCIM2K2xYQ5vSFX+Quj8UIOgfEkj3SLtnEpHfxv/ZNvuXfhpJRS9mQhUm8T4LUMvKYKX
         1aY5oP8ZJuAcU0F/9E1FHPuHClD7HhWduFZ4SyE5Yd88TLvClRyil1Wsra+uA6/NcDA5
         2iyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXytC9W4pVuewM64MRoSTkTU7LtbvuH/q70NJfxFZnAT02KKT8gisHkWfqqR0NiToh69TIipqoZ22ZV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ijO+eu2X9B5ImUBF7hiNb+fvFWkYsrrZ3nNlkncYx6MS4To7
	meFJ4AGD29EmprK8h0sS16HMrF4vnkafiptXdy/XTHZe9IXVTelucepxiZm2oVCO7QkiHkHDM+D
	s7e8aTXGKyNab0X1hPq51GWto0N1cPlQlzOtDGI8vPyVuAqjlJBAlDBSPTtGvgWc=
X-Gm-Gg: AeBDiesWBmrtr3nOqFPLtJodXmQtBKkiynu9TzqS6jO/YkvLB3EFfBGcXUMD27foMgl
	qAUGNq0tYmG8iU+rc3BrOHSEGI44W8j7zlp6CGz6BnB7V3nyQl6pZIWOF31vGyb/wDXPSykuBSd
	tS9IzNySFIEBL2TsQsgQUHT7/RwGpB7+MTvWYD0qZeVZ+ZLyUmVCxxdWXdRjeQx8ARQvG+Umck8
	3y8dHeH0X2g9laZgy4IcDv0oe9UbhCpiN/X+b0l1cL0sckSSS0s/WhvtRSO0WOUR/+9Pay6F7VJ
	N7uhWIIv+WAlyfaFzyRXI+J96vyr0eKCZWgSrn6bdKJQqf5sY7HkzUjgocVQLUJbDzUFbiFKvak
	YZVw4zklfgr3ZK8SzERJc2nhm6/800UsNZr/kNY2bSliTvhFrfg==
X-Received: by 2002:a05:600c:a47:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-48899781357mr360437535e9.19.1775726197769;
        Thu, 09 Apr 2026 02:16:37 -0700 (PDT)
X-Received: by 2002:a05:600c:a47:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-48899781357mr360437115e9.19.1775726197287;
        Thu, 09 Apr 2026 02:16:37 -0700 (PDT)
Received: from localhost ([37.221.85.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd19f3f1sm18879355e9.34.2026.04.09.02.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:16:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Cong Yang
 <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>,
 Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 08/19] drm/panel: himax-hx8394: set prepare_prev_first
In-Reply-To: <20260401-waveshare-dsi-touch-v1-8-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-8-5e9119b5a014@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 11:16:35 +0200
Message-ID: <875x60jxxo.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

> Sending DSI commands from the prepare() callback requires DSI link to be
> up at that point. For DSI hosts is guaranteed only if the panel driver
> sets the .prepare_prev_first flag. Set it to let these panels work with
> the DSI hosts which don't power on the link in their .mode_set callback.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

