Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EAA3EDAB8
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920666; cv=none; b=ot4+hsv+yrCVfPTigbkMDz9GycmZbblpt8v6dUMOn1z07jcbA5Qgu+srbMeECq2aKKMQCndFII/V12KPElXLlZPcc9JCf0QU1HoIR6fiM+OiUgh86T2KWppM1VyMehz66Ktxa6V/PgN2lwYjgwBr/zBgNgRE5+W4Xy3R2UKUGzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920666; c=relaxed/simple;
	bh=8i9bOYGYQzHQYLKHdvPuhGvLZ2p2ffvSKqoVSbpRvJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rs+ruwrjqLxVAr6o+fPhfBa4PpzbBixpKIHpmxM5tMYrOpQp0VHWUmANF+V/WAOWPMZ3ivgF3YzhZ2Ao+q/1m9HtmT01Yy/yfz+JYqj7SHOKCzmnCqfDTgydjgHR541b+jOhGiBNWakdl7BaOy1VeSVNx6AB1SI3HVi8EgXTHgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=YsRXNOrx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="YsRXNOrx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so3518195e9.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 02:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1785920658; x=1786525458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8i9bOYGYQzHQYLKHdvPuhGvLZ2p2ffvSKqoVSbpRvJE=;
        b=YsRXNOrx6eb9xeLrTVvf7fMx0nK9A9orhsVCbS0zJZUwNkiPvgKzR2kzM4kXwGma+j
         Xb7X4nILybHVqaI3MATi4vcw+4kx8bwfxoUGpi/IdZT0XNm/1uR7Q1W5nqaq542eUqZy
         uzWpJSLANCdUieDtgMQmXcWLLUfA4qzy17Syg+jxiW7zYZ+Ovag+uJE4tkHW+wLaPPE9
         xvhhk4xzJYa2FCvhgXS31VsGygXq6hltLHffSrps3VhtD8tsSlScKFTxLDxnzAbhbZz4
         D5gQ6GfsZ89wHkVQ6iP5uTmccpRNkg8k+qQfhaD6rLC/OvHhzUu4ovFnE147LQH20oOv
         ZxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920658; x=1786525458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8i9bOYGYQzHQYLKHdvPuhGvLZ2p2ffvSKqoVSbpRvJE=;
        b=Rtr2N5YP28Ajt1uSoZbVLlx4+m6x7m4ya1i3ms4EmNvfuTe0iNJ+32eJU0NEMDh3Ge
         yxLaMJaE3CCavBqzFc5m4GDBNVgV8wa/vxTMexksV7B5pjoj9isYaLBHT2aWsgeKvnmq
         aL0qb8+CNMiIkHXX/Biz80F5LRrLRU8y8tfydQ8PGSet02WLq4jBexL7DVxjgtfFakJe
         5jbeIcGbpezXxZIzEFhYlRXOyaKd3YQw3jyBWJ2pjHkag/DX331lUeliR9qYG4MXLAwZ
         MTxnO/ayJvZA0z6M1y4+uqJKsMEgUGAdoK49hXBdAh0ns8BNF6LYB8C5EpB95mzHJxu5
         Zf5Q==
X-Gm-Message-State: AOJu0Yy+1iFpGTX9nozwBgq/x8zPvI0S2gLNCSi+g/5Fugk5rIazIpgb
	9UJD2Wd++4mEupUsQNcmnqdea8P8hOgEcQr/vJvIJLXdkH6EertvAMELeaiXDgKWurBNqntFl28
	/DtWQ/3QbGw==
X-Gm-Gg: AR+sD10nWxkVUiS81Mmlvl1jNHCo//gj6WvTfOsSJxbm449Vxag8j02MYgagx57Utet
	jSuOJS93GXH/EHwA0LgRW2xvyxk1sCuprTkZSIpWIo3/EdLMqw5Sl5PS2m9Rv791aNP70zGGyL4
	oDLFFwPSWIzdCXtpJQ61PoE/iwPKhW2eDNcitIsQAbQWczGja3WxCutIwc5c13CTFEW0PjEpkiK
	QVhw7eHdcweWdYHb7PNKbsnidfckjNRDIDBvf5SDgEMl+b3hQBLr/kCGvxPnrU0Yaf4+YyySXUR
	sFF739/exkV+qYCC6iD5TjCXfsS5dR56MTeXG+uNFUsWeD0DatFzSagQiTvID4V51FCkZI0IimY
	R8CbkMMI1xLrEI5TCmO7RRMFJmylxsiFDXav1coKGAYDDvC0Tl3FPwIrTrQglWxNKgQNv32ovK3
	me+pO+DeC5EaVYAc1CWhZqxSH/iSkEiFPiOLfVAuCGE31SCtJYjBpISjwqTAUTJBbR4rh6Gqux/
	9GrQmTO5BY=
X-Received: by 2002:a05:600c:840f:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4994e7111e4mr54811415e9.3.1785920657181;
        Wed, 05 Aug 2026 02:04:17 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e5192c5sm48097755e9.1.2026.08.05.02.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:04:16 -0700 (PDT)
Message-ID: <e406af59-53d4-42d3-8e3c-0de552612567@sigma-star.at>
Date: Wed, 5 Aug 2026 11:04:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider
 definition
To: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, tony@atomide.com, rogerq@kernel.org, khilman@baylibre.com,
 andreas@kemnade.info, aaro.koskinen@iki.fi
Cc: Julian.FRIEDRICH@frequentis.com, upstream+omap@sigma-star.at
References: <20260716113947.92513-1-david.oberhollenzer@sigma-star.at>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260716113947.92513-1-david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Gentle ping.

Greetings,

David

