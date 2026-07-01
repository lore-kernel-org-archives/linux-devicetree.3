Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E772352030
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 05:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884866; cv=none; b=ktvMF5xRCZHa564IxGhhPfQdGjugoFkfx0AQMHumYzl+XMeANl8ee2pIHLnJPHSQZaLo3GnrEh2ttCEaCzzPmJVm9f8H8Xcp8LDZNETf5erAsT0avlxVB/ekKD8CuteeUOSigcaZejgs75IOCLBh0vp5E13RJ0FRQ/tPcWrALSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884866; c=relaxed/simple;
	bh=7C10BvrXP330gVepTXYy6sfoFfKbPAmHgg+xOWMPMtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AN5/w5ZQF2p/V2vQW0yq2Ru2C7DpV7tXA+oQrZCxS2EuBDrYEWg+D+RTn7e+98E/7Ij+k21Rx43jF3WjcpOfGwXhEV+ctSI53LuN6ebocfG624iQp3a7yaNcsdKeBmeruGYbyol4vsn8Vqo4JnrI0CEFEMQ8NtO3GVTi8rq4afI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuamfCY4; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuamfCY4"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664b05d408bso186372d50.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 22:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782884864; x=1783489664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2dYl0OUyzZ06MfTi9YwzB+RT+fpto3AMtLt5rd0qn0=;
        b=OuamfCY4k72H1mE1nACydZMPqN55KO/q8WL85gQLOx03Nsvlav2rXGy5PMoPNkZu4f
         aPIBTXWa/1lF/2QbPDGR6bysAk1Xr2RbvugtqbNBUJaGwymyluTpHiNVOFC4URgA3Tn1
         KEN6C9DyczEbm9MZcMLROlTPbPYKl55YkymHsvrEoDjnytMOLyaCtXz0xpuZvi3EsgP8
         xYKmjX+9reEa3ZSjEaW82sOT/0cvya1ZjFda8cFQ/LyjCeocO363jSz3kIp3GZz3RJZp
         XHeawHTGoW6vx7Coc2lWdzstNeRL3MIvM7ZOaRfnSbiAsQZZgGsM7DFhKEZVs+j3aNNw
         FHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782884864; x=1783489664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A2dYl0OUyzZ06MfTi9YwzB+RT+fpto3AMtLt5rd0qn0=;
        b=BDY712XfrvPZSBAOkGH4ShcQGMpWhaXDG0/xyuRK8mcZ/BKvN294KfrbHkYFDhhIMu
         SbUd8PpjY8WFi64Aw47oUPyrWRHNASG1QrX+mTEp5MlJ13YkAnaRhnXvTdwZ5AMcT/eN
         Rri9W0S0xSnTgAbLY5tYwKOlvxIu/d5BrqbT+/2KSOAwxkReLXhc93jtB3rw8mgC28VG
         tjTxlfqxx+GUKAjuSfwK13Qg7OUBZolzD/H6SvC2UpMerf5iQnuuW3S4R68HQBmsgHWz
         ZuN/vfoOj7e5go5ia7tiWHCa2wSNQxUUiHaOCBH6pZpHBiv2BUdNp6ipbqxSrCx5Nhua
         KvZA==
X-Forwarded-Encrypted: i=1; AHgh+RrGAChnHvQoIOLYoerBe3R/NSZ0jcAxBxRE07flDxHMIVM/8Ok9EwYWfLMbv7nX8ogk6+3KetVDjo1n@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/uAz39xDpr14Up99i01lUCESL058O22i6/Sf1GEtSQy8yjSc
	DSwI7wAnQS+LHPGPrsI2vG2xM/aHAQ0QGpLoUPqjrh9nFFNzTtWgri6dd0Z9vUizDgY=
X-Gm-Gg: AfdE7ckTTT1V3OLaTfIqIaIhR0D2m6egoS9fNkdXvZthlouTsWF4iwB2CtY4KrdK23L
	21/vLMcrsNfRP4F6EhY5fwdcJZ755oZqXhZIbfZ/W8NyU1CT2yt30u+C8mucQnonVXx660+Epj4
	Tvu0qfv5MZg6M1c+AGr7OHDzl1SRK5Ym0QNOC3IadxDrv/3vky4YNKtNl7Vn1z+1QUH0fswHzml
	lQehjSy+EhpbZk8Not0bjjWWUbEOt3YOunyxOjDHx5hSqFifdyWC1w2n9t2a9VGGj41vfSu1CWl
	50m/p1rzN0qusljOS9Eqgz8CHgSUO1+y+owlXt+61hdHbYuSP7NOR1HTO6U+RPtLnBcfQYyuL/p
	1FdRbUmGADCjGufI+DjBYfsz5WCgFoxRBtdCoXLY/floKBXAtV7Wb8idfUlHxt7cZGdfw2yeWtw
	XkFJsMc4AaTeFgYH9Cd8YJX2kv2uhezssQCmMrLSY8Ip/6+ZV/X/GEX0YcAbq6
X-Received: by 2002:a05:690e:bcd:b0:664:d899:e3a9 with SMTP id 956f58d0204a3-665219a787dmr223821d50.20.1782884864130;
        Tue, 30 Jun 2026 22:47:44 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6650163752bsm1836441d50.16.2026.06.30.22.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:47:43 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Yuanshen Cao <alex.caoys@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: conor+dt@kernel.org,
	mripard@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	Frank.Li@kernel.org,
	vkoul@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/5] dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
Date: Wed,  1 Jul 2026 01:47:01 -0400
Message-ID: <20260701054701.3961908-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akQuefaUpt6OPNSo@b82beb281c41>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com> <20260622-sun60i-a733-dma-v3-1-f697ef296cbc@gmail.com> <20260629003505.18f0053d@ryzen.lan> <akQuefaUpt6OPNSo@b82beb281c41>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Yuanshen, Andre,

I applied the v3 series locally on top of dc59e4fea9d8. The
series applied cleanly, the focused DMA binding check passed, and
a focused drivers/dma/sun6i-dma.o build passed. I have not done a
hardware DMA runtime test, so this is only static review plus
build/schema validation.

On the IRQ accessor shape, I think Andre's data-driven direction is
a good fit for the enable/status register differences. The
A733-specific values look like data: enable offset 0x134, status
offset 0x138, stride 0x40. A small helper using cfg offsets/stride
would keep the call sites readable without needing per-compatible
read/write accessors. I would keep dump_com_regs separate unless
there is a clean table-driven way to express the genuinely different
dump layout.

While comparing this with the public Sun60iw2 BSP, I think the same
respin should also fix the interrupt channel decode path that Sashiko
pointed out. The series encodes the interrupt register as:

  irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
  irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;

but the interrupt handler still decodes with:

  pchan = sdev->pchans + j;

For A733, num_channels_per_reg is 1, so j is always 0 and each IRQ
status register would map back to pchans[0]. The public Sun60iw2 BSP
uses the inverse mapping:

  pchan = sdev->pchans + (i * sdev->cfg->channum_per_reg + j);

That matches the encode path and looks like the shape needed here as
well. The register-loop bounds probably want the same treatment:
derive the number of IRQ status registers from the real channel count,
not from an implicitly exact division.
