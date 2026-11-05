Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880413;
	b=jzarBB2YcbQMdZqiFSfcPxDaH+y8xNrqIl5ezse9vgJrljFzf5fLZPodmtkhbdGy0agG
	 +VhO+cW6epIQjJ37vJYoDv38hGmLxP7Uf7fKSkHTnsWqpifOrUa0X3qyVK+Tcjce40+Vx
	 MKKh/F99VmrVs1X31ukQ/uTTO9aYKViO50w2s71ZwCd2h0E2dVVMp4y/ZX9w3NUicqFiB
	 uGKQvdG/FPI3+tihm0pA6DDYHgdS9Gi9hpV12Clz8CgYQRuWdJV0MszPK2QPw6t3gxdlL
	 o+ECi1dh2OY10MRgV0LUlRINVPSpvyKCO4WlFlnx3YDXX4/wqW1QZ6Q0pjAFk8PgTqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
	b=j5vKPdYb0pBSh4ZNDVOQqnkqwDQOfsyA9IAP72XWYn5eo0p7ArQJ9G2NY6f4m16wz+pu
	 2po+3WYRF+8i/js79FhhrIAsdIkSEDL/ZvkVIIhICClZx5T+sODqiuptKRg64Qal3Aucj
	 4IoUG11dxR2k8aMQQM3z6aw00f1eIDzrMEfTmE2Vl545Bo0BC6q6zYySrQZNVph0sWD6d
	 /8nt/1osTLWe0ypK3aNfth2m/N6Tcz0REVXNgzKd80H7fsuoZ1ITgSqL3ytKY8VGphMP1
	 RBQy3gYjaTDSjOxhs1VigEjqokWUB7kGCAotHyFrijemjS+qPk562Y1F3u69WsEjSvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=nerl2VMh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794C1606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 794C1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=nerl2VMh
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd3310348d2so244658a12.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880412; cv=none;
        d=google.com; s=arc-20260327;
        b=f8ZLw79xp3yDGOjoONnRxo7J1X0Q8X71FAw2L9QPQ1yZxnFosXxHflexvP5HZd43VS
         Kg3Mf2MZyr74BTvhI9SAQXkEASuEfd/oYaNlJ3vFugLQ1veieAI0hOt2RYfXilHbQ432
         YwUQ4Pp+k92jWFbgQWtto2UruYe1aQ+llMu1utjYcX+wKO/Re+xKpNjzNfSliudJV3kK
         Oe4uMQspXhKOe9hOEoTAhSu3/wk0768mzOijEZxV4u3tpZS6zeWZc58mmXDqqhOIX/aO
         6cCXhtdoTLMolJXom+9mPib7dTdeoY4cDdykBiXNXzwt9ZBBc1funxsSIu6BZJ/GkhP0
         s+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
        fh=SBtlbdZTl0rT6CYX5x8b8vbOJ1VPfGx0mwVNr3ZNqbw=;
        b=HAyQsR4Hw6EUkr5NtjTqOtDniTCME+bj0lvsb1XtH45u5HImh+2j38PiVf35ypHeMK
         a7zgAmNx0bE+tnARIB+Kqd/qfFtsb66RTlQ1UsFj7VB5Nz1WiY4r6osyFXeJN0neXNy/
         Qp8NkESxNz9lTs/5aT84FxuKCB4Kue1PTAeZZW+I9zbzDyK/bt2y5hLnSmWyVC/Rkxf6
         KyyWkg09mPMEZ21xsPk7Tfq87xabV+0uSLzXqYV5pcR3eSpTVnU7zSfEvSEpuWtfvTX6
         6q2ON7KGhmUfcbRVPkUbZHwWQKHreq3z/cV1DiCoaQRX/r/E2q8pXmey0fOtHOtxWJgg
         56PA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793880412; x=1794485212; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
        b=nerl2VMh4VAzCzn1gPQetp7gLHry+Oo4GJEgU0dqhH6kHKg4JgeucS3GmPOVKBX68Y
         A6hzIRRZZC9smxgV6Z2Q6tYTEjxkEGad6zOuVJTT4fkpJ91mPn6iIh8cuxXZDsNJ8EgI
         vqyt+rc6RvDlk+/CQnvPqBn1HHAq8hc0YkwDMhL7YQ8INoleA2u3So6BtwtlutUwjP0o
         rF9kjuY2DAo/EL5q8w5tjlW6cjiBbOu1ghuJWyt1dKSaxiuAed5pfK1LgYbj7bjswaV0
         CGiyXLzDoUTocbPN4IFKqXYZ1bOgZsG02qZTgUcwRJ1EXEUEgDdJcGgn8B5tJ+cqJwOp
         4sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880412; x=1794485212;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
        b=s+ela4W0u8Q+I3/bwCkWKWuLKdQfcUAvzylEsHyS3cURbSnC5VQ6hwYVAv3HXGKvUE
         MK9ED7iYacqcMCsJeozhcug+kBR5rAnnTXNzW/UPsW9zydBJD7HugMlCIsCKGneriixQ
         riuJsdolPUBWx/tmtzQoiSmJq/KlK8dAJwmQUy7b3S+/2RXrUQRVmi6m0Cyxa2+2vm5N
         kkuJP6KETX/wSKGfdBs2TDLkPlzxk0Syna0eenvPtlamFAW0nrOcfZxA6Tl2R0FbhoVn
         RXwQjyXZEtmP0kxY/NR0EZSXUY0e9XbGy+T69KfsjyErHU/u5lHHm3J8R14C3MzzUfpy
         esDw==
