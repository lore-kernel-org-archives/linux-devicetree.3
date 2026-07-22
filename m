Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF73470EAB
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784747372; cv=none; b=bqlUYLoz9zGEZ3s9vfMJM2iejxmXJe9wYh6FGpeug4LJ0hENTsUTSPuuUj5PhnUpR9VSScZolXdnh8M0gmx4RmflCMtd4YBVpf37NoHoY+A5W316HeOLKmApTrAlIKc7wAaOxgM1vX5i16QK8hUdl9SvyT+sr/e/wHVtMdu6fxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784747372; c=relaxed/simple;
	bh=p4raCd1confxRNlp3M3uyqGsNSt1XxUovtON5e9BL0M=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version; b=LbOnMFT3Yk8Sz3vXH9BFXmrbY33XBozDTAv3MTIe9x+ylkAiZI/bdPEdxkIs8iXUKb1+by9tAUXtlPADTiQ4fUyz/Lrt+63Xo7digaKXZWFv0JXorcckoHCz5E3ZJ1H3fOgfh/OyeOoGpolCO38dUfqaV9wVVXrVBGn2K2NSRUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=REa0wJWE; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="REa0wJWE"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso5546040a91.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784747370; x=1785352170; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:content-transfer-encoding
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=anF0nP/HcLCiIU6NqI+XBEAlEYdw+ekpN6PK94U5YWE=;
        b=REa0wJWE0ga3apZdPb1ZPkrN4qCEnEPocy/S+ZN1zgcF0IHhDTfGJ9XOFHaPl4TQQP
         huqfHdPtFHwqhYirTfuJMSk+Mt9A0QX6trckBPUxIpB/Szc1kgyrYobe+oYldCMrXa6A
         0pPnqQnVQcsVHzFUBWLOoCsxSayrh6fiG8XSBg8/iFDbGruozPv7RRoRB1wI9RZg/iEj
         6K3Uz7lijAnGDzZ5vobWrP/6W+A07vacv0xBljC5cMtChONJ/3enEKIHkHz6sRBYey/3
         Y/ewgEqHrtd24Xab+nOzf38WWMBGSc/Ctay06ZV8YFdjBDqGIaIX4Qf8os3LD8dSS+4G
         F+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784747370; x=1785352170;
        h=mime-version:references:in-reply-to:content-transfer-encoding
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anF0nP/HcLCiIU6NqI+XBEAlEYdw+ekpN6PK94U5YWE=;
        b=SuaG3XkW1gu0gW+bMEcGBv5xtJfYGgTRd7TatyAUi8tCL9+D4MeEK02SRz/lVJSDrJ
         /MVOiSrXwZYO3PD+G8PCBuiVIe4+sFtPwlRzbJb2pzPcctAMHbjUY4E2vjdzve8aj8cs
         rP5pS+5pmV4LJ6RB1ZMkyMa1fDeiNyHpt24FarxPOk83mQ6bq7KKamFSkJh9ru80j0aK
         6L+b0cDSUuJUIGTNFiNVFhaDm9oh1IVEZpbUjbw5BFF5EmTyuI5qtXa4kJjwv8HZDsZ6
         En6D4IjbBIlSICJwgylaZxkcPQ9WVXDp0SkUUTzaUue0CekTE0i4fwqGSZED4TD+U7LL
         aYdw==
X-Forwarded-Encrypted: i=1; AHgh+RrAehdCHYHYcN01bFjj6HsP6c5CeGUMnGS26TAsmPtjGtfJmnAjUM2CWskFLwLiszUn2V4tlllzIfD6@vger.kernel.org
X-Gm-Message-State: AOJu0YyBKa/0mItWSrjZ9yrKeh3ZOP+4dTIUFICrdkbZvGJEdbHC6CNy
	h+Av8R6kIZhZP0YV3/VzU3elQ93z86iTx5tc0sbh6InmYARlJQlvlzPZ+NSZrzIPBxM=
X-Gm-Gg: AR+sD11ZjBJFnzemV/lSRmuwkGuS/kmOGY3odlDMN3F3HHpMLmHOwnVjGDor4vINWAh
	YcwSa+bWkxGJnqjd0KkWeKB+aGluQQt5BTf/3/XO9dDpcAAJkdciBnkDB83Wx+rbC1D+NLkCupU
	kuGGyz6IasM0YfoXkPvId0oe5Uvca6YzZ7xqHq5VHH884psDCbEvoSZY1aArK8d8XOQQzdImGRv
	NkQc9n+hlUjAKxdyQdxgr8Ojgntjpz/PRGgUbSMChJ5OhuctykAhDs6eE25FWeH1GCB3/qa79Qq
	vxmUT1aEpZw4OHKsAEUAW2UAXkQTQN/xqJpk4VAIIXJHWQe68wDkpAeUfFrHTWRuhU71cY/Y1cj
	GCHZ7wHWtdXZT7tFErRYtJSe/yCnUWjNvlRniA3sZalkDOw5elmExS/hmEyRbSwlsHSJqHci2Sa
	wDgg==
X-Received: by 2002:a17:90b:1fd0:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-38ea3942072mr5969464a91.21.1784747370543;
        Wed, 22 Jul 2026 12:09:30 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a87e9sm8040518c88.11.2026.07.22.12.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 12:09:29 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 12:09:29 -0700
Message-Id: <DK5C52KFMI5B.18JB928Y6Y5UH@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: <robh@kernel.org>, <saravanak@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/6] of: resolve alias-prefixed paths under
 devtree_lock
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260722-noisy-husky-of-security-6dd93c@quoll>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai> <20260721-nh-of-alias-overlay-v4-1-8ad097e31e36@nexthop.ai> <20260722-noisy-husky-of-security-6dd93c@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed Jul 22, 2026 at 12:30 AM PDT, Krzysztof Kozlowski wrote:
> > While here, validate the value's shape before handing it to
> > of_find_node_by_path(): /aliases contents can now come from overlays
>
> Can it?

Not at this point in the series -- patches 2-5 are what make /aliases
writable at runtime. The message got ahead of the series; I'll reword
it to stand alone.

> All this looks like AI written.

The tooling is disclosed in the Assisted-by trailer. I'll cut the
prose down in the reroll.

> > +		raw_spin_lock_irqsave(&devtree_lock, flags);
>
> Since when do we lock looping over for_each_property_of_node()?
>
> Do I understand correctly your proposal: you want to add
> raw_spin_lock_irqsave() over every piece of code having for_each_XXX
> OF-loop?

No. You're right that the walk doesn't need the lock: removed
properties move to the node's deadprops list and keep their ->next, so
a walker holding a node reference never steps into freed memory.
That's why every other for_each_XXX user is fine lock-free, and I
shouldn't have pulled the loop under the lock.

What does need pairing is the of_aliases pointer load. Patch 2 adds a
reconfig notifier that clears of_aliases and drops the reference it
holds when the node is detached -- overlays can create and destroy
/aliases from that point on. A reader that loads the bare pointer
without taking its own reference under the same lock can have the
node (and its deadprops) freed under it mid-walk.

I'll reroll with the lock narrowed to the pointer load plus
of_node_get(), and the property walk lock-free as everywhere else.

Thanks,
Abdurrahman
