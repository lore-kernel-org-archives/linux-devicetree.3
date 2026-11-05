Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841099;
	b=gsL43c/CVHaCkhXL22ajEzsC9REcNzybijtRqh0VjOYqA7E3qEhmiRJh59w10ARrkCz+
	 RlmScvldWtmKQgHcMexZbdlhZpcqW0sOTjlTkNmXZlaORM5gzNt6kLjRGe4LpLo3w9as9
	 K9YN8iVdPmA7bfr95sH843sZyr0gSfDOe6+KrUE0SY2m50UeDxcsSTUyRRHlbQePVLuVM
	 DcKcy3ANZrQ870q62DlRIg3zr/L6b8RJK73qbc4ZjFQ6fgmLsipSTO+YzMFozbi6QAF80
	 XZD6TVpirJvrJsMjgkRRZPAPsBtppCLk6zjqui3A8375KePxm2pJq+ReQ6ZWk8Y6+XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841099;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=afpW4vnpyJp1rQF7sDbdJVsvWT4LIy5CP2XonGShR/Q=;
	b=hj/PxdFKPLL0z6uyQVlatKODx+4VjaViaL2tfFauNT3X31kFoweNadKFEhuviQp0DFcd
	 UcMJGdAiuwBR/OoX0vdWvc3T6bmmazQGJ/6+NWwelssTZPBy/dh1ZRCdDBvCxKBkDlbsg
	 vaJtAL5Oj+JTVlc5+GNr37pEbwP5eUkfwfeW5lfqfe5M4r3+DP0c92W0v/O3YQDeP98No
	 BtC4IK/ECJ17K0VW8/pBbfUP6+lHdBQ23id0Gz953yyfcIIc7s8js0ikagaIMO5gCf1mL
	 ihQzz6RyvRh8cirG18WUSkifVeMiCJZheOtKiHOJkVNo7+Q0P2crq7lUdmOpfU+J6xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FFA606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 01:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FFA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so591309a12.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 17:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841099; x=1794445899;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=afpW4vnpyJp1rQF7sDbdJVsvWT4LIy5CP2XonGShR/Q=;
        b=C5gRe0c+/PPYftCakHzgZ6nG+XgQYfL0Ch9zz/pFcCzVlDS+XF/8oNiX/e13T8C7ch
         OJtWOSr9ThGZ+ELx7E4NYewZxXOIUqS2h7uUOSZHucdEs3lrRNd00gc7HGlDae4czHQp
         SeDMIMWtwgM8chH8itHbqK3MgV2Rzrh9li1+zRKPzwCnslwCcSHVV+8PmpHTvCkK6f0q
         l5xq1EL4tEWPHEgR/2juQJ4csraM+LvzrOpZcw8aiAr4jVNJBo4t96ZE6C/GkCfnrQ4X
         EM4oyotOzTtxQteEGzHWCjJGY+NiySS/+qWOW8yor87gFdh5cJuSt/SiyOglj9jOor8z
         Hv9w==
X-Forwarded-Encrypted: i=1; AKwUvBx9RNuwiRTs30m+iHfpwY6QtOcmhRDsPNL3q7yeC0KM2+NUe/ZNOZ1LAhdeSiKGwzlaXdUZVzXmx0dC@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZvcrTEn6TMy4TmJXUkIqNCOL4CDQrzE01fg7sGG+kQKDROqC2
	EfQ1IAyzor977vfVWQ4QuyAqREo08MOoV3MYWn3VMGv7UnECARZp725BxGVJa5Rp
X-Gm-Gg: AYBFou1W6V9/OrhdEuzMnjyVc3cOwn6cwkz6s+Y5ydLtQe8OhZ9U3Vpka9s6fLK1c9Z
	DF0YB6rhiHSzyzgS2/tODHozofwaF3n2ZzRutPcMucS1/iFOlii7PsC4bPRfGK9Gi0F+dcQeJdy
	ez23MZDuce3esvPX0GnU/LMs44JVjBQj1ay8nUwaiEM/VIiskfD1xn6U5M33PycvpsBorq3Sb9H
	QSUe+HWJpwV+jwLaYyLVwcl8yhwKeD4AQxsJL8ausGQ6j0jlWXU0WbpXTqSObuvvZuhp+0FNV1x
	iDae0K9UN97SjpNqtMYSqOb1z0Ic+x0ZJ8rTT4tDiLwfs/PSIR8VOQqK3YxjlxVEL1pIA8GitoY
	KVXVrcmOrdz2RXAoSPlace7z2hUE7cFuvvovZmWRoZsntjyxkYLh/Tohmbg0I0OeMxuH9BS/E6G
	PjJs38P3/QTr1y3zWrXzWYabPN4NFpt0s2ixtW8EJjKEMBhWpAh8k51I+fXydVTsR4yVNq1TGn4
	TEMUF5fRUuaRvat56zeNahRfdfHT0ruHg04JxBsoeMxL8x6wROfmUuYRCGZmx9et82mB5UOhVei
	6ZafK6C0s9398mr4GQwGE/YDngP6sxz9VmlCi3eBrCuk96h+ZOKYA3XFpAi0IEigbZZ9dphNsn6
	PTLZaLua5D+kA5WSIbXz/gzVZ+1q1FUvU+ig1Ti6ZZIs=
X-Received: by 2002:a17:90b:3ec6:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3ae8982640fmr13205757a91.59.1793841098956;
        Wed, 04 Nov 2026 17:11:38 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b2b57sm1177230a91.15.2026.11.04.17.11.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:11:38 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2498354eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 17:11:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy01rQdepXHe9h2pHMrqIvtKerBsSgS1K+WRzHUxOve7ojfJitUDidybHm6gWOBtDnwwOnV0g7Iuwyk@vger.kernel.org
X-Received: by 2002:a05:7300:cc9d:b0:36d:2f0d:217d with SMTP id
 5a478bee46e88-36d2f0d26b3mr3496824eec.33.1793841096817; Wed, 04 Nov 2026
 17:11:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
 <20261104-sf19a2890-mips-v1-1-eae80820af68@telaak.dev> <20261105-stellar-viselike-e56010ed5fb6@spud>
In-Reply-To: <20261105-stellar-viselike-e56010ed5fb6@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 20:11:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Ao+YDt6aX8+h8dyCsEs8CK1nzLpquUErPwbyce3OB4A@mail.gmail.com>
X-Gm-Features: AclHuK_YtBOeVzlfxROlhjFtxAVCHbL5PR68tz94OCdt7Biz0baVYxdF4RY-7p4
Message-ID: <CAPY4CJ6Ao+YDt6aX8+h8dyCsEs8CK1nzLpquUErPwbyce3OB4A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mips: Add Siflower SF19A2890 based boards
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Burton <paulburton@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +F:   drivers/gpio/gpio-siflower.c
>
> Based on this gpio thing being here:
> pw-bot: changes-requested
> The dt part of this is fine.

Thanks. v2 will drop that line; the GPIO series will add a MAINTAINERS
entry of its own for the driver and its binding.
