Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CE92AD2C
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032403; cv=none; b=N8OCFzdHpR5iogp2XUqjmk3HHN1QfX7iMv/OLbpnmwcxi+zjY+MH/lBqDYdw3RA9cBRhjOYtSWy7s3df7Ikihwx2MSu/QXD6i02sY2lp0FXCy50iv7ER6Ubes7pmE3nyawGWRm+Hll4zTBBvKfmSAQM+KfYAYg+AuTBFhBc+6es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032403; c=relaxed/simple;
	bh=er/Rf7GeNCbQhj8OCR+h68ddiNOINBqyNX9L3ydhTfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kzzJtFx8gx57X7rqLYNNJsfD+sd2oewePV05jdQ6ocaEEuXF37rvEg2RsNmOMjWYm2zN5S58R78trrpZovvy3TofKXp0BDoIS49gy/8k5ruS0eAV1rWhNgz2/48A1v2qNRbZZ1H3mWZwIikovuZKyHBmIqHfgbwXcMSx2no+bBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUhX5jgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwyKO5B5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUhX5jgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwyKO5B5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGwq3b3023802
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nMwcUTd0xqYO80wvVws9oXZcQyIt+B8oFPV
	Lth7/QHU=; b=RUhX5jgnL+wIyhRaMGSgHm9u5dx5cv5SpMMRU/TqEvbI7aCEcAQ
	eiKXF8s+7P+B0sys8SqMxHv6XBGzH3mSIQDfHzpZpb0osZ1gwx2DJVevqp4XtPxd
	9Ovv1KyY+V5vX8ApwTgn1wP0MIaW78NzNWbG6e98TxzzTITSHST0uFo7d3oWmQRU
	D5TxVYWXLCTiL6LpMSbepk0umsJMcvw08j/nxdIQU9z3RhOjHvtnvDj5gASwiGHg
	Y/po3YSAClrjucFreJR+LLaMmttvIZ2TPxT91Lw9DjEzcx8OpODvuIby0U2qykg5
	p9zmT6i6ILpcK0dRT/GfbJFLwA8Z8pb7aPA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfhnyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:40:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fb2a46cb5so54587531cf.3
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032400; x=1788637200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMwcUTd0xqYO80wvVws9oXZcQyIt+B8oFPVLth7/QHU=;
        b=OwyKO5B5d2YCZXn+uW3N6NGus7X38f9Cr0hBcVDoP6DpB2Cr5ODH6VXjxtm0dsYRWR
         w5twYrwe9Ptq3uCdD6Xm2E6HDAE0A2W7YCCNyhowV+SkDeUj3o2PSx0fV4NNnfU2Dluv
         7w9SKi9HW3yONvHb2MHxPyICsEAGQ88Qy4sninjVFRU11kGYZmLX7PtLN10Nbn2g2oxQ
         kPVcnA6v1aH6IQw1X8RPddGDdz/FEvHSYMbpzV7RANL7SWwoSOIvFakm/rzkSyv9eSbV
         uFMcafRGHATcyzfRJmR/6Lp73nL2r4USGYeniS7BVS4Y02w2Pqf4Nnr7n/AcWkF1FaNl
         wqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032400; x=1788637200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMwcUTd0xqYO80wvVws9oXZcQyIt+B8oFPVLth7/QHU=;
        b=n9fWElaWzTJoBnkUJpg63OFeRXFyP2qnUweGiteAv1R7w3axlTyqvtulkibg6Gf5la
         rTeEv5hsnJ2e2D+6k7YHGe/KtxIQS4JJZIapZ7nZlrFy8nsqVP3Rat/uBSbw4LzaliQW
         4g8D6hNTqBKbAYxHL/9LL+rh0GUe9yF2hVSmYK3gHChZ4DsyL8R5sa0SgKtEN1of3LX6
         m7xthe68lCf9XWyiymNSr/4g1vDK6X87+H/NIzgjzF7klhGOOkkykbi2UAM0mNQhDB89
         H4/dMTDqUZayH87emJv1PleT1RYXhq/YXj0FZzNEt7EhZQwP3rpF5LL5p9e69pvcNdJZ
         JcTw==
