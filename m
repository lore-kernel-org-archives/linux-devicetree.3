Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626841;
	b=xXuerDTRJbThdvS7VBrGGcCV1mpUb6A0fTBD/6oykGNvnH6uLu8yTDc4RLAmtOxJ/u1E
	 2kl82W3JiON7lRbe0Dtdc7BFUp3olr7rQUz9Wz9lmyt9gCn8AeEBPR0wsrp5fprEOvDtK
	 xiHDe7kdoBDMX/Hix6FyuEK7TIOzN1VRSk4EKf4DImP1xpuK/of62qPuQKUCiNL1GXttZ
	 ecT90V1CnQZNhsP9aXXc2f7Y67pmYD/yutu4lVwAXQKfwpZ2KuV6TWemjKSMZDWx6TLKB
	 h1xITJQ3HjJWwJMo5DU92DV0BO+x5+qeeLajH0plc3wPa0cxxiNv3DLHdEh04kA6ipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
	b=P0HT5ugp6FcHJv0atM2Em0C0mpDwNn+o6vBzF+zerdRrQXkasuNciWwxdVPecKBupcdR
	 pRIyG8SnUaEl3InzIYfP+nkMQ+RZzeKpH5/NWTiHrIgQr7pDDpjpYQ+MnhgYmFdQE1pfv
	 I8gicZ+9D+SQt6urleBzFq/zYgPDftm/8+3AJURUV80mAyFcoVdqdeVO7JDJ1r3adRcjk
	 P9Lcdx9inxoJ4cwDIBFqm3RyLSkheUYEYQKDvJuftQ7nr771ZtND3afTTCJzJ7H+U2R+q
	 FygLkjk61PyOtddo4nJH9wIsgjvidHPI2Q7KhaEecfnWz7G1wtrHxAKBfiYSACE9HAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eKDDCBxr;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED7860A2621
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED7860A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eKDDCBxr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so20159815e9.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626839; x=1794231639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
        b=eKDDCBxr1jifs3GGoiY3wlWPbfIy6T3C39vvqLApgT8wdkVycBRSvTs2Au1rJTAGOA
         zlQjjRHUw/Cm5dvI23hf/BrF6Ls2q4vaGIi5d4/pL7Nb94L6s30Z6Tb8td+AnMtjJLmq
         9+dHHWPjFfryCAQSssvR2Oqa9Yeh2xiuptA1eheOo7bCWPo0O41DPJrXV6WooeUMORRV
         4CJAuxJOCvlDhmWkPCSr9ANhNjpq4Mw6EQ/FQweoKqMSuDpOXmJrIs23TE/hmIcM/FY0
         Y3S5b5AxF0CI64+HLKQ+PlAf7O5rlbje6WafaHonEOPB7Q/ulotWI1jaKBMjQ0xDsCT1
         oEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626839; x=1794231639;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
        b=m4CrQaJDkTi9EB62yH2ef85pw/d70xTJXxM8uizac9bp6Yw4LNYCOzmEKeSGna/zYs
         eU4v9o4NDmQudePeJRLQllUfHLUYvHW8G/XUPX+mdeKIo9t4ZUnS+MQ5P+RknYLCJzfM
         wKnQowFa7bU9TZTGV/gaSw2wpAG1Tnl8RrqCZVuNiJMa3DT82PxPLH7ZLGoPdNpCQRAy
         e8ZaFlsQ0BpINs2UL/BP8QdsXNyUIwy97LUkfCj1F1AiFCMRQq7B7lEcqFNVQ1e5yZTt
         5tHAURvT+q5TcJ769oPcbYAhm8vGW2BeVl4MLVrwwkgLRP254ILNSZ+8vuO0j+NA7FWo
         mh5A==
X-Forwarded-Encrypted: i=1; AKwUvByJoN4pzU1rlqdEb9OcFhSmsXspql0vk9h+SdampQtco+rjGoxyjM+82ZsXTIGkh53hxLOn6qv48Mhh@vger.kernel.org
X-Gm-Message-State: AFq9FYJECx1vncXEB0DTltm52tt0+8iGjxuYH8HXq05Ns/dOTspqVWTU
	uyBlh33j1mzgNGVTEaBp+2udazK/10JYdVhicbOsyZ6zF6nRxNyteByhJM3lvBFI8D0=
X-Gm-Gg: AYBFou014BI36OloPYniH0MSypgzrOkyxzEE85zWMF24LVRG7rurasNiPC4jHSH0V1X
	VAZ4QQ6+iaRSwkuug/2GJ1itGaABMavgkwPFQUS8QEcoI0foMrdISwEGBVmUrqI80ODCb30Sf0o
	5LZlcUXgUB3OECRxmKehLLCNuqWCYshyuycpvIbr5JLQg4DExM2FxDrviLzb3T7LLHIfmf9c2D3
	vYDdFaT3u+I1EYqY3oajtcvEH2gWwrHfxDWn17hBPIYLyqRSeV2tPgc5+ZRkvAMjtSU9yQWxX/r
	bC5cw+rMmda0JbYyBPtu0qZAOC4s0jO+hlEnjE7JOFYnIF2fixOEjqYLWM/1rVfpkAEh+ZyJjIh
	S0C1AL4gEf1e8D/mT/BBTxsTGyHbz0krTjDYFP3KGra9XMq06aTusYd2Reh+SSrajennLj6Qdg6
	sGLaP2F+UnsOYKi24eagGw8b3r3hIb8bFQ8OPWg1xZmk1Ie4FJyI1ohJ5kKUDO0uURPeaeGEsrq
	lU/IAxtSwnFUAh1/ntc5VmqOg/5ipJf57ddWJUgzV/jJe9zkK7FYJe2/F4kOdq1mgfw2l12YGqq
	0NZ+VLyUsPPokq4VjkwrXE9oyoB2+sW1sIW9p2oqn64AuZ2RLA==
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr237869415e9.10.1793626838793;
        Mon, 02 Nov 2026 05:40:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Primoz Fiser <primoz.fiser@norik.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
In-Reply-To: <20261008053850.2941955-1-primoz.fiser@norik.com>
References: <20261008053850.2941955-1-primoz.fiser@norik.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: panel-simple: Allow
 "data-mapping" for "auo,g104sn02"
Message-Id: <179362683780.3310106.8889373164273856192.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:37 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Thu, 08 Oct 2026 07:38:49 +0200, Primoz Fiser wrote:
> As per the AUO G104SN02 datasheet, section 6.4.1 "SEL68", this panel's
> SEL68 pin selects between 6 bits (SEL68 low/NC) and 8 bits (SEL68 high)
> per color over LVDS, i.e. an 18-bit or a 24-bit input format.
> 
> Currently, the auo_g104sn02 panel_desc only allows for the 24-bit
> configuration by default. Boards wired for the 18-bit configuration need
> the override introduced by commit 1cd3ea3e4b12 ("drm/panel-simple: allow
> LVDS format override")) to describe that instead.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel-simple: Allow "data-mapping" for "auo,g104sn02"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/47459027812c73d4826f5f78bc8291cb59a5de3e

-- 
Neil

