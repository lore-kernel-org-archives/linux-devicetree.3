Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD93241684A
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888073; cv=none; b=QkccaZUTwAL2orLXgvDG957dRWosbvNuakcxSr4TXimZtMgF56Hn6s7R57U8AVWhbQRdj2GHI1GSc7CC8bkExYvhXDrzR9XjSBH4JdQYTs/FcW9/J2/Mm/Gs/AlcAVVsx3o8/YDDVGxJKFEEqH1iKEWCz0UWKsMFIfXIyQktLEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888073; c=relaxed/simple;
	bh=QhIpU1PhvPa1yvdDG7TtlC4pUD4fBtOdPzA/6UHbt1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMrq4CJqajyHlw0D1M71rbaqJSWLD7tEkx0uYHlpOf+ELfWYS/ScTe/FpBawPHeEQZxK5AI/2AMMSCAWB0xhAbNW1RYuczeS7RoCe2jiM99gFepyqI+dO2VjdBC9wUWgkwgiMRfDiMahWbcMy3+ooX8dQLLiYwHICiIYH3LBfY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8Dfc5kz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDbvcUFG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8Dfc5kz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDbvcUFG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADY8x2720663
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOIqeU+Vy+7FCby5oSbAWAYAatMgvz8deWqkus8cJxA=; b=U8Dfc5kzwPJUmvBg
	Bi3U92RFKELULr7svdx4Mz8XLWywJMYpH4OjUEnfdID1DD7k+YHenfd+E2AmaHqX
	y4ZNjgyQBIUXVU6DcubLHwNYwsf9zpBdmXRjAC8AJ5K+xR7b73Os0XrYAOashUUX
	1qsmSyB1vqUNSyM7PzB8PYmbQwrpbVLhM7uzKdp9Hq+ejmedDz6xHWJAanosAeJ5
	SkS2GNVYcK8HKnM0q69Pd3IRFvw1kudhgLVq4QTdtWlamVVSXJIb9M3aTDQr3+rq
	DTU3UpF0B4o89ktIMX8KDgTi5UxIhrW0BouG+DFpJqTHVmL31962V+BFYqO4mMXr
	3q3bIw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yag1aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:14:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so4362285ad.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888069; x=1785492869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOIqeU+Vy+7FCby5oSbAWAYAatMgvz8deWqkus8cJxA=;
        b=gDbvcUFGURJLdE8wsx2pGyipceT7xgbao0G8euVJ74EqVxATMLBsP7auhzlIb7U1op
         xcZEHCV/zOsNwnT4QKEyJ/1XsgG6A/iFMqJ7yVWW8fgrWOy6y+ID7vN3vHUTn4C2AC+H
         B4R2r3uoLiB7SpboH+cZ/kKU09qbFC5PP8oe4M0yqqK9uuHqW0sUvOwDNf0TSpjqWcdX
         +oo/DZB1f0QA35zfVN/gefx0lfiRt+yKI0sVvulgBOzIFTrNFm1YmDQBAZ3hF0Z7bOTR
         KN4/0H9fTNbjNs7W7sXdFsl073wCVptGG/TIHxRfFD9R5J5bpW8qaXkT1NKkyfxt9WQm
         CMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888069; x=1785492869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOIqeU+Vy+7FCby5oSbAWAYAatMgvz8deWqkus8cJxA=;
        b=LVFMQRtV6vjUqxbDYUjXyIbc3dJ+jRt/TsTR6vYt0xTyWSlS+xAiul0Lme1MFmhDGA
         3JN+74Y4OWP7+kGHlcPrKVd+5KxHQAiDGEpc/onuomnj37Qo+zAekyCdjE+i/yolQ8oP
         qgtvDebWarWufcfJ6Wcvr/f1kf7/dTB4kgiAN0iBW0AxH0huFMbErB6/VIzOXLOdnwtw
         Vor4Stnl9Ff9ou2kuEawBR0BgkJbCGQ5uW/B+mI7rrZ0y88/Clx4vmsnoi0fIUJtVMIk
         sNMNE5hxVtrjCdWPqYFVK97eQbh48apKbDQMkoZz1o013zknbYiwEnh0JOrcRC/6H6XN
         tfEg==
X-Forwarded-Encrypted: i=1; AHgh+Rqef2Xo9tfrYKL28ep6DOJqVugywBKxLN+5vqHT20x34BY2iA67lGQ8LSY90MA9CKuBIxb4rQ5UZaj9@vger.kernel.org
X-Gm-Message-State: AOJu0YzYtyzsLaM5CzbjYyVcwlwm3qPKOyUnjk5sYmU8lBpVOJ5i9wRK
	3Fq6IUWEX4TVy2AFQI59434S9Ave76XVbw3GUUqLOFJSSPjg2O8s4SbYrgbsJe7kcxLW5qdXAHH
	WFao0ke7OYTarygQI7UoHjHvdO9ZeZg2t7SbjxmWvgBaWJONOjWUqic8zmt5BeCQ=
