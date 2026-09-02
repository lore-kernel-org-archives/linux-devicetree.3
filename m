Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E944063B
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344586; cv=none; b=kMZvfRUNFPaiPbsMak9l2yK8XR8Ga5zl3vs7q7mIQzdHWH0/d5XtAAmaUDsDAWJHzjI+bbHVPTb+Gw3KDRaztTElCAeyzZjzWOqyiDlXMvIu8yA30cwreoJGDyuX0Vjc45/mpu50hs9lv+Wn+t/B6AeAZXgpZsel3McDm7IQbD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344586; c=relaxed/simple;
	bh=VmzjOyCkiOfnSYJ2Nr9mmDf7QQmIgmq1fRFWb/nLmy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJ5QXWCA3eTe4d/FNhGNk8UCg0myNFdPmaWt1j5x5CBQdtGhfKTdcKcu717ZrDTf/OLmgTiDUzdQfD8eLXaycLCqMzzdBCuAdDxrkFE8ZB5WrXu7TdhoT0JVvvc20gnbHnFa1LNCNbU1MW4Z6GxVkv4N4RkcBiq4fxc6A1OWvBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMWMXdq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrYgOUub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMWMXdq2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrYgOUub"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829N8Po2246233
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 10:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vJApW9N+4cTdpwVh6JXp78+vP7bo/cxLmdb4Xr0wbE=; b=hMWMXdq2E1v7XRQ6
	g7uWddQf+NXMfJnAXljtbnrU7OfcBUCCknWCAQF6eb3Pfta6mAZJrmOQendlxMYM
	M54TV0xseqMqpqyhW3gqUHp87AzGtmqhMD5uKe3ltvgxAFzF5KL6+PsHpLVLhGmK
	jWJaP0kAwal41YqAud322cOtveO55iwtEs3dnWnUA5AJTGVkbtOvPcmC2Ixms11d
	X5s1TZk0fWbRCrgjKWfVvD5gRpYP38dKUGCM/fGjeQwaCEwH4PMzRnyy6TCpUn52
	xQtx5eLYag+LYm5sdhIM8rOI+5KQl01E3EskcAdxs+twJkoxytHrdkcRZPRKRbPL
	VivBhA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whj1hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 10:22:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso2412948a12.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344572; x=1788949372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vJApW9N+4cTdpwVh6JXp78+vP7bo/cxLmdb4Xr0wbE=;
        b=TrYgOUub8VhAklfQ+QUPQqYftKz5Cvu+c+Vrsc3lku/qkDjccfdSwle5WN4DjMArrA
         a4JVTMkokAIxOA7OTbBRKizWc6nj+9NolfwPDcnjsi+Ynebkt4h4ghdSvgpgMEnaxlQT
         ZhXmlTzy8HBysmNMmF+8ZDSrW7NXWxcyM1e9qph3Bu7WixjmmarV8lpbHH/M3cbRIKRl
         DWm/ArpStLls/EnfBWhQ9v89aIJ0odEefGEayv9ffsaIh9aLpRQ9D1bEGzyjd0L5N5BF
         0wS/hbhdhhEuPgvvpOa5fZoxrMs/Q5bZK65DWEXoOoeP64+7pQ2Qjqw3HLeRG957yyJ4
         XxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344572; x=1788949372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vJApW9N+4cTdpwVh6JXp78+vP7bo/cxLmdb4Xr0wbE=;
        b=UB/CVe3W1Rn89LN/3SLJPBYYSQNsExd4kGt42K+76EJd31KMCZRi1uJF3sFD2Dws8d
         VwqdAEChcpO90awzFOGe0k1/BAW3isYDE9CZihs0jOVDd/eaNDsRMZlWPeOMr90+4ADU
         E46YlW7JgzlysAAUG0skXqnGyqFFBg/uCn0BQC3jKjuBl0QP4urLqoJf1cXo6flQ6y63
         cNE5tEXEVQ9SderZS0Y2JG4htNNjdUIleoyB8qc6ebFC4yJyO0+QUJ48RbPHehZ5gTRL
         QXfFumqmlzxzoPsApp0J6/gtUjm2yNAMANlZI/iTcbvuP4G+3ABRq1yHjofX6GDKsm+2
         Ianw==
X-Forwarded-Encrypted: i=1; AKwUvBwElqb59Q2//Dz6rFXdEZ9pR5ZoQUz6nPX5Fd3MF03/yFyxJCID61kJEs28rEeuWzQ6yF+YZ0i106w2@vger.kernel.org
X-Gm-Message-State: AFuF++msD/f4bC6Qt9EViTgYNz/gzl7DkeDMtcsFOf8hflw5ckegBppS
	dwRR9Gw3u7Y5nuIS6pUz0GmK3M/e8cC150Y5k+F6dbTX0rYH+M4pF1W2Kih8UXJcq3jO0mNP2FZ
	IqJeKIazvHMUbYZ9thsNRc1KCafO2qe22BrNeCeJ7d0bCgPvwbyX/WW5lDwP8S1jJ