X-Forwarded-Encrypted: i=1; AHgh+RoFxF/98Ha7qBvSI4eDTV9GlVBrryqONMo8fjMnV5mpB2s1emT9KP5jkCwy4CdhvreUGO4vEM+yt0W5@vger.kernel.org
X-Gm-Message-State: AFuF++m0/6QxGSSigZcjn2UJ368CL4zN0BT9qVG4/iR4QPZHtjl9nmGT
	NbpfpgFdMDQRuEXIgc2rGJDhcHnrP1EFsan8samLYQrxDsuKrXS/H1ORavGjF3bypYAQN5xvh5g
	2RrITjupP3eLJ8J54KuBTkYGEK+e0ku2p6U0HSj7saKNtS1r8msrykwrpipyithIr
X-Gm-Gg: AR+sD12LuAraoyIr6NRCp5EPWgKfdahVuDSGLMbT8vSFI5tUea5INvWR6z/KzOU+Thr
	CGMAkjVKxGQIuXrz92eZ1rzz9Spxy6XR1PnA1IgI9XbMdMuLhrPgJLAzbRwXo+ssUfJU+UX+sB4
	tVU0oYgMbhFkTIAXZ78n/meZk6v7cV+qiI2xplyWR03LvbqS77XFa+nhnSFVA+kEF6z+tfovftJ
	HUVCqGzUqN93+C0YlblSFhPoIdIW7QCFHso75SnqwK1SYTFNtYxTFTa+9zr/N8Um0+6outhoOpt
	3VnvKvJ7lxBCefexLNkluj0JU3VmjFq261RQQwY3Bn6e950/54MS1zt7aCSfm6pevympIQCfu5b
	RS2AAcThAgdyMhwQ=
X-Received: by 2002:ac8:7d09:0:b0:527:7813:a439 with SMTP id d75a77b69052e-52fb94e691amr169213031cf.27.1788032400113;
        Sat, 29 Aug 2026 12:40:00 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:527:7813:a439 with SMTP id d75a77b69052e-52fb94e691amr169212691cf.27.1788032399737;
        Sat, 29 Aug 2026 12:39:59 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48432022ab8sm4710593f8f.28.2026.08.29.12.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: xilinx: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:39:52 +0200
