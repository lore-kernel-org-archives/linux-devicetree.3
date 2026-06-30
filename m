Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8364F3F1ADD
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815821; cv=none; b=pYQx8VJjG/4uJ9/T3GC7S5p3ARR7eNdssMriwOnPbvT9hXwJU/+7zlZfzD8okP10k5DZc4Zb17kCG1ITPVn7euTZJNaOlr1BQN+7qx8lrp+ZAD1WepER7OeovGGcPjBPTN9qrO+jsH5oNGXGsstXYvTFZyuhLdpxsblW9QcwCK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815821; c=relaxed/simple;
	bh=uafCeCPRUDIbJ3JsxlFN0G6VRVGMk4SKQJs8XKTSXuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntI5Sw9K/VrKDTS4mG5HYNxCNNgrunJeTwxaNor9io+i21T9kS8XIEE3GaCaZY/ubBa96W8a2na31Z6/M6USQp7Mur/XISINKun8Uo4B4de42Lzo24bLQupXGLHIsB1xHbofm7rn27r03XxmUMYec7REuStziR2bLpXAz7AzvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7C9rrU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkdxzens; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7C9rrU4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkdxzens"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mmTn1541250
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=; b=F7C9rrU4ADibeHIz
	LckDKVebRoZ/eetdxIPh3GNAbmwnBinVxhSnzms6a9OMatwHo7RvVvVIq1nCRbU6
	un9Mu9FV8CeUcsf9IMHbsayGfbast+pFQ8QNi1tmle/RCgc/vg9GLgGuQypsAaIC
	+jLd2HAr9wR7nmglLaj5qKunaV1dnFKnpyLydxE2Pxns1JRrhj3NV7nzaZxfnJOr
	NPd+FwWBp56uz0Aawi21xSqrBXtFos79Y7vZqpSv8E7Jw6KhqezkrGOE7+T10tPt
	xz6XcnAMFaBF2GUkYVZl99WGZGW/X2NfMjJVdSIXCifUEbV6jxZx58xiJzHnD0x0
	ZutLEw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp1xne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:36:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso2148060a12.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815818; x=1783420618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=bkdxzensUWRKeJS+yn6O4ZhSQy32ch6FZaJ3aOSXniK4vj301XK60BlFwXIsN8WOjQ
         /M9WhxqJ4F/6z/N57NyY92PqvXeDxcwB9eAiLWcuSEOfF3q6T3Agxy0sKMvMxIuaS8GU
         M+VWLsFZQZ7Tb9vZWySlK8VjzchJlB3E7ZxpiWAkH5mo/IZPTdScwnyNMtcs17wEpVNM
         33vdQsFmOALprvQzBh8/HOOZ5MCKGJOepkM3SYTw8pLUioesQVzXlqd0mNy4V59lhfGZ
         W28ZyoIdWxmwRjtHGA2bs1cFrWqn+xnyW4Q/fy5rGOmnEeEiS2Sjm0zbKkPMCPEwkUoz
         YSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815818; x=1783420618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=GJdJGciDXqPCV1Vt5HIGfKBJK1MWtV3wTftu4d5iJpbqX4R03VkIzGY0erkq2IhgB2
         46sm0vvYTT64PVMiyQP9lXFzhzgeisgnjVdkvX+h3YC2/koXmZ1Tf2jR3SAxeJn2Aj1l
         Ocy8jgRAubtzPrH/VKdvhjM+0J7/lLF8fQBY/XJUgk4iD6Exr2nh3ZJZemtKSZEcSD1T
         t/K61ssmIcchArKCe1zG0CNHfCF3l/ct75yjj0PFQ/UFXJ+Wxgu8aS682RxL+HiLdtWS
         7MZHUcTGrFqvdEquNPpFHh+HepJqtoHPAiNVBqs4US1W1Q0NIp5mTJrlSJAZDuSYYFgh
         AAjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIzMmcpKZ78iZvp8yeJMjtL1wngDigp1oDXQxzS8xgysPvhZmzAa+u6KzLKkBLSBYOxQFk9ZUAAtMb@vger.kernel.org
