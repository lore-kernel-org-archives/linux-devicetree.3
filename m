Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DDE4BB282
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005008; cv=none; b=Pt1PTn0TtWoSJY+2tKQ2Y7ZixnzW+mF3zBePMx7xqGTUuA2YlVD6yc1UQsNObm9Ygkc9wNgW4xZ5qEVieJ/VQv/Rf3T9BIjL41E7UGWeDHJEIIbz5DuzQr54alHcEGBsU8PEDC2rt2BPHidY9mDB5Eu4z0QGdyPM8YeoI4Yaq8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005008; c=relaxed/simple;
	bh=H3FZ7znaCS6E2tCa+3jHj85kDw9yZ0pmbfqMcQI6JqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C8VNRfE/f2dowiXh8It+GJTptqtenQtfvI5MGJfzWxj4TbBH5rXOIgmma+tISVseZ+rtNcTA/EXu+SGPKPjaCRoCnuAS/b6kPu3zInSBGF7c/81Dui6nnz8ej5UP9YGoZgBd4yNPWj49UR2eMGM7qanIodF6vwZHGxBM57fogkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWbQ9jUe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeOeX011; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWbQ9jUe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeOeX011"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAMZa2526806
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=dWbQ9jUezQSJ1tuY
	T1FrdwSBXPFscE5nNBotwR9KY+RQClgxdJ7Eh3nKsIpq3uprWwc2VT6riLALZKFN
	JZ1P0uO8FvO48KBuda7CqQsSIT+c2HFGCqHtSKceCNYH8vkXs+2hddrAtmG09shs
	5dWoZwkIHt7oR7/eVGEfYJXBhjiCJP4U6DH/j+PJMIJrWsEWjK+F1eBP4ob0wlWZ
	4RvkLCTKxq4Cp1/Uj2Hv6yOFvCKpPnjp/Hjt47H+gZDunJFDsKJg181+8W/XIQpe
	WsUOS96FjyptWRBJi95Gn6TdsLaCrgm8EqxUDuY5ukXDXyohRSI9nnwnUR5Ruj+e
	e3js8A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vb620-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:36:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-790e3ca4c85so826835137.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790005003; x=1790609803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=HeOeX011pehEoSKLv2ZUhMJpfX2NH9XxqoWkEZAZQDUtvFxSBevbStdRwxF/lV4pjG
         F5i1U7YclRTyxijPBKhDHsAYdezlJlWb6t5XRa/qu0R+8qKJNSu5Cyb/z7tC3gjgx8oT
         xDQEmyt1cbBXgAI1DuQt4CgOKE5GdTj/JOCD3225SWNjYww+E0DrdUkhSnPi4nKklPQV
         n7fHROSeDvaEdDRAFfhCXDy7u+IcUckSoNbGyWA+c6LjiOybDTwFzryrFMPPItuIkEuR
         jLhLgozyxhTb7L9iTuRG+z2m+fkrMQvbfn/ndE8EZ5NnAlnx2S4Dpb+CdBq8ejl356qL
         Y59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005003; x=1790609803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=ob99NGL2D2JpytOfhuK7VVzcgbv905YG/Fjyg8djR8ltz1WEUA9VRAWCLwg8Q7V1KY
         AlH0SrA9SAUH8XxfMvWDsSpKby1FI4ewMDHd2MORdmarGbw5PEm+8GXTiSZLHYqn25Uf
         cEPp0td/OLvqsAIoqMs0niNudkuo4YFluDeH/+2ZV8M0ulQzjTpCj3gcOsdlIiHOjGQ4
         zlSJkVdZwbxULUIwIqCRZwNY5GK223qF4xALSbXV4MQZGSvlTQQFEJAHnCQ9gQqnzrO7
         vZSEYDpH3QqL8g/BY/wKLDZMbvQ/Wr6dzI7jwsvkOzevrYEJzFBt1dwqgmfQT7k+obx9
         5K+Q==
