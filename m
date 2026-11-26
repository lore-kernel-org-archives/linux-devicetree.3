Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711718;
	b=e+e1Ycbmuu1zzKY4CWf9829Ds1bh6oTmCkaHSNTCG5moIRFuN6CIRRrZkKiQBMYWtZ2v
	 ETjY195gL+QSeG4HnvJqL9kVDNzbsTYyMrzXw4vxCzskVlx3nBPoxwPm1vV8cqUo7mwR2
	 8n1+AdJNH+mNerfV8nMbLj+YK1pGL7v+dtWdKqoI+ZegtnILA44RTtYl2w4JhNWk29GC1
	 /5CY1yisyRe/oTlJBfcTR3zmvWaoTFAqD26m9tM1HyjnYWd/T9eIO1+33pRU8DyI0e0hL
	 eiEEeB2ILqpTeSQOSAetwhXt30cJnz5XrtY/GclrgNtxdFzxEk9d3DHbzz/OfMXwpjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZVsq7HzzR584tpf1ZxWh8VZbyO/31x1/Kte9UhSSi5A=;
	b=x8fxHMVWbAz1qh4Yei2nsntlSvX5SkV7vZOZb+ilefkgTVxZgJBTQ7YEPKZtFauf/G7w
	 CA58wt36oQawryQmSENv4MNCFjobS2M/t17lDctoA0WQb2VM//INDSZrs6+yP4jHlEZLz
	 VtFtKGz/4Y0NgOB4uL3GeJLKn00kFw8PkxclbFSqnUO5DX7l0KqZbNXkshvN5ZFLh+hcv
	 IMpS7WZ6xDRrlrW+YUQDqyi9vqC3S5xQBEkz4yVniySkVG1z6Ch0XYU/CHQ7kbprXKbR2
	 YzFPQchJPnQ0Ec9AZHq9y4UTTZhH3zUin52/uioFHbx8PleO0jfmifNYGIAVh0NtriA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Tpi3UyPb;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B50606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B50606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Tpi3UyPb
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa5103so4310938f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795711716; x=1796316516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVsq7HzzR584tpf1ZxWh8VZbyO/31x1/Kte9UhSSi5A=;
        b=Tpi3UyPbUEwAbxv2YI8qS6q9I4WYwk9hOYS1KUt0uqR38AocfXhUKn9bDztAP6zGVk
         DrICgIBQ4IL6V8rxgebQV2Cw/SJsAn3My66XHXVG20DjP6P0WCqcIIq/uD842BvdDNRR
         qL5HOABwJYkXJgTNOP5FMsk/AwXm/+VXrnSCu94UCMX40qDCFu/PUk71UJ2Em2nMYkTv
         vfF+czxdeaHPMBR/yEdJBwq4wseagIfJHqJqAQj4xcfl9zvrNmU6ONvX+mtwrzC2PboB
         GvtcIa/ec/OzirzDUFGcPn/ndoX/0NcnjtZe4koYr+ePazyWjlf5bUvKtkXnLs74jyIM
         iATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711716; x=1796316516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVsq7HzzR584tpf1ZxWh8VZbyO/31x1/Kte9UhSSi5A=;
        b=DaeVYU3n9Hcs2tAFHP+q1dnED0YhhBtWVEhJszmuvDjWXaNjXg9ujqmNjeLEgnk5qf
         C1l1dADVl+XvHfX+J/rDWfS0WFwLOkWaTU1gDMTFs6NnyHg+gfI7mViU9tpV/De+iRqE
         ojOHSCwaBkOs8sqcjkJFiQslK/p8jja3V1FbMbOuZfmNOxiQp4DXH29NrLGeWSeZaLqn
         TXW/A7UP1TzLdRAaq0ZjEH32XVdgAMehhuGOGGommi/aaL/VDyOwBId90wkM3HdI4WEF
         lc3xXuXD9cdRVD9AK/7lGTsMXyz6EPoLbvRkX4s/ec+1JGmWh6PK9Hx5cMAp3n4Uvkx4
         H4OA==
X-Forwarded-Encrypted: i=1; AL+hErH7FAx6g5Aor1y4DE4Ddi1nWWoRFPBA4b9T9BlqqbEYKnVzI3KEFqCBRxKiGTsklKKmMmg5DQCrOChs@vger.kernel.org
X-Gm-Message-State: APuU4Z90dUAkkDsx5JBaM2Mo2Zuo8jyqifMnmrjfJCiRN1OfGyJNxNjA
	GtijoUOdxIflb/R6REHaOX3OjwsemXCFXAQ0vjT9aC3ISrpWleEZWhuMLga7wHEifHc=
X-Gm-Gg: AZFdTZfA9v0qTslS7hGac40bhJwx1rhiwf3XKrSWWNcv1sWlZ6fnzWthIf+UXbLxtdt
	blwY8jwLFlOA0fnOuD15Pykzkpxnkaj320nMulEKxXoYmywj7E0OxC/p+6ZZoGDwRkvj1aivuhj
	3vKUxaEVD4V0CogoQZX7UH89M4mEOfIeqs8+hhFQsmOoRnbl+b8vG1wGhY3buMVt6p92f4E4cgM
	nPm6Es7N+0xcVoq/Rw12rQ4GBDuqdeJ44ZUx98HH/Csk5MaMP9F5Z+ywhqoB/XZoW3EK6WrHvY3
	y862XoN71oC1/Ks9Pl7Se/j176LXhWnSilXrwyeFbQb22VfDo8niyxtbTIpoGAV+9icyvL9OjB5
	OkPXUCdcwmevxZmXENUw4hokcYqEM0fsSDlTQa0cZUCea/F529l3JDSLE1pfLtN+YyvLh7mrsm7
	vwbcIlLs22U17AMl2Hk+YMsxGtsRB4d6o6tYC332oOrtCZ1Zg5W9LaQzuz1G0vYTw6p2xJ1QArc
	1XygoutLunq3EB9T3JYi03fiy2nrAAs4Nh1Ji/WlFrtXA8pGtlvLESupfEwBe87HmQAFtQEIY5M
	wkBYbJoMCSiXQftulxvw0ry4+26ItzDY3QWH
X-Received: by 2002:a5d:5888:0:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-4abb532ea79mr39988008f8f.29.1795711715830;
        Thu, 26 Nov 2026 08:48:35 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm42879947f8f.3.2026.11.26.08.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:48:35 -0800 (PST)
Message-ID: <9a269c63-86c1-425e-a892-b37856a26df2@tuxon.dev>
Date: Thu, 26 Nov 2026 18:48:33 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] can: rcar_canfd: Add Runtime PM support
To: Geert Uytterhoeven <geert@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
 <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <cover.1795703576.git.geert+renesas@glider.be>
 <557fa8a4776e0ee7d6c566b825771075db46b276.1795703576.git.geert+renesas@glider.be>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <557fa8a4776e0ee7d6c566b825771075db46b276.1795703576.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/26/26 16:46, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven<geert+renesas@glider.be>
> 
> On R-Car X5H, the CAN-FD module is part of a power domain.  This means
> Runtime PM must be used to make sure the domain is powered when needed.
> The CAN-FD module is part of a Clock Domain on all supported SoCs.
> Hence remove explicit management of the functional clock, as this is
> handled automatically by Runtime PM.
> 
> Signed-off-by: Geert Uytterhoeven<geert+renesas@glider.be>
> Reviewed-by: Biju Das<biju.das.jz@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
