Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512889;
	b=ABwHBwwB2u5xPuxtEsXO9BD4aQ8JmZRTfAOZFHx710X9cPfQbxskzEkTcJYNr/b0Hpay
	 D64gZc3kBqAc9ZvnPf5M5U0i46nePmgw4nkeAU/PFvmjhrSd5ztcjCUmYtEpuUhwk7GWT
	 dOyqvRlBcogJNgk66alZgbyCe3cjAlEnvZHRbXWHKNYFoLoAvThIt0iq+S6UBh1WeM3/M
	 HoxJ2N5PJtQb4ZtOrY4+2Y2jCKcDsln4FO2VQKILwStgjilh6+Cu30F/S/j0jJaUkHlz/
	 b7tXy57yDuqjX368Fw7J0H14JcnOUG+ApZ+TpbO0w8ZBkpZU4kkMguZ7u2HonH1YwKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dzlULNiaNZ0xXGdWA1rlfP/03H+C6Hi4qgErNRy8s+Y=;
	b=aOg9iZNyKXMvra/8+++zYvBjE8WZ8k+ZBghsL2zpm3g//XioMJlWd2Fllm4T8ZJxvsE9
	 o+a7sq4nSKF2oFIO3A6iHR4W11gy23TQLd2J1N6M2liBI1yQkPmSQCKtZC1WuxtT9v6zl
	 vQkDxfhyaL5l++apJWZgHNsjrfzL5APtgZO8t3NRu+Ydq4iyrrG4zn+tu/HdGbG3Er1tA
	 BFOgxeoUDxm7dD6dtQL8xS36uRDQhYJ9EIaH854a9MpfAId+4j4ktxQq92xafXM9nib2a
	 95omdXGxwCqnst/bh1yCtn53AcVq407FNI2d5O3+DjrK32o6bwNXrrq3FfKl9LXfskg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VKJuV1Q7;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ABE606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84ABE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VKJuV1Q7
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso31386235e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795512887; x=1796117687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzlULNiaNZ0xXGdWA1rlfP/03H+C6Hi4qgErNRy8s+Y=;
        b=VKJuV1Q7KiG/NwjyZGk6cDku3ZQZ8pLxNIFWTycp4mS+Flrvh1frRwcrBkKmANhMId
         osZ9wi/GtFjbonSQhQygz7P+9fYtTn+I7W3Fc8sVZqnSdF4/FXB9/keQi8bil4wy+5Xe
         cM0lANGMUvPoV82g4bcZkEeXIQyVe+0ade9/yXxZC2B/elTI6v6accCROCGQt8caz6Dq
         NQ3AXl0JC6gRBYKxiJ0tL+NC5EWMwd5NtRsm/4TyOOWxSNTQX/h1/rbA/jg0rFtoSmej
         Vgx4EvuGeaxQ1Hl1owVxy9+1TMuPZHV33p7hP5QVEAEs3Z4MljVXkAGbAJ44gy3xZ30g
         heKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512887; x=1796117687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzlULNiaNZ0xXGdWA1rlfP/03H+C6Hi4qgErNRy8s+Y=;
        b=qOSeTD4dwk/88DYURTbe4XOmtrFAlW1jyOoz1Glpqiz/rKMArpArdBYQN3H0J9z7uu
         ikFFWYCmLKHyeJf5SV3PeFsH/vjGLhzAaos1ztGIlln7945933Y7Ry0Iuc9Sw2X4NhfF
         e+zBbUg7OzgkI/s1ijVYY7kVoDnzmPd0kIGzmU5799XbAcLvalCkQpMaJLb+Zj9iE1qc
         fnKOusAz/par+n0jlp5P4Ggg4Ri6qdwdz1vwrYHqxQyeVgpJzU9m4bkeULmyP1lBB2oT
         vcZ7fspcIrkQ3xGAK3giIeJO64W1UMZDV92RgsA2zZdwqVj6Y1c55UqTRhYxEj5vWIi0
         6J1Q==
X-Forwarded-Encrypted: i=1; AL+hErEC1UN1Gpl5bstuQPbz/m1Thhp3JLdztagDZRll0uxhQxz3OP2B+MvgOukU1I3oGPDLRJEtgZ7zZyVc@vger.kernel.org
X-Gm-Message-State: APuU4Z+nyVsYq7/Od1PsqyTK2FpXfa2ITOJja4U6+tvuuD/OcFhWDuoI
	+Fps8Bx4WgvZU3FakawncMWM9FZraZ9cPEo9ypCrruaJzP0S4fNunu6KNCk6exZFelg=
X-Gm-Gg: AZFdTZd33v5QoZpGHXDKkqRtKRPVylHzww/gHuCZ19lwfiMuB5nMM9DACEmnQZYWajL
	U30+0iGbiSQlPXI5I6AqCo9n7ZsTB4MveZSjVlKw9ijpG510rl+rfEgr0ONRuws7r/YxO0WKXZr
	rAQp01kJpWbFbu4e/IW/nmmpKC1e6JT8kFyRDsIz4uod8ag6B8+iqaSbf6/h9b9jaiROgj2S0nY
	xv6xPybPnN8n/kGb17eREiqNF3mx/3FDxYldcgjINp2k3u0/BulcdxkqjmVEOtvH0iIPgdMcGqG
	B1TtOf7VCbiwz0LR5p1lutlqLUpEYSzboHl27mv3vfyomPB9NP4f3xmywop8WuAX2+jQ2CYVEDV
	0L9uzMuBXixnL0ckhW+bC1Nunxl0uz7x4Sb1QqgRtmPJyLHmoGeySzYt5W0DZF8kFwUa/edcBhz
	E3JkkUqKeK86Tjl7LAHc6/LqoEmU2qw4PkyYasbLuHibS93OJ+KZGoA4EKfr+iMGTP4rKFd2fmE
	mjRRAG2aWJ9nDf+GJHV3mTV/qIBdMufGHAZS9IqhO4WoAy1M2HaV7GNLkyqR+sgPYZq3WqtEdKA
	eipejCGjGm6fZQUlc3mKh0i7FmpoSlMoh7oa3qsFDESh+2dhk53UnXp9qKUj5DNZTWoa7Dv9U8G
	+Zw==
X-Received: by 2002:a05:600c:5251:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4bb8881e837mr267264845e9.24.1795512886893;
        Tue, 24 Nov 2026 01:34:46 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm26488815f8f.37.2026.11.24.01.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:34:46 -0800 (PST)
Message-ID: <57582334-45ef-421c-a460-314f5b5ece74@baylibre.com>
Date: Tue, 24 Nov 2026 09:34:44 +0000
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
Subject: Re: [PATCH v18 4/8] accel/rocket: take the core clocks and resets
 from the devicetree
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <82329b6681958350294846c830598ebde29b874a.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <82329b6681958350294846c830598ebde29b874a.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 00:01, Jiaxing Hu wrote:
> The RK3576 NPU core has six clocks and one reset, the RK3588 core four
> clocks and two resets. Take all clocks and resets the core node lists
> instead of naming and counting them per SoC; the binding defines them
> and dtbs_check enforces it. The driver only uses them all together.
> 
> On the RK3588 the resets are now deasserted in devicetree order, srst_a
> then srst_h; before it was the reverse.
> 
> Suggested-by: Daniel Drake <ddrake@baylibre.com>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

Reviewed-by: Daniel Drake <ddrake@baylibre.com>

