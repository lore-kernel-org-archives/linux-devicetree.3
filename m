Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB69C38399C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218735; cv=none; b=eJPDEeWwX8or3WlFy6TM3A0Qnp3DOSYt4/M0u5EkoY6adij7zYoi7A9zw5K6WJNuYnluMipq0YV3HLh+eJpion80gbRj3y9DLXuQoQtgcE2Wa2nitDLW5SCgtWEZNoHwtZKCoZ7UIz6kDfkq/MPuq14JKwBMRMTrQ+T8L10Ct7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218735; c=relaxed/simple;
	bh=AKJ2rYuq3UXtw84o9Wv2rgBoSN8Fv9N585Y291G3LZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3tkqmb+NsTio/ix4g+6ytdZusVV1hIzZsmI5roMyW2pN0CHyeFQcqv/XiajJaNZC0P5iLqtZ08azQjoXg+/9L49imylphiohiTJ23cUrA2tgnt+1K7XI3EcZWJdlNMMW7cO9x2ac0/d4PU71qzazBe36826vrJpSXCGUgXj3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iASYWyQi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USWxPA0d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iASYWyQi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USWxPA0d"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJp5q2972578
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSQgtm9Gy/goYjkRUPvH4fsLeTRSZbUNnPPwbkXFunA=; b=iASYWyQiOGz5VgA/
	XTn0KGINXOl7iwun+L+oaK4UAkSppUti72AQRZkNnhLuR7vlGMy9mYHpJZTlL1AS
	UCOFvEyNexd/9B8cYqhNYm874EsqBHlM2inRvqdW77kI96fLNTftVFb/lYiKLtsG
	izL6/2U1hmISKnZKom+b04CJLrwYK/woloqfhSEsBa29akkHZBX4MrQzNyd+LEbG
	YONpu/dlF9TLwyHAXLY1UknVarwA3a50abYjFz/NLt7GhRneucqbDGu+n6johAq5
	POp/1A0LGxxHL8eQfEhXIKFoL1sxcvK77aXu5LiRBgZT/jAy/9+35RjtxI8XPFoE
	ub5I5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu10aa4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso154137971cf.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218728; x=1784823528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSQgtm9Gy/goYjkRUPvH4fsLeTRSZbUNnPPwbkXFunA=;
        b=USWxPA0dquVSQCqvRP/vyS8ZY0IzO7Jnh0OHbV+D/3D4RPjH7zGsTYDLljjG4kU9QU
         0IV4wBID7q2wPFNRuUmYo99CUraiqK2SvWuyp14RKFcZKGiD52es1696Rp9oe2KaRyu0
         bzL3pveUsKO1jOFvwSlftMq1LiscsWRo6IyeDK7Kiyt/Mqft+r2KzF4f29qZR1iWiqYW
         RU2CzbBWDEUDgDB0dJFOIh7gvyCuRaVhAvIGNk+lep2tRFgvFJzqwW+Cdnvkapf0uTZp
         xgD8b1DOobcKRlYN/Zd7JCjzopJUTx6YutGEIzJTx9o+jzjzvMjtjpuBtcEdo1SmogWg
         ln8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218728; x=1784823528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSQgtm9Gy/goYjkRUPvH4fsLeTRSZbUNnPPwbkXFunA=;
        b=MFM39PF9eEkznpJ2Ja4lluXFiREh1ZKlVOnKfqYtz59tkIOrhWtGPJqC2ppJH8+Qbq
         JMAux2EAPLAlxAxZJ0MKpKk2iP61ieGK0dsk9QYgViA3PlPE4FzuqREsp+INJ/LftMht
         agQjfYy6dGmO9fcwg3PMd0+7uaLMpRmn6Gmx8MDIh9eOXr7Sv+fRrEJ/DoVqFz0eAgYU
         ES8RvcGZbV4UuyfUBje5SPf9RgZY/o3JGVW2o9nh0+HesP76cPUbkeU0TppACTrB+uNB
         juCHJG4HIrBu4SbRlbKILhcKQqFbDwg37IiL0Z3vejR+NdLcxCP9jeyISZnpoyRa9k8U
         UvMw==
X-Forwarded-Encrypted: i=1; AHgh+RrA8cbS7ikXNm7h1rLhcCSjJjHhh272dCcN6RKkxJzam3TNFUkBoJopeu+JW4nLdmBI7a24ZSrHyXpR@vger.kernel.org
X-Gm-Message-State: AOJu0YzgkvSmqcJ7NmfN7ReK+tGQjZGJPaTmVfDJM30mMwPoB7GxBq6N
	UfOHP0h8M5hRNTKjb7PXcEQuJdpsVLeJVx/axoWEjEqq/sHbjVlIvZygIEOGku8ITtaMjPkMDnB
	k8jjuBz6tG90Kl+8rolvXBmB1Iwv8QSxZaOh9w0EY1aD9ln330Iix5fAtVETDiPYY
