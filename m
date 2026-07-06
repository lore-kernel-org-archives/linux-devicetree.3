Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26674E3774
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330540; cv=none; b=P7S5j/xOXcExspDr0QA+U9ZWYgIWPiznj5lyIrmqONuNO9QhTHRyGWsXAx0sqGV6n1vTmWoJEa61URPub8c4eyqY98Yc8jw2gLAFEL3FbaSIT4No+Rb3LlLV9oWG6z3UGoXTlLeJVGXxEtgQAbiHlKM/nEHCHnodLA0L1l99FI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330540; c=relaxed/simple;
	bh=eIEOzhD//NGAkff8ufm0J15xyTStaX5cCnX7vkBYkyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0xUUUiglg86JvLAG1D4+G3Zy8mHqwKZRlCrIqyVMU9whYEco0baWPPNdI8OnRRW5g4Gj5L8uqUU0rv3uI6RdxaZzErCH7lkv5lJ3jPzWcFRXEIII0MaRSePFhrbRXxnoD/RH+VHEMx96azInophJ6Ghw4ZguNdvsIejnQySHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pbj490pZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZC+0Wsv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pbj490pZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZC+0Wsv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693tIc4172351
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6+5lE7ilLsL
	woQEluALM/vn0y9JfV02RJOJEvWyumEc=; b=Pbj490pZ7DPdHxlQjFBc60XFk7L
	8ajFrmPHjjtBsh0obbvlbqL8CtoEtBN/EqmJEgGxgVBtvkq9YNXMGdDpmWzWJ24u
	oPF40HtfewilHOjF/Ex2IW0TvJ4SBD5eibuPInfYrZHXES7Zq9Z9E5SA6oPy79HM
	lQo52C5miEe9pMptLXYKKi81CbDUYFql9+EahE0GJvqqIFhkzh6Hp2F8afKXu9Fv
	nHhLEY3nDh5Edtgf/coavUE4YkVxb8krWli75h8x6K7+n9ijd8UPKpCeRayzm+hN
	SwgYqdIOC7BTR6GhJUe7Dp+C/IUFol68TnNd7UII/j/uOy1K5DWKtDF+PIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t889bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:35:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so275596285a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330533; x=1783935333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+5lE7ilLsLwoQEluALM/vn0y9JfV02RJOJEvWyumEc=;
        b=MZC+0WsvLZ2NsO1JmJaEzY9sGsZYXl9162Xl+yiB4z4f+SniBzZpZMN7v132eyaD4s
         oUrPDH1WWZ2wq0rFqxZi0XaDwR7j/XwqcNk6Od1NTt9lC05s8R8gl9cmg2OXoRhpzTWk
         wk/PgRglMQlChxfHybsS906MFLPxc2kVn/wAowgZ2Un6un2Of1ylCOSfazERI4KXW49b
         dH3LlvD6jJ9eoMBBo3c5XZsHNUgEfSYkdG1kb7O7+l0X8VoOwxtwgZVRgd1fh2V9CGDC
         zHCj38iWPXJwMJwXapVapBGwXezLR6VjqSPOAQ6Z9RqPBw8QtXlTfVFPaudGkJA6JQi6
         t61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330533; x=1783935333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+5lE7ilLsLwoQEluALM/vn0y9JfV02RJOJEvWyumEc=;
        b=Www7Wg12BqF19DNGpwLAzavN+8l+sjA0K0gKsIu/sSRzRiV8CE2Cg5VmUrtjJ0TUVt
         R5O6XFDlcixCsCuNNT6JbgaOd9ycvHanEViZG+lvjMXNHxXIBACFQC7R6tB+/a8l9h7Z
         yv/2ZH+E8tkwE7gbtSYVibphDtTOCANGAcQDu9aHG0OJ6eG4xUwfZn2Cuejq4zK5oPvB
         qlwYDdFsVRtczzo/65B1PXCw2d3sDlAtte6lJTXuX1CLBa39kNWblwDwOlV4lKmPH1Q6
         D7SXMIOK6C0gIlbmH6bTiIhE3aXkNW5YKEQzWtSeNm+bK39sbm5E9ogobJAtuKC76k78
         dWFw==
