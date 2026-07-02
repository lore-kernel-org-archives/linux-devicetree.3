Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A7B2DA76A
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989316; cv=none; b=Pu/ShBVr+ocmWA1bSf6TTMb1NH+o4xCIdNyt89rbxYonOk35k9toWuZNbKQky3VqWNvl9vwnBiNIz4MuAlxXpwYoWv8W4iSO4dlwZN1u0CK1j5EScQ6e2ZIfphjmuj7hmhI82oRZsQxDbIJfmWShMpR3yqdXv/gsGYiDLyqCsWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989316; c=relaxed/simple;
	bh=CP90g/Sd8SpBamQMkPP7wI+cAPxvLKgKoJOnW93/UXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEXHgoVKSb44RWaBgst7CyMxrYO3FDgSTBzA4XH1+M25enel+R3U6BbnzOF89+ga0R7Psk/E+QRGYr0pWl+eiAWCEjM0+8G83i55nveqS6htplqTiAlbWcbMLidiop8LVmBBS2rb82+lIbBAiR2KX8FfvA8FoXriug/eu2y91qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcaqOliq; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcaqOliq"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso353064a12.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782989315; x=1783594115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HePeeifvB/opdYPmqi87Awn5dRCasskHjfVg9hPOIo=;
        b=dcaqOliqF6MY8EexIiXb648nQZwaNGFs3qvOJw4YX++pmySRFPvLwFEPUK/Vfitou8
         rsGc2q//f1THizj95QuNICYojijxjy8+74c6FZDw4nWX0uUoRnTrOup8LqIwSNRuvIgt
         Wt1DTGnaUV1hfzx1gu9kVvxEusUS4Vaf7nnz8ffpwZsDhNNlCtXCL+oA33n6zuv7BnGp
         4JqP+DY7D2CwpguZ8J7Kx6FLPQD5M1ypuTHFOL2YTS8WzU5+f6/X+U3BE1Z5b8NrmVsn
         8OE+7OZNHQBcgqJMa8FQMDgYWTm5Vq0NKDUebD+xc3kWAIZ1MOTxVbXf3HO7/nGNAzPw
         R41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989315; x=1783594115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8HePeeifvB/opdYPmqi87Awn5dRCasskHjfVg9hPOIo=;
        b=X9hGTMcj1SIyaMrgDsgNXOdyKjwpHgnx5QPskBeoWYDAkVXWwiut8rm6twJlWD5Z1W
         ERb4QiCn5vi69KDzqnqRv1VUuhbHDY5t5RsrFA0op5MvVXHYSGVA0nr55LmQN1dndND8
         uuaLwCNQKo7A9qzeiEHbgJ47DPAilXlc73fdPMs93qf5QchzOPw/3ztsu9p+an31WMmk
         KNVLhGx14Xj+llzGSqcC7wU3Jp3KTx4qkvs7+h54TDIDTb5qP2UBeWypAp7Bu3pDUeEg
         vweUKGfUOEYtijQn/7LMPjfJJlQQLM/EWr8iKT0sjIH/bbiDkBPqaDCwBm23QrUKE2my
         GqAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ic5n3qgjwCF+gPE/C5Amap3ZoMLOXeamWGxwMkRYfGIEYmN+FoP4sGThleM+j5zeSD7yY+PBw8NuD@vger.kernel.org
X-Gm-Message-State: AOJu0YxdXARySyWuKPyW/yntLM29sadBL5R1CIjs32wP14B2OungcFzt
	y+hddxUhK8RacWsorlME1tVh0Hcm6GY5gCF2wkbnZpD3ylOcSlGxhYj4
