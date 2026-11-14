Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794685701;
	b=INKB3up/ZCN6AYQ6pdkkJaUHpGC/pi8ahklCfAOU3xpOzplgWxhKNERAbTTfPZEQrEkD
	 dWFGvlIGlTF+l6PfaoNhbBdU0WQvR4zkgpgYN9fpO+OO959gZlThvGkUroCNcCZq/6zKJ
	 mKI+xPJ1LO5KaBSctTvjdPrvTwqOqwe2gwRNRMTjUxhPKF/HpKu6p28dKUXzYVrtiC2mQ
	 Mmo5tgPOMgbBefvhXQWuYjATbY71ZOf0zjac/hDJ5YSAL8CzHYE9vQ9QZIahs5eRdWdhU
	 hBanls+O/irGOMXi4EQmN2hyb3GLDSrfE1p5vJwGyBRrpwld97H0cQJc02i8gSv+S+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794685701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jbC3rUGQWeTwHayyjYJnJpd8X4fWTqcce/6NLkXV61U=;
	b=iEJ09zCS8IqETxm7x9eUOPGVeoa3/MNgBoS0Z3RZwVLYCq5a/4GZwvbtuJw7L4F+17KO
	 Gp1zre7yBujo9SYmYSY9eYTHm30oR4asHnHztomPBL+xvo4mvbpP9bPIxgKfNvAm47mFN
	 n0s5tp+HebJdJ0rWTaCOVP7rEGCpgFvRax2v7nf7CmdPlJmrPtb9usiBMFGEiFl4raGu6
	 7WdhnWHqKhEEh9mybC8voaXQw2f2DYF8ilZrdd96NbElcPWcvGhYJ67kP+/NpCdhDTNjq
	 nUZngaaKmyna58reoSZrQdpp9+X5B9raOHPWnrUhH5U+0CHdPZEyKObYnTrSA/TrdVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qm4LG9my;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A47606A32D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 19:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A47606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qm4LG9my
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so26318921fa.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685699; x=1795290499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jbC3rUGQWeTwHayyjYJnJpd8X4fWTqcce/6NLkXV61U=;
        b=qm4LG9myJ4GdeE6hPirnsY83dnXwNP/Mfy/YXKt/8CVfD/ivz7SvQoEzH3HbAkWYR0
         Y5cTfvVR7k8xE5T37tAlMk/2TFrOaTo8LbZwTQOhx3W7/2zvWIOgJMWMeg1eEy9kyFdv
         sr5i0Rj4RdMA8+w+d3SIB4WgmgUYHlCCJl+PbrhUjbXZMp6NshVuXMCnjAUuhTnEJmjZ
         DinWMJGcVzSFUoKJDANdahFPdOiLjujdo70V9B5RorIY4yotbfoF4YCp4l9AaMnW3s2X
         iZKQiREYGcdB/gdGWTtHz0XpOFmFxpt9sNr+YyTf0vL82YbZeZrF+bAbuk/ek7MYio0O
         NVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685699; x=1795290499;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbC3rUGQWeTwHayyjYJnJpd8X4fWTqcce/6NLkXV61U=;
        b=Rp6A/Am58b6tPlojxkhcINstgFjdBDmHRg9DOFMhGJjHXbE6SOIKcsjqBNyrpy7FpW
         FwhPjB9WQZYO8MFoRaWf32YNfNYC/7voqOuk26vfwLlC+CF+z6NhcAH5XWsfZQP3VDOJ
         VCXODATtoKjfppbQNrEG2fiwlKfdRpzAkRBrzjCEtrVAuzshrNys7RUReDMRLfPhL9Tc
         pe5cJXlrNEpPfrs0MLKk/bLRWrK663D0P2YHuqACqeR5sJprUKlv9cGFJrL4Oo7E2DXh
         4VJJmbAKjebhPl16Nc9z2HEwxRJZh56fk7OcbeJMiHMVPg3smtNQB6IsiGFaLBj0q56k
         2b5A==
