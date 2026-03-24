Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE74F4503B
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311060; cv=none; b=n85MnOSYvmANri65sOS/rZUXidQgooydcxT0XGtdVzhp74iHn4KbFgEWc9xNwiH2+LQr4IPciUD1V03ZttKK6UReNg8WlV5C6yOtBa1D2B6QxGcF7L6X+PsTgt068X/nepTu+/wYRkvR41bT7AjYPAEizKfONU/yIhDJlgxTHKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311060; c=relaxed/simple;
	bh=ve60Hat4fjDGd6a0MMY2a+1ZxOsOvrbkOAK4ZWhT+wM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVQoPEqzG0wZLuJQLteFjwOZ47ZfvGWQ0OqO2zfrMK2mwW3HbiS+vqITHK3tNwVuJl7MkRrwBFttwAbn39RvXCrO+q4I3CxFbVOpVhcGT/uASDtDdKJxgZT6znMqu7xdV11t6SajbBmIRbF7CEbpUgqlX6Nrm6qzzPXV92xMS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXIl4gjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwUbG/Tf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXIl4gjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwUbG/Tf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHrQYl2682372
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=; b=TXIl4gjMgU3py3l7
	mEwMztvdpvvfSzamSKkNm5FydLFJtIvB6faC/2WC8fZ5wQ3+ztU+onfogHfmEf6G
	cpenWMEG2DTKSOVm3wrfcsgrzBcgfvG203mRk+YLXTGTxO4U6BEFpxW6PZb6TsTU
	XcLvHq9ba5p1M2JcH3aK0RhlRoTjOVJxa7/851G37XRGfjFxmvVheUwSUu9fn1/t
	SVLqjePbN3FAYFRG4U9Ykso/QAZWAUJmEfqUrj/fUU+0EnXfGe0shvKux83mSZv9
	Tc87rSxUDAm+42kCSshgejRdag5hwoX85zQzLfPvt8o8xzCr6LKreHnzaM+LWr90
	+y8uKQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p7b6dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:10:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso10259801cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311057; x=1774915857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=;
        b=SwUbG/TfL/rskNEj05GlSNOkC9CghsNeNvLKW5XONq1W2fHGY6tPqdgXIM6TS3V4QP
         kergu8TeNNn44xQ5zoePaYs1bm/u/UZnTfvP3Xud7QPRfWrBfGaMPBYPOJFQulDQbS8W
         r61ocsHO8lEh8Mc/1FgWhdNloE+3dxHjBZN0bF4oPvsT81sVJVIn6tuobUcwxXofMV0O
         s60bLoP5XwRoplWkhkDjNkj8dnFwDlahCCu353P0BVQsOhxEhoSFqf/V9oMt9lrVb88v
         iV9W3Zc7OZhIA85vyad02gFi1J6QlYiNCT30IkKU/2OAkAk8jjYRiFF30vwTGjNwrj9u
         P6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311057; x=1774915857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=;
        b=BB1ATmDfKKFk+qUXs/c5W4B6xeji5PTrf1qkXsIk5pBrUv/g+Ai6Ui9omJCNK+IyX8
         vdAfTfDoLp4XAu/aM/QqHC1XxXpB9m4RaFcrCSz7Juz6jHHhMZcmSZ/rsSLS+WPiOjb/
         3hjtQ0TA7Q4C+mkr9kRya4IB9JfAAgD/vYJl8v810Kh7VmPpnAqNb519zopICC2uImkY
         lc2r/Cc57F8KLgjIQPmNpBC728cmkFoqwpprG94R9PLjSC4qxgwDxmmtIXRSWN2GP/1B
         kkSBnO2uVEjczX271YppHDY/azWOIJxE583CG3aUH0yfQQL+cZfwaLmK2mV/my8kaGZD
         93WA==
X-Forwarded-Encrypted: i=1; AJvYcCWiCvF2ZEedmbXYbmeNxPnbcxkzgz/aSPuIuvHh7PivHi3HUR0sWssrx5EsbP98A/VleuoXvLFkXt7X@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+EEXdnduMIRBvEjOfoWjxEkd7e+MuCOcR5ukOgFkt1rJMA1Vv
	JBqpkFQJY7N4KaVOzCb22qnhKOnQDviQciw+qXDBd0HuklCoy+NEYZj1FURn7Ino8nioibM05iN
	rtazKbc30kdt6BkLObPh4ffT0OzkE5e/SauwZwa1QS3JG4UtwTUkUSK/+QomkI7OA
