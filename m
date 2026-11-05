Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793881541;
	b=HE6IdOdnkKugyuyx1s91Wb2aITT5aqGyzvtDTLwtkZBuBICQlgroTKpFBH+/EM7/R15Y
	 v1/+9kjJN9NLAMTSucde24khOFQ7LvLlcM4xrrf3YYJCrn1W71C1FNa1nHhWUQkH5a9HI
	 gAO/MV9LkYKgRE1MWXxHVpfvBV+UYRVXaGKBKNTjQdUnEdBMZZJ+ZkgEqXe8969M7Jc4z
	 8ke9E72CmGI4z/XKPuHSUQ3/JoJD4lmgmqhpFLca/XsGflGQl2slyT4cudpEc5NdNh0Gi
	 JOsxVR4hKhLi0eRWNkGlz1tT1ZSnnsMcbd1Om/9rH815rTVjnGRiDBzPe9iyYm4i7Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
	b=UKMSqGNlBdDC7pqv4oXCL4y9xgGUa5qpt3qCywf5BABmVZN0OvMFobWz43Gc/qov3WV0
	 LF5vqBwz86ACyRPexMN+XVudlyiWEtfihgQlRHVjmbeSEruOgUXe+rERsVJGXaCh7h8+Q
	 Aoj0nGk3nJmLZUEa+bhUwsmIN1l95c2qE7ezlU94aednv64fn8mMn4LaSlfYqnU8HQoPc
	 k02wEh+NXpO/vP6dwREgOXMWdrC2jolnDvj5CYLCy90pW2aNsT1K1hailDpaNKzHS69mV
	 vr9ibaDlNP4loToGqA4uUU/kx+16JLSv+kitD1EQuFtxzYwO0x0DYkXqqCiEpxFz8VA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=QhTzZ0CJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A1606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980A1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=QhTzZ0CJ
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1328837a91.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793881535; cv=none;
        d=google.com; s=arc-20260327;
        b=Bsto6HrXx+2hNRDYjxIJG14gwqbJjCFOaYEtqKxz0W+I4W1coKS5dF0LY8sb6jwn9W
         zghQzMhP10mdTNnjOJ52JG09KljWW1u0fJXNUGQ9j4wNmUzlN0UUCeAO94mtH6u6VEyv
         b7j0/4KKMlSRmomq8u6LZ5oiyzyFOjCnG23wLCdKQb78xJkijDWPMp/a/PJmtzmqY+X0
         JjtxA4kPXPCNzMtaICTJm9KRfCxt1BnDix1Oca9vU+AdM4bGq4bp4Ik4GOtYVi9uBtyi
         hPOisgE2JEnBJq0QUf13M2UOdRLBZAXITcQWbnU7JulxPOLDd/TrP1xHqnq+BJQq3XCj
         vK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
        fh=6frSyZiO9GkJk/wtCBzwQfxnQpZ25XfRDXZfDGUxTEE=;
        b=Vw5wFKqoMr51/ID/X4UkLxIqMskvXsRo1J4Xsb29NKzguu/wcgr0Mh2VI7JnZrC7+7
         HWsxWAM7nt7GwHklperhEm9pm4yTDxg4pnWQvMJIzNwMuMt4KW6cMZ7DW5zD3Wx7OTfX
         m2HbouKhW01I02EITpRBGNOKvvIV3ZpU6CGrQFAY09ZqyQVTUM0vqTjOgM8i/93TQ8am
         +7Pk+y9QfLt03/dNFzgGzWHMiCDRy5kuEJgwKxUIHWbK+aTsIqZA9nS6KT/4FW4NJY9D
         +/b7CaiiajsZBVl7ZySUQPN0tp0YFXw+3bW8nmWWaOI0roJDGpQoSpulURnLrhFuQjre
         vdig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793881535; x=1794486335; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
        b=QhTzZ0CJ18vLkaz4/b9eNpbTjjpIWb9eEpQqby32E8VHoWNkwTPt+qDR0h41DHaAj1
         POjjjYtwWjlLaHhuiQ/2WdyQ8dv+GYBSuE8dBSrjlUc38TP1EpV+dBNgtJtCu7fmcAnj
         P19c59+AldDvwORTc5My9TKoCDgosWl1WIXqBWZjtxGv/yz7ZPGmBcVUTWLOkCgHa15F
         Of0Mh7EjLxGdfKiJxSAeMdhj+RVwrHCqTEyfsHfR+jPETRA6BTbpiXo1yjfVoXaZv6DH
         U9PSoFomXerEqFFfkmLNRUK+7mf94Y9AE6/yqYiROD6uuQFJyQCtfYOAIBtLSLYjfQiE
         g2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881535; x=1794486335;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
        b=KzDfhKf3SZeP/QiNiN+RPb/j7NBYlW8TeyEpzSPvEloYTSwOxUxim/PgtKQNTs5190
         4G35xffdiXpn8mHf5bzyN2bguxZ7gUe5jW0mK/m8Rxv3dcoqDfF1udkA2HrZDesydf9L
         rSISGCiCj2oz6qwnj78KOm8tM6qFE0Zoobxk9HasuMyqYFM/xLtquYLi+TE2HKz5h9Sa
         G8eA/zsyukK3tctk3NZDzTnuWIpgFF8veBL7FQiUo+ela5R0z0wrq+mOnjEGBTb3+chb
         uGyySb+FRm3PprtMbHGE+ugvXJOXEWAtNUDKB1pR62lfMtzk2DZtJIh9vrdhBmVm/lDz
         /vKw==
