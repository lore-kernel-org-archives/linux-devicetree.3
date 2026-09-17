Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CC334B1A5
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789607393; cv=none; b=pHx8twqX1rySIZmYpM74UpgFL2v9ySs0We7+lsiFt+jKvkYA79ZQMnXShMIgxhOCBRkbobcB1Mw6Ncz9nxV11XSO7PA2OuzokpQNFez6Lhx0x7exf/2HaAKLrWH0elo64DZD9WiDtgM+9UGPVTs5d+/nkY+Rx7Hdc4f44+20ojc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789607393; c=relaxed/simple;
	bh=wW0DhjjxvZrBOHLiq93URvUQIpbh5rFvMHFa6dq5YkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNd4x2K4OJV++1LZ2BVeIC3sdm6Vd2GhUNVRlnp5AlUDq7/X0+Frl0sae188d338aWyVf6bHj8Dq/I0lzGS+Kzf12ddgGfVrVo1bxMS5trxnapaZZxuVnj4/YR2XMKvxh1IBIS46ApWVl00t0fc83pL49d4Oas9rtDgvlQCPrxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YazLXU7H; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YazLXU7H"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb751so228397a91.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607391; x=1790212191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nonWuzicTCeYBkiKvjrnS+sct50ruoIlfuFduwj3gS8=;
        b=YazLXU7HdPJVy8mhtNM95ZvSFubBlE1qHgbcS5h06wF/jF/smujnYMw+FqYDZdG8Lf
         5krFtNTHY8YsWsbe17qqIP0dblGNxn5R7LhqubF3g+yCZZLiyYDMDsak+ElKBNOFP4RU
         VFqGISEVhnZYPmTuBEMhz7AZe5gCf2/golhZnc/d6g+i1q0PhW5cgnA22a0/FVQlmFJ9
         H6TR7QYAosxlpPyV9qA5PCFqwD+tUqC6yV+vw9LYacrwEu6SdKNSYBU1+xPka9d8IxYL
         /IGpRWT5+e3G0RmVku+HbiSv+H+PCxnZZthjp5mlCyXD+RhdPENjttPFquI6/gbmnKvq
         uiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607391; x=1790212191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nonWuzicTCeYBkiKvjrnS+sct50ruoIlfuFduwj3gS8=;
        b=wL50/kKmN/HyETBL4BmDSAWqsCZjAGkHxMXjpfJrYiLfTqIcw16vCW9NPc/KKzGjs/
         KbTI7C0iPYWNX5f11IdFU18EoEmvs/650CFD7RWvddxp+LFTDKmXGcdX3lSZXXxmClK7
         ZTgJ4b4sH8kjiWax/GIYms+zpfn7emitXoLCM+hhVdN+6OP4peU7NJyDatmo3BR1mtNF
         Ylljurq5cIY2aUKK+BlUoiH6EP3DWwWVIQ6DRDhxzLYDDv+e5eb0bl9aONWaLnuSwl9v
         N58KhNfsHtGcxVsjIbMOQm0mMNF9Dmx0n9SVybVYXK8rVYyxopzmKEzizvFPJSzoCk5L
         Ed2A==
X-Forwarded-Encrypted: i=1; AKwUvByvDRu6ZUTzHH6EPzq76Nml8uU+tj3C9oPbYu1yVjBMmVh6JemxZqp4xBtJ+bkK/BXPYuIwLss3aI8V@vger.kernel.org
X-Gm-Message-State: AFuF++lwQAhl6i93v4uuonYmZDBFIqsbNJOpWPqdvPUrkm5+L5MAY6RB
	R8WqdcrcSz+nsXq9f/pWTgDITV8JTC8j2sQCsIWuHSVAimKp2JNh1K6h
X-Gm-Gg: AYBFou2euKdRBKb2fPUHEiDHvoudh0tnnd833dOWVEvm0mt/Eu8T0LtgVaCpK35naOx
	q1JXah+gS8v+7iCqV+dUavC3WE8YiRRPYhOwKmEcliOWwPVWQkyDXFve7ktCaNvr0zUeSgMwP5c
	uJ/Yo9c1SzsZOSi9b6OMqsFdAq9FC0dJleRaw9MLnsxV1vqdb4cljEWQw4T2SB9cqkzzc7es0d2
	izwaHvUIxCE5Bn8bfCFWNJt0d5FjOKag9ue5BIcRgFmEYWfO0KXdzuWys4VbESHQ0tVQuwsuyay
	NecZou78ApK1lVyhxibqGZxjOqXcN9tLf1QGG9sO4lp7uzJfdka9cKKkrPuZwbIjh8+9xAyOYOR
	8pbzsUdvHehKks2IqmHgIQZIiRhsark9+hKI1y7yhc3IIYe2YjfOEOGXLq+uD6UEWeCzfSAeMjw
	eH1+l1EPtNlaGRd+wNOBFFiCH4TjlDgoH8nY8Jy4i2HDM20N2Z4X7rT/gjtvdfY40zTYEHUY7zI
	soxrBL+nuYD
X-Received: by 2002:a17:90b:2c88:b0:39e:26a7:7aca with SMTP id 98e67ed59e1d1-39e26a77cefmr11932602a91.23.1789607391606;
        Wed, 16 Sep 2026 18:09:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cfb0b1sm8545272c88.5.2026.09.16.18.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:09:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 18:09:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/8] dt-bindings: watchdog: Add compatible for
 MediaTek mt8167
Message-ID: <f0ceff89-4fdc-4d93-8e0a-26137e1f4279@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-4-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-4-l.scorcia@gmail.com>

On Tue, Sep 08, 2026 at 07:38:30PM +0200, Luca Leonardo Scorcia wrote:
> Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
> which in turn falls back on mt6589-wdt. However according to the data
> sheet mt8167 toprgu is not actually compatible with mt6589 (it has 14 sw
> resets instead of 12, and its reset bit map table is different from
> mt6589).
> 
> Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
> add the IDs that can be used in device trees to identify subsystem resets.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