X-Gm-Message-State: AOJu0YwuxcefCV33Ub2c67bSI0oRfmPVIeTNVYieeSRLj3tVP695RZdf
	xzH5aU2VigZGfAmybLCeEtueDilBNzCjiQ8rQvAFY3Px7+PrVoX1knueV6Oysf59QOKRIUzApM/
	8M1HAj6kM5HlocFf4xGDorU9VIGkjOSl2VRlFr8noP0/TBHddMEO6morXkjEBgH32
X-Gm-Gg: AfdE7cmyR+j69nxLZ+bRqJmyP2f4adm1TjSyzr+QNS08fhLDHz6zCg1+p18CPgTAQSj
	yd9HJyrXjtyKdEcQ/NkFnHjsB7MbNL+WzkBax6pbyFegyBxiSEepe7SM/l216XD+VjxAAAQRUd6
	9N680Yc3qbD4ECuDyggbhfOG98zhBF9AlOjwuqiqLR11atXbgNXlsx+0Ie54IJBDRrd69LDftEY
	q92clC+CD4N7CFNLApD+YuCu2Pw8xMnhA3ubIXuPYd03PJP+bWLEm6vJLNQ2DeluUW9nFBLmFOD
	Ui06FpJhDpVeVSIf4lt3PBfPcn0uDZUxjdwFH8H6NaNe1VdvG4Je3xZpq9mlbwuhVEqD3TbTdBh
	v5sSn4Bz1+4HAMrUpx1IBJxm6uDb/5EJQxZ9qvi3TWoa9aKP6Csx+w8mACRLT1p4UjbX9WFVp+Q
	==
X-Received: by 2002:a05:6a00:4b56:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-8479f277e17mr2455261b3a.48.1782815818058;
        Tue, 30 Jun 2026 03:36:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b56:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-8479f277e17mr2455228b3a.48.1782815817616;
        Tue, 30 Jun 2026 03:36:57 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:36:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:03 +0800
Subject: [PATCH v3 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-1-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=2337;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uafCeCPRUDIbJ3JsxlFN0G6VRVGMk4SKQJs8XKTSXuM=;
 b=JIwVOvTjthVWmGNBgjc4DfL0E8A502LDkwLjqcBDlBCXBDdgPBYJ7z3UrL4Kh6ZKCrs4WxJ4U
 wqcw/PQKjyiAMCodp+1nCm6qMmcEtKJo4U+B9xGEvhcs1E2388xMy6D
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: rc25Q1hq6C7i0LqoZR3i_mmroxL-tw8d
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a439c4a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SQ-coMCA98RGVnoR9hcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: rc25Q1hq6C7i0LqoZR3i_mmroxL-tw8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX5MHTfLC66MRX
 OF/qvO0ZFaRNPU9yS00buWkPU0uiCxcUWvNrZeX5kWroiIBwM73jqyl6Wdwe8pLWRbFTAijPUEY
 vvGpfusprAUmHUHXQVDnKolyVn2XH0V1qKeygoP9EADSlpdz/HUKQXlqR8vPrhDecQwaa1bY4D+
 /70MUdtj3bF5Dtq5B8ENH9U3tAXmGECM7wvS/vB7lB5o3BKfkzPocF6Tty3TqbBAGbJUsFtjt3d
 h9vKbcXKbdqo7+ZSV3vBKCSeGmAl67nxf2B0uh1TEpKjnMfD8CHXT9OagRyDAV4NPInSrWhjpL5
 zJylI7dZoEBOPLSpGD/ay9+UexUhtV4WO0ySefO+OIvENwHxMv3A5lH+eZljfqMjKDowQUbyTGd
 KugGDlzPdnyfdxjN+IXIfGDZv9LWQROpbj1AqFWvDCh8KvrXG7tHyBnQCsQgtgUEJbk39yOOJbq
 Z+kamspqApf9Tn7NAlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX5smTL/F6R2PQ
 3jBt8fgwCHvpW5NBAYx75LiZ6/syh1rJXNP+qLd0bc79CGRvZY2kpSa2ZAxmuCkwOwwMet+DPUl
 uFUtHUS7ERCfMkKS4ydXx/3ZVY79+o4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095

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

