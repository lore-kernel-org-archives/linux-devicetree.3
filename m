Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477272;
	b=l1T2g8NFfIUElD26bkxSix9JWDxef79h7korLBx0986RlAXtCV2qwu5Zhas1NETPw0C1
	 9rEOEdxdsKrYeZqAdfnqhqaZJzYbi7tlwh2wzvXFF59fQWB0c0du1GIO50+gpgJ67xLSR
	 4QdMc0zYAOhsJsNachNuGOWAszt9Ljk+Urvn5jus0etjt37ygtwU1VOD7dPWJJoSG6bx3
	 lF44Y6e4EZ+JiuktBX3owBsuwFkwI/eumqgYuNU0+37vF10Fg2o3l8yzy/MMZXo0T8ON3
	 KHxxhrcHS5Dx1CWKrcp8EnfU+psE7CRjzCeZHit1jSACUfKz+vh0LUCjDUdAIDXTj0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
	b=tCOYEOaL7XuvpHgh3u1bTwpGZ53HYQXF6pet7lMObma51oTenlqyBSVA73QShvv0DkJG
	 e/yZ3acJmLcfBGIBqi/oGniK4JzKACj3e9sx5oOR+STcoL8m4PIzRnxFq0xIP4hYFcofW
	 gmliii/hO0KBO9qjKlsQzfVPisu8tupewJGfUumoRF3tmxigzKDYlXXL4Fb8sbq4fjB3l
	 hJJ6YzQFgOASQ3bs2LvGWGROgnqB4rZ+PqOK2XqAXdaVgrKz9WO/pxgtLsQyhqU/iyrLM
	 /FCJuZ6khFLjUsjWgmLcV69K7lUMi3IYbBWQ6bRmI7WWErL1IYMx+x8bjhMt5G9HI2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYWt5XT3;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21573606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21573606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYWt5XT3
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so38484141fa.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477270; x=1796082070; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
        b=gYWt5XT3dQdvUniO8+A/+WNJltKocdfgxkgNxZe8u7HVwfNGB6CA1qdTF5017B6rnb
         98PanKA+f1HpBkUcmRqPBdXcFCc3FJI+Ug1A19doLUqC6V1sNwobGVwzJE6zsYqVfLIg
         3W+Dzl6vvvB4YkIzAagXieJMiasMu5GxJBNDkvlc8o1pvh0iZDgvreteWtF1XXdgjG+j
         mIa5mYRLJHka30/ESkNougpg5hX5vQlZab6K5pePpngpPUfUN94211ZkVeRX2C1rh3Wn
         pzXRGh064vXiStuc9IHGJyKV9lj2DjOwgitxM4KN3rwsO/lYRek6kxgoDpqN3CTvzArP
         E4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477270; x=1796082070;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
        b=jV5laMj2Qj1ttzH/PYO4UW2Ywsi4uZ5QhnUTjBhug8VFdjXv3YpJjrdqXjrumeU2Kd
         DbGBCZtU8CSXbpaUdNiqtDl53XiXmvrI8RLr2i+fcRL9BUIKMdgrXFSHFQFq73eENMGm
         QqAlQ2wsaONr5/0AgcKUq1rHDoI95VzaF8sqAMjPrpt89Bk4CHbQ+BmemApvCiRULA5a
         mz3vbFMPhEht6Ct2pZait8uASAeHeNllJwvLUBNexUkuk+sPH63xyRLQBKcdmGJdFjfy
         sYy0mJneswQ1TsTRukeq0l/xF/3N9zEdfV2j4LwsZxj8vgWdL44b9W6lF9UEgaVODMJS
         7FqA==
X-Forwarded-Encrypted: i=1; AL+hErGqqvgSPyG7qyqmDpLvOOgQ4Qpoy8zQNkspeXVsDchGeSVH8YLF1v2vcMTHZgtjA/oHft6Udt3qckSd@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ea6Rd39Wu6j/zxaqQ3+Z2T4kJ505nQQT2eR6xF4J0UGwLsCiB
	i06Hg5vSaqDvX19uWtTot1XwHY1/2bZQ7NU3L6o3JVR7HTs5FCWB8Khf