X-Forwarded-Encrypted: i=1; AKwUvBys3Oy/NqONMnL7QoN94mymHwsUf+8HJTYvRUsSd7pbm9KHAKu8h+Mx6rpbMsfDKqUWLB77n6B3bZ4a@vger.kernel.org
X-Gm-Message-State: AFuF++kOETISTqKQ6GPz2menLEMkZmbXKhEzjaDOOWY9QoH2SJYF6n3K
	USsLbqlEpNSq2vdL7TCItqMLl6Vqt7sX0kPjTazrEQ1mKCdwqrteDbJS6R6X7xGWvXtz46zQ7LA
	lGaiBA9QehS0eOMmh8PNmiJBEBBanrVbgHKqJWKesBkzclmJJ6y51oVU8gob6mnWK
X-Gm-Gg: AYBFou1+zbtEmEXoJ9jt/pnW4lssLFfs7RYRM6uXe/lAzN6+jaywON03dS5s4qy0R9Q
	8CmZoVQ9naRrefhkm0M+P+zdrYnxrWobuoTB3gzEnZtmNj8wEQTcgwx9z51vN4qgaHLUSx9/hBN
	nMPG/M7GmnE1ZxMUlA4lKvjiZ5P615vWSzVzWyy89SNE9rO/r3MdmuhUjSrUwGT9PCyV75uW+Nc
	fYI/IZx3n7ZOT4pHJUNizdHzYUNzPi2OYv0gnl5as/VEyUU6gZ1Gcb/bKsQRSSjWIIQw69qIdR8
	M6jxZJfzqT8tvmH42TWhygfb/mCB3BqeBJ7c1aO3OihZ7pgi18hIJeFnLAbvHnjLDAEel/rz7G8
	Cp1rrcc4MOmDAlP2vgpZTgft7rR2rSDb6O2hTZxJiGy/7s9hR1NbZuTgL2d+fgWjmObMXJuIfRr
	MJxaJZBBP15lzmKM4/nIV2FMlkJNBcoFpKx7tHdOdFS49mbmyoAa0=
X-Received: by 2002:a05:6102:6b0a:b0:7a8:10eb:96c4 with SMTP id ada2fe7eead31-7a810fb1f76mr2252344137.20.1790005002789;
        Mon, 21 Sep 2026 08:36:42 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:7a8:10eb:96c4 with SMTP id ada2fe7eead31-7a810fb1f76mr2252292137.20.1790005002356;
        Mon, 21 Sep 2026 08:36:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:23 +0200
Subject: [PATCH v8 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-camss-isp-ope-v8-3-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab14f0b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: IDsjOA6ijKRljPtVh1yi6PjqGonBTe_g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfXzxjyt7xgWVT5
 LS8gd6upqVtJ7XdkqIv6E3EwLyXYDZbJpUdJGqkEXFxa6Uu2X9X0CqPJwqkEKqHfPUMvcEMIvge
 KmK+AfofydPhChkqAjrTOaqGxOyCsZE=
X-Proofpoint-GUID: IDsjOA6ijKRljPtVh1yi6PjqGonBTe_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX5+fQ3sZUNHnk
 RNXgsldbdNVTS3XfMWGxw9jgsvs/qC2iFjyOwLf3HRosu/1siXqlm3TBgh56U6u/LPBwbSm9Ztm
 xsxckVHJHKnEdQAol4jnSNWKQkmJ8NTMWSDfemaf32UubkPmciXkGKhR2CdP58+VxrirECtfGyH
 yA4VbM4bIo/Q/NXtmghtvEtZBYykBcllOUH6nrdSgYc3p7qwXl2+oyGMWhWe7vTTuIPzFUbLDpT
 SwceoZrQAuGI0h3IRS47fAfJn/85DATEHVq21qseEyZqcSnRdZJjIcEP7acuXpmt7it82ULvSfg
 1vGOOFPkLPHkHy5ZpXkHY1fxxDwa3fuqaw2fZLYDz99B3Kqm658EL6/65f5SywWdkrj1vXFoTqT
 nh+4PiLmuvDK7kvTB9DqH69xsbAJo7HLzM4x0KPOM60dGlFRo+QSZqdqjfQ9powc6cZl1ic7VMx
 FqISoN0C/TazD3RM49A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210227

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

