Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506ED361651
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 01:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870865; cv=none; b=WkZ2oA4u/0IPiiCtNfBvZXJWJAYsz8+P7M1L8SQ7IYl/KMdYT+OrvNhlk7Kh5fvdoNY9sR1tfJnil4JJTqan9KGnsnMhtP37CuVwlk7CvrNdZTzhJRzoaAfuaxid1yuTYIxjykxfgTwILwCFgVJu4u3EaAaPs7gyfZu/DsYWKnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870865; c=relaxed/simple;
	bh=uafCeCPRUDIbJ3JsxlFN0G6VRVGMk4SKQJs8XKTSXuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuLSB4k3tKaygX09vu7tsJ2LwXKAGxv4Cmxil27KpM4C7jwaGVyHjdMS1ZN33L3lh5pX17JeEzZjqt1TGV6A+G8V4LnCny6s8TULvZfDaBoNLnn2soriNC17ZqnJlfhkiTP5n8UNEKjEduMHtQyokPW4SgTHd+V57XQO5Swcp/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxQnoBnY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zwe6XWPz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxQnoBnY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zwe6XWPz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNMZG83414309
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 01:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=; b=IxQnoBnYLCE0xjJ/
	RkBsQiaBvM3+mcEbx7F+Tb4QsRG3As3v4rkSSbRPYOiyBf+0wzyOZGG3BWK1Qbwj
	0rA+aL1mmQS882X+LEueytoEVA9vSuep7o4FwaahqgMrBURaD0G6i4YxXsFx/pkc
	PkGs681eWtn3N4v2uP9jiXu0Or45gbkxbKOy2QNdj6htApD0UJsZexW+NjnYjREq
	vnyiwnZfsXScTV/vohSABBTLguj41SezfXy9z2gmxu/kpYj21tg7B/ZjkD7NBOd7
	N5g6AAfd/D+hS0ZlVgw/vZux3o828Fs5yUX/YzsS38c88/dAo2/EbBwbcoDudv8m
	7CsbcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfya0nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:54:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9f0073e20so1982655ad.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 18:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870861; x=1783475661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=Zwe6XWPz9rMW11DMfRMoQUTeg0BcBFWpaqzgLMH5JQeax0DhYOm2vaCEKs+hIjeNxT
         CDj5jjRZb2xnATNqsYDVRoIOiT66QR2G0YWGhtz+rVT5QkP8xgYU/cinvx6pys2U9PpM
         qXqFEg0AcPO93VAY6rP0MQBru86SY2n2dtvfyyum9nVxVNvg25RGGKDksfgNOB9SN4m9
         aQ8vmtXivRIXDJIjOJRg7BzK3GG8mDjNFB41+HNeraxSW4rT5Z0YBKy2A9J6P5OtLkGm
         pIi/UrS4aDj0kQIlGXxChCSGdlShFO2yJg54rtUaGYRx7YB62Mu19CbqpkGv4+wN50t9
         fJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870861; x=1783475661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=fFu/uTWJNSyDkyqSHeYjqmaorXO4RanFRzQMo1s3Bu/hNWGykxsagLLv9QdFf/t//h
         jAO+A+sBBYxWQKeZjHF+gDSg/M1JlBJGZXaEE7n8em8vZRlguM4D6s4I3MiVsKUnH8zP
         yqVUNY6Yzhf/f3K8V/Wn1mbnQaGvPOViU4tOGs04DhBE9yB/FK5GubPw5bJ24NcWOyQr
         fJw0k0SACIov6iSofR2ecboFohY4ZVJe7+kZBF61tKyq9lFKBUZAz0U4Q06DC8pxVW38
         kLV7jPirmkRoCk+kcMZ/55xMxxTIqmwix+RdeyFpFmcNk9C2cVIQpDEiJPPn4yI6iOcH
         hteQ==
X-Forwarded-Encrypted: i=1; AHgh+RqO+5hQt5rcIvLKe7VBDX0/qNZNQW4M6f56WONzF3del2DOq1bwuKjvfWU3F4yUvrlifIf1BbWPbmIy@vger.kernel.org
X-Gm-Message-State: AOJu0YxyP+nOOe+mJpdejmRvtdbwtE0iglqWpWcVpaKqSIlsNS5b4O+r
	Ck4nLcYd2peQRzCPKd1Z/K+Zwngn4XOXEFftQDjO0hGlS5ZE+S36XYaj8/W5OTq3FjL/eBhgMvy
	Lr/zIHB9f4O0tRDKf9k7JldqV2O43de+yUzWJ3rx+/1Eni2h+NwNvjj3jYeCdhzJU
