Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793931426;
	b=VtTzwcsEI7pPYEMbvCW+qt2RileCzX+C/5JJ/qXG2MsSPzMAp3FTO8qZPu6XmPXNVyGJ
	 44tRl0uIov8jOrbjoOuAWOkvYB6t2dsjQZfjF0W6DhFghQ4/xI5ih4q2PHvsg5id+sCik
	 BmlGpxajVSwUX4c+LgZecFc4HVNY1mnRWpnbLvK+MO7WgPNYUEKFBDR3vm4AJ02wmYxtU
	 HwBm9aOidKBn/n1Jk6Ptpub6/7e7etH+TmSoO666rXO+60H1U6oJ6xlo4URW8nvP3Jttl
	 S+ekppwbqXXmUf9aOxHPisgLk5mBvfRYqiby8JrkqMTEhJNmQ2/4ezhsB1ZVOkYdD2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
	b=It2JCsaL2hdRMVaIBWp1gn9Hd4UfV7MzukkPCk5xf/oHnSW4q/9xO0eMHLuBJPkivcMd
	 GkVyVU871ddjEU3lBRL5FAxGqenwIgsR36iVmvcwD6t8JJEzqiV+UMgXXVopda9gimYRS
	 Zmul1fJBRBh657DGLd7o2llFWvbZNd0Iom5rZ8bLQlrJXECcYb4YChkrv7wevHLKQOszC
	 Kt8vTVCyy328wSLa1F+BAgNod+9Z4b+hSOFXRizA+rLpTkgd3VA8/XXSCiA0lWrxXLnUo
	 IigEeaCEk7vmm4jIHdxwmQV3ByCQF/UNsWsf+c3Hc0x6pb6kLEROdshsDlSnTjYDzbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y52n66Gq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3B9606A328
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 02:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C3B9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y52n66Gq
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bb7ad903d0so14968e87.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 18:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793931424; cv=none;
        d=google.com; s=arc-20260327;
        b=qjbzYrXm8d+7s5DVOZ58eAFphKZZoI/EEUlJnHoHxWhvC9f2W6IX4aHVbwjcPOETxb
         1ZEV/hmP3z49BF8KqQYHJLOVc8iFQoBRy67PDyNzuSf9b2LMsigg4A9DDN0+Km0FYPNI
         6AXGolTi10gT1XcnVLBSzk9KTLJxyOZMvvEA8REWV9kiqhRToUbNMimIns9VgK2dj3/8
         9KK7fk/BZHI5qGBKKhvnb80+I7qkb0ZEpiN76lJMf1hRwXih0L0mlx16FeC61wuh1/L7
         LoMUw8iGfvdTyv+6qEQ5765OGtB6Ls1h9XZ70kkkleVleUS7LIBXOuCpmpW3NTy0iNKW
         Gifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        fh=0+d7GMwFreGjhaFREe3NYA84K797xDl7Q0SPQnRx084=;
        b=LN2HDp2av3og8cVsGdHZn5ICNOeWX/xIzvdTfaJOWGZh1fN8jr7mlv9+iXaYRUrjbP
         3EcixciKkks/Uj6py0TJZi6XKmVjpFv1KKxCD9VWPK6XELNuGdE4Uu4pmzKXK/MaayTy
         WPqMCPDWchVu1+23Is5mZrLFd905u7HE+iwwoaZWMQ98HNQmBOA1so5o8D4xUcTS0ZXR
         QyWFCy6+aicmncxajCeE4b5H9GjGJDzHvx6HTWKSm8kqmv1wTApFqCJL1Ifwsw8U1G+f
         iW/GxxF3IGXhkTqcA42Yq/344oLGW9U/RsFIQ50tNmmy6NVzcGyCCogbawS90uzugLjO
         bfQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793931424; x=1794536224; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        b=y52n66GqCM/IpK42JIjgWKkg1QPRKupRbssLQS0bhlgBZPtlxR22WdDf7Cb/WZZ2zK
         OktRlBKYgEki+dEGCjO/1Rt67NRgA6dCn9IgpQnLV+k6riwYgBIpCuapbjHivFbuK6mQ
         7wefPUZC9lsirgeFG+bcDsbL24fhbF32OWD/NhUQWa4n+YbFXmYFs8ewO3ZHNNIX3n9X
         uv4zP0PHryB+Va0vIB2fCvxKuwmRCvP0Yfk9F4XobOGmUqz64LD0k8z/GS6h+DNe1srA
         cGLsJtRNk6Uwy+gm3Xip0zxkFTErj3hrIIGYvXO3GPF8ulUbF4V5lewAPsU4LLU3UQh2
         N6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793931424; x=1794536224;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=brMY+OaA/TMsf3LmZkAREDA9GFOOeLxAwqMfVeCmlKI=;
        b=wD7522E2kCInUsJo5OJxLWiqMU1qrcovyU9sS/1jKjPZq1i9fOwhuvtjw362qRDrCJ
         63xa4e/fzDmhw6De5QiGWohcIBC1iH0Thl5MecyhDiQKaZZjvZeBb/h2xBYMMnnYaV/H
         uqLrQhe7F8iQp2BxOJHNYNbjLAlrHLPpc8IvD0gheivGyMgzidvZ32DeD7g5qvH9alnc
         gu00hE9i9nzCGVQzNXNjMKSXPeEh5rHX2koSUq9AN9S20CSun+qYaxqO4ZU9gGF6CQ3S
         HdtxWP/DQlUfurK6rtS30IrzNF5zmKuW/FFV4TvKmaOOWCfs2yxw7DCrn2bUa58BrCoj
         JjXw==
