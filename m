Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3B3370AE4
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 02:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786751; cv=none; b=GJTlSxKOdPQzA3tgM/+OUo6JyIpE9jbFfcCnxpUOsawDCxrBUjjhPIOmLSvvi8Rd/RsfIahol/y03RB4oULKFk+lzpkJRw76viP5gV7BBdgEu0/FdSXCbIjECga420dufPby2/5LN9IvBWzat+aUNIp7Pqk+OAyi78jHYCOQBeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786751; c=relaxed/simple;
	bh=OX2iBFvUKqMiOeBJhI7wMw2/FMv/t5IiNryXV3FAp9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QlFYeHrxL1dXIFroS7RzDzyCRm0EywZuXl57mEnbovoPoAUW4MwMzhkcFcoueeOk7x9bYLBBtGJ75y3CI9yiP5lGRGpUT09xTzMvWMTT1ZkvikM8PEfsofeuJP+coWgCzf9F+rchqypjR+pD22hiErxu67xNct0POIVJFaYB2KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAomljNo; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAomljNo"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae6a9aeaso795471eaf.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789786748; x=1790391548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT/xR5ylfNVTPnp8ftKjtkmMqMs95XN+dF28ua8I7vo=;
        b=EAomljNomJrgr4it+qAK5Ku9vjDvIKZpd0I3J0nW305ii/CuvlunogwmVYE8IT+u8Y
         8G43/cin/Q41O4P9ogXlTJYRZ0Lg7ygj3yV0Ts8I8xwkrAtzbm6OhITMVxRfU6uhmPUS
         oOukwyHvhWvU280fKWq6Uh4OiDWpO2Shv73w5eOVBcjDN/oqscizcxwDEemaw8Xhe3Zx
         /K4QPpallm9A7yb4Qq/sBDBr47bYitk9DxgucKTaoVsoAKJE/Q7f7opsg6jnnzac2XaO
         U37hfqYDInrVDJmwu28rPeh3vyzY94tt0joFXhtQwRmoBhrGzaA3kVLr+lsuIU/pzMwx
         YyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786748; x=1790391548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT/xR5ylfNVTPnp8ftKjtkmMqMs95XN+dF28ua8I7vo=;
        b=C/naIyuxYZ5C+sUQAprFtkbXXqydpYoT+V59zdJ7x7Liz+iJJil1tzQeL/O0sEA4aQ
         yz/QWiOPXZF+AN8Jum7KDABzjH/C4TOeFNZtJ25G/2Mqhqpw09VzbNdNioMpAHccLsrH
         ylaBuGElCfyfx4haG7u9iMwr83BmTBWM/5DvnicUt4xGdr3KMZg0GgeGvIwCFGaRpVI7
         rgn/fZ8nxpcis3k1aCx/8V7v04Z+bJ4q6+tVo4McyXPDtIK2G/4aIbHtibgsa+zYXJTa
         8OFupu5d2GNFeiZ9rDdTnZlykPWCHCxsEIHESmu7VK0yDgQi3c60/vBZLyrJIPshguBG
         h+MA==
X-Gm-Message-State: AFuF++n5kqucWPXs6OGunwsjauth3oNS5WjiHFuHa0w683y7h3Fpz1Em
	2SKWnamt6BpR7cX++Ty+Y0JPtkKu5c2WQqlk9iVzqp/2eH949F5zCye1BtTCveSh
