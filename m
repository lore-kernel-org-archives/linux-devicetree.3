Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256944;
	b=ONhrXJ5FSRCZZT5jcJy35l09vuvvGPo/Wa0g2lMV2DxtUIcsxK9YHT/YPDOZQB4IKN2g
	 LTbq7+NnkVG5R94b87njrOi2s3oJGuu+7eE2WN1kLwsoFkFym9zUWVyfi+WHSMPGLd9J+
	 0mnzidEOUgDmmT73sEjDAAzIieKsju1yyWwFCZY49FXqdq/yF+4/9cN9zyTYLQmMfYlzi
	 NLOtr6mqMplfzQm6Js4KAMBu/+AF+VUCvabag8ThkTmHEtD/19jdArHXh6G5wlJmPd1r3
	 aHzUpDk0JEHTQpaE41RtB0DHpJqBdIAbLN8ak9Q+tLHxGpVTzYMlABj8Wfw6lKvT6AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
	b=NtpdM/suEn2qin53KjXZfeg0p09ZP96v+JhNH9fQvWRz9AGJbGJ/4WfNeFa/tvotZuzV
	 Qz59lZVJ8hG7Ppa7NcdJ2e+RLrAqV5cczyXhCtgF79X/QwYOBdd5bD3L/nq2c00+0xws4
	 YjymJqWz3MRRktXs3XFdafsiIMz0WT8oo+oxmplzslLAwZvrb8Ar/TdQRdj5wbgYhRa3D
	 kz4kOXWkYKZ2f1O9SLnfvJyMLqwnKRrzOCRb4dWvgx8nDTAiQdqDq5eNe9zM3Bgyc0o9B
	 PI4S/uwS2/o3QwDyQHDzDaII5c2ZSQDEleF7cf/m91izBb/t8Xe8ZFTT+OiKwODv8vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WUETKudL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD38606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD38606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WUETKudL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so11262285e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 23:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256943; x=1793861743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
        b=WUETKudLdsxInqGaecGL7sRWIH7KxLIW2z1l3gYvlkMRE7/ykm6SHCTg4LEtGghEBO
         2OGUWkI2GDNHIbNRZcyror9edt+l7slA4g79GXJOZzRMXF1UzaPLxUTtGfSlVWuJqToh
         HQwuRSVz9M6Q5UNemeSFnnU6fro0dysngavrymgXeIatasRC53el25kEaW6Ozb0TQHpy
         xogHkLocdkJb2bhDXfSbD3DsxwyOioX7/WPrMCO84kcUH5mLJHQg45Bd+NIFVnmuhNy/
         804Ik80SVw7TtHQfbP/e0sjn6Wpd9JTZ52QwnPjPRGni99kjTCMPEHGnK1+WlzF/n2D5
         D3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256943; x=1793861743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOhqmpD4X7Kw07Ng1ggleQiy306bjRMLXhpTJKa1eDA=;
        b=hf6EnrjBAlWpNSQAFbwbNRp3ftK4PIIpRJOF/iPvkq6i0kv/emI04AR0deAIZZXXx4
         CfZ+I7vnFrtmYcuhAQoVgLd4xu+wzv1jV/SdTNxLHtlQtemHUkBepTqcvkKEydx6jenv
         jDtqDtA2EIkQ0BUEuF9ydJDy1/nvdUSOsbnaXjlKesof7W6v8/H+8t/nZTtE9fcumBOC
         XWDnDC843CX3Dq1vWb86LIBrg9/JtjOALzJVaw7HT1B9fcrlB4KZerctymxqR1pMR8py
         V8/fVLpOSAeRqgw/VPGDoqgUAqlIuzAjIy4WLpidE+4ioadAHZ/B0HrloVoE5/Y60963
         jorg==
X-Forwarded-Encrypted: i=1; AKwUvBxuTiMKg+chn/Eaqo/sTLJroGgR2SiWtybkUnkF5DFP9CbqQ7fJVO8v0IxTpSXfgOmUVVH9WP9F2PwF@vger.kernel.org
X-Gm-Message-State: AFq9FYJcSOV7YNUivwjSpHqSA+8i14gLF/6O0KJg85YEZHqZYU9fNNv5
	fS9cTooOMWWBqg5QDMBxMfMWAZ5Nxm8Iud3NJOLa5pw7ndycby7yk5lK
X-Gm-Gg: AYBFou2lSXYnv2CYw/4t6vh20q+T6xEolbFUqmm35QvXpIZsTQnI0ZPH9T1Ej9VcdZ1
	M/tBAHk51A9cePH6vf/0WpTZHWeieE9ElUZolGjSlnNC7qnakuJ1OMhsbAWK2GO0NeRtjThIZCx
	83d4PMD3+qJ/DQXEEhofmFlpUOFolxQDzut3pBKcv4eRrb21N5kUsOtdFwvnyXPthC4NTZ4eW4x
	6bhCjUB4NqM8UOcoeCSAcD33pkYz5V93dj6T2k7Tox0qAfEpj2p3CB1iIZtQaUYjRSThhE3C0dj
	heTuL8GmxE9q1SOjrRxm2MxbEXXk1sScf1Fu+NfZdeqqcc0bAisypBDgjwZrzVrFudA2hV9fy+o
	GwhJ3vk2jaJiC1oEE+Bx7mdoSF7Hy8ARoOQVnxYOiSr+TbjSpAc3rbPeG9Bpf8PWkZIktbYF5yP
	JCm7IZNPoMdtymzLwYR7oHZOuZOBm4Q7RcpWX26He/GYZjh2QD+0o5fguhcDE2RXtwflG5JNevk
	jq+EZwyQ/a2z35defn58RX760u5sFeAeybkB97VTixzgqE3zll7NTgqFkzWvmzx3dCrJ1bAC2Gq
	y9xAXuIZholQME/UF0qjD6DfWwXHcyRXspCj54r2YTpAxV1VsIQqtBBmHtgNnWpdpZw5hZrgPF0
	RUN2wO/JnLA==
X-Received: by 2002:a05:600c:34d6:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a9660b54e8mr101112445e9.6.1793256942680;
        Wed, 28 Oct 2026 23:55:42 -0700 (PDT)
Received: from [192.168.68.70] (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a930a63eb3sm87590825e9.1.2026.10.28.23.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 23:55:42 -0700 (PDT)
Message-ID: <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com>
Date: Thu, 29 Oct 2026 07:55:41 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/28/26 22:05, Frank Li wrote:
> Does it only impact superspeed? High speed work?

No, it's not even enumerated, on the Dev board.

> 
> Thank you report this problem. Suppose below patch should fix this problem.
> 
> I have not time to test it today.
> 
> 
> Frank

Tested, it doesn't help.

xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
of_dma_configure() and the new code in of_iommu_configure() is never
reached.

Emanuele
