Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5560A3F58C7
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480105; cv=none; b=ZYFb8MYE9JsrCXtxK+HN8toUyqZOXI4yH+UrBD+d5QhBdbrZJqkwuMep+sgjjWpKp93FOSSyiZxetoFB8Q+ALTWGWHn24n+AX//jLhJgCQ9D9xbpmRReXlJMeD/GNXyUT0DV/wlugJ//yo62PhEIUMdWt3TiNEQmVKIoEruCK+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480105; c=relaxed/simple;
	bh=pDPGZpvd3IfjOFyuEjSQA4JA6xmoXsUV/fcdGa6NUG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3Ss8Z5j3CUzYmGDOd5qshIfUXKZ555UGK3lsf+Ufw6DnnIxrlnHPXdayRXRNr3zGGU20jT3PKwPmlVTI2vFot8Ct42FWvxFyLRbxXoRke5vctx7ZdFw1ApazAHdo/4T5vadCWRTvy1vFMRx3ErxeszmmOv74f8NRMVYqrgBKXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/Qw5rP6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/Qw5rP6"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39ac84e7931so453061fa.2
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480099; x=1783084899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=;
        b=B/Qw5rP6P9E6vM8O7H5+9+I55m+myjGt97X7hm3aQv+YJIVxJiW/ss5TV+REMIC/u9
         XeQIxLgXiPqER7xHieH8EoLAnDQHPl/a53LrSm5vvOB4NyYn++7Wc+3SRyJjCitTeE1k
         WJg5+Kh4VCWE0pVL6/LuDVQlIWZbS/ggFD4IJK0d4z9RwkGsoCNB+pHbqnPhiJWqNxZy
         CCVzYzvxZFIJ+oAWwr2I5T3nEch+GqxTu2g552VQtIBSG5qe23Mjcq7nU+7i7lQ6sBm3
         gOD30L7a6LJ8kqSxoGZWJCz6HiyLeu8XqG8BNMhy+iKjj40bTcE//+P8w6pFCubmgCq2
         P0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480099; x=1783084899;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=;
        b=JYPvEUy5cT6tgIbxWp0Aw5hJcfQLcve3sDtoc2AA4JBkWKCMsRbfsU4VovCp74f8mK
         17SbvfkVCbDOESviG1ZQqTsxdPvdb48NmTq+3oL76ZFrGu5mt1o9YEiMkCe+x4BfcbDg
         71eEBbRZ3r/VUYPO4O8yoZfnfZZizWxVq3J79hBli7nnzTIXxTxMMLgOjoToL9WPjW9J
         Q6E1CH01JVXOAtegVt7CXVxtUbC26I2FBOI6XzUjigcv6Uj7wTbZkL5ZVgsgoFsfOuzS
         xooKMa4A/ySByatAxUNzb7YpGq4kE+oC33LMjO6ayPlT8cb/kt921+66NCUoyTTay/x/
         ZMrg==
X-Forwarded-Encrypted: i=1; AHgh+RowwXaG04qx9LsVilvHzeIEMrG4XYQUF2YYT6llaOpJZOajRTXuKgS8mFVIiw1HkkYPpiXplT2Iw8tO@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLy3MzPo7g32Gs1LX0NOSR7x7VxCimRywk2ivEgB+X8jxUnzg
	6isfrYJgX/+F5hi59U7PxFSQCG6tayfHOmMk9Qyh6woOQcmxrXEjsV20Ddl9K2WzR5M=
X-Gm-Gg: AfdE7cmtS/+9oM1YFnphEGAck+vBTgg5QMW0nzU7rGGlvbrwXXr1S4WcSdbhYjb3hYp
	P1urZZba7s32c8tVKnVZHZA3sWS/P0xvbNyNN+cnho77r4bcZpV/XV0MSgMrbhgLsIEi5iUab7s
	Kh/cOkYqQQSo3ng4njMSi/zowWkKCwmD0Qu38uwFK/jnIRy1Ym8CBCwoZlOYXyh4JgG7aGdjKUN
	9wosH4f6COCJeiZzWthKEBLWgktvGn6QKwdF8SB0sZO/OayCa+ttMxbnuUQFEiuCooT/ELlM7lY
	hxd+xUT/DJdELk6RK1Ehm7M1jHsqMVHwE7LAyta4ZvPvorPZDU0UhQT2sve4qLc7Lc3d9O7V4CT
	HB3ESA2iceQDgHLeXETveiuWeGmtH/2XomTgv6Gq1kCdHSxxFVRZjOuLzpXbvQ5PsJ4XuinFEpu
	q/tx0mUss/iTrXKCC3t2aEI9SIF38Jl0LzW7ahV5UdPnezTzK1uHDU+9w5EoNhGz0ctpcyiIlUO
	j0BUA==
X-Received: by 2002:a05:651c:1511:b0:39a:c9d5:3c65 with SMTP id 38308e7fff4ca-39acb97be3emr7979051fa.8.1782480099479;
        Fri, 26 Jun 2026 06:21:39 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ae2613f76sm460481fa.30.2026.06.26.06.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:21:38 -0700 (PDT)
Message-ID: <2f238823-d340-4cad-b6f0-24ff86ff969b@linaro.org>
Date: Fri, 26 Jun 2026 16:21:37 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: dt-bindings: video-interface-devices: add
 video-interface-devices.h references
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 15:07, Kieran Bingham wrote:
> Expand the documentation of the video-interface-devices orientation to
> reference the include/dt-bindings/media/video-interface-devices.h header
> which provides human readable defines for the orientation enum, to help
> avoid hardcoding values in dts.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index a81d2a155fe6..c9c3f4f16719 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -392,17 +392,22 @@ properties:
>         The orientation of a device (typically an image sensor or a flash LED)
>         describing its mounting position relative to the usage orientation of the
>         system where the device is installed on.
> +      See include/dt-bindings/media/video-interface-devices.h.
> +
>       $ref: /schemas/types.yaml#/definitions/uint32
>       enum:
> -        # Front. The device is mounted on the front facing side of the system. For
> -        # mobile devices such as smartphones, tablets and laptops the front side
> -        # is the user facing side.
> +        # MEDIA_ORIENTATION_FRONT
> +        # The device is mounted on the front facing side of the system. For
> +        # mobile devices such as smartphones, tablets and laptops the front
> +        # side is the user facing side.
>         - 0
> -        # Back. The device is mounted on the back side of the system, which is
> +        # MEDIA_ORIENTATION_BACK
> +        # The device is mounted on the back side of the system, which is
>           # defined as the opposite side of the front facing one.
>         - 1
> -        # External. The device is not attached directly to the system but is
> -        # attached in a way that allows it to move freely.
> +        # MEDIA_ORIENTATION_EXTERNAL
> +        # The device is not attached directly to the system but is attached in
> +        # a way that allows it to move freely.
>         - 2
>   
>   additionalProperties: true
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
