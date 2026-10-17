Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D230E3D5656
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213118; cv=none; b=mbvVxtdqk9WYuBSRNN3Jy43YMGFLZ1LenpPpZLnOBYx7ujKeTIUssrAqp0bnIP8WSS68/ZAjJ6s7fUy85XyUgwVR0cIXXEwZcmcLwFgB7+/S9r6i3bxeDERoy59Hk615uOdBvoj+YNzSNPs69lLNGofpcpy2trLOsSpwTMNxO0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213118; c=relaxed/simple;
	bh=oIEkEtJU44W5iyJM4zuS6IESnQipHtO2Q2ZuXpG76YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBXB0GwWoPOKuYToCVEp88ZU28fhlAWn1OGMTj96o/Q40T2T7raapINJdJAHNBf0N5UVCmXREkx9ZKXiHksG+FU6UJuW2Zpfp88lSVm0oWaAj+lj+dx01Hf2TaeaI36eZ9gyQ8cmSWbfRnvp8ZYzSQNw76sSA5EnMvTkjdsPpNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ug4QqmXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjNEuFVt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ug4QqmXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjNEuFVt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30USn440296
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6L5qY269+Dl
	6bNrgkp43eymDN8CAanAIlGJdgx8qXIk=; b=Ug4QqmXLuhJri8oTIAmkD+hyXfZ
	on3X7GTEeEYO4e3vPbrFWTrSjAYcqTCSoy6922hUQh9MEj9RKedggO8gwjxQbHeM
	ELDdDFtsdQhDvaUNB2Il+9rYeA5M8q4rhHOZ8WOvIUiIfxAbHW9pG4M42t52/0UA
	rxoOVt/noBecrX6+5GHwniI76u7gVLghtEG3wltjDq+1FE80dUtPeAkmoxaJ7pWb
	Zg+Wio60U8ImsSKDJYtwFZC1AM5RmfFJioLV1tT95aiviggxamncBVTuhjwc+kLe
	rAZE8VhHW4h6mkJk0kfKgdQvltSKsUJlcEk41NN/klHAmJg6DF526XNdTyA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxg6mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 04:58:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1677389c88.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 21:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213115; x=1792817915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6L5qY269+Dl6bNrgkp43eymDN8CAanAIlGJdgx8qXIk=;
        b=OjNEuFVtpznAcDef8MIlesfTiOsLroYRbMCt0zyFb2tta4GtnEHQe9KV6vAWbWtIOu
         IAb37aYx+lNQxxrknk3+kd/qM2051gU/lV4de4AhKpA9U95sY1CZjLj2Xdw2D48oNZlr
         nnnl5xjew0phBKaVwXVt3/UrqtYVoQsG1lafNQN7C9F4Hq9mf6Z6KAxBrk5U6uM4Q479
         OTrV3Pnoa64NjQhaYtsmigYW838cQvGIRd8oI4KQk97bTr3as4e6zz5UAYzdUrCb+7vc
         ZWe8S8t6Ny+oCdVC3CvPFdL+8MiOeSvdlijzAe44KkQp4nMI0m1nZJNVLjIMSmKDVCwd
         VAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213115; x=1792817915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6L5qY269+Dl6bNrgkp43eymDN8CAanAIlGJdgx8qXIk=;
        b=0vMm8PeTRH+qXqBufAfpNsjlUZ0qWEA+hNw/xUVvTLXFEgwqm4Cl3WOBmcOdMwREkA
         rKfMSercngIuCFNk1zxsFb1dluVvgw3DIifJl3k7vdurQpRjC36aWOyHi3WgaUobUpxU
         PoD6ts+f0ahMSuzvNG8Sme6QiLpru0MCZKLRm980gKmHNKViODNCMzHLKr2njR3Nh2Zo
         IzOErFqP3NZKcp9v7LLJv1rFIHC4RH6jGKFeu5OtQIL6mTAoThCooi1801Xv2OsSKA/R
         p5TZIsauRjjhGnfh9LknTbWcOM3yWadHc9kf9jC+MGmNA1XVAY4aEe6wf5XwFkkpX2SY
         73vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzprw9oF8wk7eY1IUL0bK9MKnbux8MYVR/qiYakxz65gtD0wv2AIXxsRTH/CmPWSsyaibeNJKwtcnRy@vger.kernel.org
X-Gm-Message-State: AFq9FYIv9jbAqbhF6+6tjEJ3+MUCmllEQjEZ7yH5UcGz0Lf898FR9uP/
	XwoGAP0pkB4VypuSjgO2Hsf/O7wZyuqqldGREc8Ep21Wfdw411531x/D0kyQ08Cn03f6IB/3DEI
	0eD6YWXT1+TIhFPC5vq9YHNen7225TdvX2nNAhE7nB9YhHhgcV5rteMPn4T7AI4UCd9xsNoTW5H
	Jopg==
