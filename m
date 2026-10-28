Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175465;
	b=DGsxw4JVHmigYaKH5UxQlldhToeFRtt1gno+x0U47tMFvbI8gtuQHwGNkPtZ9bqJ/NYZ
	 zbcYaXWjNPgotwY8lVfSexS+AWpN1wEb4zmXzB05sYFZDuAdhs4iiuv3Zacn3T0j+a/qJ
	 waj8yzDcxB809THsnoHjHTL+9BXIiQRBmFa/o5zXEcoqu9E3huT2zh2TecciDF7G+zoxw
	 RuGb4/uVZJE+kL7sNBw67k3VHZIzYXBwZcbksAsLGy95wxhr5/XFiYS4n1CP2vrsdSYbU
	 FowjhdWs2HIj+1Yz+QtLPmFDh0VcQC/k6AR6cUCE+QUB7RkT6Ty4nhIH7vVw10fxfug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RRuxTSHqwbMEC1Vyc99sUTotqRotw0K4rkvyEEzXBAY=;
	b=4bdUAiqMTWDwSfAPp932px+7nXpcsS4E4w+6cc7OhJqqPz8u/gRwCBNuseBdNCOxksS4
	 9RQpROUk2IS7bTHhomwMZ/Nt58wrRhzPQgrRdeb0pzoe6hDp6gr9cfEL9FLRvZiDRbIwJ
	 7Wuw65CTLHN+ESRAzZ+vRP3v1UcgqJNUbVADhRySkI1CqwPi5UQnHOAW5Hj21MezOsF8H
	 sT5kMGdujbAgbUlFFNhhd1raZYI2A6NsKCbcNFDeOESgGciiLj4OvlerS8yHqDFpHAy8w
	 Gx8vmqX94J3isLgsn7UqeNO3eoUiGx2j+nVe3NfbZqNz7d07oqQvwkBT2xFNooLtvSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6e+HXR4;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D890606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D890606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6e+HXR4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso4132605e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793175463; x=1793780263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRuxTSHqwbMEC1Vyc99sUTotqRotw0K4rkvyEEzXBAY=;
        b=w6e+HXR4E1vIVIMChFIyAOb31XxYhOEt3Zrz2IiwM3LhOCQBmnrDukcry722WCgB93
         SSb6PJmaklJ66J7JbsmjxSLeYpqANik9BIVNyINZJvLzWops2H3lR+ICz4pF/BkxwNtJ
         p/8dr98ELXO5kZWfu58phA2aBZWnMe1X/8GoRxqG0KcGFniooOdFW4i3F1KEn8TFIh5i
         9qOTv43hoMT2Z5oPLNqsIWekEi9z5no4kqJ51UgsNM9fIDLkJTwZ3Cj/kgUUxxejapis
         H6nZKdcMhFBN91zskq/ilLB4+p6Q4WIFyKD/8gj8Wz+8cFzC5V1+J8hgYm/mCED8i7HO
         /WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175463; x=1793780263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRuxTSHqwbMEC1Vyc99sUTotqRotw0K4rkvyEEzXBAY=;
        b=S0UiVqQknamCnwFkw+Vj4TkWeOlIqYsQqL9zj9BE5r1Z7Y2uEIZIxR+7Mz0B013BBg
         EnHenLQRcNNAkdXsdtCyr/0J7KWubdaztui4Ef5n6i/8UYRDE+qlRWpl0ZLzpLVrg89M
         iKuhoXlN7PVn+BZdJLI5pTZ1IntjML2YE3pKCYVxBzopnOL4GxgfGiJLtA23ndokaD8d
         aSISQoorbIGxRvamHr1Oz7mbPcqXY/GFzF2QFk2MdhsGB7/tCoRoFZ01UJYyzorrUeCT
         3YfaOCbP+hIHDa1vkDm+ZvsDUeCMuMgihTk0dBjIz6p0lYgyxbnVmckY1IAl3f7QHHdQ
         5AFw==
X-Forwarded-Encrypted: i=1; AKwUvBwZt42ZQTtIdvF26+U+mQ1FYQIeW9bI4Z0zheZdp5VfUVz+Km/fpN/+dAooig+9tIzod4wYKxTQvhh9@vger.kernel.org
X-Gm-Message-State: AFq9FYL18JIw5nZw0Xr9a+kwCJte7dmjQHf6TTRwWUEwIxisQ9+Jbgjw
	eF2HoQE48/mjDQCNCD0jlD3KMUzxekFhO715QZy6cx5qHcmiYA/nSXkt
