Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830804;
	b=tKEctYiK0S/aPhV56VsHv0+onHpu4mouycFLCrgBW/zN6yx72fOwYEOtLYCOoR9AQVku
	 USbiAQXozSNoHcMBasY/dUwZF28A7bBfDBb/qPUFCxdE0ItFVsyap6w8SXKVWbdf8KqFs
	 032w0Ju/B6PtIN8DWv3Az/XLOHhXq32iEhhqmhwN233W+8JhJWeHr1fXhaaV2Ky9cC4bt
	 oPuaaUavgyieRgMyJe9uTTK/JGuT2NbLPHjJcMFeBQuQv7YhKGCYr1w0/2CJ4oqIzZGK2
	 ShQM+0MSFS5XmsNrdN3Z9W++O2ycWa5wyJ4dX+IWAglWCpJqIlRDgQs33AH6UGNRnkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=EuVZ/U8iXB5qoqQB2mOa7sPSxLd+TMbAJUrNPXzT9Uo=;
	b=TILLCb4TthFAyNvLA71V6oShvpdcZLnuyg4F4fEC3mr/ONBYOwfSZS8k8O6n7MmxRCBz
	 YgzIxJZSXm5qo8DY8IrdOlkZMsR/UHwiWhxSeMEVWDPx2nF3o4SxlIhFmjusEzVBkjvWF
	 Zt2kRPxKm92mrdCPOZEN5kwTAUQmz30sfveXyjyFvj3uQbf9z5o7ML4htJHgCT2QkDYPT
	 ba1MxApjhXA7fD6+5mqdUFwYH/xpsMP3fCpZUGMM9jWyxZrvFkEa9qMcYeTLMW5d1mgE8
	 x2bqZDrF27L9ZffVJoQ2k5do2Fig6fHmHR/V0H9c3+tRTLD/y2Vst8+1VD3nVMQDHrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A79606AC17
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 22:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A79606AC17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso557472a91.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830804; x=1794435604;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EuVZ/U8iXB5qoqQB2mOa7sPSxLd+TMbAJUrNPXzT9Uo=;
        b=zt9mJV7o8WzH7BGdkgtfUBoFIEPo895sap5gqajWB6JmnIbEdbSOmxnhPmduGpUkjV
         QROqUoxSDI3b5uuqMyhekfaF5ulhyE6irIcISSgALE/VnIv0x6NhCTv3R/JEAs9Yxm14
         0TVM+DzT7dESV52+9uThwaWK/O9HyOdTU/RE4rarZPZjl3uzs9rme0YZIhkHj2uE3wo1
         5ErrCcDeDT2bUK0xvfCTrNqBNcfBq/hzdcHT1XrFxpKnAVGe3L3pDLMs7+etFN+Cok2R
         oX2rn1IgG/33pOs5KxUdZ9IIEn+IEutKZTWyzT75VdR1dGFjURLGWpogprooo+dXXYyH
         Pv3A==
X-Forwarded-Encrypted: i=1; AKwUvByQgFYZXgLFm6MhAAgRVBHPvd2kqgDT9HdStV2z8pvZQsCGnKlHJdDnQi3G6d/HQUSsE1PwIdt+uJr2@vger.kernel.org
X-Gm-Message-State: APuU4Z9A7Ofc0gcZdW8QeQ/KUDcgzItrx4ZgXzV3vU6gD03tyWIdERyO
	18988SiAiwRsHuGvsWdXHU/SJwPhZlfeM9kBJrhkpW37P8lmuUs54v+sm9FRh/1P
X-Gm-Gg: AYBFou058X9PzOEIRrgsQ/AMAKvOXVG8GuDWZj1B6z8qOZeU7zpHsHse7RKIxowd974
	nY2ZAXmr/3EWDOwjbdWafgIS3m3+HEIg3142Hw0GYOe+hd5lFKdbv4Bjs3KdtxoOpnUsEb8+aja
	VsfBbP/0tckTwbdFiFGee6XIKf4l3lKNq0UchucC/PxHpw2+cv9x25htUu8iOSKNftZX/Px+ntX
	0GAVy9A1M237p9hDFjWgeIRXPpuIJ5TsRuBmOxtIHXYlgfAIWkNjIgib3mlym+42qqFO/ttcUHu
	HwS+b4Gt4XZAGNnfTymEohPft67rqzDDb9I9FvilgqAM4PKkSUmNQKiUH0SOf5k81BpWnORin+2
	/ERvMpQz3Xifud2ypRXHIHKFpfTkEf10TXgy87J7EK8YRv/byO0h1iSs7W6UMggH/9jb8TFOws3
	ogYZMyi+UT1gmPmdd0vTnjEj0m9O0g03sOpxknlQHNYTn2X5UBsgz0/V9l+Lp6u532wKiUOsiQs
	xnEJyafU9KWaAWmPYwVS1yxcNCrSGEgeKpVlkUYHM2vgAsjQ4Ag3qj0pk2ycqCc7f4gf5kUAxA9
	UOGPcDfCX/Z2Ux33ZimSjdvNTOcrU6uxqdyabB0yqSdXFbP8ZTrhvAFBZnEbxdBTQrpJt+vb2sS
	HwY7VvWjRhfQVkwTl7GTnoRhpBSb7fhFu9poXKO47RKA=
X-Received: by 2002:a17:90b:3807:b0:3ad:a232:403f with SMTP id 98e67ed59e1d1-3ae897aa79emr15294075a91.56.1793830803734;
        Wed, 04 Nov 2026 14:20:03 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31aa128sm712279a91.11.2026.11.04.14.20.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:20:02 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1842509eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:20:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByEBpfkRLky1BUOrbBVlLoSLzmNVptQs3InrVCl0mg6AkZVsS4M6nfkn0zmgXMLw3ODfeZvIsmfZTJV@vger.kernel.org
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id
 5a478bee46e88-36a4243ab94mr30254394eec.35.1793830801788; Wed, 04 Nov 2026
 14:20:01 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev> <ba345fce-e88a-4aac-b9a4-59c500f80247@lunn.ch>
In-Reply-To: <ba345fce-e88a-4aac-b9a4-59c500f80247@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 17:19:50 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ73NCpxXWWD+HTVXctWCbOutbW+FHT83fGB+ar=Hu+vsQ@mail.gmail.com>
X-Gm-Features: AclHuK9bkkUrD9f9kOIMS4d2kgzS-vT8Hn9jZFXbBFoDFm8RqLepOJdYmZqvzqI
Message-ID: <CAPY4CJ73NCpxXWWD+HTVXctWCbOutbW+FHT83fGB+ar=Hu+vsQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> What does SF19A2890_GMAC_RX_DELAY_EN do? By default rx is 0, so the
> delay is not enabled. Is that any different to actually enabling it
> with SF19A2890_GMAC_RX_DELAY set to 0?

RX_DELAY_EN switches the RX delay line in; with it clear the line is
bypassed. I checked on the board: with it clear, the link passes
traffic at every RX_DELAY value, including 40 and 80 steps, which fail
with it set; with it set, RX_DELAY applies as measured in the sweep.

With RX_DELAY at 0, enabled and bypassed both pass traffic, so any
difference between them is too small to show at 1000 Mb/s. v2 will
explain this in a comment.
