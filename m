Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4569038B140
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375639; cv=none; b=om4ibYR6xjtKFGziG3GjE5CxPT5ZwmI6TXrs/nRNePm5Xpa3eyxcyZAAWKhZqxq4Ea2olRMUTqnz9yMWznZs7LzT0SyotZ94o2QjXthWyoUM1vlBf24D7husj775fB2pAF5H7zH4qUAOfYNcxtUJSK3RS9QX1Ukg+sAdGWewXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375639; c=relaxed/simple;
	bh=xSsTA1+Iig8rnrr46UdcEnmTqyfP4pnCIpRKT/lZv4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=htEsJhHYCgu9fBOHCGCdaaT90WRCUMQ5JzxTwfzaiKkreWWlO3ogfRWlp139fO/esbMr7+Qk419jTtbaYfhYktok78bgQCFWLzT1c3kl7ncP97SzC4V0wDwGZHFO1nAdm28PQuCLoMf+4iGlPH90oPTB2UbJBW9gMYp6waL8Lsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=DWhDb4yh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="DWhDb4yh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so10054085e9.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789375636; x=1789980436; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BiGb6WiQWJmFrzRKswfmgWeyhlzVvwsEuctPqCr7l7Q=;
        b=DWhDb4yhvopwPruP5Q5F7OZ55DAV/JpMAJOdPFaA24t6+9ac0cAKjYWxHgYAPhRgjj
         yVmNB6lJeldStVpTsV9FM4DdXcSYwFA8NRH6jrWEzWvuQcOhHKPUm0/uab/+lAyTQjmh
         N0B5HZd7SzlMxUvDfplwpTKwnyXwJspCFN3l8XZs8jqUhSwL2pgP338t2nmqLzF4eesJ
         7NeSQhjXIp7yk3y0coMmcg7uW5uSDlZa08N3oNLqgHEOzrm2x0qWtpazwLUTfaIRHnSF
         4M1UlyQUrsU+SyE047LTcUsXZPHpuVkBj+f88rRqHpAr4ODCmomaroxdZ890npZrpmP9
         tifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375636; x=1789980436;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BiGb6WiQWJmFrzRKswfmgWeyhlzVvwsEuctPqCr7l7Q=;
        b=CbY9UN3mCiqjzxyIra9HUzQkwiMR43uxnAIc2s3LEQpXFl2KtXEAlkmQoWS/rGwGB0
         BhF9Fi1U3GNRGj++HC+JgyNnVV/aW0I90E0oiKWGB/R6VEzrQy86HfwQ0mPlJbISgod3
         qhhi59H569kaK/xWzKgJyNK/fGpjkvLnPzwWG1SDvCCuCVfnxsd0zNgrNkE+7ZBWR6ko
         8P+jOe1oKVFItHIcMLrdxOkKXt+mFW8OY+oxXeXi5K36Hc+2l0wKUbcJR3Faouw1oTRx
         K9rvMC5VQwblGtreMB7RlwWOBAgOy8VRrz6bTRukxKRDxNEpSeWZD2qo9Og6e0W6Svmr
         AqqA==
X-Gm-Message-State: AFuF++lRjCeImvGxZVvrkhHO8taOiFwHwLHZZWN6CS7LW4ZZ8+a8eKHg
	tUG/bWT1aYwPVZe/Pzl7JiJbzYRW88CCxjzpbr8FWbUUOsNAk5OI3kV0Qc0mlsiLYRk=
X-Gm-Gg: AYBFou0d/d92lhjUlRCmASKyU5uKomTTmLps/9U9PlpG1Yl1469VUS1VlGjel5rEpC5
	1wR2sgXZ51iRbZFhoxoH8jrqliyGQNWa794rFcQDhS0g4HmR+ofJfcNLd1nWoO96iu4SsFcuJ5z
	xFwDYdBN7wCjiVn16eEJwHLS/C2Blk52/CKQkDU9dkwpzCC6b3C1fK9EwobKNf+IU2/cjRUnb1F
	usKD8JtyhnjbHaYY3xsNe7dYAA+KDl/eS8dHshgsa67ZtpHpRZj+Ldq/x92b3tuFYIDPmNWFvAQ
	fSltKDB8yfv+hP1yS9IY9OI/rg9KTx2581xQyfDZoLyCoCItz4zaFkc2JeeJJh2ERABQk0EZN/P
	qSG/HNO3B8xPtSGq3MUHojtisJASaObCRdxHn46NK5D3CdW+Gms8tWuZQuWSnte6AxcJXEibmvj
	mIn2X5kl+Hpi9g/MKUHYXuO4QfclGv49++H7dwP1PpJRVuPR1IcYdlSmh68XsNEaTHJJh6Pv++z
	hxXdRQweBe3dINs3Fpf
X-Received: by 2002:a05:600c:19cf:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e7a663d35mr22293075e9.6.1789375636366;
        Mon, 14 Sep 2026 01:47:16 -0700 (PDT)
Received: from alchark-surface.localdomain ([146.70.184.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6cc11607sm199520805e9.12.2026.09.14.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:47:15 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 14 Sep 2026 12:47:15 +0400
Subject: [PATCH] arm64: dts: rockchip: Set gpioN aliases on RK3576
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-rk3576-gpio-aliases-v1-1-ce5f86f9ae0e@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IWqPxKuIipqOOLRoyKgXx7
 k3r8i3+P0EoMAk0yQmBDhZel4gsTcBNdhkJ+RkNucq1MtkDw6soK42j5xXtm62QoHHKalXXfWk
 GiKUPNPDnf22727L3M7ntt4Lr+gIIVSeBdwAAAA==
X-Change-ID: 20260914-rk3576-gpio-aliases-9c0a6088b59f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=alchark@flipper.net;
 h=from:subject:message-id; bh=xSsTA1+Iig8rnrr46UdcEnmTqyfP4pnCIpRKT/lZv4s=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQt3zKl493uJBmRTYsfxiasex+ntehC9OljXSWFERvsA
 mfd/1JyoWMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpblZkZPgc/9Zs9pLzqxY/nhGV8HvV+a4TP/0nLDXQdtWPW3FtodMhhv+lMQ1
 7JS9MP6Y6Ke9bbihns0MOn+PB0x+cbJRm7zq7/DcnAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

With no alias, the OS is free to number the GPIO chips arbitrarily, such
as in probe order, which is what Linux kernel's rockchip_gpio_probe() does
if its of_alias_get_id(np, "gpio") fails.

This results in GPIO chip numbers arbitrarily shuffled in userspace,
causing confusion and pain.

Set gpioN aliases in the SoC .dtsi, just like other SoC versions do.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index d418bfc04097..e87ace5d05e6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -21,6 +21,11 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &gpio4;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-rk3576-gpio-aliases-9c0a6088b59f

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

