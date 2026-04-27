Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05403A4F56
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326163; cv=none; b=cjaKuV3LuVRxKElEgxlS6WyF4FKBbzQd/2LKAZ41j1h9am0Xpc8jklOBag/vuUNaPNsb8x9wOIf3EHcgfkBKID5jxoverFO3oPlE2ZV1VYVH3k2HjUq6lnMIPxMK66061kMl2j4Jz1F4fSVyPPfJ9UZsxgGe2XeFoTO8qA+G8pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326163; c=relaxed/simple;
	bh=plsVpfSVc9eCVFj4w17K3FYCogRULKzyFMHGpg/aL+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OALWujxZDN7m/8UZTanz2KdADcPlIekeiU8CNjnkT8pNQK3Wez/hA1FVIQwlnv0l/IlLSB872Jb4SmQFPnVMSaL3hu0b/AY17Ng9Uul+b5gc9GenNu9HLMPVrqRynX5Hr4VNz8yI4aBxN1neC2pqCU5wRAoSy+cQn4Kw3tSStm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iusfDWls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vsz+OR+S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iusfDWls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vsz+OR+S"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDtjcB241590
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zDhnhJqpd1p
	k5h8F7DDf/5AtkUKccW5CIznmywuGZ/M=; b=iusfDWlskwX1CDJUcdtKRQ1wKIq
	arymvLyqQ35b4Ou2gburKq7c+EaKOG3I0Xqn7OjS6onrcVJNRYeLoBaMYqgYtA8c
	BEwLuOJb9gad1NBrrsHsGI047mjrnHsC1X7quZpTTYCJmX9P1cuD8eBpdvywSm+B
	bloFTmIUSdp+ww++HAnqchO8bYTSpYhWxYAE16cHBvzr7NrWVsk4P/RGKNSs66uD
	9Pr7WfOu5RqLyYeT2z4tagJB1m3dK9pMNwZmjtqBs+Lnqf9SqJiA7gDtz9vmbdi3
	qKs7Mx9oU6kvAqam4Ho//aPoZsv2dQSadiwNMUp/6o8Y13mwh9AWVQxlHpg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946sprr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so16888332eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326160; x=1777930960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDhnhJqpd1pk5h8F7DDf/5AtkUKccW5CIznmywuGZ/M=;
        b=Vsz+OR+SKEbyvN/td4KTb80KrkAyAbA2GhkzsdHdNyDuNDnybxWPsh6pQ8eGBvMjmU
         7vw+wK9KD7KAPy6fW0+3eml7PAEefcGWx2KIdQ8ycMFDejUpAY/YrFZqiqLdZq+mct4n
         0GDmh1BstYmcIlqIO0F2eZLODGRbzmxsWsaXYFrZ8FRHFr5nhlN2Eoyb0NintmJdjqte
         HY4s5oRFCBWyDoBE+kKiuFHM1J1XgIUU3GfWy63oPOmVPj71BkaB12RDyvzJghRo/2Ma
         3ruzDGjebNDSlWuA8C/jldsfPGLOcAXUjnE1pQlPq93eCAb63kU+CDflsw+ksl4W7joQ
         oiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326160; x=1777930960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDhnhJqpd1pk5h8F7DDf/5AtkUKccW5CIznmywuGZ/M=;
        b=lqasr6A3G/0kYjQpEOT7K5TCD0MGI+zGMTAlMb//vn01IjLgk7+mljJsh/VoDs6rBb
         AfuB6HyM7zRsq0HK+pQXItO/FgJP238GKoW+MufrJOPPD1WTq3aSA4IECQfjyU08DEoV
         t9WwKCV0823iv9gZ3XB9APtrIipd//nMgxJ1uKzY4Va8xOYpFxRT6MvFdVX18kFFCiQt
         CziQYBeZNodjQvOoM0A9EE//HNa927C1wKxhTU6op4Z8tq7HH2ZrVJYBQiWJ1uXY6Dyi
         RhwUIUAf7ytCAyotNPvaGXw0I3rj2MkVIw8LcGOrl/LIS6mE6xAS2EwFDVRJMAurpyL+
         h4QA==
