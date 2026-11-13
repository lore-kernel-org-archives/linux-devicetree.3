Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537134;
	b=KmUKZvJ5dIvl3eShn3YJgtgAbUcaJ8y/039tejsaan6rD786/dqRC6G1RgpjOTd7hFxo
	 UiZ3i6WK1xXn29+6NPbfylbSMQMOg6EtMk+5glr9jIMj2BholwtuWIomLSI7ngivYaQuZ
	 3QQQpVWEYy7lNOCLtOL1WfWAsguRXTI55vCAvpLhPIoDG6s+M94PeWx3xS42Oa0Mc29MR
	 2WxID6hDib3PETPRTQa30vvvwvOtuBb7iOFD9U+y56yKjHd4mKwYUC/GZPcRJ0HFHEDWQ
	 u1u1HgXT/8470d3/SvsGZL4w2Smsw647Jj4ka93OovkbRCQtxitAK09YlNgs+BtkSjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
	b=WPj7a0ToLB+9B6d1LAUUDcEcDZSNyEWm/e6NHIWVL2paMmFmimwdYHtGAhexZl7pfHk8
	 VjzpiJSj2MZeSFGWAEoHSynZ2B8m43A2ikD2XJtbjTyQznX72L+6isvNFKwfu4huFsJfC
	 YA904Tz3U1DzzDJbAMbOc4Fqpfnh4L2DuVlfm94NzwugoAwCKmkzbuNYmkAQ9yg3Z0iof
	 NQp6rZikHSqsPGVm3D6v04ujkoVeCj8Jn5eltVJmMS4YvXytGSui5cHbx3dOAe8YjZJY+
	 NY0t3gnXic78sLjcxQzUjAqdD9R2ouFZnxUUy7ieYgkdu72i4CC4jrS0VK964eu+dFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQSmCCcc;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C502606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C502606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQSmCCcc
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53665358476so6983191cf.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537133; x=1795141933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
        b=DQSmCCccdQsvdy4LlhA006kwZsscR2/AayWLlrfMg7U9lze5G65+enI0z5OeSse0fg
         RhZtSFqw5dFA2lehOde5nj8hoaNDggCRv6c5BlSnQaz9Mju4hKltu8x1bAibr/hnKisi
         PqqiMKtNIi33p91oEFKipTEfBw6DLE7A0M7z9qI2vTMv+baBZbRmitvcSr6fqFddlkkY
         NAc8FfyPv/RBgDGv+ekeUIS84XYo2RnSH8zACu14NYAx+369PZEjS3UryJ9tJJujsNzo
         4H6COnJUaW5bn5x/zL9wPoWwA4Onvf61upAm6wfGHx1j820LHaQZz6Uzp0E2gOD8Cjsz
         DqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537133; x=1795141933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
        b=l7QgIzuwBNbSbsq9+qrQn+GmNXfI38IjAjHG/ICvSEDYqPxXAkwnUK6xW/ya0Df70I
         JSSwOeIhRy0dPAmgXdLWaHfkWtpD/lAQ+0t5ULO3AuGW5lok6mWEQV5TfncPlfk1VcJi
         6NUJunRqAfpoWjbAdj7H44PJ11fgnGPPQSAYmro7nqXAjX3tNTDGVn0W6BnsrF1wRZmM
         9w+T3UtNIxAiITjkznfmv8H7hbKOpyljA+uxCB3n1qikvKs94fJhQnRLFXoQ+W11L8gy
         EmOwCS1UUJgsbzi+Xyh24S36J6Q7CgeZtG/aV3mUJdSUXsvzZ4tifoZjIK7Sgo0bgpvR
         c4Cg==
X-Forwarded-Encrypted: i=1; AL+hErHHvkYrLg3Y9jl3RdNk9AelK4xFfGhepoK0rXoMm2bnQEzE+CfPyswlYx8vc5DskgSfAkeCBOy0Uzu1@vger.kernel.org
X-Gm-Message-State: APuU4Z/LUHSSm1b3f/HNphFIhnw0Uz1rI+zU9GmNdVMttK4I2FEM10F4
	Fx97TNo3zJp2Pkk+o5hdob6Y/29Hj9eV/c2wI4T6jzUoGY/AOca4y3Y=
