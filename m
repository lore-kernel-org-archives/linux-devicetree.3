Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC4D480DCB
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521672; cv=none; b=PfNJZv7Z/JTC5W/xrgm6z/z0ZRPcOrQ+TnyO6B/IMj+sXJN6Va5EzbWCcgBwfLQA4+4/bZrY7GwM5H9tm5n8O8zb+SpT9WVDQnUhuaPi0bBusgz5e/m04+3JLvZLsznsRC1cCRpic8K84eSEmUWB8eAzrWhGFk2B6/yDg/h01k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521672; c=relaxed/simple;
	bh=oEciikgwfKk8PZpOdBD5mQPOWN8GirNRJb3GdeBjJpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ae87YuqGhfFSEHyDfbcQvOm9ovBMNuolJJgB03I9O7aqViUdiKJDjXO8n2zr9Z3n7QAl3G01i51f7cWI2gVaG4HiDWrG7kyjmD9b75ZFkekrYPRBxg/ykCabmWGgb/V0g5x70vHJxoVjyENT7nedlSIU0vk1w7YJrzksnFXM2Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DU2hyjFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvkwJs+G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DU2hyjFn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvkwJs+G"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3CqZ2791774
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EIsaM2iM+QFFvxSTR5G/fTbUr55ZVo2ZYQHMqRV9tw4=; b=DU2hyjFnfi9N99ee
	LET8blG2zEGx3W62eiABagN194jT9K9LCfQAw4jbuliSLbkVXpJ1ifH4eFv0ZHLZ
	X4CmIke5Pd5SizFd8p0SmRvENcY08El5pcDrvNVSYFGzyO+V08t69M+iSj769uDW
	JBIysa6vvBO+lXRrybGVFZ854oMMtBkkfnSiMQEXsG5UNOSq0nXawhaUTUi3s1Kk
	dCcm+N0hWLUTJfyDl3FjHUWWXaiIY6FvS/OvAKFwy72QMG4yOLEVVOZ05V+AQXHk
	auJqpVtKzHATtb7yS/vFrTrZdmXb2/79rOEQkrdKmTqYlrX8G6zLEAIR+1mjQa87
	2o9E/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cswax0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:41:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07f25de2so6320551cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521668; x=1784126468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIsaM2iM+QFFvxSTR5G/fTbUr55ZVo2ZYQHMqRV9tw4=;
        b=UvkwJs+GriT3Pg/S8pzUkZSrD/ZoycPf+iaAm86MVCLoPd/nacxEujVbdNr0/Lt2Tk
         YjJNw555TH9qnYYqZUJF4AmgKMN/iRyGNPu/Mwtet5yCbNlXYo3Jxbpfj86wtkvlhYVs
         W2J/49/1urWkZiAuL8G1Ion2B4lhrAv8a2g3u7fKmojvQqoyNIcQ3987G4lWH86W31hH
         p81hZPI8bcb+V2grb8v6jJG7aA6R7d4tfqhdGT8M2gerxzm3vmi4u1iim6J+KdSic6Is
         Q3+bV82v7knZQveETTxqQ2iRFIiu3UOXuT1QBb9O9E84o+dLUDALO5OyaObyagiY0rFC
         Qrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521668; x=1784126468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIsaM2iM+QFFvxSTR5G/fTbUr55ZVo2ZYQHMqRV9tw4=;
        b=H+SfvGnyXmrgx+bzdCvxzGpB+FFMznngdSGDeJ7A+UGMbEbqEWNR0eQvrOULPjf5PN
         xbv4smLLYWvWKhSjcTSZdU8D9yh6lPtI5kMDfypMzrJ0axO3niz4z6UyHmoJZE+CdqSj
         IjGx+NGBEx+bPs696pXUxzCQFbcg20RviZOlXZDs8diddEB4ZFLPnVnL5Z1mdI32tDUy
         vzugDWPMkYkq25hQJ3q22B9EtbzsnEQmXx5xEwkpcUKOnRN88blC3dunlCQocQleSQ8R
         5MjiwdQirR2jky/TSLjFR1LMd0y8OaYar17mgDGLqdbm3huM3dsDuwiBomcFDjSBgrR3
         TT4w==
X-Gm-Message-State: AOJu0YwB85nEAVBeGNjHLsM7SKDNXfMdjXv2iGdVpuyI/GJTrShtYMtA
	ht35e2Impp8k2npzVn3R99VADhUCK5Cb/JKA2WTvOZOBueO/OzT/XK4YGJoCQMOJr4vPi6m2UzH
	mVu+N4jOk52dh4CQM1Lw6f+CLQFcTrSe4StqwALxIetV7rjibfJraKq6RO8gtu5kD