X-Gm-Gg: AYBFou37ft2bLjbUb04g7gwxGzUseroc0jCrTwpiZBO/HAdQx/WecLc4tzz827fx64f
	ZsY0u2j/Ji1tDOB0l4iLbreY4iv45VEufs43Xyub/4h3l9fRZborc/aS1ITvYQWw9eqy5VHwCsc
	fh1PA11FlAxEtQBBHqsyazBQeoLJ2beg3mv+n/iGkB0BWaJd4FJM1TNMDu7WD5LBJw4ZSelW9ga
	nAgAu+vs09k+8mmxXxdon0cAoIWqJUUpk22y4jx0SpTYaJPsOSX2aQdbGoV8zIDTWukn6Jc0kcb
	0b3/3j65w/3Rx71PS4q4D6eWgB3aj0Pn+kGDzavpWo5FZQ4cZnYqPd03q8lZZwmOnD0zsWMT7FE
	L69uYVgR5DBy8xH5nC1MYS9g/bz+8elDkYFW8YOfiquSmVxU6eCDGLXvpVOg=
X-Received: by 2002:a05:701b:4354:b0:16c:4eef:a526 with SMTP id a92af1059eb24-1851238bde2mr2551560c88.15.1792213114672;
        Fri, 16 Oct 2026 21:58:34 -0700 (PDT)
X-Received: by 2002:a05:701b:4354:b0:16c:4eef:a526 with SMTP id a92af1059eb24-1851238bde2mr2551516c88.15.1792213114078;
        Fri, 16 Oct 2026 21:58:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
Date: Sat, 17 Oct 2026 12:58:14 +0800
Message-ID: <20261017045817.1506961-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX67Jtl7HOiCxW
 CDTEBm9TtE4nF7U2nLgMXbOMTGkShixm0RP/+Nl2da5qY0R8ZgxnmIgd9R0zrtdNhSIjH4DW7Da
 QZHpDqKoU/RHCJEhIHBZj7sFiok/uaM=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad3007b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3WhL5buBUIyFYQ3kjXcA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfXxGq+8Hp+u99U
 ifkOLQTZfve1nTc2Su3tMYw1k2LRMYlfzw7PBVH71nKi7ZAkj4weSSSlFgbc7YIr3ijmW6zKH0E
 Mu7ZBrFR/UoLus8ThUXnElI+GatmMSi2i6kIxF9lnPbBSBOqVx5BomSFWozTAnT8h5pCRHyaKyu
 6CWzkH9UH66/bnDBbWHUCSbCtDKZpqFQUfMJmAaFWsI72kTUO3F4DR15yTHoiwLTqKkOJyv55Km
 fRV4GLLreY4J3HhXPSS6VKWfiv9ojXf/Usb/qWJpuoN7bdXclSno3PRhTv59AHgpjpT6lcQfBkr
 UWRtAOOq5JDMq9PnJgjwUrkRkKRyfPGH5P1BYEEtB/SvC9qucXPFjZnwg9+wn0yHnG8lQtgn37A
 w6T8ZG6tynSfFzj6hHXvs2j0YxMId5N72Ck7NlxuKfEloSUcHJylb7cuNpi8fRevPnKfKHmoofS
 q1gGn8ykFGoNtxkuXyg==
X-Proofpoint-ORIG-GUID: R6xgBm2rj2eBd4hpDk02FOxIf9Cj1WIB
X-Proofpoint-GUID: R6xgBm2rj2eBd4hpDk02FOxIf9Cj1WIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170019

The schema describes exactly two clock inputs for every compatible it
covers, a board XO and a video AHB clock from GCC. That does not match
the video clock controller found on Glymur, Nord and SM8750.

Per the hardware documentation, the controller on these SoCs has three
clock inputs: the board XO, the active-only board XO that feeds its PLL
reference, and the 32 kHz chip sleep clock that sources its sleep clock
generator. It has no AHB clock input. The AHB clock the controller uses
for itself is generated inside the block from the XO input.

Because the schema stops at two items, the sleep clock input cannot be
described in device tree at all, and the second item is described as a
clock that is not routed into the controller.

Describe three inputs for the Glymur, Nord and SM8750 compatibles and
keep the existing two-input description for the remaining compatibles.

Assisted-by: LLM
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml   | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e985a450451d..7ed5aeb050cd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -42,9 +42,8 @@ properties:
       - qcom,x1p42100-videocc
 
   clocks:
-    items:
-      - description: Board XO source
-      - description: Video AHB clock from GCC
+    minItems: 2
+    maxItems: 3
 
   power-domains:
     description:
@@ -79,6 +78,27 @@ allOf:
     then:
       required:
         - required-opps
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-videocc
+              - qcom,nord-videocc
+              - qcom,sm8750-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board active-only XO source
+            - description: Sleep clock source
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Video AHB clock from GCC
 
 unevaluatedProperties: false
 
-- 
2.43.0

