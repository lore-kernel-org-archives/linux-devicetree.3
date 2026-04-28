Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE2A33BBD0
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412617; cv=pass; b=mz33N3+4lUAeFxYFvulLvZXZHrP9dw65jGAYvPxoscdmyemxDQKkon+2jZed245Z5DsFfDSJmP0UaB1i2lAsLWVDszPdWfx1mqjBE01TXVnwZX85FhbAeHhZZy7oQxcsEcF9710w7jseiRzy6Tngi+58rKJJDBqqCR78cx3OLHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412617; c=relaxed/simple;
	bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iz3e+OObemmXR4jvzEk/r+SxQX0Mm2XZ5xG7RS55F7Rt7GrATtNp2FR5l3c6UqIaLHLvKF55rpCkLz4elNs4dVQYlmC+KKmtFNsRAMNtlMvz5hYqx2PDXV/WQ+m3BTUgWNzjNtqmEseo7kS2Seu1r3h28a25mYpjLQnQ7f0thM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RtM7H2al; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RtM7H2al"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so5155e9.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 14:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777412614; cv=none;
        d=google.com; s=arc-20240605;
        b=MicCp74WI1N9FvmhYQqiSlLcUuzb8tsv615fTA65A2BIRdQL1/LKpOQ/GsUympXMes
         68qY5DS7RMWD/5OchAR9CFEn+Th0CoF/MM1y4KnmKXf8weUSk9dBfjP/Cnf401Ag3Xdq
         j1Uy7Gqsioqh2OAHRjRYWItqk6azyquFYfjjynOF1I4z3DTZ4fBk74UzXHSFFCZy2Nyp
         tOhaqXrQnayMYoFGprTwZNmlkqmViwo215vaC+2CEm73HD6WxddiIWcqp6G4VmfEHl3U
         kXi69wCyLCmjpSzjB0IsXibXqfpZP6dQ8maETXx3/I83rZwZytVElbWC82CFh36h3+K6
         NI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        fh=M1M96NX7ZEcsD4ysDhhnTcRHnnWTLhwXL1q5aSB+A9o=;
        b=PbAe8AjwsTImo4Bjf7+i2wXORit3lc3OUu+mtUH/AQmMeauYlZJaJiBLhI7WgXsbZJ
         GpC9Md4e0mTznJEhZi0gAO2GvfhusJGtpApSyGyXkoBzw/mcB6Ys33hwKYDvyAmJiWeF
         1d/iMuUek44WkAUnqKFE7HDnFFRlBV3eMdymnbg1e6ZfBH8tjJ1XOgDp5qTvNkpG863P
         kcKJPiiXtHjevoLYE/fs+nHXTHQODk6rQ6eYutoZeLq/hRuEWCO3UZ1ilVCabYGfAmC7
         uSOCR5Gs9nU6WmQSmoyRLGWtsnuGg+B5Du7Z5G3hjl+ZeZAgWnywbgtRn6+iCTwtw3dI
         bHng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777412614; x=1778017414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=RtM7H2alnCMVAaGDmjy59M8Gwp7eHD+fQMMsYihCog4+AGXfK+HEf1d9LmCx8gykeo
         +/gs4xjnFFUbOndufNdp/L7rxB22zO6/iacal+Nr09pUF0lPUltc1YOd/d5VJ6Wqr34L
         D3cjV4KEF/F3SUm7t5OOUIBIDgK9rMqH6Dys0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412614; x=1778017414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=P1IAtqzSmyq5xFVV21Fe0qoJa9u7tEjyJDl/xfPNYUQccPyI7uXCJDVgsEEiB38aPu
         x26T5Aqv7tlz/AwysljC4fE1OmW7uAqFAMd5LiBVuXFLl1snMGhc3aXFwJSYE9Grs2nZ
         6C/2ClOQisdkj2eUScMHGUlUSWnR/GdYt/49L340UXJynYP07mguYN7wLmrlKaqAK+Py
         MX3SI4j1xwqlYsmcl6wFtMSKVxn6Cuf9nowyG53/AI5I2FIl4Mu2Cd0GsXRwjwLbwNA9
         HGm0SM/AQ2yCr3kr+s5SpBk7WoO2oU0uyQtzY7dDWbaQavfc4GkqKRYviisxAX3wARGy
         R2pA==
X-Forwarded-Encrypted: i=1; AFNElJ+7d0atJ8x9wxXp+4W+FSGSKhkmy3QjgqYm594kOYtmLeAVKO12B7ucu+pbygxS4lXEJ6+XS0yraSZW@vger.kernel.org
X-Gm-Message-State: AOJu0YzDx1ePiLsoycuNTQNb9z8ZV7ogc/UFs6KeipepiqD+DBfrP7Hv
	PSeeWl/kiixxMcM3aW1jJCpjaOTTdn2xbnqJymDI1iKc1+9VS33dWeXkpNMwwWJ0OgnDauxm+yu
	K6WuYG44jPpR3e7opmGqRt7kQMTWyDIsT3wQqmOa1
X-Gm-Gg: AeBDiesEFkpLxWwyZz16Qjdh5vr9bgTwF4ghb+aY1jCnQTPMhQ0qaR58eCBA1wGG2c1
	/e+jMAkr1HKYUFP8Io+ZK7tOpTV0P41R1tSO2wfgT4LG9rW3/mp3TYMWOs/lGHrxuBvFLJetw/p
	W5AXyWdChPKTLRRCa2nil5nGVGmFDeQmdyiQcyJ+GSwIBEUWL1ib5fkxKphC6ZlY3zJ6dd0E5Kf
	igv7DQB9jmooEvuvYuPDjF+lHS41UGasU9GrAQLbvV6xRWKz4wLTMMfGPuGY6LTEiU8bK/U4YWY
	CSTgELTFLGwiz5bTH3Q2P30XGbHH+/KcHLmz9OJ70F/Nvsvd/8wZMV2D4g==
X-Received: by 2002:a05:600c:530c:b0:48a:5f32:62d0 with SMTP id
 5b1f17b1804b1-48a7ba07d5dmr322355e9.12.1777412613805; Tue, 28 Apr 2026
 14:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 28 Apr 2026 14:43:21 -0700
X-Gm-Features: AVHnY4LgrR9BMoyPVl-dbhODH2S76f3l5WcQRNgpXekO-MzmQp39W8EwHdrUnso
Message-ID: <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I reviewed Depthcharge code history and found that this problematic
> bootloader behavior dates back to at least 2014, with the Tegra/Nyan
> device. Older devices may have similar DTB structures, but I'm not sure
> if they have the same address-cells problems. In any case, these changes
> shouldn't hurt even if a device was not affected.

I can confirm that Nyan was the first Arm device shipping with
depthcharge. Note that the Exynos devices are all older and shipped
with an old fork of U-Boot that probably handled this very differently
(I believe they had `/firmware/chromeos` but not `/firmware/coreboot`,
so they wouldn't have had a `reg` node and should need no `ranges`).