X-Gm-Gg: AYBFou3W23Hjz5JhbJf+fZSIaZQJXI5cg26XnTy9wZaFPB0sfpCaepZxsjUo11WnUCa
	oTaGnjZAa7vHmTi1QM7GTvXFaVdvRJr3HWLRuYm4QvXObyjwnvtA/71wmi1Va8FKrGCovW4czgh
	GnJhH1Tjs5ll/sf5FacwOAVbqFyGKNs2R/lH+MD3O66HGn1Bi5cs3KlhqjDH7/Gao5EDqxoEysx
	PryuiLQZmqc174VjaAx4b8SvA6YxNSZjbmEiF5D6heMPkI8pNFPDSFZrCxlKmGICI+D7g9Kh8gS
	P8Z60OFmpgE39FYpXFu4QiB+IQr0pmAi8qIK9vHTibTm8KH4a/VxSBfSN6yD8QQyiastYryW3hq
	PiY2hoCVjG9Bd4CJkFh4gO2qCNQda2slP0zkb76GXOr6sx2XPYDCujfeN53m9iDIXW5i5UBfQgj
	RZ7KA76YnDBDmq/Dx52rAX2y+xuLdJVZ2dFsaKWJ6GVRgEUROahOS9RIam8kZ/yW3NO/xsxDa74
	sifOma23KL5KTSCHHdXCVfKTqSWEr+UpFCGaFR8j/IqquE5lYu1smcWPt8Ani0=
X-Received: by 2002:a05:6820:4c08:b0:6b7:83c5:fde8 with SMTP id 006d021491bc7-6ca9bd48168mr4485117eaf.41.1789786747864;
        Fri, 18 Sep 2026 19:59:07 -0700 (PDT)
Received: from DESKTOP-FG7FD3B.localdomain (fixed-187-189-149-136.totalplay.net. [187.189.149.136])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd2ea874c3sm1904355eaf.0.2026.09.18.19.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 19:59:07 -0700 (PDT)
From: Daniel28972897 <danyboy28sep@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Daniel28972897 <danyboy28sep@gmail.com>
Subject: [PATCH v2 2/2] staging: axis-fifo: remove superseded text binding
Date: Fri, 18 Sep 2026 20:59:00 -0600
Message-Id: <20260919025900.169703-3-danyboy28sep@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919025900.169703-1-danyboy28sep@gmail.com>
References: <20260919011417.156828-1-danyboy28sep@gmail.com>
 <20260919025900.169703-1-danyboy28sep@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver's devicetree binding has been converted to
Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml,
which supersedes and duplicates this file.

Signed-off-by: Daniel28972897 <danyboy28sep@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.txt | 96 -------------------------
 1 file changed, 96 deletions(-)
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

