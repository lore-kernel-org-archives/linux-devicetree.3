Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370086;
	b=MfMcoPkA60OY3cGAzgRCj9vOnK8Jn0O42ToTOq/xf9WP34l/ontvMmtKIE86/ieNrMXs
	 TqVwg9UonmPAPFkBL1azH8zJWyaFyammb4A2rjC3zQqpOs+SaB5xjlLeMyNJlE92n9fai
	 4MpCSoWzFcgNCLJPlr9cp94UPpQqJuhSlpu57Bs1TABJdVVm7XMLDRvZKj+qj81dhGNgH
	 /lwpETkuJE7eXeZCJn16poi4MZxPWZh2xb8ddmFXcZ1mUQSQG6qQBDAXCUhXt7OMcHY60
	 d8GXZeEjIT3JTNOezn+iDwvmbG4FEAQbQHtw9nptQwUJk2kpwl7rPV5LGD9fYzUL/bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
	b=p5B9DykxeCl1ng8+xpAvxvmbuyHtuXdbfXAKYtVrRtyrwSjc/niFnN5yrS6x+S5lids3
	 B4Cdoy6JbcD2Cb+GZF7U1Vlkvmj4of1N0tgNBBpzZWfs50fuZFixZpThy54Hfy13OLiOX
	 4CdTARMKdLa+FnLAxdQXYj1tRBgjq04LEfQIyUxlx4ttFNri6jIwS9YvdG58+rbqeIPXn
	 FpYnRqCZE+7/oEp/p5fT8p0zw1sxTDSp3imiHlfWUln3AzC/pyrcl9ADVfqzyzZrsm0Pg
	 XLXjB7alvwrNAwuCx6LojKab8uRZ7JYimuTbbf2aHqEKGfD/R7MdGxQkXYq4i8d1Q/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuoSorem;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E064A606A330
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E064A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RuoSorem
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c516a160f91so90484766b.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370084; x=1795974884; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=RuoSoremNHQJkMwt4D9dlvXzHbdF7ZHj+l3ej0fCcfOvXWfKMGiZH2eQWHfuCe5Ump
         eslZWh2GdQbIq/mp24WuRZzpysLTaawGYLAAgeCncvtc+SGJcAJptpb/7PvxC6B8wLIX
         6xofLLQFcYECW49evFPNMYl5tX3SLCqeTkGCSDQ+651Iw41VcFjhdiFGJljJlg41O3rN
         5AwO/IL3X8gclKNzNKRRi58zfyrkfLFpUMboMbnfaKGlsnm4wqtwhhxLccoPwXyML0BG
         UqJ1gKO75yBFRBy18KZEl5EvoCSUFR6OvCaK74AmRqAJnWsxKRyHz4znDnCsdbBUmlVu
         JQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370084; x=1795974884;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=jsz9MXOBdPDVtde0nmLxUeUZtuGbnrSj9T6ZcozE2PcvudtWE7QYtLPYs4BFnB1mOY
         nqRcq2D/NsRti9Gl0BG3intZUSMdLEMsjHskYaQy7IfpJUx9vQElhkPDD+2t7jVAgwOo
         GMMsnp9++W0hfh0CzB2gRecW6k0kD7UZ648cEk/sUzPjZ0yjnJjvYgJ+fUYRlbb7CeD4
         W2odIGP3iLFgK2oPjjuRIYGbDWta27qab8pGPbu6qGpF5cYbFjYk5h/7kHfRSuvaLx3Z
         GLfebyB+n8MFvf9/NtBqbSpx7QnG91UG7kEoixHIZnwuBw4i+F+GHbCZWH60gb5Qii+Q
         Ej+g==
X-Forwarded-Encrypted: i=1; AL+hErGvyRq6lvDA6Mt8ePD9dfL5rLRWr2Qt/LVewAM39kwXXojTb+K7RLOIyLEJiwZfFaSb+fRM5q3R4m5T@vger.kernel.org
X-Gm-Message-State: APuU4Z+YUGt9IFMKSNkQATtHA5K5SbF/ZUdNsvwmOd1JB8MfbrhDhD4n
	ciYt3GIQF7EDurhIjz8AgHoDjLeJ+zGA/wnLtilyaKzH+S5I9b66IrIo
X-Gm-Gg: AZFdTZcR/zJkpueJcCXpyuAZ0BZih7jMHSDc6P4LkQn2E87hPkdf2m/LCqfIiQxi+Bn
	kLjwRLjc14E12MshkphT2C/ALeKk+IwLrl6+lcMVWReau/Mdc8d4Lrw6tL6HGT+mman9GSOFmwC
	ZPpoMAQ4cDX5+rvxlPT+Zkcaur7MGZ6urXvA+lYEyqmapqkb+zIRbOZEfr43+dd8UPq2cm7AYrU
	DFffiWOaacV9Srl6h3Z7DWLaxDQxx4cE2YQ0sRtLhQZfjKiIfG5CY7cqsxr9iSEu9XWr2f4meCM
	Ip/maYDxg9DfPKXg1/AEJY+gKkBOjAk6Ctxn7HwezZAXArPO9/jfaZLZSoWEiC+/2GOy7xU1ymq
	m86y8PewPXRa9bCdpfho4xrWFexjWESWxK/rDp7ltkL9NhhHEN7xl/VEysyHS/tAuHuplQneNN2
	SxE3Gu6E9ov7a03HMkDHnqHfYP8QGPBUanxslN8N5RCh2C06kAU7vDS25OLk+tKJDYVzcx60iWt
	SAfphLLp3Ioo3/NAubSZ7XRF4Cuyhp01Lgrm46E5v7WYqPtGK9g+uReI7Z+a6+E2YN0qXlFZgMh
	e5fSi1SPQMi71KFWiz70KqaF9n61pgIHjQ5oI6mkcp0mxRds+Q==
X-Received: by 2002:a17:907:9692:b0:c31:fb29:a137 with SMTP id a640c23a62f3a-c513aac2909mr735269366b.21.1795370084301;
        Sun, 22 Nov 2026 09:54:44 -0800 (PST)
Received: from localhost ([2001:1b81:1b55:aa00:48b3:8eff:fe5b:7d15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513a8678cdsm327992466b.0.2026.11.22.09.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:54:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 18:54:42 +0100
Message-Id: <DN1XKTU0C9E7.3GV5042SF8QV1@gmail.com>
Subject: Re: [PATCH v4 3/5] Input: hynitron-cst816x: release gesture keys
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
To: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>, "Daniel Golle"
 <daniel@makrotopia.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1791233147.git.daniel@makrotopia.org>
 <5312d67200e3251b2be08aef0a726d50d94fadde.1791233147.git.daniel@makrotopia.org> <DM338G5EE7D2.2WBOX8VFA3076@gmail.com>
In-Reply-To: <DM338G5EE7D2.2WBOX8VFA3076@gmail.com>

Looks good to me.

Reviewed-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