X-Gm-Gg: AfdE7ckMm7A/oYFDXiMsnQDWMwkA55FWYzKjU/FSxMZROm8YTh1gMWQvrmltPSUp0Xp
	qpGbtQNFAJziw0u/b/NWsssozlexZfDW18N2wqRece452rK7gJv56FSoNq0XvT0s/OUmnuPmoBo
	qJnCIpR64V/anKeqes5SHrK59iD5Ygy1sibkE+xHBW7ZkvCTAc1tkG6NKHsapch4X0unt31or6U
	NsxIyrnwG6tCuuxblpiC05cIsXhJo9r+MQ5qeZ1foW2oQra1ffflLj4nf6NwwTPk2ZDva6WCMmV
	TK5jdp43CA78oeVVlifHfVJZjklhcmb9rzT3GSE6HmwzFR+cDqW4ehSewFRmVzNZemlH0rSkLmq
	8Pkne9vJlb7gSDy8aHHq1tStHRZM0WbgHdzzpQtWucnabQpZVr1jM3TqU/B0lVHlt1F83crHUnQ
	NnWlforlbLreFniSUjOD0RnHun3h86o2+XElvLuXk+s6WQg2FlTXzfUh84ohmGzD0Nx40ujFFw/
	rxK/nEGzFgqvj9mKM05pZjKnoe5/l7aCt7T+nBCMlM=
X-Received: by 2002:a05:6a20:e20f:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3bfed3b26edmr7042853637.37.1782989314653;
        Thu, 02 Jul 2026 03:48:34 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f116065c5sm5936815eec.11.2026.07.02.03.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:48:34 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com,
	bparrot@ti.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jsarha@ti.com,
	jyri.sarha@iki.fi,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	nm@ti.com,
	robh@kernel.org,
	sam@ravnborg.org,
	simona@ffwll.ch,
	stable@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	tomi.valkeinen@ideasonboard.com,
	tomi.valkeinen@ti.com,
	tzimmermann@suse.de,
	vigneshr@ti.com
Subject: Re: [PATCH 4/4] drm/tidss: Fix sampling edge configuration
Date: Thu,  2 Jul 2026 07:48:01 -0300
Message-ID: <20260702104817.1219078-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
References: <20250730-fix-edge-handling-v1-4-1bdfb3fe7922@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

We tested this patch and it introduces a regression on our panel.

On our board, a Toshiba TC358768 DPI-to-DSI bridge is connected to the parallel
RGB output. The bridge requires data to be driven on the negative edge, and
this is also reflected by the `ipc` variable in `dispc_vp_enable()`, which is
set to `1`.

With this patch applied, however, data is driven on the positive edge instead.

According to SPRUIV7C, both `MAIN_CTRL_MMR_CFG0_DPI0_CLK_CTRL[8]` and
`DSS_VP1_POL_FREQ[14] IPC` should be programmed consistently. However, if we
follow the actual bit descriptions, and ignore the sentence saying that the two
programmed values should be the same, the data is driven on the requested edge.

From SPRUIV7C (https://www.ti.com/lit/ug/spruiv7b/spruiv7c.pdf):

MAIN_CTRL_MMR_CFG0_DPI0_CLK_CTRL[8] (DPI0_CLK_CTRL_DATA_CLK_INVDIS):

        Clock edge select for DPI0 data outputs

        Note that this value should be the same as the programmed value of
        DSS_POL_FREQ[14] IPC.

        Reset Source: mod_por_rst_n

        0 DATA and DE are driven on the falling edge of clk
        1 DATA and DE are driven on the rising edge of clk


    DSS_VP1_POL_FREQ[14] (IPC)

        Invert pixel clock

        To set data to pixel clock relationship, CTRL_MMR_DPI0_CLK_CTRL[8]
        DPI0_CLK_CTRL_DATA_CLK_INVDIS setting should be the same as the [14]
        IPC setting.

        0 Data is driven on the LCD data lines on the rising-edge of the pixel clock
        1 Data is driven on the LCD data lines on the falling-edge of the pixel clock

So, the proposed fix to this patch is:

```diff
- regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x100 : 0x000);
+ regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x000 : 0x100);
```

Reverting the patch also makes the Toshiba bridge work correctly again.
However, we can confirm that the patch is needed, otherwise only the
positive-edge case (our case) works correctly.

In other words, the two registers need to match semantically, not numerically.
