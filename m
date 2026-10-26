Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989421;
	b=ANRY+uJ6UMnJ+UJn4go8l0OXGyCarZBvaFeI3cq+4cXkkCYKD2jxywaxByqxFM6FTmSA
	 sZHk7aLEAHObGBEgrnarJ/fCKRZGR18DebGIiAk64Ms8fhii/jnAf6S6UlWxbxY2lK6Oo
	 SKOxpvJnbqNMi7UQw+bxgXg3aOSbmNO2nJX0IriMZNbdYKNkfwORtXwESPoBLTCoNt7Uz
	 QpPAwSlR3QDB5UoK2wJYH1MqhSeCxxMZ/LfU/MBKtAqN6hvqB5hakr8pHJTbbOj6WAvXh
	 o1A0WkwCVPx4FpSsCyxAxM3WV6b4uk8X85Z+HqBCid7bD7p59n0u4O9VCOj6iKIz65Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
	b=Opv46brnaTzqylPZ7pPwMQ8irvTyPZbgmcwFtbJs2r+DDNN6+LK0uRxlppKiB38kwN92
	 nqgIe9luwMRgeK2a41/Il6YS3UZnj4e2YERuF1EXsXwjyiRoo4AJ4rPcDyYDMmZqIdfdB
	 ar/j/JLKL2PYrhDXsw5qODBCD0esemeYMforpiiIobq9p3yIaSmUg8YxCR4HiKuBoA8oP
	 Aht1d8KjTfFnQzafUi4xB1n3095KhDewAoIB+LFgqZjCINYBG8b5G8xyMQFFRXvVqUQhr
	 NJijcmY8PSdmh6ENnVzGc1bgVCQ9FwpozGAFYe5z3ibnqWyvpQhy+6urWypx6ORcOgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AkzC4rpU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BAB606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 04:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71BAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AkzC4rpU
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c38ac078440so35284266b.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 21:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792989420; cv=none;
        d=google.com; s=arc-20260327;
        b=PSwSAdivssfKOg2rNvuPirGvWs0GZKdi9j9HiH1Rt4GcHJiRIR5oWhZsS72dN9hBJv
         33pf4bG9OZ875NJStrN9Vn8ENuvsbNsnz6gdgjJQ639+Zwn7KeoHjMIC0l2I2vtawQgt
         H7bqn7P/2ZDF1ibBRXkjlYtUqyv4ulqAvN7Zq5U1priBvybcxp574ybsaRfhqZsns4Fk
         A+x6K9mjMEjXNi4I27wPxGeJ60eshw5gXrmxQbK5PDm+5nHK0aX7uRDsUQO5v94CtbJw
         6xqR35Yq2lWgZ0QUMWdEm0NXMlgPKnoOjVSQ/Cp1w11UrIQz91ZqJ58OH6EZKSwaWBuA
         3vGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
        fh=wJstLricolF8lX8YSYZvizcTdexL8M3T0yGN2rTlYJw=;
        b=h0NuWuJ9htyMHylEi6fh62zJiHNsRLb6xyUF+v+KlNjKudFCeGtucsNnCdlwp2JgvJ
         4dFpid+X7y2F0MpFb8D3hnyc2JBBC6DWHFx7UaqzQWSOEaRSA9AS33Tn0ziTLbyetT9Y
         VPWC7v6hPm+ln4wc8wTBt6BfZNjvbLJbwHB3w4cMQM+XzPgdjJhcZVJxvKr4oiiNZfyI
         mCH39YNRBGgMVGrsw9udgmDSVslV3NXvvWAyAebpF5ZvfdE4HDfYRk4bhMyQd1xRP6tK
         LiXdjoEGz+Zux6hxk7uGIqJb3r5Slgnlcfu5WApZtb/bS224VvnkyDT+GpUQeOH1ShYi
         GRFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792989420; x=1793594220; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
        b=AkzC4rpUK3bYUZwJzVPhKqqrxL2zGqsAS8wRIrKEPZKO1wEZE8tk3kBYgfLw/u17zS
         lHV2RvOEg1Q3ZCXERQPJjk19KgjJuiT7/oKdueeGVyF4uN4CZ1o5OFRhThBeRjwM4z4C
         0YlmTlnWX64ZFMrstWYTl3JFqzM6+I5Z1PB2XYpZWWaN9KbFHtysFz4SyFawM06se4im
         cA/v0zx8StaXlJxxcbjJH+Pte4EEvh4h6DtvgCVgN7U/MrxC/AIyXQUILYtB+/kdRzs6
         7TBT7ZLETqzhcBtjWCZWlKML7+DPgyuWxlzEwxxq7P4/c+YOhNMt7FxQY4yQTX5SDr8d
         DBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792989420; x=1793594220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N9wqBNwFeUJDyujtnIyKOyjh4O7kEuJC5I05KW0Mx10=;
        b=yTn+pe62C7ebo0HCqbtjzTao3xCOnhKhQEux7A5+5N1Nhix0dVBPPbiKvCLPFmMKuf
         CroJEJO/bKbAp+ezUvdo6SaJLb0AIeKwruYwaGq7uZA//1EGna/R/2Ry2YI7S1GqSfMw
         R2Wd/yh3fGkhdpqUXZ5835HJSx9ioMwi3Nk3AXQnmKDggY89rRLQoB9vRHNkozSYigMt
         JcuVA7XB4QHxhV3Io+MUY7CeKLYvZVx4bgnGr64uBh7W9uWGvuW0kn1ynFXf2vyELFqq
         umKfs9IPNgqeibcEsQmeRPzj47Xhhm7XaxQXSdciyEfcFi7F33zwx2lJ5t5oGhq6UH4V
         73wg==
