Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD223B5839
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315349; cv=none; b=S0oDgi19X6DaIT5A/h+IQThmaOfgM3CqrnqrU7osjGuUIGhpcDXwGcm3KoK1njcggLwef1TvpzB7MSjoQbEgeX99/HqyzStv4MPxMQWrWJnc66173ID5y6aTx0WQ8uqrHei37jq36B7CHQznLLQ9uzcFgeL5CVnufbUZNs17LMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315349; c=relaxed/simple;
	bh=JDFgCYWtc+oUI6m4QlfCAkKEA7BRMEd/DU1CuWueAqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZmE1yn8P11pY2hhGElLGzYfG3JZrujKrzCQguMATVOhR7pL64wj6NZ10Zs3udnsLUh0nBB8qX0xRCPWf1AC0jB9TJc5xFhIiTVuXUduTqQGE9bnD/ybMx9TClfuCzZUSLTePjbK8GeXCWXY4z+AQlqjCEZaS9gUz9p8sjDHq2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXwCeuCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ju/ur+32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXwCeuCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ju/ur+32"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JE2N3627535
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=; b=eXwCeuClcwVrUfdF
	S0nc5Skriu2MiiHEAwlysFZLXobiLR3CEGgvCuhzexgGzgUT3wR+hOwFzOupyspl
	h5z+yyOsWmsZaJgWVT+8KbkF2m+IwEk6NPBJS6UOXDqJIJbqIEiszlMZ4ObmcDPa
	ztBnzc3SMhhci2C7hn3fMeWzu/P4dpoNbCRFspLTNNogo0ysHuwP1CXnJohCCRr+
	UUu4s3kTe8BcJoktM8HQdyCV33do1f9o7hK7TakaD2/JLlt7OdszjCS9ZwuuS1D3
	XGvkMKi5r1ezt1OkhCnsuzvwi2nPOTbkr+Q8Rz7qGj2p2KSq6N4MnGzHkXLBaf3T
	4+kqsA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq382p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:49:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so316544eec.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 22:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315346; x=1790920146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=;
        b=Ju/ur+32MXHFUCIXWou6WyzwtdwzTfk85oaIAj7WtibZjuv3BmecMuyh7uLzHWfHge
         AThq1bC53ZPw4zJkTOmfMj8V4jE8ClEtAQD9JkdMsuXm2sS6SdKfVu0+bfpoza9JS5h4
         x+S9COg7j5qFd5mfpSNb0O9Xp5vh74oqRzL2O956wWUiQRmWIHNXOm9XQ4t6Itd0AG1Z
         DXdPHTqfRNRWtRnJSSwT4GTpZgZwlgLc+RaG/gLED3TIyD/RA/6jSIakvX+VxCSStM4I
         dlxc1M8xZNDnRte6YQMsREqspJWQbEyMNaCdOSMQzaSLLpdkd4o2n0jSJNBgkcbMs0bG
         L5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315346; x=1790920146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngYHv8t1q8xCQbnExaa+q1yobNhD2HUJWqMbAGat/VM=;
        b=L3xwEYdD1wSWKBwKQib30LlNPDfoMgmrFsmK3kM7/ZtSHcLPqjiUZ58ebF0xBj6iv1
         8H/A8VH/mo/jM75IVQRsn+FmnEsxmA9Ut3eZp6pdrhyqVqb9rTjP03dpx0DShh2jKPU9
         HEJ13Xv1nWkmpvG+hilUFZ9lYUHyk6LHLf0M9PIvq35I2QXlq5F3nKsf76DEAXCS89pG
         Nd/NgWcvUAF8G8tCVR8W6AeO1+d4BJhlCZjGNKqrhXQic1fX/0ADP2BCmnR3gTxcOEmD
         ulUkXr3Q99Co3czazLTatA/+BgbQEBxximxRiT2ixa1xT1JZIcgxvaL/njDkUDhBUVIQ
         YvvA==
X-Forwarded-Encrypted: i=1; AKwUvBwmK7r77bQlBzI2UNsqfuSMUkWPPm3HJomapaoinJXuEE/vPMjObbV9AGEz0itj7Q0F9RL+WaVOBydi@vger.kernel.org
X-Gm-Message-State: AFuF++kVhdF440epPmO5FC4XeN77ib0fo7Y4sObUgkj4euZdmsZHdl9W
	gCyPu8ZCMhIqsiEXpWJQVrQYs1rESWkMTaKOMvutUoEezJkCKu21jB3VPNw+tZpG3Xqp/IkkGv+
	+6QBE5Ti0Ol2PST9RYKvccmDk62jm1ZAGxoLw0WrY4AtykOH6TfjXqALlky4W9UwY
