Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50200463B68
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456598; cv=none; b=czJiRSs+Hty8/wPjE/qQdqPLNdLcF4jxAHHeCPAd75Eh2rjra/28QOSBGXRR4W9Q4nx8rO+iAghaF+RF4+3ozX8umBQl3lYerMVCIMBUFvKeChmTjivbyGwujWocBycMwVOzrv/JO0VG2/oiuma8Oeqycueez8qNj1/XqSHzmkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456598; c=relaxed/simple;
	bh=NF3ddzUfo/3eIQKDC/wsRnOuXvG5lgOW1mkc/KT7w9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOjdkDVFZyOaFPMO2F9TLQ90B6sfgxlWoAYoUoTRGsc3gzM94U0snCzLb3J/GZxMhQra8whkS9DiKxkGys45cyiL6oM5gM6d3BHseiwE/NR2BHTzRRq9JD16isWicNYKV+aYxLkrQnGZrh69qFkqDx4Cisn08p4+RbMxA9zLOb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfUftpWX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/lMlBvQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfUftpWX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/lMlBvQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zf623126448
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qgmlv3XWxHqYEcDtaQStAaCiJTua/7d1HfjcjuBqWI=; b=VfUftpWXJpGHZevx
	5UfeudRRRp4y2BVM5eZc9U3nHz0ehqU78Sh1jKTgPHEW5q+rJYa/fQdS6WoQMULf
	228jVwdemQSI0HtwEmMO0WuFqWoW6lKplxl9ezpgy+GBmQnYiJuPSQSbTVGGmMW8
	0GcCCjp7yKqEHSSMNiYNKn4x4gD23uNYzUiuF8KcDLQWyfgIzpswozAnLjAMV/x6
	42hwBQ4W4vYFcM+UtAPrDWc1YvfV0vtYz7CIvXIg3fRAeezfDyU53t9hPUN95JUv
	0+/A29x44bgmraiQLwp9PTWvelYo7Rd9cEIRXZ5+R8HkkCeYxXxDVqrcAvNhe53D
	FBPN+w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9u1te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:16:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so7178495a91.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 00:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456594; x=1790061394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qgmlv3XWxHqYEcDtaQStAaCiJTua/7d1HfjcjuBqWI=;
        b=g/lMlBvQxislesSKnATRFOLvLlRTy/TD55bJvkJQ8LCRkir9zIjNs4GiHf/PTwcYLV
         xzPaodhOYPWaYKkMXPDLLGvhUxgGPOZ1rDiH8Ar8se786W1eT019NS2MpGoEsJdyq+/n
         Eni8ysRPik/+EX29JeNZP1FEra4ol5+kh9AI9mIiimINMHpsCHRIqt2d5+pKuuLKcJRe
         4pX1WSRFbjPCpCEnLlUg7YnluYQn6LUmW+Aa1aUes2rk2ueOY1/CveWagCRFslhMnEXa
         CIDftTg+P9bC98GGeXfpKhy5OCvun8yCsatOcO7UnlBfBimLzLjNa92Vmps/sBRlqOE0
         D23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456594; x=1790061394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qgmlv3XWxHqYEcDtaQStAaCiJTua/7d1HfjcjuBqWI=;
        b=0BCZk8A5Bnepa7ZbIw7am2mh0vxMNlBfWJ7eFTLpBni4XFDzIyJ94dlR5PUIkyqRks
         dyOgQDjlyCzcLna6No3VAokPQjUQYXOqVO/v7vaKDzGZjsCrHyxqjMqjjcumbbBl7cob
         H0Opk5YH8ukgu71OdYcSTgtdX1UXhvy0IJbhMPPNntqj+dNVUOPEjs4vpjDml8et6wPi
         d69p4zLhyuht/Efrl9wc6ygn1G5vMsDp/jPgy9bW3mBtKyKaBg/v5O7Yb/A9n4uzwJ4Z
         2dG12QQH2wUOsZmzXfIs5PQS8NgAdu+3zD7U5hKebSbU4tKi/genyl+zZHv8dJMk/zBx
         CXYw==
