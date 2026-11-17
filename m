Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934743;
	b=1MEG99iba/XPoaUT8YUviC7g0uzQosVu60Bto1FCyI1MWhXlN7B4k+Znpn/nKj55VYkJ
	 TMZbmhVHI5w8wNRccJhE2p5+6MSFbx8ZZsk9F5jGI+jJu3XfdAJd0AmZ2EzCsSbY/sSbj
	 SGJeZl5b8TiGwEmhVWH9PPwKdlOpY6CL9R8QMjFL2EIi15QsjrYHk6hmDtpDnEcRNZO+g
	 KZybT4XMUTRxh2wQT5qOPLCUfpBKI/zry+z51Ibv0S4BJOaa+A5fpk5T+WjJsp91oHk5W
	 NFj3Fibqvbq5IiFktRPEc62X/ZEu14ooDhB899yoYJ48iW5PDEHb+7ia9q+cRnI8nOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934743;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=/sExmZ117jhWvHZ7v1Er7gDQc9fAtZqbDp3VfinKnpY=;
	b=NZXmTYEbzHngxpF27v0hKl3MKJRh9DOd0mqfJ7+L5tknmclo/G0KfCLetNDfGOkRZq22
	 BwErVLCdJwxVzq770C9N/9HfEYmGMSx3A9F5wSizYsD0ekaoVEw4NLeYFCqqa4qWe9NzS
	 zTztTp624saZMTMX+KFCpvwy0qUBQdP2AFWNhE/L4sGvJCLVR75W12KlBuStfE0Y6ohSF
	 djrWh11F2nj9vmEGPXJN6iGB2c82QT7dqeeasQYp+XhJSf68nDf8Wi/BhnLVy4wd3G9ER
	 XKh6KOu0vm7tzeNrvkFHX8H6wA/5ueJopAK3CJPU65DvV0Ka/jPLig4WtwM3GjPTBQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FboX1a6j;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CF1606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3CF1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FboX1a6j
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9AE21C4EDBD;
	Tue, 17 Nov 2026 16:59:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 165B55FDAD;
	Tue, 17 Nov 2026 16:59:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CE8411BC0067;
	Tue, 17 Nov 2026 17:58:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794934735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/sExmZ117jhWvHZ7v1Er7gDQc9fAtZqbDp3VfinKnpY=;
	b=FboX1a6jpgdrVKL/ht3sgG7t6f0D8SfPrcwbol6vq5wDpxPQY7SoQdJDc3YVK2fNTVju/G
	VCMTCUrTZfxjETxJRDUXpar/89Z8mFGrpJi5ht9qzSD5TUPQgoEORfBXq0UCJINqZYtda+
	Qm/AUiI60CfwXcDYhNzeWUSFjfYWcOZ5TmAfd+2+1/GquSDcIuEp/Te1WPwZnwlKT6dNoh
	6D5P8DyLWLhzN4vM1BzzVLQpmwQCcrKLQ5m+IkUeZQpCt3/oRNYJG2sUhGEWZkPSJoUayx
	nOin4yeYWx6FgE4wEe6ghfBlRh8DAnmJklmdQHaMPjDOOZLsIIJIpYXmzi95WQ==
Message-ID: <3bb32808-2c16-4bee-a593-4e7d10dd34b4@bootlin.com>
Date: Tue, 17 Nov 2026 17:58:49 +0100
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
Subject: Re: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <20261113121852.334604-1-tanure@linux.com>
 <20261113121852.334604-5-tanure@linux.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261113121852.334604-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/13/26 13:18, Lucas Tanure wrote:
> The delay code reads phy-mode as the list of delays this glue has to
> add, falls back to a 2ns transmit delay when no property asks for one,
> and takes the vendor delay properties. ethernet-controller.yaml says
> the opposite: the PHY adds the 2ns delays, and the MAC properties only
> hold small fine tuning added on top. Every board in the tree depends on
> the old reading, so it stays as it is.
> 
> No T7 board uses this glue yet, so the T7 gets a path of its own that
> follows the generic rules: the receive delay line is fine tuning in
> 200ps steps, and the transmit side, a quarter-period phase step, offers
> none, so the transmit property is refused.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