X-Gm-Gg: ATEYQzwfEqbh8gIbyUzrdpcyg+8UDyBj8tYXe5vFg97cpnI9zoZyP6GGq9PxLX57l/V
	3EAqN6w11M3WHf1rZiZueiFq1XEwFDjSEYT2plingyR5vPbzDfsdIJo34K0QHlgrN1MD/NcSh2i
	R1A6ErcuZ7PlzYzT1suOGGGarAyDgYq3AxJ2g4l168UrFg2fR5/jFaJgs23RqCcpf5E9k+uv563
	EGhpjeQXHnu5/d+ryHQWFvjVeYzl2fwY9k09Twl0aYRhOEG5Ff9yqyFvhRmZL4uuiV/c7wDbWjq
	QFzRp8atYJqvSXuL7KdgR8dbbUCeTY2Oxz2bOkhspGGORblDFyAeWD422s4edJklAgxx7V4A315
	VrewjMn++5I/aB0G33ENOpSIfqpRfqwQ8pN7YRYGR+APjtAsm/3rKKhvY7H0gTnlRL3Ew+EcbVx
	OW1QI81gs0ts8Bmrhw5rUUitUcS58mBYUOPSw=
X-Received: by 2002:ac8:580a:0:b0:50b:3ff3:f489 with SMTP id d75a77b69052e-50b3ff3f5ddmr204223821cf.34.1774311057242;
        Mon, 23 Mar 2026 17:10:57 -0700 (PDT)
X-Received: by 2002:ac8:580a:0:b0:50b:3ff3:f489 with SMTP id d75a77b69052e-50b3ff3f5ddmr204223451cf.34.1774311056745;
        Mon, 23 Mar 2026 17:10:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:10:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 02:10:37 +0200
Subject: [PATCH v2 1/9] dt-bindings: interconnect: qcom,msm8974: drop bus
 clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-msm8974-icc-v2-1-527280043ad8@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ve60Hat4fjDGd6a0MMY2a+1ZxOsOvrbkOAK4ZWhT+wM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwdaGRap0iSPvKR6JSr/xjyzH+jJGmbWjfWsVS
 dwH+EadxRmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHWhgAKCRCLPIo+Aiko
 1QaNB/4/5/jNDRGwUjDlVM8PaEGhw9u3STuu1Pq+JLvRYT/EPsUyKnqKARk4oBruWFwvlpDWVFf
 82cqfnQEtgdGgVKCcA1fd7UWkIy6Ts3+u7YXN7iR1v60kD5wqMVMWiu+vAmA+6i2qYs4WRJ8LGn
 pWUhM9GfyBehiB8zibsSh163wb1I/j7xV8IzdDVm+qHW/4oFxYSCJNxO0wlSkNFoV+AIQnt+Ex1
 rIm9r+EbgtnAk8pIcmQlbGlv+ar0sc8M6/q4yOY75dG0NJrnrErGMSu3gOfIhUycYfPnSth8Ukp
 r0wZi3T5LYi7/7U5gRD5TiF604+lRiFiJEE0kBO1sSr7eapD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1d691 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xO2zaiYFPJaqVjnw6b0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FY5rNSuV4kWFcl1fICleWpgvFKtb8MbD
X-Proofpoint-GUID: FY5rNSuV4kWFcl1fICleWpgvFKtb8MbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfXxVQzTobrO8s5
 C6pnhwjRLlnRFRCMt4dxXQLKsSH4WCcufY79InbJILddHkh+yUvbV3oHwi0WSMNxCYF4ly8HeAn
 JoWjcOce+iV+ynaBTetiF2a3sO3UIozlfuvmUqXY2TBLyDQjesq4k0U1Ag8dWmkqrWsVBTkiE6b
 WHPTRUgr7Y3HrFvi8MqgOp9/mCCI7/iztyWKCzCFWPutu/jnvRae92MIH8pts4VYatwipEQ6kLw
 WlRij982MGsl4Abjt1ZPM8mqPwMoTz4r9Dhqt2ekFv6+tk8WTHaX7nqU+uyf1vsZEmW176NwbM5
 X6euXQtIky0X7AdpdRbA567wN82bB4IUSZ7w+GGkQEA+qXLlJk7XwRU3HT0RI3ipW1HjS0czGp/
 CXMdl/HnQqfG3HVIpgDDz5hWsBROVVD0rqYvpaTG0ydw1X20itJ+GrBwef0fTKxsiC5AQZV4vWK
 qN8SQdYLGDLnSR/3Mhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240000

Remove the wrong internal RPM bus clock representation that we've been
carrying for years. They are an internal part of the interconnect
fabric. They are not exported by any device and are not supposed to be
used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,msm8974.yaml         | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
index 95ce25ce1f7d..89a694501d8c 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
@@ -32,22 +32,32 @@ properties:
   clock-names:
     items:
       - const: bus
-      - const: bus_a
 
   clocks:
     items:
       - description: Bus Clock
-      - description: Bus A Clock
 
 required:
   - compatible
   - reg
   - '#interconnect-cells'
-  - clock-names
-  - clocks
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8974-mmssnoc
+    then:
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks: false
+        clock-names: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmcc.h>
@@ -56,7 +66,4 @@ examples:
         reg = <0xfc380000 0x6a000>;
         compatible = "qcom,msm8974-bimc";
         #interconnect-cells = <1>;
-        clock-names = "bus", "bus_a";
-        clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-                 <&rpmcc RPM_SMD_BIMC_A_CLK>;
     };

-- 
2.47.3