X-Forwarded-Encrypted: i=1; AHgh+RrDcay9LF/RmcafUu9As47yfjs8HsP3EhU6SpR8vOTbr25oMMHDXDGyamTTzmm0ZxmUKdUcIbps0+2w@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrx+2jIyFt7ohLhYs9OTCa+Fn4pPJxexoGZI2uSKJ0+4kkaHsy
	W84ca7E+bgfT9MO7QjKeCROXY7tt77oUAxs/Tf+SXOzfavuADiiZ2JRCOVwkWFnTSnXakSFeTW5
	EgvvtdG8VuQejE5jp2iJ2iLQ6lrjjVdcil4izKKsWqDHEIFEC1dHFHlBybWs0GjuO
X-Gm-Gg: AfdE7clz6ksRUubYjV2pkiaewB8HE2WsQSwgwVKu6hgl/8zZ2GckBqGZ2joRSaMKH3w
	Fb62hJ88zrfxIi/nTQGZ76K9TMlg6KtV3B4ygf5eIl0UNigvX/x2/sj0w3WQ/vxuPPIzcOFlwkd
	1TJtHvIIJB6XD9J5cBLwn6nn0NBeLwUVPmra40if7TxAhLrzPK9NfouwLoo4JfwKv2RPTxq6SCk
	kH34A5o8nseYzxO3jsg1OV1wtgtp/doOybG/pDPQmUKMn4te6DISi6w9x3VYPQZd++RRmKEHx0t
	TJUX0iIM0QVniMa3eyMyRXGPQlOdLYaahKOL/3kJehxlv/Mznh14G0eil/zMVbOwbULg67bh9qn
	j4w2BB35N3jkuNerCgPbRw0zDabk=
X-Received: by 2002:a05:620a:4096:b0:92e:7d53:8e83 with SMTP id af79cd13be357-92e9a4f2cd4mr1240861985a.56.1783330532657;
        Mon, 06 Jul 2026 02:35:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4096:b0:92e:7d53:8e83 with SMTP id af79cd13be357-92e9a4f2cd4mr1240858985a.56.1783330532161;
        Mon, 06 Jul 2026 02:35:32 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce11497sm290925905e9.12.2026.07.06.02.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raju Rangoju <Raju.Rangoju@amd.com>,
        Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
        Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: amd: seattle: Remove useless xgbe DTSI include
Date: Mon,  6 Jul 2026 11:35:25 +0200
Message-ID: <20260706093523.274093-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706093523.274093-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706093523.274093-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6482; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=eIEOzhD//NGAkff8ufm0J15xyTStaX5cCnX7vkBYkyM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3bcvp65RtPTDKzIG6Air43gF1sJufaUcjkMr
 zSyhPmkL+2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt23AAKCRDBN2bmhouD
 1/+6D/wN7RfYnANjffxf/4w0QcMEmdt5CPHK2d/uWJChjvj5SeyxFt5svLboWJf1pBMesC4fXw5
 DoTa4412flPJavW12LCKzCjbch/h6b/lNod7x2I9tSk9sDZ/F24n03J0/ZUEts/pmTmyjeBANRf
 aoFdesoboBQShvAwQT4NNZn7ytV3/rGHDm0q7nIT0TS1iMMcV4/3ZqByewUR0u8Drg+ERTYkE2+
 uoHHD7wJ+MHfR5w2vurMGZEWUcNIrbL+94N7RKxe1kYxgks/ZDbr2hN73sNmHvmG8qyRxZhcQ53
 uufAaAB0J3DdvdTRPoS7B0mi5Jz1FY1pKPVp49A3F/Kzc1yf3lObuSO3hVvX/jIqtHZQ7d+Cxo1
 jUhK+UZPdJ/XmXK/z2tNiC+cSwpVGNSVqR0UTDxubrmy5wYkSSbNI2YxJOCn8ZCpkYsjcSqEj3a
 ZBU6Lx9r4lNXEiAldP/J8USy9Pb6BlDAWklEm9XsF0rZhTq295ds9zydlQ94g8JGWb34wW94hR2
 jBG488QGCkl3Qf7DdO1C0SA74Pk3o9Se0+UN6yUlewe2IUsC0IfB8GI8LmehI+HvI0VkixFU9Et
 yMnn9MbPybroOwRArxdcH1pNjmyiXF39vMq8mRohnQT0Ws5YTSqsPlQ1FleQSAwmG/k47aaPdOP DgUc790dC2p1adw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX/PI5EYyF1L9L
 N1hBk+MTQV3vOfn1AmkUTNlfDRl+dFqqWyPkK7h1CfJfhxOJ3E3qX7Jrkw4kGd/LUk/FtprKmha
 A4Xgyn47NIpKneMhltFy6WI50UzjnDQ=