Message-ID: <20260829193951.107616-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=er/Rf7GeNCbQhj8OCR+h68ddiNOINBqyNX9L3ydhTfE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzWHNp4vkWapk8o0ztEr6YUKdqCSNIqqoag7y
 6/FU69yyt2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1hwAKCRDBN2bmhouD
 1xd9D/4m+ux4/etHu43G3Y+N26Sa0wL8/qjHzd55QWHGpntqt2rTVAR/tOBf9HkE2fGGphDXmlQ
 UqeMDFkYD/GBzTHaf7qu7thJ2RTZ6hLl7TYWYYCV+qz64PEk3E7LDmiIOl4JLWPWGH+uyxD2wW9
 4R1YNsqeRN6M7f60oNEr0TuxReND9mxUAaRo+RSB7cNXwl/HFyaA7HKcD+8UcW/7qoEf2tFPOEW
 ulBYGe7Fp7G4BvlOifi0RTPC8YjD8vzUmoMwI31+Jh+CZlx8QHVoBU5Lbneqy5lYNzHDKn+ofsa
 eVbPqql/et7vq5tTN1bi9ap/dA88dmEll5OG6W1cyocEzoaXdGS/jkzcAHwUcmYnN80wwKk2M9F
 YFptSMGG3I9TG1Xezo3v+OAWp9kwURGhjr5X7Ua0jRBeGyB3WyqHcTZxQzWMXG0Y3pA+tLBfGyy
 moOPYcy9kEn9wvBEwB2EmQO71rCzsg/Arwh83IXnvIsmuOhHKpmdETj0QEN8N//ckgIubEgclJu
 Wrc/3JG9NvZlbrgRQVma/xaJuiS27nsPWefHKkHxHelUDutMRRVfM6vjUoC30if/iTYj93ZueOe
 e170qzRNzFtOfTefv09C/9fMdXhmVDCkmYXAl9dCxftAEzrZFmZB97ZzPnjDWHMdOzBSUEPb0S6 lDhMLH8vY51l6WA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXy1brJQ1qQjdn
 1bkxudS/9ah18pDEoV0IHuhNlZxfUEFwR34DGkp03vO6VmVNSdoA6T/YxnB7qiZcO1ME/3cdJ3J
 oxdYSwY6UuvS8BsfZjjoSmwoKTAcbgTBxS5pXPaX8xZl8OaeraY30k8TZDXH12ndWBp2KJLlwjq
 dSDtLzvxHM/03xlcuSlselFTVIis2eIrhvvItN3Gr/wRCom5TfHsGxxxzjzU0ahl4SuZKfdd0po
 zHeH9EMWQC6tcnucHEdN+Sb0NV/MrWYVELBqtfFHvPdKYvWwVPNyE70oo5eJJnTBEOmz/f0H3L1
 Z3fZqa8Loo3VGHQ+3bhH0RNUvpwyWimyZno/ZjDOtYOPhtZoqjxfH5ypwHHXsZeM738RYPkb8Mg
 g6UfRxq76RV7iA5Z4daFwspe85hJB3Po2HJ7e4eeyaRDz3MzqX1AE2xKAjtvtv2uzU4ppFIAmYP
 lljQ0IxUVVg9M+TEvJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXzUpFR1Q1mcFC
 xdp7p058dCxK+obPLSAYUoEwYIZb/7Tre79CA1ur1PU9W6y4g1UvvFQ7E3JTj4NKNdAaZXyac1M
 nqM2RhhMBKV1+cQjEbl+vcZlNDMZcQo=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a933591 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: VbWIJpAO27c-uKD0h-7P1s8yjMOh_Nbm
X-Proofpoint-ORIG-GUID: VbWIJpAO27c-uKD0h-7P1s8yjMOh_Nbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/xilinx/zynq-7000.dtsi      | 8 ++++----
 arch/arm/boot/dts/xilinx/zynq-parallella.dts | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
index 153b8d93cbee..715299f5d860 100644
--- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
@@ -380,10 +380,10 @@ dmac_s: dma-controller@f8003000 {
 			 * "dma4", "dma5", "dma6", "dma7";
 			 */
 			interrupts = <0 13 4>,
-			             <0 14 4>, <0 15 4>,
-			             <0 16 4>, <0 17 4>,
-			             <0 40 4>, <0 41 4>,
-			             <0 42 4>, <0 43 4>;
+				     <0 14 4>, <0 15 4>,
+				     <0 16 4>, <0 17 4>,
+				     <0 40 4>, <0 41 4>,
+				     <0 42 4>, <0 43 4>;
 			#dma-cells = <1>;
 			clocks = <&clkc 27>;
 			clock-names = "apb_pclk";
diff --git a/arch/arm/boot/dts/xilinx/zynq-parallella.dts b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
index 366af4fcf8d9..b4651540935a 100644
--- a/arch/arm/boot/dts/xilinx/zynq-parallella.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
@@ -44,10 +44,10 @@ &gem0 {
 	ethernet_phy: ethernet-phy@0 {
 		/* Marvell 88E1318 */
 		compatible = "ethernet-phy-id0141.0e90",
-		             "ethernet-phy-ieee802.3-c22";
+			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		marvell,reg-init = <0x3 0x10 0xff00 0x1e>,
-		                   <0x3 0x11 0xfff0 0xa>;
+				   <0x3 0x11 0xfff0 0xa>;
 	};
 };
 
-- 
2.53.0

