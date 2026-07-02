Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A92B390221
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997235; cv=none; b=ddq7HqEptNniJnb6zGKpQPTamuc0ndMHIouaeTz/X7x2yTTAUH/JRSfn0M/jVFcKvJmcmr+7tjm/tac1EnYWoaIElrgonaFDfKF+YOeybaFZZr55CrBoyITDGJKmWp8Ywcjey0zz4BOsmByEy8nYtR7ejGlML2EOyLSEPHmyqU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997235; c=relaxed/simple;
	bh=S2US6hsMSbsmh9aIzwrsWN9LZI8PysP4A7CuAXv1jaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b30WcnXY4UfPJltlQ0z7rl3+lFhnBoH6BdI/umkpE/IT1KyGiDl0nWq8zz2vRJyDQxKqn8RXd598v1e2/ZLauHF70VxaLlSHzw1byfNjwlGQvA3dR1i3jdIPf14YiwlgLmqSQV0U0cI9D6GT+n5CYHQmMqeN+6ndWHBZjiuMqlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lV3qz+hW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lV3qz+hW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so21255585ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782997233; x=1783602033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E44Sgh/fBb3+oxPV/igqOovjJZCJr4T8Ggc55Eveo0=;
        b=lV3qz+hWgGiP/7Ubojgx2Kw4DAxPXd0OQWAKVGDuEC67aDe0V+INUXctqL7vdjrPAW
         iXKN2yj5aU3IYgcLwiP5m5yx2ylvFeFRYDcA1cRO4gKQ3/kVbug0GBMbdDVvz1JtHo15
         ogAIEoW4oR3+xRPC8IweWdfQXsFxtVDWWxO/kDHop5QYOFNgWPkrulXJrTuCziENVK3y
         rWobDHGvNMzzTHqyVRhHK/xAIFcffwrK+OlhUfejaBj+e+0z1I4UW1d+bwcmSEeyMe+x
         VenTyYp9OZocdCeDsfu6v+ZkORy+EGVvh0Whhbz6zOwwT06z5ekvH8VTKPx6/SMbt/DD
         vjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782997233; x=1783602033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1E44Sgh/fBb3+oxPV/igqOovjJZCJr4T8Ggc55Eveo0=;
        b=f6L+9wfN9eBnjN2pUWBm+UfrXkruG/JIK/2wJQ17yYOBRTtI5at2txbIPZwjLFn3GO
         ncT/YVWWpGmMcIpgDNL3N7F61i9ESd837xO0RYovai1eHda9o3m3Kl8d8bjOnDnYi5gi
         FKsdguG5wDklVfgvRYuOKUoD6X8y1Tj9Knd52olbV6kJsDOXinYGwk+59ZMfAJod6bXd
         IcS6M7M7aaqGXXG03ttfGrrdzKGEGHhyls1PlxJ2B4x3cKEDHWG5gveEMs8USpS4xHjz
         PjHv+yqd+3BsUySq48wqcFV7iElNjUjJM/nSSghnZfQoMsRXsdCn94s11D3tw+uK0Fzm
         6bhA==
X-Forwarded-Encrypted: i=1; AFNElJ8hAJX5aWGnH51ZGq/zotICkTdfIl0mhbKW4wgWOc1X2sE8tBLM6DISJkLzr/n0si2Tt8Fmm3WK2KZr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr21/EsxqcuzalmtsTqkO24A5YfdWrogcX6dLlYq6lMk+a/Thf
	QJadN/2fZUkeLT8akrrUHU9euGRG5SKW3xw1s/ZyHWoUKCrhkAoeNqIr
X-Gm-Gg: AfdE7cncFLv6ME4spgH9pWoxGhLsbj1jaZhNV6zMWxlN/d0oaw974hByCSnlS1VSYyO
	Aiwx0YoVbhY14/7YgqUhjZLaSVHZ0E8fA/57TsHQe30ZJzaoNO4Oasnlsk+5a6gYM4R1gHOxbEX
	0NEK68soPSveyG8pBbXYME1wODaaSqoma7S0ks5qFDyc/HYTKanLsX/mDW7tg0f1L9ZzaDRKms5
	hloJWrtM0yr3rSXlcr7Y/RMJ9cQ+GIV5cgGtf7a2aZCKDX+TRK0+XRPWg0tSXGYkuuudhEx1YJu
	G8qVFdkDR/rZPVwRABmv3PXjTs/8gmw0Kx+I920451CSGeiNyWP9bHDoFBdyYr/rLl0yImOhrex
	3pqorQjHmBmiqTiwndkNQnXmgPsn05d5kFH3hZe7KR4afBs8ZYYVs98OHYQnMaImsjl3Bob5q6S
	N0OKbjvyCax4QC8doPmCjngHJoAPuTFfGbleuAzkI3VvF+rK9VV2NaA3rNYEd0QNlU+vp+03S2y
	4VIl2KZ6ZYiCiJ/Oy8GMmu7IBtal3ULxt2csNXCktw=
X-Received: by 2002:a05:6a20:258f:b0:3bf:8b8d:3151 with SMTP id adf61e73a8af0-3bfed3efa54mr7187075637.44.1782997233311;
        Thu, 02 Jul 2026 06:00:33 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f116065c5sm7279613eec.11.2026.07.02.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:00:32 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: s-jain1@ti.com
Cc: airlied@gmail.com,
	aradhya.bhatia@linux.dev,
	conor+dt@kernel.org,
	devarsht@ti.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	h-shenoy@ti.com,
	jyri.sarha@iki.fi,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	louis.chauvet@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	nm@ti.com,
	praneeth@ti.com,
	robh@kernel.org,
	simona@ffwll.ch,
	tomi.valkeinen@ideasonboard.com,
	tzimmermann@suse.de,
	vigneshr@ti.com,
	leonardo.costa@toradex.com
Subject: Re: [RESEND PATCH v2 5/5] drm/tidss: Fix sampling edge configuration
Date: Thu,  2 Jul 2026 09:59:43 -0300
Message-ID: <20260702130010.1238089-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106141227.899054-6-s-jain1@ti.com>
References: <20251106141227.899054-6-s-jain1@ti.com>
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

Please ignore the previous email I sent:
https://lore.kernel.org/all/20260702104817.1219078-1-leoreis.costa@gmail.com/
I hadn't seen this more recent thread at the time.
