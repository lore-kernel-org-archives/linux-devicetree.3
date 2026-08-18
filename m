Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2212E37A834
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 20:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787084031; cv=none; b=hMf1tgqBev1gVIfjs55qVaf4ujQGXjrsOn4dR4Ax/UHVeyHSd4yRmq1jVc3iPvEFMjYTu3HMRS01E1kzkOQxO1g+yyiE2YLfaWDoPoBJfEEAwapclMzr4euKa/lgYNYh5gCEVb3gsXrT7u3mWniV8BKS2kWO0hKGT9FYTM6fZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787084031; c=relaxed/simple;
	bh=dIxM6cyQYT3lRdXMRsduJ1Rk39cFZjXt4pynUWxmcvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVjBLP8zfhfVUvtDyKS9BEMF04Luafp4Tq9GMXoREteXSt60x/aVB1flqXso+6BYZwbSIPUUZNSyN3a7PJvz2hIr1zf/C75K86ZbQGFE9vMNlCd3oTUDCjZAewy+qio5Qb4ui8rD3tDk0mjQCUjPrfWM4ju8H2L+eFvtK/qrtlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEF+rXQw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEF+rXQw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fde295992so121308f8f.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787084028; x=1787688828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aelghBA4TaVvCFRFUwS+75eHiLyMl0AxVtE9OK5vvU=;
        b=iEF+rXQwADRgWyzZAsjnQ/gM031U7VK8zFUrgK6RCLW+vWSOo3AOb+rInLThgfDYQL
         cO0ttklX0P76XDWe1A+xNDyA2bP39gyAXdjiSht+ElvRDRHekwa00Q0BQAvab+yCE9DY
         Vz5ZYW6to7/k1lH/2wPmadN16UIx0p4m4ubljyHXgv1TUmADZUCAGF7km9KcPE9F9uYE
         I2bWoL2l5/J7mSHPXw+d/6IkHKlTvyTWFHhIXh8IGFFj2pBUS6QoyxGwieeFVlKprGuj
         T/GB/gHnsxOtFrt1VY4eGQHpljNb6qK1OpqIoZ4o1H8PnIQUT1EDX32/oABVPsJ6GKDp
         wJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787084028; x=1787688828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9aelghBA4TaVvCFRFUwS+75eHiLyMl0AxVtE9OK5vvU=;
        b=mrwJ6Zuz+bQerI22WXreh3VhrMhiPuvhkOFBEZOt+t5wWhapMImUtTq1zKq48gLjIW
         3OiYOI3URH2UXONhSggmyvb7MR43f+rlAladZxvWUkTQRlEIegmCPkcFXv9i/huDDDM7
         N115bBWiwSMYUxKf8Xa4jhFrfspx7UV9UcKfK7iMCCcX/25ioDYJhjk4KGU+6al/PIt1
         F12jd5bPHbHsOiVXhmRKRP0q+94WVYa0hd/+cGEycQocEMl5X+/56hg8B0BeBYbA7lWY
         7NQ2JgfaffavVdK6gh0cxUTCJ2UdmkNennEj8k4O2oysZb8tSNhCom2To/XR+VRrohuw
         bYrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLZXpqepitkyvRRIlMcT2Fl8RMN8VDXebizQQ9OW9joEyQSA23J53q3apmE4QMK8yg0xMVQT8YQtCX@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8fGCqK6uzdgYuZF9MqZ6B6wg/zy96WGMVuWULkFE+xdBwEgf
	crvk1IgDcHSyfdl+tSVVH6yaZ8PBZ5uJJE41wq2/bqNFOt6gYqF5rrkN
X-Gm-Gg: AR+sD13M3XqSjLIlZUIkYTr5ZpwRYA8zxvvm40x/1aP4/hF6PC94P9TvDysOmQTtaxY
	jZaQOqEdZm9CcNgwx0NPPZXJ5qRi9bxAWh9SWZg5lfg/c4tB5CSJ1dwUoiMwj8a1FDf9sJKcXwj
	lKKCgF3olgbdqJxz30bTpwqoZdlimJfK9K21ZVVbqPA0+svyz6Mzzi0XvL/8pCIzuXt5888Np4T
	om5rImzEjgGeHqawGTW1OHW73ZXpXivqGGewfGdCetxz5aOqE395meW13360In6rtBKPo9yV7J7
	OdVrJi3AMXoRlcFsKp5nReveIF98SFijw04oJueoQeEb8e+wDvCXdDY+etGRJswkw3nQ2Pri/Gh
	KOoDlLJoGH2GMwv2/LnLM9232hnneQ5GSfEsyjbke5/yhAbb2aE6nmQ4ddPqb5FTGH8y+tONax2
	JGrm8tdQ0GKakGfwagSlfddBHd89wtw0e+axRvAHi4p40FHX5eYKSe2tLU0IhD+9bPYeoh1PTT0
	BdgctIZ5EbvQZ4=
X-Received: by 2002:a05:6000:4013:b0:481:562d:6fb1 with SMTP id ffacd0b85a97d-482b06d1c7fmr1374197f8f.6.1787084028154;
        Tue, 18 Aug 2026 13:13:48 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b77fa3sm13932329f8f.26.2026.08.18.13.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 13:13:47 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
Date: Tue, 18 Aug 2026 23:13:29 +0300
Message-ID: <20260818201331.39232-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aoQd7qsojnphARpH@ashevche-desk.local>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Aug 18, 2026 at 11:55 AM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> > +static int ssd135x_init(struct ssd130x_device *ssd130x)
> > +{
> > +     u8 remap = SSD135X_SET_REMAP_65K | SSD135X_SET_REMAP_COM_SPLIT |
> > +                SSD135X_SET_REMAP_COLOR_BGR | SSD135X_SET_REMAP_COM_SCAN;
>
> Same comment about const.

Will do, same as in 2/6.

> > +     int ret;
>
> Why not placing it after cmds?

No particular reason. Moved below cmds[] in v5.

> > +static void ssd135x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
> > +{
> > +     const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB565);
> > +     unsigned int pitch;
>
> > +     if (!fi)
> > +             return;
>
> It's less maintainable than
>
>         const struct drm_format_info *fi;
>         unsigned int pitch;
>
>         fi = drm_format_info(DRM_FORMAT_RGB565);
>         if (!fi)
>                 return;
> ...
> > +static int ssd135x_fb_blit_rect(struct drm_framebuffer *fb,
> > +                             const struct iosys_map *vmap,
> > +                             struct drm_rect *rect, u8 *data_array,
> > +                             struct drm_format_conv_state *fmtcnv_state)
> > +{
> > +     struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
> > +     const struct drm_format_info *fi = drm_format_info(DRM_FORMAT_RGB565);
> > +     unsigned int dst_pitch;
> > +     struct iosys_map dst;
> > +
> > +     if (!fi)
> > +             return -EINVAL;
>
> Ditto. The problem is that the current style is tempting for subtle mistakes
> such as defining more variables that may use fi in between.

Noted, I'll move the fi assignment just before the guard in both functions.

> > +static void ssd135x_primary_plane_atomic_disable(struct drm_plane *plane,
> > +                                              struct drm_atomic_commit *state)
> > +{
> > +     struct drm_device *drm = plane->dev;
> > +     struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
> > +     struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> > +     struct drm_crtc_state *crtc_state;
> > +     struct ssd130x_crtc_state *ssd130x_crtc_state;
> > +     int idx;
> > +
> > +     if (!plane_state->crtc)
> > +             return;
>
> In the similar way here.

I'll move plane_state to just before this guard as well.

-- 
Thanks,
Amit
