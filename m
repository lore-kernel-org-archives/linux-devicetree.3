Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340243;
	b=IC740An5SyTmAQ2mCHkkQAiMKn6smGEuVv4qSQYXTngvE67/Hgzuh7+AXrX7GYf+UQbf
	 Qo6hOylZfMwNA29iH9ebPqEA+WFhFeqjNTr3WVLaZWhDgBpCvJ8127KkoZl6uPaGc0BmJ
	 VpNzButs9/HNpRl7pCb9LjFWIqBdFy2zlR10KS2EiWhpAiXPk0mbkkoPkaxMshlLsm0NK
	 +a1Iiu48U83WIEj0tzs3BwhQ8iz9N8W3BcervhWjx7/LE2rSMJgvvdBabXtflPsPMs8j1
	 gNbe9ZwXfKSZbb5JsSmmUEDSqrfgM4+MybCJZ9pppPbSIMIn9qpia5e907ovGOoSs3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
	b=13dFLklijTOIyB7mJ/31Yp1ecKAULNViw//tVzxb+oiqE3n7TTARLfmx7FRQjPoyRnyl
	 /qqcRG8hQQirfG2yILHdtpZQIyX2ZCPU/5IZBQXkdBM25FyeVpUNg2plx/bbyIkk1kh+u
	 8p6vFYEJjTEp8cX6HICAuGFIFL4KCQzfRc45HdvNisbhReOzAMbSCS6/Jt7hHM3xHBM8g
	 bMzLvC8n28ajoAm2RZOo7FAk+PSbOep+PG7BI7q7+ArjLSKfSGDbm6vjUpQdkc9n9FZ/1
	 MCiG4w470CmQDb9enfX5y1eupqzBfNKpnl0JnnjO7SSUyr2p7rhRhjvV2BEsQsCIFvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CSd6iNgZ;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AB5606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1AB5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CSd6iNgZ
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b47c8930efso34462a91.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795340242; x=1795945042; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
        b=CSd6iNgZwMRdMIpKElggnjFyr+SaXv2UrhUL0a1aNghamLNZJ4mM+aOxZ96cMtfkhK
         OTHQQ7a8WpsfydVe6ftENotB0PAJ/JB+mso5AoKg2HnDnCtF3xCkRrfO6fdGtTOUDrQ2
         LPQMeBcn4zOr9I0Bu8c2edRtb0S3J8+RgiaUUJl0XT/IYiCPyaS3aVvs4VQ+Q1mMuz+w
         88ze+sGxsvXDQPvqus/f4Y07fIlq4HyBN8HbWR9vBNJ1CIcoItFd1znbeqT7wrCeHmRv
         Q9RRKS5WtZ451mq96bcuMqRFAg52jJ28dYRO8AGzH84nObAq95r2SBy3BQ4d4Um5OKR+
         T2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340242; x=1795945042;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
        b=VJY7/CGXHipAAMTcenRjdGCUoj3gNMeJ7hfjGOr+27HO5VIpaYFoFca5htaGrkzWEl
         9hxlo6jUf2d2ygscowdBo9DjeEZD1ej/SEqbTaSRaLjZeu5R8UdhOeUm7LEg5wQu3L1A
         I56By+hUlLgvhcOFyYHh8pr9O34c3Og+DhMKNOtZgXIqnymc9BBQOnmGrR4kXGzjAu3K
         wOfV0xnqAAKaff2Jn95ukXl7SaoAliR8mBZduD04SogdZ6jOsvoDphWmY8P05GX6m4Hs
         axRneteFN5uCMFSsMbvHVc+vLSjgHiPQVl5/YkVarZl/WuVghbSj41FqPAN/YQqRsbVu
         E1jw==
X-Forwarded-Encrypted: i=1; AL+hErFLhg1VSCU454JVsCbTDgAyke12tsMrL7kslzEsx7Qo0BjcxvUERVrfkBBaOBvsb8t65BxyF5Nu1ByW@vger.kernel.org
X-Gm-Message-State: APuU4Z9xJSYahYjvfm2u0kg8Z9/HKjiwrwhciMfUFTJgMiz553gYHBEM
	bmnxYBwhE5ohFYgu4eyc3kaVYjpf+SSlDHGsGDW/vyFR7VvtG/EZtDIP
X-Gm-Gg: AZFdTZd8u2Iug4jZYx54/gGvhZticw+sPgiyhXcZE4LQCcc4wjCVfFWemZ7PCpI4y7s
	AxLtOkRm3RLC0k4UayoVfZXGYomn3fuMs06AQ0IGAAyYq2RfcwikkJs9bYsIrPwTSxp0PlUU1qk
	TwiokGiN1U798WKCZfgC1LX/UrbkULUovU9CTUBMtueUOPCOsq/GqMxaJSjPBBad4fZ51aFOkqO
	taLJAMUPFhzxj65HojVmLN46uwsN++WlX7vSVsYdRuSQuPDVz9QnkMcLv9Mw8Bm0nQFtbvFqC+p
	2RJVf2hUMn7cXq7zNfVEyRag47clzTooWRprUGrCvhxfny6f4ZQKlMLTbjSEX6Gsd19E+k6IGu9
	wVmMbEgvuZTBDx4Z3ZSN7bb/O2y3idB+ZTURJpEWfV6H5DlWLRqj86ezpoiCyXevD+IwYZ1/WDG
	Zr4pay0St0h9LfJ5jeuVfw3boZV3USvnnt71GVZZoAeRpHSvcf+xpijjbgt+xiTzlE6VjzeYIth
	nCQctFwiwUzwO/catOTqbd10+HpPXDWKA1D5MFWqxUr3uW1K1ax/V4OtL6FBcu26QL0bcaYvpFj
	JphxB87N8c0uGFj4fIbFSLb1e27tA4/RExCU5p2qLlbVUY1JxGF9+gBxNWJr8yBj/8R67WtM1T2
	Zt1oI05qz7a1JB6c6n3pS5eyzHaQ=
X-Received: by 2002:a17:90b:2ecb:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b41c98a1f8mr12481111a91.6.1795340242152;
        Sun, 22 Nov 2026 01:37:22 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm3367272a12.12.2026.11.22.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:37:20 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/8] serial: 8250_dw: describe the Allwinner H616 and
 A523 UART configurations
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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
Date: Sun, 22 Nov 2026 09:37:19 -0000
Message-ID: <179534023971.231108.3039673113639895699@gmail.com>

Tested patches 1-7 on an Orange Pi Zero2 (H616), backported to v7.3.3
with the two prerequisites; 8/8 not applied (no A523 here). The UART0
console at 115200 passed about 700 KB out and 350 KB in with matching
md5 sums and no frame, parity or overrun errors. UART0 and UART5 come
up as 16550A with a 256-byte FIFO, and rx_trig_bytes 1, 64, 128 and 254
set and read back.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
