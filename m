Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D82C21F7
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 16:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453749; cv=none; b=Ed6uLVZmKNaizgTkMfneas58hZOgwlaVN+dZH6Icy28dSiNo72e/ZKt9WSxiAF5z5Jzh6H+7GSHH67FqTe7epje+eh6OA5sfUKtgucM+VntPnfT8e57t9X7v6+jgsJhtoXUkiEdruAyQTLqrrVsk6vqTMmBbflFsnLyWtSDWWM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453749; c=relaxed/simple;
	bh=f9WmRG917lwuOo8YitFWlgl0yJ3KRNNh9qbjKjNywos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyCuNcFM1mJP2ZXgmvJgktgybL8iQYg+UFc6vy5umx28Gn6BDA2v8zrMnuU/sM6b8Y1iFfoY1Gvx9mlG+Cg2z1RVyvTPscZPq3Rxgsy6cuetgv5Bg6JZfe6Fl8bpN5aqMaIZF9+seVOcKKNNvxkH2oszvyW9Yp/iN8fxnWaOddE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CamkcpR7; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CamkcpR7"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so1768697a12.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453747; x=1782058547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZZ7P1jGg6gmmhunWNSiUTGdr5N9WczZ+9YDzkn+QNU=;
        b=CamkcpR7OZ73ieDWfCcJYD7MRPTUGXhuTr7f1329UhwDqEiSmwPMvtiRCmCeQeXAOz
         ljrBX7N+F9iEzO0ry1bWidzJPql9eDBQfBg81H4N4Y5kfQCyKlI92lop/9VUCcj2fhri
         5tk63gicBHHwb507RAZZlafnD1tgisDM011AV1+Vh1phKe3WewnpZUtx0PxmhY0Vn2Hn
         QvTq3CDJMkLCRhHkqxGgY+QZMdi9sIY46/9mwgefHFZWiXJVprXc4ZawNhA289PjMKbz
         89PmCo5hTRVEQ+HnEru121dFBDGaadG+Fz8fiRt7c+w9OHQ1IjSTzBQH8EOU9cOvWH+H
         O5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453747; x=1782058547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZZ7P1jGg6gmmhunWNSiUTGdr5N9WczZ+9YDzkn+QNU=;
        b=lXzlv05Rj4edhRahLOLLgdaAY5ofGI4OzNK1t8CrzA+zO8Wb7aV7nAmAmPTrZ+UAiy
         RukRirOwrOQxtjZLYyQ0D0ujtAtGIQI8x6AKy330DTg8aY/E5CHqt28rf1/EipaYNrG0
         nNA1Tq9OoIPa1TWFftqy3MfUzzWHRJ1Ebk9RPIib1k6W2NVQEZxvLv9BSJPSlWtitwwq
         s/AhDQkOt61mVBtpIfUq6+oBVaiN+b2QjYmsJH4a2T47FY/Qh5CehN3Mp7lAM4Mr43xv
         S8KrB7gTkxVIs8vDzbYzxI8tXXv/+16+AsDQsL9auxr0hUgWTeOgv9fO49ZjZ2cEfMJ3
         //qw==
X-Gm-Message-State: AOJu0YzPMKB17hlj8OakXzLjceN2tiwmbouOgIMFw+S+hl5f3/Ttivej
	iNQfv2KdC6TN8tbAnKd6Jigxn+JpYRoBTzykxuoFTPk1HG5NnLY7/d3o
X-Gm-Gg: Acq92OHJXVGjR9gODuDz+JalDL8Gw11r+Klo81zf+Z2PTGiakPigbI8p74oRDZgvs6+
	YPin5pdB/JdvzcsbgFdYXRxRu2sE6X9NooXEcu69Np7x71pyW5aHNStlTyrMxxkuKAMlBGelElB
	vX1JiMerVNGdOnxXH0ZzpD/HdO/GG2YtKnX5zpttF198+sLKj166GB4TN2deb+uJ87v419xXlKQ
	JHvZKdQFQC1tXiX2Bzp+Og0bEb8vwLqalrpXKGH6sUCF4fpDYWC4/bunPT2hSg+S94Zu53X4mIX
	KlWefiHXCRcnkRUXrRoPZCFxr42OEWCSugifXgnTo+oHjdFJ3nOfA0SyTib0yyQ8ejKY9vbIUss
	PoTOfYkff+jrCEQLlgNovHF06+RJNDWkEMmsPRcVqpy5/wcMo0E3TFxo03u1mxxKedOa+L8T0Yw
	3rOr3ka3tuRg3ruljoF8bow1cXA2bs
X-Received: by 2002:a05:6a21:3115:b0:39b:9644:6e94 with SMTP id adf61e73a8af0-3b783c76cf4mr13112661637.9.1781453747617;
        Sun, 14 Jun 2026 09:15:47 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:47 -0700 (PDT)
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
Subject: [PATCH 1/3] of/fdt: fix misleading elfcorehdr reservation success message
Date: Mon, 15 Jun 2026 01:15:01 +0900
Message-ID: <20260614161503.2219681-2-ekffu200098@gmail.com>
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

fdt_reserve_elfcorehdr() does not check the return value of
memblock_reserve(), so a success message is falsely printed when the
reservation fails.

Check the return value and warn on failure instead.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/of/fdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 26f66046cc32..d985c07d7c5c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -479,7 +479,10 @@ static void __init fdt_reserve_elfcorehdr(void)
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

