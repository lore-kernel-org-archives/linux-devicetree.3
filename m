Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89D735200A
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787015974; cv=none; b=IgzoTY9lD8Q1gA2WpaLS2F5oR/Y/WoUepkwOSnmJCjDSEYMcqlNGyq/ClpW3Q/mI2oEe5s9OHlwQGp02nVmMs7q/ywwzrajMiVAMAJR2BAlleNLILwPXdYHHM44mkxoJ5HcwWCM0ozsNcmA8bsGAKuGOl270eRNTji6vz9VcMxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787015974; c=relaxed/simple;
	bh=+9DJbzpZ8tW/cGE2nLGaoIX39pZZfgkjdnpyQdZ4tGc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version:
	 In-Reply-To:References; b=rXfbbG/WLW4l13mjXErYakg4w3kPklng++ZBa24wyszNJGh8GBf9XigA7sLXaFI2TXFv2xrt9xIa5eWO428gutEB4YvSroLRmAWB/xwyrdVK3Rfu55SRRRBwxQ7A9acwXHX6CpeuskIhb5cw6uSX+a+HpFAyn05MYk6HJ0/5srI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTzqZCI0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTzqZCI0"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso515417b3a.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787015972; x=1787620772; darn=vger.kernel.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfkLuSdmwN1ckqZLOyJ0ADFIrM3kNuRenkgg7slseYo=;
        b=mTzqZCI0lnS5FLE6knMU4CnAcDt6Ef40mWfNla2lhEfzskQNG7x6rTY+VgjYe/M4v1
         q+LLlTdrX0fwaPbsecTCWViGhARnC00XDq4qCe8wn2mOcx8BFqJgLmEOmaWn1eJ0jGPT
         tEwvJ7/qHt50Zjn7ZvzGDrVuckqMqgq7x7jsnUDE+HdOhvPwsZ3ph3Nq/mu4SkkZ3kMr
         CWLc9tmBvT1GwGfbEcWuUncTPjpr2XnS5LwT5sdY/KWImts5H9wIRNS0NDZCbZ13tfDU
         /93Twzq7RWnCwZq/0NorDWR9aQ+pjxwEaKxH1lT70+YIS9DPvQ2U0Prx3CbwAkB9OoH5
         f+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787015972; x=1787620772;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfkLuSdmwN1ckqZLOyJ0ADFIrM3kNuRenkgg7slseYo=;
        b=CP2bnDZFORwrBaHkZ15ozTX9n0VWmgBFQ6CaE6uRzUwkomoASLvM/ebGf05IxP8bzC
         zCXp//SjTGKwxTSBuj22ar0+t5tIEPcv+LwsJ1a1nb3Bkdc+Jm/m09xcIoesVZPERE9W
         LSnsfG6JJKRMEG0GMt6GMjuG7RW4rHVZhj+Xc6h/yeBLGtxqfMolx+rOdHQR1NBY4ZZ/
         SRTqqT+VSLnTztpuvOIo2IOePr6ycPK1QPWUWmgAKTbLjlD0rC6fX+WlTBXHeGLgL3As
         4jKpzXDgmTP1pQ/sDfOvWQOGmXsBYvNYqpuulfcB8m8yJgIjph6nAxqxW0h07cB0JngY
         U/qA==
X-Forwarded-Encrypted: i=1; AHgh+RpYvHbQkjTuATPrY2nTGJOjS7Ky691xCcr+t25u6iO4DUq6OYlYmuibOi80OGBqI/Wn3bd9WTM5D+dF@vger.kernel.org
X-Gm-Message-State: AOJu0YwYd7ocKG3OxomS3tMtJfZ0mMPf6wXoBFURHreE6pChK69yugRS
	7Y6Tgs00zGpfMoESKafnpoavuB8arLFNNt+4b7MveZuDtESZ2oc9P6Xc
X-Gm-Gg: AR+sD12WwoGuflL8qDZB9DBTLSkto58u7abVpb2yXvUl6UcvLVPBwJfTNq+jcj5prZE
	OuYSLngtXWY7KiuClRWX4SlsUuFi2iZv6+nSmZtoULJiPOWfEG2goIquTsI3biKUxfSmF+/XPgo
	6KkdszB9x9nM9IXksoZkVnDcuUw06N54oXeQ0q4L9TikHSPrWuHdb8uwbPD57glTFfsqHCd6LUK
	0iRKC23tOA58EvJA/27cIMmYnevdydkAjen769vUeb2iuWZriWDPvTzDROWHT6qmbduuG9wsBiW
	toYKENL48tNSFYLDLYh0dFhWoOANq0WCjTgd0CvRr9AfS8jdSdRQtjzXjviR9qDg3jzd8TgUUiN
	3HAuFbIaIVYM9T25q7d+xozlyntOlPuy6guHLeiu/46JMlml/aewZOCOcy4aaGXR3AJVdZHBOCx
	MXerb9JsIqYjvarBOsXMTriD6zFgVqzFxQNiYn6+ntTKcxjRQoHBK1jA==
X-Received: by 2002:a05:6a00:ba8e:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-851bc3ccf5fmr2527196b3a.15.1787015972070;
        Mon, 17 Aug 2026 18:19:32 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b3d1099esm1196713b3a.0.2026.08.17.18.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:19:31 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v20 04/10] mfd: an8855: Add support for Airoha AN8855 Switch
Date: Tue, 18 Aug 2026 09:19:25 +0800
Message-ID: <178701596581.1096543.14003915779643840966@gmail.com>
Content-Type: text/plain; charset=utf-8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260817082034.20326-6-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com> <20260817082034.20326-6-ansuelsmth@gmail.com>

Hi Christian,

I noticed a possible MDIO bus locking issue in
an8855_core_probe().

The helper an8855_mii_set_page() is declared as:

static int an8855_mii_set_page(struct an8855_core_priv *priv,
                               u8 addr, u8 page)
        __must_hold(&priv->bus->mdio_lock)

and uses __mdiobus_write(). The latter requires the caller to hold
bus->mdio_lock and checks this with lockdep_assert_held_once().

The other callers of an8855_mii_set_page() correctly hold the MDIO bus
lock, for example:

        mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
        ret = an8855_mii_set_page(priv, addr, page);
        ...
        mutex_unlock(&bus->mdio_lock);

However, an8855_core_probe() calls the same helper directly:

        ret = an8855_mii_set_page(priv, priv->switch_addr,
                                  AN8855_PHY_PAGE_STANDARD);

The MDIO device probe path does not hold bus->mdio_lock around the
driver's probe callback. Therefore this call can trigger the lockdep
assertion, and the MDIO page-select write is not protected by the MDIO
bus lock against concurrent accesses to the same bus.

Could this be changed to take the bus lock around the call, for example:

        mutex_lock(&priv->bus->mdio_lock);
        ret = an8855_mii_set_page(priv, priv->switch_addr,
                                  AN8855_PHY_PAGE_STANDARD);
        mutex_unlock(&priv->bus->mdio_lock);
        if (ret)
                return ret;

Alternatively, if there is a reason why the probe path is serialized by
another mechanism, it would be useful to document that assumption and
annotate the call accordingly.

I don't think changing an8855_mii_set_page() to use mdiobus_write() would
be appropriate, since the helper is also called by paths that already
hold mdio_lock; that could result in recursive locking. Keeping the
helper as an unlocked MDIO primitive with an explicit locking contract
seems reasonable, but the probe caller appears to need the missing lock.

This is a discussion and fix suggestion rather than a request to redesign
the series. Please let me know if I am missing an existing serialization
guarantee in the MDIO device probe path.

Thanks,
Wayen

