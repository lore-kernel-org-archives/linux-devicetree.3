Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655804;
	b=fnwje7Ah1qaj3J5gXSau1DEGO3Q0SC2EtQbjok58j9eZly28EGLs5PY1pQIZlVTI7oO6
	 IaaF73v/ctn6HEAx0XsnZ7+GFvo5HrE1MvhCtXwWVlVprBsHJsN2eOzLgkMwt5KwQXKVV
	 0bg3GyLmoPtg0k6r3xXkgnP6WcY4Au882kCbIG800nYQ59HGImptxPIpknpB6kJc8xqKz
	 /fQJzOA++56zJVGnaf+CBAGIqE3y+TnPe3HGOt0RsDgTp9DQ+mjKkJZ4QZDPLK8S3SBGo
	 8QggRJBtaeONpI9V8/bUn88eTtfxInFJkPYfAr7OkrKfO3Zj+7dBQldRrcUEswV5mDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=;
	b=IRQu5epsTqQuluhlNsmt+UJc6QcwDe4f1oIa1emyAFL7hr58EBXs1qDR/7kXeuYJL0AL
	 bQFN8uVWgHJXZMwfCiWEQ0cOl110yQr2hZZPQHLmWVsKHQzQ7trC4X0GwqKxFNZIm+9BG
	 XXpm27RYUuLSnaX//22uVq/uSsuDVc7Ky6H+SLt+gT+lyjMHpSULjyFHd9s/Ycjj3753s
	 MbqoTqTunNl0YbZuYWk6OZRdcdOrBFZd1zC+ouTKk6YnlSL186Q2kDEhb+8R7ocRW+4b3
	 n3sixvb5WUMfMqAiFGcFosFYVoKkDl46wutPykwAUYTIpe0/SiGL1sV5+9k8K1vO09A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1PCjtMg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVgWY2tA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40137606A891
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40137606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1PCjtMg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVgWY2tA
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wEfw2709861
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=; b=l1PCjtMgREQfKx4P
	zjv2l9uRq5lMe43qTPNoJN0Tgj6vGJILER7VcC32DvWY2sX+zSIKQ8OTrq0TE+7D
	fjcH2qGfoVzvYn2ZhyEwUs+cxRtx0qpm06b3raicfchLlLbpW3xk0c+yqaTz3Leu
	KcsIsdAzM50jijoUyYsiGhDnUZvQh4kxAi5XzHPDDTYPm1fCWtELPxbmkJTWJYth
	Eg4wv+nGokkQGHpPLq/dYUMk4XYdoglyVlZm4C7n3d0vf1gH5ZwOMcnwOJypuWdS
	wa6AlcnnAwH+RqnjbnCFpyWq28cE7AtGpE3wuwQCqeMOC0vinla7fOSW4FbYyx48
	LnlicQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhgm64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:30:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so208492285a.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655801; x=1795260601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=;
        b=bVgWY2tAD01OCKJ/mba2Y0ESA3h8UP4edt6Dxo0NHS/BjVkux5aR0n73hlnzhCrVQu
         vJpGaqRuIhjug2C8IYSrJYh7SZM60BfXPYR4a3Hx04CkNyrNFTxrr4piePuxo7ObWcdd
         gigXCcYYtnf8y8d4P7WHlakzvmOzUr+woXz7SUCXBehAMQAgw7nz9rotd6NeQr+0vkng
         0D1rk79BC0tskVhFvMDMEieSyXy0SnNbwnsoKUosE9A9/j8hTA2WbO9QGQ+M7Yxn2d9v
         IdEWk1Aku4kZ4Ny05Yt6KgoQJ1az/WGnY4Dgk7p++EdsoV1c2LegrUAICAtdAq2seRPb
         +u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655801; x=1795260601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=;
        b=HI75TQ/oM0YLuo/ts0SUOOuDDiI6GRNeRdnfKK/ZX8ZdywE2uiCElUMPtoUut0v1j/
         rbrTQ5jiZUT8nVcK6QFwqZWbZ2w4ETCz742Tby7delxjC5nI1Wo+k9pacQ5W80AnJnJ1
         1CMAWuJmw3pi5yT+5mlmkn6iJDw3z8CXeg0zf7QezZ7XBM5WmnHT8Y4ZcBa8yoIG6/Ux
         OyFIWVGXqZgWOjhMQupRkgP3vqjfS3p+FRAs8n8nLqkM19axgFFC1fvENAc8W0FENljn
         P95rGyjz/+b8ja30Ae13pF7Yxg9cXCbTariXROY4V4IXyw7F029yIX3mkw96k9of0GlC
         NWlw==
X-Forwarded-Encrypted: i=1; AL+hErGr1Qh94vXRhCFpb9qWhKt31oSL5VsiISEV01BoKrB3yKOBvANME4yMxIu22keC97Ju31WDYGyplVG9@vger.kernel.org
X-Gm-Message-State: APuU4Z+EQLMuiuswnWDVdt0gvc0NVcLdvvfjgIwzOec2oni5Z2mlCScB
	YNJ2V2CmMmy+QcIzLVzCJQagRMCMi2oE1QqqtK2yNwa1Zy1pfqfV471UzHdTiPN+ydizpGzC1hH
	eQC67w1Ep37DYUa9XlkesYNAMgesRRYVll05Gwzo1ceH3om/truMqUv+usBfJm2dP