X-Gm-Gg: AfdE7cm00/M+DPuhszLKR4tN03eq4VcBfFU8aGxV9fa6OA1myweotSw1/Oa/bmFyu8a
	HwDjEVvHrmKmzaSaOrC17GxVdI36PWyo0UyFpVZOVEauvQYfiGjQGUT2FuHyNTU8MC6QU2XfjgP
	wW2yz9YgSwyU6QlyCoAy2Ff4t9VCxeB7oZPaK+5qvR1CIgP6wB5pEbU0zl9lz0hrAc+B9yNiXei
	A565/KkWjsjnga9T/28ipsI9eUJdKXOFiywuOtdsDmVdgRtCjfbPI3zbgOxSM+6F9fRNIgekVC7
	2eY/kzxytwmsEEo0SeCeuZziGVj9icFYu54Ic4PpkRRo7hQcy4f7fUFF+AYZVQT43p3T8cPUDa+
	0fYG9emHPG9YhsNNPBjMv124XFMGKWhJcduY=
X-Received: by 2002:a05:622a:410d:b0:51b:ff78:f221 with SMTP id d75a77b69052e-51c8b2f174dmr30705711cf.29.1783521668200;
        Wed, 08 Jul 2026 07:41:08 -0700 (PDT)
X-Received: by 2002:a05:622a:410d:b0:51b:ff78:f221 with SMTP id d75a77b69052e-51c8b2f174dmr30705161cf.29.1783521667669;
        Wed, 08 Jul 2026 07:41:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15da821c58sm52543766b.48.2026.07.08.07.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:41:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:40:37 +0200
Subject: [PATCH v4 7/7] dtc: dt-check-style: Add more DTS test cases
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-style-checker-v4-7-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
In-Reply-To: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8467;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oEciikgwfKk8PZpOdBD5mQPOWN8GirNRJb3GdeBjJpc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTmFsJXZjGjMybuMGVt/qNOiCkpAD5e+oC5tpJ
 ioBCSRpkA+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak5hbAAKCRDBN2bmhouD
 1xwzD/4t5jU10OFIrs6+9VqvEUOdiuscWQX5iGzxYUwF+YHNzXa31ExQ+of3hiCzLXtp8w6SBcq
 DSe+OqBpUq7btzbkV+SRWujhXTOxFiXgPN/SuTHHGnXq5iyzxHLRxkl61KNqFtDMJPb0Wiz7yEU
 GCP02IHHqYUHA6Qe6yljdEXhwphRlMK5gcd9IJ1QOc25OjQWshqPz8Txy0r5bJjd4HFAr48nqG9
 fed5o/mAzlCUB4aqnDvgff+NEjUDiYlL6ScgKIHlDnwWdukDliV4ORLCdxM1jH5U4tW5uzAewgc
 +KUipZKq35KXsnQD5EgSgAnp78wh39pJ3J8mO9gMjXZG+7jG99timpbUZAZGHbv9FgcRbdr5kuk
 CTn3c7NMRTCFpaKY1m9QTFZWIXpgJ/4zL7rf8ekAB8suOF0MhMDAUw+vyB0w9arOuBLYzlYhxfz
 z5df/6kVJ+r/0AiInqwOO9LnJ3H1BGgfDPF1bh9gGdSySo+Wj7fu4tI1n+1MeG7cBf4ud4tUmLw
 E41nJXcy7UYaUJXVlBX6RzeGGWjUwfFebXyL3zzA/oUUbVvzszZVm7eIT5A7TmFEWwDNeieTEae
 YHSrE9Tna256FGgccILZMBin8YdbiuO5l7+1l5tafV0cJFYee5sUML4ktMj1Z1HLqinvjkdiV33
 lq45D4QLyVhuxGw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ycFG1VO1GBUQLavhGUoD5p4pfPrsAaGV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX4C5rGi5zyPef
 ddyMPt38zDafyW0bo298coLLIz5EqrMxMPTj3js6IE6jHC9j2//YJq6f+eDWPS2w2U5rbkfGAEf
 lI5Ci2D9anAikZu7Fvjn2HAl0R4n134=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfXydvmqH9ure35
 GGX5Crm3mCBM6vSuYP8R1lWC+TF7av95drb8YXuesybZpZa4akqwRAcPSLpmHMYnB7ik2XeBc2L
 0MGVzbRqskzT/7rghNVIX14flGXBQJ72yzYCzE1tnru8LWLJZLz5SRVD2Gw1H2gU2ZZ3Hhtcixx
 6fHg0/GT5bD/8FlwEfPgfQPlJ0UMU99yj6/h+xC43Afwec/Hdf4WJYgusvWNPpbeMgiRAKgr13o
 5tOfZmhn9u6p0kE6fL2M0Hc3iq9DSt0NP2cxedw5mDUXG3R/K1LboscAKhuy2mSLruFu2gRkXLS
 Vvm+pvQC9tmpmO18ZQeGOjgdJvZ5JMpH4L0PymP0wAUOnUnTfyziWd/bMjNffsobtMIEgZdrBSz
 ejPBIrliUqxmYESpOPtntXFj4OSDLmc5t4AIB74JcNwVClt9kGLBRv/CBCqDaUzkzrRclXQ8Rgm
 uJvRfshW3KE9rokh69w==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e6185 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SSRPy7KZV2plhviXFSUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ycFG1VO1GBUQLavhGUoD5p4pfPrsAaGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080144

