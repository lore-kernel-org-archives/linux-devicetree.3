Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646E3F6C2F
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480076; cv=none; b=QH5oM8+pQYtgkPaFxlS9MutiaUBpHgud8YeuYf2Gyb/vlMDa6lwtCqU425lb8H/aLe2DiWp5YVvIF7hh+OXtu06cPZyoAci9EjyWRvKLyMEN0MCQwYxdPuh6sL3x3PojJMBLU+3zLYeFvYT0ch+wCFdMTJdJqVk9P9s+6heq9zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480076; c=relaxed/simple;
	bh=BmHJUIMl03bo3cur4LADSXTy4zaBjOxIh5/Huf4taX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGctXwuNmKQacXc2qBac4l4T7KcbJRHVfAwCzlwGPeIDO1OjrVVHTt3bRpCtXDwTUSDjGNUmHHi7BKt6/odiQtIh6n1wIfeWfOUtS0EM9Fw9iFgR2bxEYRuAl6UYy+PwNpXGr6qyOZSst/aeGKgq1I4MzbR3XhT75cuV6qfK4+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkaYQaS6; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkaYQaS6"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39ad8dbe947so388061fa.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480071; x=1783084871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PwLoCPBMvnE4mFTZ0Iskkh0u0N7Zrq4pjwblbNDMp4g=;
        b=PkaYQaS6PtmcNg1ur2Q/BR/QedyX1N3Dty2vObF9dIlIOv/32BWyw4VLapTh/7vy6q
         KmQDxuUB70vZp4SZxNaudmPmv3HIm8FJojdTss5xyPZ4O+PqJ50CQxDNKE8IVrMDmwjC
         3qRlyGwyn0DLecjux0Vx3Z4fi71hgXeIBji+cF3Up7CR1Mg4EzeMUggl63Wh/ITTmT5c
         AeFtBOjjZc96BFIGgApe30vZrrwFksucZZqLh+5oI7pXAHzrj8e9itE4WfG9AWakRrlB
         QxYECNIxvQ18efG2Erw188LaeJy32xxA4y/e6bpN/MJryxvhRDvY3IqgADXadHkpsvOk
         9X+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480071; x=1783084871;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwLoCPBMvnE4mFTZ0Iskkh0u0N7Zrq4pjwblbNDMp4g=;
        b=jXSsXY5qDzyi4hwh15R+YnzmPZd2Xhj3Wq2qm3jpNf/OFT1UYjWpZg8tCg4ypD+lus
         DwKMwOwXgBpoYKLOlnxrCE9tP2JfpW9EvHabm52uSt4R/GmJMPPN8q0facFsmAWZm0s6
         nIovxchRruBzc+Tjb8k24fo5kElJMUokj+hRcmv8xKTfkNqfQWgjCMRFk7Oeg1mc8dT9
         5Hv+mEepBWPj2rWUTn1UDwQ0BXE2HZIP9sddRpXPQ6MT7d0mIjJqqZWMlcPce9G/T+Nr
         id6QwY6hzCYbPYJr5bbWCFu8FhZgnEEfwdKrCr/QK5YxVRDX9vhbnRxCrji+GiP6QZN8
         4L7A==
X-Forwarded-Encrypted: i=1; AHgh+RqHw8Yrt6YG4dHg/p44xYOiBCrplgzmwdH0s13PiRrXejpgeU/OT3SUPBoUv7NUsWayFZRrziznxkr4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6CSfhTKCNlDP/PbpZ1rc4dA9gdz4JjW2SI5MVWfc/krZzILQZ
	QWhxoGN2wwb7z1zci1mDYfVxqUmdxSWsSnacHwC1e4YB6R2c+L6dgRdCebiIQjy66/E=
X-Gm-Gg: AfdE7cnFjZituuHMYVn180M6tYF8cCFdjOlYEyIL9g3W89h2CFyOZ9KI+2S2rxmX07O
	T6JT2IgCtUc3GzvPTCPsEyYI48vkbffsTnxnIRc2t1LbScJwQXXcKQrXQdty1LBUhN63bNDwHL2
	zLNgpBcsA1cAtXqLyKfsWwIB3I71H8HoKvCL57vq20s3IKkrwaDRaHfi4IU+6s+IhO7OqodBXml
	8Gmtv2cxAXFxlBy2+YDLyoQ+mwAG+golO9OOgxAZPFoLe2OKdiHf+X5BZbTYqimCsfMCe52YLCO
	q2FfoQwCSJ29NqAUIvDgMhwBApwtKgGWf0bghXGxePOpSSVlIxbmoS2umIq8DkE1q4My+teUNuF
	wT1ncfNZAavw0HJXh7sGyGuHM2VtR9ajYx+qY4pTWJcfClV0qJG5kU8wZ3T0s8CDm2ZjvNlSHk0
	votPJ/dVFyGgPd1h6hWDI56hms221gF5J8MGOlQBaU0JAMCVKyjPSo/os5g/CmMKamfLrm4ZyJT
	QWFAw==
X-Received: by 2002:a05:6512:1252:b0:5a8:bd9c:a2e1 with SMTP id 2adb3069b0e04-5aea1f3c156mr1200847e87.2.1782480071016;
        Fri, 26 Jun 2026 06:21:11 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad695859b4sm3327909e87.72.2026.06.26.06.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:21:10 -0700 (PDT)
Message-ID: <d14af4aa-f791-4aac-9d49-ace834952257@linaro.org>
Date: Fri, 26 Jun 2026 16:21:08 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: media: Add macros for video interface
 devices
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
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 15:07, Kieran Bingham wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> defines macros corresponding to the orientation enumeration types from
> media/video-interface-devices.yaml.
> 
> This allows avoiding hardcoded constants in device tree sources.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
> new file mode 100644
> index 000000000000..d2340b457292
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interface-devices.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> +
> +#define MEDIA_ORIENTATION_FRONT		0
> +#define MEDIA_ORIENTATION_BACK		1
> +#define MEDIA_ORIENTATION_EXTERNAL	2
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
