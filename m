Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898248;
	b=MCu1euREQi5aQ5jhVbmB3mNZiHsmmWPQqDxcWvVk/Q3RK2nhIay6efgjJcMwXPDdHFUn
	 XmBXrPvWu1n5NqFRqJTmQiKO/ot6ddV4bL4fz2ICo5kSaFeNo9iANHpIZZ2dUi78T0K2q
	 zzpEGLHEvfce5QRT3S40gL3HVtI02erTTJhijyrcTIU6lhRqgLYlD2EzyWoLblqqsMc4k
	 nLAthmu/T/yD1aaRFx4wnvOq6JBYSNvINBo09KEhLKzf5zAFnz7R7b1eodYZI2RLDtmQU
	 otMMKqnmFCF1tmx/kkLsoyrgOaG+0IqZxxzmAOsMK/+dJg4iJnQ65fCCAzO8aNi+wew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
	b=G0WUFPb7tmKwLDJ/j/kIoLw6hKLMTH1OZwcjVj3yxU1rbJhaTKCbYkiI45TX7kMZkJiA
	 /Jx7l/OhCVkVbQVMbkNo82UTrzE76teh1D1+YwKkU2M/yKTRBbLwRNUjJqu4EZg5x06ty
	 hOqmXS4+ToOwPtnrxmbkvhliEPw3GeJr3SCvck4baX5ydC55L6sfKHkzQpPtU3lb2JFJC
	 uJdVXgGeuK7lBUntyGJUoWOVmVW95WNfmV1MYEpbcwewyuzmA63bNgD3NWwgxs29gYank
	 VoKgthJTpam8sUI7eSWUkA+pey2HwCesl2rofgEbpDbjnJA4gpHuw5uaP+5yWCGt1eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SCzBh80/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fj76w3E6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D87606A31E
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D87606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SCzBh80/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fj76w3E6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P167hL4172054
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=SCzBh80/mzYWZPwR
	yd9O6sltFqAZzsIQLIesE0CowOho+t5yQXE6m5mFKGspS8Fi2PZ7cm7zhyNR93br
	VVz6x5pz5LK20fiwBFKqPuyPjR9EwpBLbbng1bTWb4XFIuK1FgIoCpAjwXcksiGy
	Y4Q0gh5mcEQcYm3AmQDrlCk8zHDSrAnDQlIp60mHoX+1g6l4wwrkrqj3XtruHX+U
	sez03Wp8SqJOKLVKY5uDnZ5uTGlCHNYG10IP6hz2fDWvTDvABpKYxyToOCHDRpqq
	pH7asf69nlE9oX0TN0dBCsjGl+PUj3ZWXGcowljRlCChzU/WVGWBzlhmkMSvbY9u
	rXbO9g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgtmwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9408312eec.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898247; x=1793503047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=fj76w3E6KaU+Eo4VTWWaSpIUcE5RG63qXIVLSLIHemB0jwwAa/bJiL9WDapeTPuCkn
         sDdaGwHnlJfKTRjzjAUUZgbNjGWfWIlJs8qEQ0xlW2zUB9/U9VRF+j929lRQHgmbG8Cy
         SUFK1mqMdCx95KabSWScUcNzNcKhDmaKF/wQLXtoOOu2wwndU0X1yKZ2+rgGi38kbKpl
         LITwsWpE/TlEgli431eVz5lxRYwnmdZfzzPTNr37AJsreGpPok401I8ZYphcKgKMd2or
         hUhTcEtsLzyqhwE83bP0MAziLFzsMjm6qlbbIqA8+P1bgHchCvR2/eqYvFO8VE7Gj5O3
         U7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898247; x=1793503047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=Sx+aL/y/hGDR0mzu6ctxyCG/4A47+wTKVLc+eJDA5l8CKNSz2/TxAMdtUz+tCin/0h
         PpPqER5qf+HrBHWsTU1cAiFqi4Zi6LY6vRrKdnVeG9rTP4cHhlFzjo4dPMhEp397co6z
         pwtoPfDun78yMokMuXMl01rFKS71GQmC+ZlZTtLZg5CzDOoje515+bxp3H0HK2tUnO/L
         OFYb3U9gtuq3oWpinVbXtdQvrUro+E74cKBZ8QYydVrs0eCNNCvSeKObsR7NihFdWg7n
         NbIkz0L762etJhG/uw65gkE/1uDhAxvWHtqLte15ZMv2XLpM9jbXa0KfIWQAtJDebtcj
         hrcA==
