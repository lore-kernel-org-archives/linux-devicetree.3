Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530178;
	b=wtX8oxHquHJsWO6HoluifNlEANd/iqBVf7c4185aHYLkpmzABuwY6PGNsAv8a+lJmO9m
	 CzGbecspTkG00TKqXyqd+mlIsepwQJGq77bUg6FnQFcUjeFnklm61SsuV30nQZxeQX92R
	 7V4s3CGZrGM9Qvrx/7Pu+Omj9+Y7Tji7yAfK86bDZoIRbFUewA7Vkgng2iObsWKIicKZL
	 fVvH4f9fIvrI1skDyyGlxRlOD1bXvpm+iRQ7xnuXl7JHD7jMfQkO1WeYMMTmDal9jYpZt
	 PoUb6r4dtpD6rlvyD4MNEmSE1ljNlct+eYha35qR/Fhk6pyKTwqhe5psf2U8RgVF5fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yBnefECfwQcuojOfi/klJviB1+Jac8n9nY0eAZ9BFZk=;
	b=BvC+AoFTKK27lMsGosegwQdRAWRGVeFP9vFw//R/7FsPJvr2Waq9uyVIvAyWfQz1sCAG
	 GGlWw7v46g9fmSvM2Ua5nv/u+qLNq1+mPnnVUBSYNz45l51d9LumldxO7D1KOks2VtKmL
	 nOm0n9qdvn03lCi9i93m54evCxGB0G94gq14PknHPxsNLCnyrplCA9mb0oQgO3+o6+4H2
	 B77xh3xEar0Rb1Mn99HDoBxa5iPSPx7G3dvZ6t4SyFbaAymwp1T+Vp8LZuI7bQTlXLOSp
	 TTEACBqs4ArEU5eFgvR6z5Reh0GcxAk8AvVo4vitFwYchgJxarm9o1MGYPdowz6ZdVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OUoE0zDn;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD43606A8B1
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD43606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OUoE0zDn
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so6202375e9.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530177; x=1795134977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBnefECfwQcuojOfi/klJviB1+Jac8n9nY0eAZ9BFZk=;
        b=OUoE0zDnOEgkY5AdkIZgNGZCY5rZ7kVZe9xeF8ZtdE/YaCVQR7s3CONhj34hhbi658
         Kc9razRVctDCPlCEB+ytHyVwDdnfRcBrxUYItXaP/7L4rgQ21mDlWH1cVH69JeYQqVYM
         1+oKvqyiSyTUb3hujawgfubIgPLUJ2BNJTKYhothStclFey3tNeH5jgI1YS/qmRs3OiG
         kJxGYwi4RO3Evh3z5DvWFkuffqxw6e+5iQngAajrgWdPzAIHvX/lN8ObWd5XKubie3y6
         YHRm8YIwSzycuQNYQBnSxGyvAXfpEFtqUC73xSkbdQ/UIbgEe+JSMmdYy/vMN+qZAAHl
         0ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530177; x=1795134977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBnefECfwQcuojOfi/klJviB1+Jac8n9nY0eAZ9BFZk=;
        b=0IkArG24y75RrNDrI1Rik3M9U/s/PmoizSOKoOAwpB9CjUsLFzbdyItPPiAsjDqgrP
         EDpMjOqD4Yhd2rjRW54ZS9NTrwx981MGOynYGKoaZ0ztXK4ED5IDwe9+5suDEY+FKcgt
         a4PStxXx8qI5ib62cKwqPvirgusLpLznIo2NQ/4NL03AwvfQTqwAypYAf+AUUiz61ykR
         s/UGq430fOdBGu6hkppP3dUEczxZOy2nscxQiYHt8tYgP7ycEAB/+t/I1mrZ1sACJA/R
         8pTWUmAGwyg9YRGOgMXQvtYRx4wv4O+J6H2oDz1dGkSamErHTEBiWcjvBKW3eBTzcayU
         Ntig==
