Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD023414A0D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361030; cv=none; b=Dkm+wGhjWKVOwihWTyVtVB3JeDmNgbDhhsjd/T9sqslpVaK0iTF0qUUZzBX8MJFxI6kqUMQ7hLt8RczSpBZi8Bf8dtQ44jbwg6b8MyTikUSFO5vJ72Bs+erQTpLI/QMtpbuM43aTIqXlxsX0yCgJWP/nIXVZArNyE9bsNEkOfhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361030; c=relaxed/simple;
	bh=wxqlQgOFlxU9wtZFIj+bxUB6IUCGyKInUDvrV2eduxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bt4lOQJ3ikDOQx9cvrLsxA9/hVN1vuuerUiG1VwAgsXbLAiTWCA3Trj07M7sijict6n18FIzKNMy7abJm+OSog7AYwE8H4hDRqoYSDVT9ddTRYqrpdZoptBHziXJRftTIIol9cfVGbM9+sCRBASC2s7lDAN30Rv+aBeY7F/4fpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKh5ZZxB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlWkOVig; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKh5ZZxB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlWkOVig"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FsWiQ1049987
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 18:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktR
	YliMwimA=; b=nKh5ZZxBa3kB7iPP8aqSOk2ssnjxifUKfLbHryOXna9ZcjjqbXC
	4vLkZ7S7It3+6kus+AOhjqSLq8SwdrjTxbEJuGHihS8GYXSlm294SKplOO7DMIT8
	6eSQ5f5tRUVGgOBYTU1Ki6w9+fnOui7CQZMOG2D5wQTMIT+e9b9L+e/vWZmwX9jc
	gJpayWxUaTTIjFHSjZ5NT4lXHBmCpEPxQx2rn/Igk9FvceanpPxcAuOL7b7Aj5p1
	V9kr5KwpJMpcSFuOeXVI6hzYKbCaD5ngLBDlDlLrbiTWNgbFka1msxPtiO6H+xK8
	LOFK86iBroLz8e0LDWsXD7dM3AufEI9X4Dw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw0kvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:03:47 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1186177e0c.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361027; x=1783965827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktRYliMwimA=;
        b=HlWkOVigzVNojaW78Z0v5Fb4OkDTaDLUzV5+ixyMa+KlJTpu4zE44tcUlCOo/WRdYJ
         ylFSfsQKHJCk27Z2WSz1vLlHg7IuKz9bqxm/QQ4Xwss20p9UmDf3xoDnoE9Su5Ukl7mA
         24Mb5VDzpItxmy2kC5+RZjfoP2jvBk/odiBcanD2p/WW3baPpOwYYMWpKglkZAvp0OMc
         PSRUHPa+RU8bf8RvL/d9LSJFG4VLndGh9yc8nhrvhWHd3COF2E2FbHDL4X3NxUZXsFQG
         QMO3G432NvkucYD+6jpBYbFCpmZXGP9skPq0m58bxqEU7YV7HmzCuh6mpRZFHn6iH5ix
         okhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361027; x=1783965827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9jpAlBCiiA3kawvpT/XdJ+8Y/o47jPbktRYliMwimA=;
        b=FzZaB7311aobnGddTf9+2GDX4RL0RorQprEan0/ufbOMyMikrtl+7MaFLpK/j/Q8TJ
         la/9CPSW3WaVA3DOQoHty/AKhuFMlxfND0n9QM4feczD0HqkgDRCLUXNhj1DWwRAWOt5
         HhCrk+Tk/aKss4GOVctggsFjDoP/bIPzDbZ+iCOShumDHrWLHDJp9fG6lU37yHBE2Wd7
         pd55t/7zNbQ+K/M6gYyAxqJBNnIc8CLDGQLB/8Nkn5H/YQY2ZLKc8VcXK9LH57JbHphu
         t5hdDTHj5MRvHzmf1f7uRZawiHeC+Y6tZK2RXQIF77WloF+g2ZdFDPUQFhQS63z+Wloh
         wlWA==
