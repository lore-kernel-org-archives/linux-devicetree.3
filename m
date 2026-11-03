Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733820;
	b=yPgcknaGiRe8GRGFAeYP67YIRIeiS/uc2YFk4ookvuNUZlO83vsWnZy3gxWJJcPjvGVD
	 J3ssZtsfaYLbI9QQHqsdqIF2cJmzq5zB7QAG1awaEjKzmSscbZevkHawlQffIcNKsdR+/
	 A385gx9RoeUXL50SaCwsGWgYJM5z9zANq6EdMcrhXyClFN0aAJtOshzzLNevWNn8i2+lY
	 rY8TiLk5cuHY6FGzc6/BgsBNBXMjWJoTMHUTEqhttKh2W6mpFqFVAWLACVNf0jYTcL+4q
	 bvJQQNAvoYtJMZ/qMdoURRqqE3hdRPyU5/E21CTFoXBqlLrjWT+snwn3so19jXCfgtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2bf+ycJ31FjWROHBLtqJsAsms5ifHfK4LcWycDMaIZM=;
	b=R5A29Daou5H2jthvXH1BBG5UMhMi0fh7gSWmmkxG4/MVz3pymjWxqFolFPAq6BTYB4eK
	 rlJ/M23MhpnePuMLXj3kfUpzaoQgIdu/8ko7rnu8A4HvLVnlMQdTEs4NCDSM3Eu8ONhrT
	 d9urcLJOOHzA4xkIiqC7Fe8WFqm3t6ie9YEBTmCktUUEmXFe0m/YNn8ewWXlJJgARPKcF
	 tZ5DkIgkssbPnvSBYN0roWMb6eg5R/LftM8VTLyN0PJqHAviSSaIcXgLXlGH93Nh+Ah4f
	 lOcbvfweEwj2FNb90W4R8XqNCE9tcVdU4QY3jqJbT0xcTBArLyjNXQz9jFpu2QGNu9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUeKWbuB;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F507606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F507606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUeKWbuB
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-716b58a4365so469322eaf.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 11:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733818; x=1794338618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2bf+ycJ31FjWROHBLtqJsAsms5ifHfK4LcWycDMaIZM=;
        b=hUeKWbuB5zyDbHpFb4I/fvFIocB9Pse9sJLRZ4OuIFliaF9iTzB3y6LOoVblsTPgEU
         ZJ+EedPz8ac/VierSn3i2HmYmFfhAVeH/EIqQuNu0SHY0xBwSvgKDQUzJq8PFoSG8gNE
         YsLubWlX5zblBqsvYsMbHhmZcMGu14Fak5iUovb+clJPgeVrIp5RVTHcRVrmVyUshfz0
         N88hheLTXG8RjOmhmXGGZ9kHRVUdsAcj27/BsGuUsgFf364Qvzf5SPrjAMfxJnNd/wK4
         O2U7hpoHcubMcEhS0YBbfQYo5lvX3WcmPIZa+ambCMR6YQlmLA1/dzCaCtBDthoB6cqw
         m92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733818; x=1794338618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bf+ycJ31FjWROHBLtqJsAsms5ifHfK4LcWycDMaIZM=;
        b=XASRzZ6VtQuUaAINeWOXAbz7zLtGRVlMm9tz73d0m2dsbTIEJqYynsQM3JES6KB4AT
         /QzJvPoyeMd9Z6DAo1E5IQuJqhq90sjEItJ3VPEn2IdrTkxr3dSc/4JtbuheNgZkVVy/
         eijGrfV5dmvy3lhZDMRgpz1qWf1I+tC+divsY1BW/LJUOt8UX6d73wt89y6k/qYq4gsF
         ygeiS2cEVTyyP1FNRuG+uUL8l6f5WEVPIQHbzNmNKTxSsA6wJQlBDrQsYm6rPk4kqnW2
         18DdrMDZ8uZ09IBBasu2KfwyiPt3xAxqUJcD3uK0l6W0eG8tqf5a8WFegbmGtfH4K9uM
         +MmA==
X-Forwarded-Encrypted: i=1; AKwUvBzr/BI4troX3APL+hS/vK0HBfBNgBu+iEbGRyK2bSP7DMA41AwXykvj/smZEKTt/Id+K15cr8UE223z@vger.kernel.org
X-Gm-Message-State: APuU4Z9/1PUlE+rgrCRncqXcNh1wSoKE4FxZlDTizAcdw1NCUgmWqn4w
	h3zYBZ0cnpQY9++R9T7EtA3UFLMv+yag9Vjud4mv6nU/su8YEo8SjhkO
X-Gm-Gg: AYBFou2jxVPLWxHdYJTVsfqjb8ARUgU4I9/oKeNkXUltJtMQspIaXSRNQPTpz8A89bi
	QQSwmIHiGkduXYbfYkcoWIEJttIHRQAb4z07shoM6k+eUKJ6Y7yziXP+xERQeBmwFpYDiiCPkvx
	v+u0kYbZvkDazaE5EDc8tgiHIpRbAW04srJtYh0NpqjETGSe+7Xl9W8DjZZXaY6/vhv8fv6TFKL
	Wj/YHfnChFDKIFyDkAWTF9UP+WdPh+8qdzFnNPcwa9Ml5DgdkuBUE21A7LHRjHi99+Pg34d8PJC
	5N2AHM31/+teGa1VQuKCW3JZqBI00iYQsSvvs4rylyHzU8NZ9FaLtAE7lAcIUqLjR+pgYHxOttK
	v3Z7nCyc8K7wiD9s4Pc7PzDy2g4kGqE7Cny0lmvVHkq3wmv04gadkBugqifazplPDy4hWiqeT5p
	7mXNtoaig5nR+Effzvvx6Z/VpERVQCv3aJTDNhriou01NyGvduYRw9vD5aeftiEO/Plo/8qY5tO
	KJGiqsQS5U5Y3Yu2T8YFoWgdvbVV9/s4o6jSMDCeP+kklYpE9X+3zM80psCsag3CCuONLlDLVjV
	2r9Sc3J37Wl6+cP+DVz/mNVb+h4DUpJbt6bQCtaGUIRzALZznMVb
X-Received: by 2002:a05:6820:4612:b0:702:f890:e113 with SMTP id 006d021491bc7-714f242df26mr6473969eaf.9.1793733817847;
        Tue, 03 Nov 2026 11:23:37 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e16ef1sm43323a34.14.2026.11.03.11.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:23:37 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	michael.riesch@collabora.com,
	diederik@cknow-tech.com,
	shawn.lin@rock-chips.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/2] Add rockchip-timer for RK356X
Date: Tue,  3 Nov 2026 13:23:29 -0600
Message-ID: <20261103192331.394489-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the rockchip-timer to the RK356x SoC. The timer for the RK356x is
register compatible with the rk3288. Address range taken from BSP
device tree and confirmed with rk3568 technical reference manual.

Resending since I left a few key people off, sorry about that.

Chris Morgan (2):
  dt-bindings: timer: rockchip: Add rk3568 compatible
  arm64: dts: rockchip: Add timer node for rk356x

 .../devicetree/bindings/timer/rockchip,rk-timer.yaml      | 1 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.53.0

