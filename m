Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469212;
	b=y9hkGhJ5Nqlnzae6uHvtd3MQWJDQs9phYhlDizPswFDYYoAAuyzhwOWCO263nNBAqfqY
	 Y9eKo8d8kU7sNF1suyVjkRCRqRIK0YGW1m6qfBLMTTCFknDZOnDfk0vQmCrJfj4vnWmer
	 xbA9eMPqLUl79YQTBQFgTwtZ5BpVL5KGgYRFhK+BysMwkfoPHSbiMNnEcGDdjQoFhrSC1
	 Mz/S8NlMOkpds4VOcAii/bqwhmFJbUR5BmsifR7+rSr0T/Ip43xEvZfAVXZHVGB094lLI
	 WPeQCdB1LtEamP7+TRbmqASijFUZdzCllrpbb41eMjgstg86KoUyc8xoY730UCac1Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=v1WDqyjHSGv+T3SvDbv9gdEvyLdDWkrLhjth3cnoJkw=;
	b=yyMSs5As59qngqN2vt/cjyqduXfcu65XAKR9TyBj9cxe5J2vWw/m/2a1J1UdegBfZcpI
	 jvA7ATH7x4BFiPm8p0xxhG11XFVUvWBg7LvWzXrRu4Ukyfkdq6nG6WFnjycTToiILIN3m
	 mkWxnaVtQnj6W2ZX1xs0vArhmrN9FMSY/F0gRXODAtog8QM5k6gL+m9DS6u4mUhDKpOU9
	 oEjVHKdRJTl3SndfEruhX3BvNNdX4YzqErOgwSCwOfNvuHYrMB1WSgC7bjVAQ5pIvkG/L
	 FKR8Yqc+NO5b1ElAPop+eCMMYgdsLpit4ybA+qRSinMxOsx9Us7CSCjrQKcxxkKkaUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apOqFzWF;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFBC606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EFBC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apOqFzWF
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae7d1ce1bfso33528091fa.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795469210; x=1796074010; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1WDqyjHSGv+T3SvDbv9gdEvyLdDWkrLhjth3cnoJkw=;
        b=apOqFzWF290F43jBoxcQbBmvxO0r0rSVAGiKs3G8UsLt7V/M+jkzLT0w+Xvm3MUQj8
         hzrdHoA82b1+hCXO4tPqS7EOflRcmDcoy3TP+ptgIJxdOxD9xtgKwnl2wsJEMdjnHxQo
         yi30pfbuEJmao9thfgmB+k5sBKL2EkPU4jTO34mlGF/IbBHjcdkWRunc4b6u56IYl4KU
         56ys5Pp2dB6IVzVgPR/r/ShN+Iv4I90v7d4laNsYFYFRTy6kWEVWs3vLfO+XJLPIP8/A
         FqcGUndhISRbzc6qSCN9MN1w7UcbP/IcHGTgyZ4EW2o1dQ7qWJd9f/zKEPy0LEC9G62P
         N4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469210; x=1796074010;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1WDqyjHSGv+T3SvDbv9gdEvyLdDWkrLhjth3cnoJkw=;
        b=S3mNB3dtWM12+BX1Y2W76g9vRUUMYmvu2kdZhNEVGXWY4gre0qy/VgUTSU5rq2x7rG
         Ge5acwIsNC9ISAQGFnBkKRTRmpUfpRelE2JY0XLQ2n37ZSMC5J0uZU+zvI3SrSYncGRm
         BvK+Pej8twGzXFMZOX1V9WyFOpBHoOyuifddE4xtKJaJJ0+NjONjdAz5lm3rPcHoQo6a
         sRTTfM/CBPKKiAdF1X5ptyGh6LzpveA5gZP6Hk0xtIUss5kwxvO+ph7nHobtuD/2EJmj
         /gvoocgxTyWNrjGlh9Xtg1+KixJkTDN1iYJurB2zcHRqHetsg0tDIiQjI0JwNfpptoCv
         U6ew==
