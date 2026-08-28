Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF23A2F28FF
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904953; cv=none; b=k0hR19UJg3gS+JUrN3dpsPkolENs0W/I0O8Ts/ELhhf1LZvG7qjPI2vKjSC9OWW44y3HUn1mnL1kX4HDv83zvG081I9qW4TA5B9YuS1D53Wf/Ca19nbRu32U5i4mQw0cD7EI9WJm59frq7MndrLJUm3QyiHWxecMKS0PUeI5nSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904953; c=relaxed/simple;
	bh=rHwWGwZU0EcalIz4jHl8ygpsL2QmGNrZRsxShRd9WZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LxC8lUqEu1Skukqu2y0S4eztmzKOtlPCQsWRNQcz0ko+4q/+u9TT/qZ83C8JkWhEhQnGevej7fGKOLKq1hZr0xQ/kLsVkg/eYvoPXutSlYID59E0gcjERZ/FiAR8KGxMFYuNsbVCqG/IyzlfyEeEc1MhlBe/yA2PY5U+jlMN7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBF9bLkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hD3dSVtD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBF9bLkA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hD3dSVtD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66d4N1605913
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qbULV2SnljGNcmRaVKkcLmoVphsQM6DVdSI
	FokbpMcE=; b=LBF9bLkAAHPH1POj2O9+q0rPee2Mw+GohVyGvFYv1fO0BpKfEzX
	MGCjdd+3QH1VX/DpaRZObA31M0UjxWswiu8BYOTRGDfZCF2MbhOfqjUBglmfw7TO
	uwRGxW/RjT8aoYg/n205Vq4LzQVTErc5+DLNQ3j5IEQLfWH59d3wtf4Wo9NoAR0D
	TjnHqn1Duv7g+1grQYL0F+BHrXgyIN79zdVmwYqsFnisOTx0LUOQJBRUSm5aHcg1
	bfp3VrNe211vTgRjA+MEfT+rNuc9NQGaSmw+2JhXUtsQW7CgAAQ8em4jOWHMAojR
	Pm9ccSWYeRYiJmHeqp7TR5BC/NpConvQ3kg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r8ncw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:15:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso2246031a12.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 01:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787904950; x=1788509750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qbULV2SnljGNcmRaVKkcLmoVphsQM6DVdSIFokbpMcE=;
        b=hD3dSVtD5yaZDrzuX5N1WS1Ly4MPfACO0txavhlAJ0X3OMUyAr8MgGFnXuC7yqefkJ
         rRTjpv4ZWrodHm+pDHKBT537FA7v0/Y+98roG0yPFDwW9BWDpzLZcaPtLk7OTlKTLWtd
         ccfJpfJY/T9ytqo1VZWp47hRGWkFFzam14utsR+T+6wdfsL4BE+lQBbgwNGUuArEiJWx
         3FNPV0Z6r7cPd9P2jbl8UEAiuIOna5PrQwhS91qOsiVMP2uAjAYWL3En+IbPGLgTjG94
         U0DrtMuNygIOd/Jd4+HCWq2X6JyOohLJEepR8ucOne3lggd48Bd3ScVnREu1s8fglZqF
         W6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787904950; x=1788509750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbULV2SnljGNcmRaVKkcLmoVphsQM6DVdSIFokbpMcE=;
        b=stHUi0xb8QOTGNYeINMffa/EzOrqMzr5ZqTl/TprJlFRpL5VF7qYzmO4ezWSIe2ZIX
         S0O4ZVUHaY1PwtChv2v93UyciXh+Sw8Gm2GFwHLEDsFaJbwhDlz/3Z3zPOopPHe0CxCZ
         x5UoMrz1hbJlvUeiXmQsUPHDTpW1jtdw8NpxybgIa7jEXOc/hYFutsKmqFucZpzaV3m4
         VnFjPDqlKJItDTwR6vI553P2uus4os7v7bi9oy+3zcs5ALk716ScurgNZ2719OJhBwf1
         Bh50J6hJ0mC3UjVeIgyX2eT7zBZ046Y2pGXTV4GbpAykPcKcAwxwvi1mRd9QgEVS6TrB
         yFuA==