X-Proofpoint-GUID: CQ1n7-8G1_iTsu5m2spm5QG1R3cgBoqE
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b76e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=EJugBUHlmtfpvM5MZ8AA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: CQ1n7-8G1_iTsu5m2spm5QG1R3cgBoqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXxX9CgaoWcm6G
 VZxbn1UKrxTlg2PfqF8qStZpN08ECcf45Ye6kZDXgh5AVjHpNErK3eGcrhXIuKjTguRCee3miD+
 yXjcGHistH/M4hVFWyFtxfZ+aa3Au6qJ5m0sici0eJVqyhcPMcOw1FDcV8Kn8O4Si27NYvL/h8T
 LjO+7j5wiVLl5YoxIHpKR4bJuv/G8WhAKG7EOFT1X9wP6NnIXPWeNZwrJ6bcVkWgX9y89/W4UM6
 MSHyD1HCV46r8QeWfdIl76s9XA6ad2/DXHwD62pPX+x8k3uPOWbf1H4nceu0JJI5UfpJGQBJ0TF
 IiPLZTtuRZAk392f+otZaOYfDf0SchkjfKoGWaeXEKAdvNYVlixDvbVmhlM3vENFlNGNfJUGsJI
 tkWHfVtP1rceBWNO3UmKFRZRJ1tPptyTRB6sBMnrzHVvRa8/wfhmBblKpSXa5+RYJ3kvWcmhOX3
 dyQ/0pFhF0KWlZio0jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060096

The "amd-seattle-xgbe-b.dtsi" file is included exactly once, so paste the
contents directly in proper DTSI.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/amd/amd-overdrive-rev-b0.dts     | 78 ++++++++++++++++-
 .../boot/dts/amd/amd-seattle-xgbe-b.dtsi      | 84 -------------------
 2 files changed, 77 insertions(+), 85 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi

diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
index 8862adae44e9..0860fc7a6927 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
@@ -71,5 +71,81 @@ sdcard0: mmc@0 {
 };
 
 &smb0 {
-	/include/ "amd-seattle-xgbe-b.dtsi"
+	xgmac0: ethernet@e0700000 {
+		compatible = "amd,xgbe-seattle-v1a";
+		reg = <0 0xe0700000 0 0x80000>,
+		      <0 0xe0780000 0 0x80000>,
+		      <0 0xe1240800 0 0x00400>, /* SERDES RX/TX0 */
+		      <0 0xe1250000 0 0x00060>, /* SERDES IR 1/2 */
+		      <0 0xe12500f8 0 0x00004>; /* SERDES IR 2/2 */
+		interrupts = <0 325 4>,
+			     <0 346 1>, <0 347 1>, <0 348 1>, <0 349 1>,
+			     <0 323 4>;
+		amd,per-channel-interrupt;
+		amd,speed-set = <0>;
+		amd,serdes-blwc = <1>, <1>, <0>;
+		amd,serdes-cdr-rate = <2>, <2>, <7>;
+		amd,serdes-pq-skew = <10>, <10>, <18>;
+		amd,serdes-tx-amp = <0>, <0>, <0>;
+		amd,serdes-dfe-tap-config = <3>, <3>, <3>;
+		amd,serdes-dfe-tap-enable = <0>, <0>, <7>;
+		mac-address = [ 02 A1 A2 A3 A4 A5 ];
+		clocks = <&xgmacclk0_dma_250mhz>, <&xgmacclk0_ptp_250mhz>;
+		clock-names = "dma_clk", "ptp_clk";
+		phy-mode = "xgmii";
+		iommus = <&xgmac0_smmu 0x00 0x17>; /* 0-7, 16-23 */
+		dma-coherent;
+	};
+
+	xgmac1: ethernet@e0900000 {
+		compatible = "amd,xgbe-seattle-v1a";
+		reg = <0 0xe0900000 0 0x80000>,
+		      <0 0xe0980000 0 0x80000>,
+		      <0 0xe1240c00 0 0x00400>, /* SERDES RX/TX1 */
+		      <0 0xe1250080 0 0x00060>, /* SERDES IR 1/2 */
+		      <0 0xe12500fc 0 0x00004>; /* SERDES IR 2/2 */
+		interrupts = <0 324 4>,
+			     <0 341 1>, <0 342 1>, <0 343 1>, <0 344 1>,
+			     <0 322 4>;
+		amd,per-channel-interrupt;
+		amd,speed-set = <0>;
+		amd,serdes-blwc = <1>, <1>, <0>;
+		amd,serdes-cdr-rate = <2>, <2>, <7>;
+		amd,serdes-pq-skew = <10>, <10>, <18>;
+		amd,serdes-tx-amp = <0>, <0>, <0>;
+		amd,serdes-dfe-tap-config = <3>, <3>, <3>;
+		amd,serdes-dfe-tap-enable = <0>, <0>, <7>;
+		mac-address = [ 02 B1 B2 B3 B4 B5 ];
+		clocks = <&xgmacclk1_dma_250mhz>, <&xgmacclk1_ptp_250mhz>;
+		clock-names = "dma_clk", "ptp_clk";
+		phy-mode = "xgmii";
+		iommus = <&xgmac1_smmu 0x00 0x17>; /* 0-7, 16-23 */
+		dma-coherent;
+	};
+
+	xgmac0_smmu: iommu@e0600000 {
+		 compatible = "arm,mmu-401";
+		 reg = <0 0xe0600000 0 0x10000>;
+		 #global-interrupts = <1>;
+		 interrupts = /* Uses combined intr for both
+			       * global and context
+			       */
+			      <0 336 4>,
+			      <0 336 4>;
+		#iommu-cells = <2>;
+		dma-coherent;
+	 };
+
+	 xgmac1_smmu: iommu@e0800000 {
+		 compatible = "arm,mmu-401";
+		 reg = <0 0xe0800000 0 0x10000>;
+		 #global-interrupts = <1>;
+		 interrupts = /* Uses combined intr for both
+			       * global and context
+			       */
+			      <0 335 4>,
+			      <0 335 4>;
+		#iommu-cells = <2>;
+		dma-coherent;
+	 };
 };
