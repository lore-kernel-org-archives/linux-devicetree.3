Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261572;
	b=YCE7oklxp+2izMoeFc82FSziR3/CgzQhR8ET2iNFanM6wVzfrtbjA/mgWqV0eEYHDzbm
	 bKNW5ix+X3S+qWLMuC59tnerZweJ9JGK2lpa/4XFEc1liNmpYJFaGuPMy+x8J9VlJTYnk
	 Q0uSKuHJxKo4yPNYYC2Y1PHZ75Ti1eYw7aV7A1jjNOwLOckKZf64rZ3GdL2uTMwxshFul
	 uVG7ZcEutlrsBNFZBguWEnvKjuqqHcjgV9QErFtCJyK1C+/WluFrRR6ax09yfurbg07Pm
	 2qVxnYxFmkfrEGaQYLpGtWJK1tOfXjd2aQMCZZZZKzUsVqG8qss2lCBaZv0Rb4is29Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5bq54PBPl4YCnVxEmHl/CCwjoHYf0FGqHDDIF9WweFI=;
	b=S8PEXNb+l6c02SKWnly/0VHAo+jFEKXHNGmQ63N316u8dBwH2T5pPsWdVBi/7Qy4rSfh
	 AOk1rk1pVKWiJOV2AcO8Em9kmBHOCCzdHQec90oRQUiOwjEwmxhfTVCFuCWgPefKmjRzx
	 QXbLvMU9G82Zub4VODLVMwiDbtBXhQDoqymMzsMa2DyC/6UrFtnj4uo6jPTuyhdp8T+1j
	 0Zq9OhyexFd3PLjms6sdm4mFKNuBTQnvRZvOgM8ua8fhuz6EZ48rVCPZ5wwdItXrvLG89
	 5BAMNBpCdSO26QmUQ9yg1mLZJvoRkaHGPx7tnYNN26cPL5SteVwpMyGP3XRuPAXXS7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pardini.net;
	spf=pass smtp.mailfrom=pardini.net;
	dkim=pass header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=NmGSSMgi;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A8606A325
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 11:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD9A8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=NmGSSMgi
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2862772a12.2
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 03:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261570; x=1795866370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bq54PBPl4YCnVxEmHl/CCwjoHYf0FGqHDDIF9WweFI=;
        b=NmGSSMgirxB1kw5J9zgoq5QISvw6Yh8iCK75uOY3jeW+ZW/aKB9e+tUf7wxRok7G46
         vJ/9mtgJHMMJ5DAtmtE+Pk8fSME84BwT1R7vRROAN+5X06IYWugXETfDYQo1Q/tWPkHq
         UBY1wCGPQRMK6E3PVBqfjA7W7T2059iNNepjX6jy8DHzrCYo6jX3zaZoijslKUTqaDOU
         hXIqSwG2tF5Nz35paPvbZ8xQXbucMkfjryF14JAVewKjqdRhfmIeGRQXl4TAMxouxaOJ
         X8nOKKe4Om/JYvbSm9+4sP4E8Np3AZM4f1cMfynxtszkLgDWNLXMIodtWGOGa36NpCYz
         x5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261570; x=1795866370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bq54PBPl4YCnVxEmHl/CCwjoHYf0FGqHDDIF9WweFI=;
        b=AOS1SnwSl1cQSq4rfOR2mS5DxAbRrLtpiIBKpJuEbHhoA+Hf7g6ukZq4rpnVCsBkwE
         M+0+UhqzWcBm5DAB7MeohqsG2H4hgkAaNIUxGogzoOpExIx0OpkFN/0g/djykuOy4wnq
         zp4hi2I1+htaQaGdQ9CKC1I3FpUBBjqLdpI7aylcfP5x5qdwr3rx/Z67MEFhZdMccg31
         hOrcGoYDqvKInBbmyGXhhV9MmYPMTGyR02S1QoohmsNg661KA4eIkDhsHAW8M0/lqzMF
         ugkGkeItQDskEgvP4nNTgsaghami/CYxQ0LNGlqvzkP+4abMC4C3UFSYVDlc+e2mQIOT
         5jfA==
