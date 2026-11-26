Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693263;
	b=qYmM83ZudnwNyDvXcqEqYCFkAQFM67QMs+1RrdvW8i12Y7nDOmbxgswIP/7/X+O9//ch
	 nB4SPkKDnszCNX1CzJLpwKkmMOnlp9QHbs/LeXb5ek4dBdVeNqKa0zakrPb0o8sId9tHl
	 j1Rp4ZOFRm0dT/ZUftVH6wZQazVwN/fm0dvJnzJbdEkns7H1zxlfT1jEkteL7vPhUs18f
	 46G/7FDfFaSZw0RMpTC3DKSp68kej8E4TxBYp0sW5RH5LE3SuiJHfOj17N6vGfiIxZSQi
	 QRx4zQ7soZwfaYw2magZaWYb6qCRd0Xf9WaE2hnFu1Av4DHax6Nc3/hqlAgGqXFowmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type:Cc;
	bh=uxM1VmLjZ2nxPUWhti3qYeNXknEDXlY7brHt5kBUuxQ=;
	b=nW5vpTigDbF5/U4PjD/BIy3m6dIp+/vZXphAi800f4xwjVLsDcpfg8SsLP3Q43w8Bjeu
	 /eGbfE4k08IxHmMZuQrPpT4R3LNpbopfrqjBcimW6/GyzHwieMlfSFhZaO1D+Mq1tmH8c
	 fITu+CAJ6iKqiMVpF7YLSmQAtniT4G7X/5QEKLZK6BW+XpqcWZRLDlB6ZxvI4n/rJCeIE
	 Q00//T20ZboYA3gQ8ic0tqp0R4uNNEX6XzoUfV/9YsyhgBnRz5QBDZK4clmIUp9DyuJAd
	 0Q+ti/URVob7eEThd9VEaKcWyX2uAC39zwidgjdf+LBVG4EPIt1bmMpIpAOpr10rfyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s7MVX8Dc;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A14606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A14606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s7MVX8Dc
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so6787912e87.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693261; x=1796298061; darn=vger.kernel.org;
        h=cc:content-type:mime-version:content-transfer-encoding:message-id
         :date:references:in-reply-to:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxM1VmLjZ2nxPUWhti3qYeNXknEDXlY7brHt5kBUuxQ=;
        b=s7MVX8DckHQUo/rJSqIhTusO9NO6ZbOfaabeSgRRNIo0GzyIdVGfS+T8dndnj3Vpz8
         mk4Y72ou3B4lbLRpKtUMqvkfaNeIzScnQ79Q5nY//ZIbM32F9EUWOV00lewsm7NFhdbb
         gpX+z/mnzp0FznPcbuYReEshmW/RajNIKjXoTU8V1jaDhN9W9TQ5lb3IU2S8WY5EUvJr
         mznWf33Ak6i0SaOCyxt/FxhBtoRO/i/8bgXtNPz4j9RqxFbkTgZK/Aa6JTnxknCAfkaG
         GAOxjefzCKxpq1Xk/O5SxYCzMi1Bzb99D8a5+bqPCL2A+V4eCJBgYRDAYdQ5TaOAnT5Q
         OyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693261; x=1796298061;
        h=cc:content-type:mime-version:content-transfer-encoding:message-id
         :date:references:in-reply-to:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxM1VmLjZ2nxPUWhti3qYeNXknEDXlY7brHt5kBUuxQ=;
        b=Si+XhkLdPhbXe/MC3p7NtH4wIUC8MioDTNhAI3tM9HStVFsdSG/9ZrUXgfa/9KRRGx
         I3ggGAC3V3QMlvLjwUKkgd8xVuF3Bp6aelRFRZy2t4RrT3btEshyNLBVRY1w53eeUULQ
         /Zq4SYz22kZ/l1JyMc+mviNVI1aRKBRMdJMX0SlnBh2etzhuIzQioOHdWEsKOIYQWFFK
         HQxz1cEclM+oomOGr25CqFfwdUIXBni/Gx59oxrykK925wZPpYAmyonjeyF6fzktmaGs
         cffAwNzBJ2c1EFbI0EsByrTu937gGJG0jH7WFy2VkuPwauQVNE7hTjxIUMdByy1mo8r5
         uQ2A==