X-Forwarded-Encrypted: i=1; AKwUvBxjlYLIcWjCXxsBrb3MfCGm26YKxTi7utXHWE9jsqZ65TN7NeZETTKNTSfYy2wJx20YRBffiynCvMrH@vger.kernel.org
X-Gm-Message-State: APuU4Z9/MQFr+yFwsBgCGIZNsN5sy0FKoBxiGyCQoBR8HfcD+kPhy9DX
	+1PzJvVq5WvcRFW69CEcCyNFTFMJfBp2Tl6sfY2KzKkKLyvmzFvJSoFgkzsX1Gd3fFhgeqE1Wbc
	WlHBQnwTN4wXxP2wXzXmCt3llmtJRx8I=
X-Gm-Gg: AYBFou30kyY+TW5hh9B5o+fUHpGBhhBGbpgE6GHYZtG9DS24ZY86ExOf5TNTqovNnpy
	BEuWC9vUiKMrXWV8iQ2zuthukYo/c/774tf7NbVzE3kggzxvd6yHQAIhxot9YRW/p1kObDmw/4z
	C0kMsFaWgI5lmzHAECXMxWxutipP30tsPe80Wm8Ikh4HSdE0WjQLwCDho9k+zKQ8mcVxwgh0Kj3
	e30WnYvbNAAIiHJbwLOJsPBtcbJqBRBTFDqlL2s9YNvlUGSIE4Kgy35J+/qPrP78GBEp/yHRGRc
	NptaLsd/XO114ow3ZfcwAleUTwpl+uN9edbbIhf/H4tmb56iwgDIadflDUuDtJuoBp90iVOgRLx
	EY6AX4Rw1TFiAkBXJmBU1sIEyu2+jfShqhr+hyrInQOBJ3hOd6mbJMzJIEmdyZ36ke1AhEVYjCb
	sd3F2jIzV5l3q0jXq9TQ==
X-Received: by 2002:a05:6512:2524:b0:5bf:d9b4:2481 with SMTP id
 2adb3069b0e04-5c003c16440mr312893e87.6.1793931424363; Thu, 05 Nov 2026
 18:17:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com> <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 6 Nov 2026 10:16:53 +0800
X-Gm-Features: AclHuK-dqaISPAtfDlMGbnSeryvn5bwnJRHt-qebg7Qbj88Q7XOH_5ONWOiQpyg
Message-ID: <CAKspUhKv_6BLHVH_5oBsM8UhvCGHEsukRDmMozZEebHZtoJmcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: dts: sophgo: make sg2002-milkv-duo256m-eth
 overlay generic
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested on a Milk-V Duo 256M with the USB & Ethernet IO board, on top of
v7.4-rc1. The composed sg2002-milkv-duo256m-eth.dtb is byte-identical
before and after this patch. Booting it, eth0 links at 100Mbps/Full and
pings the PC over a direct link, 5/5.

Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M
