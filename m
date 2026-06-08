Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935153B9D83
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914959; cv=none; b=mAwoeIn386GJUOx6UVLENEdFRDXmMXl4vL/RohJRiclc1AwS05gktUxFIYhIn74fjHRyLx4ZlmkYCJKDAlRbSWVWvjFimGuTeuMfLqVljFmyKjLKLMxTo1Gq50hgVDNX1TszazZxMEGeD3Y+s66bqqE6OnbYoVFQU/SKz8D4LNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914959; c=relaxed/simple;
	bh=0+d8hdZrhAVzwAoofJ6eUvBRfYq1O84m3xZM5f7b63I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmD07HvRrAh2+U4VNGX7wQcjz+3mhML5UfBpKgsI7CXDr9vjOllDRV/rMS2zhLP1nmfaCNo9QChjwtXOKyqtqM2MWwPv4rMkw81cKs7ZQcklZQSHBnivCQY39Ea7iTe9OMVoV56sK7FpcJznSusjme0NjYdjYvM6UXDNDMJEhJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDEjA9zm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDEjA9zm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf55c39e16so20002655ad.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780914957; x=1781519757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7rfjN8gvyO5A78qI/nvGvuW8Ai7Jn9ZQl2KKv15ni4=;
        b=hDEjA9zmnWg2MOV3Nia13b0rLudUNVxoWi7q8Xrhi7A16rxx/mtsIrEzMpscUS61Wy
         X6grKekCYsNfLyc23jB1+8YfBvpODu8wnt6fslnhuJa2HH9b4hjtCkDMzsRkv2rf2WpG
         MqZy9DZybxj0LUmuRN/F9QrFeiNhs4vt9yrWswqoHxhIx0UmTe5cIiE4mL8wUi2S2uOD
         UPn+RoCZw22ChZqvTiATVvjGaUsSvj/Jd5B2wrMCDH9SZ38XeOi8RH56FztBYVCq5Ifz
         KYGKACiBfxrEeq06nNGz7Omnv5tbNZzUu22XCLU0S9VmkrMkLjndp13Zd2f9f1y810xz
         2RmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914957; x=1781519757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7rfjN8gvyO5A78qI/nvGvuW8Ai7Jn9ZQl2KKv15ni4=;
        b=nfS6fbYp5FgnIpXkYobz8eVMixDu5J/IwrJIdBxXABmLB8mHujc+ijjT262PcgZxJj
         Jl44I0ky3Bx9XPlATSCyGRrQUJ3gVheDFF4JuBZZqCH1AcimF+D23CsAPjpsutPziizW
         sTu9VQ1fFXhc6OtRgSUMJC8/bfmHeJS+GBshNPI8jqAkUaKpkdKV5jiLttw7BE09LB1f
         XHWDauds/1Y3cJcuNV7ELLM+O+7Ld88JIxB+1z1447ocClPURyieW7eNM/+pquFnaYCU
         7o+VAO/pAI2viMdXf10t2mmI0F2kU9TZiMkEonBVbA3QxasWy6uSNM1PcGnnCpG2sRP5
         CQGw==
X-Forwarded-Encrypted: i=1; AFNElJ+Z7gv/vBklA77IA+OymYoRlF93gasmnj0FjJhdbMyj4PL816zuH2+iwIw2pwHJuhrbkIWqr0iN81QR@vger.kernel.org
X-Gm-Message-State: AOJu0YyeVNbUB1QyXxzfimqdGpKCERj8xGxPK24yMpBi3SZ9oJRCwNi3
	UWO6ypNt6q6dHmO1l7cZbfwt7u8Whb7neIBPvnwMEXgGM5aQ7CtjFGBc
X-Gm-Gg: Acq92OG4uiPfOVDBvKIrhiSr+xZBCJ5KV9qlE9uU3PpBBwAhntdPkOfNvGWZ+5B/PkN
	pzqPCrQWUhYUYcltwB+J7Wsho7zPepv/xqQ16HJJL7Uv8UUMnw/mNFxmwIN2On1bVA1pfGjrfW9
	eODavvdrnvbpEghJ0bv49xolwiW/n6XXNRWIidn+m6fqwxUTqwlKetAJZAe320PD5X9Trf4b1bz
	A/20JPQMnXFanF8N7PEXW/LkAULb8SZJF3aRBM/PmKI3MQRs4RAasYoS1zLQnyzqMCkjwrnqhZG
	ZZcgBOz0gta/AneXdwr0g+guIXdddwyvWrHs2wNdytFIo4les3UmQ3tKSYtYHkuXCD83SrTfCkC
	+3mqEGH7DUg6kfBIu8J925oz42/EFPYq2HvZFDai+Li+8IqNxC/ENRYOw45j4cs9eIaDEcfDOQ5
	yfZogiOvmZsjkvYBIQZtsrxK0AMcrNf41p4i//x7x+DbbQ2mvJ2Q5Wa8gaeRVF+2Qf7KtOoAqLG
	73WmJHyJ6pCTuo=
X-Received: by 2002:a17:903:8c3:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c1ec9271edmr112272305ad.28.1780914956983;
        Mon, 08 Jun 2026 03:35:56 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ca4dsm176604255ad.76.2026.06.08.03.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:35:56 -0700 (PDT)