diff --git a/drivers/staging/axis-fifo/axis-fifo.txt b/drivers/staging/axis-fifo/axis-fifo.txt
deleted file mode 100644
index 413b81a53202..000000000000
--- a/drivers/staging/axis-fifo/axis-fifo.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-Xilinx AXI-Stream FIFO v4.1 IP core
-
-This IP core has read and write AXI-Stream FIFOs, the contents of which can
-be accessed from the AXI4 memory-mapped interface. This is useful for
-transferring data from a processor into the FPGA fabric. The driver creates
-a character device that can be read/written to with standard
-open/read/write/close.
-
-See Xilinx PG080 document for IP details.
-
-Currently supports only store-forward mode with a 32-bit
-AXI4-Lite interface. DOES NOT support:
-	- cut-through mode
-	- AXI4 (non-lite)
-
-Required properties:
-- compatible: Should be one of:
-    "xlnx,axi-fifo-mm-s-4.1"
-    "xlnx,axi-fifo-mm-s-4.2"
-    "xlnx,axi-fifo-mm-s-4.3"
-- interrupt-names: Should be "interrupt"
-- interrupt-parent: Should be <&intc>
-- interrupts: Should contain interrupts lines.
-- reg: Should contain registers location and length.
-- xlnx,axi-str-rxd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
-- xlnx,axi-str-rxd-tdata-width: Should be <0x20>
-- xlnx,axi-str-txc-protocol: Should be "XIL_AXI_STREAM_ETH_CTRL"
-- xlnx,axi-str-txc-tdata-width: Should be <0x20>
-- xlnx,axi-str-txd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
-- xlnx,axi-str-txd-tdata-width: Should be <0x20>
-- xlnx,axis-tdest-width: AXI-Stream TDEST width (ignored by the driver)
-- xlnx,axis-tid-width: AXI-Stream TID width (ignored by the driver)
-- xlnx,axis-tuser-width: AXI-Stream TUSER width (ignored by the driver)
-- xlnx,data-interface-type: Should be <0x0> (ignored by the driver)
-- xlnx,has-axis-tdest: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tid: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tkeep: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tstrb: Should be <0x0> (this feature isn't supported)
-- xlnx,has-axis-tuser: Should be <0x0> (this feature isn't supported)
-- xlnx,rx-fifo-depth: Depth of RX FIFO in words
-- xlnx,rx-fifo-pe-threshold: RX programmable empty interrupt threshold
-	(ignored by the driver)
-- xlnx,rx-fifo-pf-threshold: RX programmable full interrupt threshold
-	(ignored by the driver)
-- xlnx,s-axi-id-width: Should be <0x4> (ignored by the driver)
-- xlnx,s-axi4-data-width: Should be <0x20> (ignored by the driver)
-- xlnx,select-xpm: Should be <0x0> (ignored by the driver)
-- xlnx,tx-fifo-depth: Depth of TX FIFO in words
-- xlnx,tx-fifo-pe-threshold: TX programmable empty interrupt threshold
-	(ignored by the driver)
-- xlnx,tx-fifo-pf-threshold: TX programmable full interrupt threshold
-	(ignored by the driver)
-- xlnx,use-rx-cut-through: Should be <0x0> (this feature isn't supported)
-- xlnx,use-rx-data: <0x1> if RX FIFO is enabled, <0x0> otherwise
-- xlnx,use-tx-ctrl: Should be <0x0> (this feature isn't supported)
-- xlnx,use-tx-cut-through: Should be <0x0> (this feature isn't supported)
-- xlnx,use-tx-data: <0x1> if TX FIFO is enabled, <0x0> otherwise
-
-Example:
-
-axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
-	compatible = "xlnx,axi-fifo-mm-s-4.1";
-	interrupt-names = "interrupt";
-	interrupt-parent = <&intc>;
-	interrupts = <0 29 4>;
-	reg = <0x43c00000 0x10000>;
-	xlnx,axi-str-rxd-protocol = "XIL_AXI_STREAM_ETH_DATA";
-	xlnx,axi-str-rxd-tdata-width = <0x20>;
-	xlnx,axi-str-txc-protocol = "XIL_AXI_STREAM_ETH_CTRL";
-	xlnx,axi-str-txc-tdata-width = <0x20>;
-	xlnx,axi-str-txd-protocol = "XIL_AXI_STREAM_ETH_DATA";
-	xlnx,axi-str-txd-tdata-width = <0x20>;
-	xlnx,axis-tdest-width = <0x4>;
-	xlnx,axis-tid-width = <0x4>;
-	xlnx,axis-tuser-width = <0x4>;
-	xlnx,data-interface-type = <0x0>;
-	xlnx,has-axis-tdest = <0x0>;
-	xlnx,has-axis-tid = <0x0>;
-	xlnx,has-axis-tkeep = <0x0>;
-	xlnx,has-axis-tstrb = <0x0>;
-	xlnx,has-axis-tuser = <0x0>;
-	xlnx,rx-fifo-depth = <0x200>;
-	xlnx,rx-fifo-pe-threshold = <0x2>;
-	xlnx,rx-fifo-pf-threshold = <0x1fb>;
-	xlnx,s-axi-id-width = <0x4>;
-	xlnx,s-axi4-data-width = <0x20>;
-	xlnx,select-xpm = <0x0>;
-	xlnx,tx-fifo-depth = <0x8000>;
-	xlnx,tx-fifo-pe-threshold = <0x200>;
-	xlnx,tx-fifo-pf-threshold = <0x7ffb>;
-	xlnx,use-rx-cut-through = <0x0>;
-	xlnx,use-rx-data = <0x0>;
-	xlnx,use-tx-ctrl = <0x0>;
-	xlnx,use-tx-cut-through = <0x0>;
-	xlnx,use-tx-data = <0x1>;
-};
-- 
2.34.1