X-Gm-Gg: AYBFou3P3rus0LxFGPTZW/r7g8MbzLpOvuSraBENnGLpKA9UY+Dp4W9bQT9Q28AqnHE
	xaUvpqvbFLYQdCJk+meLsEPHIbFKvNdJYKN30iPRPghKajSPp4XWfV4iAi5N8pIqXJ7M7xPnIy/
	LpGmNBN5fFx3s3kHK9A2/p07QjXaEdfGf5eB67SXv9WcYwq7lWF9/qYsj5TMv6PfGxpNPj29zNv
	yCy2WCOu8vqGnT6ZwE4ivfi+MeI9UzDqaXYytyCpsv3JdTDHwEOKh7HKHPw7Nwnm+dKCwarGdm1
	bm97t/p49GbC0G6i+6tFQOpBoP9BaQc1Hh1rIptEdTnxOtiTlt5vAuqd8XA8vhQWB7L0GMtq98f
	oO220IxiENt4h+Gjh7zsaGQCYmqoEPDU=
X-Received: by 2002:a05:7300:8196:b0:33b:c23b:f5a7 with SMTP id 5a478bee46e88-341994340b1mr1375309eec.21.1790315345812;
        Thu, 24 Sep 2026 22:49:05 -0700 (PDT)
X-Received: by 2002:a05:7300:8196:b0:33b:c23b:f5a7 with SMTP id 5a478bee46e88-341994340b1mr1375266eec.21.1790315345128;
        Thu, 24 Sep 2026 22:49:05 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:04 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:18:45 +0530
Subject: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
In-Reply-To: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=1088;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=JDFgCYWtc+oUI6m4QlfCAkKEA7BRMEd/DU1CuWueAqM=;
 b=A5DUX7u+2gUNyMDWLrtc3eW8cxxncvqp/ZA2Ckcf7cb75bVTMAhx22/8ERa731bcbDqVnUqxF
 Y943m3d4OA8AzY5sZylsjF7ITkYLMRmu1NaHifyQ/JQISuSXYIFmgej
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfX2SdvH05uGu4g
 BaZFgYB1AqnLdoZQEjZMhQo6dDADzc7qBDdrt28ab8S+JavH7AtIJGh9W/W8t1dpJrr0PgMX0Fu
 MZVaCu7n7R2cBorwdqfKwOYkzmv1P0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfX5Qndcy+GPPjv
 fTmVrvwOFkTRaqUMUUM/2U/fU9DPX16ji47VlpHxuh4OMGA+IYqzot43QRdUSjG4UxmhnGLvaw6
 8xe7QnNc4hRWF9YhC284J7BE3z8gEGsbuWYnHkOmNW0186KPneIK7knTNdf5JPArGeb6h5Y545i
 X/ILPj82HYJBFUVh8PBGK+2aR2tCtoIiPkuKk3ngh4Xb0+ND/jQX7xn95dsItFtgcS8vGkzDXKr
 4CVpPrIjLV/wlcYZkmUCBOofqEMNa77yScfRNQ56WxcRiaKUBn7W3GQPVwHhJB7F6LCJbe49Zfj
 ae+z8gpR64pPpumUDo2MLsW/MRo49KCaIv7qolYEpxj7o5W9jhx5KKdBir95ROzAO7ApfBiuQCw
 qBE0+VHlZ1tUuVd14HDTe8uxiOjrQupMnjrSCIptpr4rxt0xtHuHeH7HAA7fcEzAjc5fj6TMSwb
 Asgtbt/2cBljag4ZNUg==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab60b53 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GarM_vGPpaxcprxHJuEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: U3ek-qjE0KcSj0zfbkj6XjKML7WYNF86
X-Proofpoint-ORIG-GUID: U3ek-qjE0KcSj0zfbkj6XjKML7WYNF86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250023

Glymur integrates the same CSI2 PHY IP as X1E80100. Add
qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    oneOf:
+      - const: qcom,x1e80100-csi2-phy
+      - items:
+          - const: qcom,glymur-csi2-phy
+          - const: qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

