Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595987;
	b=wWZifVkGnUpSSYGJWUpIsSSyqXCVSdLgPIWOJarMEjpFgG5LViFcx2QY24tnmzTp/MK+
	 JiEsslOtWwoQHxXBgbv61rXs1+eXItm6x/9JaG2NT4r9C6ekYGttBFEkWGDS4bDb7TopO
	 lC/weA3bXEw4Q+NvbWk7V1MpKpTQk44WswGfF2M3E52rxvfEN8Q/LZP3Xf6iFTQqtJnmn
	 neNwlvxf9W7P8bhjLiZG6JA29N8b0gwMLpJuGFhVwzRg12Qrv0rWYJtVZi8GyPhAqvZZb
	 3Wtw32Fr2i5ExKXr7vHRrF2XJBb3hc7rFVwLB+ZKb6/LSqXvwwJiZ6CnkKEIFgjJGJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595987;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbViJr9j8Gc=;
	b=0Cjh1V/7Na5OgpVsOQfF7ADLm9FmeTyeiuRP4YUSUJ5jLyRSVEcxpJtydD4sqLBgE8tS
	 lL47BI0y+1aPOS2RMkaNruMS8YoDwf+O5aooIYDlywtBygoT1SScIiQ+C017rVgU5IOyV
	 e44IuT0LoF3YfqLYmSLVO20eAGX7Sa90CSiAjQ4V8IlQWlyqEthCkN/A1wgQHDLVcS569
	 vRJyxstW8sYcdNDUiWByVogfFM9L+5F06RLijERzpMkyQ47Fk7f0pgV7PNGqou+0BAjqt
	 OAeyeL0U/E17CUkKze8KH6E1E5OAQ/fyJoHvUUGJY0Hn9tDgNND15hQs+TXJdGheQjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Lm/6J2bS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aPFMUfSa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC610606A330
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC610606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lm/6J2bS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aPFMUfSa
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR9Gh1190013
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbV
	iJr9j8Gc=; b=Lm/6J2bS39mi/8jY2nPG2dm3lnkbva2OlyFU5v5htN7Z+k1UFWq
	+SMZzkYnIBHErHV+xx9G6r7BwGbGaQ3k8veI5kUPN7Y0wWaEMSl58K8GNb89kkJl
	HdjlH9WRysOTCUGt0U7kqFPsV3W7n7T7ENO51W+v5e2UhU7rPC5CG0u3ilCTzduN
	tSV09vVpzYf6IuhhrhyLLTl3vqmdsiJF1NPJOUzZkEdYxhkVCaF1gF87pUVZNnY7
	147r2RaElUoiprfO1tUyxfd2G8J33KocaS0Svp0bB38k4zPSqtbCs5adH5M1WUco
	NwAvy34cS1cCEq999jwla1M2bXLPnRwjz/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkr5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:53:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so146840485a.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595979; x=1795200779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbViJr9j8Gc=;
        b=aPFMUfSaUhR6enKJ+sT2F6JqEXzN3dRPOE5Ymza8IOXtRZcWGeXSZGbfrpoVEXoKjK
         DxKnQEE18e1TvYn93RRx80s+KJlGEx7Fxhh8tKuysCMOO2e1AoPMMgrieGHgSGfqeGI7
         Mnm113JOP6LnTXITejumcmyO/IeTpUsBEwD8ujtAqiIS7bm446WlLB8b3KegR2YrkGuC
         KnpbR/ijEdh4qGLbdRS4L3byEIZi1MpzOs1HrcXHQTwS1A13VWwDPuwiMIYrZ90FPWV6
         ce4Wyrptx5zy9qtJxJmXejtZqMvv+UkjHL1LHmyUki0dW5fZVMKGkTSNE/unZlgpuU50
         oYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595979; x=1795200779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCg3H0K8/dT5+DN6QiZD15kJMTnaUpl2kbViJr9j8Gc=;
        b=ZaQKSJcj5/KZqT2+e7slU1rsOzZtRwDleB1iifJJtNJ1/5s5HOYJenDvfqIes2N1GE
         AEBYTuATf3TNQwnNCvQ4HXLNQUQ5yPzSrkzQU0XJNkJh8Peq3/xBWa/VpfAUx1DZ804m
         wJmAqxXsRs3GNUzh8Op3LKp1P4K0bvq1Iadx8Is1WoWIEGYTyLobyNOPW8BPk2AwWIpu
         qQXyJjUKeaGB/OP3pKmLBmaO42727ifpzNsiipStm+QrW3iMBsqT7C3W3p6jPjwFDTiC
         XwpMFvS7snD88e2qIFe39GBCClxT1l78fbwrqmscAYXrRIoUPcRTVKK3FVh9CS0MOJ9v
         ohyA==
X-Forwarded-Encrypted: i=1; AL+hErG03qwY33J6yZQKdILxtnHxGrCkSGqyxgIMerpP62Ecg+BK9fcQ539u37fq7TOwiTVTnuvYzkMBvnfV@vger.kernel.org
X-Gm-Message-State: APuU4Z9TxFOEiYdGvS82aG7KTZkoVvZpTIS1gKRoSi5CkWz87F33Z1A0
	oD6cwk51sq0LStrjYqWtvYVYfHJ+thbU9Yupg5MXkMPt8gsJGgnNhCeWhG/M9o8XzJn5+AcLIF/
	d9P3KZwmpaTgDB/7XPHA7ZC4Onm5IiRAGsFOgnaGBf8YlG6tOZYtDhOLhu5+NFo0O
