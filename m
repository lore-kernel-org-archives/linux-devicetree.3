Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F10A3C09EA
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 05:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489131; cv=none; b=ejDMHFMwrs/i5hge0EefC8eIgm0EHlbcPGCnmLdrw2PuCGe5besR1jTjFGnCpgp0PGzPLg/l6ZMvHc8q/+sVV1Aw2yO6AvS6vsZsT5B3s1f5kPc1Wd3a9SE6GJArPHfycYe1grD9akih5ykVsSYELkVyJiSkrsEzwqE+PJHy/oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489131; c=relaxed/simple;
	bh=EqDXuZR+VwoiCHQ8MrohT0WWo31+t7/SKpMrOr+qFys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTK9Lpn6s44pl2pgozdbCHXj+U0EhOoIONqlpk2E6juxY2KxGFzz201TpVCxDHl97/95o381Bky6fgCjLl+Hx3wEYmgyPlmtQs90wqR4+BDPZf2ZWt7Wz85xZR0GwqEpfp3YSo8LhoaZu3SyY+SXijkp+RvzZgsdrIy5w7T/FTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EL1hUm14; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5MmxZwU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EL1hUm14";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5MmxZwU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842iZg1625089
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 05:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X3PuP0EE4zFbYmFK+cTACEjEy2NM6zeM7tRQiHecKY=; b=EL1hUm14z7DQ/aie
	toNLc4wir5Xb7/R5+/n78Td6Qp5uABES0LJgz4U+ZxNgO8BvtYeOqdrL5eOOVSFE
	m5PoMxOtc0Eaa2+A75pDlYyY6cjeVwVkKOX5uod5btMfqbbbcweOq4IaKvVAPzp2
	MRIiAN2E0zt9hOIDizdPd7FV568FNMWtqI8aL3Frj/zkRyFC6Bw0lg77CueNscoE
	u9DYL0J732btCGqOW6qoCVurAKfExy9bYfY2Q9v//RR7PJszsZSKyEK64fzA/ACN
	xniDwxlXOLHuncXkbf+VtRHuPf93pMMKWEbkIBli1yE/kw8mhtGqMmEkqSnV7Im+
	Xo2Lng==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd2u6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:38:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8482df30da4so517964b3a.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489128; x=1784093928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/X3PuP0EE4zFbYmFK+cTACEjEy2NM6zeM7tRQiHecKY=;
        b=j5MmxZwUNX2TBvmFVyaR3BDBeQiIIJ17YHyU/ZGxA2kyfhP8HNusNI+voELzmbEETj
         CRY87X9V+Nx1YdjIMr7XaA67kbqrb9Yr2YYSCOpY8vJ8cz2caY5UfKJkthFqzEzyDIb/
         viWIBX1qKsu4Ix1fqKoC+ttHIOX0M8r6BTIOniFjAvekOg1QoXTMDJXpx/gf4cpGhPz/
         yToC+qGr0DWj6HREDtle3tSG9VFfP85QHAuTmCdIiGyKIOoURr77/LHSgKm1EgHAm2TD
         775voGhAMeEtgZSBd9tuYhh2WsPiY51J7k6hzEQM+xD9r83WyK0BdbuJF3yudBztdLdK
         dxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489128; x=1784093928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X3PuP0EE4zFbYmFK+cTACEjEy2NM6zeM7tRQiHecKY=;
        b=OGB9OB+XUHpIsggWfCR5kt1fD/9Pz783/8KQJUXVcZZVfSZNMyFdeXIrCeaSD/GxMg
         l6w3l/fRRCgJBlqY5toCe67r97K5o92YZ7nNg5x0cv2mwNquZ35cboBBQ7lSYak2Z+nA
         7zc0eEzgBdLUZ6O6g0LYnb97zYH0OB51j4P5gak/EwYh1PNfEX5TC90ddgn+Z5ybGbBR
         QVNgFiIY8zwlXnR9ppiR7w406C7T/cILNfpnIr/+IIu41BpFe255UZrYUUVAGbfW1lUu
         7SCevvBOTWfIDjU64dBz9cWsDkT06IYe1dcubLJls6m9QledfSPcG7+McfGAZXjJ3fF0
         YsQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzC0E8SlHh5VdMax/jr8ea8XJxwrlRtWGmigaXYObRv08Cm2VMF/qyfTn4HkH9kbacswAxCv2sKvBx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh6xUNwZ7IvkErQ83BsazU+lgAtnyXGQOkDadTKC99jn0CAU3P
	ALMuUIIfwn39lV4xbnAGBUGd3ztoQVyE+HBeu/JWdv7Y4BICr69G421maAkx2uIKnzO/s68sQvI
	N77e8OtITWJ4Bcl6Ub7EBFx6Cwg3vYJ/5AX1AZpxxk8Z0o98eeKfB3yYlBVTLXMly