X-Forwarded-Encrypted: i=1; AKwUvBzFLihktCZ43fQ5Z8SqxL82IRHG/9qLdxRLFaL+sghUttiDxPXboMw8sa8/nzilIZcq/aCetnze4NVO@vger.kernel.org
X-Gm-Message-State: AFq9FYLwqMFhwXAT4HNRNLqD4U+KPdsck1Wxp1uAykovsbZ6yrUUHAq3
	T0XJUFGYJ9Oc17+9xskP55+npMiDOoZDjgiF8qdCxClQpegE8sSul2WzWPSFQ7HvWerpojlm81I
	U3/R4IjTH+xvjfCyl0BP6AuEDDrXVAqiFQg4N6nf1qQ==
X-Gm-Gg: AYBFou1Q0L6oMIcYSjnPl+U7Nv7yLaOtzglRTZwNyZ0i5tz0XfawCb1+kyrSVaLLxDS
	s2fs1YKpiXeWwNfAIRV6xdMJygylJITnC1wQy5QizwDbUOxCxcej0oVlyHmD3mA4CqoKJZ/lq2y
	TrmNim+pmLgHrGlgb4o0Jqy9KhV3e2MHb116AsN5daeMWStZH3IYtXjxKH2soU8Uw8F7Snsan2d
	pR9Jildeu8CkwNHl+xVUxmi48C0FYld22pD8MWJi2WraLCwJeiiLpP+uXReEkeVM8vGWcVAYf8+
	jHnhLn2TxBtE9Y/lVxXEfu9R21Ze9d00PX9W8KzTdR9Xi6K6wKEUqUr0KTf14GsjeRgvEGEJf4h
	ay1uMEZgS5cHlZTrgsrxvXieqloSBpJt5NklP
X-Received: by 2002:a17:906:100a:20b0:c25:3ec4:9e43 with SMTP id
 a640c23a62f3a-c46bd90669emr681750866b.0.1792989419265; Sun, 25 Oct 2026
 21:36:59 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com> <f9b60989-e58b-4ac1-81ca-f0d37d4143b4@linaro.org>
In-Reply-To: <f9b60989-e58b-4ac1-81ca-f0d37d4143b4@linaro.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 26 Oct 2026 12:38:40 +0800
X-Gm-Features: AclHuK8vZ0KWZhabRgBdGgKek8QAVY3LLhkkHh4HIG41oJjGA-gl75AkOIcoHmw
Message-ID: <CAPwA33LZRPs4O7ihinyorahAQiWY69C1pxWnhVE-gTUA556MYQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Sorry, I missed this one.

> Would you not be better off scheduling a work job when you know both
> blocks are out of suspend ?
>
> That way you always have a known sequence out of reset ?

The two PHYs share the BIAS block, but each can be used on its own.
For example, while DSI is running, CSI can start and stop streaming at
any time, so we cannot know when, or whether, both will be in use.

So the block-level setup is done in runtime resume. The runtime PM usage
count makes it run only when the first user comes up, and a second PHY
coming up does not reset the one that is already running. And in this way,
I don't need to maintain a refcount in the driver.

The order is also fixed: the phy core resumes the device before
calling init or power_on of either PHY, so the block-level setup always
runs before any per-PHY setup.

Best regards,
Jason