X-Forwarded-Encrypted: i=1; AL+hErE19d1IpuwfqqhnjuywJFMHpUE6JVw40AT6SGBjrIIsBpLtMDStPoWUA1stIUic0ZxGU9mwW6bn4pkn@vger.kernel.org
X-Gm-Message-State: APuU4Z8SaA9gensWOAvkxKl2w64/SORNhhO4yH0SNin16wBNfQ4qnpw9
	exfnQCqoJ8MzclsJMjbBVJfmq1BCBZFewLjikKl0eHUEDagMcQSxdG5vD4JsTYKf7w==
X-Gm-Gg: AZFdTZf7frB4Ux6AYznIc3l5WDiVf2RkV1t5C9UcEb3Wr+RGMf9JbQMQ+9oQvxXuTCX
	xFH0p6LaN+GlY3sVKH3KcTt0io8omsPzCjxT8a7FETnMdJKsbJCGHIV8MGzj6bG7L8YbZaAkdBK
	iaFdSW+ot23QA9/GsSIY4X0oiknGhKKQYYxunRNzJPuaEu2PbEOpfgl6thaQubl9HUG3mHPkJtp
	ZmJ0oJZvWZ+W10vA/+/01eDCLtDplB8gSExPfqkXY+uHgTCi/e06DbL+3lfVSngoupv6WyhqNve
	d6x4omU3S0JOmfD9W2hhZJtiqPa45J/UCaA5t8EQ/ZG5/k9bTHRIJtFlk50kF2Ey56zybYrIhUL
	nYrDptoT3ih8PUxw2HSYmoH3049/6Q+WPSKJO3T9VaQExmJ3Zh2EDvTpikHo9tZhatDBsLp6kHO
	llPnExWs23lcBwf6cS8Rxt6DCpupOu9VVlfUxjeFTzPd30hvrs8FYA0PrrdYuFtNtwK/OGLO7l4
	StJUIabRJ0dIkrodnsJeGkQB1FWl4hcxh9T796hzADy+obE6RWcgAo5YvIxFOw6ZEZ1jK4SD8LQ
	mUhp7Hb3yLYvGZEx34C4ahXTMUwlQdeQgd1ZSA0of2Fzo8p6NCeVzBD6vm6lXCQEFYO4nbQPVtk
	HAm1VBoblbYFxcXVZyLxRU3D25cTucQMCMhRcnRvpIXjjMJPZhif9gWTF8JBHFVeu5uMw5ey+/a
	Jx
X-Received: by 2002:a05:6402:134a:b0:6b9:c43e:19fb with SMTP id 4fb4d7f45d1cf-6ba37d632e0mr3291804a12.25.1795261570200;
        Sat, 21 Nov 2026 03:46:10 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm173298a12.30.2026.11.21.03.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:46:08 -0800 (PST)
Message-ID: <9e4c3ed3-812c-4ad4-aab8-b1a783cec95e@pardini.net>
Date: Sat, 21 Nov 2026 12:46:07 +0100
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
Subject: Re: [PATCH v12 00/23] Synopsys DisplayPort Controller improvements
 for Rockchip platforms
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, Sashiko <sashiko-bot@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Yury Smirnov <yurymonzon@gmail.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 06:00, Sebastian Reichel wrote:
> This patch series updates the Synopsys Designware DisplayPort bridge
> together with the only existing user: The Rockchip RK3576/RK3588:
[...]

Thanks for the series! Tested on a Mekotronics R58X-Pro (RK3588) on
v7.4-rc3 (it needs 941e3acfb358 from linux-next to apply there):

- dp1, full-size DP: Dell U3415W at 3440x1440.
- dp0, DP alt mode through usbdp_phy0 + FUSB302 with an Apple USB-C
   Digital AV Multiport adapter (A2119, pin assignment D, HBR3 x2):
   1080p60 on a small HDMI monitor and 3440x1440@50 on the Dell's HDMI
   input. Works in both orientations, and out-of-band HPD retrains the
   link after a flip. With the adapter plugged in at boot, this also
   needs your "drm/connector: Cache out-of-band hotplug events".
- Audio on both outputs to the Dell's speakers, over S/PDIF
   (spdif_tx2/tx5, simple-audio-card, mclk-fs 512, DAI 1). It also
   needs a clk core workaround I am not sure about: AUPLL's assigned rate
   rounds to the current rate, so the S/PDIF frac notifiers get
   PRE_RATE_CHANGE without POST_RATE_CHANGE and leave the muxes on the
   gated fractional divider; no DMA requests, EIO.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

mvg,
Ricardo