Add a few more test cases for valid and incorrect DTS for
dt-check-style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v4:
1. New patch
---
 .../dt-style-selftest/bad/dts-child-name-order.dts | 30 ++++++++++++++++
 .../bad/dts-extend-node-child-name-order.dts       | 23 ++++++++++++
 .../bad/dts-extend-node-digit-node-order.dts       | 31 ++++++++++++++++
 .../expected/dts-child-name-order.dts.txt          |  2 ++
 .../dts-extend-node-child-name-order.dts.txt       |  2 ++
 .../dts-extend-node-digit-node-order.dts.txt       |  2 ++
 .../good/dts-child-name-order.dts                  | 30 ++++++++++++++++
 .../good/dts-digit-node-order.dts                  | 41 ++++++++++++++++++++++
 .../good/dts-extend-node-child-name-order.dts      | 23 ++++++++++++
 .../good/dts-extend-node-digit-node-order.dts      | 31 ++++++++++++++++
 10 files changed, 215 insertions(+)

diff --git a/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
new file mode 100644
index 000000000000..dffc81cffbeb
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Include labels to be sure they do not affect sorting */
+		foo: foo {
+			label = "foo";
+		};
+
+		label_bar: bar {
+			label = "bar";
+		};
+	};
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu-2 {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	}
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
new file mode 100644
index 000000000000..19fb800e719f
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	}
+};
+
+&pmu {
+	/* Include labels to be sure they do not affect sorting */
+	foo: foo {
+		label = "foo";
+	};
+
+	label_bar: bar {
+		label = "bar";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
new file mode 100644
index 000000000000..66547a1cd2b5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&soc {
+	serial@20000 {
+		compatible = "example,serial";
+		reg = <0x20000 0x1000>;
+	};
+
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		interrupts = <1 2 3>;
+	};
+
+	serial@30000 {
+		compatible = "example,serial";
+		reg = <0x30000 0x1000>;
+	};
+}
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
new file mode 100644
index 000000000000..86b1de9bd654
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-child-name-order.dts:14: [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
new file mode 100644
index 000000000000..e3d8fd367e09
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-extend-node-child-name-order.dts:20: [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
new file mode 100644
index 000000000000..525081867bf7
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-extend-node-digit-node-order.dts:21: [child-address-order] child node @10000 out of address order
diff --git a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
new file mode 100644
index 000000000000..b1032885ad48
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Include labels to be sure they do not affect sorting */
+		label_bar: bar {
+			label = "bar";
+		};
+
+		foo: foo {
+			label = "foo";
+		};
+	};
+
+	pmu-2 {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	}
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
new file mode 100644
index 000000000000..d2bf5861c3ee
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* TODO: uncomment when child-address-order is fixed for top-level */
+	/*
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+	*/
+
+	pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>;
+		};
+
+		serial@20000 {
+			compatible = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			reg = <0x30000 0x1000>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
new file mode 100644
index 000000000000..33ce562b72a3
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	}
+};
+
+&pmu {
+	/* Include labels to be sure they do not affect sorting */
+	label_bar: bar {
+		label = "bar";
+	};
+
+	foo: foo {
+		label = "foo";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
new file mode 100644
index 000000000000..d9f1f533beeb
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&soc {
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		interrupts = <1 2 3>;
+	};
+
+	serial@20000 {
+		compatible = "example,serial";
+		reg = <0x20000 0x1000>;
+	};
+
+	serial@30000 {
+		compatible = "example,serial";
+		reg = <0x30000 0x1000>;
+	};
+}

-- 
2.53.0