X-Forwarded-Encrypted: i=1; AKwUvBw9HACVLEGvuG1kU9ZExdmmz9fMbVxgI0J/Rkb4YbkBubAXlKvZ6C5tkw9phczYdfTA+Y0bAm/lj33F@vger.kernel.org
X-Gm-Message-State: APuU4Z/zEAzFDKIGFDupNzv+K55/nd3GuMmi/RpWDODw8BcOp6lBISFr
	VZqsOFD+T5kG76c9/nkLoIY8AFcu9q++MTC0s5+Wx7+ikP5RnjS39S2ixdp8oNak2wkZqHger5Z
	Zq3vbb4v0Ge9e3hTUenGZnL2svMtYiMgcd2lXsI2ctg==
X-Gm-Gg: AYBFou08hinylQGcJ+W2SUQshuQbzxPZ55XBSXzm1GiOy4/Z3CFbuwYtiLCkGkr/DOv
	bS+YxMeQf7hqTus7UQsN4OdEJq4x0Rwlu9HvfCBM6ac6WfJAt7x7mhYV7n2HxHYRM9AI0CORm82
	3UAKd23cXzpgFii8bVKNhkTRIhOMD5mf/bwkBKtOVa4tVSIt3i4qxu/frRAH5s3oDzjtYeKI3Ge
	ikYEOgQWqbdJyclfKsStikJCak+gMgmZfo5R0es9FEfmeOTN+iUwSsENcg9YDQHZzvPVeaZImc9
	tZHSlLdoujDesNGb+trsZI/hH3sb4O9ELwKe9XYbOJWyrdTjkSxwG/sISO47nOloKZFC8EoN/uY
	nh2LD9dhBab+bJieJ/So05lYGoZRnYhaldsiB
X-Received: by 2002:a17:90b:180d:b0:3ab:2d46:1dd2 with SMTP id
 98e67ed59e1d1-3ae895a5c46mr17306949a91.6.1793881534904; Thu, 05 Nov 2026
 04:25:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:25:23 +0000
X-Gm-Features: AclHuK94D60Hc87aFX4xe_hS9QfUHnTA410grumPTEjY5dxN4dgYm-_Kh7IGrsk
Message-ID: <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sashiko <sashiko-bot@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cristi,

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Changes in v6:
> - Added new vop2 patch "Disable core clocks before dropping runtime PM
>   reference" (Sashiko)
>
> Changes in v5:
> - Added new patch "drm/rockchip: dw_hdmi_qp: Do not mask error code in
>   atomic_check()" to fix a pre-existing issue reported by Sashiko
>
> Changes in v3:
> - Updated patch 3 to skip any hardware programming in the callbacks
>   gated by drm_atomic_helper_commit_planes() after powering down VOP2 on
>   an atomic_enable() error (Sashiko)
> - Ensured VBLANK events are sent immediately when atomic_enable() fails,
>   hence preventing userspace processes waiting for the page flip
>   completion to hang indefinitely (new patch 4, Sashiko)
>
> Changes in v2:
> - Addressed several issues reported by Sashiko
>   * Reset AXI before detaching the IOMMU domain, to close a theoretical
>     window where stale or in-flight DMA transactions could fault or
>     access memory untranslated after the domain is detached (patch 6)
>   * Fixed resource leak on vop2_enable() error path (new patch 2)
>   * Balance state on atomic_enable error paths (new patch 3)
>   * Avoided division by zero when computing max_dclk (new path 4)
>   * Fixed VOP2_MAX_DCLK_RATE overflow on 32-bit (new patch 5)

I think everything in here should now be solidly reviewed. But if this
series keeps on collecting unrelated patches until Sashiko decides all
of VOP2 is bug-free, we will never get this series merged. Could we
please keep this series focused on the useful bits at the end, and not
keep on adding speculative new Sashiko-pleasing as artificial
dependencies?

Cheers,
Daniel