X-Forwarded-Encrypted: i=1; AHgh+RqQ6x4fjY5uNkZ26v/s2wAfxryililZ9ECkQ4H86Z1zUIr86B5riM316exQH5Uu7jKyb7TE2L7r05pj@vger.kernel.org
X-Gm-Message-State: AOJu0YzqSOc9/CzgYtowmBKY1ts9g6jETOsIacnGo7r/ihrrqNwDoNjo
	DpAbcMfBq4gu0hoimiX+C+RbcdO8yi0j53PFV7vb3WHv3rg8sTcC3ig3sbTkfJMBVkLCAC67VlC
	LtkpV/mVtscApRu7qCiAOmtu6r81vjdcRTvtD1uh3VgoYU8AcSYJ0h/fwwQtY/10A
X-Gm-Gg: AfdE7cly+1E5aFD+zUChE0FCkhAXB0XzFXV7TZZqssvN3LxeOiLRfSpjsZxTqfb434Y
	Q/K7nuz0XoFK249M8fQUijiYbkgVGNtiZbLAIoQ9b/6SKkpU3mixesOhx7xSpV3Og8pg9OL5rAk
	7wfLBDHgO0mxxCYedSRprguth6B/JqWHlTkP182YO7e6mqZJsG5rMg4rrt8biern8a11QlLSS47
	AL9OnH0PO3V3fNOkhNJ34IbjhyxeFSeP1vuFmm4ZrQpj8i/Pvka+5ia9yXs20daEJOWVwr4FiVh
	gBjkFSc/XW7oa5XexyIrZWS28QpACnabHLxsT10PBrcySLPohJfmwN21KxDjUwW9giF1KBBmHHo
	Bvae7LTNdBxGEPa6g+ue9BhxkSt4=
X-Received: by 2002:a05:6122:6e0f:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5be9071c985mr891907e0c.4.1783361026901;
        Mon, 06 Jul 2026 11:03:46 -0700 (PDT)
X-Received: by 2002:a05:6122:6e0f:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5be9071c985mr891880e0c.4.1783361026425;
        Mon, 06 Jul 2026 11:03:46 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e00b769asm1108555e9.14.2026.07.06.11.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:03:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] ARM: dts: marvell: armada: Correct indentation
Date: Mon,  6 Jul 2026 20:03:34 +0200
Message-ID: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wxqlQgOFlxU9wtZFIj+bxUB6IUCGyKInUDvrV2eduxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS+317/9xR+re4ch/w/EUA21oeJ2J8KO0WF/GC
 1JgRkgO492JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvt9QAKCRDBN2bmhouD
 1zacD/0euTfB+3Dq0X80/dtVuLMT0xR4YOJa6nhiLZyH2OOeGEPx+IDWJ91aMGvxBpsG70IINbQ
 EqDpzCpbW5q4GafLxAQiYMrjZbn8quhJ6aIHX5NfQmrSGPyNC27rFLyyBwJcFeWmFJzqocnf6v7
 YuGb82x/clursl5UmJbcOmOynJLXrpFW7XxPheAnLrnHhb/iWkJhGwcWmODnM5pbDDYQLATdwuz
 CE/LtiZPe5W0tA1VLiwL9x9WfGceIsZ2aoSChLJuKbPA7HCCOx6S9N5b/i0OL1k0ywmtWFZt/eD
 f7eoRsnC2sEhS0rJZxUVa0He6E8sTcTC3HjpjSANIkQPtQgUsU3fhbZeoDZIUWCm0es4r0QGdWr
 yZyyy6h8rODECWvwJ/bqHvmAEepfY5pBS8Wil6UgmWzG8A5Wbylaw/jt4Ow+U11eut3XWhIe/km
 itdAOVnJOWZjQdD51YkNzEt9zgCtm3XFuB1+qxjAvbmsjqS58GjYJ8r1YBozkUIfl2OvtSAf6GR
 07pcOXQdxKjn7fKd97V8NMECdz+dhYK4lmP2uJd85P/6QLiudEj5bBp5/ppPvTwDr4sssK5Hs/7
 Ku2qAmmdq5c/f2uxyjiXiIozDVUjDg5TwaG+pSp2jLxBm80JC2HA4hlFEjka7fht30ELYLUzGtc a8oBr08wpi1uZsw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX+V0Arg35+380
 ygBqjXps7GcgGUgzesxeY2TotCJyEvE7ycKy6/oM+mNGoY0ogRBlUGqjptElR19TkMgeyDelock
 cEJoy4Z85gYtZj4v3bkemzNY+Z6sQbs=
