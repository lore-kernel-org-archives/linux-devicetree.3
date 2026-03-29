Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750FF38655D
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774806790; cv=none; b=nMY/1qy7NspvUKl6qOugVvDR1fvIDA0igpXkL85PQ+umo7ZlDGfUjPxaYvdDbwCRSJilf/amW6UkfRZegSfPqgF71pa4LH2+D7Gaki7SisbNntJqewQfFO5/lsaLh531JWtLUK41qME5SCStxR4dBBUw2aNF2TDQxg7KrvXn33o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774806790; c=relaxed/simple;
	bh=lnpOLv2goizWqN8K+7S+ZjRlHlRODzy4yWSzBsXjVYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MGspGbcYdbRRKuZR4AbaZMoC81xDT5xIhCwPTeHCHoLj04UscV6j97nV4jlGcomupUArt3qXm83jC7LSBk73SKhs+Y8Fs5ZgZ1i87nDeJ3q48IqZ5+ZJ+4bwE6s7yzdRM/QgIwzv3P5bEMHuG6e3Yh+Tj7R8+3Xk3klBGUPWdeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gW1XlWc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvBFL+g5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gW1XlWc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvBFL+g5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TBX9PD302695
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5lWkSdl9EQC
	5AYPdogRyZLrkbPdhVyS9NRffxckaYsY=; b=gW1XlWc2y96kpShF/8rMot3srqb
	+N5fxhrOisE1UhChqRinNddsX2iF4yPDjJAA3pEf6RbQlBDgVb5Vgjt8ZzxgKNKM
	lHFu5lPhUYiJBAVd6uwNRBT99ZxLNlD7CuI4yC3Fm4awVV/rFm4pPzBHLjCFq6HC
	KUAfm7Lg/gFHb1pxPD4ElwGb1SO7jsBNHOw0ML782+0CH24bT/xYTA30bgBZ09Yv
	Of3xm2FGsQyWYtFXoRco9cjcLnofz3260orO67pL9h5IaRNUrUmfw1E36t4qqW00
	Tya0/PrcCxBeBMaKJD8AufQ+kes3H0ekmOpHlPDgBBtztd2f+6DeuO5HBgw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwkdkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:53:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7424d91b2dso2330842a12.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774806787; x=1775411587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lWkSdl9EQC5AYPdogRyZLrkbPdhVyS9NRffxckaYsY=;
        b=OvBFL+g5w8aCtSDYtbzz7d8nh+i1ZU8uEqzkCPw9RX9FS98BGhAf5Oo+Ts0FTwiPhN
         Vpl7PPeGZqQfwaDhg7GNyhoK7AuDXkj9+e/u9WsZhuBgCl2KklWyzd5qe8ZWJmX1wqfy
         nJofMjD+pMWQ3XaGVdlZNRo858IZYoJYF3BypdUHexVVLfgtUWrackJLxebWiNlnp0KV
         L0kGVSaoyWAkYqZ/HzRGUurprodeAApomgQL/s0f86SZbLV+DpApwVCqzQUJEPq+7aJg
         gSONQYOTHGifljuKdcsZxxJG2hgb/DDlb0YpnBJKhgkqdNuix6RxwxODEn7fTZMOprCB
         gjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774806787; x=1775411587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5lWkSdl9EQC5AYPdogRyZLrkbPdhVyS9NRffxckaYsY=;
        b=i10Gsm1t4mQNp+mvcpMCT70ZRVzw1uziPJUFWeGxE01Z65g/PwxzvCaxlVqqqz40Wp
         6nzx9luV1DzUv1xJDTHeUvBzw9FEz/zeFhOtuDP0tSZMM1Ddt6dxGpdG/1YcHBIqLBqA
         s0iiNa75Rh/s06phmFTAY2LSqxetFR8R7UZB+HCEVQLAE3jgDveX/RKAsZR8zWQdbD6n
         ZGLmAQnH+T30xYhZ4wZyR5nF5l2s/+5gczbXxHySsWVkOoPBiaipV9jjbijKuoYSBt6y
         gRepnzYBstFl0cRjENTbVrjaSCAGJ3A5bb25tWxEYMaU7weUPd+M6027QzysXHnkpGqi
         q1Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXNFXelIFRhJTJvZH/lOWbPfrZKtURlCu88JFkUtHyjBI70ym8lKzw7LhfakqOGVxqTd2pHvxiNsY9B@vger.kernel.org
