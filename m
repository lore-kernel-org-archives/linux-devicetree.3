Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790006;
	b=ljpAR2vUWsvGCQI5U+yxzSuzZPhKrdXJS0QVzdcxJ7UuFimL5D3A3PZkcM1SlVORd2au
	 5Dscx9EYNdV132grhJhVHDLvglWoNKgiF2vYqP/noD2AtH/sbOpQNg9L8iD7Q16WAsq64
	 Gl2CWSfJQc6YiB5jPkxR1etbyvrz5J1xbvbeL63W0nymgomMkGq39AhGZTURrx0RYrfm6
	 52b+/B7TtO7+Yfu2obfmVQdBg5dStLkXLA0NSn9n8F9w9ns8kky84AtMIrf/P16YTjyyq
	 TxRl4AX4XwgU6ZRXLHUOuHStOPd8VswYMsH4W6j++CxujjiDgNKOjro/VWiwMBT4+GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
	b=dJDkEv/arS+sNwRNK3B4m53BJrnxZ8nPS7XXLwAbi+Qtgjxum06Dc2b92BjzuFUcNUhk
	 waObrkY+gqGU1BZTYD6E4yh4HVdnbOe+xBYP/CX7xGfPu22ppGr0UvA1w36+21wCzpljA
	 OP9nPXZw5MxUTHkBkgdp9tJP/ujdIZ0YErMT2HgJWf09FukfbTrH+r1qYT1htkgDxZKsq
	 uFaR69H8Q5sphwWtKbI3YsNefmOguKfvqHlYdsMhhcj59xSGzLmVH/7vsy22RS51pp3ea
	 lPEtTyfEt0mEFhCSL9Rj0NO0SN5pphwtTNI8bM9iLbOSQF1Y7GoVCW6dDwJQY7lEdWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Kh4yhHoy;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC7606B401
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAFC7606B401
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Kh4yhHoy
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fd5so5854464a12.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795790004; x=1796394804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
        b=Kh4yhHoyRLyamHP4c589eGt6mFYKg+T4DCFz2chTTM2iLS+5BJgzihuYm8dycaqj+I
         D+UKNRnLeHIZdIY/Y3uM0He11I7oK8XERH+Dd51NTF/1SOfYnGyaBxSQ2sgAauQrI3JJ
         zkqBx/uP/8Y/D2R735Kbyoa2uVQRT680ZyUSO6O/OoFkfSryNOU8TtTB1iSIeSuqdGsb
         WIw2Z3oRQJS2zsXHiwiQgEC3Dh9gGMUa+P3DS0GD9kfQZu3FTWYp18ijl0xwON/f85LU
         dKCDMPu7PDFm/gm7Xlal8NbeYYPaao0MhoOWVsFcssb0EU5O4EXz46Qp6dJys14hb/mQ
         kbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790004; x=1796394804;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
        b=gQl/mB/dHH9x/dJx0P5a9F2xrK1OoLmybRjEkbgmhf/J0158GqicNVifKQodw6tPA8
         mL0SMvQMJmX7596+ZWch7GNri4FlZ2Tm1JFO63U4+mQaVRj03U3b8ONaAAq3rYzVDFVp
         s2aDH5s2Gungu11oMbH31ZfMhiO/+hH93yrsJ7BRc/c6iFj9xmMNjYXp+ZSrsTNYK4pB
         XgZFs92RTLpZ7kSNIE5w5CLBX4OFmGPdDdADKkcPVMVkK4O+5x7zPRtPbyjbNeXcf6dE
         DVQXm4PRDH7hbhxBtTZJVMXBMc4VjexbeJ3eJogYR+5gDsMUG7DiqEdnp6D9zuWSoQxA
         ifxA==
X-Forwarded-Encrypted: i=1; AL+hErFtehrSYJXB/5XEaaPTTrRXbyMSNPCvdKpXQXYL2uOUQz3K/yvxurIUaGQHnYrLFx/b1CGQ8rimBobW@vger.kernel.org
X-Gm-Message-State: APuU4Z8xGbombGyow5Mx/cLD9OlHzswlZ2bj95HQWEGrEZSKgui+5LDa
	Quaq8/3+LPqrOd40ey71OunjLX9sNgkmxCC0rcuVRvAx7/UKJ5tAUQwrUmYhRNFzOPA=