X-Proofpoint-ORIG-GUID: hiYqCmkv2s0rMeE0Aoqr9oMhC9U-h9-i
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4bee03 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YZ7BP_YtM1ypoUlq3ucA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX/h7YT+o2eD0K
 Xatr5Jwwk+HUkbVrPwyoXD7f9+9nTSBR7TTip9gLKi9LWnw1g8Q43BCzfk4bbD/xKO8MvuEThrc
 IPyfpWlP7lAJKfmz7f+krWcUoD+akj5/GpA9RjPBPjEvyvss/G3VcwBwVHZOWBqniHS9KFypRW2
 IhYoLzFj2AfpuHjKyA8kheEmU3yBZExcuvJSLR5PvdTxRb110VirfFpQsREbBdyGZe4uBA+h7/e
 V/2NwVyIZJLh68aqevi/QcN0x/gZrpSZyQZDmx+LkBFGzgSBkL42DqrSvdUzVJQpd5zCM7dul6Y
 WuRZIITsXGz1Gr7FVqWh4hDnXppO9ft58zigDflR+hiOuVjxN1hN+LsmMcS8wA40p2UnNyVwULo
 iBfcykhQA4XnXVu6KSsb2byjZCpSdsGlKEdC562OGYeHvqmnAfftQmKPcLn9CAYXPvIMMbvLzs1
 U2ZW4vgzEiN4gFy1paA==
X-Proofpoint-GUID: hiYqCmkv2s0rMeE0Aoqr9oMhC9U-h9-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060182

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/marvell/armada-370.dtsi  |  8 ++++----
 arch/arm/boot/dts/marvell/armada-xp-gp.dts | 14 +++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-370.dtsi b/arch/arm/boot/dts/marvell/armada-370.dtsi
index 2013a5ccecd3..cf73287501da 100644
--- a/arch/arm/boot/dts/marvell/armada-370.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-370.dtsi
@@ -63,8 +63,8 @@ pcie0: pcie@1,0 {
 				interrupt-names = "intx";
 				interrupts-extended = <&mpic 58>;
 				#interrupt-cells = <1>;
-                                ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0
-                                          0x81000000 0 0 0x81000000 0x1 0 1 0>;
+				ranges = <0x82000000 0 0 0x82000000 0x1 0 1 0
+					  0x81000000 0 0 0x81000000 0x1 0 1 0>;
 				bus-range = <0x00 0xff>;
 				interrupt-map-mask = <0 0 0 7>;
 				interrupt-map = <0 0 0 1 &pcie0_intc 0>,
@@ -91,8 +91,8 @@ pcie2: pcie@2,0 {
 				interrupt-names = "intx";
 				interrupts-extended = <&mpic 62>;
 				#interrupt-cells = <1>;
-                                ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0
-                                          0x81000000 0 0 0x81000000 0x2 0 1 0>;
+				ranges = <0x82000000 0 0 0x82000000 0x2 0 1 0
+					  0x81000000 0 0 0x81000000 0x2 0 1 0>;
 				bus-range = <0x00 0xff>;
 				interrupt-map-mask = <0 0 0 7>;
 				interrupt-map = <0 0 0 1 &pcie2_intc 0>,
diff --git a/arch/arm/boot/dts/marvell/armada-xp-gp.dts b/arch/arm/boot/dts/marvell/armada-xp-gp.dts
index d1d348b91c0a..65cc0373fe04 100644
--- a/arch/arm/boot/dts/marvell/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/marvell/armada-xp-gp.dts
@@ -34,13 +34,13 @@ chosen {
 	memory@0 {
 		device_type = "memory";
 		/*
-                 * 8 GB of plug-in RAM modules by default.The amount
-                 * of memory available can be changed by the
-                 * bootloader according the size of the module
-                 * actually plugged. However, memory between
-                 * 0xF0000000 to 0xFFFFFFFF cannot be used, as it is
-                 * the address range used for I/O (internal registers,
-                 * MBus windows).
+		 * 8 GB of plug-in RAM modules by default.The amount
+		 * of memory available can be changed by the
+		 * bootloader according the size of the module
+		 * actually plugged. However, memory between
+		 * 0xF0000000 to 0xFFFFFFFF cannot be used, as it is
+		 * the address range used for I/O (internal registers,
+		 * MBus windows).
 		 */
 		reg = <0x00000000 0x00000000 0x00000000 0xf0000000>,
 		      <0x00000001 0x00000000 0x00000001 0x00000000>;
-- 
2.53.0

