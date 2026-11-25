Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605460;
	b=LLTjMz+ALVZKXY/x/pF0SS9ijGMTfenupwlRjkqJ8aGFw7qZuQn+2pU6oLlmSmAnUJbB
	 zc7hbVaylCoMs4D1MLgcmIKs9XwdmGoE+7mdXO27Q45o2s5qWNChtmPk/05lIc/xnDBB7
	 BSidW1Wgu97SV4KDIoLzmSwvdw8V0Bnh2DPDKfpdeR8wTtCpCi3sTI2BM9+UClSYWjirx
	 5CgWs3vc3aDF9JgXIMTPsHyoaMO2ZTzHaE4k3UmSjjOGwWQZUEG8z/vf0w3YFiA/+BTTt
	 nA1eG7aYPeRshI26TD8U5UkalSy2WSwRzMpuPzfZnBcS9zTBWXoM3xjBLQsQ34kN53g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fxRUQxNACXipbKVSVCcm8+n4+a6NGsD8TgB0HuHTvI8=;
	b=WBvfg1mHLbz26Yf9sIWzRL86M99vdmEBhRbitB5RLr38/Ykn1h2ziMlJvklZ3VXOGHsU
	 oPqZk7U8nXp39SqdmJnp7sCf47tnZisNMgHL5+RhDH6YGJ3/TuiprNQW+Il8ch2KyWnIk
	 hp8Wb1xy40duizIWL8HtUl/Dvon1yeMiR4OP+IikwDRjCGO/Rwat2mbA03OZ4b5f0qB8W
	 wIALYHwrEcNsvdr5ruJ3/r/uVfbpLJLY4xwFG5JOgjP9akEgj5b6YPBbV2K6ZdIUsuE1V
	 xAv6uTR4iUBGca/rPFZfG2bbq0djEyj5PWSWGCm6OqD+AG5QD/TF12lxOs3dgJMCDBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KYdOc0fw;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE996606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE996606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KYdOc0fw
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3524902f8f.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605458; x=1796210258; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxRUQxNACXipbKVSVCcm8+n4+a6NGsD8TgB0HuHTvI8=;
        b=KYdOc0fw0XfpgWsOReTkFfKlAQWYh5bjBxSLc6c+GDe/HrXiZr1FoXzYrJn0x5py9p
         AroMR5c/ME3gJGrcz0A5Oy90P/yN1qKQf+pJgegmVWq0JBN7WgoskahOmvdspM7u/oN1
         2shHaODP3Gfc4taLmjHi8c7MKuvFK8/8mNcmZAh7rEmYK42dXcpRftLiZepXPNOOJIcM
         Ss1S590je9bVFOygYEZLwpCpT8h5UZWjrPmKx5x9AjgmJQUJoiDb2jUFfi2B3pQjFlGq
         ECu+PVX0diYk0dQl4mCVLw+KOT60043XRMvLPRiIOVD0+UN99u8rQbIZ9Xh4AsM6/7q7
         T+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605458; x=1796210258;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxRUQxNACXipbKVSVCcm8+n4+a6NGsD8TgB0HuHTvI8=;
        b=AUfO3WUFNt38mNvHc+cFXocl5XAFn22VVvrLWQau6aPWaNRPGg/iw91F6Nk8m8QgUs
         mIQgr3fG0QI6B/2qtUn13YF4JWpM4uTGNK4+318JOUofmVUFYTmBktsL9trwe2BF0aMO
         z5vyYYFSQoe4o+JTakCWIUpSIAHVjaKbUxVOk/NSubeXeFMcjL46eqw8mpyOZxZDGXBP
         uZbiDCPPIvORPoC5KhcsFypRO13LGOv+P9yMGRf9ps2XlIgoI03ybf28p21WRUM2659R
         Tb+2uelrnX7mN6+kX+yBrGz/nga8fw0H7DBrDePr2LwGr2U+uoV/PeFKUBgOlWWmTv32
         DKgQ==
X-Gm-Message-State: APuU4Z9D1sOUL4mBjnKeRmo1wOGBOfrNWJ6j990yHwQESEvEOedF8XNG
	QRI5j081puw5AwT83eFoCzowm7rs8gbiXjIVdwtvixu7gwaWn/bUkEgf
X-Gm-Gg: AZFdTZfIx+05J3adej05CdiQGd2wvt3Tsz8gTh/s117vgH5rRoXThDseffBRQ1haafo
	OnxNeSzBPqIv2mhcqbMPiWW5vvJvN8Pt4tPbcLgkf4OC5br8erlrURpJOcH3Oz/u/cFGqLGs4ns
	pnEO+F5VUPIVjIEOLsiPehGACH6FXxIy2FKDcif/4IYkhAFq2n6uK2cYpnAtFLtwkpSqqXq0umB
	fM8IfLyj4qv0qPEEbDMpi55YYVQ9mb8gCE86fdtE9zYNPuTJxSBMexpe8UHN0DyKgeMInr7uDsU
	0eKvczhUcZzrV85TMZVmodVr7CUZc9c5Zh6oGXu/UpiW3WQue52LDOhzDY56QzbU2z6Qu2JYSf/
	pBqxhLptiMsh7XNuUz4IRW3S0pcTtnp9ql1e9F0JzJwmaZZ+iok2GWOmIPsHpVNkX8+izqSz1Yw
	0CLsaBWrv7SgfFrEWBNzzCudpqhQhs3ZW6OtK1qs8/9L4NIIPiZGkJU0gHvKv3xiftgKBF24Cr7
	SqftbI2QiqWNF1NK3Ri0cHzh0SCVXj4RY1A167DsWoIqMF40qjldBIw0weq2aOReGRYFDuBE0jm
	mObyAgPH4ZOBTXwuH3rqDD//skcTA0uCGQLfN+TJ4FNE6gfwil0JbM8=
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr378366175e9.13.1795605458098;
        Wed, 25 Nov 2026 03:17:38 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm579874685e9.14.2026.11.25.03.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:17:37 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: sashiko-bot@kernel.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 3/6] clk: Add Cortina Systems CS7542 clocks
In-Reply-To: <sashiko-outbox-233158@kernel.org>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
 <20261125-cs7542-syscon-v4-3-3337bb0d3b48@gmail.com>
 <sashiko-outbox-233158@kernel.org>
Date: Wed, 25 Nov 2026 14:17:21 +0300
Message-ID: <179560544103.3.15793449705570350216@gmail.com>
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

Thanks, confirmed. clk_core_is_prepared() stores this callback's result
in a bool, so a negative regmap error is treated as prepared.

I have changed cs7542_gate_is_prepared() to return
regmap_test_bits(...) > 0. The actual callback failed with the posted
code and passed with the fix for all negative Linux errnos, zero and
one under GCC and Clang. Both ARM compiler builds passed as well.

The fix is queued for v5 while the combined v4 review continues.

Thanks,
Fil