X-Gm-Gg: AYBFou37N+gyoDfOvihWOAGLBfgZ0ZmHdJxtno/CWDbDrir5YqyHvwCkkcbPFx+xL9a
	3VpRvdU08/eNBwu5A7wV9t9mmngyYcEZOASU2BsvN0FvoSgqBLpD852pRP+wqUXAmPGZcjXvc3Q
	V+CNbeCCaCklNsaHcZ+NK/cg2ESArl+3nHptnm7HLuQd6vrdqWo2veFa+/eqCSX06KGPt7E8bF0
	vvpEwoTcB5x1wEblsbbPgmpFajBGSyxlO58j0qrPLVzsVGaXun3wXTQnNTvseqnhfA4dw+7pXXs
	9OVOy3cyqEwTlYUjyeHm8i8Px6t/cx0ydQWlnwSWLH/s9lPOp47GaSD83WtjR5f4CuxAzjh50no
	wZy8AOhLViW+8BRTs8RlHMdM49r9vZR6eHQH5hrw6wHAL6Uu9/NLOOs+xEtF43Q==
X-Received: by 2002:a05:620a:1b9a:b0:945:e46b:15a2 with SMTP id af79cd13be357-9494bc1c1e0mr538295085a.49.1794595978754;
        Fri, 13 Nov 2026 10:52:58 -0800 (PST)
X-Received: by 2002:a05:620a:1b9a:b0:945:e46b:15a2 with SMTP id af79cd13be357-9494bc1c1e0mr538292385a.49.1794595978290;
        Fri, 13 Nov 2026 10:52:58 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm6535092f8f.58.2026.11.13.10.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: ti: k3-am625-var-som: Correct missing space
Date: Fri, 13 Nov 2026 19:52:50 +0100
Message-ID: <20261113185249.182956-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=678; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1VcRjShmzCQ/6Cz2ewufNPyK79L8y/bvbj5XBbIuRWQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91yB9mfjVxuCnjLFqn/EQtVvQdrxrUog+SeF6
 LpX4Zt2kqSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcgQAKCRDBN2bmhouD
 1/noD/9qIfUIFf2Jy0gYgD3G0FQh6Gfhyes/OIXK6GH3K00hUzaCnLx2sOdcB7X/eGaE/DGCI2Q
 ueVPJjh0aeW9e0b39t28To19w6h91BMmWQs7QXdMw57eHoblL5XuiZhWdpEArk8T1OwtpPi7UBd
 G65yi9OxENzJFD/39n7uQuT5yyEh/iImHT+Lb3KRe4IWYG50OSTWaTif4kVHZpIbt6GPU/ZVzeV
 O0crC6INkqL/sM9yRb7R1se7XGfL1hkWb0Xgm6vDPK89gYS2BdFpuf/SB1pF1xz6ktjlsNCQYl7
 UZbL1dIxe+4ClpdqY2iSnWl58QTQ8Lqr1ouRe9BpJYtoN+G3DMGkyOACfwPTHBqbBq/FK28QUEh
 6pMwA1I6tvmcuoSEgoxIckg3EZSSrGhDliEsP3SEHl/W90CqLAIjkpkW5Fa3ejODyktRqMR4XMb
 5pBqZSC5+ZB1GRYH5b30jgsed606JXrhzm9OjDsx+UFIdzk0BvlwBwPpqdCJ8RqN8jGo+uvhZ6M
 nreKwd/rUcAmfcMSgAgrOiqyIwiRfEUSOAe6Eon4VpU4yz5tjB13o41xZ0NOgvgAGqKLN8HFPWP
 CSf9GbQGFrFYTBl6bGDh26G3j+qxef5UN2eVOPvcoBpsSRoqYmnUPazZFk/JZBG06FqaXu01VEf mK8gKp76XYPsL5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qeTWAXHpYoVK46aozp7KY0VPZShhAjX6
X-Proofpoint-ORIG-GUID: qeTWAXHpYoVK46aozp7KY0VPZShhAjX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX7ltX3fm1T+EI
 lylG+60Ajy/Gyt5c4/imJHHFv+KPcZX/yPUiae3lNDpBGjHuFKCbsNTvhfkCOqvWTKKi52+TgSI
 Kp1Vpyg5avlxYzgw2BK7Rclfs/Cr+sl/BuvxNGWhTnuzEy1FSRc8GNnxmudzgGENZhOFzub1U5/
 8viPiS7TkB42Y/tnxMMysQtuRn29vScYHEYf2vqPe3WtVH0rhVxVBPMfyCTsv05zJMsx7jCFZ6z
 pBLuW0cGLN/J0AsQcslKUWF+TDQ84aTEm9DSvD5FiYJomhK9rjafW4KdAeboUqqSEDzwr/MyZPj
 foYKASOROhimbmj/ueiOP3rIHDW2fQ8WNZEMKXvPX8kOJa45iIUdiN2WJfz5gjxos++7fTxJtKJ
 ncQdIGdH1qzuHCbGVXuGKaa9xiRCwc+yKx5DepIKIhy/9Arpi2Tf5UsllpCjWETg7ZiMe1kN+HR
 wnTmwn6rVCmMKhE+nyA==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af75c91 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qLckm0-AbUOrYe2-mA8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX7VdeegYmuOL2
 9mhlJY1+FufVC4MmJ58JFtz1NQXESfmvabmaxs4KUMbO7p8gxM1wJTU9azDZVzUEz9bDOPPU/Re
 suXXU1v+/R4SldCa8oUJpgwSoqiMXMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
index c23b6a90b8b1..373188911e8e 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
@@ -421,7 +421,7 @@ &sdhci0 {
 	disable-wp;
 	mmc-pwrseq = <&mmc_pwrseq>;
 	non-removable;
-	status="okay";
+	status = "okay";
 };
 
 /* On-module Wi-Fi */
-- 
2.53.0

