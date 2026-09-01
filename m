Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF3E477999
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256285; cv=none; b=GIW5RBlvouiI8tWkUYJpOLW8eJN1isnzxGH1xCPFmZDv3erJVgZuga64bIGjVFErzwAyj3AYuX4ToXWh6bGi46XvbUYiTy1GCAcalcrA8fd9eIXcuZcX7x+Ize99mCPZ4uUURyl73qzYt6hsZHQmO3AQVjS0X9CWZLafKMlWl5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256285; c=relaxed/simple;
	bh=rreLXykQ63a6y1IOwDu9sw1t19oiyBF8/4USLE8zOa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttJv53OsZuq4D5STR265H5JMhkVgVg5X2RdmAbP++GarPDucm1dXMFeQMeQc19l3WWxD8ySRm/6QavXh1PbuKh7Lkqk0AnQDKsNuNJxy9SJWf4+oo4sZaqzjwnCoL8HbWjTugLJWuhFXrLxAgo1qu6opqOvMDoRYu3uCD7ltGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+drau0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GG1TLN5B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+drau0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GG1TLN5B"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Jx31709556
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 09:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mtqWHtuTVnw
	9seSmxnafqm6ClpcflDXdGN4SeAvMOJs=; b=V+drau0bLqvt0G5kCd0l3IURuGh
	Y6WtBcFldiI+HJCor924vxppPpWslXIqZABzN+lfYiKTcghIpnCF8f1MvLfG2zaR
	b5ycASXx2p0oyvGNrLMFgj5yEdLKcpNP+LZKuknhrEhPZmSwmlAPf5fIVtuo8BXb
	+FIrlVNm/qum/08SovESR9K9wJR+CaVV1V1HRSvLLRAuRRofCif/mPzuZ3sKELp5
	Fs11CFPbcUCWkekhPiNv/3W+Y4MrFnabumMAG0Y/J0AMgaQmCSFCribZ0NoYIvpX
	NH7QUfP1a/PiQUU4Wb+OFZ/0b/wo9IhDrzn40vDTFPebmWq1pYtiFWIcJzA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fsmpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 09:51:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so972139a91.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256282; x=1788861082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtqWHtuTVnw9seSmxnafqm6ClpcflDXdGN4SeAvMOJs=;
        b=GG1TLN5B5KG4N7yL65DuiXpYsRwjs0IEW+tpgK85pqeYAQmBj9FWwSN/ZPaJQf6DBU
         izTN3DmC+6ftNAYzeds0plbjUNZ+RzUw5a6UvWZnXbNvLKz9TV+enubNNNSRoWMxUUWN
         3wyn9IMXv/uQ9ofJmScvE1nKEv3I7i4V+tuBH2FBKTYDyAZ3snAG1JVN5A/6+o42+yNw
         +O2pbMC5Yruu/ZFof1ORWUK5rzpTLoIKljcgz0/1D+5QI1wecgNftQiyhVMqhSaWp5pL
         9swm/03CWs882KgTq/eO0A8dvz1rFxdtdvn3bODerlZRottXaxOwIhU52atFaOe7kx6N
         kxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256282; x=1788861082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtqWHtuTVnw9seSmxnafqm6ClpcflDXdGN4SeAvMOJs=;
        b=CZmswxRt4koiSM+PPF5yJul2eMh9tAv4EhXJSbkoydInOskHeWPEeorggFUKi/PYzM
         Ke/XftcEH0E9XjWfgva7EgFcgMZ61ohjFuXVNeYUMHe/AMIdp9GGNx/+0CqyKwAb4kT2
         ZXzW3QcRMuPmzbQ61t4Y02Zl2vWbpOF0mRv+5ZggZOAQo7ohKpPx8Jyl1ff1GbfvOkfV
         nswTiwVtjR2RVtz2u3+zYsW4pnN8MkabvnORqjHxlStmOawnKS3dBafuZQXvDn30caHs
         XuBn8sJ3YbaHM5dcBi0OVXVSwL8Ysh/V0gFNiobwZJgAqrDxwfLAtV7dzbC56T8cbZdP
         YD/g==
X-Forwarded-Encrypted: i=1; AKwUvBzO4j92vKN9O55bs1+flylbRLImmHWBOFySaocqWNSF1o0i44n0upIpJg6mvGPNDZrl40p8O0RD9dUj@vger.kernel.org
X-Gm-Message-State: AFuF++mcjzctueAzNTZvdxYr7r5L8a0Mfebg/HZpa6tflR+36Uddutmm
	ktu+jDrbHjypjjJ20CR1NVUsrNFphJaVeQz6wLJJiaZwyRb+KipNaT0z1JEVqtib3cKyNW4o4lU
	+TpnfUDccZMlmjCz5OD5ta7fJKk/j/Q5exWG67i+D3dc0Al+PChY7J6PqHdG97XBr
