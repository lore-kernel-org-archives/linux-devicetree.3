Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793620103;
	b=HDzgBL77BCoKbf2q6kNiBPuI9ECDa4hlsp5AG6JDYC179JrjINFy41C8+8OGpmoArUWn
	 +K2Sd9FblgtWaWa/QXGrdhizpZl1PhUmFxPHA4eLvHmSevEZ54YElRv8xm/pMhUrmeuO3
	 tFWZYxGMwynPBBO+jE7gb30augEwOitskpfr/8qQkWtr8pJX2sdoD7/0Dr3BNg9A6eZ90
	 kzB9B+SY9qoMRHJY8tXkqN4aWd0PbFLUaS3hdjPnFCSpNwFDcnzoW+GMDsUjZZyGLVu+5
	 VhZAhecFfVS3Q/nMWH8SeMxyzGlYesGCQgLTNDC3yVYvE1C0eXouXBphqesAKNI92QA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rauZGBFXVvz8AaUGJr8FmAMzmIJEbnyJfkU8F/WFMhc=;
	b=BRWuEVjhWta3uh+UnLGw3fU2xbu9c8SFfZcA42KmWPM6rfLob9vyENnIw2AYbbP6NxhN
	 L8brgbnQRirxiWM/PUVBfaD5S09QovMkINwnuuuWUx3HZYMySk0s79Lxn76TXDU9k8S0O
	 zLTIlGHkaH4TJxwcFF6V0g6Tu0ycC6N46iWWs/dKbeUUW6iIjg+nKX20ENaoq5im284tD
	 ukrjJ6FZivwPHbGONn9GqnjOP1SThOwpnddpXKfw/1d9EaC2EF7dUnDBc8SXb8Qltp4KE
	 JlLDyEB3vBnfC1mix/MjgVas8p3TJn82SU0EFHFG55qJVEdTad0ouWYdqXFkcUZp5dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deHCt1kX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A39606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A39606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deHCt1kX
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6aa9606ddadso2269937eaf.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793620102; cv=none;
        d=google.com; s=arc-20260327;
        b=ju7FbUUK70TvZVLSc3zX+4EeQ41H2zkEbAgPESdHRSMZy5F2LlMmeP1N3YsN8tlaRl
         0Dxe6Qevz/tdQCkC63wwBLmiP8R4f2k5Ix3VlE9v4rgvrl17DBBDaS/ehWpdPvE1+Dsz
         HLjm4G+OP0roUinu8kIibKA4vjdnj8HO76CzUBS0SRBJ7fNUvm8UyqBDCC1UqRsZb/ng
         zvmM6NkTvWDeur1H4p5jTR22owVUfgNju3Fjavpt6OZgSYmXe9kht5fymY/S1WnZDfSY
         2qUggcg2e0wPCzN532GHLShwoeqrydq48XcOHegCE5gx3lKhKpObsnuJuZa3hrS7cIEo
         va3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rauZGBFXVvz8AaUGJr8FmAMzmIJEbnyJfkU8F/WFMhc=;
        fh=V7W62+zST2CNAkXLS+qCHlNsg9x9LPguXBldHy6fYfo=;
        b=pAhi0bdtzitqBjvcDPBwLyrBYJV43M4nZVVaTLNbUwrkj9DnStC3aw7P1mZgfo96g3
         uSk5tZZwKbraGsR7Qn8/9p0+fBgjsMtjXeiWCopmaHtdwmysdZxTR8oSIo68ZTsi7+5O
         t6f0sHCToryB81nO8ForpghzQLzr3j5ie7OoiCflO7l2etJxDNwN+Rd+5yR8tnPPyXLv
         vD/vYxxRdk/beWRVWHD2zaNVrtTGiszvKVsf5j77EyTxdsPIcy4k/yDFKzcmshg8mTWy
         6Qc/8n33N31H1bmNBtdcEjS9a6SXBz2IkxXwUhqTtWulxQSD1dRyEhqgkBLpeMZwgVbS
         Ec6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793620102; x=1794224902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rauZGBFXVvz8AaUGJr8FmAMzmIJEbnyJfkU8F/WFMhc=;
        b=deHCt1kXObf/4PvERbEkS0a1GZPsmvpFF3uCs3GZzUmr5pGcw9Z1Ls/yJHcNgI4vda
         +DnXQtdzKGwWt8BjT6daHFQFhPWr6itZGXPkxKZg6HMZBJAuahL4tuusHk4BT6LtAeRG
         RzZnF9uQCOWrAjqZnUaxzvQwfQ1w67SVe+giBaEoExJpeQ6gcLkm4aGDLV0Z0QPVwNH3
         RSh19dBZp1fGxTPrA10YzZkEIqNXhkwava3+eNoFuE6FeZ85r70LQTLmAAWFroOsXnvf
         Bt2dkGahlmFI83l9YX/vTuGXTuB+AZ6LWMZjrDEjdUyjd5AIo1TkjBSJgVLjrWvTiFWK
         UOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620102; x=1794224902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rauZGBFXVvz8AaUGJr8FmAMzmIJEbnyJfkU8F/WFMhc=;
        b=qy+a5CVx2PtUHhx3BIZoYOy+gy09FtNA1yPXxPJNkOUYb53EAO7aR3ZU2Vp4UqHZG9
         4YyifnNoDTKi7zu2/NFXqCzwgZYFTzkj1ZuHYJWQ/8mtneNbuA5BFNPB/zCV233kmiRu
         fpjq4elCxW4TImESZHzirWnr1yu9uH3wK8kkPTrjTOD9QJxq9YAiemWaXcv+Fo66LAp9
         ivC9E0MktAMbz5IHhZWcROvPyt4h2p5mkQ0hODPyJDTTfT6HJXmCAYSs8yw26H6w7L5s
         T+5TgWgZvwPQYsdptlJSh1G4p8nPyDzPOJTzoVqxO0dVAOc3q4MB0Fv5e/Tpc+Wr0gIF
         vLgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVUP6d23kZhIvEMaRDX+GsL8MOdgNDAm6+nDBJ+bd3S5Ii7OMb26ny9lnAplbixEKpr88FQg2Urk6o@vger.kernel.org