X-Gm-Gg: AYBFou3RoN5mUe4rUYpLmXJuBl5tVIqlvII7KYezyYNyqozoxGxEu8N6njYBaRvsaWA
	Xc4OLfoNP6ml5D1aXKnBBaj+JEHjvT6QdtubFT0OtG7XwZnEIcZRYynpuCc/amVVy8+Ua1pAdch
	SycqGD9d7/eylKYembZ25BOyW/EGUGlHwWr9dyucTuejUnm8AJq2bAxz4tW4e4XJspnq0CFcm33
	I3Zk+297lGBfpMnUL91QFbMHGGBzUTJIntnJO8Hth5VrCnLuYB0oGmJh0ttHl1TLVQDwc3oqMZB
	yAChrxgSzMSRG53cljktib/h7f3/3b3l2OmL2PWbie7qti0U3rZ4w88QQBHdmaHN1cMb+BRu5Dy
	leNuSrh95X/y1BcjXV8m/NWD2QhK2cT+DY+2B7T0TB15i/gydmv6gjSYBcaf6ntaFj2G5bjCuOb
	/ppDzGTk1AiizHMHnHqQVGPtqLwJE2uNbYmuozcdeK
X-Received: by 2002:a05:620a:2b96:b0:93e:5fbf:a41c with SMTP id af79cd13be357-9494bbb7e8dmr822388785a.16.1794655801429;
        Sat, 14 Nov 2026 03:30:01 -0800 (PST)
X-Received: by 2002:a05:620a:2b96:b0:93e:5fbf:a41c with SMTP id af79cd13be357-9494bbb7e8dmr822385185a.16.1794655800997;
        Sat, 14 Nov 2026 03:30:00 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:00 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:19 +0800
Subject: [PATCH v7 02/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Eliza CSI2 PHY
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1564;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=QtLaeWAMwSvDdk5BkCV2zOXsDrkSYOKz3w000Imr2GU=;
 b=ayq0vPZ8usswe3DyeKH5IP05zg0wiuLc2SqaQYyKdo7ap2j6Eu99cswy46uQjGiABqtEkkTgk
 NJnxyDfwEYnBqhIjRcSBPIsviU6LYc8w5T8W63QcoOphFlwacdYlmcP
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: EmCoCdh1PZ32dVt2Ir265qnvVSX2uZcy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX8yc2Bvs91ui2
 7YHyawr8DUx3Q1IsHMj8xc6MKmJi4/QL6nJh5kBsrliG+zqFPogtPwq9mompU+9bsoPT9R5iiE/
 eCy4kzR59e2wQ4nQu6I/kg/i4C9ftdw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXzHQsMzUSFo2r
 wxFAbyW9vRuNd+MCYrJ+FW4TG/WqQOzse1eE/27Q4Sn2TUoywIJ2B/o2x0nwzQHXYkeQFIUzhn/
 FFnxVamqK9o7jK+MmqJdHKnY6ntvnjfNzD28phKKOGb04O2UCecC0Y9cofolKkwKEmydifqu829
 Uvgau+9sT77L43NGxplroLdzOX5ZaW69xPxdyK9pB5gqsnOBaqT3DU4LN3oonxSb0F7T4PnY/42
 CHHM01B5FIPyKKCns3vFj5Cv8olZo+pBzAcJLZYxpI4zXgrNKCiMip5kV0wYOtLWvpIp82u6be0
 niSaDbxxeYvfVTBNxB5+Hc6Wd89G9GYD51Gvy31DHcONZh1NgqzLBCP8y1qEcl2fnOAOyG8d6ub
 wA8E434rxisCk4EP/rvMJLP2yqNrCb6+e5wCNSen2GY2nR+C7nSpgPHg0ezcyMI4X+R1ZnfjcyA
 +D7QBG5e/Liz+rWpsVA==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af8463a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Cn39VxbTSVwEGcu4l40A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EmCoCdh1PZ32dVt2Ir265qnvVSX2uZcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add "qcom,eliza-csi2-phy" falling back to "qcom,x1e80100-csi2-phy", as
Eliza integrates the same CSI2 PHY IP.

Eliza has no MMCX and MXC rails: CX feeds the existing "mmcx" input and
MX the "mx" input, so only the power-domain descriptions need updating.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 8ff3df1d0d2787b2af0499c1e4106b86f56ff82c..884984f6f6b9e595df9bb3b0027c0bcf285b8058 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -22,7 +22,9 @@ properties:
           - qcom,sm8750-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
-          - const: qcom,glymur-csi2-phy
+          - enum:
+              - qcom,eliza-csi2-phy
+              - qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
 
   reg:
@@ -48,8 +50,8 @@ properties:
   power-domains:
     items:
       - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
-      - description: MMCX voltage rail
-      - description: MXC or MXA voltage rail
+      - description: MMCX or CX voltage rail
+      - description: MXC, MXA or MX voltage rail
 
   power-domain-names:
     items:

-- 
2.34.1

