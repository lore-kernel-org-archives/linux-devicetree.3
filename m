Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2EE40BCA4
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703144; cv=none; b=ghylLxkErvMIYkxvz3FlzhfkfpVmApomGKZ4faUyU/nEPe7swqEN807ph8HpeRPZK4s/D+brvdV+LQ/4uMkWS9Ua1Xgt1X68JHHxrTOgdHHywfppXfqVbx09OXEfDCgcKdt2i2Np1YfZtJU36OtFubdwNerZzwRE5L2DOio95qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703144; c=relaxed/simple;
	bh=4URic/YHvxH5xLegmZ4O43fEyunuuhWo/oprktg+16Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ul74DWsutnPUkvKshrJp6KVOt7QFcgD3uTcj1TxAYwz09fsH9luYqyCN+becBLrmBKbovgr8k7Q5Sk2Lv/nA4zHJ0ERfM9RXieTmAINKvouKYtw3bvxHcehkjGewcuX8IZpnaMS0WrtjcnNQVDY7kwwkutj7yM745X3m6Kg6tYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+5dUhKp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+5dUhKp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490a76757e5so41728595e9.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781703141; x=1782307941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NIxcJIu7VDuVVex0+dWXJoND3UMHyaLtOOKZ21zptM=;
        b=g+5dUhKpA1OPqHoKBEN22rAtPkpd/NGIDyESFuEIxTQG03g0ZW61WElzZWqGdMEJMy
         hhVJKhV1zzhm7UJ/1sdN1CN/zdonSFOjBXjhMksvD/6KYQ8yqh3T84uQKWVfZlL7ZqjB
         zg8TRId4knan0WAgfiLbx9s5k7fUqOfEASCGQuyo0lZOKTNcAPtsGeP8FMVXMUZM9IYL
         YYVedlRID++uKfsWm1gyhSpDj0Yw47fbmb19B8wHDKV+SPTlXfsZsWSy9/8875CnOPrN
         M9/ztdrpTokHlB1qtLfct2/1jEnNVu4Kz5DkjxSBC929v6pjMbu1gSw74O7XIuzcdty8
         bavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781703141; x=1782307941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NIxcJIu7VDuVVex0+dWXJoND3UMHyaLtOOKZ21zptM=;
        b=FlSEsA3YE4Hnc+qvK8JTctKZeAiVS9P/AcuhO90aUp6cFrPQbj71xQk2Gory5RBZli
         65d/DgiLto22ntW0ZlKrq9osrou/wqLEuWCvcnOKSnBE9+oD98G0rJZXeK5kXqEZuF4t
         pYB2/DyQQugYAObesHdwQ6VSLqfa4h6FWyQa/jj+3s6jKOjbH3GDg7wpNcQZ4eLMNHC0
         oBHCQluT0MOj99RBkLBOlsgdEwKaODcXty8+428Fh1GrskWL3QFnvKWahXNwca8xw40D
         e4wsM7f2e1L4zB099QJOjCfgALnsFW8cpt5jMIeu2+G/H0bc0CLUxyEqFvJzNA8UU2bo
         b63g==
X-Forwarded-Encrypted: i=1; AFNElJ/wuTfPpPyKl20xXC1yVd08+UPZyAtsQQ9Re6Y4Rpo8OCNXGRGu1Y2I6wRIGva22nyanfum7uZGsfvt@vger.kernel.org
X-Gm-Message-State: AOJu0YyRGPIWxSyIL5h5tcYRypU/xXNTm9ySVF2ih+d7peS5aRkSSQeB
	LHUZ+XpVCw10kFeqZ9YSryVYWQSv83JmHn578QpFVmDsWkLojtg1HIa3
X-Gm-Gg: Acq92OGgVEYEP6amD1kfO2xGK+DYKUKZv+KiKbVG15bRfxUnaRqkPLUAJwDbXTGqcZ9
	BkP16tluD3KzxCeTlwGUJLZSc5x3hbXp+8P7WiSkb39MaE/jhM8nBujJlp9wPlMpb5QDbJXzert
	G7e89KGA42aBCaCWlGtvjwoOkFcbhe5Yd5pa9rxNmglcSEdKp5k28XPaRp1Arw/2IVfmudzlJSO
	mCW6GEFkA+FjBXn9vnmckNoRH6XGc4jmJnvYI3PaOIsEQY9yjR8Lq5rRDm4jParjCmmgLk6CTqM
	VoB484RMlUnHbvZ118YsPUZ06UAK86SueL/EWEVZPqvAQonbU+Q1aiTPa+L+0smzHVhH7OVgabo
	rosPa71i3VAn0jPR1ew7gLn+udBjnwe7OeM4fLTBwPgnxMVaC31CaI42OWjAwAvX7XEB1YKXX5R
	UBPiCLtWe7NK2R9Q8wKPH5BDo=
X-Received: by 2002:a05:600d:84ca:20b0:490:c2a2:b1d4 with SMTP id 5b1f17b1804b1-492333f7f68mr50961245e9.35.1781703140793;
        Wed, 17 Jun 2026 06:32:20 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a0e9e4sm147795145e9.0.2026.06.17.06.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:32:20 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v6 1/4] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Wed, 17 Jun 2026 16:32:09 +0300
Message-Id: <20260617133212.287768-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260617133212.287768-1-tmaimon77@gmail.com>
References: <20260617133212.287768-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPCM845 timer0 node references a single clock, but its
clock-names property is not described by the timer binding. Drop the
undocumented name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index c781190b42c5..9e4fa2669f4d 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@ timer0: timer@8000 {
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1