X-Forwarded-Encrypted: i=1; AL+hErHLEDD1zqkCScHnxv7loStg9J09rnlwZeiRXLaCpcuO9syh+kytpBPJgv7nvO04AQrxg2kG3omiN2gt@vger.kernel.org
X-Gm-Message-State: APuU4Z84+HeaDWHmrp8gSRmOXMjTvnevPzeDhrmUKGi5fj/MGpMUmEMw
	x2MTl5fo6KFtmjqofDdAmwWCh0ClXQS9mK/5RC4Q7z6+7RyZwsO4iPe5
X-Gm-Gg: AYBFou3tx3C1hz5tOt02Cj5STrWyfvcIewDvHlrre6+oZYqkqz+nBw+7w46lp828zgL
	Nnj02LY/xAidFTvNSO/0p+F+4OjZZ+jjciaC/Y0rUPojCp6yD0nSvTck32p5ue/UnR56nmrO0oq
	jl8G+PXEgS1J9C9mXZZ507Hfc9Ij8LT6mwgVCdDAnqjp/OGSySkooOJkmMqntp10iScbObezufx
	XSKdgHCYZvhQoDlS2EZgcW4eWryznW/b/ep65WdmJ5iiHHoStgHSO0LuVx7jnSXArBoWaHTnGZX
	9Gga/QMwrVoOEAp3xu9fxEpR9Kyxek/N44P3EeLTaNA21H4SgwlpSlqlVj5oE534DXhyLdZZGoH
	q3vir1Z3DYs/fYMRKDfa9AUitpFHbZm6zmA+WP2UEK2VruOS+ZsSuXySaNT+zYwsaTIUoIEPO2J
	sVmxgDeFVNvW/oq+st2ZZH/0dYsEB6PS2GoTVVHSs1bTDhLaBXJ5xuCKml0vh+jGdxIXkOIsPRJ
	30RhomcbXCLTXkQGg+u7lurqBWLP9OeU2A2tOit+hQgjoqjU6OG9hkUHK2D6Qok3MttnFcStGDF
	xeIl8/qAsW7bOXps2FvtrgxsK6p4iUfEFydUZd9Tbgqp5kWrDhnGH/t77lBQuWPTe+MObfkI4bp
	zbuNwgQdafux2IqZIapW/CAatiTM5Zvr+R9aZH2sUjk6/i0V2vlZ4X7RKMosbkK9FLP0weqj7eB
	80cnb6il13YYK/Du62
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr12734625e9.34.1794530177039;
        Thu, 12 Nov 2026 16:36:17 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm1812441f8f.27.2026.11.12.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:16 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Fri, 13 Nov 2026 00:36:14 +0000
Message-ID: <20261113003614.3662958-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101307.3936492-1-isasmendi.agus@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-25-ghahramani.navid@gmail.com> <20261106101307.3936492-1-isasmendi.agus@gmail.com>
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

Hi Agustin,

Agustin Santiago wrote:
> Does your unit really have 512 MiB? If both sizes exist, maybe leave
> the size to the boot loader or use the smaller one.

Yes, the boot loader on my unit reports 512 MiB, so both sizes exist.
The next version will describe 256 MiB, which works on both, and drop
the pp node since nothing uses it. A comment at the memory node and the
commit message will say how to use all 512 MiB. You can enable
CONFIG_ARM_ATAG_DTB_COMPAT so the boot loader's ATAG_MEM sets the size
like on your unit, boot with mem=512M, or change the size in the node.

> As far as I can see nothing in mainline implements the cell index for
> "mac-base" here, so all five ports get the same address

You are right, nothing in v7.4-rc1 applies it. My unit has the WAN
address at 0x36 too. It stores four addresses at 0x1e, 0x36, 0x4e and
0x66 that are one apart. The next version will use two plain cells like
you suggest, 0x1e for the LAN ports and 0x36 for wan.

Best regards,
Navid
