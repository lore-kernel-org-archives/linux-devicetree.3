Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F524A3865
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550012; cv=none; b=rl81D7Fr871BgLNykpsD8rLPWJPayO7pe/7Ai3CJt3HM3AQlHjOcKAzwwOniXwPvp42Yl8tbr0LSP/DRcspJpkfU2JwgZtVh7+SmruXNcQ7vhgNRUpc83bR6PhPMDfuU8em+DcpYlwrJ4CuCDwchncAhZIlBrKIKiBEACXZ6rg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550012; c=relaxed/simple;
	bh=eS2AzTpmwl/LU2/GTCNcYSrf1v77Kr4VQXRZMQWSnOg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=aM5qjOoNzKkJ/Mcvuz2pF/ggtd38/XxlUrICtLq7kNBoU6pAzbYw/mUtI3S2QiY1pVjGPfAJ9l+2jTe3IEOLycx1tThLcNymxuRxlQ+VM/kMdDSdSZr60jzZRRfOs875qSkWWo2vm4un5XivX+TRxWW0bAcl3jQWPS7jsdvepCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=YIsPu89R; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="YIsPu89R"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so1044119a12.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1789550004; x=1790154804; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2pxFKi7xaeFBiwVmmMG7qzY7jC7mdLidUrnKaVS0TrY=;
        b=YIsPu89RabdpdyPVBlkoIYnzFFqEKRFUBTqccKyVd72RoVGsyQMB8XulVG9UxjCOs1
         OEAbnk2Y0M2X2UaSYRHkiyG2WKw/jIvdiTtP+2J7IpS3mgSM8c/jgSD2dlJUQqWSZB/0
         t7wWzeyQT0G6+8AKCKJ1/4bceo4p9JmIMQMAibaGGY7ExYGbJ6rURoBlTRXpw6BcrQ75
         SVkghCQj+7+y58N9huEth8JWO4Itpfzw72AcO6rNRDazCkwMUT1ptKPJOmaWcTFTTV0Y
         B0ey0kbwwhVAfQqqNyI9p7bVr6OptH2N6ipBXA5lBjBAxYL4MjHHLsOu+mK05CwOnKE8
         lZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550004; x=1790154804;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pxFKi7xaeFBiwVmmMG7qzY7jC7mdLidUrnKaVS0TrY=;
        b=s7w8NcVLMdQJIwwWeDP+v1wtJLvaYiXx0B8SLrqkwwdVE+GpmaQPLUyyCR/WDGzjqH
         ir2cwLLdvHI71WRlBn4qX/0jLUZnoKvHMaVSSTJfQAWHFCTrc7o+kTYyRmJfkAUTXcr9
         uLIHRD4CYADh9yrbBgaRJDLe+h1Xm1iQRwdQe103SQqgz2kcnxYUS3ETr+9zAKSQgjMR
         HQkJbdg2PIB8rWa8yxt8xv1ILOiLhveqI7HUngFjh/gzlvBKmdnJD690KqzFY/Wbv43N
         sNqpi/r59Cav1gBtQ5vjkxhlJtNtPoX1VoVLB2yUCMyJiH73m/gtrgoqLh9eReqXEciO
         bY/g==
X-Forwarded-Encrypted: i=1; AKwUvBxVEnxSWEGe2WdMm1axJnOaw01z3rHRizxGiQo2x2UTABzR2UnWP9EtlwcLwJWPFk0qPP2FeIEw34U0@vger.kernel.org
X-Gm-Message-State: AFuF++kWPNFp/kiyUHvntl+gWMFqmCwagAZ+ZnWsw0LwAEmTfnrw30EE
	ZC2xcxaHb599HeYn8ipP8tvnfH1oBOrqIEiH42JdpU8OiiRK3qnNxOANbC2HsCoLcVc=
X-Gm-Gg: AYBFou2DwYMaAztFuEkD2Eo1/2RGAl/EOQ0yLngeuepRqnwNdcYVh4KqfHK0G2+Ow0u
	hCDe+pdXjFngzv67x0Sc4JyOjFwLF3DEEgyvYJSSoVXr/VGCLpk6vzDf+SnyeFD5ErBqD2mtCYb
	L+thDOXVheEi1Gp7pPjqO3N6HDdBf0FP89t4sKV7Eiz93ZbJ7FF1ZtSAtklnz/Xs3QFxG4F30sd
	3eGr5UaPFUh7z64rP6tVIPMgFlusAflCamyTnT8D8PP6ZUZAacmh+xy+z7cV3m1DIEMX7U0iuu/
	OfpJ3qW9mmyY6SXr9IYoEcF26IjREKgAQkotuM9/L6oTuUi1EZilxHO5m1JdtNcE7+yLta2lqMD
	hPsJ4tWzyPl1kMnyme0JG+i48+T1owZ4ruIOo966+RDtzP9/io4PUwups6cY/XeEbMkmUaby4A8
	rMeNtcGoZ3B2CHXnImr/XJM7ALSYQyScEWIx+nhqbo0OydR5ooHH0dHVGnkPd8a2Rm32w+riSDH
	4rNeC0eVufdo0Xd
X-Received: by 2002:a05:6402:46c8:b0:6a7:f25d:b59e with SMTP id 4fb4d7f45d1cf-6aa2241eb47mr2356354a12.18.1789550004367;
        Wed, 16 Sep 2026 02:13:24 -0700 (PDT)
Received: from white-mocha.local ([195.169.148.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2a874esm1148454a12.29.2026.09.16.02.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
Date: Wed, 16 Sep 2026 11:13:14 +0200
Message-Id: <178954999458.14468.16283512434120694140.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549994; l=811;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=eS2AzTpmwl/LU2/GTCNcYSrf1v77Kr4VQXRZMQWSnOg=;
 b=Kigj35XJyk3oqfYrmSrVTzDtZozWXiL3A2jZ1GDFn47XUDoi1sADnSqsFWAfD5moYuTYt2g/1
 YmIW7BejVRPDZg8+rwZ2qOhCgmhCmtFAgIIt7xSS0+t7SJFtsr9bmbA
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

> Add device tree support for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> The series adds the board compatible and describes the BMC memory,
> SPI NOR flash layout, UART console, GPIO line names, graphics
> reserved memory, I2C EEPROM, and MAC0 connected to an RTL8211F
> Ethernet PHY.
> 
> MAC0 uses the EEPROM on I2C7 as the NVMEM provider for its MAC
> address and is configured to use the RTL8211F in RGMII-ID mode.
> 

Your threading seems to be broken (`In-reply-to` + `References` are set to the
previous version). Please keep that in mind for the next revision. See [0] for
more information.

[0] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#explicit-in-reply-to-headers

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
