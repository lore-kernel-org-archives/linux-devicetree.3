Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D44195AC
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618917; cv=none; b=r54FtmdiYe4FL0lBzUSa7ML+bG84lQmcIaas/4PCJheNZh00LQ1l6CNki9247We29KpsqTwDeCQfRausTMTiXL2Nkmr5tcQYlb7bbbsQ6maUpHJWM4Bje0wYSjdnFdShgViKGWxTEBWGTfWty5C2Gg3oK7sDCUK0lpfnKWX+7mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618917; c=relaxed/simple;
	bh=ZzYwHa+deDpA118pa8JLvznGNgQlLOdgQ29SOnIiH9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGEzaXN/N8bb51YqmLk1fwwDGYUG3itxHj44vD0/ElgQKVYfcRU9QvguxVgXpwe0WAEzZRGG55eYJ9RmdnFumOyN5HJTSaJsn2h+e+qfTDMxN2g8nRG2gOVtJLaq585yGyEVndJabpeB4gDvmz9lTy5nmNUlVyIjSOCxX8Xw4YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UtlOx+2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZNDD4gz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UtlOx+2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZNDD4gz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXifL2474036
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/ok5P/KJKTJ44/y6GUKUWw0HNP+CMc3yaavgWV34ow=; b=UtlOx+2F64QOCPI7
	xxbwfOeEwRhDO3nAis6Z1Oyl8Pudwhcr5vfKL0b10Ad7Z2DXguYRO0WkyucRb0Pq
	DIswWwUPW9o0RLdXpyg74AyKWmiiWm53pAwTT4HUV7hOvnzsVjex/ugkgmJwuRJI
	B0rsFa0h6VxA6A+E4k8rcWSyQHRhgTtfHOp7NonKOYFkPGjuidnKou8LqlkE4YVy
	aBllsXiMCQwGDxOBe2thcs5bAcP6JgJaWPl28Wj2fgRtJ9tR6evmkEW4NvTyB/fO
	+QvZZSDbOMMsXqU48EdFG2TnR5oFE3iWNvBZIGkqXlWValxBbmwVLonyDRQxkie/
	kCBhPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqph8fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:41:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e6f602cso446161cf.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618910; x=1784223710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/ok5P/KJKTJ44/y6GUKUWw0HNP+CMc3yaavgWV34ow=;
        b=IZNDD4gzks2/9huWxvrg/SFXtvpSgabWaOlIR4Hiyz8eebTyUeFjhoK+zeMBAVR5/a
         dNaPYtFTiKdP6XdMmOeY4ZHBMY54z/rOiwMuUgCQR2OEASoFAdY/2obxV9IIblL3G5vY
         BueoZzvOyTHrF3pHLp+uSdU6gE1d1KKRcIur6j6H2ZjsipUauVu6TnLCQs3MkXbBOM9N
         PT3uR8o4J7YuljgHJW2CHXjxfZ41uqENVAb5tdfmJFl04oFufU9GDXpo8F3c0AJ/KQ+e
         ivToTVxN5OCmM6pX5/JA0UwEQXZEwlYFgUUa5Ws3srmbjqNOhQdfk0VUxRvb5AHgNOsy
         rdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618910; x=1784223710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/ok5P/KJKTJ44/y6GUKUWw0HNP+CMc3yaavgWV34ow=;
        b=mZchBUK7YOHdt/UNnvojqcmuujopu1HAy8jtP3AWKdcEC2YHq7n6Iin1KtjiYWO3WV
         cQFNKa2qnCbFy3tQQ1dD0Tph8Er3JVpaP6LTDrZc+1xO+qtVROu//H+kTwDTLGDAhj2n
         tZ+UizfcEoIpj9XECB0I9ml13lD0l5FOIpskDK2KS6YrY9I58SEzA+4FAcXln0kISQWB
         B6uCJ+FQcr8OwRgHy4qfXoQRJw0fCuXO52oJYlueFAdQ4ZxNfwUl0TsYWicLSheWPmAT
         /zJua0Ia04zonJUzpMGCZBy5LZ+1EC3lKezHm4sXmrbJ378zj/bu8IHw4pXpxjGV1hTu
         avGg==
