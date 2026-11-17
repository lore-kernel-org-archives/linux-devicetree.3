Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952088;
	b=2xAjPBV4mV+nq0oL9sn69SHMXhnd3retkRlsNqF21hdgTpxoPhifkWg8J5vI30cwY6t7
	 fkVNY3XWP/M3OiJb5MEvgXxzCftrHH/Zx5MLy+c7PKqg8RQiMZmy9jGkPv37jbVj7UNi0
	 zMRCecUyIN4qqjbjc1ovavda8IDWR0rAitHzXpAgtXPDf2wxCayOZID7H1YTz0CGDVeBS
	 FWSLzKf7dF6y17RR57ENZzMsnyQknEYuK1e3HWsZh4QI7690iDw+CSgADDPUxdrr1/Xrl
	 JzmBkgNqD2yIShM0I2LGA2uGGPRMU9hzf7jeyQ16UBXghddzG6PacEs4HJ+dKxrJoCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
	b=RDP6sSelm4VJhzEuBecKvLnA7kULrY5weo8NTttw0sCP3nogrlCAnA0Ot0StvyVnsWBn
	 J6KrCCfvGfcIglge/xoaszgO0+F7eHpRsyYBwS3/NgIDKhKsVkJvhypayteRUfFuiJEMX
	 aRHNY09osT/lFDq/ztxkXqDONC8kC9sgICfGAGv/ic2McrWADwD+AYM9LwTXgDjIPWY9M
	 FtRLYWCFcOo+pbbVL+20QtigHLnqlOtKhjc1UOe28CBsJDUsvS5AocJa50UyWfh+Xb5MD
	 KI37BoIy/+A8cHqzq3+2oXCUYPnHFIe2AzTrzsCtSlqxJsecX0LEmFSC2li3qWp5BXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e24jyoO5;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D4D606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e24jyoO5
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so1806477b3.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952087; x=1795556887; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
        b=e24jyoO53YopgaSfOE/Fbsm5STwcDYn92WEUT2SbYFXEfZbdebuB9Uz4CNO+wMG10Y
         Gv6TLPmp31f0I04qRwADQYTEIymhSy+cER/u+FlolWhft22RQe5c0V9BxS3hE7/b/Cez
         W1CArqkceyzuR9xgeX22jpGyAAuOd0N1aMUX3XYYuv2GJFAcSdgJH68gkZyqVhs9awsS
         mVPFopBZA29M6jIZHeAqYRw+H4g+/zFHUhsbWEuq9eryl/muCInH27hprXKW+8XbARw4
         FmimRJiAEuJmofIyBp87dTHKXUyDm2XD0AGimHObRlVtMOhJB0FdT10oIecAelJM22UJ
         U91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952087; x=1795556887;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
        b=LLpzPX17C0YKwYV0jbXM7W17qQuqLV53fs4U/eSt7ZqW3/rw3s/J+px6N818LPmQC6
         yL5dcayhfBIW7vsok5Y91lv6jHRIw1i4yR1TeXjWNsakOkBwOi8H1JYdpa4pS6r1FBWj
         2c2bMQ9mPXmqIIsqDw6/h+H2jh/AOAG0gADGF7gqubijAgzzvJPX1iXnD+OG2caXS5yQ
         5snhKMAIKKM6pwYpZlWLkOd9wsZE3N4SXb56WSdU5e0XOoucOOwLQGO0TJNejOSeQGPV
         l8oeI6MbOTrrgBWVW7c9+khDJPOIlJY7VW5rv7jit4YflwCw6NNu8y+hGeKn1nQ5Ttoi
         scuw==
X-Forwarded-Encrypted: i=1; AL+hErFSBUaHVTg3u0hiklSxnEZA31C9vfQiMvx9rz7HlOa/zajPk0TN1F64b+CS5Boat3OLdJ9qCBUYfzfZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9nE9VaXEus+DmfpKWouNgZ7UctFmet83JaZvvmma3ppvuCkQg/
	0Yno77vneTx9AEu4ZWaU52gTYMqHZ0nqfDGZqDaO63umw0kS5S8ddqbi
X-Gm-Gg: AZFdTZfeI46/uszj4C1OvyJ8A139ZiYCMCyj83hWFT9nRcWpSz+Xb0U0odmwaESmsiZ
	f7pcYmGUPwaX/DYFmMlXeISix8Eav9oYommtwTPVi4xO8AzdKnpONI2JNnNqSw7QkDe/lkmIc8E
	z0nVmVOibuISsFLQ0p4XpUUthqQq8s/BKPpWMTQplp37wBAVCIsiHeO6Tf/6AXAgJY5ZuLK9vTz
	h5HBFm6R2HnfFNJNWh7EW8dIXXoJP/xPjHkV1cfV1zBCtgwzfoR4rtQnRdMxq8zLwnHSOisc1ri
	feAhy/dfKY3nqQ4KmxNlu9dq3fymraPBpqlYs71saMUu0p2IFlpY9u4TdCb8qSR5QILjGgx3Rbh
	skJ95/ojJN5TjXMqR9ruo+sarD+MqemS3b3VAuls+YSy5mDLkytNiacMUQvpQbO5ZGnb8AwZ1gj
	jlV+ABoAQhK22VhI45bVjD3bM4F8I/YdF/iPxlnaFTMnx3ykb7ZuAIsCGpLoAjhYgyf8jl8giLb
	ymu3LYYbwS9FwGRRMlOuaQcJ+ihFD/qpiJ4xytGqryj8e7SbYk7vU1pEnLIMc3OYSSxzEOua4ul
	tHaKU7XzO/B3QhnDphJ0imHq
X-Received: by 2002:a05:690c:6502:b0:8b4:e2dc:3f2e with SMTP id 00721157ae682-8b4febccf0fmr3038007b3.8.1794952086607;
        Tue, 17 Nov 2026 13:48:06 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030a65sm7195267b3.15.2026.11.17.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:48:06 -0800 (PST)
Date: Tue, 17 Nov 2026 16:48:02 -0500
Message-ID: <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Cody Kang <codykang.hk@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
In-Reply-To: <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Icenowy,

On Thu, 03 Sep 2026 20:08:10 +0800, Icenowy Zheng wrote:
> 在 2026-08-09日的 21:14 +0800，Cody Kang via B4 Relay写道：
> >  drivers/gpu/drm/spacemit/dpu/saturn_regs/dpu_int.h |  25 ++
>
> Is the slightly different K1 Saturn DPU registers considered?

I compared them with the K1 BSP you mentioned offline [1]. Judging by
the block, field and interrupt macro names, I agree with you that the
K1 and the K3 use similar IP. But there are also important
differences between the K1 and K3 registers, which is why I would not
propose reusing these tables.

For example, the blocks sit at different addresses, and most fields
are at a different word or bit. In dpu_int.h, CFG_RDY_CLR is bit 4 on
the K1 and bit 5 on the K3, and the underrun bit is 9 and 8.

IMHO a K1 port should add its own compatible, its own field header
and its own backend file next to the K3 ones. What do you think?
Hopefully you agree with me.

[1] https://github.com/spacemit-com/linux-6.6/tree/k1-bl-v2.2.y/drivers/gpu/drm/spacemit/dpu/saturn_regs

Guodong