diff --git a/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi
deleted file mode 100644
index 18b0c2dd1b2d..000000000000
--- a/arch/arm64/boot/dts/amd/amd-seattle-xgbe-b.dtsi
+++ /dev/null
@@ -1,84 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * DTS file for AMD Seattle XGBE (RevB)
- *
- * Copyright (C) 2015 Advanced Micro Devices, Inc.
- */
-
-	xgmac0: ethernet@e0700000 {
-		compatible = "amd,xgbe-seattle-v1a";
-		reg = <0 0xe0700000 0 0x80000>,
-		      <0 0xe0780000 0 0x80000>,
-		      <0 0xe1240800 0 0x00400>, /* SERDES RX/TX0 */
-		      <0 0xe1250000 0 0x00060>, /* SERDES IR 1/2 */
-		      <0 0xe12500f8 0 0x00004>; /* SERDES IR 2/2 */
-		interrupts = <0 325 4>,
-			     <0 346 1>, <0 347 1>, <0 348 1>, <0 349 1>,
-			     <0 323 4>;
-		amd,per-channel-interrupt;
-		amd,speed-set = <0>;
-		amd,serdes-blwc = <1>, <1>, <0>;
-		amd,serdes-cdr-rate = <2>, <2>, <7>;
-		amd,serdes-pq-skew = <10>, <10>, <18>;
-		amd,serdes-tx-amp = <0>, <0>, <0>;
-		amd,serdes-dfe-tap-config = <3>, <3>, <3>;
-		amd,serdes-dfe-tap-enable = <0>, <0>, <7>;
-		mac-address = [ 02 A1 A2 A3 A4 A5 ];
-		clocks = <&xgmacclk0_dma_250mhz>, <&xgmacclk0_ptp_250mhz>;
-		clock-names = "dma_clk", "ptp_clk";
-		phy-mode = "xgmii";
-		iommus = <&xgmac0_smmu 0x00 0x17>; /* 0-7, 16-23 */
-		dma-coherent;
-	};
-
-	xgmac1: ethernet@e0900000 {
-		compatible = "amd,xgbe-seattle-v1a";
-		reg = <0 0xe0900000 0 0x80000>,
-		      <0 0xe0980000 0 0x80000>,
-		      <0 0xe1240c00 0 0x00400>, /* SERDES RX/TX1 */
-		      <0 0xe1250080 0 0x00060>, /* SERDES IR 1/2 */
-		      <0 0xe12500fc 0 0x00004>; /* SERDES IR 2/2 */
-		interrupts = <0 324 4>,
-			     <0 341 1>, <0 342 1>, <0 343 1>, <0 344 1>,
-			     <0 322 4>;
-		amd,per-channel-interrupt;
-		amd,speed-set = <0>;
-		amd,serdes-blwc = <1>, <1>, <0>;
-		amd,serdes-cdr-rate = <2>, <2>, <7>;
-		amd,serdes-pq-skew = <10>, <10>, <18>;
-		amd,serdes-tx-amp = <0>, <0>, <0>;
-		amd,serdes-dfe-tap-config = <3>, <3>, <3>;
-		amd,serdes-dfe-tap-enable = <0>, <0>, <7>;
-		mac-address = [ 02 B1 B2 B3 B4 B5 ];
-		clocks = <&xgmacclk1_dma_250mhz>, <&xgmacclk1_ptp_250mhz>;
-		clock-names = "dma_clk", "ptp_clk";
-		phy-mode = "xgmii";
-		iommus = <&xgmac1_smmu 0x00 0x17>; /* 0-7, 16-23 */
-		dma-coherent;
-	};
-
-	xgmac0_smmu: iommu@e0600000 {
-		 compatible = "arm,mmu-401";
-		 reg = <0 0xe0600000 0 0x10000>;
-		 #global-interrupts = <1>;
-		 interrupts = /* Uses combined intr for both
-			       * global and context
-			       */
-			      <0 336 4>,
-			      <0 336 4>;
-		#iommu-cells = <2>;
-		dma-coherent;
-	 };
-
-	 xgmac1_smmu: iommu@e0800000 {
-		 compatible = "arm,mmu-401";
-		 reg = <0 0xe0800000 0 0x10000>;
-		 #global-interrupts = <1>;
-		 interrupts = /* Uses combined intr for both
-			       * global and context
-			       */
-			      <0 335 4>,
-			      <0 335 4>;
-		#iommu-cells = <2>;
-		dma-coherent;
-	 };
-- 
2.53.0

