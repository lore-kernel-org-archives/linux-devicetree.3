Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13662C21F7
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453755; cv=none; b=sQHoiLxqJOFfK1ekt17TjtqrNZ1rIiu/3pGOgoca6iw1w4MJ5qNSXKuKXXqFL4Y1+kqoGDCR2GuKHzhqbXUEaPgmlwyFneEgGfPwlLDIRoML+XO2Wp0Qqy061+E8Iz+a4i0jThrGO+DA4N2i5w6vQI7MVmro7LQIfZUg1PUQGBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453755; c=relaxed/simple;
	bh=9M8qcy3GHoRqZek9jrO88UWNLue8IWYXVgIGIjRr7DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grneCpengs1Kyd3dkvTLMQ+w+strgBDiGePB+9Sx0o43QcO9VU+XXY4pSKXqAkugZGcOaBgBLmfU3Cd5/bEo09lA4rZdeg10BQdD9hik+/IpDmTkfNfgqW0x8gaUAJZvWFO3jlJQu41wd11tFvMLBpSDRL38tva0EhtnykzegMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIBz4o6b; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIBz4o6b"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso23008865ad.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453754; x=1782058554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2wi3fuynWN++wbFE7He/JKQQu5s6vMv8+4f6t6QhDY=;
        b=nIBz4o6b+qsG2wR7FJT3hGhFf08NtsllNrGOSKgz/kmuKDQiJWBbrfaE/MD9ZjoGoL
         OIDzv+bShBfYySQXD291RGCdQWJylWrFCBrWmTw8Ta0XRC6wtXlGCXVARYZinmfUx/AA
         CVxg5bYmEVbWYU6CfIJ86j2+v1o7oBIdHnE+OgRJcC+AjBPMAmaMaxZLFQsT8EVB8zDa
         gOKj6fgTMJIZ1GgYPsC8KfMjjqnPinplG9V4aBb38CFXxQYKt/UOjpCLcXgxTIJ515cP
         4bMjCNZQFAD4uPx5NJPLpAhjKP8JDdsFWsmqZ1OZvV/xhfr7g8ip2fyh39gSiqxq++ri
         k6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453754; x=1782058554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2wi3fuynWN++wbFE7He/JKQQu5s6vMv8+4f6t6QhDY=;
        b=q3jBuESI4KG4YoqZ+yS+zZ3sI4WHmfEkCcfT2JtG8LZlxvTjKQLj6Clu0/efvfEr20
         iresEudk/5euaaVisC4AVXBs/1ujm3ZGHmdPzAdMlvU8rQN5emdy2NMWIe2kj92CuiMp
         2PXgDildCvEQ6kHJ7p3bD8H9oHYhaVG5l030HMta+TI8cn8JMqEqSB+55184f3e+2E6e
         vbNYZACKOmlgfv29blDYp/atE0vJWHGHPc1kYV770r+Nq/DC1GNqKd6/yg+/8gC9oJ4O
         zUqaAlAHlWl2cmcr6kh8WmbpexbPIQg0K1dOWJjJ0orHHvDRHIr87quI45HF2reNe7Iv
         RlUg==
X-Gm-Message-State: AOJu0Yw75wz6KO3GwkdQFNdKJ/X99jsTlgSifHbcxrRG8uwECjwWcCAi
	R2xYLDkneBJCEznWoU2j1PKixpr0voKjJ3YChA6RFQ/uJkO7LHvNCeJJ
X-Gm-Gg: Acq92OHogGdJew/hy4kEyhOQWkC3JUaIGIpFDLQgVyKdtsmmVhKADahcmGaNZMquSF7
	vnrmdJ+yoXV/6kqWu1vsEgzoN0NfobwTrp83gsxITjDnq89i3pYAYTXEO1tfpzSf6Yt458oGnwr
	/dAVwtTM1grO1YXzyNxa6DydZXshx9DcAblcOkb508ubmHpaoM5SxwGH9gaB2qtKWCdIeeVelvQ
	crtNfoNR/LYU7Q96z74MVqPjbw3CqRNbvHIZgXm8wy8hYacW+YtFjM0A6vNsEblTxiPd+NpYlIU
	nOf5Z5z4GlppyFYRn4r6KRzQtgnT1lAD2Lo81NOpbZ9FFjNxZ06NxWPOtqHON5Xs6OVAf6sW3r1
	wH1nWeQdsCDJ3uXW6xS3emj/J8QWjJhE0kociu/EoxLMkHo4UyNK+kjsf6iZ1FTPYBdpPsr2E2p
	TQbhxDyjnzzQ6wJ/GqDg==
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr130859675ad.5.1781453754016;
        Sun, 14 Jun 2026 09:15:54 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:53 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 2/3] LoongArch: fix misleading elfcorehdr reservation success message
Date: Mon, 15 Jun 2026 01:15:02 +0900
Message-ID: <20260614161503.2219681-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614161503.2219681-1-ekffu200098@gmail.com>
References: <20260614161503.2219681-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_reserve_vmcore() does not check the return value of
memblock_reserve(), so a success message is falsely printed when the
reservation fails.

Check the return value and warn on failure instead.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/loongarch/kernel/setup.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 839b23edee87..702fb3c2b3c9 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -255,7 +255,10 @@ static void __init arch_reserve_vmcore(void)
 		return;
 	}
 
-	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
+	if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
+		pr_warn("Failed to reserve memory for elfcorehdr\n");
+		return;
+	}
 
 	pr_info("Reserving %llu KiB of memory at 0x%llx for elfcorehdr\n",
 		elfcorehdr_size >> 10, elfcorehdr_addr);
-- 
2.43.0

