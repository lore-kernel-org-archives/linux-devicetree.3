Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CA538C42B
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 22:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043957; cv=none; b=XjVZtMx070Tg1COfhvfG7FCdRaD0DjnfbEqFxFV+SxgVFYoo1ITzM26Yyj+hsXHgBtenRkVJuz6T8j8/pjtm4ib7nwt2K/9uAC6GF/DBso+LKbaJMYf02uHnE/4dmdAaveuKvlbp5Fz6z2yaOOEv+oiLO47VAV9cZ91KeYkSZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043957; c=relaxed/simple;
	bh=Vm5ommHcBR+JcZfrNPxCPFfXMyyLHxyddJFMIu2u1dA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WjwF7YjDuVIg4VzqEW6gu2+ecpJm7ebnwscPnCJCkLRTpts0eyl6gO+bLn3UAJQy1dEK3q4loTceeEMufolOeK1redN0uZPtxsHa10r8bI9TOqK9ls/HIyvShI4i/RzEi0lG5VDVCJ4ssKPHB5EUeU7JyGzMDgv3P6tNYg9cJSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JbycdpTf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JbycdpTf"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso3920410a91.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781043955; x=1781648755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHAmlbVNxH0vBl7x6Q6Ymp+PlLkrCKBYT3xlbJzhsMM=;
        b=JbycdpTfgG+rAh2FkedERTMIQH8DSFvGlGOG4+gf1BcBkyvWofxyqlcIkGhXB717e1
         LkQjmkTZQvqLEOc87CZyKwmbHE++mtNnrQ4v4CaYVjLiM7u9NN50blBKW5koCOvicwhs
         wANnCBd4Ouh1rYU3iNegV5xVtnDx2kkIppvyBQ4XBAPPvAZCxb+/wFGT3jAgiKr40Jqm
         yBMlJ21UZbOgDMUt2L6/1HvN8iio5KyU4vv7dcth+Q4jnuUGizNUUBhW8Q/s46ENciel
         RwcwQS6l9/RVPZCyi+8TJYIaNPuRNEIP0lgcWewoA+EWYC0tiV+lNDixLxkArO76N06k
         ytsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043955; x=1781648755;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IHAmlbVNxH0vBl7x6Q6Ymp+PlLkrCKBYT3xlbJzhsMM=;
        b=nCgxsgVjnZ2v1OVmEAJpttMtkJAiglPbgwnT/WlgvSrxoL8Nc+LCYNpuZ29xjPoQeH
         NzMnSghQkP6sHn8IAKO75ZT3Znn1EFqca8yLy4tvCGaHkPZu9vEcZ8igWaWGt9pVDfe3
         jYoUrT5thRRFgje2vSjuE4IiiP7hfAI8VRCGQCCNNMWsEpP/JUDvlIKGm9X0ZW2VAMKD
         H3L/VUQGyVSIOpc3gfuGZozkns6XCdDXZwbdl70OoYEZBm43xnkFXMAoUyPAlN807xWU
         ShR9InQiuA/+CfkXYycPcbgbkI0UdVxVEBtBxp2x8eC4tmNmzHGwC45nbQ7iDPf7BCOa
         POpA==
X-Forwarded-Encrypted: i=1; AFNElJ9OlHdrzH8iXmUoMHq06R1KKoBj4Hsc4nt7FChMDI6RpJo8h3LFyApfMTexvY1AJEh4o25hY7WwKVfP@vger.kernel.org
X-Gm-Message-State: AOJu0YxAYpH60OXG8YN510sKLTQ8cmRs6bbIObclmCtXf+EcAh5yR+0J
	lfBwqsvs5m06debjvSn2WrbTnanOqQqcmDBZKd6B7/YA0LdUxXzGuNOB/jiU6OWZyOE=
X-Gm-Gg: Acq92OGIjsSr4gEZ4heplokuiJyCXgOXXc90BYloLsnQxeTAYsBsMhatY505vlyyJ4a
	W0iJXlOqr2/b0XB7WIFJu2eyk7puZjOrWMXtQwVpkJEe2c8J0QvmHgFh6o22AZpEYpKCXNYMuF6
	QgBMPrWY2FQvIg4tuNI0ry2+I/36W7ccbtOns0BuF/hqXtWTja/VqTuOqaOz9i+T2YCF/6oW2Vy
	NmDTuStd4kYfoTrEYX5mHyAeULq5TvFWCAXvccn1Qe4aOjoL+JDhzXd4EEqMfmn5p4ujJwB7B0x
	siUJ8eqmIOK6CPoDCZVNJBQ65Rr21qZuaqkRyIkh6aMM6wBu4uvtkaFu0/sH/krDE47Mbiz4MLz
	nGrHrUMY6QH5+gdnD75a6WkTcVYA1/VzGJkU+h3RvriFFlJNnJB5PB6I9+Klnn165vKOIuhSJz6
	/WrtBEljX07P06HqPXUii4om6zTY3JmZwIVPK8DglWVw==
X-Received: by 2002:a17:90b:3c92:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-370f0e4ab94mr23555998a91.24.1781043955504;
        Tue, 09 Jun 2026 15:25:55 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-376246afe56sm457276a91.12.2026.06.09.15.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:25:54 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Nicolai Buchwitz <nb@tipi-net.de>
In-Reply-To: <20260506-b4-var-som-om44-lan7500-v2-0-b8af59ab877c@bootlin.com>
References: <20260506-b4-var-som-om44-lan7500-v2-0-b8af59ab877c@bootlin.com>
Subject: Re: (subset) [PATCH v2 0/2] Add USB Ethernet controller (LAN7500)
 node in VAR-SOM-OM44 devicetree
Message-Id: <178104395448.234140.7031645283043967229.b4-ty@b4>
Date: Tue, 09 Jun 2026 15:25:54 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 06 May 2026 14:13:02 +0200, Thomas Richard wrote:
> In this second version I added LAN7500 and LAN7505 definitions in
> microchip,lan95xx.yaml as requested by Krzysztof. I also added Nicolai's RB
> tag in devicetree patch.

Applied, thanks!

[2/2] ARM: dts: ti: var-som-om44: Add USB Ethernet controller node
      commit: db05498e59019488b1cf908fb3dad7174cac3e4b

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