X-Gm-Gg: AZFdTZeaIFzI9oNbNY2Zs323mFXrCVVylcYJetjKoWg/buYo/QAJZYXEngL/Ka5fnbG
	sTdQA324UV/3VrVO84p7qY/wuCIO3llxs4a/Zt2zstbajH3EFMBAaO0cUIJxPT754+ydUXisuuV
	ILFmykwfx0Wtez93X3Lg8I2i42SkAMf6vqPWpSv8+Lw4IZ8WXoTKi4iVnPbB+xOmjS8C+FmhoL8
	vTMWDHq3ZaUVSflMpw782Ob9BSuWOMrCxWtpsLUUWXg8eaUj2aQQL+1i1yMU48nVfbu/VKNoGKQ
	eP5wmGZT0/dH419BW8Yziv5sKmvnnTHKClRF6nXGrRzispflb/OtV5VwidMVLmWKG5KdgCL/oQ+
	q3hKj38Yp1QMOig2RD0VoQoE8Q1XUsN+t9g+5UJ8Rx7TGLkNYHi4O3MO4IPIphqxRyl9Negc2zi
	RAbAY2B9eJ+AAUemVIBIaRbOu6nh/NyImm0PHbLofp7QsGOvhDJsJbkpZTKcKQ8z3AE7yKA/p86
	ZgE/RVzs1NFLd8cyfIvCUR/fq9W8TDFdhbZsChqIqy3wAEdKFfFhwQmmNxo+eTuKASo9yeOJkmm
	s5few13K3Ek4K9F4watUnLdbu39sFmggsH7CvNqFNAj7q575
X-Received: by 2002:aa7:c4d9:0:b0:6b5:9731:90fa with SMTP id 4fb4d7f45d1cf-6ba37cc0ad9mr13284812a12.6.1795790004077;
        Fri, 27 Nov 2026 06:33:24 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb9f8160ecsm72961a12.15.2026.11.27.06.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:33:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
References: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
Subject: Re: [PATCH v13 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Message-Id: <179578999837.3130490.1321256774164046797.b4-ty@b4>
Date: Fri, 27 Nov 2026 15:33:18 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/kkh+STkW16bo61fnrALXUXLopXwJUn8icTeFUDyuzM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcUzaJnLvllxStGv1dWD2t2zaPaXOLj2dHvMC8gu0yX
 moGSbc7SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMBGnfkaG06uzPxgxWazev9T8
 nBznBSb/J5mvX23n5H1avOdw6kn1AEaG219YnyTk+92QXLDoc8rr7wv2Lb6115HvlPH6mBXGqbP
 SmQE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-nuvoton), thanks!

[01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT legacy
        https://git.kernel.org/clk/linux/c/5cb3fcb3a35e
[02/10] clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
        https://git.kernel.org/clk/linux/c/4df94650b44a
[03/10] clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing
        https://git.kernel.org/clk/linux/c/88997515be60
[04/10] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT when possible
        https://git.kernel.org/clk/linux/c/4154c8b3d3bc
[05/10] clk: nuvoton: ma35d1: Reparent the gates correctly
        https://git.kernel.org/clk/linux/c/1c2214475dce
[06/10] clk: nuvoton: ma35d1: Use device managed helpers for fixed rate clocks
        https://git.kernel.org/clk/linux/c/c31aa10b3ca6
[07/10] clk: Create devm_clk_hw_register_fixed_rate_parent_hw()
        https://git.kernel.org/clk/linux/c/5093f6f2543f
[08/10] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
        https://git.kernel.org/clk/linux/c/107caca779a5
[09/10] clk: nuvoton: ma35d1: Fix CCAP muxes bus width
        https://git.kernel.org/clk/linux/c/6f6ef44a950a
[10/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock controller maintainer
        https://git.kernel.org/clk/linux/c/350f54ff5b92

Best regards,
--
Jerome