X-Forwarded-Encrypted: i=1; AFNElJ9yFQ4FBsFlQ6pmpOYODslOYckR4WToUAGQqfbdWoxPvctA8Ywz3abyD4aMdUs/jNKTP1ct/kE6p9nb@vger.kernel.org
X-Gm-Message-State: AOJu0YyTo9rYJOmN+XtfJMV4shswpg685jLlEWQVD2Zttzv9yM99iTCy
	ZCprsBfN20cSK+/w1TKGG8WVOE+vydxxTRlDAIefzgFStDJqI+dPwW9NytWUiGiuUg3zQKEivDU
	sSL8QlfXdku+Xmdtb1S/LVCyheH9ECse3kDxIs/uizd+KbVOfccbT63qCQjvkthua
X-Gm-Gg: AeBDietH+7ChWFMMFjKzIiQR+XB6bn0rBIJIsYcEKGABmFBqx0vHjjeMBDBbXrYeK9B
	lLfq2TEwHwWhxpn56E2jz6LzXuHBOljd+1ZngZyeILPmTB4Q6jTFZTR3xFZXBUYo8DXMeocE84G
	mHu5cMFkkya2HZ2Z+fjEyjqPyl3zDGSxTYpGcJ5MNnnWBiIncUrnQAD1HbWMP0+RClak579MPmC
	Ew0D2HY/2pc0M6vwdZe2UcXBSW6qfUR8xjmmOUTUJ0v6PmEyBpCEcYYksP5xGeNcCEMeHUINS4/
	xdzDDhyUCYML2KiH88uzxlRjFP2+SjCLmVfAOXHvP4+B2yhU7blxnl5DpX/E+wkZKSpva3s4spe
	BxlUzaTrmFc5YUeT43/X1jY2O4a/GHR/qUhiTXPN01+U5YvieWb5ONfcYLcsbMaKMskBy5DtfoO
	uvSlHmCRgTjg==
X-Received: by 2002:a05:7022:11f:b0:12c:33dd:fa15 with SMTP id a92af1059eb24-12ddd9e4256mr312332c88.34.1777326159414;
        Mon, 27 Apr 2026 14:42:39 -0700 (PDT)
X-Received: by 2002:a05:7022:11f:b0:12c:33dd:fa15 with SMTP id a92af1059eb24-12ddd9e4256mr312300c88.34.1777326158799;
        Mon, 27 Apr 2026 14:42:38 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:38 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
Date: Mon, 27 Apr 2026 14:42:14 -0700
Message-Id: <20260427214217.2735240-2-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69efd850 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=8IMiPDtIn6OAJiDpRukA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: TKvBTvlYudbl0zJr3UrTt4MwLtzz7z5j
X-Proofpoint-ORIG-GUID: TKvBTvlYudbl0zJr3UrTt4MwLtzz7z5j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfX7xVfrSKkEq8O
 o1gK3zP/62yo1sJoSJFK/BKUapalzVf19fVC7tONz03ybz9yLJ+jhWRe9EUVfRzcmqljRiSqNxu
 M2+4iTocXt/XW+mqjgVQ/9djxINomBsBIz9PiYLmqlQ8JpAk+oLV+oHaZ3hUUYxgzv4z5mTnmd4
 jtv4xmLIRrvq8HhJbZysp4pv4ivvqSE8ELaEJcbEhnH4te65u/uhmQA2kuDyAG449y6exsbBDIz
 pT556Fsxqiu0wzBwl4YMb1uWXRRQR8FCD/NipULscO/nZwePDVBJpqu2bIQzmXWdFbn8U9dqOsx
 AX5b/yPC3nwX0ejDNXNuGyVHn0vPvpzaQagxvhq2pju9RqRy6/M6HBmlUWaiF0ulRkOm0UDjfxS
 Usq5SJE29RANMJ0lQZNHadgMRvMv8fnPOEyaGrEvFOG3PEJ0NrMTnx5hsuonjYb+UqxTCC5xcqn
 pDGDqByTFwbRDvAhqtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270230

Document the Hawi compatible string for the QMP combo PHY.

Hawi uses a new QSERDES V10 register layout with a new COM AON module
and hardware-specific PHY init sequences compared to previous targets,
requiring a dedicated compatible string.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..7a7059c659be 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,sm8750-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
+          - qcom,hawi-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -205,6 +206,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
+              - qcom,hawi-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.34.1

