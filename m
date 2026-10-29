Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284982;
	b=ie+umrorataXAsJTxli8PwV+sqo8WF3hQFP4ie8up/gNAYeuZMXnXcfopn4DfBAawpIV
	 DDIo8VnG7g2LdVxsz7E07pjANv6u6qZ00MWi/pX3Htl+IMnx4XiEX9not/YI2kyhlMoi9
	 1QQ1KtwPO9nzZqexATWyXJfzY4AFtEI46ZCKyElvICstQ4xL23e6Y3mS2TOEb5/j48w3a
	 cSC3Nvi+072CYpZvLkJJR2qAxkiyzlDEHf9C+Vs3EHe/DLeQJmO4VMEnq8Q8kaJ1CFqga
	 dFtmcGiVJhE4TPBruVswEmMXA6lHax+cmMCkI09Hoxc5WRX4uKOeUS3J36lFkcCwWfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
	b=fMhAcleFLw/7E/xu8Afz89aYPvPKzhySPewvBtgd5TpVAfHvDOAYVwjfSuLlOoEr556c
	 8LHynCF14PsUYr9GqJweXOEKmUEowKtK4rrp20FgzWKVcQ3t8tUHvkAhZHK9UQh9XMdJH
	 PU++Wh2zxg63RRIHDFM8/Hho3fgWmPVesRN7JtOyFA3mqe6HqylP5ihNstjIzKpTSZ1bb
	 j6g69XJzq0Wu+ScXPqmzEfMeB27mNY8vW3ZK60gL74L78/d4KpcNwL2THlGReTRln8k3y
	 iGIx2hAuJmOI4pWZoBgrHrwsLhDKbF9X1JKvPisnV6b/Sn6TcNygM51Qf7Lgi5T66Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0stL60wK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D709F606A321
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D709F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0stL60wK
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso371305866b.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284980; cv=none;
        d=google.com; s=arc-20260327;
        b=BEyc3gOg0A6lHWm1SlDrrAzYtpQw1+m0oZ8MNrJyD+Fdc4dmo08VuxLAVWs1vjA3dr
         2KoBBDqwmSji4gzd+MOHpvFmNh3R9m5APBOyf8zXGsX4SbN61ga9SKyqsBoXuuljcAvd
         yHttLyZb8bwZLTMXwWNCOD0RTnVCouJwkwyaIREzJgN0/AfvftB1cOmsdly8ctviRU/A
         KqXUK8pANdW8TeTNBR7SVo6LbV1PfbevYcM4JCCEWfoJNaZp6C7eXCR2jUD9WMw1Mye1
         WAH2wXfcbBLu5ZDaJ4jhcr5CG1l5/70FRdsPsxGO0ykWp54Bm5vK2zTCn5SUjwHSxecM
         yJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        fh=zx52vMyOMsDp6ZGx9X8bYL4gZDqWrsbumaoKiFZqcPM=;
        b=U0zPpvFg1s8/o4MdxbQuaUrWabxrB/eJfORXag7DLbsL80hAbLePlDGnfO6M2rBXJB
         UZCu8X23KMG5wV0Prn/MXaC+kL3Vb56dLfsAX1PTc9/1ks8WBvgVYDTPDRx6Wm+lJeD8
         +i3wp8R1wL0Oe1oMrtZUbUjsnYKWwucnJOWunvdRgz+8X9LC3TuErwFdTzjXVqkyQ72K
         JiQ4p3cgNHBX0hYveO0D05wAIQhvWaSqw2H8zhJsX3z3KyznO5ffHg4xmxec7lC72deH
         2AY8fMNaPshpHdrdJXMAUMOCpRcwfHfAtrkcE4PtLDHEOGN57kFpOdN77rSgfPO9BNg2
         zEaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284980; x=1793889780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        b=0stL60wKxdKw/s6tHgGvZR0/rzg5KWUL5YTsT+3DjIAzJ+OcSQOZaaHNrT9ZWZ/zh+
         +Xl8MeNrwF56V5jPtuB+LEMmCPk+nSFiqX8R0KfIboElVJg6LAtPXEveGIDUH1rDFZYf
         Jmjb8UCIUbLQfpI/mRHamUeswF/G5myPdqNeQWkjb3AnBw8XGqeD+C6LDc0eV6chfVgH
         O1Fikbjje6CXtZlmMNNthSiVQwxiIecjd1ZpEPoT+i63vefU1BGoUZQVkj4vteNlPh+A
         Ur/oomBPTRABHVKfjTSPzVsPnwk2Y+j1aWLVGn3iltW52D0RxfB2lNY7MgEyo+J+4ssu
         /N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284980; x=1793889780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        b=Uzp7DVLTCmADhFC3xqzi4Vm1QcOtsdV9teEOBRtMbtByX72SVqYgF/MJqlRwd7zzIi
         byc25NXxziyK+7JbtpEUE2iX3DdbJAmPsfI07Q7hIss/tEcLOOcHDvhSXIiF1+P1kLrL
         mnwRA2xzf21fnRd7VIRA33lC3+2aEC0nLlTn7/dVr5i5bmhVN2FuOPPOQdZyATbYkp7a
         jAzx3pNcGNHW0DGuDRxuLnP8iNSRNJaKrQGHp35uyRgZOtPvQzT8gck3uTevom7sQqHs
         VzyMjLiEEHeTGZC6trKIOiz6vGf7/0pvsFSWN3D64xXL/+uUVxRL6flsJc82TGSS0bfx
         5TKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbrBjURxm/TVrF+MsdyS9nRyj9WvxvhGZNi8382R/xkhww6XFjNz3tTtVXK4kdarbm6qBC/lgRYFaW@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/TBJCYlw0O2ruvQg3nQznF+z9YnJxN01MH3UdbWEXwrIvFtaD
	Yw8hatBTryiifvOR5CvxvoLr2ObBmB/T8JoacT7JhAkJYtBCoutpC17mdasAMD9enxeSphCAp8C
	V6RbD2jfHze5DZh0YZic0Dvg6PNOUvuk=
