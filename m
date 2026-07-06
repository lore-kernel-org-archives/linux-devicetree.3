Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5E5378828
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350386; cv=none; b=BBfyXIvOtXo3HPPBxoox6LuE3JNsMkPwBO8ODiyHLil9GNbghMdQMP+ejo7snIby8drDgfthTftdBMx2zAXkvruNtmGLDuhP3hST+2Rr8q/7AEN/dkngpdikuQ5++nF3nPS7FsykCI8/+dDVFPMbGTDvgswQ2bRW8gGVnZnWtXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350386; c=relaxed/simple;
	bh=en9TJCaqy1MuIvhKYReP2ayHhrKYlB5jdQFzgnSb/ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UeQEQhNu3plTXbXc6cZ+EMFHqKnsyVbtLQq85MZhfmy0a9EV9EfsAm+KJXkqxRZVUf7ccfHRQVFw08lQQEwBamI+HG+gX2lSulrYaJVtfrC3spFU+o+aQvbammxrxq/25S0UHAytculcETRdXz+qNtgqO93Z1zxTeA4oL5CSA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Hn661OfT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Hn661OfT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b77b150aso29631845e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783350383; x=1783955183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7QdVjoOKtxuvUEU767FFuHnfqMD1JnXubUuX2zL/s8=;
        b=Hn661OfTqyy35ab9uSA4Sxdhbk92oQp02dSnUafvC6Kq8Jpf4jwfiRW63xon1fnZPr
         nrF2kjYGLoMC1+WvaZauwqjf/cuLkPbtbhbGYj7xhq4itumUz6ZbLckNWKzUDK6pGvRC
         tHRCcbHepQZyt7p4Qmg0Ub2GbKvoBqOn5EISv2bMxS/3pO6cyvXWOGvX8sWJcUYjb34o
         Zb5jUqVay9n8oYg2oO0NPyr9gsVmnzh2oEa/XU9Hf01ov5KpFMdZj6+44YVls+csKTWj
         nurmtkCYKJ9mOxUNV847v17LMv957RIAR+vxhjcDLh2lKc5H9Tfh2c1QYmMxrDVkolcI
         O2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350383; x=1783955183;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7QdVjoOKtxuvUEU767FFuHnfqMD1JnXubUuX2zL/s8=;
        b=iSf0kE8nghTpOtUt2axFZHzxqCam12R6NXz6I+B+b/xuNFyc0rt2GMil1uBRqCMh5f
         ZIT9j2GVKhwQmQaK/gv/Xj0SQSGxnoT7L+hN+YQt7DpfSjoENCrDU6AysnsrL4tw//KP
         EmnNytaYDgdeSh8X+m5LK6TTPO3qMkzNKP4jDx+SY2RWcoTrq2yDZTROvjI9Tzu5DRBb
         tSvVU405rskjgv4Y6C+gU/Vdnmz66jWltBErYaY4d06sTZIVhv7EX4oMNKabtb6c1FS2
         WlVbncIdX8XqdDBWw8mbIys0k7836nGa+EpQZUQQvf1lL0AyLxmqF5vRx6H/4u+5Dyp7
         Dedg==
X-Forwarded-Encrypted: i=1; AHgh+Rpc/3MgX5qe7XSKIYeuAjpgDPjiy21OvRQSeXhaUBv2wHBfPMUThxh7CcC7EIM1uWPQqwm3YwePtQEx@vger.kernel.org
X-Gm-Message-State: AOJu0YxZG9wSMsVSvAEYHog3oXBKfE0qn4mR5/KT6OTgguAvLdVHQRDz
	IvZZcVj77fCS4MdNGP9+MRYheZLbqwcmghGZi/1SrB7U1ZxDmnf7PO3Mgt9V6S0OkXA=
X-Gm-Gg: AfdE7cnjluORf3Eu8IcA/ErBU38ePmHIdQeqlSwAXfWUXsVF/mSmohM7DKP7Cb8BkkK
	d939ZH8YttZUINmzFE6pECgBe2DXWk49J2dyUPo82/ivFdVQs33VHqJnWL243Xv/ub5QctP78Dh
	xboTqujzCo+gud6YbvxCLRcK3qDv7ZG4yTkm/Aus+dPhc1CfQ/brXKMzCFewx5SGV22wwDJE03G
	7qEPVJkextPIf3/rN3IFeC5FCg0JDRLCzmz1RDYAankolFB04k3ylTZF87mDf7oTm6372MOx/O0
	GfwifWxnwSInNUVMj4K8+IGj55BkIlMptLb9+GiWcLbdh8HrEmtwgmViaAjnD/RUEksP3ArLYtZ
	yetKN0Nz6c/H3wTVfKAQJK98Bh6n5LB8JC07TUuQhTJFtx19rI2UQrS4KsFfgA+1Ll6b69yXY8E
	XYLOz4sZVv18cFcW6AJ92nk8zJd8Yx0alXcxDuTGI3hg0A7JCx/eKhoh8zY/H7
X-Received: by 2002:a05:600c:6990:b0:493:915b:dc4a with SMTP id 5b1f17b1804b1-493df055999mr10670715e9.8.1783350382884;
        Mon, 06 Jul 2026 08:06:22 -0700 (PDT)
Received: from [192.168.1.136] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef17c82sm291903115e9.1.2026.07.06.08.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:06:22 -0700 (PDT)
Message-ID: <a275b0b4-30c6-4a9e-bcd1-56de269423de@suse.com>
Date: Mon, 6 Jul 2026 17:06:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: power: mediatek: Add support for MT8196
 direct HFRP
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 ulfh@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, nfraprado@collabora.com, irving-ch.lin@mediatek.com,
 macpaul.lin@mediatek.com, aford173@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 justin.yeh@mediatek.com, kernel@collabora.com
References: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
 <20260701121920.19347-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260701121920.19347-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/07/2026 14:19, AngeloGioacchino Del Regno wrote:
> Add support for the HFRPSYS direct control power domains in the
> MT8196 SoC, controlling power for the DisplayPort and for the
> Embedded DisplayPort Transmitter IPs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/power/mediatek,power-controller.yaml  | 1 +
>   include/dt-bindings/power/mediatek,mt8196-power.h             | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 07f046277f8a..070c6e5666dc 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -34,6 +34,7 @@ properties:
>         - mediatek,mt8189-power-controller
>         - mediatek,mt8192-power-controller
>         - mediatek,mt8195-power-controller
> +      - mediatek,mt8196-hfrp-power-controller
>         - mediatek,mt8196-hwv-hfrp-power-controller
>         - mediatek,mt8196-hwv-scp-power-controller
>         - mediatek,mt8196-power-controller
> diff --git a/include/dt-bindings/power/mediatek,mt8196-power.h b/include/dt-bindings/power/mediatek,mt8196-power.h
> index 0f622a93c807..085790bf8124 100644
> --- a/include/dt-bindings/power/mediatek,mt8196-power.h
> +++ b/include/dt-bindings/power/mediatek,mt8196-power.h
> @@ -30,6 +30,10 @@
>   #define MT8196_POWER_DOMAIN_MM_PROC_DORMANT		0
>   #define MT8196_POWER_DOMAIN_SSR				1
>   
> +/* HFRPSYS Multimedia Power Control (MMPC) - Direct Control */
> +#define MT8196_POWER_DOMAIN_EDPTX			0
> +#define MT8196_POWER_DOMAIN_DPTX			1
> +
>   /* HFRPSYS MultiMedia Power Control (MMPC) - HW Voter */
>   #define MT8196_POWER_DOMAIN_VDE0			0
>   #define MT8196_POWER_DOMAIN_VDE1			1

