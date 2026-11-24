Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511550;
	b=AHf3Cs8+DDzpivLiNgMFKrdPioP+MV0eSt3rSJa4w47jq0FFcDwWov1ewcuDRyZz91Ka
	 YDYfcDdxua8w82xr7bWyzyf2kQy8ATL7enCPo6KTB280dez9dXJ8/L2P5QytcaPkrBdCy
	 3iWPmCwPIq77aE2wR+QuGECMFeycwHVP/XGJP3GgDDwVHa6uSFjU41IlIHH0Mtwlxqd1X
	 7ykEGXy1c1zYysI3NNOFy4nIhnZBqVmnL27+A+NahyI0CzmKEmQ4jKRw8fdYvxwKG2II9
	 e0rBWyExHG9E6usyrQrOnGbnmqXeZ18WnL//ZcEIDnqLh6egeaTk0BGpAxP6LocLhOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511550;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=8r+7XF8F7JmD8GZ10igNH1KanuHgCZwsM4pGmySSqBM=;
	b=m+muvt29Cn+oEOlmuyEP4uSrvBfLzQSrAZeiRpz5MSgBhdBKOtH+sIryblYeKAxD7X6W
	 N9hIL8RvV0mwA15ClMy1MENab4wyGEU2nNwDLWkQid5xTbeXs6lM0Z1ngBgvjTQFuw9MP
	 TIgTAs8xUddNqU5v1okB8ri21R9Vd+fmuz74460ElfueDfaCALxiiWZbboNgehZNBjYee
	 2pLiG6+HPEGCYewARlhOz/oqTJZiElZ4TCobChCjHtpfkkd+EeAm8jKSD/NxWM9y4tIyh
	 DIFuVATMmf512HRWV8TnQT1lPE8/Egc3v68tKn3NRdE/sdy005kHkVBEF4R9zTIMedw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="bLO/pw+F";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F4606A332;
	Tue, 24 Nov 2026 09:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 608F4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bLO/pw+F
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1297C1A17AD;
	Tue, 24 Nov 2026 09:12:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD07C601E1;
	Tue, 24 Nov 2026 09:12:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61D5E11E68B99;
	Tue, 24 Nov 2026 10:12:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795511547; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8r+7XF8F7JmD8GZ10igNH1KanuHgCZwsM4pGmySSqBM=;
	b=bLO/pw+Fotg65LiKcEDinRfVk3TU6c6EBdOsu7rhDoFfAgOpAvU+aK7dmcRkhdzBSqbyO1
	QIYzf3FeC1QJnMS46smVqobxpKwa6ytI+w7bheYoN6UWfMuLnORdLKxE/pExrfd0fWD5H7
	Ah+DDHEHWNoWAvSoK0pVNN122Px/eVBgnU/MO/6JJfHnuTmhM/ThU/yksy/XcbRp8Mck81
	mh5dC/8mlXW9vwCuABP2B4FjRLIDjWwTfFHM+O/P5hKWT1jUODkmJUllIJFhkDr3C1Z9e5
	FqR6FqnU6UgETtmPJfwCiwL0jzSl1jNNDYRxUC5N3q/Ttkzg1/vDwABQxTTgjw==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v7 1/6] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM memory region
Date: Tue, 24 Nov 2026 10:12:16 +0100
Message-ID: <20261124091221.2593576-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124091221.2593576-1-richard.genoud@bootlin.com>
References: <20261124091221.2593576-1-richard.genoud@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Declare a carveout memory region to store LPM metadata on Jacinto
devices.

For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image. This LPM
metadata area is firewalled to be accessed only by TIFS.

U-Boot R5 SPL/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image (which has been copied in memory at boot time by U-Boot
R5-SPL)

At resume, U-Boot R5 SPL is executed and detects that the board is
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 14e6b2f817b3..af2acd429974 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -155,9 +155,10 @@ patternProperties:
         description: |
           phandle to the reserved memory nodes to be associated with the
           remoteproc device. There should be two reserved memory nodes defined
-          for the basic layout or 6 partitions for a detailed layout. The
-          reserved memory nodes should be carveout nodes, and should be defined
-          with a "no-map" property as per the bindings in
+          for the basic layout, three for the Jacinto layout or 6 partitions
+          for a detailed layout. The reserved memory nodes should be carveout
+          nodes, and should be defined with a "no-map" property as per the
+          bindings in
           Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
         oneOf:
           - description: Basic layout
@@ -174,6 +175,12 @@ patternProperties:
               - description: LPM metadata
               - description: LPM FS context data and reserved sections
               - description: DM RM/PM trace and firmware code/data
+          - description: Jacinto layout
+            items:
+              - description: region used for dynamic DMA allocations like vrings and
+                             vring buffers
+              - description: region reserved for firmware image sections
+              - description: LPM metadata
 
       memory-region-names:
         description: |
@@ -192,6 +199,11 @@ patternProperties:
               - const: lpm-metadata
               - const: lpm-context
               - const: dm-firmware
+          - description: Jacinto layout
+            items:
+              - const: dma
+              - const: firmware
+              - const: lpm-metadata
 
 # Optional properties:
 # --------------------
