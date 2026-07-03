Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1137141C6A
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 00:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037542; cv=none; b=AUl7sqzj3NVzuJnjO6ZqL/jTrzlfFHFqaLoYDDL+FCye6EMt2QMmoOyKmyfr1SnkNdNK384MVmgUG2q1V2nQUbq8nK7UE2umyVImQcXk2DnmDJnxBgh3x3tbNRSHmWx374PS7+W5X7rYeZQV4hHiNEhusAZwdc3vmdhI2g9kjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037542; c=relaxed/simple;
	bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyPy5822Zq5hJCcpH3VONtdcMSFHfYKnpK1OHft502dF309cBKv6YHwr+v2zwMy6MBCCURQTiJwT9axkyTkH9Ke5aB6OQa9tA1bEypQCpTYNLwqccuNuR8KnfqQdcEYY7Hgwx+rsJwD2a1tLxVTDf10LvtVgObbbROZzPoMHIoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUGaKjW/; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUGaKjW/"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c1d487f2cso314921cf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 17:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783037540; x=1783642340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
        b=eUGaKjW/PlpMqqXbBu7yiI6FKgvcpKROzSnkbNU5x203TTb/GBazkrWcIuMTjfBN45
         7YD31crDKq7AM3LfmjENZG/VCD+Lt991KYg1y1ITjZQLLILBuvYWFDgSOgajbFBrYQM+
         3TQRsGGU+0YuTTGRAYpxN6Mfm8s4SUyeXXVQxmuIgLRDPav8CLxD6tyiQrPWOPvNfYAp
         eEgAzjpRstnkxyhrRzWGiT/lRvj7EKDbYBq533uXnhCyssiSDn3z20SIyI3of1SBAUzX
         nv8gdgK/TkJnkPYGZXLv0STia0HuHleiMk4qlpfPD0X7OEFrO8xw0G5rqNJmhkdIrZeE
         JcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783037540; x=1783642340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
        b=lzwaHy6xmL7hEWCIo/A9TY3ytXQpUZtBiWtCO7KUtWVZ7BuolUdAiNALTuJHAIXPie
         RruSZiGW+HUdgG6ZEdhRJScS9Au9mZks4CElK3J1f3z1ejeVlIyWUJhM/yBuq0y+WpYK
         PcB7MktJonW+cp72Z+Ul6p6YigxHhkuuQMnaf7MbiQ/9RM9l1ef5gnQnOowBwgq0NkAx
         2lyyVQRdXvrCF3NJEJIYotEs58w1fOmUjmJEafVbq5vwQWCH8SPlyp4IbSw2/6viGlrA
         P92EzCAUkslkBjNYopL3Zq4aNoYNWhvzBN1YFzZpdD6btYeNA/0OS1QuNOxoOZbVKBk8
         hXIw==
X-Forwarded-Encrypted: i=1; AFNElJ/whh+xiiW5LP/14ahUsymhdZxdsMW7ASLe842KqDEJueqZvZ21LsllTosoJQYyHHnKCe/FyTS29+Ni@vger.kernel.org
X-Gm-Message-State: AOJu0YzBa7e5ltvxgqyhWDYn5mL9nQVOaAfLR4g5URTlj2gxMsfXkqHO
	AbdN/JgopFvq8sWAYw0/xBiq24UorkOhdUp+2qZ0Ej2eQ2K/r0XBtsw8
X-Gm-Gg: AfdE7ckOdo9cketVonWwRuVobfg5xg6ED9qQxKgGcRkxd0ZQUQt6rkifB72BNK2zkVl
	NTiFTfusxHxjXkh9DYsupCmq9+to0k1fRpl2B+1Vm+qDt5wfvSU8A0WEHTY87DFxuBPVSmzQdne
	lMYs+ANOSlkDcjWw1Gj2oRJj2f841rr7Rfx0xPHIosQraoIFhme0Y4YalpUylP5YtviQHSbgq+T
	Wh3/juCwv9gIHjPIqv7pXmU1ZO9Z82MVNrHTzvmjgxG7kIso8GIhHaIA9ziifnz7twPgqeEQU7K
	0pMDgt0M/2idbnzMbIMbLBNQttSU2AGRrjoaGxyV9BroY15dUuAylOa/w9oKFvjs2S714cpWKZ7
	lpmLIq1bsbX+k5EXH6fBJ7taGOT0mOFCyDbc5VnnFb8W6Nxjo3TZUkFim2YMzVFyZeiC6im0bgx
	9HaRKuzhvT/8y4iSHuvlymXkgistQsDKsWQbkBaGyDJF0knHXaIlSekrfsVZtWJctXhP2bKhc=
X-Received: by 2002:ac8:7f43:0:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-51c2ad4803amr90244191cf.28.1783037540068;
        Thu, 02 Jul 2026 17:12:20 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471de87e3sm40289776d6.35.2026.07.02.17.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 17:12:19 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <frank.li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/5] dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller
Date: Thu,  2 Jul 2026 20:12:18 -0400
Message-ID: <20260703001218.1243244-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Yuanshen,

Following up on my earlier note on patch 1: I have Cubie A7S hardware
on hand and boot test kernels over serial routinely. If runtime
confirmation of the DMA controller would help the next revision, say
what you would like exercised and I will run it.

(AI-assisted, as before.)

Thanks,
Enzo
