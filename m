Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F062DA749
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288274; cv=none; b=pzaO0AgPirs+Virt0bSr/mWV9M3R0GggHbbbQysICFIyvcbOcX7ADyI3ElbOCeZRKiTvv5u5senneETl0/zHV+A09nc9d3FHQbkO31s/s0d87N67C6jLE1kr+62tuCkudNQ49dtcCZGgK71LUyxJ0pfuqnfkkpw8J6ZTmD5zjr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288274; c=relaxed/simple;
	bh=9kuNkMh30cWF5g7Vn8rhOkpm0/QjdCZ8taduOQM4uQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsMuu4zdytCWoBzZ2spjKBXm5SAC6xRGIBN9KSDgc7L2s/BbRsbjXWhDKAqBr/ImFdJ1+w9qdWRLIRBpP426D/kvIcpT9bbbnW0rFLef+d2qn3ladPWYm1zF1zNMbOHvwMcSR+F7o6Dj3noiIdZue6+Q6DQI5X7y3qvjhvdE85c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frGtLM15; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frGtLM15"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce7d2adef4so6848955ad.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288273; x=1785893073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0DReSFbvl/l2HPJej1GugpIyErIl/Q0rTs60WwHT90=;
        b=frGtLM1532KNnsN8iZQO9oujNc/sSNcg6vNDlr+9NPAuI+etYclDb2jy3N5kFXg6o3
         w093OxNAopQRvPc6ZCSH+FLtAN5CTmB5CGRkFFnigNsRMlpT7xzTmxCyTY+/yZO4US1H
         O9qEIv+ttnyfBWITD8aeqY6wtjGLZqxxOpwqyBfsoMeQFeqnE5jNWA5XseIQrxRKSeMy
         ZfZU4WF1aCmZsuJa927QNMUxzTTrAxSBXDXbs8Fw8nQNb4i/1BKeo+5soHje/J3lMpFW
         7A+3hww4X0xMWhkOLTBU/EkoRY8tqm3MCu9ftT2IkWoE2gUafDpfF/AoVOCWiB/txerR
         fGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288273; x=1785893073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0DReSFbvl/l2HPJej1GugpIyErIl/Q0rTs60WwHT90=;
        b=j7eN6lrZJGQcPOzv+jnyvErJDQa0hIoexM9TDSfJmB82hrP68r6GubSkUi/UXk6RoV
         gLZ2W6M39V7/pSx2Ac2cNjolZeiW8RMjzkya7YKP2hb10BQzb60IsiwJxPuIkjVAdxBY
         L61cg0UIqoNMQmhhkLSznC4Busqp5WfUVR7TiX0DmQABI+d80op7LAGRHLdDxtrbhAOY
         2CuuL63iDMEBH3xzKZdZnu2xdMiCgaI46N33kRbYMMrrj2NyE4eM2Yh/TaTSfTZYN5hh
         V+XqJPngI9i1a/35M4jrsDREP6pX1RDdAGXn8rgLbJIbE3iszU0w/HldAcY75jLd8LK1
         NMIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxiFEDuziXeaLZA45KTIIP8J/seaY27wCChEe+Yn5uozPenjkc7mmTV02hQ1IFECNGu+7+ecIq+IH4@vger.kernel.org
X-Gm-Message-State: AOJu0YyFnsggt7Ay/Liw5ByO5mWyXc0WlMkF/cALL1VewjDqerPTuXHr
	oC13Euei5JPd3ONBDEmLLxEu/vW3G5UxPij9we/FJpeTauuViCxD9UUe
X-Gm-Gg: AR+sD11H0M6sEqD3N1i4R0FhLZ6TAG0CIqkG8CaC9YT+z5m2S2/WFjIYMH60JGK1q+q
	Yj7/iUKttqhtI9owmGbGdSazIDQm9PfwIT5o1c3OwEt4nTtp2iiyiX+uY6/E38UcROnb2Lx1Wd3
	jHIKsAZ4BN0CXYwfSlXgDJkIb9Q/cfWUoid0abELi179neCmHPkcYyBzwAxfi9HhA3zW5ZtMHeh
	5M63W+9AURgH9nuMFjEV0b0O6mllTuSAxKcEOv74sh7SCKr61Rwx+sZ/Fr5pCKNBkDxgrTGu3e8
	aiP84yCvv7NSIPH6fglevJMN7SlDrSdwjMQYk1bOfXrH3e9GB4COs1iuDVF2C8p5J2hjEV0o1UF
	pqs3bjC8lQK1NJyw3a4dOMPYmt/lsrk9kRdflL5KHHevKV5FpLtB00c0l1taDEDewzVBje2O/UT
	uii2NdRBe85TVbNqKHg3DrtPHriwhety/GbqFDCifVDlagN66XxFCinSQPyzcAq7Q24k1cpg==
X-Received: by 2002:a17:90b:5205:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-38f6a3d599fmr5804183a91.5.1785288272736;
        Tue, 28 Jul 2026 18:24:32 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f292b06sm569244a91.10.2026.07.28.18.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:24:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 com260 board
Date: Wed, 29 Jul 2026 09:24:17 +0800
Message-ID: <20260729012418.154652-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729012418.154652-1-inochiama@gmail.com>
References: <20260729012418.154652-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the previous commit does not change the phy node name,
the dtschema can not recognize the type of the ethernet phy,
so the following error is produced:

/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', '
reset-deassert-us', 'reset-gpios' were unexpected)
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml

Change the nodename to make the dtschema can recognize the right
PHY type.

Fixes: 9db839d52ccd ("riscv: dts: spacemit: Fix phy id check for the phy on com260 board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 2a07cd8f2a56..c7a04a338d08 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -173,7 +173,7 @@ &eth1 {
 	status = "okay";
 
 	mdio {
-		phy1: phy@1 {
+		phy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
-- 
2.55.0