X-Gm-Message-State: AOJu0YzLo4833v6fsMLDxVe1OFGCX9BggkQLYRLZiehnUOKg2A1XTALR
	Kxw/BDTMVPuPBxIfYXqCm6GmvEyRbxm4KIPs5KrsNZQ6MT6QA+Kfks/n8HD8Xsssv1fG48PNSEx
	HN25GNbKemZjsrQtLfLNi10SGHyiIuHZoFRYmW5tplzBKcyCBjpUqdilG5cHtpnSx
X-Gm-Gg: AfdE7ckK/CV4Wz029pLfAofzYV6FIh5J0665AQtMH2pIDrY1v16YF+P1RZJKc8/uc1/
	SY5LXu9TeKrwbk99cLRaUjha9y67mwlLDf1i8i7gdo/8eeXViUOSY84vpZKJhGXtG2CKiFm6RnO
	RRUukIg34HvlcAtnScNS8mgnLLp0t89h35xhYKZcm+PSRUgtbQFrW9kHuaOMFfwxGL4Vz/YCODx
	UV7FBvSZnFj8CQNw6OregruSxfAOI4FcixSoQob20R+cjE+kfKIFPe26BOQTh6G8aLCPzuC/3r9
	AUdBvGQL7mTRG+fzod33o8x2NIg6o8rIlsfiuOVtTKTuOUatR7gk0l3RpOdxqDzwM7qe+WuIrWn
	JpiOnNYtYo+aI9GCWbQMGbd4eTS7z7keZ
X-Received: by 2002:a05:622a:1f0e:b0:51c:2149:52db with SMTP id d75a77b69052e-51c8b4ba4damr85948321cf.59.1783618910011;
        Thu, 09 Jul 2026 10:41:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0e:b0:51c:2149:52db with SMTP id d75a77b69052e-51c8b4ba4damr85947841cf.59.1783618909379;
        Thu, 09 Jul 2026 10:41:49 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm55174048f8f.21.2026.07.09.10.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:41:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 19:41:35 +0200
Subject: [PATCH v5 7/7] dtc: dt-check-style: Add more DTS test cases
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dts-style-checker-v5-7-fcc147cb697d@oss.qualcomm.com>
References: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
In-Reply-To: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX+JZbm3c+JM5R
 a54nW/+ifRAGCY+uXGLUqhOBabgcFkXR5g+wlvNyj6YH+qjBLkjxro9GCH2oImIVUr5CovDf2P9
 Ewi6J3Y+/GLKkh+FThD87yWqf5aKZQq9RfUvEe3zicwgYL/fqV8etE2CvCflykJsa4DBhSe4vDf
 K0zCSJ1IToiGEem3tTYr5ChQaxT+MtSuhDVeos234iVztMHxMKapQ+lnpjYd3tL9yQ7WMnWoJfd
 YFdVXeZXEGTYU8dBj5oxixwZUc44guce3AeiV4wSoXQLSyJhgh7s4YRdvRYxr0b0FIszfpIP9LA
 aV6BuAgwXdlxokbxUKt2Ph3h7kQ6Dcnt+zEfHvy2mfy4TjOYmINk7JT4+nnlC5S4OQz/nA9yiv/
 pQp+lOvqiCq/CS6HfbS8phbkF1N6ACn+YdJcrjBWWdUI7eMUCxUnU2Rjw8u9pUXATTYFQ6+jZs5
 CYKPXXDl6ux3OGeN+gQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfXyGvyNwuZ0vJ4
 +VeibGLSr3gCPTQ5tvN/e8/vCKl2b1JaUVEVOKdihsskF7GZOA0Vt+pLAsS7PDoxpkAgXBX/AUJ
 sJ5QNRSFvSnPceMLH5C1JG6KtXq51VU=
X-Proofpoint-GUID: 41AdhLvgDbq8hbRLJzlhanUdUfics5be
X-Proofpoint-ORIG-GUID: 41AdhLvgDbq8hbRLJzlhanUdUfics5be
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fdd5e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SSRPy7KZV2plhviXFSUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090174

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
index 000000000000..49c5c10c92d7
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
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
new file mode 100644
index 000000000000..575dadd03c38
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
+	};
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
index 000000000000..f3ffc47365a3
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
+};
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
index 000000000000..d2a278763c3c
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
+	};
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
index 000000000000..47fe5455edfa
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
+	};
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
index 000000000000..0c292fefa52a
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
+};

-- 
2.53.0

