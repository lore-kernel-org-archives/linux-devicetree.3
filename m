Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364307;
	b=iqqn9cxrgXpbDjuAcukW/37utuZ8R7g4nwW1tnaZj7iL1iz2fFXLXmMEbz9W4fYjRMx6
	 FPS8VxF0Td9kktJxhip5pWFhIQzM19eY9oglp+2T/X5QPmDxvDvqJbaQ+Xy0bGmLseMw+
	 UCAcmiZsP5tQ1MhY/DSnLCkxx2zjVm2xprMdOEm3zOJng66BzJWgC80qkpWjR8L9nwb+7
	 W0Ng4AVfB2E9W1a3O4C9sG4zKK4cbeoWUkEujnMGYtySjm1JUyLbfGhqk4uLXqVrn/1Ft
	 t++b5wRxZMPxbiy+m+d9Bs3GrJW0eszxqLNUoW3trggY3Y8F0HBfLE3Y6feGh8zIe+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
	b=REhGfbtVrbW3Buew41pvaWlEGMTNHf+oZe3VE4dItJTJBQwdS8oMYwqIoT/e8+TBWZ1K
	 zW/jcsQHdeO2xKqZUGIT9XFxWXZrYFwOPzuXzrD76gIQRmIfjro7sOqy+4z07c8RTZ3wD
	 pQkEourrimvHQ6ueKWFZi9vlBXAAhtq/luu+lRhzrDPmQiGHkWMw5FJ+UpFLN54yNFFyJ
	 D4QlD0vERD44CRBZp5ZbxVd5HBMMIo5l7MrDzJwRUauhzSwZDWtrORi6OaMv9VIdrp4l/
	 iYqeO56yupm5s/NioKVqvTDPQIx7NiLQ33ajRLIu9Rlh5Q4U7yW9gEpFNDCJQdOGzQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UYuil1Jp;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C004606A330
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C004606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UYuil1Jp
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so26414155e9.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795364304; x=1795969104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
        b=UYuil1JpVqZHpLxVePXNnzpVNmOMyOztBX7FDXfW8NAitnVCbIxeiJVUZP8fTAxjog
         p11G/SEqtyxEyjc7Qjj/QOTXD6zCXJwOznL7B8zU3HHPJAVnZpaNnqJOIiu5KcJDlTrs
         frvOwTGOHCkK8xrymAFRlWKA/3TxJNyiDi54/+y9N4TGp8opnzglrF3wlcieWPILpWZu
         PC5w+smuXMZNQ3lJ/Z6Oze4Rr1CG0S+AJSiCvXZy5eUKnHhNZJ+wVmwGskY+o2qizl3+
         VGszQjxr7HnsyUkhkhVrahUmPO+ieu2zNKrSGh4NGp1MhG6sSsu5KWbqgp49DHoE9Q44
         7/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364304; x=1795969104;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZiEeOYhVKS03CHr35HdwHPjYPpUXJNlNyaUVNFPqXQ=;
        b=QIX52+JNNEsQBDXOCtRL5zSzcOCYWH0S9PvGH1ZWEYNMxIF7mY40NH83bgVmfEHkjr
         fZEmAzjHxSrUKDV05kzgTa8pByr8Jln7ilGmTphK81eBDFhcdEY/Q3bAHkaS1A9pXl8o
         c6UpFFBDSF5Jap9rl5PS9IyBYrkaGXxibQyun0SUfBZ8zRRWE+GZCN3jKlSieECtA5kT
         5dbeO+qwvfRLKqEDTkb2eu7n2b2BoMhYBf2z+sSsYCoEhvqTdO5IsBsktnsi6xzIt7b8
         RMj6aw89DL7PNTGx3MtrWmzbUKOurSUo0hTkDyRTv2Cl597ttHJ+K19KsoThDi4957aT
         zizQ==
X-Forwarded-Encrypted: i=1; AL+hErE7XU18XM0FVO51iVTTc1EPh3p+lU/JZfokB80OrZI5xM7gCFzq6DRTKUv1ByDllzcfIXjkdnC8xJNd@vger.kernel.org
X-Gm-Message-State: APuU4Z9A2n3Erz0L48yztz0wpaJ7EHV5OgH/i2jBBL0aon3pzMUU36oo
	fO0Fi3j2uo+Mv8u8dAvIKtLIA9LM4aK+46vGICmq63xB3PBeQsTjXNNcp1ANyENIbIQ=
X-Gm-Gg: AZFdTZfs4w8aweOJdGgLGRn6+iRVB5z/iT66l9wVnn03YT91oX3IrEjGKfDuNuebrKa
	oI8Y2jAZCXdDNsHDAzl91LV6ROuZIuHmbVd+xtEVFJZvAyjqvdxGZfwf+tkY6pdSu9L0LysyIz3
	hdU7/NlopYGeAykiAvcg0hrmkEwkHdIVba32+dvoZCP24FTe0jD5+RjRG4crpKKySFCjl3qGlMh
	jlChYq+v/zuociieSU/Sbm9vr6DAe6Lm6ejYLFuwl/CRbusALkgm4U9PNMvzd0fWsgUry/LFKG0
	Kpm+rnG9NVLOWUqyzJHTPtfJVZum7jFTvTEevV3NVDs0yQMsODmg/wPqomXWO90WNVYm3HOf5W+
	EKgf2aNy93Kyj7wpSjCvLU6KSA3r9Ybbyg17jctrOwULpixDZadPKvDHAA23sX9v8OKjfA/0b24
	K+W1R7zsi0yuyKm7jH9s0a9VbxB8pP3GhZR2UimRhQvN3D3mLCCOG3WlYlZkKjjGS65ozKdirEs
	BK2pP7FXSgTGwTE3LsRygdTlvfQ694fO9pZ8VKzYOKcYbeMJmRzHXPskQV5eNCTV2pAxixOKVND
	4A4sLBH/bCR+Mq8SQuQmf7p0CplmnZayUKYQpp9ifMzzQwvl
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr46862925e9.2.1795364304705;
        Sun, 22 Nov 2026 08:18:24 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm226037545e9.4.2026.11.22.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:18:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sarah Emery <sarah.emery@canonical.com>, 
 Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Cody Kang <codykang.hk@gmail.com>
Cc: Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
Subject: Re: (subset) [PATCH v3 00/17] drm/spacemit: add SpacemiT K3
 display support
Message-Id: <179536429642.2728475.2044119204203952258.b4-ty@b4>
Date: Sun, 22 Nov 2026 17:18:16 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=207; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=v3hfU9UHf+Kw6j8mPInDkRCmcdQcn/tFYuhWer9PVLA=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMouffLtac7bcg5TPvFslVKz/IiM43L2d2W3La8FzzF
 i6bCx9Xd5SyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAim44zMmxxe2hesHqmrEzE
 C5a4iu+CTLL9sfqpvwrzRPpPFr2X/8XwPyhe6sxK569/On8WiM9u/vRjfl5c4ZyfsjXJvPYlub7
 z2QA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-spacemit), thanks!

[06/17] clk: spacemit: k3: parent eDP/DP pixel clock to the PHY PLL
        https://git.kernel.org/clk/linux/c/dd010f2b662d

Best regards,
--
Jerome

