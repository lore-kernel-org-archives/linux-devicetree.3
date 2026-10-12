Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67A54399C4
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787533; cv=none; b=vE9RY3kPMT1cxFqlHfJoNSSPOIRS7JXBVwu9zFfitFxl8z1WBnobWofV08d624oyNVdgQGz9PJ0g30R0kmVlUvnVfzOzmgd6RKxzzMAvecegsdpliSDKWsDy+vyP1txVSzT/nJSsgU+ywZ0VKW1TP90OuVNh9Mtj0GwiTuI9qFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787533; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u8SlfO5FVMlgl56/KctxwmOIvhvyYODX3Bp0f6BZ1go47ee1aBJJApzVRdNSl5LPsNIzco32x7viEBPHkLCfMYFb5HI06ksHceeuwzXx2qXU5yMsbS0x33VSPpmR4K9jbkiURJB3qDHB/GkMoB56XC/Uch1vKCdYmCagm/NE7a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hr4iZeQG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRQwQ98e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hr4iZeQG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRQwQ98e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55c2R1314446
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=hr4iZeQGkQrP6Hi6
	Q0kCOTSwXZX01Er/bk7i2l6XSYJsOT6kLPwR0AX9sfqxaGfeSlsGcUjr9MtVd2IU
	PlSasEuSvH9gAX8yX1Rcu3Zrn1jNccUNwpk/vD4aJUibT/VZ3EUr9HHqu4K8dHsI
	/uGWWWD74nIR/+OMlrXrHqqtca/ST8UJvgJeAI3HQ4HHf0RqmOM//piGh+hcAEDF
	D4kkU+0SfeaSl6vehvR04huCiioavjQimTQ802U3ZaBbDBwrlacqfRb6PJtzCfUd
	TAoJ7Uvs82Wv9KcxadokKFeiqk9woK+FWGxSuhJ4XS9AUyA9VINYzQn7X9GIVaN1
	nDWMvw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j711cyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:45:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-892ccb01fbfso1367810b3a.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787524; x=1792392324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=kRQwQ98eymuKYm1Q3Lld4kG03c7sE+d5L9JTCkPLVikSQULIppZrvoOm8j6H41Qam+
         J193fl1FtArim3Q9cDCVRm8rt/ZvnXR1bfNkTyzDbFkjJxQIGFl4To3DdDJrAxQk0GMy
         fZ3sYCNVT4OWKVaZ5NN99x8f92Qqg+Zt2Lbl6HJQjaShaeYVmpYTxZOSCytJMBtN0hJ5
         uc3x1J5QjungAmKJ91G+c+/yfV+cdb/s75E6lSJakP6SB2ZWQWGDE0yQoUMZHumrOo5R
         oa2NJZlIr1TIQRj72OWBz8+6TbKBiYyb3PlT7aDnuIJdIfI1FBNsL9nY9FhRBIWo7k40
         O0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787524; x=1792392324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=BdphVGpRGtRGOlvJ+21aYEqn0abb+Qzo930UdVFsuyAIMJphDeuWyOwoC9kogUU0Xx
         cVTujRXh2JRzziuldq0UNzf4BzQFT4L+pKs4Hm30944v3dAVMSoNxc1wI66tHNvYUG7b
         7map0fnPUQ3ZBjmLk3TZn50HW4sKNCXlWMLkiDxAlXAMFNYNmTcu3n8MxpNU4lFSp3z6
         R2lTcmqAHCkWOmdVCLjHlHUeJQzGBpcFpzAKTmDp9vXzP/zJZZ5jCvsJy3udCe+DWdnW
         Dlg1BS9NaGsl3s6PO258hNHUTSBzy+FvmMt4TWwq1pD5REkSBK9xUoD0yvTaR2wT7/ed
         0iJw==
