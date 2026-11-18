Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004887;
	b=MWCfbkY4GAdTqsxyLDCHBMIIgbZRoICcKxNp01T5tdrQFjvkFZCdeEoluQmar8MDlnv8
	 th4pIRYQCeWKDrqjg6OckPEGXVOfvJUO4EzWcXl+xZPXm7x2z3G+WQDobdY9a49gci57v
	 6Jc5sBSOVm2YEk5zyzac+JWBeAeOf4zdTcRE/QYAMFpS/hI/AUzON4qQHiEftDgBfLxA0
	 QDdwlRAmEoyK8kyUNe5xo2lH/8bwikxZhTZDy0Q1z9N/TgcQbV/fpQgSgkHB2BMRi8+vq
	 0yFg28lTEKKCtwEK3WAF76uXDxnWeXR7jiiIgDzzUA/L1nBKJYGOnyXg+Sa+q16rG5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8ByWoUJOn8xt5bIjc/DgDVb/Znhr0IJHP27C3VPG/e4=;
	b=eSrcBp9V5W6f37L9cU4NQcVbyMmkC4wI9CH+/t4Z2iW4PTmyURDsf7xuDO0NptUOJhAt
	 vNVY/Q5CYnIbw/Xi2UGdtWbnwRVR3r5zCkec+sm66RkuXY96NSkgRHbR5h145VX1GPrNO
	 acsYdZ1SvOEntUMHwp/H8Z6UmKRGhG7CYAevrDo364n5021UOODvVI/M/4meSMRDjn7SN
	 3+0cBGDlJnKDkq5P/X2K7gx2Lcy9ca8OiFx5A/92VjaIhM4iM1wRYLpvDgZf+6D+pLD4E
	 K1qhk5zOCFRJ167RQeDw/P4qhKc7VaSGL1m9Rp9GobjCGPuBb86/JOZWKFalouTTwvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dnVm0iMu;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230F6606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 230F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dnVm0iMu
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e46e449e8so556257f8f.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004885; x=1795609685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ByWoUJOn8xt5bIjc/DgDVb/Znhr0IJHP27C3VPG/e4=;
        b=dnVm0iMusTVZbWBGatNwsGk6hXJItGdBDtoycC83d5TcCKDiXmqk53H28++FqZOpWg
         sEy77ThBd3zr+JYDthizOa/Ef4up+kU/sEk9gWZ0EKQNXNTkUHZ0Qt0R5/h1CZpo0O4D
         HRrdZdEnfQpVJqSCOuOfiEkxtgkykjYwnK+5F7wpyGnuDEhUc7ecgdj3uz5Lieo3i/3w
         ey9N3gNim8Xh+TivB83e5BAQHPQHVOb+j2YM4ybFqLOYbWPsHZS+5GV+KGVdSnrfBhw9
         ULHSWXepTCZshnNubZQmqHROdOtpzVJ62YljmAaUndhAU3CjrdIq8LXgBdLVPvb+JloT
         Ao8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004885; x=1795609685;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ByWoUJOn8xt5bIjc/DgDVb/Znhr0IJHP27C3VPG/e4=;
        b=sdzK1ieox7JS6reZncxxgtIQopayILFZ4YFGeKjLBrjLCDfOEqofsQz4gJbIIJFzSy
         DUqsHN5rQJ2Kd/Ao0tHKLAFWShZl1qf20MqyEjmm+eUPsU++Xg74LGLbujYvw+e4SqJB
         c/usjuCgVLVfEiZW+5TSKZoOG4EZ9M9J4vK7/66j0ESxJlHJGdGXxgWDHR3cqWdUlqzS
         Ce1WYTA+g6oOQVqhfkJ4tEerjNheFQYPnJ5kzmHYkmzwDl03zEB1xQUKoqjrfKWy45KD
         MXWkDLTHf6SQzgPgACbK+NttW+CyG6A2fween0gkM07Eb/cGqVTlyf/CzxBdYjGYdxDh
         L3KQ==
X-Forwarded-Encrypted: i=1; AL+hErEUn27Piga8t6S4wxKVPpKqDJwGtEnHD4/l6ziMAgGp+WpmiYKbLVJjaaPoMEHAfnF8LBA7jvS15X0j@vger.kernel.org
X-Gm-Message-State: APuU4Z8lWx0KREnp7x/KKaYB4kpmsHB1vkzzyPGGWhDBSSAt/KbfJBqr
	BlAstFxPQI5k4MYvUJbK45EClHm2fevHV30dLdXDUpzKoOHfyOnOVHXmg/JoA8x3f1M=
