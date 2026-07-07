Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D2541DEF2
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431458; cv=pass; b=emc27lhw057RiqFIRfEMg24JTkZm0VX8bXuTgDJENHEcLFhQx4FdY4Cea1DGS75f1D0czEh9p5gWIS9G/mXXADisuhfjABh05g6XV7Zdo4Qp1ZhlfsC0KjWdVOCjdEuM/RLoEg0g273Mcuuqh2RJySXhwKMVk91814oB+70iA+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431458; c=relaxed/simple;
	bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIAW867UF/nR2FcqhIpN0YFjpL9ZaSqDvVUNS8E/O3xliRCAfI6i1nlfXaw6HL0NHTdcUSyEXaAlIpyu+fsD+x1S3xBdDKasamccDQJqyGZll0gYHRjEMAW+SREcZz4D/hT3mjhYPiLz7YAeotZxW5QhzO3EsXlhlBBPzLlwovo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAaPlxUA; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAaPlxUA"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-664b05d408bso3435510d50.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783431456; cv=none;
        d=google.com; s=arc-20260327;
        b=jcXdILHExHC+rxZC6kJloqfkP1F1MvksMG9KHwiwGB4vbvh0JHqfunoU8patcoYb2t
         wsmM3xG6WLP+mfvZjA5v6avtLG8Dmc71h5A4eZEx+9w6A5wHI25n85uHW69bPQvBuZry
         0JilXdRq9Q8/tS7uxMW9XDBpYqCtsYBMI4MAKnpqIDz8R778wdVVGyHJQljs9b21eVms
         zSF6nnCNVXdSOvOOZDH6Sx3lCO6PAeDYkW1LW7gtlH/YEgV5GZqSgLPmjdlqjHrnTNvJ
         t5J5+dQMktcs44PW3UCBKMdniif1hgh/Txpy4JNp17ukJsZJdZe4FrPWlnos77T+F6Gk
         445g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
        fh=8o+mrCU+nIdqgYhx/29MgNlNZCg3tVGYNLD+1Khb088=;
        b=LG0ZMc5xBzEH+xHjohASI72INKf47mT8bcMePvb94FyCm5iqZBWYSxFfn6jz7qf8vM
         csdn03ftm2z+bSvAb0I1Utk44q2JmG2dA65AeLKY4e/dOB23VTvUvgHRSAmUypQikmpG
         6x5eBSFxH+XSVTWgQMBm/uG1C5AuEdbiWlOCIBtVrrJG4RSaik53Vgi1/tQ9tPKayMYD
         5BpQBrsQFsM4VKyL54RpV2KnX5nRlINaTI/D2t6EjDIbduCX7NK5w2e4+AV8xjf5mBMK
         zyvUe5+YFcNbxEqay0a7oLNky+3A4hH9n/0JkUcojBGJx47uYIGmjYuui0JW0NjfdQJo
         mIVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783431456; x=1784036256; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
        b=UAaPlxUAFFrxu0oHiKSjwLu1QY/PnDxAteQHIRK52RKfSroz8xttLIJ6JCID45rFHh
         KkoQg5COgA6IDztr3LxajFXnsqLA0ppsmMWW114ap9+5ysuIayD5ljctIy8EdeVShzWB
         SXNO8+/4YGK5YF25AdMRKtq7qDEWpT2diI3ViSCKK1AiOHx0Oejmihhecc5AUeNaIgvd
         16CWcAVqttHrrim+ADoD4lBhps4B0boFAMRqFNUT6B89/gc9Ui+FoxJW/jWzPAdfzBXp
         yszAb0bLCmRpBT6UNvfK7PuJ7HowvVJX/GLPV4mZtY75bDlQy4OtQvjt3kXekKRs/zQP
         AhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431456; x=1784036256;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
        b=szdZrgmT5UP5SGMtoRO38ftWzLMxzjswJH3L5tk6yWcuiSjnY0mhoOTtZzJ5Uh6q1W
         rpBL3U3nW5Mq3wy1QhQ+IqLmLme/4YQec6IgYSEtvq2WNoArD00337HqlexzdWEI3PVg
         zmMcKQprya4Xpmt81i03RjOi1a82l3R6COcwYM1zUiiG8/MKd/VsTWbCsXWNUBpBh0bd
         R8W4dO0BwGL/kXN09omeyeqn85Sb0FJ1f2WPq/f18r7xhybXid5KCgmuzy+5T45NkOZD
         wJD3FVe2KeGssPfW0voSgD32jcLAT4YnXRl5OiAF/p0pnoYsfdhjphkP59HR8RqvSMLZ
         rLFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7CnJM/sKnn7Wo8VT8KpK5vfADSRRWp+6L91ySck/Yc0AgZgBp7FlMCdQzEbpGl81W3COzuVGwWamR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyya/5k55h2GzcajyAXp0QmgVNtLBI0u78HFnagmiy5xVoo/jK
	LeZdbvvEeIy3R0hze33F611Xn+gI5YUrUc90u1QN0bdj6vlEhg4UzKK2dRl1foRzXfHhQjioEoC
	AGxlvnfT7RijEBVPMmD1/1FOSCYcvW/og444d2dA=
X-Gm-Gg: AfdE7cm39ntBVUx6GWPyZaVgF5cQf1GcgoLoFSordug3cmjczb0L5tXwtvXBUF0Lrbg
	zSUaNjKVXXvAPeJm47N0HXX4eDFvrz8W20pBU0fKJf/5+K2DBGS/1YsmLfiu2nWJawcg9oO/Och
	qJ+XFKX7hRHHus4QdCttX7JEnVH6AVWlTyUbX0B2JgrxwGvNaCjOsKUj5zOWhxn3/R3kntYE6v/
	iIZRTlITxnRjjhj/fXb3blNimca+lsBT7TPiiBeFCwY8Sqkb57FZFs83PZ6oGJRsja2OxEZ7KGK
	XsHxcUbR+e41EJbNZEtii8ryd9ZXACH12pIakne4kskC2uhf3Dd5CES4+opbzw==
X-Received: by 2002:a05:690e:440f:b0:664:ae6a:ef6 with SMTP id
 956f58d0204a3-6677fe09239mr3207984d50.84.1783431455985; Tue, 07 Jul 2026
 06:37:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com> <a0cee001-7bca-438a-943b-da28528e7df7@gmail.com>
In-Reply-To: <a0cee001-7bca-438a-943b-da28528e7df7@gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Tue, 7 Jul 2026 23:37:24 +1000
X-Gm-Features: AVVi8Cc2ZFlYzV97xsPmmL_XYaVoOo2UdWECw6a41ntBKVYGFTDcsFEpeCIlldE
Message-ID: <CANpmGNusmx8NQEu2x07rX-yd33XA9TJR_ZogFVXexAmw+7qq9A@mail.gmail.com>
Subject: Re: [PATCH 08/10] HID: apple: Add DockChannel HID transport driver
To: Julian Braha <julianbraha@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Julian,

[...]
> APPLE_DOCKCHANNEL_HID has a duplicate dependency on HID,
> since you put the import for this file inside of 'if HID..endif',
> and then also gave it a 'depends on HID'.
>

Thank you for picking it up and letting me know!

I will correct it in v2, which I am planning on sending later this week, or
potentially on the weekend if I get busy.

Thanks again,
Michael