X-Gm-Gg: AYBFou379oSFDBpttO6mX2ryn0Ac1fTdqKmRbSHSfTSpsXPZP66siaC0ZTkY41r5wYG
	X1bjIZwGPBJ4nJ+LvpFgJoPVjvBmTmBBqmM2GrRQujaNMsGpoXdnQKqYfkvNUyu+cSfjvSqF48a
	o6IdYMSeIrUYLw0YRg9LaXrlhEjJsTWJAvGRYsFU+xr5jLalRt8oIrqd3XfDBsMLlqh4d6Ccquu
	ganD9JXgS75XM6EgCfvl0lNDO1ClDsKCTjM8gXp3B03uK92nYgq9gKZekNmja1e/qTMMUagDVBJ
	BZyo85Bb9WfuFcVxQlEx9SS4U8bZsaW/VjpwqEZ9kNZokfLOdczZD8gBHeVXhufHhOv5UPXun4l
	zjtTtpy6L8x97KJJ6LUfWAf2g3HQyxR7Ss1jTpstm4+4X7JlX4VwAZv+J9Z2X3QZF8LTRPTXquK
	j98HarHEAPOp2VdGqEedsVNafWL8oBeh/8WxDph02aeO0SHtqf/erx0kNKSTwJlV1DcLQaeEqkz
	c0jJcp1wBQfHZftMxEjAXrHEBjEODnIvKeUxZEzI02KcnAOqtuQDd26cbezE9xafnA/dYlAAf4m
	RE9pYpmmft3ErB9KtqMmF9f6gZ9DUsvGWKZW0gYQRCtLtEweZBHU3fwMUrkToL/w4Sc0Pa0hCJR
	GsLxa8mDwcuvGyMqvsEDeXU4ZRSVhq6alY9kA7dndy4cN0RYhcPLomxRjDaPqihtLMRuU88ZZ6t
	7uqgnqzClH8iynwoPGAw==
X-Received: by 2002:a05:6000:24c8:b0:48b:ec8:b0d8 with SMTP id ffacd0b85a97d-48e5d5c3dd3mr4027197f8f.32.1793175463262;
        Wed, 28 Oct 2026 01:17:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-63a8-e900-0915-3df6-8525-b963.310.pool.telefonica.de. [2a02:3100:63a8:e900:915:3df6:8525:b963])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm28393931f8f.27.2026.10.28.01.17.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 01:17:42 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
To: maz@kernel.org
Cc: Frank.Li@nxp.com,
	afaerber@suse.de,
	alim.akhtar@samsung.com,
	andersson@kernel.org,
	angelogioacchino.delregno@collabora.com,
	baolin.wang@linux.alibaba.com,
	bst-upstream@bstai.top,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	daniel.lezcano@kernel.org,
	devicetree@vger.kernel.org,
	dinguyen@kernel.org,
	eleanor.lin@realtek.com,
	festevam@gmail.com,
	gordon.ge@bst.ai,
	guohanjun@huawei.com,
	heiko@sntech.de,
	ivo.ivanov.ivanov1@gmail.com,
	jbrunet@baylibre.com,
	jernej.skrabec@gmail.com,
	jesper.nilsson@axis.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	khilman@baylibre.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lars.persson@axis.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	michal.simek@amd.com,
	neil.armstrong@linaro.org,
	orsonzhai@gmail.com,
	rafael@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	samuel@sholland.org,
	shawn.lin@rock-chips.com,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@kernel.org,
	wens@kernel.org,
	will@kernel.org,
	timpambor@gmail.com
Subject: Re: [PATCH v3 11/17] arm64: dts: mediatek: Add EL2 virtual timer interrupt
Date: Wed, 28 Oct 2026 09:17:16 +0100
Message-ID: <20261028081716.75598-1-timpambor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260523140242.586031-12-maz@kernel.org>
References: <20260523140242.586031-12-maz@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 23 May 2026 15:02:36 +0100, Marc Zyngier wrote:
> The ARMv8.1+ based CPUs used in a number of Mediatek SoCs are missing
> the EL2 virtual timer interrupt. Add it.

This patch doesn't seem to have been applied along with the rest of
the series. After updating to v7.2.11 on an MT8195 board I see:

  arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 virtual timer interrupt

With this patch applied, the warning is gone and the EL2 virtual timer
is used as expected:

  arch_timer: cp15 timer running at 13.00MHz (hyp-virt).

Reviewed-by: Tim Pambor <timpambor@gmail.com>
Tested-by: Tim Pambor <timpambor@gmail.com>
