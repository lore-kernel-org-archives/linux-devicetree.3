Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654286;
	b=Gn+5VSD/HReZv8MqJH9BXTmhpfPMiIxXAO4sdvrGyrU3n5Pm4vQhDVAaOQ+pMroS8hhn
	 GAShbc0TKV0CFKNaae6u08n0LLsi42I8Lnwv3+UBoULes8/ES3T8+G4OBmxVUcv/0i4TJ
	 Vj7jw8Ke72iq2CZ05oCWnwepD3qOZbKpykY/SmE/9JhEvCAKhyVP0ZEfknmTEyFd1e2NP
	 e5vROXrvb8Kmvs6w59Wxsp03Lggb0cVBRvD8xeDORMm/IfvBUBPITW5Oxq3ItTbYEMeSh
	 BF5bv8ar5XbRkJKjDOOtzfRqP6f5yg0x5XKVUCBEORIq5rPPiHLc3gb6zIdZE/7sLpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mnppamKzAQZC8IzU5oxBIEXI3CEcCekJ7lGtliYOKEI=;
	b=fcwtQZbQMQFY+7C95Fm9Hbc/5Y1vxnq4mx+Ncj6841lH6N4wRg4XCU62y1Hfd1eT0sS0
	 Mog8SSVoatLfMSzJ6JkgY+32n4r989bckIb93yQq6HPnG5l5hLxNYJxtKYNC10RpZYzua
	 liJhAOsEkDD22lgiuY7y7MLz0qjR3jWMIhhnG4JgkuRitbkgRX8bvdqIqyJpigmzfN0xn
	 iuqF3FxHewKkDh6iTndxz0/bu9qj5nFbrq9S6TyUUMWSo460+nJfx1pMf8xPFLRjeDz7b
	 juHn21skOrdTC5eFdvraRcnDaSkG+zguB0R/vzhn7RUPfHLf5k+BZDgus2/cR/MbBrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NeJO9v0H;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FBA606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FBA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NeJO9v0H
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so1525703eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795654285; x=1796259085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnppamKzAQZC8IzU5oxBIEXI3CEcCekJ7lGtliYOKEI=;
        b=NeJO9v0HNsJVgIq81pdvrNaVLAAWj80oLv5htqok4JvCqQ/GTit5imBRIUEGs6k1u7
         qycPZ8BtVrtUMVe0mJUlpzDRRzVeFqp98vC7+Gc3m1hm9Ob7ioriY5Opt7lLGsdBr5cJ
         GxyYqdLbt7FiEKgcM5UFLxSueuLcxsJoZ1ign9HhImAhvDP7JY1LqMzv5YkanKNw+D3I
         zSk1WO7fx6CU6PdkEBWIHL4477rUyYPUA/+vPLjW44kDeidTvP2lSNqnfq4hSFHQcnyw
         mU8wVMfZupSIlPXl6gzgFkqLrS3dk9YWbGP0BRtBVv2p4JS5Vgqv2mTxabIh8V/dNxAr
         PgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654285; x=1796259085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnppamKzAQZC8IzU5oxBIEXI3CEcCekJ7lGtliYOKEI=;
        b=Y64pUDc6EyvpQ9swUT7s99hAs9QLQ3kJuhY/K0hzTalbd3NjmFgaxdnGvNXpeewzjY
         gPaiE3TQPowrPJ8x1lUI9pCmsfHIenwpOjG59cLrGDbZjnYW6HRDE8IZYTYibO4oMcpU
         AizgZdwi3/Jt4h2jexajg3b3HdNx8SF/NkD+4EK1+GsVA/wB9tVEODZ6S0c3z63JHQia
         TONB3CvrMEVYwF0R+RfhDJC3HXX9gxTBKC7G7TVtbDUP1fsqPbTNH4tfWyIZszL5CsZU
         c+369LNal6NHGHHDD18HkIQUOM2cNl4gtSqAid5FJ83NCzo6KRxN/3hu91/Yg2+x1d+Q
         JGmA==