X-Forwarded-Encrypted: i=1; AKwUvBzOWjyrcr1mg8pXwPNV9nkUrrp21n2Ox2P+u/5u6pPx/Muc1yUQIHCYpHIrIgEa1kFgml2yP/ct+yR5@vger.kernel.org
X-Gm-Message-State: AFq9FYIodR9vGrzcaU1jgg/WOBnaCMdXV0um4g/YKEbhOizbMKuZC+U7
	wrpbGlORVBpOsddLmLtF7H9v2XrrNYJJfqgHf+XElNCRy8VqX8byZhvuy+kG5z6DFsLxNiYUC7i
	P8Abc7Ei9Vy1acVU26EmfAm4XJzB6joBzABhXCa9yzb2I2M7XqwTloB4NhZIuvXrX
X-Gm-Gg: AYBFou2zIZUBZJBv/+MD7Nutzx+BT3RMt7HqGdokVRD1nAX+wSUoldW877vl7UvMJ0x
	RS7OfZiCTl8m2QWcGBkuYNO0BefgqK3ZRAPr6tmHg4sJgCohUyuMhsOfChW5+dzWIFdqmcUETJ9
	AUGt3W2DUOEG9OiGXgkemll6Oa/xzK+f1VMvRxvHC6Q14vv1wM4BBOri7aTpbbel2DSaF10vZZe
	lSrH2o159hmcvybxTSjHCiZNRHCJaQMVDZ4+ygEU+z+j1Ao2+U9YD3gjxIyazqwWcaHFTJ4g2Iy
	m36unMAOC5ea8QLLrrF+C2PSdnqmXrxObCkJ737eFyZQ+l2ohHu6/b4mA3YZTyCNNNH+yS4qkcW
	nqjVlUj6T8KKuB2UmmDINoVJ3e+fFaBe7kuitnWC5X8I272/f02Fpbl/MK2xFo0XFQWg19iSRYF
	PHxtbHJpeDKw==
X-Received: by 2002:a05:6a00:148b:b0:886:5f48:3fca with SMTP id d2e1a72fcca58-897c76e308bmr7234560b3a.37.1791787524372;
        Sun, 11 Oct 2026 23:45:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:148b:b0:886:5f48:3fca with SMTP id d2e1a72fcca58-897c76e308bmr7234545b3a.37.1791787523925;
        Sun, 11 Oct 2026 23:45:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:03 -0700
Subject: [PATCH v21 01/14] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-1-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX8w9GbQdWvCte
 w8lOvFTw/JJxmD1vqHkmS6fhsmqOOTWzQu/Ff1xOfSXeCIn5/mjt/IAR9HhaVDkmANwvdgVqKQr
 8slxg2HhRsjUFYtHSDct1rA/W8o3P9g=
X-Proofpoint-GUID: ZdetYGdzOulpunFycYw8iQPzJtLSjMFH
X-Proofpoint-ORIG-GUID: ZdetYGdzOulpunFycYw8iQPzJtLSjMFH
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc8205 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX0ygbU3GmIMqE
 xPhjrw6zqlvhxwR166ZKyrHhwzPxCWIs928D3uHznHdgfRsu01yMQ5ujuXejkLpzDiFLDk8U8SZ
 R+ysVGI4E+cmcFbc5D3s2Sium3TbOQ9R1+QS7Oc/HO2I09+cWyRWt8xPBlJPCozMQ6zv8p+h3bc
 N215PVDba3yHy3L+Fyuf6j7EFJaR2BRVKlHDooOjN5X3h1VUvG3utfvX44eVaBR4/ZWhM4iDRsK
 61ZSSNQ/ygHSRUMp/pTckU0utFQOmcRSQT6esiQSpi3evjdv25vJrm18yptrJK1kvyfSCdtdDZT
 xC6CfH07ubh888TO9kZ/0PNJ2SSuyhbR8V9SRiIYIDa+nazvhsqHK/ss4xmVkk4whB37a1kCQ0M
 tT/S/Vn2nSytaU+Arox67mBOk7wws+zA1W19suDlpdyJ2mIJU1olJrc5GUBJ84W7dEj+HQZCYgN
 rKmQiOxFbBZw3yVLH5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

