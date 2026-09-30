Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F2D4BC00B
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765850; cv=none; b=gl7ptVaVOuq6UxJNatFP/Tuqmxuaf5HQPReO8fEISppP6avcwrbkwG6a5q00YjYtJADpyeo21xEdHvB0ZmnI2JddS/urGmj4XSMfEcP/VOeBgZc976T1zCLlRrX2pL0MhUkSykb0LjmuuVmdkIhWiC7PbXgedP5QOTf3S5O/o2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765850; c=relaxed/simple;
	bh=3Ps7OVPCUls+dQh+qEqi79V2MQpSrrvFi3h1eo/2FTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NrXjTTheRYFGIDpwDJRhZZ8TkqYYSKcjtzOa2IYTZwBBy78R+zHixNAXHSd+rMKtEUhq34R1/wdMslN+xBxbjBt/ct794OByEb8Vaaome18S3/NHFIEYijk0aN6tE7J+J1/qm7tjCfnptptAmLZebZziGD8EguItQW/WuWg3Gr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBOFQ/vi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBOFQ/vi"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso116295f8f.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765841; x=1791370641; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLis0s98ZuwFHTL90Zcm9u7pqE377mGnvWwB/RoEQu8=;
        b=fBOFQ/viZwFRT3jU1y1jt5R5cq0pV2fPtBHSaoJX20WnIEARAEJVxp34q7Mul03YPg
         6cymSSMy7H1/UEObu41D3p1gzb5nuXvQ52EpYXBlr0uqablWLC96lUg0A3GlL6fCG3LN
         /eJCisKGiwMeOmCEe8LzTXD2R1MbmfsCJCMT1kUY4yqmRQU6bMO1VXNuReBnXlZCzEGC
         /dpgrSoYVWcm8H5ZrfJFo6sXst2fYtTRwKsvpwvpaF9D+cDH2sNGy5qS3ktDws7U079Y
         poPoEyBVw6LfY0ZLqeiXSoStDMo6uBuHDGmi0UPBfC1Sz5jXEf8GHUPFTcW6l3GC0/i/
         dyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765841; x=1791370641;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLis0s98ZuwFHTL90Zcm9u7pqE377mGnvWwB/RoEQu8=;
        b=kka44zQLAs6kvJe712am0SihEhGYWkwbcHj2CW0swFcUlVE9tOcRFfTvLNeLZx0/I7
         ao8MyCxF3exe/KxKth2iYmg4A6Tq0NTou7uHIdE4M4EpDqnJ/foE54W+N6fU95gR8KUo
         Dx5iDl27klEEnNJGKAYX06SyLBTHFeIqqwLa+LNeHZXkz8G8Tc/q3ekHoB6jlko3T8xK
         hJmi+Z2tjcgp6oDJtsMnvCzcY3TvZmldkUgYIH+d8w3UyA5AnRt81Z8YxH2kV3zn2VbG
         K77W6daekaLHQUXU4JuHBFLFpBXdLBUViu2mRWCummPoKlZv4i+bfh4O/iDhL1o5jzbU
         MepA==
X-Forwarded-Encrypted: i=1; AKwUvBx8M/G1Lmt7rh/0oBgYc6PbowLwOnY43rc3Cu+zXX0gZFs62Cc5FHnuLAzYnTKAP83njwNAUn/LNUnw@vger.kernel.org
X-Gm-Message-State: AFq9FYL+/9oHLW6wdt8vF0870ROsE51KkiaCMYSm2kah8lXM560g2oKL
	isSXA7vEJg1SCDqt8weskysRGn5xnKihCzJnnenJsUqdlX5PPgJobHrjQH4LTdspgCP+++HF
X-Gm-Gg: AYBFou03j6f25+T6M3Bk7q7qHVqcz29OCQbthTUcXswwGX5bOWaVfpyw+MgWlr8f9Jz
	gKLyybB3v7TPyFn+1GbPvxUbdtC/Z5cL6DARuAvRXEZM8pSmU9mm1hotrBzp1YgBGVLluYHokL6
	i7/n02VscZHHtcZZ4a3jle4bHbhq6ACP1R9OYxnGYS5YLIuaWvzbxEWoEJtDCV6jYNCsHhqL10h
	efFqL+VEMwRpeyrVrdsO+Zw8gTgwHqQSK8zsdgwnVS0Ykj60tDzyN/zf6mIb8cbpLLSjUViYaC0
	cjlqmMbmzWSptMEGh5rJJ+0saeNC1cG4ksQsE1QPxXKu1p7qzJRcSPl9Yxhzw4ICSF5bfiCDJVy
	CUwJHbrciqDRH1mDG/lFrbB+u+kTSVzTDc+/arI7j0kqq89G5FSk47MsLdOYpVUzQfMRIgkoORt
	q2S1SAj03Lv8J0tQfwe+fJrbPv7/LHH6AnsxT1KcHl0U9oAg7UEQVQVRetPB3zFAmoj7/1blVaY
	dV3+wz477lq9irCGmEhlm/G4A7xRtUEks3q13z+7fQ=
X-Received: by 2002:a05:6000:41cb:b0:488:8aa5:b4a1 with SMTP id ffacd0b85a97d-48b024b4a4emr2192936f8f.14.1790765840706;
        Wed, 30 Sep 2026 03:57:20 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949f3asm2695384f8f.1.2026.09.30.03.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:57:20 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject:
 Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
In-Reply-To: <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
Date: Wed, 30 Sep 2026 13:57:17 +0300
Message-ID: <179076583795.3054628.14443934429806440798@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On 30/09/2026 12:20, Krzysztof Kozlowski wrote:
> How is it different from Cortina Gemini?

Apart from the vendor, they have little in common. Gemini (SL3516/
CS3516) is a single ARMv4 FA526 with Faraday peripherals (FTINTC010,
FTTMR010, FTGPIO010, a 16550 UART) and builds for ARCH_MULTI_V4. The
CS75xx ("Goldengate G2") is an ARMv7 dual Cortex-A9 MPCore with GIC,
SCU, TWD/global timer and a PL310, and its UART, GPIO, interrupt
controller and NAND controller are different blocks from the Gemini
ones. So it cannot share mach-gemini or its drivers.

>> +machine-$(CONFIG_ARCH_CORTINA_CS75XX)	+= cortina
>
> Arch should be rather per entire family, not one SoC.

CS75xx is meant as the family (the vendor kernel covers the CS7522 and
CS7542 with one ARCH_GOLDENGATE), but I see the name reads like a
single part. Following Linus' suggestion of mach-goldengate, v2 will
use ARCH_GOLDENGATE and arch/arm/mach-goldengate for the whole family.

Thanks,
Fil