X-Forwarded-Encrypted: i=1; AHgh+RrXe5+HBfdVJJlsaAbhzL7t2+J9izZW5jKPRM6Mb83bWor7tFeQ6retazP62GC9Q5oeM6d21MP65hxL@vger.kernel.org
X-Gm-Message-State: AFuF++nyq54DUhVF5oIrEaqR7FnM+7u4L3xLQpoLhqHrRnZYtks9YY0U
	/Ls/W8qxIgLJBOaxiK5oHTpCuCi6s3o8/WI40FP/NjKZ8XJHUo652zYBATMoVLx3V7CA6PbqnAi
	Stqa2MnGO/NGgsdHyqjZn1bgrhpv0Bxz/HX2fEMZ2XbIcSFN7Dz3Wv65p78i1EEsU
X-Gm-Gg: AR+sD10dMVUarICvW2+pum7sZO0zcT7+W2tH5TgqQbq5OG5hfj6FC0k3lv8FdLJ+ca/
	517HKeA3UafdTIRx0yMXWJ99bZ2r6WtJXCdqjPZiVCdyKfJ/xaati+uVM/Y1DO6qARJeytj9mra
	Y26fWdpSlWh6CSyv70gArOIvMTb+JGyGpCO41AQCbhMAYl7/zLHgRiqnkXYQ0/Hoar7tpWyxIor
	Yur+ehr2rpZr6xU60PTCK7LfJVM6obHQbkcfcUrJYuhsvtZLBc5uV7OiNom3y5PCeI5H7ik1EmF
	t2np+gru4nugbnQXrkobzDASVJFk46AeU5LoCbjlrh7wRd4cvvnpxrLQDo7EFSaYp0JSNrVUO8D
	ZKzOx4biTC0Av/WUobBYzt9UZanI13FPsvunscuEnoY0+9YEgjVI8/I3U3EoYTuav2IQ3YQ==
X-Received: by 2002:a17:90b:5281:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-3969ba3a303mr19004364a91.2.1787904949682;
        Fri, 28 Aug 2026 01:15:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5281:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-3969ba3a303mr19004286a91.2.1787904949204;
        Fri, 28 Aug 2026 01:15:49 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm3832089c88.5.2026.08.28.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:15:48 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding for non-MP controllers
Date: Fri, 28 Aug 2026 13:45:42 +0530
Message-Id: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lY4N25Zi38UD0Av0HsZNv9McWkmYQUt1
X-Proofpoint-ORIG-GUID: lY4N25Zi38UD0Av0HsZNv9McWkmYQUt1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA2OSBTYWx0ZWRfXyghu+koZu2hD
 PM4qJf5L/OSIu3ECGoumcql9Bhep47PosNKmpFgjZAXnkEpPgLscYTGuBN1G8+4WusWqDcXNOzN
 xjUM3s0jXr4xmS1k838XIBTPKa34uQiJay3zGiUPqs2l2FoyT2J3K4B/PKkNMTPEn3MRusIFyIm
 IcjesueI0hvwDdGoeu5k1xBauX3W/tPIWK4p7pWX/phIu99/BtEciXUpCJ4uZMRRXYFWqw3BAw/
 K0heoYYehmt+/dB+2ahUfQpptmtrsqNWCJU0T/mcn/qG973zCv4cBFwtjYbeFkJ0hFVPwxdEN6y
 tKE4cb+N8CqgbVvDPQTE+1oJy1j+8V0pgYnX+Zrb6UUMM++yqUsJvq3Bp87b1xIy8Zrvvgg5L+G
 B64b+lahFe7wxCsvKIEiLRxR5ecza395Y61q6wijOPD2+ZKOAQgJpGkzjiVv6zemaasW9OrPUwE
 Spf08kkKLY0GubcMg1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA2OSBTYWx0ZWRfX5b9YqB+1cSqo
 PV7Tmd4gpG4kb6ydW7o/146lYImYRgT9xHhzGRXG0Ve/a81FBA6Wr1E6u3qO+HY/xCvbhjHwugL
 Q4EgRUn4f0/mnScBQAMMd7LKkGpbf5w=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a9143b6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2POTKgeWoQizHkAibKcA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280069

Currently for Glymur non-multiport USB controllers, number of interrupts
are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
present.

Mark glymur non-multiport controllers to support a maximum of 6 interrupts
including the hs_phy_irq and ss_phy_irq.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
- Modified commit text indicating the issue in max interrupt-names for
  Glymur non-mp controllers.

Link to v1:
https://lore.kernel.org/all/20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..3bef18f9557e 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -524,7 +524,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,glymur-dwc3
               - qcom,milos-dwc3
               - qcom,x1e80100-dwc3
     then:
@@ -547,6 +546,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,glymur-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.34.1