X-Gm-Gg: AfdE7clCOo+7Q/OTwse0HaULDQYM/eryQwI1bpNY22+LG1ICVBthzSJOyfYFAG8jeHe
	iH4R1iSCD5oz7J9bUTR/naE7fXCRdIZOneyoD3+ThJEh24sBLqNZiSUnrKFddEDSs7qmh7pV3Rg
	hxwe1azum8KQN++rfPLurBAF8X1KrRZRR7cX5brSRKoZOik3cf3VgzSPA8RzDN73yxGdhCRtsLV
	s/82EkzOB+9DQtfFhfJwpIp7WunUzmJ7rr104XbToTVqZj2FswuSYg9YZF8z622cSkBTk+pQkOM
	okpB3hpkvIFVHv6gQNPfhiaOXO/VETommRDhpFt3xCTfxeEkb+xbCClNuOH7MVzWKsRx4mZNJHU
	71k5Ng85tV6B9XNO/8HbmCQkOE63YqblabKLTLNwAy9Z5JzVfF3ptQUEk27lA7yjjySuAxQgzOA
	==
X-Received: by 2002:a17:903:4405:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2ca2ed3225emr47983585ad.28.1782870861304;
        Tue, 30 Jun 2026 18:54:21 -0700 (PDT)
X-Received: by 2002:a17:903:4405:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2ca2ed3225emr47983195ad.28.1782870860759;
        Tue, 30 Jun 2026 18:54:20 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:41 +0800
Subject: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=2337;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uafCeCPRUDIbJ3JsxlFN0G6VRVGMk4SKQJs8XKTSXuM=;
 b=+n0qnK+pFSH04EldYDI+hf+Zxgas6gCR+hrbok3yDDi5msmYlbV1vYiQa2ihdiT3LHOdGn579
 KLEO6OdJqi7BV3Vi5aDpmizSZHWGrdXVuX9w2gJHpTjKc3GXEstDlp9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a44734e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SQ-coMCA98RGVnoR9hcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: CaIfv3-OoAHNkGoP1ZlmaCgA2QukXuqi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX90R6FjMuJfx8
 kILXKfL8fEI0Mon4ctFT26QKpP+TGnNZRMf1BcaztOZ6HFDqutY0rJw9C5i8UMD2e7n3CSqtEO/
 Q+9bUGH0hfVNP1M3nAE57Atu9v7ANTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX+mJA5dlvbYFM
 PY47AyU8MT/rrNP0VzTNc68b7RSutO6mN0IPJxXEK7S6O8i32VrVhxCH2SBb2RZmeQtTC2p6Uzd
 ZzXuHfYDic7FWwBp4Sjx94HZlvnqCbi2FP3LmSQJCDU3WeooRNqiA+r+MVJnR0W+XSBvrkIHC1Y
 wrohYRIEoPgNSTqJDOu4Xi2L5leUxBKRnBr0ULmWapysIap0v0yflY1h7jAh5sx9KFjrWmF7Qpl
 sq+fp0sLopc5ct0DAktBLjzeyD//nOsqjjRZ34bLmHwYTSbKIHXlAg2/r+xpgwLVWLzgPRavTuh
 x9UrZNr0lOMwCw1kURUt7k+Wwupj/ug8p+QZ9hF4nbRDQgjTP18KbdwiZ8RAncyEy9+iIIrKTdf
 D5TOb335+WrDP4jrupupBU40Ygy7ZYNxdUcApygYWVZ1jAEMDbC0QkHIE0bBCgyVrZ+Wh/Y9xAE
 6vCzU0ygcCI+M02cT4Q==
X-Proofpoint-GUID: CaIfv3-OoAHNkGoP1ZlmaCgA2QukXuqi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018

The TNOC compatible previously only allowed the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
AMBA bus.

Convert the compatible to a oneOf and add a standalone
"qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
standalone string carries no "arm,primecell" entry, so the device is
created on the platform bus instead of the AMBA bus.

Add "qcom,coresight-agtnoc" to the select block so the schema matches
nodes that use only the standalone compatible, and add an example node
demonstrating the standalone form.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-tnoc.yaml          | 39 ++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..7e6e4b17a6c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -29,6 +29,7 @@ select:
       contains:
         enum:
           - qcom,coresight-tnoc
+          - qcom,coresight-agtnoc
   required:
     - compatible
 
@@ -37,9 +38,11 @@ properties:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: qcom,coresight-tnoc
+          - const: arm,primecell
+      - const: qcom,coresight-agtnoc
 
   reg:
     maxItems: 1
@@ -110,4 +113,34 @@ examples:
         };
       };
     };
+
+  - |
+    tn@10980000  {
+      compatible = "qcom,coresight-agtnoc";
+      reg = <0x10980000 0x4200>;
+
+      clocks = <&aoss_qmp>;
+      clock-names = "apb_pclk";
+
+      in-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          tn_ag_in_tpdm_mss: endpoint {
+            remote-endpoint = <&tpdm_mss_out_tn_ag>;
+          };
+        };
+      };
+
+      out-ports {
+        port {
+          tn_ag_out_funnel_in2: endpoint {
+            remote-endpoint = <&funnel_in2_in_tn_ag>;
+          };
+        };
+      };
+    };
 ...

-- 
2.34.1