X-Forwarded-Encrypted: i=1; AKwUvBwr77jRLkwP6O+h4E161jFKMOyWMSIDMMJRFNX/HojUtnT2s+Slv5Fa47KwATVHJL50vwI8tNVBeR9Q@vger.kernel.org
X-Gm-Message-State: APuU4Z+bkm+sMI7kHCX6NBhjbxJhxM0iB8I2Nyl1lsXBaY8g4+4n/iSe
	HIBP+VdH8hHn0D7HC3QzsVJ2CQ5/jem7yxL5BaG/7k6aXwbsv0A6npqLbrEOkl1Y7yruOunvTmf
	sgBg2avWvK1cqLrhl4tbVekqJytSFSSWkW18/Z0BMYA==
X-Gm-Gg: AYBFou2AiaonrJQZqluM1Cq/7wQG16arYb7hAnLCYjsSJuPdAjiw9F9q9azk7vpV+H5
	r9McgmQoLBhmBB5AHT3uRf//gUpG/AvZg/0lM2A7OtCGHNlaYDSu+W6ZWciMYodiH+nBSfjAmCx
	Y5JU2fXX5xCgBcIgauUeasthAXgwqIM853nqTvxLlgg++Xpp45YiRHP/2yeFD+FCu3knNthpoHo
	WQoClF1NbRYVlSdiOcWpjOgP4VkYYZkq/gqyTFUmH1lJjqam6JgbB362QdHnYd5XRe1aLVyhekr
	ydlwoanJMoC6mjtt+gSxh3+8cifge1UppqjLscU/Z4GxD1U4gc2uLW8lgxYzb5IwrgwGcmajqJN
	ClnnjuLhHmbGUTqedI8NGNx0N1LYgizNIXd1b
X-Received: by 2002:a17:90b:1fcc:b0:3ac:7406:b49 with SMTP id
 98e67ed59e1d1-3b0afc29351mr1335407a91.15.1793880411843; Thu, 05 Nov 2026
 04:06:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
 <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
 <CAPj87rOMjFEjOQ9TVgbGWu3gTwVjmjuFNtnFiyxbWO+g_RPqeA@mail.gmail.com> <f9797a72-2fd0-4127-b741-dfc6cf3306f1@collabora.com>
In-Reply-To: <f9797a72-2fd0-4127-b741-dfc6cf3306f1@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:06:40 +0000
X-Gm-Features: AclHuK_ucWApughnWJGAl5cPjcPtGno9PpRPUGuTDrBVFiQWtpP0tMXmnOOScVE
Message-ID: <CAPj87rN0944v4OyeJ+VNn5QBsnPsjGJUvNqiFmQFsO_wakOX=g@mail.gmail.com>
Subject: Re: [PATCH v5 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Wed, 4 Nov 2026 at 20:56, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On 10/30/26 1:52 PM, Daniel Stone wrote:
> > Same question as for the VOP2: why only special-case YUV422 when
> > YUV420 also needs special treatment? And presumably in a way which
> > can't just be mashed into bpc, because the maths doesn't work. So
> > would this be better off being handled as a separate output-mode
> > adjustment?
>
> For YUV420, the halving is already in the TMDS rate, so the PHY PLL output
> equals the halved VOP2 DCLK - no special handling required here.
>
> However, since YUV422 is not deep-colour packed, its TMDS rate equals the pixel
> clock and therefore the PHY must get 8 bpc.  This is essentially what
> drm_hdmi_compute_mode_clock() does, forcing 8 for YUV422 for the same reason.

I don't follow 'deep-colour packed' as it seems like a non-sequitur.
However, the TRM is pretty clear that a 2x pclk divisor on the clock
rate is required for YUV420 and split-VOP display outputs, so this is
fine.

Cheers,
Daniel
