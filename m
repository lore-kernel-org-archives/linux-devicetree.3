Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B470844471C
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447061; cv=none; b=C5V99z0WwaD+SqcIRslnJzfaX1pw2GE7wIKi5ZwKq4wHu/+vljBpfMmZcSrkqqO44wjdpCaeSY9RNLlT9QnQ5YDaebnDrskqdRttY9HHUl+eCQJvQwBDAMsAe7G/FxcAfYk9yR7YgkKd5qYaSqdglPkobqrjjVXGSNXhh2yypQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447061; c=relaxed/simple;
	bh=lW+BjBc44xxgOXmAvVsVeNBY4CiFkSeUDyQax0nrKZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NiKb2A5Y+GMsd9YjtfBMyBlTkGqxToxh6DrRiJHyMXkr05+eCf7OkIfofmUtfxKofL6U2wih74oDRmoa1mJrK8FS96hJwoRUnJc16sF0EhTKErLO3rLc9Ize8JJcOvk8qMWI713iSW6zk1oaAtDp9iTN740sYmd37nBFrCCKZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBFB47eB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmpLTBXu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBFB47eB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmpLTBXu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K9nQ1574576
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 08:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X6olKQwQuxS
	3zvOFoSIRT8dGSQE6F6DMqOqpL/8np3Q=; b=BBFB47eBfyQGNtK3mz4L4gcZWgr
	c+NuIS5AMsC7NeaKHli/Qw0l6MXlJV3DXxPCRt5SW494IsPXepDiBYm1zabBJibp
	mH9bSlgK6B2PN5nH2fzquzcw4UelpVzQsIyxNMTZD9Jj+7oDvi/whU/lHHxfqpwi
	zmRuuJhyQb8qaM5gSJL0Qv3O0BATSeeoRb/UzMexiiwM+hu3v5obQsqqhXv6CHOe
	XVIfqZ2Yh9QcmzMjtdXHmbevxwXiQf9R0U9w7S/j4y2ZHJeQY+g59WNcx+NNHNUC
	BjTXfh6RtcA0G/y1EzqHyR42TV4uJAqE38sddhPyEwIzsQd3D7VG/PBqZNQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51v97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:10:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1663fb7e005so408389c88.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791447058; x=1792051858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X6olKQwQuxS3zvOFoSIRT8dGSQE6F6DMqOqpL/8np3Q=;
        b=GmpLTBXuVv/Nq8ced3WJWLfVHBikPDi8FAeMGALxUEVwXojIKrifsaL4txjJeUIJDq
         AlYgHc4An6EM6SXcfsALtKAmLxAxl0J6iFOGBG/ZGKO/t12fKFskIlp73aNYDmq/TkjQ
         ewSzCzKYP54giKBodBj9BAVXCJOBMHHdMH0Gdphgup04T0XYGVfG6QoJU11oUwBRUWyw
         BLL4I1xf8ps4p8kWWjtTl3pec2V3MmzbDP4QmBfJ5ZHEFEltZiUGFQS8IqWdgC7Wjvqi
         PyPXtLoPZzSLKDd0aWggz6Fd2KbO3CKzueo3ZiO3TH+VjqDJ4KlRz+YqfM0fDEpmP3fS
         nTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447058; x=1792051858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X6olKQwQuxS3zvOFoSIRT8dGSQE6F6DMqOqpL/8np3Q=;
        b=wJ0yenms1HxkQtzt28nusswXinW4BZHNuH1XwL01bAExywcw1YD5y0rvGSuytWth5N
         TfItN9PIYF9OsADUQ6faqjnMEPpbjOGGyAMeMtBbpcvAHSfo6Mm0M4t6m2JH58ZKJUQ7
         kuox57IctpoKfpJq7EaFUNInifEE2SZW940phmuPDJyvF/sIrLxsQnynjdxP6MipMCK+
         HjTSZ2UxMLJqdvOZBZxKeMTnKxTujT20HLhp2opgAN5QcRk2WZHYA+cCy3jFROMTFl6F
         SX5KzlM+GOLwaVDG1xN2I9uGZ/BYgdwazXxvRQSbsb0Dgdt9yTgQ0vpQBjSREf5SAOsp
         uqMw==
X-Forwarded-Encrypted: i=1; AKwUvBwJRG0kZDhD/s/Mac3jSxDUhSv+3MJ77wSRFgT8eoMnq0fhILLFba9nZdCXhgmwx0avZ1MwPAGkT0sr@vger.kernel.org
X-Gm-Message-State: AFuF++lVkm7dvNGuB9hanzZV9XICPKpc4C+avb8HZibvGmBpCGC6xPhE
	V7PkvdK03KBS8ygwRLy68d43rwEzmSdVUrN20kMzLrwiv3rD5EZA20udf9H3Wl/UHzCTij6WOkg
	LEwtpptZsn3YFz5MehI97Bzmj47zU4c5wE2C4kBmrvseAdgGQ+RPlIhzlx0DIZvL7