X-Gm-Gg: AZFdTZf7m+37+YHeE1phgxsbtPXJgZHlbCRGQzZHPZrkcLorMd6nYp4Vq86wEAaotYS
	5XYu7zJ+WNhBmj2x7sjblh7go1uRB5JUE1/v91M5xVVx/6wlO/fW0yJG5WZ0iVh1eq0jjuIEBrS
	Os2pmIC/7mM+b0FI3gvhnqPO8AOA6s0lmh6uT8xnWR7Xb36nauX1z9ehCMYTErcWNtuLvKf0T3u
	6EPPYUDYviw+jrDtt+ASc15qAThM1nTaDqo1aUXuDtz+yghh3bET7JPwe1vFYUN7oRF4OPY2f20
	+5Tvd7KxoCIjqryalTyWnVwG0AdnsT/QHpFX/gFb+UGBZNNZEFuA9ymfCe4pFw+RHrJNSDlWHsz
	70NrmY9tDmcHRiMj3uvILIBcuHEmLa84Nh82bkIAfusCp/vNeB7fw7CiTrfO4K1hSxrWWKAMuse
	SnWtj/yNx0qSVogdFdAk0Ym3RyXEIHSuiI8C1bcZZfGsJT/YdsKXQQDzf1RCE5hi45MEZWFlt7V
	DIJCKSYtoWNYQHn6lkSBapmCJHgK9LnJYUQbAhS4ZPnA88SoLE15EvV5/HyexG5uDdMmIQHVzUp
	x/x/Vcse4CSDATaJ0AZaDbhgfClfycFiG+L0ek7+WLrA8ackjGgUgZGXm/g2RSocvWoW+GQ/Jtr
	YLg==
X-Received: by 2002:a05:6000:2608:b0:4a6:8012:198 with SMTP id ffacd0b85a97d-4a6801202dbmr3938687f8f.31.1795004885474;
        Wed, 18 Nov 2026 04:28:05 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4011448f8f.12.2026.11.18.04.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:05 -0800 (PST)
Message-ID: <c5068359-e155-4374-9f3a-1b89106c6fb4@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 09/12] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <57874e7459ed84ad47b2e31a62871ff535da249b.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <57874e7459ed84ad47b2e31a62871ff535da249b.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> # Conflicts:
> #	drivers/accel/rocket/rocket_core.c
> #	drivers/accel/rocket/rocket_core.h

This needs to be removed from the commit message.


> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> index db137e2ec15e..868af86d00ce 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  
>  #include "rocket_device.h"
> +#include "rocket_drv.h"
>  
>  struct rocket_device *rocket_device_init(struct platform_device *pdev,
>  					 const struct drm_driver *rocket_drm_driver)
> @@ -27,7 +28,7 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
>  	ddev = &rdev->ddev;
>  	dev_set_drvdata(dev, rdev);
>  
> -	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
> +	for_each_matching_node(core_node, rocket_dt_match)
>  		if (of_device_is_available(core_node))
>  			num_cores++;

I think it would be a little cleaner to do the counting in rocket_drv.c,
and pass it in as a parameter to rocket_device_init().
Then you don't need to share the dt_match over two files.

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index 68df1596014e..59a6f548e108 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -31,6 +31,11 @@
>  /* Bits 3:0 of PC_BASE_ADDRESS hold the mode selection bit and reserved bits */
>  #define ROCKET_REGCMD_ALIGN	16
>  
> +#define RK3576_PC_TASK_CON_TASK_NUMBER(n)	((n) & 0xffff)
> +#define RK3576_PC_TASK_CON_PP_EN		BIT(16)
> +#define RK3576_PC_TASK_CON_COUNT_CLEAR		BIT(17)
> +#define RK3576_PC_TASK_CON_LAST_LAYER_CLEAR	BIT(18)

This introduces an inconsistency in the way registers are handled. All
other reg definitions are in rocket_registers.h (originating from mesa
xml) but this one is placed here.

I think you should add it to mesa as some kind of register variant, and
then regenerate rocket_registers.h

