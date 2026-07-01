Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39BB481FBE
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909656; cv=none; b=Jfcn2+HHbL9bL6GTc54opfv6OIroqaVLTWF+mokL7AxZV/2/dwVUfqiAHwuv92YagfquLNxnqYGgYtYgjKnuI1bQ1y1umD9ii3ei3mDLzcRNzOXJFEoypcoZR1A9PZZ8HHVhtYZF96x2KLEJOtRQ6CNjR4wvDezoeLmWS6QUpAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909656; c=relaxed/simple;
	bh=/H8+FLcymjurbPJq5XVqqAaQz7MleqM2bK1XAD+GdZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i7Nc7+frxJXebkHCOpYZlctvNJ9/UWRNBC6MQZD5K3J6hU5ql5A6jMzz6Y6jTQXYBvYoEMqSKFpKgCy3qF+Y7Rk90fIeVl5yiJhrP7Buv3pYncU9kVACtdJExSeoC7JrHeE7TFQQ4pZBe8bin/OoKDP2kA9XQN2MyS0y5ekVcks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=eWp2Ni4u; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="eWp2Ni4u"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so4552575e9.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909652; x=1783514452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUd8aZYMR6nCW/a4VGgxXJpZ9DjCATYCWh/HUQX1mu8=;
        b=eWp2Ni4unge+JxhHqWAnSyNQxgGqhZ7vUFmHqx8M68849cNwdJCyesyuoDzb8BVc6Z
         r43+q6StgMIALCq+RROS+BPGwkj+pQqpVg0Kgjwjs1s/ruslrMYIAPXfmK05ksYH5KmN
         D7VdfYscl1jzLW7B3vgKC2t+//c6lPf+8EgoIuo8qdXSqVLraB4LKmwPUPXfyt/APdUJ
         1czRMA6WGMFjKYCI3SOWe6pb8tAPSL9zbQpGTB9pNFHNvwre3mCQkkBr6maTB9EaNgo2
         bXI/VyxQXKVPrrXUkEtyom/reFEkp0224c6wzoJCFNWkRe3UHay/3hpbtVk/YKvvA5X4
         w42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909652; x=1783514452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vUd8aZYMR6nCW/a4VGgxXJpZ9DjCATYCWh/HUQX1mu8=;
        b=CZbh9uV51k1pz4T+rqSNOO8FviinOtp2qqqLsywzOqpFUk0A6Jv8ZWYv/3WVCC2YDv
         twraQsqV574iCDzMFOKZzRpx9iN7NbG69Bz3gWp1qPAtsbrBAk7wBFaudeKngrHfjnZo
         kEjl5qpi5lK8dB7rKKhndlSu0/XP5yi8GHDLwcbSIZa7cX6Js5hxExaCio5vnQWjclmA
         2zpNbEHXWDZWS/OkIEdsnBvam/FIMR6z7ypf1Sbvz5S9vJSo7XQBydA84r5uqSYCN0Eo
         yBOwwffrwzcxkIxTijEPbdBECoayhsea6BhIRHpjqJFJXwE3m4F4FADls5vST5CI/WFD
         mS4w==
X-Forwarded-Encrypted: i=1; AFNElJ8/MAY8riZj3rXLP2q4/jYXy25VbmTHe8BSFjZ2PqS++bkwF67PIcsFkXzpIF/vrD2KflxoTutBApcg@vger.kernel.org
X-Gm-Message-State: AOJu0YwnBojIpAcCLGOzKT8CFqz9GIgYCLt6cCiIhBkK05WbZ6wLl2bg
	rmwrYDlIgb41WGTrZexO+zb0wgr80CeVrWy7/pKy1hYzFWP6avPKaz+w18X1vc3NJ+k=
X-Gm-Gg: AfdE7cnGuFAZpj4CoxpC+sWrF8bOjNj+5tYrmAPtZ+TSJqyAQdfFS++bmvswA3PJTgl
	vAWbG388JaanhK/186uqR0v0w/sfQcUpn7BgFit700NmZm0hzU6syqha7Iq/9mr8u/sO8desGC4
	d0wdj6RY8fjK+A+xZcx1y0543KpGI7oLTV6B9a2dq1gqTf+nvPClgBZ8d38Dx5TlzpykoVb/TXD
	0j6XU73md9BfWDTndPGUZXn0GQswZkxtNiha8j5Iqrr0N1yfLIzR4Ft9ClL5PKAk4+V/yYRCTWf
	sd99eDYM09ka0Eg4RG1JDqZebJ/ODEQqIzaWaHCl4HmWr4jwKymBA2mvGFffIKc0nkdaLIsCM6V
	L0gh3S5v4c4QZDNeMmq7JioEg3sEjs8XOive4PRD44d0Yt+atxPys6pMLJg9mzhpqWC89dYjZNu
	eLbKmhNiQozw==
X-Received: by 2002:a05:600c:8217:b0:493:bc88:ddcf with SMTP id 5b1f17b1804b1-493c2b7d9a3mr23202485e9.23.1782909652226;
        Wed, 01 Jul 2026 05:40:52 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be810c02sm80288265e9.11.2026.07.01.05.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:51 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:16 +0200
Subject: [PATCH v7 04/11] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-4-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=msp@baylibre.com;
 h=from:subject:message-id; bh=/H8+FLcymjurbPJq5XVqqAaQz7MleqM2bK1XAD+GdZM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrsmaO8KOHNtu/6Oz3l9j+5fWI7q2rOo2byw4Y/+7b
 enPbVPvKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgInoRDD8jz9kzMYkF3uKd+Zi
 4Y28O69bhSbumfZw4yru0KIHd+ReZzMy3NnoZu0Q9mJBwXoTR46CmMP9La3a+XXeDElHnfa3BLi
 yAgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 7ee894d59113aa727d41b7ecd6b2bc7e12760823..8a5ff5c457579c7b1be7157d235fd4b4e5c6af11 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 	};

-- 
2.53.0

