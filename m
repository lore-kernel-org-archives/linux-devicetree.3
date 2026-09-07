Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B9E41835B
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788811651; cv=none; b=bjQNGZEQUTMuuR642rnkF1iSBV4Mv2CB1GkgVBayHSIFggcnktw3cAG2lcBAX5hMS2LIdmztzgGIz601ZcDZPfgHDda+PUpOzyIkAEuMYmNeUPONZyP1GMaln4k8IvlSv2pEhnXOsG+T91PkitYfuAEF/S5oLnnVUxiQL+rpwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788811651; c=relaxed/simple;
	bh=7NykevhhirRjqD4n4VJwFeqZSAO1XwPp+tka/eMaYgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3LfxjGLf2lBXuqlbkLx27ifvG2haarElC8yxkOiuF/KSAF86XUuTe04iqJ7D/l1TpLt3fnx+S81x+mFn/KK6oxrNwZKcJeTCCghUVoooheWhPczwKiFxiX4kEwCHVS8P50k7UYNHB4L3ngBmnj6GXs5H18OZph5SQ2MX3KKLHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Y9OFU7xP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Y9OFU7xP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8687630fso33348145e9.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788811647; x=1789416447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NykevhhirRjqD4n4VJwFeqZSAO1XwPp+tka/eMaYgI=;
        b=Y9OFU7xPUJBy+/s5oAlg1Be75AVxSTrepbtWpgk0VsCl0038EUCjAF+DWkr/Ftq7eU
         w7c41FYEEqLSYs4tED7SCWIxtTKwxN7S5OfWexWjs0ry4+SDVJpAt4G+dqKClIKBdrMq
         xu818MkI5vXHJaZh5dzWWFJZR0S7oAtJjAQmeU31zsOmJkw2vdRaxO5LdR6Mo+7NDmoG
         i0d+nnVG5azcG55xjrLo/PnU9BTO0yP28SOTvcLEqMefqr6pueE5926ljGthl88UoXsh
         1yCTw7rAQZ1bEQKGWSbH4Z7XmVfB1f2xsTzNy9W/dAhfbhzVi5UG9BE7I/koyi0/D1uj
         GGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788811647; x=1789416447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7NykevhhirRjqD4n4VJwFeqZSAO1XwPp+tka/eMaYgI=;
        b=XZlJcENb5JIpvKfKdjuwDPzqrbvaK3ZtnlsfyeZ/sF1clAEkWiino896EcNZ8rPwGQ
         UXAaKykKotzkQpo2ct7FDAo6hqJSSoH2KgDjGYQcLsPLKK4UIRl7RxuoXCCFTdX+FZ9M
         lv6fp4Yp4roph+g8lWQZHSU1TZ5ObZyj7QCe0acKX7Xuzeo08kZmZGMpL5LEIwuuFSHF
         vw11ZiflAMI4eG3/3yfFcY8VMT9JGhZI6RzuuaJTV3gL07Ig6bP9o2MMdZsELahOoRuj
         Zpi9eAR4bQEYO97X9PeyR1IaejgvHqrCJmIN5UrkYJ7k8L03Nv7C2K5Yv9LobbId2ANk
         Zmew==
X-Forwarded-Encrypted: i=1; AKwUvBzid2XIfmZblH+eYlVYSFeq8oeF8mzyadxqT22MMTJpzdf9Rd6IPqHUOac+aR47NsqUwlh+AUVHhiKz@vger.kernel.org
X-Gm-Message-State: AFuF++kRJ3KmC2OFSOAiXGy6g0L11UZDR5Z1AiJnJlr87qKrwuIKhWHy
	mAZj02G+5W6O83buI/YOYc+xtWziaY6kL9mu4+EnoO5xAWgCeR01VyZX+woHFBpIPk8=
X-Gm-Gg: AYBFou1YfJ7g7gv6hsuLnbiHurePLYEJRYnsd/zcRhJqVzY154uAYKuJfXxtfttWoO6
	0kIE/plVXCmcMSV2dcF3IdwIhTM3kBiTwfCfwjN3IBsy8cUpG0Wmnp5lggSJkhOBzpPD0o6qfnt
	la6chDTtsg8dO6deSBqN8GaF16JzoH4JGhW5O5+jqIw3/QRCzkqOV7KhYm/XRr0YjLp2yGFq0yl
	PkK7S4Ddf2cDkPmPhwEEoZ5i2sNigqLa+kC2jzBtc2LlWdx4Wl9GWhikqK266oRebWdvU7Z/hMT
	vMYhv6Ipa/mF1YThhQDdYNNcWsg6XRe53TZF2Cm91UjsWhMdovyGOvtDCXz955lG++f6DXBxgT/
	q8CWEkGS4NbyeoZTq60vgJm6tBMpfWaYlP31m7DakLt96oo0+Pxd4pi9C/Ae/uDMxsoATPObq7J
	HUoehgFOZ/7z2w4XwLXRPOLB5tz8omA9W5JTWrFRI=
X-Received: by 2002:a05:600c:a40f:b0:49c:fa21:e74b with SMTP id 5b1f17b1804b1-49cfa21e9a7mr169708245e9.33.1788811647263;
        Mon, 07 Sep 2026 13:07:27 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm295497795e9.3.2026.09.07.13.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:07:26 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Conor Dooley <conor@kernel.org>
Cc: linux@armlinux.org.uk,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: Re: [RFC PATCH net-next 1/2] dt-bindings: net: ethernet-controller: add phy-needs-host-firmware
Date: Mon,  7 Sep 2026 20:07:21 +0000
Message-ID: <20260907200721.3391458-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907-shallow-universal-b614da6fe0c4@spud>
References: <cover.1788711837.git.f@lex.la> <20260906174621.4107320-1-f@lex.la> <20260907-shallow-universal-b614da6fe0c4@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 06:26:31PM +0100, Conor Dooley wrote:
> That doesn't seem right, sounds like it should be on the phy if the
> behaviour is caused by the phy.

I'll move it to the phy node.

> In fact, it seems like something that should be determined when the phy
> is identified, not really sure why it needs a property at all?

There is no device to identify when the controller connects. The PHY's
MDIO bus is registered by the driver that loads its firmware, seconds
later, so phy-handle points at nothing yet. The chip does answer a
Clause 45 identifier before the firmware runs, I read it on my board, so
identification is not the blocker.

> Or based on the fact that the phy has firmware-name.

Nothing carries firmware-name here, the blob names are in the driver. I
can add it to the phy node and key off that instead. Which do you want
in v2?
