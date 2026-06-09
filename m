Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4514D2EE9
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031481; cv=none; b=rP//ohq4ENSbnfciSOTjS5cOgiWPv9hR41wfApAmlcNp/A4k5RNA4HuT87uwK76HOnRDoaUohEkHoK4lcDBOJ73DycWgeqqy9bl0Z0foaT/6qjq4tG2zOeRVowcOGl7MxcEyDIaT69gLh1FgLzh1/OxOhA5YmrNN+/R8Kdd7/q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031481; c=relaxed/simple;
	bh=YelZkVVslc9h94alnH0TEUnMH8PtybsYZVjRxXyvnYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lqEWX+sABZUyiQwwnnZATN70E1suPhSQPO/rRBwwFnp56o02x+bCPbtZv5/w3xSYKLY7m3Dwi3uYY/mbBXdsI1iUO3n0gsDH/1Tct+c4MUTu//8RYItsZZO7tmhZAl6oEnEbh/B7O3Zi1qj1/YyD2TcS/7NKQkVRj/vgquxwuR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EEPFtnYg; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EEPFtnYg"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so4045480f8f.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031473; x=1781636273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=;
        b=EEPFtnYgUNmzwP0GTyAQPs7brgikCljRQnlYEwsMCKJVVbatL8PYa6Rf61EjV7Zodx
         +3hPhvspCHCGfN8wd5sWR1xg+yIw1/2sE8ynCxizJJlY3iVMNEq8jaxDIThNE6pKVU5s
         Z6HZ9BatnBSNNOeimkQZj6RmbdVeko9afavAU2HVMEsIf7LYcuOU6VrOBAfCXieuhm1X
         MnPJunyaRj0yM7nCir7B0vZfBBkr/bjqHLG9tQXjTG/PTXCDesIihNurtw+VWWYDxB89
         PVQDeARvVTZcVfg7bAgjQeUFc9szv5CgRJW+9mitUOcy8Y7gvITe75cv5r2OSAzBEnUR
         ZnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031473; x=1781636273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XJVQTJ83WKN4QNQoBVEYWeqPm9RY73hmCPn8wn0X4Y=;
        b=ooPi8NJHI6GctvUoppQGo46aaVxkwWncEWTRB9kk/AocY6g6rZ7JepFeF1nItjFRHU
         IXbJGKksBeZdNES7W8QTTmCYDuI30A53+1X1L8eRliZv4VKpx7HMGwq0025BKDwnWynV
         5XQ3tfOfI9efv2BhN0isgxmQeKcc8w4Z/Ebk4fbE5C09AGJtlSmKowltdGEh+g3QaTVU
         hD7Y68+3UugJuHAKo8ELcXOdU+E82b4guqDKoXd8b6+WczTB2TYzIyBqzbxS05kNrwtT
         9DlLPOFO9tF755moPUcAYY6/+nAxlHAnf9Gf1YLeL8+AFs8v7KKHRRMClR41sOByTMu9
         a4Pw==
X-Forwarded-Encrypted: i=1; AFNElJ+L1RcrJQYRaNuakNAd8dzRVxJmNpql3e7sSdJXxqGp1ZpQXywv2OyM3eRm7OQ5we7+0qLcMm1PkNVn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv6EIrYgmAioZ1FCUNLfJhpfcLUYZyLbrDbevTIR20oYsT+vbn
	j/jQbGf/2Cy8AD73yTR1nlyIbEtYWs7IMULrdXd0FEB1Kgs972eq4+rfOSJiN5TPLHI=
X-Gm-Gg: Acq92OFEO/ApqGwpfcA+vEcAk4ILiDvrXvJfd4XSnBrgj61wIZ9H/W3M4MO2Cg8INA+
	pNpMu5Vgwab5PvIQ8eWy7waNZ/xlbIrFOnil376sI1UvBtdl7iuOf8n1j9+RIf4sN7iEmpgNGF0
	2AVgReyxY9GuDdhwqHDgBq+8f5UdlMRdEA+bymHmzLg7bQo4VKGHdpyECb5ct+F58U6hPMpk8ba
	l4259TgJCR8OcbN6LGi/5lZADML0Bm+F9KGB9vfr4d9S6rMnvWabDHAZxtcKb5LbBGLjybdSfdc
	ykxsV3+6cwEG4Ir+NwrXSKUEjUvtTW5uJTReM4GJhOJQPu6ch3+ZQY81CSduaJwFWtT6opIGW3m
	crSlmoNoJKoCnrJ8j+mdAZT07OoqhIwjjipKpbZguES5ULferdlnFDbL6wQDZ9nu3eFpSEvDAnc
	5s3WZ1SWHXIot/9GoZjCdUPC0x7Il/8+Y=
X-Received: by 2002:a05:600c:8183:b0:490:958c:46dc with SMTP id 5b1f17b1804b1-490c25b0a60mr321296115e9.17.1781031472834;
        Tue, 09 Jun 2026 11:57:52 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm50662830f8f.14.2026.06.09.11.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:52 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:17 +0200
Subject: [PATCH v6 05/11] arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-5-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
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
 h=from:subject:message-id; bh=YelZkVVslc9h94alnH0TEUnMH8PtybsYZVjRxXyvnYU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxM/Kr5feqbh06nnx9l4VzWN7FQ4G+aqzzL+oKnn0w
 LbXwgnJHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRD0YM/+MvF5Sxn+A90h3y
 XGP9w618fMqeBwwFvZ/dZfDwrjriUs7I8OalbuOD2phCpV/P91hxSPAmqzNPztgY+qLyrn95jNU
 EbgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: b05a6c145001 ("arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d8f5827c49ed871351a6423db8026..16549fd7340a556798cf5a242746c219d3168d83 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -57,7 +57,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.53.0

