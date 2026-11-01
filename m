Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542673;
	b=d2qGDeDXFPNr1AQHZqrpfPt4ClFFtsgIfUYepNv/NhikJakoMjs5SG6BYpY5uKDlroSL
	 eECyOStcZ/YgSNMS1YRNvHfIFwhSeXdPNo3jW8kdjK28VEhW+XO/It0/8ZvYs9Rp7YVL1
	 UUxzqkTBW2ZzmG2uepMpQX7Zpg8F761Gr7PmMFMFck/aJifk3VVcSF9hKGgDecd3c5SY7
	 8675YBYTh9PAqZi2MYGQLozxQSXikAPK7EouDX3xfhRR3glIKoW4MAFCyaZ8cvjtOFJSV
	 GDSVU/sawTP9ZE+0dfb9GBqJNE5rSSAWHI22usWaffn+0Wl/klGEzm3qxmBQtJWR7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542673;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QOWCpj5xocO9r4ovITstA0AQSfIrmgmI9TwBqylnJ5Q=;
	b=ED2qsf8hsncS5pUc9lgAJRTFCB934ou68tS/pOYzlRC8kEFuwSruh7x1zHaj/2rEeIvP
	 B9NqOnGx/lf1lEmg4+fqVuCjtfULLzakAZeA7E05BjzKh6yeVGpyvF5GX8CADrQK8X1zM
	 /i31CJE7roz8OhSfcDIXP8tntoqokEdGXbJ6fJYv9q1eQPaNPOxbHlVK2xdxlxl+VTA8c
	 Yg0PnShYUZGTD3is64ptbcE8L/T9Pv50mGzL9XKrTym2W+JxqvP5BF0t24a6eSbOKoMME
	 I1UQgRhQ1nz+P4p0f/A9xg/ETt7o3d525LiBqT1ZL+ltxUL4+4Q19cIZZEvyGYXf07A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ek1s6Hkx;
	arc=none smtp.remote-ip=91.218.175.16
Received: from mta0.migadu.com (out-16.mta0.migadu.com [91.218.175.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D3D606A325
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D3D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ek1s6Hkx
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fw1iLfF3jVbpvumv35xApp+yxHDwlvLUfs297heBAlk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793542670; v=1; x=1794147470;
 b=Ek1s6HkxlK+V27Bb2Ov+HW/BnK7OzFsz+5APl0d+9wOmjo0ggIgXOuaxGDiZbc8GCRRoXtCn
 UtRT51AMrkRDUW1UMtMC6HpzHF69KSPalvYIB0EJSRwR6I3fyT1P4x1kyLTrRgiTa+MngHcJCp6
 uYhpQ74AyM/evRmzRDPyZiZo=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bac851f887adadfe;
	Sun, 01 Nov 2026 14:17:50 +0000
X-Mizu-Trace-ID: bac851f887adadfe
X-Migadu-Flow: FLOW_OUT
Message-ID: <b7cb1cad-07de-4ba2-9158-de8de43236fa@linux.dev>
Date: Sun, 1 Nov 2026 14:17:45 +0000
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
Subject: Re: [PATCH v4 08/14] drm/tidss: oldi: Fix serial clock reference leak
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
 <20261029-beagley-ai-display-v4-8-dc7f2b532478@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261029-beagley-ai-display-v4-8-dc7f2b532478@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/10/26 10:18, Tomi Valkeinen wrote:
> tidss_oldi_init() gets the OLDI serial clock with of_clk_get_by_name()
> and never puts it. A clock reference leaks each time tidss unbinds, and
> each time its probe fails or defers after the OLDI setup.
> 
> Get the clock with devm_get_clk_from_child() instead.
> 
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