X-Forwarded-Encrypted: i=1; AL+hErFUGWVLzHdFLUgw/ndOg2nC71x9xddlmxhHq2pb/KeX45ARbdsO+O52EKmS0KEpDL5BLOBDnatX9r6q@vger.kernel.org
X-Gm-Message-State: APuU4Z9SAkejkg9A2YFviZ7uPHZoTApzy5kkT6Wq29uw/XXOK6L+UJiG
	n+016GTMm3Md4rALLzEy78IXC+/Vq64ZvalhKbUF70LMIwIbSKc/fG4=
X-Gm-Gg: AYBFou2wAW/00IgRaASL5j7pFwf6ko/M5Hj38tAfwpMVB00lv/E3N34eHtEgOOcz0Yl
	L1TQufhx8y2mV0VQ6Nhj0ygiBU237cdFXRAVizOQy/tOZywTuVtl/tvEFxTDsLmBmplFEjUxVut
	MGHkrjGasGXru5N/rfYpWMoWagA/I3RPRTnBMjb5IKxKnIvH7v1XoDZenZQ8F0O0g28KojGCoKX
	culdEClzVPxlQ2buO5Du0pmDXGpPBe7s+PFB+2O693k84RPxz53c5Q35vf9TkH1lQ7EYwLoYcsZ
	DFVjiM4iKr66lsxIzcHKAvIBUGbte4bvRH+TWhP258a9UOtWMT5IUQWZrqffm0TOF0o+kd2gYC7
	k+PdQx9+86MxXGeUKL2UhjjdlPP5A2zSEj8qU3B5jBp0KH28+TwbrVbIUHJWw/+mMV4UGSMjRdJ
	oB5rgz+OSCE4cnkOfL8XG6KaqD9h0wtarMbimDdq6K2mAfx0obDHorkDWYY2R2VYEFSY6KKCiL/
	D3IsxM4xjit0O0x+1tsNllfI/m+dSl8RheGeg3seT6OPqbgIsiB2ycrXESP4T6pJBruMwjX+jKl
	CNFQV+CNjEDat0/TzbqUHLIaFyxFVuhIW6o=
X-Received: by 2002:a05:651c:1589:b0:3ac:f258:6199 with SMTP id 38308e7fff4ca-3ae2b676808mr18455371fa.22.1794685699382;
        Sat, 14 Nov 2026 11:48:19 -0800 (PST)
Received: from sasha-User.lan ([185.159.163.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133c9ebsm1845666e87.31.2026.11.14.11.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:48:18 -0800 (PST)
From: Asdlerto Korry <korryasdlerto@gmail.com>
To: Nizat Mikayilli <nacht@dxdmail.cc>
Cc: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] power: supply: Add Silicon Mitus SM5714 fuel gauge
Date: Sat, 14 Nov 2026 21:48:00 +0200
Message-Id: <20261114194800.503418-1-korryasdlerto@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261108-b4-sm5714-fuel-gauge-v1-0-c659b6c0884a@dxdmail.cc>
References: <20261108-b4-sm5714-fuel-gauge-v1-0-c659b6c0884a@dxdmail.cc>
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

Hi Nizat,

I tested this series on a Samsung Galaxy M52 5G (SM-M526B, sm7325),
where the SM5714 fuel gauge sits at 0x71 on a QUP I2C bus.

The driver binds and the readings match what I get with the vendor
setup: on USB it reports Charging with a positive current, unplugged
it reports Discharging (around -400 mA, 3.80 V), and upower picks up
the battery and percentage correctly.

Tested-by: Asdlerto Korry <korryasdlerto@gmail.com> # Samsung Galaxy M52 5G

A few notes, none of them blocking:

- The capacity truncates (SOC >> 8). With the raw SOC at about 44.6 %
  it reports 44, while rounding would give 45. Rounding might match
  the vendor UI better, but either is fine.

- The M52 has a battery NTC on an ADC channel. If you're interested,
  I could send a follow-up on top of your series that adds TEMP through
  io-channels, and VOLTAGE_OCV from the gauge, once this is merged.

Thanks for working on this!

Asdlerto