X-Forwarded-Encrypted: i=1; AL+hErFMF/ZWmXcEbtsxEW9CEz7+Asuq3uTYkIlrbByzNfS5oui2uUfie+sB8d5MsCHNIa0kFmHk9x5UEING@vger.kernel.org
X-Gm-Message-State: APuU4Z/7SPW5Eb2H34g7CebL0ItR4OBA+fwH8FCju5IYrGUouXeWTCL0
	aZOYZzh1ARpWgqgSb1tR2y4FttAqm5ZCqf6vcEwAzRvkk8ZrFLyuMkuiAiFrUXo9dDKitFQX3FZ
	sFZwQmglh
X-Gm-Gg: AZFdTZdzLmLu3OVZsiK8Xs3e0B4pfauWzJli6xDbV536F7sHI7z7HMKkgwsZ1XuHg8v
	ZI73qwcUluS0YiQN6OhuxRc13Esvcg3u3nT7NJjpPiU0QR8cpO3iIqMK/bQnsI2LCpBn8rLiSFG
	YQYKHw+JPeVCJJ0b4WxdaYDTICjPOr4f5C97VXe+lAcJiOGMFYifX+2cgzvHI4c48YZcl/d+fDu
	oAM6wLCGhdGg0K4/i/XbGCEfBou4D4uIqkp9p/N3eQO9RpCiAmXZN+7rBjFJOQ/s7QcZUpbaF7L
	9o4VsfhkuzXdFH8D18GIwHyMqinv2QHaqjvGRden9G+4Ly3bX9HmCuXdbTtJE+g48R8+e0Y5vj2
	Tkk+8fWroC6UrwACenB+hTb/L5hCHEottgpZJrY01vAbLJbli1wMniiCtLwSNUCcemKCI5qX8/7
	+y8f61tflyei8blCFENSv5Nji9ml5bQd+NIq+YEYAumEsVodN5M7baTkWh1+OT/dqj8bjWLe9Jq
	GDc5p8cUlJXeo/nABsFsie1OI2EUdvIy0EhvxqhbUk5hEoiMaoa1xfB24QqJnhW6uy8TaSicJTg
	h5dh0inSNTvHpuoAPHxHx5NnH6Tc0hm6U3Hw2u85crRLwivNb7ee79j5KYgh56pDWPclsotVAEv
	ek/8uT1jP9GOp0wG9Tg==
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr16578348eec.32.1795654284736;
        Wed, 25 Nov 2026 16:51:24 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm15707184eec.17.2026.11.25.16.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:51:24 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mahesh Rao <mahesh.rao@altera.com>,
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Subject: Re: [PATCH 3/3] arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano
Date: Thu, 26 Nov 2026 07:51:20 +0700
Message-ID: <20261126005120.176307-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118-de25-nano-v1-3-473d16131f7a@gmail.com>
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com> <20261118-de25-nano-v1-3-473d16131f7a@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alexandra,

Thanks for posting this. I have a DE25-Nano here and have been running
a mainline kernel on it with a board file based on Altera's.

On Wed, Nov 18, 2026 at 08:07:15PM +0100, Alexandra Østermark wrote:
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			label = "hps_led0";
> +			gpios = <&portb 17 GPIO_ACTIVE_LOW>;

My testing found GPIO_ACTIVE_LOW is wrong here. Altera's and Terasic's
device trees have the same mistake. You can test with
/sys/class/leds/hps_led0/brightness . With GPIO_ACTIVE_LOW, 0 turns the
LED on and 1 turns it off. With GPIO_ACTIVE_HIGH, 1 turns it on and 0
turns it off, as expected.

> +&gpio1 {
> +	status = "okay";
> +};

I suggest also enabling i2c1, as Altera's file does:

  &i2c1 {
  	status = "okay";
  };

Unlike the other HPS I2C controllers, which only reach pins through the
FPGA, i2c1 is on the HPS's own pins (HPS IO 36/37) and goes to the
onboard LIS2DW12 accelerometer at 0x19, so it doesn't depend on the
FPGA design. I've tested it on my board. With i2c1 the only I2C
controller enabled, it is i2c-0:

  # i2cdetect -y -r 0 0x18 0x19      (shows 19)
  # i2cget -y 0 0x19 0x0f            (WHO_AM_I, reads 0x44)


James