X-Gm-Gg: AfdE7cmG723VSdf0xDhOV2Lqw4uKDdm6XI2jCtu1T3aYQuFD4YEuIoWvSo6burxcyPT
	y7h2irOzaG4LCqVWA9nSZWQ2/8NweOTc1ujFEglBcp+UVTC7o9v2Y6FJivgREtc9IX0V54oGtTA
	CEto8dS22lpz9Tslg/g+NCQHT+oG/L4/1Bvy/WkGotF0T3ysI6YeoRDU8DBe1cSLrZ75B2wZluJ
	UR3u/zQTOl12MKutDWaL+MrIv74zPrVnPp6iqxqC8kTc7WEbQJHmyj0X+HTq2yxBGsGi3WllyMx
	OR0sgDQY09QCMPll48pE3iBBUu+weHGIk7ck6q5KiXN/3ZK9SsdSjKJUl2cM7DE9/XVE+CQ3CVO
	N6bEniwmaAzqNKCyEx7MNX0+pd8SNW5pg7qUEdtwMqmCraXEqRZCQ2fJahRbVIT1HOlkNGu0hL1
	tfIXez+k0iAnKwcs46x2GUIZmTw0mVuZkBkKtLiaNX++2OKt8RjgM=
X-Received: by 2002:ac8:7f92:0:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-51e424dc615mr122134711cf.65.1784218727550;
        Thu, 16 Jul 2026 09:18:47 -0700 (PDT)
X-Received: by 2002:ac8:7f92:0:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-51e424dc615mr122134121cf.65.1784218726995;
        Thu, 16 Jul 2026 09:18:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:26 +0200
Subject: [PATCH v4 09/11] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-9-9b02e6f549d7@oss.qualcomm.com>
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
In-Reply-To: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 1wQHjDqOF1d-aV4946NN2hstmIBJ8tou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NyBTYWx0ZWRfX3YWU3a6fQ3Aa
 dnU26rxmuI59voHbK1E3J7EkbT+ybIaQI40dr7r951lNWemiDYiE1Z+rV5udvOju6e3Q7lg752w
 XbkvNxl0OjfzF7o7oGr6PitXd5Ow3zucnjVYggBxTCiY3ZPdhLmKVqcmNV192G+pniCSciWhGlp
 PSfZyFStHPi2OiGNhb6X3kXYlQTPpwtxs49+7lZdoNdVP3LtdDemywfkSeW/tZY2wq7kJjBQYdq
 vQWm3BebFW/Rw0SO/gUeoe/iflWs44V3hK0NHfmHFrofJqMcsRI2VaZRmr0JharC1GG1S+ymZql
 PdyHhLQ0JjaYltMvQK0BFO8dOcMxyRgNwVTiO6lDdM2w4g/QeL2c9sdmwE4InZ2dhFhDsB7W4hx
 UWXO+0g5XOzzFxR0rUxBpmgpgUd8YAgcuu7JyvYRXwOYDuridzJjcye4laL6MeHz6mbBxZv4Ibw
 SP+OUJq6TJ5bYpo4OAA==
X-Proofpoint-GUID: 1wQHjDqOF1d-aV4946NN2hstmIBJ8tou
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a590468 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NyBTYWx0ZWRfXx1t7Yc8VSnuT
 B4ERI1jYhH1cjRseEMnRXojls87caKGlQ9lT2TFkgXoJ2rz5efIc/DX77tQv/xkcDYW0Z9sUN9/
 b5UsIjw6EB6VhLAZj/iatrhRZx40x78=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160167

Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
Key E interface signals but are physically soldered as an LGA package
rather than plugged into a real M.2 Key E connector socket. Such designs
are not actual M.2 Key E connectors, so describe them with a dedicated
vendor-specific compatible while keeping "pcie-m2-e-connector" as a
fallback for the shared signal semantics.

Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 found on
Arduino Ventuno Q (Monaco Monza).

Add "qcom,pcie-m2-1620-lga-connector" for the M.2 LGA 1620 found on
The Lenovo Thinkpad T14s.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/pcie-m2-e-connector.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
index f7859aa9b63469cb43919c0b5719c18694c5364d..ce6173a0ec41cfe8ab4a5780940999c18674ab7e 100644
--- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -17,7 +17,13 @@ description:
 
 properties:
   compatible:
-    const: pcie-m2-e-connector
+    oneOf:
+      - const: pcie-m2-e-connector
+      - items:
+          - enum:
+              - qcom,pcie-m2-1418-lga-connector
+              - qcom,pcie-m2-1620-lga-connector
+          - const: pcie-m2-e-connector
 
   vpcie3v3-supply:
     description: A phandle to the regulator for 3.3v supply.

-- 
2.34.1