X-Forwarded-Encrypted: i=1; AL+hErE0Kck42iIF0bor4L+hNHXAW8z/XV/eSvdNHFKs/Rj32z7NZQ4IRyJDnTCB16FIIB9W3Z8WqVFjsZLs@vger.kernel.org
X-Gm-Message-State: APuU4Z98nG7ly5CIwoamVuS+7Ni5bXDPC5GCGFQm62p7Z1kPnMAPtxeR
	56lUM79QersFBEchtZ/T0OxhEmFI6bMcw/wvvB+FgKViMOow6XHufn1W
X-Gm-Gg: AZFdTZduH+sKH+K4nEgHbteAvuPI2535wkYgWACU5V15we/3qs6RFe1z+zrwDJvs21g
	7up378No4+r+v2e47vFEYx0MBujefPEyoWyhIXxASn6FALi+ty0PLXdtyhtJBakjyWoa7FiICB5
	vh04RwwCX3AIvc1By4Sj4p5IIpw7gNmmeDdMYbpyFKmv41Ah/RKK61eTstigocxUkPrr7uq8OG5
	lhUz8SpumlnL6TWMHTkPamIaM1EW0Kv3YyM/qN8dhYoDI+q11ftDYg19J8VuYU1eH9RuL/saTk6
	3hnR3CSaLnTet1jH4ZjPZp9ikvbhV/LIhmIe4gcy4PlOKpIgF7QH/UMctLfMVyuaE3XCJ11kw7T
	15dQpqQoaIaI7ggvBBviJiaIFZKgpddb7van9PzyeoOz2J//2GapgXTs3ecLKNGYo2ePTTS2pw3
	Z+Pw4h4Lv2ZQWYV8sbDJjDAlri8hFpZe6xALWvPoBHiBZ9nApMv3qEuqBf2PAzqE4sq0S/VY64b
	q2wv70zwmOtthxcUQuqeRxeI2YTycNIc0Bdf2r0Y9MF47ERcaQYNdBQW8QT3YMNaymZ0kyUA9Ex
	0dEPxa/k8C4iftFYMIfyHJ6vr1FzaEVsqFQPr2wAD3VWNIG44cW35PxTa+74T/vsFoGcv+leOGW
	J
X-Received: by 2002:a05:6512:2509:b0:5bf:ce43:979b with SMTP id 2adb3069b0e04-5c1b7c0725bmr5707863e87.21.1795693261054;
        Thu, 26 Nov 2026 03:41:01 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0419b7sm5153112e87.55.2026.11.26.03.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:41:00 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject:
 Re: [PATCH v2 2/3] mtd: rawnand: Add Cortina CS7542 controller support
In-Reply-To: <87jylzyi5g.fsf@bootlin.com>
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
 <20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com>
 <87jylzyi5g.fsf@bootlin.com>
Date: Thu, 26 Nov 2026 14:37:51 +0300
Message-ID: <179569307151.4.4443063730583761343@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Miquel,

Thanks for reviewing both patches. You are right: I put restrictions of
the initial driver into the hardware binding. The SDK definitions have
two chip selects, 8/16-bit bus support, Hamming with 256/512-byte steps,
and BCH. I have removed the ECC restrictions and described both chip
selects in the local v4 candidate.

The 256-byte Hamming step is intentional for Almond+: it uses three ECC
bytes per step, or 24 bytes for a 2048-byte page, matching the stock
layout. The v3 hardware test read the existing flash and wrote/erased a
temporary UBI volume with that layout. This does not imply that the
controller is limited to that ECC configuration.

I also found the AXI bus attachment, flash IRQ at GIC SPI 18, and flash
reset at global reset bit 14 in the vendor sources. The updated binding
describes these and the banked data aperture. PIO does not claim the SSP
DMA engine shared with the network engine. The driver retains the
firmware bus timing and does not pulse the flash reset at probe.

For the driver, the local candidate now separates supports_op() from
execution and checks the sequencer format/capacity rather than an opcode
whitelist. The Hamming callbacks use nand_read_page_op() and
nand_prog_page_op(), with their commands and addresses passed through
exec_op(). Software ECC uses the core monolithic raw-page helpers.
I have also corrected the parameter alignment and run checkpatch.

v3 had already been posted before these replies arrived. I am collecting
both reviews into v4 rather than sending another partial revision. The
ARM build and tests against the real core operation builders pass; the
new Hamming register/data sequence also agrees with v3 in the host
model. I will check the changed path on Almond+ before posting v4.

Thanks,
Fil