X-Forwarded-Encrypted: i=1; AL+hErEfikjccCubOetOu/RdGq72F/MXEsxAEwjOESB4XXEcJSGarLTytLgsZlwZewof/cej3zRsN5UTlORH@vger.kernel.org
X-Gm-Message-State: APuU4Z8XCTfNA6cJXUnH9p+rQOh9eNniffJMEMWkayokyfMfNACy9sGy
	A/YuB8Edj1+wF6i+Mbotwt5R5tmuEphlFyWWLh01TyZuR9MfuwQlTZGs
X-Gm-Gg: AZFdTZcisFTgtvy0fv7BZ/nHCy7BfVrAMmyIJRwHvDAqqB7whoPM6fJm37SWcUSc05p
	gCkVlmbhcSaBCN3QUi/pyyRqF6H2OWeaKPoZ9QVZppk8zgoYSv1FtVyu8a5+z1OGmgOhxXIabSC
	V/1z+yx9z1vfVcTVMcqrINNHiZHxGnLai3LoPOwwsVobj+L3zAz3rjTmySdz8yxEuuA9YyKptfG
	0eTpILIzQUZB9he0wL8npjaSP6t9mWyPrHWIzRf3a+lZsp7cZUU9UZboX8OjSsGpsslG72a20qz
	3pAS9phPOI/YZd1N/LykoAEr/HSocsH2i4bbERVfQ5XIZAK7J4YK6sxJ5xDK7WCEEK6nrEHIA/r
	Iw2prXw0iIHm+1T9YCueu8Dt1NvndKPH1gV3IhwfKkpUlWmLBhiuyEg7RUdGdsh+fLntiJJODpA
	DEbaUmjRyc3Vq0WByTuP2RN4AlQ66t72gdjrnprQb7MpKqWIXeEnPBdpeH9US+Xxh+1g8n6N0vB
	6thYHQtUj+OEGQKaMYoPixhPBWgeTBJC7d0Qf/CjeH0uo0o6q6ZgJlzTQjg1TcKvniCfyA9SAlY
	tBUUBckaP9vwmRVMSwVkGlA7PC8DKbELRCAVX0ScBcIPv/MnTIL0rVM=
X-Received: by 2002:a05:6512:688b:10b0:5bf:d93d:77b9 with SMTP id 2adb3069b0e04-5c1bc7d629bmr2709291e87.30.1795469209627;
        Mon, 23 Nov 2026 13:26:49 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd07b270sm3229875e87.80.2026.11.23.13.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:26:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: sashiko-bot@kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard  Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob  Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor  Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject:
 Re: [PATCH v2 2/3] mtd: rawnand: Add Cortina CS7542 controller support
Date: Tue, 24 Nov 2026 00:26:45 +0300
Message-ID: <179546920557.4112741.10222765658884997584@gmail.com>
In-Reply-To: <sashiko-outbox-230010@kernel.org>
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
 <20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com>
 <sashiko-outbox-230010@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> Should cs752x_nand_pio() also set NF_ACCESS_EXTADDR() in FLASH_NF_ACCESS for
> row-addressed operations?

I checked the two paths on Almond+ with the 6.18 backport of this v2
driver, using read-only access to the existing flash.

MEMREAD in MTD_OPS_RAW mode with data and OOB uses read_page_raw() and
cs752x_setup_page_regs(), which sets the bank. OOB-only MEMREADOOB64
uses the core read_oob_std/exec_op path and cs752x_nand_pio(), with the
bank field zero. These are separate reads, not the same software cache.

At physical offsets 0x08600000, 0x10600000 and 0x18600000 (banks 1, 2 and 3),
the 64 OOB bytes matched between those two paths. In each case the OOB
was non-erased and differed from the lower-bank alias at 0x00600000.
ECC corrected/failed counts remained 0. Thus the generic OOB register
path does retain the upper row bits on this 512MiB device.

The generic path programs all address cycles in ADDRESS_1/_2. The
vendor erase path also clears EXTADDR and supplies the full row; its
register-PIO OOB loops clear EXTADDR before each word as well. This is
different from selecting the vendor's 128MiB memory/DMA aperture.

I do not think adding an aperture bank to these register transactions
is required. The read comparison above does not claim a new OOB-write
test; no flash writes were performed during this check.

Thanks,
Fil