X-Gm-Gg: AR+sD11vTyXUKQI3qKfOZ3+dTnNV56Hj/dPsPcplJH26qEXPnIajB4f04+jSJH9s546
	xd/yXtUIWTnH1x9TofnYbpQgm8stUunotIUk+gDZoFVJ5EXqipHAXOmRxqv+olOm/0S5UDU37JY
	kaMN9hq8F38dPPKF2U2joGpnbbCwWXPPZ9by2AIjr78i1yPkBnl5td4aeMD7UvE4m8kCoC5ubQb
	H5PKE/dSgZ9pimdtPzfgG6mEOFFkCSF5QCanomj3qOci3hWs8fwwJ6bB1RD1UFNNFbdlMAn92dJ
	21CNHdj4VlwFua7CR/DC0aTqJdWrrkRrRqgw8Tsan7/3jgQKhfhklW4g3iB3wx9OhEImxTx6UlV
	CREQYKtNTzrTw01n5DxgTuUuMWhGagw==
X-Received: by 2002:a17:902:f68c:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2cfa6f963c6mr75343395ad.42.1784888069471;
        Fri, 24 Jul 2026 03:14:29 -0700 (PDT)
X-Received: by 2002:a17:902:f68c:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2cfa6f963c6mr75343175ad.42.1784888069059;
        Fri, 24 Jul 2026 03:14:29 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f31f14csm48486575ad.63.2026.07.24.03.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:14:28 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:44:11 +0530
Subject: [PATCH v6 1/3] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-b4-add_pwrkey_and_resin-v6-1-41acc214d93a@oss.qualcomm.com>
References: <20260724-b4-add_pwrkey_and_resin-v6-0-41acc214d93a@oss.qualcomm.com>
In-Reply-To: <20260724-b4-add_pwrkey_and_resin-v6-0-41acc214d93a@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784888058; l=2054;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=QhIpU1PhvPa1yvdDG7TtlC4pUD4fBtOdPzA/6UHbt1Q=;
 b=tQeinGHMVzCR9yydffTp1YhXBbbn4YkjIlln2bNJo1R5WtbVb++SOjIgRLzdq1w8Kn5T1Zr3f
 7Rvc76C79AJAJrLeOPo5DdWEoLx12PL8ffnyPQ+l9Hc1XCfhygcWQnn
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX2KYWRse7gcBR
 yv495XrjEgQjUuGm8RYIBN/S1Ma7lWmjhEZtz4/5EvdbLaMB6iPUgkC9qgfThIT7NBHSFyf8Idc
 9VwIRzUiLwEpekHqEtyLEHWeY1ao+E0=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a633b06 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=poc-AX2H5-bJkxpBHP0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: iS4FKU_-qSJTp5PTWx6NhWqJu3XQjXNJ
X-Proofpoint-ORIG-GUID: iS4FKU_-qSJTp5PTWx6NhWqJu3XQjXNJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX7GTpQSLUxb7A
 td5uEB24w2OD1iUu5mUV6ZV+ZXQD4jkKN4CG9DaCuyn1fYwqlxxZO20UCjoPa1zwEYHiMAf7HW0
 zAZpABR4N4NHRXDbwx8ugB+RsgS0dybPtDKdMV8ZJgPLaTgUpKxL1n+yovbpGej6yMtUBw6yLfo
 dd+Md6Nw4S5QTOwAHP+LQ8+50oE7CfUeeur2ZjFHGYL/aCAGsrjSqncKQUSF5II9DQyVz24go3A
 0z0yfZwkQzXegfTxm9vaFMKrEoLw+wxZPeXdLauLWdOuoMFsbLwJNliiBei92S2SB+o6nXcMgol
 wWya7cJrb7Dl/B8qF3XZf14nzwds+zngMHa/6ACbIX33n5QwIWJMwsB7Hr8QFc3DXLM+Epzmtxy
 KU7gHXODrAYe/ShZKPYlQ69UmhhyQ5HYsJex608s4iJk6uIxYJ+y9H528kNWSYUxDzwjDMjAjpy
 ZIsp0ms6kIIHRggY8Ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240093

PMM8654AU is a distinct PMIC variant from PMM8650AU despite sharing the
same PMIC subtype. PMM8654AU implements additional registers added to
the "hlos" register address spaces, so add qcom,pmm8654au-pon as a
fallback to qcom,pmk8350-pon to distinguish it from the baseline
PMK8350 PON implementation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v6:
 - As suggested by Krzysztof Kozlowski, split minItems: 2 fix for qcom,pmk8350-pon
   into a separate patch — it's an independent ABI fix unrelated to adding PMM8654AU support.

Changes in v5:
 - Set minItems: 2 for reg in the PMK8350 if/then block to enforce that
   both hlos and pbs address spaces are required for GEN3 PON peripherals.

Changes in v4:
 - Remove the contain for PMK8350 and new if:then for PMM8654AU as
   suggested by Krzysztof Kozlowski

Changes in v3:
 - Update the commit message.

Changes in v2:
 - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
---
 .../devicetree/bindings/power/reset/qcom,pon.yaml        | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 71d43d3602f7..3d07aa004eb6 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -17,12 +17,16 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-pon
-      - qcom,pm8941-pon
-      - qcom,pms405-pon
-      - qcom,pm8998-pon
-      - qcom,pmk8350-pon
+    oneOf:
+      - enum:
+          - qcom,pm8916-pon
+          - qcom,pm8941-pon
+          - qcom,pms405-pon
+          - qcom,pm8998-pon
+          - qcom,pmk8350-pon
+      - items:
+          - const: qcom,pmm8654au-pon
+          - const: qcom,pmk8350-pon
 
   reg:
     description: |

-- 
2.34.1