Message-ID: <af7ebadc-600b-4128-ba32-d45b5ba6b546@gmail.com>
Date: Mon, 8 Jun 2026 18:35:50 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/verisilicon: introduce per-variant hardware
 ops table
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-4-a0987203069@gmail.com>
 <399cd127b56b4a2fb3161865a681606e04e6b2c6.camel@iscas.ac.cn>
 <98eb7772-257f-4fa7-8e9b-51a635cb12dd@gmail.com>
 <340c213ca47dabb8bc3d260311e2fd4818bd8001.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <340c213ca47dabb8bc3d260311e2fd4818bd8001.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/8/2026 6:06 PM, Icenowy Zheng wrote:
> 在 2026-06-08一的 17:45 +0800，Joey Lu写道：
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> index 1f2be41ae496..75bc36a078f7 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> @@ -53,12 +53,6 @@ static int
>>>> vs_primary_plane_atomic_check(struct
>>>> drm_plane *plane,
>>>>    	return 0;
>>>>    }
>>>>    
>>>> -static void vs_primary_plane_commit(struct vs_dc *dc, unsigned
>>>> int
>>>> output)
>>>> -{
>>>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			VSDC_FB_CONFIG_EX_COMMIT);
>>>> -}
>>>> -
>>>>    static void vs_primary_plane_atomic_enable(struct drm_plane
>>>> *plane,
>>>>    					   struct
>>>> drm_atomic_commit
>>>> *atomic_state)
>>>>    {
>>>> @@ -69,13 +63,8 @@ static void
>>>> vs_primary_plane_atomic_enable(struct
>>>> drm_plane *plane,
>>>>    	unsigned int output = vcrtc->id;
>>>>    	struct vs_dc *dc = vcrtc->dc;
>>>>    
>>>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			VSDC_FB_CONFIG_EX_FB_EN);
>>>> -	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
>>>> -			
>>>> VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
>>>> -
>>>> -	vs_primary_plane_commit(dc, output);
>>>> +	if (dc->funcs->plane_enable_ex)
>>>> +		dc->funcs->plane_enable_ex(dc, output);
>>> Please note that all theae codes are for primary planes, maybe the
>>> helper should be named mentioning primary. Overlay planes will need
>>> a
>>> different codepath because they change different registers.
>>>
>>> Thanks,
>>> Icenowy
>> Understood. To avoid confusion, I will rename `plane_enable_ex`,
>> `plane_disable_ex`, and `plane_update_ex` to `primary_plane_enable`,
>> `primary_plane_disable`, and `primary_plane_update` in `vs_dc_funcs`,
>> `vs_dc8200.c`, and `vs_primary_plane.c`.
> Maybe keep the `_ex` here as some operations is still on the common
> codepath?
>
> Thanks,
> Icenowy
Got it. I’ll keep the `_ex` suffix in place. That way it’s consistent 
with the common codepath operations, and the inline comments already 
makes the intent clear.
>>>>    }
>>>>    
>>>>    static void vs_primary_plane_atomic_disable(struct drm_plane
>>>> *plane,
>>>> @@ -88,10 +77,8 @@ static void
>>>> vs_primary_plane_atomic_disable(struct
>>>> drm_plane *plane,
>>>>    	unsigned int output = vcrtc->id;
>>>>    	struct vs_dc *dc = vcrtc->dc;
>>>>    
>>>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			VSDC_FB_CONFIG_EX_FB_EN);
>>>> -
>>>> -	vs_primary_plane_commit(dc, output);
>>>> +	if (dc->funcs->plane_disable_ex)
>>>> +		dc->funcs->plane_disable_ex(dc, output);
>>>>    }
>>>>    
>>>>    static void vs_primary_plane_atomic_update(struct drm_plane
>>>> *plane,
>>>> @@ -133,18 +120,11 @@ static void
>>>> vs_primary_plane_atomic_update(struct drm_plane *plane,
>>>>    	regmap_write(dc->regs, VSDC_FB_STRIDE(output),
>>>>    		     fb->pitches[0]);
>>>>    
>>>> -	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
>>>> -		     VSDC_MAKE_PLANE_POS(state->crtc_x, state-
>>>>> crtc_y));
>>>> -	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
>>>> -		     VSDC_MAKE_PLANE_POS(state->crtc_x + state-
>>>>> crtc_w,
>>>> -					 state->crtc_y + state-
>>>>> crtc_h));
>>>>    	regmap_write(dc->regs, VSDC_FB_SIZE(output),
>>>>    		     VSDC_MAKE_PLANE_SIZE(state->crtc_w, state-
>>>>> crtc_h));
>>>>    
>>>> -	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
>>>> -		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
>>>> -
>>>> -	vs_primary_plane_commit(dc, output);
>>>> +	if (dc->funcs->plane_update_ex)
>>>> +		dc->funcs->plane_update_ex(dc, output, state);
>>>>    }
>>>>    
>>>>    static const struct drm_plane_helper_funcs
>>>> vs_primary_plane_helper_funcs = {
