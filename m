Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDC93B14AF
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723156; cv=none; b=SqMnYyBQ+PAh09fddR9gMDaBOo/Mk5jGoBgpeuAvjyJgrlIEHP9Nd8sqy2e3cmLh+i5Jc597reWRmC0XkcbJAK2ib2BNlp/Sm94Gayf3wF63krcU97IiyndQr2ld/MLOzeAhl68JcQx/2c5Z7gCv5T5rMXgINc4aLjQz5pDqsGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723156; c=relaxed/simple;
	bh=dumbrPOqQoW19bdj9Q+Yrp4aXi4kOxMnSTyfo6FbsQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBzykCaiv0jhOmjtL5C2eBcqQG1rykOii72K310hxLbq19bSNp+tteH2a8H7cNvPkX8DwwXa86MwLWDUX1efxBbaEo4e7rfR0+5XLH+aydBKhOJTatEuyuX/r+FK8xpWLkfSiXzIYCyfh5SS0dFeD10UMFgSLdoW41VxBNU6LlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cIehUhxJ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cIehUhxJ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso1477035e9.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723147; x=1790327947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sK8LjopR7pp8ZkQXuKlcKGXgSdG/Xc70Mr3Wn6LmTuk=;
        b=cIehUhxJ20GkM9f9fklxlMfWu95w640RoOgUlyGlMFVzFd2QH8rC2CfeQWMFxXbCnS
         mPFiu00+exxgvd1PS5pLYAXrzFLEh+bDoYcnnBisKGKk8GsNRyXcHEAvRCmTgVii33sP
         DufXLzNQ2PPtBJNx6bMDIginjzsQD+gLlOxbQed8NrP7cjoESjgH+hLby774CSdGjdIC
         aZapV9mcl3ZZs/VaBzw8cvNLtvklsFGU5UeWuTFrc40VEoDV/rVB7dErAwtKjMhHWOx5
         yDowAMGtzmWaFLOg8CebB09Y/bxsqsZ4G9Qn/68iFvW6wG6x/Gxp9zNElOLrq5uVhe5i
         iGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723147; x=1790327947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sK8LjopR7pp8ZkQXuKlcKGXgSdG/Xc70Mr3Wn6LmTuk=;
        b=Vn4rcyPS/hK+ozOwSPHYvZL9Hp35+N6WAKbkdy71nzXmeBqf5ccD8CQEj5KUwmghpv
         9sH7Qf7JKVMqYMAau7O0lKmrh09GwvYTWm0PmbDyFMQSTSP+RY5AoKpxuyvTEQ143J6h
         fcRSKDMMp9CuKWMk3M7bcoQ8Q56hmWcLt1Ml7IdeAZAv8eVhnyKDhXwkV3moblA2sHQu
         BMqkUf0H88HSb/rJL6YU7rzNCW2Wg85dQesFgA6ZgbOMKqHlPRJJIbllHd9R+Jxs6MS6
         nTA2RIjkzdAp4DSXtLkQSu6SQAl5hXimaeXqMzAszbkOORQsMas+Fhvxa232kBFVMuUM
         ssVg==
X-Forwarded-Encrypted: i=1; AKwUvBx+vXnkmRloV1cmV2McClypCrRqq/RtS1FE5d9POBXLTKu2WAa1C4FfKeDu3x8zexpDl000Xcx7tVWV@vger.kernel.org
X-Gm-Message-State: AFuF++k3Kw30QEgc5/+f1L/xEef+oQkCHWC7sqIafn5yTf0zshKz7kCS
	NzrfU4gNB8Rzqjfa8mvzq5nnwUTax6TxbDbMj1BIPv8rS92aw/CP+kvGrfwpJBXQ4Hc=
X-Gm-Gg: AYBFou1adkUaSLwUNS13WcgTlzmBCkJaddaL3VSeoWffHAIT5qoMKQhN7TnJUC7ep16
	gOpcBNptDOkLDAFcZBV1ym+REa0o0k5WmBi7qaZEK4XrlPepJ9PEkFEBx/qsSvVPIlx5TPBTuSz
	+bQaIPBLfE/8nwLSCZsze8FG4LQP4O7nZKDS4WTEi5udjQ3XNHdGi8mTInQePR+CQjvZ8mPI+H2
	zylpycuoRaAlBRAavrilqMMCnR5E1UbyrjNFcYdf9tH83Nxi8MeSMD56GrgizZsC6S64DL9Pvqk
	j3mCGgYojWDCNkiulKWK2U305lOUS+JY3nCDy7kTKkLqi6dSouFijfckv0MWrhX9son0bt9s9Di
	QV7H6IW61nqQ+2ZtC/XKQ8yZ4nm0Wbb8fFKE6bc/Oza2+MGjEETDx7ES7dW7qp5yFOwNdMO0HcN
	wAI6FNeIAI/5SdiFtfM2nmB3TTox0L8dnczMmhzA08D+eK53cp1+F9KptKZYGqITgcj/I=
X-Received: by 2002:a05:600c:6305:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49fc50012f7mr25323075e9.13.1789723146740;
        Fri, 18 Sep 2026 02:19:06 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d46399sm49887575e9.12.2026.09.18.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:06 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:50 +0200
Subject: [PATCH v9 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-6-40972ef1f663@baylibre.com>
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
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, 
 Stefano Radaelli <stefano.r@variscite.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=msp@baylibre.com;
 h=from:subject:message-id; bh=dumbrPOqQoW19bdj9Q+Yrp4aXi4kOxMnSTyfo6FbsQM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jLcfHc68H/BS9uDUKBMetp0zrn/R/8SXy7XmaXuC5
 2WNhLlyHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR7gZGhn2FJjelbr/xPGh+
 +ureeM5Ahw0/kw7a/Z/ytP3sT9WFOm4M/5Tm5lvG6z0//MlfVijUUbM6besjTZ0bYZ8n3vi0cNb
 SLUwA
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
Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P")
Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 8a8dec80cb30..3d1a2c5bc464 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.55.0