X-Gm-Gg: AfdE7ckpje+0Bye722dpgi1wNWp5RcinTm+tJyFpPhAM0C5xVzsXTqXbfOKhbKaoUCi
	JPf9vEOshfe68JilSYXgHa0Cghgy1MQYcnCcY4wc5c3skrBkT0TUF/7XruvXl6rA5qeh7REiofi
	CiTdHo4tRrL/cxnn7j31vvU4AP4iNqRHZI+B+JYy1jUMxcQWz/7fB6sC8q2+ka9mEB63NYw8NiA
	YU3cZJB4/tlQCKK6+oWurViegrBefwi7tKvvd3U5w6ACAtKvqfV+kIS1zA68ZkP+VB73DUvBX1S
	+iRae2OQXYJREP9bBwXGE7UIuRoX4YhaPCWs5yxVAb1RMr5rv5q17n4kDQFRxgBxJWP5aD+Kjr8
	133SoE/Vt1xU3sH/w391H2CTRWFbAOY+AH/xfDg==
X-Received: by 2002:a05:6a00:1992:b0:848:2aad:3393 with SMTP id d2e1a72fcca58-84842fd495emr1090477b3a.44.1783489128278;
        Tue, 07 Jul 2026 22:38:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:1992:b0:848:2aad:3393 with SMTP id d2e1a72fcca58-84842fd495emr1090447b3a.44.1783489127740;
        Tue, 07 Jul 2026 22:38:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:38:47 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:02:04 +0530
Subject: [PATCH v3 25/26] dt-bindings: reserved-memory: Add Google Kinfo
 Pixel reserved memory
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-25-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=2504;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=EqDXuZR+VwoiCHQ8MrohT0WWo31+t7/SKpMrOr+qFys=;
 b=IlHziXitcvmT7aPW0vG9xreygnlcWjxZOdssLB909oS1UY6NFTJQZL2kltBAv7qt9PX7Oo/km
 XzLe3BF48Z2BxC3z5wIZKkBAe17AW3wGDH17Hjo8UngU4VxpQsJGmSU
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfX7J1ubi3n2oc6
 GWVSz4NemgPiy5424Tj5Nq6AA3JMJILPQg4WPOY996K7D03it2zehnNhfvbb78TYgnEX3tWE6qZ
 k491OfIc5ygoza0xzjyONQTK61ilYZvLOQzpRu+hr9uabrw4M3N7j4aQ0sYLuse7b8SS9Oytm5n
 P+VZqYQOsKyhAVfqevaZBM8G3JYdoaAqwaKcNmezM40uNjWbA0+rjjBdnDY7GhsBsKYmIUa2Kzv
 ItJcfXebs2vTTXqGE41/X+kmbmP3ofyNwtjCTD/I1VjSSTZCkn2IBqrn6Y2hcVqcdIRDQFlDpNo
 sVWBtkdF6tT5Bdq5kuAVRrHq2RKbjyI/7NMJNF9JlQppIqHGeohuqzm3qaPEMRySWQMjOVQPItx
 5F04a+2YA/kpbONMFxhpe0jzl9OAEma3uokq0Hb2VbDL6LAYmVTgbppfxpyXw+pcKfDDKu7Un25
 eqOz2owJZlT+BlVbbZg==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4de269 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=37rDS-QxAAAA:8 a=iNqdCcJJzjlvehcLF60A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-ORIG-GUID: OZ0HCUHeRWKaGTN8hEHAuhs0tJ4cEH38
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfX3Gz+TakgacEP
 qOEd0rNj/cq/y0wS1+q3IlPG7dqCpjjH1zFuk9VguhiBWbz+orXMiO5sOhGPAPRWolTxFxWBrDz
 X+2IZYowrRZ7+n2TdUs3ThiDlP2mfXI=
X-Proofpoint-GUID: OZ0HCUHeRWKaGTN8hEHAuhs0tJ4cEH38
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080051

Add documentation for Google Kinfo Pixel reserved memory area.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../reserved-memory/google,debug-kinfo.yaml        | 48 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
new file mode 100644
index 000000000000..d260c2d5f70b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/google,debug-kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo reserved memory
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+  - Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+
+description:
+  Reserved memory region for storing kernel debugging information that
+  can be read by firmware and bootloader on Google Pixel platforms.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: google,debug-kinfo
+
+  reg:
+    maxItems: 1
+    description: >
+      Page-aligned region of memory containing debugging data of the
+      running kernel.
+
+required:
+  - compatible
+  - reg
+  - no-map
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        debug-kinfo@fa00000 {
+            compatible = "google,debug-kinfo";
+            reg = <0xfa00000 0x1000>;
+            no-map;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fdad8ef377c8..2d816d783024 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16901,6 +16901,12 @@ F:	Documentation/dev-tools/meminspect.rst
 F:	include/linux/meminspect.h
 F:	kernel/meminspect/*
 
+MEMINSPECT KINFO DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
+
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org

-- 
2.53.0