X-Forwarded-Encrypted: i=1; AKwUvBwKy/oqv8vC3HYwl/2F9DFGzCxAWxaa067HM0Y6RUYD9bAkmzyQjrcnh8H80Z4pAc17Yt4Un+KvWiy+@vger.kernel.org
X-Gm-Message-State: AFuF++lK6xy6p2E+p3WVnYZUiRNbWSIEIpx6p0zpHoznRCG08icHp9cu
	yM6ghe1NuG+KQkIABWTUXMslAok5KpGmWYmpRYeF2+oxRvEnzBG4Ya6uJlkEwgwwgAtQsUXx6yo
	TcJDCZef7ji7NHEhhZwl3KwDMQDUPJ+wIDPW4v4A704Zfbh8dz+nfdFjQ+qWSEnX5
X-Gm-Gg: AYBFou249St/u9jl0uLopy75hk0lKihBgtrvMajrrvcFaY0vN2x3iWrgOMNbnxq39TH
	mD2ePLjwzjMcVGy//yW81xStbmO3l8HFMSNPNWpCCa6MHCPeYqCFetrGc+NQI4Zt8addDlVCC3f
	dxPjxwhAXghM+lACmfcRG490kV0+S6DEARZrfzZdwbckwSwbA3utoJjL1XGw9+yG3IpRzEm4DaS
	FGiXjNKv4Xo0V6Ax6M6OYlYZ1A0f67kQzVxWHnNUaZrZXCnVI7te7m30GSmWIjZLQcP6EBfrLKi
	2D6jiZSsDa8cayDq2AbbzxWfXszf/7+ey33w6k6/e1JC2qPmEk8RZNJuDDwj
X-Received: by 2002:a17:90b:2d85:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39df2470c15mr9172995a91.6.1789456594012;
        Tue, 15 Sep 2026 00:16:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2d85:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39df2470c15mr9172925a91.6.1789456593323;
        Tue, 15 Sep 2026 00:16:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:33 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:28 -0400
Subject: [PATCH v7 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-2-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=NF3ddzUfo/3eIQKDC/wsRnOuXvG5lgOW1mkc/KT7w9Y=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVHzZ/n6Trr5fvI564+4nNYeGWkuYyO99AjSSOC9LtS
 fy32g51lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQEtzL8M71hEnLuQoO9upod
 l829vIBZyU1mC7U8ls91zHLd5GCjw8iwuozTenZW2cvGB/xhk4Ky6zR41rBdPMvi9/bcxhMVC0/
 xAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8f0d2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=JwNH_LCS6ezfG0-7a8gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXyY7YYWUCtWby
 tlaFZTULXKjffuH5mpeZNaFXNjf3BfgRoQkY62WFtbZR46gZoYaiGcfWYq4f++CCLYzvxSYswXp
 WhCpxrJv+uBO4q5Y4z3x20CNWNg6AjWaM0qZGodn1EHPsFV5CWjrofXUirFm3sUz57yj5br41Mx
 lcC2/oHsqgKe2gSGgUpmLM6OXEPILJ+4Mv/Ok3JYH+tw2gsIqhD1Jr/Tco0A+d4M/tqCp0Xuej4
 k8iEe/hQC+NuNeUUUon1jKeqmd+McaOgYLnbqvJWRX4aevfN4Vb1/KFbGhuUXPfjrOLRICl+57H
 8FMms8JXLbHbnYtnIVukMCo4Q3AVama/FlMVtCxrF8qlsD3lkkyjXG/Cn8rIWUYIWrR9x/tafhu
 HEgjMXrjPqgYgwfGUrPJ/vtOKWK0b/Gi0kCf1IfkhxFWWlO6s2vv1c8aZtcIrDOckyhlzrWrmRv
 duq9Y3JPWl0jOCqN47A==
X-Proofpoint-GUID: QFVmGo8P-Pd-lPNgPvUeKja0LGNRnw8Y
X-Proofpoint-ORIG-GUID: QFVmGo8P-Pd-lPNgPvUeKja0LGNRnw8Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXxcw1/Eeg2Dz+
 eceu8260SJLa/BsJCkcmFlqkUydANEzu12HNIcgmUvPTt4Ak7eFIVhOz0uO++QdfY0fqzwzCzy3
 7uboJyYL/yPyCDSwd0QlgCDpRP+2aXs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Match only nodes that use riscv,isa-extensions, so nodes carrying just
the deprecated riscv,isa string are not affected.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: Collected Acked-by from Conor Dooley.
v6: Only match nodes that have riscv,isa-extensions, fixing
    dt_binding_check errors on legacy riscv,isa-only nodes (fix
    suggested by Conor, breakage reported by Rob's bot).
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 577d7ae5576b..d4cde2a7b8b2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1211,6 +1211,38 @@   - if:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0