X-Gm-Gg: AYBFou1TO3dYgjvBcrWLj5jLVgXZln+Lc6CgRRFSuO4uwqfuTuibN2dGwo0QcSYxrSj
	ttvQ99JUBa73/uafjAbXG2CvFzoBvjgE4j0/v62kqHy893tTT3Zh2dg8EjGbdrOzrEnBexyxzVC
	tRhjR3V+iQLqu2WF0CYJqUQmO3jmJhr0vNY5YHmFxPQzcVrAtDpA5xmYZk5uR6tY2+HIt1id73x
	ttlXG3WLddeTL/IjcHUa8470cf4jjSDcq7uB/cfIuhuLY2KBoSQ104gG17JGMIVvnfhQDTHY8ss
	jTc3qk9ydA1qdU+9rn2T3Liym7opeDrOZZzCEVE/SiogejMERPJDDqkpdzPWcjhqmeAkS+0VrYa
	OWn0md4vbo+AQKTOYrZAXumXJjsLbCm3CrIAm8Ro1dvU=
X-Received: by 2002:a17:90b:562e:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-39af57eae96mr2571603a91.9.1788344571955;
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
X-Received: by 2002:a17:90b:562e:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-39af57eae96mr2571563a91.9.1788344571530;
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c0530sm5054861eec.3.2026.09.02.03.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 03:22:49 -0700
Subject: [PATCH v3 2/3] arm64: dts: qcom: ipq5018: Enable mdio0 for
 SoC-integrated EPHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com>
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788344568; l=913;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=VmzjOyCkiOfnSYJ2Nr9mmDf7QQmIgmq1fRFWb/nLmy8=;
 b=VDGSRjst9KK0a9RAVihDFxNdBFLoELPvsaHwng9QsEUX1qZwQ641Zq3/Uq+0yL/O+ZJCqujak
 1ZJ19LI8kweB9j3fViifwu59YItXjSZrsALNHRwMOYk5zmMdCn4W3k9
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97f8fc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3IJ44k9WFy3LD23BzYIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: hPsH_FhrGxIT0SovZr11yNHZG9Cc2Kxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX4JJjfBs9FQ5I
 tgBTVsTMULS5EAXpX4JEnHsKxJGEIVnwyEe6W89xQxolbfio9/acfA2FskvnzXdblRTRfRuj6vn
 QyouK18nVdtJaORfusOO9KuDOF9ZtVXNjpt3hbW/4Kp0ocngp7vQ/Gve3WEAeXgePF8nMYYNM0t
 1SegLAnztbKFw1Ca8WB67fpCE+19sQbafa3Vsi+isfDoGcZ8S0Szb/04l4M6ujXAJPRuA7XXOXZ
 le+g8z6TRiRnnJJ4ase/1XJ+Tf3FxDOv3X73NAu0Dt0O+aWrIuH5pc4zuM0EA1qvmAiCdOLo4c4
 z5tXdrUdBULG4yVF7NkZKykOd6ACRv7VbV27rb1kg+1NHHnk7iRXg/t77clWUbRHdY5nBMyPgc7
 oCO3H3xny1kRnR9MM/uJryLQQbU6sBe4hiMLtpG0C72tWxvUfM/fLiJaT6rcRiMX3EvyKLzn1FL
 hW52kQarbZ0tXRQ6UJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX55pw4E5T378T
 4WtVTY7T7b2jcjUp2YRK6bbpR9xD72RQWqtn0ZJwJ1DB+FdMDn5RyGLVgNmFlBUsaIkGavksJQ0
 43Cyg/yIM7JkoByL23r93NwinHAxumQ=
X-Proofpoint-GUID: hPsH_FhrGxIT0SovZr11yNHZG9Cc2Kxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091

mdio0 is the internal MDIO bus used to access the SoC-integrated
EPHY (ge_phy), which is present on every IPQ5018 RDP board. Enable
mdio0 with a 6.25MHz MDIO clock in the SoC dtsi so all boards can
reach the EPHY, instead of enabling it per board.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index cb3e1202b582..fe1ed240de59 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -222,8 +222,7 @@ mdio0: mdio@88000 {
 
 			clocks = <&gcc GCC_MDIO0_AHB_CLK>;
 			clock-names = "gcc_mdio_ahb_clk";
-
-			status = "disabled";
+			clock-frequency = <6250000>;
 
 			ge_phy: ethernet-phy@7 {
 				compatible = "ethernet-phy-id004d.d0c0";

-- 
2.43.0