X-Gm-Gg: AYBFou0nswBITuygmSFr3Ezu/rpgoHyAfL7jUAyJZckQGxzGql16eoiyrPfT4mDq4Ww
	ykIaqGQQNME4jxU+ZOMuO3QeUFpSHdFNNbuP8jzVrQZW2+gfnaPEZjXGhbC4un5CDHP5rt7kpVQ
	WBa7yD74YK2pzNNasTJK1DzuY64S7OYe6LeoL9RUpE4zr0dBOGJ4yKSr6XIFXyrkpMPngarJxSb
	bOppcRZZHj/wK45FySFn3bCYXN21hAJUSmxhWFc412pWBuTCwSDvLFyQZ8kF3rKkGZlk+mADyQj
	foR35P84usjjvMfFCJLVdGRN97CznjxtsTGS+qddzvcWj/mUhKISTkRebyWLIzgw5NhkIpFLcDL
	6ObVOXbAanaHmEiKfXjnOlSCITEisJpyeSzjGyB2/qKlxnUTvI7PrSnNVMFIkthSYXenSvz6rOB
	ZNg+VRZth6w2VNag/5PnZpNKkPsM7asW+pIX7gVCaxxmOu3C+se6av4VS2z4FoHVC/wjP99ZXWQ
	G1UzwKv5finfbWFbW5Q5c+IN4lvnDP8ZJzdxMwlnBFid0j3bejBPTVSYHPE1KtIVJWIxOfyWfOM
	fMBk8NeoY8rCx13enbJg8VZ9EV1L
X-Received: by 2002:a05:622a:180b:b0:535:87c3:79e5 with SMTP id d75a77b69052e-55ac7568907mr20793741cf.39.1794537133164;
        Thu, 12 Nov 2026 18:32:13 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm9688926d6.44.2026.11.12.18.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:32:12 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: troy.mitchell@linux.spacemit.com,
	wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com,
	jyc0019@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Thu, 12 Nov 2026 21:31:58 -0500
Message-ID: <20261113023158.2872492-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On K1 a PCIe master only sees DDR: bus addresses 0-2 GB map to CPU
0-2 GB and bus 2-16 GB to CPU 4-18 GB. A root port does not forward
upstream an inbound access that falls inside its own memory window, so
dma-ranges must skip each port's own outbound window; the other ports'
windows reach memory.

The shared pcie-bus skips all three windows, bus 0x8000_0000-0xb7ff_ffff,
which leaves CPU addresses 0x1_0000_0000-0x1_37ff_ffff unreachable from
every port. Give each port its own bus that skips only its own window.
On boards with more than 2 GB of RAM, each port can then reach another
512-640 MB without SWIOTLB bouncing.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---

Notes:
    Changes in v2:
    - describe the K1 PCIe address map instead of citing the vendor DT (Troy)
    - "more than 2 GB" instead of 4 GB (Troy)
    - drop the RFC tag
    - RFC: https://lore.kernel.org/all/20261112015148.3911178-1-montrealtango@gmail.com/
    
    Tested on an OrangePi R2S (8 GB, RTL8125B on pcie1 and pcie2): SWIOTLB
    use under load went from up to 87 slots to none.

 arch/riscv/boot/dts/spacemit/k1.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..949843bb7789 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1152,13 +1152,14 @@ eth1: ethernet@cac81000 {
 			};
 		};
 
-		pcie-bus {
+		pcie0-bus {
 			compatible = "simple-bus";
 			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			/* skips pcie0's own window, bus 0x8000_0000-0x8fff_ffff */
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
-				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+				     <0x0 0x90000000 0x1 0x10000000 0x3 0x70000000>;
 
 			pcie0: pcie@ca000000 {
 				device_type = "pci";
@@ -1203,6 +1204,17 @@ pcie0_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie1-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie1's own window, bus 0x9000_0000-0x9fff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x10000000>,
+				     <0x0 0xa0000000 0x1 0x20000000 0x3 0x60000000>;
 
 			pcie1: pcie@ca400000 {
 				device_type = "pci";
@@ -1247,6 +1259,17 @@ pcie1_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie2-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie2's own window, bus 0xa000_0000-0xb7ff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x20000000>,
+				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
 
 			pcie2: pcie@ca800000 {
 				device_type = "pci";

base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.53.0

