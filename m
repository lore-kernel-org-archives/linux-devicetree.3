Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F328D224B1E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458027; cv=pass; b=NQJvNQu9hGBxancm9zxb0978P54mqPzmgKPlfgg846z6aWEdcDFxNMMXMsh+f6KFxwtqSJLe358xnWrYCTM9VpKX7Eq5AEefpp3VXKb3V1GE5GElY+iwU71gNXE6iKfAVHhrXKkYQU6ygC14JRznAWADqrre0YykBExJ56W71Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458027; c=relaxed/simple;
	bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNmBCFJiRB4iTWsNmiur7Zo90suJW5DGcQ4DoP8DuHkQXHX67ZUontLQzNmvxNLHtUtFyn3IDLmXS+EQzd3lIDd8oIhygwaLpF5aCCQ7dW/2fDfWwxMcTTWEg0bm95KIwWK1BR5lGrKp5Q+iUsqJ8/nDXiD1Aonf2IeQYSFHqAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgYfJu6v; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgYfJu6v"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15f020a223so459995866b.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786458023; cv=none;
        d=google.com; s=arc-20260327;
        b=YvzDCjqUtaGl01jAvuc9h0OMNFfzvf1FyTmSdzlEWtpNUngWDMkcwqnn6rr2mGkaOm
         2elOyST65+WcSOMxlzbEHRD/J5Mp62oqGk2ciKrrwxK9X4+drM39uJjeV72mWiCHot9h
         ZTIFkwmRCjJ+uMTaHcafttTJRDofStuMDbhCfvdn80Wb5W8s3BqiATGi7XMDh1BgbsHa
         +QmxCrEKGA3wXe2Yccnuv3o7PssQbV2aEFoJOdvhlj8l7Vqh/Ojzr2ntAewKT2DrXys/
         FIB/xJPD0iZTyHEmWWMxtBYUK2JMS9KGbrcdYTYuk/WWPOi99wUo3kL4pAgwcnpk8Zkb
         EWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=;
        fh=06B+GSJf90d54C9zG5BuLqK8Kh4JaBTggpkBj3M68kQ=;
        b=nUoPfXcUor/fIglaOzg6YHc8CzzD42LvJ3OEhpO7yK6qiDBYmfZlbSeBW3kG9EGZVO
         IPgsnvRcznseGLUKSlTSBVCREOi4Trh0Q0JzBKra1OBd1ol5C4RZHy6YcIKl8QdaFdGS
         /tSP0PR2wGMSxPABykHkx7YZHOBLYgIClzBQ49+QcmmN7ZOHblO/LiUAdc+mSA8/n4iu
         OfXysNXGVf5ifEWas31PuR2S4+LlHii4+Lg+ZMrLRDynVXzSIkUisKT3vZtWxVnTnoMF
         OU33NtIZXfnRLQKY7wLuCl0wCI9/7kUfrj8pTZK/EgmxT37Kz+EVA6b5cXlZupJ2S2PU
         X4Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458023; x=1787062823; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=;
        b=CgYfJu6vr3wzJheRrf47Ik4TL4t+1upEmp2Aw4sZE7CK4ppJdIvlS5z5E/ChMsTV+l
         ERGuXkB0QbmlZdL3Q2aPxXfnPOYee2RINRpmGaxgjYeMGdqwX540k6Bv0erzLmTDQ9q/
         xzK90FldYIWe4ycbrFdpFbhIKjnLTJKxgqdhktkaWw/khobEiL7G/7gEFRDWths7KZtc
         ehJpZb63eT5Pndj+FMN3cQSJDsf22zIXR5C2uwWGNJd1hT9z6eyG4B7pS86LXbv/y+ni
         gQCHkCBWAqCJOxHvnIqpyMefCFxj2/oTC/2XpsqRuj/AkmzHQy29WyMwYWjcC5DeasXL
         VXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458023; x=1787062823;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=;
        b=KX81vCMr+886B5YEQMF8Ujq5fCv1PCSjOVlZlXXqpm3r5XmsmqoslBDZs8pITwTbyM
         MIi64Y15NLMAscX2OduiBLlBnRFw6XkZw5vsjffyyjXooztmVq963cOPOAaJzWaDI3c7
         hnSbrI6Dk4t7xFBKKeaO08FIo8boRLMVYVcF4wCWClptrtGzM0G12c6nbyy8qYAZepY4
         +0KwR+movRxzpl/Ek7k9tkfLkk63mBknmktNjR9TW5qXEhgJjNQnPC9nxJXVosWjn3+0
         gM39jLxosMnu8ES7Wy2UmIazwm/J2W9NNGS8Qx+dyhBWBF5/ED0Tw5DIQ8JiWQ8WJ8N5
         Pinw==