X-Gm-Gg: AYBFou06oNYVUyqSA4RmDCew38QBHYIwMP+LGixP1oqBQi0WWCM0T9FkGDWjz+K0qbA
	q4+HvlUBRM/BD1C+X6+wTIjeSXbQs0baJN+XZMoaZSX+nrTfQcaH/18xvkA/Tn3huIcUUi+tc6y
	wKqNeRgLAZ9flVH5f1SjMwOBS7v5+llowtPGk7PXNUJ240s/jS5MmrduGo0NPES3CQ+SUVQQmvn
	kMF3TMMFORG01NCx+4WDjDL4MzHxPrYuy8gUqAHf/ovDZVS+d3BU1uwcTxTedhptBu+qnUMWXMk
	Dy/RuHzvq8Q7KSYHPf/kAC6honLTxxUnyjAAbi69FdJI2Wa/M2ma5awwBzYvMHh2ArA/4yazraD
	wnDzNTWOzaT6ooEXOyi+4iELZoXI0tUY7ivsxh5OWJyJYWR2nXqFseV+kutg=
X-Received: by 2002:a05:701b:2912:b0:144:fb31:a597 with SMTP id a92af1059eb24-16208fb33a6mr6015899c88.47.1791447058088;
        Thu, 08 Oct 2026 01:10:58 -0700 (PDT)
X-Received: by 2002:a05:701b:2912:b0:144:fb31:a597 with SMTP id a92af1059eb24-16208fb33a6mr6015839c88.47.1791447057179;
        Thu, 08 Oct 2026 01:10:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm14522277c88.4.2026.10.08.01.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:10:56 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom,sm8450-videocc: Fix clock inputs for Glymur
Date: Thu,  8 Oct 2026 16:10:33 +0800
Message-ID: <20261008081036.3492003-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tU9NHtXF9fzWtRH1bgbfm1ddinZazHFL
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac75012 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3WhL5buBUIyFYQ3kjXcA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX+5c7Z0FZUJy5
 7VpCYOEo5Aimpj4kgP6Y8kwl0TJYGvEmNUa5Ei/q5t1ZCwTCizi6co7BPzxPHXuz9XrRcFdQ2D/
 Ee438b4juDoJA1NX8lqNG8Wa2skeFOQ=
X-Proofpoint-GUID: tU9NHtXF9fzWtRH1bgbfm1ddinZazHFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMiBTYWx0ZWRfX3H2m6DFOYdnQ
 kLIpCHQjs2aMSS8urWREekV1ht0JdvF6+m6RP4pzcU3q0dpG1M9TM0IzVwIqEcLmLBEOQLk8hH/
 7l8A5AgTstzfvj1It78ran8ySPSXjZBAY+jYvSCSllhJaoqwEfcOsbZxQFHooYtI+klBErndHqu
 ZiibrR6KioOF8cSBFYbAFfaOmn1udqrwRgT5oszgA/pUqaL++S5oXfMwkL1HsONH3RU1tfENspU
 2ZJ9976/ac+OUF38VsBVccwAMO0S8v+VDQ7vyKppU9L06yZGi9Udj7E/Q97pjoxv4Wd4eXy29iB
 kT2xZxLtAMGEOwQk/CjzxuvGDFbfMMMgMmn+sqEiZbtFC6f55iPTvH7y6ua6fqahChT2tQS6Yqx
 hgCJNhyC7Uy+IK+mTi10ZHt81GNeGjhIMpd4SGVRtMPn5Muugyr94fhopwPmMRTiAVkayJMnYfM
 r+vYs/CiIM4AHhyZDlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080032

The schema describes exactly two clock inputs for every compatible it
covers, a board XO and a video AHB clock from GCC. That does not match
the video clock controller found on Glymur, Nord and SM8750.

Per the hardware documentation, the controller on these SoCs has three
clock inputs: the board XO, the always-on board XO that feeds its PLL
reference, and the 32 kHz chip sleep clock that sources its sleep clock
generator. It has no AHB clock input. The AHB clock the controller uses
for itself is generated inside the block from the XO input.

Because the schema stops at two items, the sleep clock input cannot be
described in device tree at all, and the second item is described as a
clock that is not routed into the controller.

Describe three inputs for the Glymur, Nord and SM8750 compatibles and
keep the existing two-input description for the remaining compatibles.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml   | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e985a450451d..9bd746afbc11 100644
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
+            - description: Board always-on XO source
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