X-Forwarded-Encrypted: i=1; AKwUvBy72pt10rAYASyxTuiCSO+//seOGoao80cL6nxiWRuV+jFxOsBI5ft3FE0tdQGXZtfdiYPyg03vuSef@vger.kernel.org
X-Gm-Message-State: AFq9FYLN+EFHsclzFy6/iiAHVhlwWB3GNmOZnD3FplQqcOg6f+wJd8Sq
	yKC2b5sxZ1hBrPpIrGwfEPdNmOYHoaaomL3qsdTjH0ToQBVSD6WrqPFXux4sZvfZyKFZNIZgrdl
	lRu+rbCH7qltK8hPXxezHGhhNCvr+yhnUWy9Nk3iGKsAzifjUWRKeeylwYJupNJ8U
X-Gm-Gg: AYBFou2xF95QKM6m5w32hg0HYP0ugpcHtYBV0grGC4XeBmXudapCZLdtmc0QxLKVncs
	GNKqfVNI/KF5rOxjAbmtFpCND5Mw7QKmsPw9qevk4Tr3ohRvTVjR1PEZwMv+Ciz6LtVHzmfXrVG
	hRHnHmEFcopr7BHSEib1UiPgugX1kf++HwJGBYKn0o227f3GXwj35RYMSshC0xJhD8Sl0YvsQwo
	L5W2CjjoHJ3ElCdbSyc7aIeXCvXoxY+kR9S2dKwTfqPFegd2kXBa5gXAmH1aBe0QpuUTCP9L91b
	L/V5knVAkmurgzqdYkuQ8QqE05XgXEFmSe4dQFTqYQPci0t5jLFSImV2TY+a2Oq6+RXbPlCShMp
	IeXQy6xRaFispsO6PRy61kHMdlXah46546TRxg9Y0lXrLq/mbWrwmm6/63ROoD9DWqJZPhf9+8R
	yoN0cQEi7hEQ==
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7536797eec.6.1792898246491;
        Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7536761eec.6.1792898245931;
        Sat, 24 Oct 2026 20:17:25 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:20 -0700
Subject: [PATCH v22 01/14] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-kaanapali-camss-v22-1-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX5HRMoDjspjRV
 eeVlA66UeLNNErseFFsQ5itrheQbNocJ3LoKczCCv5MMHxR5QifZpddJxzCLxqVoGyfQMz7CCcp
 st96VQc1hHbDsepod/nuIqXN/pP75z8=
X-Proofpoint-GUID: HyiWvoio8ksi1qzc_1pFd5fFtluMdLcE
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6add74c7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX4diRXbi+YF2B
 fZAWSHUwNM7+aIxT5PE/0mIX3KyRQhYNaI6Qj/pLt1fEIKWN7/GfsExolLGaHa6UGet5f6UkKI0
 DYEdUf3gUz9kFfR4KrRpVJUO0vYKkYtMwrISDCQ0+mbhSaZlgqjpo2iDiUnoiHLzQuu5wAqCjQJ
 o5qmDUaBBLZ3Bg8O/Puqb8q+ryVuSJEKtxZs1ZDOsJ8tKA4MhhJcvw9ULNb+laMUjVr2P2bb5eL
 zUf8SBP1oud5kwki6pcEOVVe/1z1PkeszgbO0picIaR9Arav5Rs8XNuXN7MiRGlf8ZYLI9zdmTn
 EyKj6lrjLB7wJyLI5UqcdJ+c7SwOrPkSNuMYK8vL6HTEFmNdOZidEPTIqd9K/nBcNfzSk/l92FT
 0S+DH8kruezYNLDG/TDhonk6qn3Php6r/+z4C1Yg+rur6WIoUpMT8u4Opy8XQBfpSCXtNBmxAn5
 I+zy1RoufqJ0Oext1mA==
X-Proofpoint-ORIG-GUID: HyiWvoio8ksi1qzc_1pFd5fFtluMdLcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

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