X-Gm-Gg: AYBFou0rrz1PlBRpjqprUb8Ed+CohbqPv0jyjadJY6l2tFx9g76LSRsU44YNP7mWW5F
	wgBUZpDuzPqVS4bo2qlod8Ok4jFFDoAAjU6VMMzeREKTWBRZluu4z9ENWBpDM3v3hO7NvWpmS7q
	jRgXyLN3tR+LA1HoMqTXClNyINMPMOZ3L93wb4DKqV/Rfsxr9ZfZPgbIPH1POGmwcahIlwM7/l/
	/Osc9cLwPrf6uNpZaw4AFjy8o7A43uQ4IEoPI9dMO1CqtFwy37+RV8enXpbCWuKC+lCF+Ziv5db
	Z/piSYNJUFVlvfG0QzXo46TNmxIWwZRgBkJWJrBAEqUG+ldSWHz3EJieQoIDjf+bkE2sLKcV5St
	uBE1JS0PpxKZuSqqKPqNtPc2++3ecRO8idH4PyY8GzrB95BJ8LS+nDOm6siMGFC6b4AO1lRONlU
	KHk6wSI0NpoMxkNXLMjyleEgUnvKmtBrpz2WeObWVp6CNrYUz1n5k=
X-Received: by 2002:a17:907:94c9:b0:c3e:34fa:611d with SMTP id
 a640c23a62f3a-c49be00bf6fmr469836966b.35.1793284980100; Thu, 29 Oct 2026
 07:43:00 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com> <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Oct 2026 16:46:28 +0200
X-Gm-Features: AclHuK-5fF5L0EppdkS4D8ZIoBbTyK3ZL1smqB5yKpnauEf7H2xoksPh6zRmaVc
Message-ID: <CAEnQRZBsKsDGhABri5MwiPSL1EGC=a5=GfK9H_OX1jXcYnerFw@mail.gmail.com>
Subject: Re: [PATCH 03/11] gpio: vf610: simplify with irq_set_irq_wake
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual enable/disable irq wake logic with a single call to
> irq_set_irq_wake() to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