X-Forwarded-Encrypted: i=1; AHgh+RrM0+YYxram1mjqx7Wlzx+b6kucTq5HqgN89762id8omELc2BmewLhYQDD08yUp+EeNrGpq3d6mpmck@vger.kernel.org
X-Gm-Message-State: AOJu0YyjH1KGCBfAknrJjQwxVJ8RfjGl0yQ+ZhP4n2Q7B1dGSfLU1Zou
	x4FhnWaAaecv7tPHtufv6iHpBIPPatdNTbQ0tB7WW5sNCZ4EQP162dm4lkMGQfdtk5q5z3zxdeV
	KTBu1EIKzPg/n+v+WP9j2sHyOSdqEQhg=
X-Gm-Gg: AR+sD11dH29C4C5kKkuzdGhvKmtGqKvFUlsbhcjNBbpX8KdWZsugXYbyTSgSIl4btKx
	XvsyfS/D0EIx81sY9Eik2+whaUZWprDXZEzhOyp4QUg+oDlF3FyRjQAcwCIEj3nV4ctoM4ET5bW
	bcaYUNjzPv3GcJhyJHoNwP5G5KZckHgxlhPeTQmp/xt98wAZ6jvnhsEmwIDZ4G6DRxsRkqwj+PT
	NMuZEIVpghe8xqzpLcxNDiwuB3lz4Snh9NtLvVui0Mq04z5/5wHpDKloorb+bFm6ZUPGCneIBon
	ZbYkMiv8S6YSioG7h0u3OqV0k4boU0WpMKZNsFfthMY=
X-Received: by 2002:a17:907:3d11:b0:c15:d4f8:dade with SMTP id
 a640c23a62f3a-c20ec8ee1e6mr50072366b.2.1786458022732; Tue, 11 Aug 2026
 07:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll>
In-Reply-To: <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 11 Aug 2026 16:20:11 +0200
X-Gm-Features: AUfX_mzTu9IARagHp5y3Lhufa5MQ0ahYW_Bpy7_ilNA0FNARMUxNWXd9eRk54e0
Message-ID: <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hello Krzystof,
thank you for your patience, I really appreciate it.
I think that a lot of my confusion comes from the fact that I'm trying
to follow the structure that is already upstream, but the whole driver
and bindings could probably be refactored in a more straightforward
way.

> So binding already has reset-cells or not?

The watchdog binding at mediatek,mtk-wdt.yaml [1] already declares the
reset-cells property (optional).
Inside this document the various SoC compatibles are divided into two
lists - one that falls back onto "mediatek,mt6589-wdt" and another one
of explicitly declared devices.

If I am not grossly mistaken, looking at the mtk_wdt.c [2] driver that
handles all these compatibles there aren't really any different
behaviors between any of those watchdogs/reset generators.
In every one of them the .data object only provides the total number
of reset bits in each SoC toprgu, plus a single "has_swsysrst_en" flag
for mt7988 only.
For mt6589 the number of resets is missing, which means its reset
controller isn't enabled (and therefore it's not enabled in any of the
"compatible" devices). We know that this SoC supports watchdog resets,
so there really is no difference between all the SoCs. Both the total
number of resets and the "has_swsysrst_en" flag could become
properties in the binding document and be added to device trees.

This change would avoid lots of redundant compatibles, but it would
break existing dtbs and I don't see a way to keep compatibility. Maybe
an entire new binding+driver and deprecating the current one...?
Still I'd feel more comfortable hearing the voice of experts before
proceeding in this direction.

> We do not take bits, but identifiers of resets.

Currently the existing mtk_wdt.c driver does not use a reset table
that binds identifiers to bits for any of the existing devices. There
are a bunch of mediatek,mt*.h files under dt-bindings/reset [3] that
point directly to reset bits instead of being indexes.
I can introduce a reset table in the driver, but it would break
existing devices as those bits are referred in device trees and they
are often non-contiguous (e.g. [4]). As before, it could be done by
creating a new driver and deprecating the current one, but maybe I
completely misunderstood your point, in which case I apologize.

Thank you for your help,

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/watchdog/mediatek%2Cmtk-wdt.yaml
[2] https://github.com/torvalds/linux/blob/master/drivers/watchdog/mtk_wdt.c
[3] https://github.com/torvalds/linux/tree/master/include/dt-bindings/reset
[4] https://github.com/torvalds/linux/blob/master/include/dt-bindings/reset/mt8195-resets.h
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
