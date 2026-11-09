Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268108;
	b=ctPuo4pKSs8T6kJi04Cum3N3eb46er3loxyWTUPkAoEfM78zoF+EBHvt0H/z7WV3vy/E
	 Qdjm4G0ekwlyYsak/95oKrMdwsjjjuL8c+lnSFesjxpUNkm49kDas4Ci5lYAblWpU5auy
	 u/8Q7SptYk6hUB7mqVt1mq8GyDUuAnG9JShVEDxqvM8oKApNR6g5bxUBVmqmTqXqXnmSX
	 Bybto1jLoSgBKAIaOox97AarBPiNp6NDI3LCCKzi/ipXAmZMpPXHQinz57rcPBEi3ebxT
	 /6dKcaN9SC5iHgBFBAYdw9yG3ZRAzzPdzsfawwHX5xR/8sR/7HMQJsd9GshapE5Iv2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=6QvI65ANWFLjHGTYP+BpY9IO0Q+Q4tp1M4hrdUa1hfU=;
	b=uSB2+Zm6JHwuqLuNF9J6wJhPlVxRAvFWNfTkMLB5Uy1siVzQdTPkox0C9j3EtQa6WGQi
	 Q2NMi/Q63S1V98iuYPdx2I7E4FSSn4JuOzcSRZ+ofZMNQC0idezp77JeB4f58dyQRKuOC
	 Mvk1W91IOWV5THnkFRfFsrqOHuqEkC2NSrMEVpM3/WlHaXCbq6pPSYYZmBtIl+pm/Nngs
	 Z0jcSKp9IVn5Y33dPA0/Bg+uldQYumIc3gCXfw7TMyWU4nqdvj1msXVKtDNoGha++KAaC
	 ORWt2PJfNfCtjmm8u77bBABkfZ74CPCKJcr29/aH8Jjps2WSIPVu4IrKQZzbQlL3pqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IaJnxcRe;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FBE606A33C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 23:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75FBE606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IaJnxcRe
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso600196a12.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268108; x=1794872908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QvI65ANWFLjHGTYP+BpY9IO0Q+Q4tp1M4hrdUa1hfU=;
        b=IaJnxcReFcjgbLmRyjeMXGhrxzGN74eb4PUsd7TeEF4qhGuPX54MQ1RvR3Y2zlSAcR
         Bqs3BrDRIVjRzaL7NOmAoXjdP+97pne+H6IRbI8gRC1uXqOynbhDXoZoDYRcorIcMklz
         07VcOB6zx7//NaAfc0sCO8UE53sSnRa/AJjxLQhEE6sTwMW2PZzJ6YsOVB2NuybiA6i1
         BPUdWXlnFMNFL3sDgXArYIDsPMBu5YK2QmPKRKnkGR1YN3YjmSlF7PoQSzZK7bNj6Vd1
         XDPczPdNIBJ2vjhNM7o5eI/8zwNvid8O8caSdNg8BLRvW0I81Od0l0iCYPd4Zzxbx5+6
         5uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268108; x=1794872908;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QvI65ANWFLjHGTYP+BpY9IO0Q+Q4tp1M4hrdUa1hfU=;
        b=Ykv1ARHnH9FCp0VQaQVrXcPzazqgN3+sl4lr5h20Vhc8frjqF3qF6prSPKdzoWIqy5
         kvklGboZjzy8iWmVSRayu8cORHhchi84ChFNLmFcj6L2W+Ee2hlDemLFCRCqv9c9Iu64
         kemJH47npyNYtcHm0avuqQh8DNWJ050gY+571wPHZDx7BDVkJ/V1hLxQKp3qjb6KJN5n
         EpQAaMnHZm+2qQvyYw/Nt59OWMAekwJgpSiOYkR7XAQ36ovDCC1zIUvnoO/B8dcmjisz
         gHftylA2q//VPSpO2wYzoFvSam0FT9z6HOZ1wf8Z/dHjcEJF18xxoJD3otXM+JHkgRjm
         S4lA==
X-Forwarded-Encrypted: i=1; AL+hErGbJs38hW4lKAj4LbGUCgreAqLUcPWxOA5V6G2oaZd3C7lglwhopZ2BNXU7EF/G4KETFzfifCeYtEjb@vger.kernel.org
X-Gm-Message-State: APuU4Z/JWE+r/FuzRCskJ+uzcEG7zdyGSmmwfKqKampjsy8aMRaUgRBz
	z/bR2hCwt9IknwjxwhGrR8tx5Xisey6l7nhhgDu/vmwjcMr+lxtC0cSEGohmTpY5c6w=
X-Gm-Gg: AYBFou08vqGwGSn/t/AxwchM53AhIIfWwogcty48g0pIimhKnMUGvC+PwWPZ8pjwKEr
	pR7LQCufWwap1VbTgq+IxlfQ9+t5BGTIi64W+UTexJ5Bfjztu2liYrIO2J3e+rajuSSvC2D1m+7
	wxfwqGJ64p3iod+VfGPkL8FNjsmm+YVOjtEhzPxpX/OkoOOnfIFqZNXML/S9Of4b1KV2TqgF0rz
	nCRR3MHKiTnFjc3MHrMLtGVRuGYha4Kcy+5c3S9abdBxJuZJmoKXk/sFh9eDCRHaURnHSRWYeGN
	MH2lDjrL/TAjME1kTegEYA0Pz67rqs4C03RscsNlQk3e/eX0TEHGKbaqxt8SFUdhBwY33ingeDV
	FJjdQ6J8aAz2ajesLq6Z9RiOCVrh//Gt8l7MzFg69KUNbsJ6E1uCzFirACpd5qzswFKo8Ganqnk
	InqjSgwYB2mk8Mo7hfDwU0h32FxhWfhJOy5e1x5ZmA0Y4qciIqekPRxwfWPbgpnrLBl2lERYWxa
	NPPhexGxQ9NJn5WfkYcGViBexa6W68Ch2MueWeolPg4RvCiEaztTEK0rhXDYkd2ivUI2jTqIwaO
	3muxMnet1CQrhp5H7+JZZJxa
X-Received: by 2002:a17:90b:1fc8:b0:3ac:9a5e:9ce9 with SMTP id 98e67ed59e1d1-3b166ca430cmr1173151a91.29.1794268107865;
        Mon, 09 Nov 2026 15:48:27 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b1676e2974sm1411179a91.9.2026.11.09.15.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:27 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mithil Bavishi <bavishimithil@gmail.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20261106073219.59785-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106073219.59785-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: ti: omap: espresso-common: Fix magnetometer
 interrupts
Message-Id: <179426810659.2265990.750430446710445234.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:26 -0800
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
X-Mailer: b4 0.16.0


On Fri, 06 Nov 2026 08:32:20 +0100, Krzysztof Kozlowski wrote:
> Interrupts property takes a number, not a phandle.  Passing the gpio
> controller phandle made most likely the interrupt as broken, which could
> affect magnetometer driver operation.

Applied, thanks!

[1/1] ARM: dts: ti: omap: espresso-common: Fix magnetometer interrupts
      commit: b76bf201e56a9c7df1a64bb9388b654cb6a168f8

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