X-Gm-Gg: AR+sD11extpnmBUsGHJVggTExg93Sl627uViIbyRz4gmN8xd/KGZ+x2rEFWhoIPOedZ
	dgj7PSc3g1Nwrz4RVgGBv+9cczRo+WI330hb/sT+xV530xjqytJB/clDOSizUjnEKlk7XhRJPxK
	IoKL0EvilPuXPCBgkY38maw4qliEaE8EOiYrNUNPDxEnIrBlZLGsVV0WDsu+gSo+u7x44Z3JXp4
	6IzIyg6lEZCCoS78vqCh7izCrfsIv94b/awsye2wr4bcXMRJqxFMtnk8kkdu+QQ8O4mCdJxGAkh
	yUeWKwn0PoSrO8oZNI9CBMg9J65LtVP3ioQc/vx9v9TZY+uAOKLgvS1Ad/oTNDo/+DBfeJx2zbQ
	Do0WKUoZbsy/Z72IPxnBOAFaapmdrtNfQw5iEWaExVI80CR9xcLjPhY51yVMY
X-Received: by 2002:a17:903:1ac7:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2d95284f383mr41119855ad.19.1788256281586;
        Tue, 01 Sep 2026 02:51:21 -0700 (PDT)
X-Received: by 2002:a17:903:1ac7:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2d95284f383mr41119425ad.19.1788256281101;
        Tue, 01 Sep 2026 02:51:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: phy: qcom,snps-eusb2-phy: Make resets optional
Date: Tue,  1 Sep 2026 17:50:52 +0800
Message-ID: <20260901095055.42229-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SuduLC05Bb2AUmREDORwWcRaIK7OxoPz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXz6FIcQK7kMKR
 N04SAbvSjkqR5IFFHJeZ6EGGewQYjkY+uqozo+8lcn9hLc0K4vpziHuEgHS1LNfzL6Z1DDEt1k4
 +6MT5hmo1akt6stZDRKBpkfX3UJ6e18=
X-Proofpoint-ORIG-GUID: SuduLC05Bb2AUmREDORwWcRaIK7OxoPz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX+4Xe7IwXksh+
 iWg4dO/JAVVqtoIaFnhFXU/0ew/dHQxwSi1Z6dX7ncvFOGED6nU24Tn7p0dfx3q/JXYbnho1AAN
 H/KtZcOOZgtsEzG1uGMvZX13agPkJOvoinUheCPzeEqCWQtYYzYxbpzJ0DeftUadJuo2z47Ww2Z
 rfzy4NIxYxMOLUbxj/cv4xop48hTHIFU5Jao/1xRVHIJbEZFX41GyChFJ6X5PL8GpDqoZNUtTPx
 PERDNahPFqjx3ESrbdYG1bkHSjAX2HBYW+uPr+WpDYio3F8/NVfcMoZoHC60iNJ/ZzwcpKh7QRn
 B10Qwb/MJFu5SA5e3bR7SJwu++xpjjV6vTvpAQau2dp3Cf23rBAoA06cSLwRd8ZfeJvdjhXgCFK
 J2NfjQIGzPgojAE50Dt2gEG59AM5AFDHmhblBF8i5/cLjyRYjYJwmksQfahgjBGYeSGMPaXcHS0
 F3GCZ4+WopuI0snzCyg==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96a01a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=J30188syTye5AiLRMCUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Not every instance of this PHY has a block reset of its own. On Nord
SoC there are three eUSB2 PHYs but only two QUSB2PHY block resets:
the HS-only USB20 tile has no dedicated PHY reset and is instead reset as
a whole through the controller's own USB20_PRIM_BCR. Requiring 'resets'
makes that instance impossible to describe, since the controller and the
PHY cannot both claim the single block reset exclusively.

The driver has always treated the reset as optional - it uses
devm_reset_control_get_optional_exclusive() - and the sibling
samsung,exynos2200-eusb2-phy binding, which is served by the same driver,
does not require it either. Drop it from the required list.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 096f6b546632..2140482c8e3b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -64,7 +64,6 @@ required:
   - clock-names
   - vdd-supply
   - vdda12-supply
-  - resets
 
 additionalProperties: false
 
-- 
2.43.0

