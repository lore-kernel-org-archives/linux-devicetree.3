Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647416;
	b=Y/sRtHgyG3l4rZqIhzPKRmau6IKjK3YDm3UaDH+KNpNYfw+1soK8vHKU50EDV970AS1M
	 loC5FCWzQEDYXHGk7qHyAAo0jEUbZLPYopqAspwSok6YbTsVIkrW4mEm8zmBM6LtIhwQ2
	 LVxJP76Fwf62qzSbdEj+VVFudPIz/ptow6uq7fZ2psz1Dfw2qaOk8qu8uaT8qE1jE7pGj
	 74lMs8BGWPr3fGV7hVhExaMEYWuUCuaLZ23+y6aFHQNHu2InIuhiTRTNPN7zwOy81j56r
	 fLPOuidBpnsiRsCdGV/WtweINkSH4OQdXxjsoz3/cgJgVm0Q75gTiwUHJS77gUvQnmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
	b=xiwKpwr5y5u6oGH0g/ji/EhB/hgvqKe7OaS57FrRXRMUrsCn1z/2+UAmDBnT1yAjBfBj
	 +qyF/NR2GDKmp/KYkopVZEMeaEg46AqocViSONxMUkgwjhXhhNmu1fnM7zDlfPOZ9Y4Ou
	 67/05yWtLkFgdLORTYKHtc58vIYgMWanTZpLjfPpAUdWirmUidxGhTsORXPmiabkVr/xe
	 YtoqFAv3BaRJa8UuEMHujL3IhMWYW7FqTK6OmpDJwu9vOKRm3BEMNhlJg0SoMZDW360hb
	 Ao20311s+6qt9dLMO8Z09Sl6VARrMPljESBCeHVQINntmOPBIqcRQIjwb75h/FunEhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R24Rs4io;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D496E606A33F
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D496E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R24Rs4io
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so57141885e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795647414; x=1796252214; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
        b=R24Rs4iordavR6xw7FQ0o/DZGxqlMi1qPyiseaTCiFjx7grVaeSX5uEyVemQjN4std
         P3Qbx8EGfB7TEqZl5LYeeUmy2V929SvoaF4xo/+uvBBSlDWcVu+jT/Q+pridMe32kf5c
         3iIK8HUn9cq/1cMPqfqd/w9fZfkHQZYpRRLJang2Ujxh6V6RKnk8txMDjYJpobo70uDT
         2/Ia9ALqMOcv+hs6xhhqW91UbgncBeY8wxwlb+TPGWgASMR55W2Cy87d6A56nmzgMwMZ
         fSNjTzium6njFnxG5ATdvgIUt01ncWzg7+Sknc4eQvy1E5rZmoq4ucFg1964Tx+DKk5p
         0pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647414; x=1796252214;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
        b=LGIUlLV4+F56/x2FW1UrfvDuJcBmei/dirW+RqEEtcVGZywyFnOByFawNCfvlfKu5h
         5kHJOTWe8kyh7BDchcFlC4ajOoL6qp2a0WEcRbn2erfYcHCZ7QjEaSnNuhx717jUB7dp
         Um9ZqUPR88V8DAk2vRXKxsXJtktfEMbh/NH2igu3GOWVZslpauX5V3C4XOmQA+tiKg+I
         J8yNtYklIYOtOIz4t5RRh9FjpR2NJo6KBXs0XPTwEPPQiQzObjblTSsuC0Rp3Q+7dl1F
         xTnXruHU0gXVDLWB75FnbSO6LPUD31eJ8qXDbPk5mAxoc6Gx7qXUWII+3PM1vAEjA1Id
         tvag==
X-Forwarded-Encrypted: i=1; AL+hErH88mX611LTjlAdUQArHo5Wot1Ph2rXepouzE+vhf9y535+VsXdy0k9YEErLIvzVET1+b4kQ/Y4eQPf@vger.kernel.org
X-Gm-Message-State: APuU4Z9QCC2Z00b+ZnnlBIZ9wI8fbVERjCVqFHOFL3iShc9m/sr8SZb6
	htcBaQTP9nVq0V5dSATP8QDJvrg7B8bwhGjALyLL3QBxv1C6fQFBNJCs
X-Gm-Gg: AZFdTZdeUXBvgnCaCMaaYYUAew0ReHZpm71mOqdeowTb0srsqOdZW9kcLH614UXBD7S
	D9qRSKeQCglwGB9rj7/vOVQu91JICdOlKReEX8z0ti5PzsdJdugsQi5FFwQCbsxXojSfIG/Lii9
	HhQtMi04K+3n+kKzZj+ddqKy3la6O3fEIcf+Ztslgjz0ypFw0q5TewQF6aPMvsmNo+84IUP1z8v
	lNq4tj0AMFJr+mP+15yepWvsBrYWBJu7P9EDiqOfAMDIagXS0amwd0hmPhtg2YZqfYMSDOepmTB
	G3MGII7As9fefWAI7+9ZzwspFRfkSr3s3isdFRnlxf57wrOf8ksEBGY8CD4r6RUsOx/+ZSalAvb
	TZBx07+38Ot3MTiQXQChUCuQDmW0/z2dLLNpNlHtIJ8WT9QzqdWqMl2OsAq+g26V9pYHP++DYPl
	imNDNhd9dKeM6Sq6AGoZqHwHEN7/xQhJLcLAhFGrA8a/cRdOvxBv0dHA44XwCr/xmBDMQvzdQD4
	wEAhqkT6/ESvW4A3mKyKFocQjkgcPyjMuo7pPCsm8JQXn3p0AQ3z/vS9Yz8rctm3a/roCTLJrhN
	MVULRQEKieOPAj0N3awZ5TYWo8ZPxhxj4MnupZ6kPc4Rk2GXaa3QIxY=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr402625445e9.12.1795647414193;
        Wed, 25 Nov 2026 14:56:54 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm865695085e9.14.2026.11.25.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:56:53 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/7] net: cortina: CS7542 wired IPv4 hardware
 flowtable offload
In-Reply-To: <5e9d9808-3917-4706-889d-ae1c360155e3@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
 <179564372798.5.10006827612276789857@gmail.com>
 <5e9d9808-3917-4706-889d-ae1c360155e3@lunn.ch>
Date: Thu, 26 Nov 2026 01:56:38 +0300
Message-ID: <179564739825.6.2717872099061772018@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Andrew,

Understood. I will focus on getting the basic Ethernet series reviewed
and ready first, and hold further offload RFC revisions until that
foundation is settled. Further offload development will stay local in
the meantime.

Thanks,
Fil

