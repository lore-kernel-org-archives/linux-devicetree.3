Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536623;
	b=ykUeStjBBJqy+eIGsGxbgAR4M//XmYioZrjsgcDQseX6Dzvkrg7Iu6WbF1Cq8Deki2mK
	 NqWqoaCLVOR439idvF9DMF7Eda5L0wGT75TGJ/H3jnRwybN6YneF6DGmn9pN8lHpQo3DB
	 GqSfUbFSTUm9no2dGz5yRgAaQq1+6isdyOCc26jZV8pE/KFIeWdRlKfgVq0LPU5tUW+dX
	 FVNOwUqsxooVgNcLVKN1MMsTbNZ1uFSqXX8TESyo/09n6BUcDy+hURTUEVvM7DRduoKo3
	 j3mP+wRRc9DzT0skKeh5YOyNctm9WTKIi7VfrJLvtIlnwHN8zEOD6+kNYXRYTjvoe3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
	b=YjFW3xJMBq43z4SD6w/s5hl+7kghgyaXWpX7FB5uTxtgi9GRliSkznQglGrMiVp2lc0D
	 zol/OH5PsoTLn2FY0EcHK3rkLI6EvrGgKhtYyLaRE1OIBKJpqJccdVTlBg8n8ky8KfRSO
	 ntFqbI8uM7bW1pcPeWbNR+M/y8o5T5OOcdTMf7PJl43JKLemKBnLTIOcievn4MT53JtSK
	 P3y07+tRu5FdQSF1Z4zBoh6jLYK8UGWLPV+L8NrlqdtyTVb5Vd2439dd8lQGMsXir4mcu
	 8/DJ0k0HnJ7OZrwauE/IcaXLbVnuPwhwaW4AH011rXw0bCkHSu9gt1WAdT4XCYf2deQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fuL01yBC;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D68E60A3826
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D68E60A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fuL01yBC
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so659415e9.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536622; x=1793141422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
        b=fuL01yBCCOgff8Fcjtg40uzwGWns4yu2K79aOgLmuvLPTIqIq6xfOwGY+eNrV9NxYB
         NuLHXc6OKmZrjivF7l9UL8tnxGToPClQgFvUmKZMSX9ccJDpurVRWobpNkBCtnmcNdUB
         aQBh1L8VU/HjBgiGcJVCFs8z60tJMgw0CIfCS3TebzUjoMpedcSRCxPnL46oPTfekM/r
         EAtK3JGq6+2HquC1sETYjEiKdU2nyybu/oRxBP5t5d+kfuC6EVRuAOXmVBxFkmGmxVXv
         ZKdQvz79m7F99pOrPsWabv9/wRorRrzeQu6l+DP8GgJvbkNo/joMAomOB14jA7mMTEOo
         rlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536622; x=1793141422;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
        b=tT2Ngay5jWqx3TTOTElexGgY5wHWiayvqwLo+yaqFjHpMSxabTQh5F0N20sWzDvGsE
         98mlq+luGmqAq6PRftQBYI2WIXQ5Fh2HV51Hoo4mi7JVyP7wqYUMaweolmm9ppdAg/YN
         HTz15fCDFMRJ+PeEAHWO29X6wGgmXZWTri2f1ZM57etqOcPbntXfAeiCH1VpHaRE29H0
         1H1XPbEhNBoENmGg7OKeBxe/55OhIbUbbN0fF/YCL6BAqD+mx7NZRHE5MlDtvBz4j9uu
         /ZIctvYiVuryVC7AJU8DSMcdfyzsqZNDu+gk/bC60dht/n8tOka75gEXu2/Oln9ZFB+f
         2oZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxN9UwlnYxaoeDrWxp+Hesaf313G7QdlXExqVtOm+MYRGgy11yBLwI/BnaHjev0er62jJSPoUJXK13L@vger.kernel.org
X-Gm-Message-State: AFq9FYJucg4A58dbwoXJy+L3JB161omC8k669h7D+yUseYzoc4dwvqD5
	hQhy+zYWNfpnjZv03SU5TveDGJ59IyZXOCZ+kzoM2YoK97Ezf5U/2auQ
X-Gm-Gg: AYBFou2km8mb1UsnycumaBhcJquRz/8+ly5u+R5VIecn2lQDgX9nuKJATzv0jjXCmeT
	t9pTUVvxn9qfwH21wb/OaQvhccEd1T2zOc9SiUdAMbHPPIVJBiQQ4WdLBFSkEq41h+vlL09mo8W
	OVTtAglz1OcBOgLIitXmc2ZGX5eFbql8dvaK3giIT2ZZqQxgM6JeFZS7zmSnf9jbQWgH0W/Rv2d
	zMZjeX7BS0cXVsGw4Cp8q5urPj5UGyrwp5sK+gpnPudNfFVdN3gfIt3TGRi0r827tnDy6NRe+BZ
	54iuFt3y6O9M5LHj8JuTpSZVP//yF610X1ltHidvHFDI2gj+lNgVPi2jPWUX2ZcLlIsPd8XRpud
	4yqaI1Ma/6cfcs6RArhrg4jFFpkza6wTmO/Pf60tnBC/7BtuV6N4kX8z9Zw+AcM6qvKb+LPx+1t
	rDvPnLVqRPq6+Om4fJ+oChyPU2uOWtaCIb8RdbFbhkFHYJevj6FoL482kWeCyRneLvT4P1kSbFS
	/UnahDDdODLx/kSj2eLHIg7
X-Received: by 2002:a05:600d:8646:20b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a1fdd5b101mr1644285e9.31.1792536621644;
        Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/13] drm/client: splash: prefer what the command line asks for
Date: Wed, 21 Oct 2026 02:50:06 +0200
Message-Id: <20261021005006.2341200-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <45b55f94-0cd2-425b-b985-ba3958502b06@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-13-maximpedraza@gmail.com> <45b55f94-0cd2-425b-b985-ba3958502b06@suse.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

Am 20.10.26 um 13:26 schrieb Thomas Zimmermann:
> Please see my earlier comments on module parameters.

Same here: my reasons for keeping these are in my reply on patch 3. If
the command line is not wanted, this patch goes away in v6.

Best regards,
Màxim
