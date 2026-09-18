Received: from mail-wr2-f15.google.com (mail-wr2-f15.google.com [74.125.225.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26EA3F39D4
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723147; cv=none; b=ohAHlkO5MDXXr6t96ci71g8IbsNLDN2lg20nIXvnYrmddSTK8riygbYls05QP97Ai2XGY1fqoxvWj8xCz+cPMTZONz5PKQQHMrsHsQPTzDQL6iqLxapB5lCcZInMRbKQHk8a+semTO4flwPKd7gYcuXv4Pptdg3wKiXA6LWdIiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723147; c=relaxed/simple;
	bh=Bsy+D3QFn9R/hEGe07cbw74wD1PaG/3jyKHfoc+/Dhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5fhOBTe/3VtrnjWXwkGNP0sOS6OubuZoaJ7AirfNi53vmeRS/i+OUEiJtUnGXvyPuj6ooz/OucIHXSghHJy9fyU7YzvVCcd2BR0wirriv6pOfrJnI1HkWtlZCWUIcShUzB8rrA+L3n76HuQHyzkh/4mdmDvfQVfS17TeKAXyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GCakg5v5; arc=none smtp.client-ip=74.125.225.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GCakg5v5"
Received: by mail-wr2-f15.google.com with SMTP id ffacd0b85a97d-482f633ecdeso439828f8f.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723143; x=1790327943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2bOba9nuIvb4gyC2eO+18NXFEOc4D/uZAI0djSNku8=;
        b=GCakg5v5dyxIRwqfSAvX1GAHY5bgTa2MKNKOnW/izTawR/ANGFgEB+eSWxcYgcu1TD
         z1MkqRm1r9UY+z4Izzr8AdZNqKjyGIkB150Eph0ypLf8HxxkyBM2sO+f11duyPB3yom7
         81PekfoNUIquSps6adu2NMmVbCVDwyMMlwI9EwWPmJfV0N8kwlTk3EwiEv7AGWTTisuP
         uKHsPDTJsdXqWG1wnMY4K7yAdTbaFfcnSWhGjqJ6JRy2kcfe2tHSyw0lhtqp2kXCyL3l
         mG9cCBLtkfh/sSOpLFfw03YKrqWsWshFS0VqwG4GurEEuchBoFV60JqrPVUbPQaGIr1w
         7gQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723143; x=1790327943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2bOba9nuIvb4gyC2eO+18NXFEOc4D/uZAI0djSNku8=;
        b=wXv0A5wkMjnaoWD4jlOIryJXMwal0616M1t5ynDFWEPcHk3qaTLVdJR0urEoUdjoxP
         J5scTA/xh64sh2Ly4QryGgujMEJmkI6QZsAcbLA2TO6Er1x4xiVTWR7FdM8K1vQcrqPd
         RJGv869OB4lODk3aGfdCBnyZlBNDztwQLoxITYjWlbkdccFrz7ySoWRpJ6WI+PMT9VBY
         7M6+Z3/UgBHMpR2XZ0chn8d4+6KLOY3prFrm17jE6ywkE/lw+W6EomAXX0b2qAq2LSZ1
         vZUtoDnhBT0ZGddE4n9RSnvMryYHKODW4018Kav4Vd7wOhEwqdqgWxJghzWmYZ7vNneG
         I+GQ==
X-Forwarded-Encrypted: i=1; AKwUvBw91S39QQ/CB3JWp9UyEOgi0HetiN5ebg1XnX8qjUD3rMUD9fRoNs+2ADkdjvbIOpXiHlIiB+n6iiyj@vger.kernel.org
X-Gm-Message-State: AFuF++mc0pM5VRad21awFujKb9FNNWVLABhxOrmCUyCYv7JnAnhxt0fd
	vLvpIZ/AIywWmbuENF0DoPbp5GHj4NSz8bH47MtY1kAr/COIE3V0Komb9KhH7asAGyM=
X-Gm-Gg: AYBFou0J69duoET2xqJn5sY8+1aKudlMiN3HcliVy/CyKsBaUyZ484EKNjeftPfe6/V
	njkKujdjxVojwprqJV0Xhr03LW02UL6IhCqvc4khyEkvQlSybE75Gw1CQ9aEMvmlaIsPl3KyPKi
	pgojNCC4rN65XMFbSpABqrkKegerzectyxyZwlDiLjrjRrEytKLxxxSl0UqDJ9KpbR3VVEquVXg
	RrhodlHxLlEB77UyPKl0iAgX7AGovO7UQoGHDhCpPk6k9UgVGB5ulxgLgp7RQyGKH0HN6AbuJCg
	6b4NCYMSf1WVw1l4vTKvDIM7k3axdvpqI82H/vHx2pjZdEQGk2cNZZ1zY2ryRCpYD/Ciz846rcl
	ZFbOEcFw2tgnc7VMeCsUy3gNUs7DVXcW4QqkFsyIcgxUSG++ghYkXbOXkO3+Kni3ZZgGh94plKt
	DlPZ5SV27sJ7+sWncp/T+JglEs2Onj9M7SwZpMQ0+JOjLzqm8Y2DhK6q/wWTYb3+C++SX7GgTJ6
	7b+Fg==
X-Received: by 2002:a05:6000:41cd:b0:487:62d:37d1 with SMTP id ffacd0b85a97d-4871e2664b7mr2229141f8f.29.1789723142835;
        Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200737d6sm2803599f8f.24.2026.09.18.02.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:47 +0200
Subject: [PATCH v9 3/9] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-3-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Bsy+D3QFn9R/hEGe07cbw74wD1PaG/3jyKHfoc+/Dhk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jGde7z50ZbrNtpLSXMfzj92kE7sTYy6czFqz5F0Q9
 /ayiNrejlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhIdxrDX4mVN+9HCl4p37CT
 1cdwS5rU+s87Ff+FpVeF/RbY/yytr4vhf+rj/+992Q45/wq+sjk440BG4z0D17dT+J7u9kyc4v5
 LmAkA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index d3b3675e7a8f..6e5419de8e35 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0