X-Gm-Gg: AZFdTZdW8ojt5kjj6MPLAd+sYBQi+mZwTit6IaCh8oBiwu0+IAP/FjyHOHZGt70cMY2
	1ySrMSa5a63o+9WQ6h1I/gszKEBf91Yw8450pKxLMEmpomB9ST5Kr2ukk1jI6GdLw1I/BXvWiPE
	V06gYMGxoslIxDj9z1ILvQNiJT7WZMRGSPx761wbTP/77tpJ/zqQOAUClS/hoSAQfQbRWLmjFOR
	KrYlWbFETZApkFjhhQFdZd2x5YPqnp/3JRN32wHswcV9+0KIj+X6t5MXDA3LovYRRZnu9dkABvd
	c+UCyoHrUNHdBPNVhuRSAjU4kx6NzwwvHWa8CVbJ8b0Pn8lj6q2uFls7MHfZY0/KcbUaAqlZzNl
	Q8LDhBxcGjYB8VBozZHOKoopazc7EMzz099PDCi5dq/BL5T6VqqiwVKfRTdqqGqWCfHWVti/bX4
	MfVrBEvP2K/ZCsAIkvd5URjepK/LqiHiKySfs+cbS5xRommo7BsQmqIY9wYr7FDwf5USo85hq5E
	u/89RjO3gGdxGjmlqyL0MmUCMty6HVDWTwI5+3qBbGJpjO+qa06h+mZhOwtwHC+zIPfEg+/oMJN
	s9lVUtUyvd2e8OmzsyOIiLIbRND3Zp1dvvdGe/uoTQ0xqFkpecHvqKU=
X-Received: by 2002:a05:6512:124d:b0:5c1:56f2:fda4 with SMTP id 2adb3069b0e04-5c1bc89530fmr3136762e87.49.1795477270244;
        Mon, 23 Nov 2026 15:41:10 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04451csm3314217e87.59.2026.11.23.15.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:09 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Andrew Lunn <andrew+netdev@lunn.ch>,
 	"David S. Miller" <davem@davemloft.net>, 	Eric Dumazet <edumazet@kernel.org>,
 	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 	Linus Walleij <linusw@kernel.org>, 	Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next 4/5] net: cortina: Add CS7542 CPU network  datapath
Date: Mon, 23 Nov 2026 23:41:02 +0000
Message-ID: <179547726260.3.2509837092976108381@gmail.com>
In-Reply-To: <560efd8b-44a6-4b3f-9f88-d1a891b4f253@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-4-fdb5e8c2d508@gmail.com>
 <560efd8b-44a6-4b3f-9f88-d1a891b4f253@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Andrew,

I removed both module parameters and the unused internal-buffer alternative,
keeping the previous external-DDR QM/TM default. I could not justify weight
16 with a hardware requirement, so the next version uses netif_napi_add()
and the normal weight 64. The .c helpers are plain static functions, and
ndo_open now unwinds through cleanup labels.

I reviewed the flags against the core transitions. opened publishes a port
under the shared TX lock after IRQ/NAPI setup succeeds. netif_running() is
already true while ndo_open can still fail, so it cannot identify a port
that shared completions may safely wake. Clearing opened under that lock
before netif_tx_disable prevents completions waking a closing queue.

stopping gates the single reap timer shared by all ports. Last-port close
sets it under the same lock used by timer-rearm paths, before dropping the
lock and calling hrtimer_cancel(). It prevents a running callback or RX
poll from rearming during cancellation. I retained these flags and added
comments explaining their roles. rx_stopping separately closes the device
retry/IRQ-rearm window; napi_disable alone does not join a poll tail after
napi_complete_done().

Independent built-in/module ARM builds without the platform series pass.
The revised driver also passed Almond+ RAM testing with live NAPI weight
64, two load/unload cycles, 600 byte-exact UDP echoes and 20 ICMPv6 replies
through the normal DSA path. A separate internal CPU-port diagnostic
passed 448 nonlinear/jumbo frames, including 8192-byte payloads. These are
functional checks, not throughput measurements.

I will collect further review before sending v2 within the agreed cadence.

Thanks,
Fil