X-Gm-Message-State: AOJu0YynyYWxa/+eZlAUpHsTjrCLVRF+gaDtGEPx1TuL6M0Ar50QM6zl
	F+GVicbN8WH5op8db8dkiFAyI0cH8FoPev9ERepAPdNK4HGsYP2l0W+suIsAJvpMbyyNZpopU3u
	rPq6yBvWOX/VfT8e/Wq276D/RKdYGSa9YstWgA36c1PzZbJYURYhj2YRPKEEsBebc
X-Gm-Gg: ATEYQzxeHSnX83trWMmMKuJwzfIbf1BN4J0LZHy81DdOocsp2m0JhCA9tgRriEGE7UQ
	M6amcVRVYwv3I5Lrte/PErKQZ1tGED5G0RG4qxi9wVi2sCArhwAOCNvOivVaxdWK/To361SRQp6
	EYw2xG8IIXSeqiZFEjCSSGsBXBxvcXWBLciYFU9tx4f5StZkxuYvY2hN11a2MxHm7D+wNByWyal
	7gxjvksOukAiYX/BwaZ7jSuPj5WYc+TZQqY7BtbgIr2NC1kkzBePTjUKpTbxd3gE4MfiIbVQ8Mw
	pG8qI9XwWOeAMMNoUN2Ru4TfLs4KRe+C6yjz8w4pg1sq1A8WIoLUnHPrA2NIYnZXhy5OCftjxvS
	YbrxwkbkUPmKOuFlzsekKE+YskTKuTcAWby9/pIqfU0j/S5UjSHCK51iFESQ=
X-Received: by 2002:a05:6a20:9143:b0:398:7830:8a40 with SMTP id adf61e73a8af0-39c8794f94dmr11030694637.23.1774806787361;
        Sun, 29 Mar 2026 10:53:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:9143:b0:398:7830:8a40 with SMTP id adf61e73a8af0-39c8794f94dmr11030678637.23.1774806786914;
        Sun, 29 Mar 2026 10:53:06 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e2f3sm4435891a12.18.2026.03.29.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 10:53:06 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
Date: Sun, 29 Mar 2026 23:22:48 +0530
Message-Id: <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c96704 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FoofZWJxhLOGeeMvmPsA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: iV6cWwJCpHM8a2eljM6Pnzn1gg2u-6eh
X-Proofpoint-ORIG-GUID: iV6cWwJCpHM8a2eljM6Pnzn1gg2u-6eh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MCBTYWx0ZWRfX0q/GouhaTFPt
 emEifsYO5Wrq1QwxVpP9cGwKa6Fp0qa9TyswaE07VXi4kvuNyCV/wtTPmBeCHiTGp9P/dTFGsjp
 RL+x36gZTs+epylNBIGF1AFEdj7Pmn6k2naDylA93TyxkcXfZrFcG55ipd0VBwWeCnk4UDLI4t3
 1uPgq9qYnL/VrH3oHyQdSIHO1Uwg833eCrYQC3HIsdzrM4oMzdMZaJz+hOvxuP+9sPH4Vh1gwnL
 XnwDQh6+TTmcPkHM/Lop8rSq6ZYm1uDuJDQNjlWwQfhyDlgWr6v6uDjtSMG+V9INVe4ZOwJTKCC
 QRdTv1ZwR6j6cdJy9Sl+de+2a1tETTvC+KICv0sCi2n+Dkk6n71Koa8j9tpSbtHrLW/l3S0ZS2s
 hi6NKDGeAYn9TA+8DHcPSI9pI/TsJgcGz4/jBoKeaedxwZtad+7KMhaLHwcy24fvip/yAWwNlUX
 +t4WxaPw4ylJRQzYNUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290140

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Enable USB support on Kaanapali MTP variant. Enable USB controller in
device mode till glink node is added.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index a603f3056d83..38269aebdf03 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -82,6 +82,11 @@ key-volume-up {
 		};
 	};
 
+	pmih0108_e1_eusb2_repeater {
+		vdd18-supply = <&vreg_l15b_1p8>;
+		vdd3-supply = <&vreg_l5b_3p1>;
+	};
+
 	sound {
 		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
 		model = "Kaanapali-MTP";
@@ -1326,3 +1331,25 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l4f_0p8>;
+	vdda12-supply = <&vreg_l1d_1p2>;
+
+	phys = <&pmih0108_e1_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l1d_1p2>;
+	vdda-pll-supply = <&vreg_l4f_0p8>;
+
+	status = "okay";
+};
-- 
2.34.1