X-Gm-Message-State: AFq9FYLxg8uV9cpHpT0lRBE8h/HbDrH0X7Dn+/PpS72sDKy/7PJ9OXhe
	dLnLggpThIZHQAsSLB8YNjLylVtQFXxAgl3/LqUcrLZUix5JXoootImuv7kYhGCPcluBcBWFjWA
	3YYJAnLEatefa4TYcAvqu7fUR5N3eXMk=
X-Gm-Gg: AYBFou1Ksa8SVIlRUw+CeWeVEf31jY1BNs+SvE/MC8E40nYWvX/sc9rbuISjwX5E836
	SHImbiqln4N+pafh9J5c4yAcYdaTFuMh3pBpWC/rMtMQVqfqnlB/yv2j0lZB+efaHIrxQ895IE9
	WN1iNkvVHv1xwqn0A3XizGZt4Ua2Ek9ZUcoSqrpv5IpyYnYoZPmB+6x2XELdKzAjm71TbGFgtKI
	Ntevc+MQkekuJrUAyZwpAPRBhQoj6e66PVLya5vYB0XltYcyegLBmHs5YfrMVGSh8OoXsrQoyOl
	dfDKBMXeOghmnO2PBCrtHpzXD49p7gWXV8D/xxcNoUxms7aurhtQUutCDf3KZJLURbT7f+PNp33
	id+W1lsQfgdWCFB4sCAZ2GXDZ5cA6k51JGgNCBvD2SV8xD2LoHf7DoH2MQOLv3kvdcgL8PWFoat
	hkpc4WzfZEY6TQG1xJN/AWg7hvsK1/n/pQXeW/sXR+z0wkTsPYqA==
X-Received: by 2002:a05:6820:1501:b0:6e0:1599:a4b with SMTP id
 006d021491bc7-714f29883fdmr5485309eaf.18.1793620102037; Mon, 02 Nov 2026
 03:48:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-tf-luna-v2-0-ce403579bb8a@gmail.com> <20261102-massive-busy-woodlouse-8d0bbb@quoll>
In-Reply-To: <20261102-massive-busy-woodlouse-8d0bbb@quoll>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Mon, 2 Nov 2026 17:18:10 +0530
X-Gm-Features: AclHuK-Rix2X8fn5EwhAQXoIbuQmroe9ZGiZTVGN5aB_rSm7KEtS6EsFTTUOsQw
Message-ID: <CAFqz8LJZQ+tw6wmLS-1FXvt6OxBESPEyz2-uK4D7B8X8epoKhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] iio: proximity: Add Benewake TF-Luna LiDAR driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 02, 2026 at 11:47:56AM +0100, Krzysztof Kozlowski wrote:
> What changed exactly? b4 diff fails, the patchset cannot be applied on
> any known upstream revision I tried.

I am really sorry for that, I didn't realise it was based on Jonathan's
iio.git (testing branch) instead of linux-next. Patch 3 conflicts in the
Makefile on next.

In the binding, reg is now optional, there's a serial example, and the
pin 5/6 descriptions cover UART too.

Happy to rebase on next and resend if that's easier.

Thanks,
Vidhu
