Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910976;
	b=Za5/zj+QzozRJZAR8zQDjuLNIbOCYlnXMjA+cyuY2qe76tPPFlHAlqcI79gwqKY5s9PZ
	 qoqVoYCZrDRGRCos/xV4+Ifvjg2XUm1EdXQXSsJchp6060ZcZd7S7oEL1rTjjklCzIAGn
	 aiznkUAQxv0Hrag3+uwJID8aRYgOXzQ3AU6fqy/7/ZmTzCAlzh1aQpUc2i4CMC0mFQrTN
	 6LGgQyoSfIcpYeaVyo56TupIYIsKp9g5wPYrwrwYV2Yb8i29AFfFbsujD3ifmSeDMCiV/
	 O6GeY136N9rvc1MAMCP1+gvGJ9sRj2hQNiYYP20safaszVh3LpqfnMG3+H8NiaZjaSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910976;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=QQl1ERSY4wmOR1OEbq5mx2PtZRC9i6q9Gw0tuk7z0Is=;
	b=liGjBJPHFC8hLvOcqv3ZTd8KiQSQ5434B2LUETRkvFXDXxd8ucdrWV605AwXvmoluL3J
	 CKqknbOQLJZH//BzmNAwPapigwg5zFvliDrq8esExkReOx245deD7gP2T/CZSr6/kAUzA
	 ohOgQgv/LHQ4M8A46aVimDbhap9Go3fvWaunLTGPrkz9bfOZBG0HpSC6c7/f/8Q5PZiZW
	 WKcmhNl/MGjgPOjep4MSbNsQzLkErzb+KtD/wpKSkL69WXSJeWn5lzgBJ5huIslFMq4Xr
	 sxGDBJ7BQaoaS+tGn7Gxbad/gVdz4INXpH8Wm3e6/GiCFZGrTbZcwj8DBbPEXii8HFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA36F606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA36F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1383839a91.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910975; x=1794515775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQl1ERSY4wmOR1OEbq5mx2PtZRC9i6q9Gw0tuk7z0Is=;
        b=cTi9SkeUqRVjvcXtajzNsmP27WS0pNrTa3PHTthX4fy6lXBGnJJ/yQfieqmxa1Raxs
         vlno5KcvWSX8Q44r6aFimkEcOqaZcTrnVZeDCrG9I03gjcUYthtLSqN1YScFG/Krxwat
         iEQMvmzmbds84evhXypAuToIdReOMaCzwL01f9ubVN0MrsOfB+YTq/3bFfe9GFOE6QN9
         E0xSgvieaSaLyIyryAru61xWKXp4B88pm4wTau6s7XF/P3rtcr4kUMVIJOjaLS4mSfRb
         rcV9cwWUw7715oRRMBUF3l2l67tpOTWbv9Q6eqNmwO/Xdi11bZD/lqbTuHFmYB5fs6AY
         l6XA==
X-Forwarded-Encrypted: i=1; AKwUvByPvfwr1vJEEGPqn7xMYDHJ8rvWXV70k7K91U6mQxTKJ3V1yQDNkw5yvy198AxY52FCGim08l47NSsM@vger.kernel.org
X-Gm-Message-State: APuU4Z/AiX/X033c1xElHFuobZ/1HMwrCjy5olmlQH2vJ54fADWs4H5b
	1vCtjQ4QuHwPkwPja1gN+33vZgL/3vw5Aa5dhedA5Nl+qJ6o5ECp2sTYSEAvtYje
X-Gm-Gg: AYBFou2r0BTSRuW7Jyjv8Zh7nLIBm8G1xeg29lXttTmKlM2DL8r041uBjp2NqH39vio
	TOPrbvPf4aIee7SSIRCOPn6Zjr+Y8F5l2BwiA0dc40Ubi744Cd/1yL6uo+4TuX6GeMShb2RX6cx
	h2EDdoGEOaPq3620tTgavzenQMm0easdTueE9yg5apKWnfWY+aZJ7WZ00AXnJAn7ekUN0eeHL49
	X7kG+1Ui6MTtzZ80AxWmI5GzI0mi6X/Y34aYasc+f8beKxkM4ZHeHk+UwqskL1w1YYdl+94GizH
	uIW9lfnBKnePYQyET7a7h+MYgORWXJBxDA6QT4efn6WNDxxeag7xtjiDhr2cQIESNgLkFQZyy7z
	QY1/nwkBZsEZWybfu0/AX2IoaACdVC8f4Eyevrl4xvn4zF57pPZcBVxn6pr5Zp9lU5vT4+jqE3q
	tfgMcwE49rHsrUjxdXkpVfWPLMSGDDW4pgeLkj/90eU8GqZbnV9wbmo0t+yJweobtCcir7xFq6H
	ozAPycq8OkaS2Jk4svzrN/FtvK+Lt/BzO9YsClMMsL52uoWl0X8zx/pA6UpocHjPObyHeIWpJci
	tl1EZ/lu4Dhl4dlAADV1LrWb15h39Tw1bKWskqhjxukaxrQ5VMsmRo0fgtVfa42yzht6VKiukfY
	Zx+A2Uq1mtQHgsFKeKZT/HM+5YOFX2OJ273fT8LV6Pp4=
X-Received: by 2002:a17:90b:39ab:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b0db6210b3mr166812a91.7.1793910975210;
        Thu, 05 Nov 2026 12:36:15 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a7dsm603528a91.5.2026.11.05.12.36.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:36:14 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so4479832eec.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:36:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwoJtlUDb5hqSNV4CNU4oe5KgDsVhyi5Wx5aAIv4hNbDxX4+qxbWD/19X81hMBjAqW+ceRR4yUZRxaC@vger.kernel.org
X-Received: by 2002:a05:693c:8008:b0:369:d486:457f with SMTP id
 5a478bee46e88-36f73e72d61mr409769eec.2.1793910973768; Thu, 05 Nov 2026
 12:36:13 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
In-Reply-To: <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 15:36:01 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4ExRTFJ+1q7GDw8ow=_ekk8urUqfC7ZtcYckwf1uO+vw@mail.gmail.com>
X-Gm-Features: AclHuK_D3HUaJCQYumF5y8SooLOqbAC7H10kZ7apqTopxHnLZbvIW5XAq_-o6t4
Message-ID: <CAPY4CJ4ExRTFJ+1q7GDw8ow=_ekk8urUqfC7ZtcYckwf1uO+vw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Completely pointless indirection, drop these functions, just use
> readl/writel directly in the code.

Thanks, v2 will drop them and use readl() and writel() directly.
