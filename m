Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6F417BE5
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033227; cv=none; b=Lowlypn6zipACQfT3rvwq+OwugB4L9gaRfFwhqHedmywLL9TmSDsnc5NU/DWOkBkVq216FB7LmA2KpinB+XJooOxe8Qxo5LbPCiwY9F26XAMAMz/hc25uZKlUPQj/uwonFlTfO+ViBy+0Z9oyXJwRdpsAoaDRDVQ3x0k8ANTHvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033227; c=relaxed/simple;
	bh=XZKGBzfXN9fIV4WZEgpomlfSlCPgCht6K0H1kvBSLHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GHHBBn0n5fUGLEhJZll4HpVHTGKru7Gc8Yk5cfU8CorSXo1YrM+lIywi95tBuBtDOzgAZRmDZqwneAxl00Q9fPOc2fMte+QvNUQyMq34JdREZsgOFOiPrkmEFC5kjoewWuyihQgrogPsGjcmVjSNfB3EqBtI1Zh0a/ebORYeez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezawTkjR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkVg2Dtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezawTkjR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkVg2Dtq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TJkrKL2082099
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wqqghh7AT+DRz9GuT8bl/3sMfi4LSzmVdSTYMu55UNc=; b=ezawTkjRM+p5cz9o
	cbxXGsijIalEuCT6BQ1qtOaEQwl+xq0kAuu77yDZ5OslRPFVzsURyWt8NkiSk6pV
	WZjyZoVgHg45VcrnB2QbW8Ha8aIMKVhlArQfcjG2bkuduSoCa2ViFrNpoZ4+Xkap
	CRc8TQAYSf2++aytnuYLYxepDVHzlm4QAf3iKJ5AKSVh3BgNtdrH4K3ZfvNDhBWw
	M+v4pX1m3Jrb5kLlZ1BsjKWhFPkls8fQJVwymp0p12gD1//VxtykpdpWDzfady2L
	w7zEjWyou7g2FgToT8i7mIqeewSUDmpYFqUVkCE1Ca7vwavPc9QqYMHFSFc0/4ku
	9mHMVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq81grb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so25896211cf.0
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788033224; x=1788638024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqqghh7AT+DRz9GuT8bl/3sMfi4LSzmVdSTYMu55UNc=;
        b=PkVg2DtqPW9quC+1FptZpE0lIN5KQFRJnueW6J04OBdhJg9664noP+ehdXaw3xnMJr
         Fyya5UjG3fl+1r+hm0VxyOLeIpVL5JQA4bsRGaK7DbaAHErW2Itkt0u0XDNpMeWHRP1r
         TnUkjJzYI2OA31wf+C7C8FIFzhkosilRVr253BgN4nCvuLn5i+0o82LouppEGLBS+ttA
         nONkXwctjOXaPEebRxIyImjEMBD8LJIh82rYyx6TqYFBSu06AMUoAGQd3cJ8uTjZPM83
         N/f9/b0P9+dwZvS/D8Xtrm1ES0CT2ghBniM64k9qLdXV0WEvXCJcKByMu9oWjAVCCDkh
         DD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788033224; x=1788638024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqqghh7AT+DRz9GuT8bl/3sMfi4LSzmVdSTYMu55UNc=;
        b=KwSosHz/CdGxTlMqWX1NceO68+H9kH15iSbqLjNhihxZZ732ZScbWLV7xAXAwW7/VL
         U5Kevlw+VX5PvL5tRxQQ8gkJe1GMdbEA5EdVct+ULwtbqj0wdL3Tw3WPEijeLcTzYl7H
         +dmHWI+KEeJSNcjlFBP9mon7DbjDRVSG5jmEhoSfKcLl4fU+q20Y1SjCW2ffvEVzn2VW
         rpJ+wd2YU9O/wYYd35DkDUJCn0+8lSIjkMyp+IQw0Q6Q4Ah4Q8ntF4QqRzBVFuhwLGn+
         5xwlJDNR81kbCmXS8gInOfTIsFDmbnikD4tyTMdMYW9kg3/lTyFcxqog1ud281ug/Kmh
         k8ag==
X-Gm-Message-State: AFuF++kHwBkX8+sI8ZJ/T6kucuNdcGPQFsWrsmzZkIFUp3ENlOfYy0Q1
	pe5GAWE220lrYQWjKouTjJcvOx2g2KCd7f7hOWwFWaEM7+qU5ZWPhNsSQnYiQXJ1a2hCWjekE8B
	Ky/1mGfpeWPrYFPjTNa73AeoIMLohgv4KZtyLa+0rBIMwYyirpVccDko6o6CCGVpZ
X-Gm-Gg: AR+sD11SSOU6SmTgAtCKeJWAscoEnlqJigKFEdjtAKwtM7Q4LFvaVK/x2BPAfDu+zra
	0nmqVbkmQLtNRz++9H9WP4JPo2bT321rFs6W0OynQK1A2aigzgWf/lY5t2p436NtYDsq0YG9A8P
	IykO5M1mTh4Q522Z0a21hf74u4wZZzodMvXMvWs+oqleg5EiCK42tzFA+6o1lJwZDbJn+mEljYa
	/YturDDa3FWrr7m1Kg2GQ8SXpqxqe9n0Ty63mwtw2j4rxAbmPSHxl6XC17gYOqDmXf6ia4TmPu5
	qxSScBXahUmorBRWKuboy2DgJ4NNWSNNJ7ooiyP39JxXY9FthOlHBgRhhrxCaMMA2jR3ZRN/zh2
	c4fvHqLxx3pLKl5C8NhcVZ88=
X-Received: by 2002:a05:622a:1b87:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52fb93d39bamr176552401cf.3.1788033223423;
        Sat, 29 Aug 2026 12:53:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1b87:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52fb93d39bamr176552091cf.3.1788033222886;
        Sat, 29 Aug 2026 12:53:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm12446343f8f.34.2026.08.29.12.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:53:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 21:53:20 +0200
Subject: [PATCH 4/6] dtc: dt-check-style: Add test for node and property
 name styles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-dts-style-checker-sort-v1-4-6693a37d7ae1@oss.qualcomm.com>
References: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
In-Reply-To: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14042;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XZKGBzfXN9fIV4WZEgpomlfSlCPgCht6K0H1kvBSLHc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzi2H/0qvpydYgfVZbY7AbLRLwBr6xXkJRuxg
 1QublOZjKaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM4tgAKCRDBN2bmhouD
 1wNAD/4k7Q0YEWtgJ+w1bkjDcvC1XkhSFYlRdbtldClF80XVgHHI9Cgewaj8URiEYl4QyYACcNo
 NYjyGY0aiZs8k2CucDArXxN7Ulv0Qh89PCLvHLZaiF88AT0S79yVZmhpiyuRsBmZQPlL+DVeYQW
 JSu2VNYVPqgnUXD35j71roiUdycj8e2HOB6ftC2g7uyQIKA/dpxc2MOjJj1fW1QZOGeuCjXT+1E
 IWzf3BbXs04g46zy+HzSWX9na3+bypnmkTGEXuh0otEONZL4r36SoC7rvT0/LJA29fcMFtWF9zE
 bBLbHPs7FRwJeQDCNbV69j3RaGKHRTB23hVCN1yQrUqt+HYbzyRalFbzVsz0yzbEJG5xY6Aa1gI
 sWBYg9XvHaTexgiSwBiyObxJmX4M78WtQz8m3SRPlXV745Nu/4/BIx8rUMSOWbwPhIGBw8nAvJR
 84UxpbeegbOH/gvS1IrKHkYplYyK/WAxaD6Y7YV/a+m34znInLH0FE5iyCYS4NDrEYgQhia3vBX
 Fxh/ViR/H3KxYxz4KOvL7synwjgRHSVyEtq3aM7yJ9BjS6MjlDSLQsSs7g6i4xILt9uY/QlC1nj
 4QibwW0iLl7kJMZOHsHEg61CHu1SiD/MFzt1bLRvyR9W0x9ILWpUHBF91n+IDRYl7W6y5WxqGAw
 JlZNHH7oVIwkpoQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: uy3Zeu7yA6YS47XsHnqeFU7f2J-DVoE3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MiBTYWx0ZWRfX7bfp1s/krH97
 t5UzLH+JTZPSiBFbjighaJ0x4Wfzx2Tu+Ntkt2WRiXCOOegDrZUEJ7DcXaTu3cBb+uZwcZkI2eR
 B333QyPEy5T7EmFVK2MOybo0ayogejg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MiBTYWx0ZWRfX68cMR3MiYoTB
 unJPhz61u//UXdXQdkeZhpqfS6mxUdxm5EXEgLLRdlZujY0RIPOUWD32sbuRO63XmJggZpmd3KA
 58aQid/CEqbxmB/orbSmDAOJdyk2mD19/xbpXF+DeSeyCZKn8xRslIS7JVacq8a2Kf7aBrbcK8i
 iwr8yZvXQpm17hLRfH46T1Ax07ZK4eXluZxWJRK+XMVbM6x61L5kmJG1HAT6WkHoK6QuahRcIQR
 PjGXYgz3xsESHRSRbPtqVgpgPegxdtks/l4BrbVjyXls/y5133bWcn5nKZO0cu8HxogrBmJXxPV
 JBGNh4ay/SLGFwSMss8s9vS9UijBP3dY8u8Nzpm0232P0ZIsgnRrsWUAAcuU5XCW1qSZupr7KK5
 +wnpEJJhukiHQEl0jKgFJTWVjIjD4+onzqbyk2rN2x40D1hNtdeyDAPFMvcX+I1ANXm9yJrX1xM
 Vc2Z7UWzSEbx+ACbeWw==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9338c8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=18clSmAaxCh7XbchaGQA:9
 a=EkL4YHrcXgFCczJU:21 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: uy3Zeu7yA6YS47XsHnqeFU7f2J-DVoE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290172

Common style violation is usage of underscores in node or property
names, so add rules for following recommended names.  There is plenty of
legacy approach, so add the rules only for 'strict' mode of checking.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 31 +++++++++++
 .../dtc/dt-style-selftest/bad/dts-node-name.dts    | 60 ++++++++++++++++++++++
 .../dt-style-selftest/bad/dts-property-name.dts    | 28 ++++++++++
 .../dtc/dt-style-selftest/bad/yaml-node-name.yaml  | 54 +++++++++++++++++++
 .../dt-style-selftest/bad/yaml-property-name.yaml  | 46 +++++++++++++++++
 .../expected/dts-node-name.dts.txt                 | 13 +++++
 .../expected/dts-property-name.dts.txt             | 14 +++++
 .../expected/yaml-node-name.yaml.txt               |  7 +++
 .../expected/yaml-property-name.yaml.txt           | 14 +++++
 9 files changed, 267 insertions(+)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 7c3ee1432dc6..16586d0029ff 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -676,6 +676,31 @@ def check_node_close_alone(ctx):
                    'closing brace must be on its own line')
 
 
+def check_node_name(ctx):
+    """Only recommended characters are used in node names."""
+    for dl in ctx.lines:
+        if not dl.node_name in (None, '/'):
+            if not re.match(r'[0-9a-z][0-9a-z-]*(?<!-)$', dl.node_name):
+                yield (dl.lineno, f'node name "{dl.node_name}" is using discouraged style')
+
+
+def check_property_name(ctx):
+    """Only recommended characters are used in property names."""
+    for dl in ctx.lines:
+        if dl.prop_name:
+            exceptions = ['cpu_off', 'cpu_on', 'cpu_suspend',
+                          'device_type', 'dr_mode',
+                          'mmc-hs200-1_2v', 'mmc-hs200-1_8v', 'mmc-hs400-1_2v', 'mmc-hs400-1_8v',
+                          'opp-avg-kBps', 'opp-peak-kBps', 'phy_type']
+
+            if re.match(r'\#([0-9a-z][0-9a-z-]*(?<!-),)?[a-z-]+-cells$', dl.prop_name):
+                continue
+            if dl.prop_name in exceptions:
+                continue
+            if not re.match(r'([0-9a-z][0-9a-z-]*(?<!-),)?[0-9a-z][0-9a-z-]*(?<!-)$', dl.prop_name):
+                yield (dl.lineno, f'property name "{dl.prop_name}" is using discouraged style')
+
+
 def _property_bucket(name):
     """Return the canonical bucket index for a property:
        0 device_type
@@ -1098,6 +1123,12 @@ RULES = [
     Rule('node-close-alone', 'strict',
          'closing brace must be on its own line',
          check_node_close_alone),
+    Rule('node-name', 'strict',
+         'node names use only recommended characters (see DTS Coding Style)',
+         check_node_name),
+    Rule('property-name', 'strict',
+         'property names use only recommended characters (see DTS Coding Style)',
+         check_property_name),
     Rule('property-order', 'strict',
          'canonical bucket + pairing + natural-sort order of properties',
          check_property_order),
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-node-name.dts b/scripts/dtc/dt-style-selftest/bad/dts-node-name.dts
new file mode 100644
index 000000000000..b897cbd74dd6
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-node-name.dts
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	foo_bar {
+		compatible = "example,test-node-name";
+	};
+
+	foo,bar {
+		compatible = "example,test-node-name";
+	};
+
+	foo.bar {
+		compatible = "example,test-node-name";
+	};
+
+	foo+bar {
+		compatible = "example,test-node-name";
+	};
+
+	foo-bar- {
+		compatible = "example,test-node-name";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		foo_bar@1000 {
+			compatible = "example,test-node-name";
+			reg = <0x1000 0x100>;
+		};
+
+		foo,bar@2000 {
+			compatible = "example,test-node-name";
+			reg = <0x2000 0x100>;
+		};
+
+		foo.bar@3000 {
+			compatible = "example,test-node-name";
+			reg = <0x3000 0x100>;
+		};
+
+		foo+bar@4000 {
+			compatible = "example,test-node-name";
+			reg = <0x4000 0x100>;
+		};
+
+		foo-bar-@5000 {
+			compatible = "example,test-node-name";
+			reg = <0x5000 0x100>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-name.dts b/scripts/dtc/dt-style-selftest/bad/dts-property-name.dts
new file mode 100644
index 000000000000..110e33a524dd
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-name.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	foo {
+		compatible = "example,test-property-name";
+
+		property#foo;
+		property+foo;
+		property-foo;
+		property-foo-;
+		property.foo;
+		property?foo;
+		property_foo;
+
+		vendor,property#foo;
+		vendor,property+foo;
+		vendor,property,foo;
+		vendor,property-foo;
+		vendor,property-foo-;
+		vendor,property.foo;
+		vendor,property?foo;
+		vendor,property_foo;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-node-name.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-node-name.yaml
new file mode 100644
index 000000000000..03373cae9a66
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-node-name.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-node-name.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with incorrect node names
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    const: example,test-node-name
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    foo_bar@1000 {
+        compatible = "example,test-node-name";
+        reg = <0x1000 0x100>;
+    };
+
+    foo,bar@2000 {
+        compatible = "example,test-node-name";
+        reg = <0x2000 0x100>;
+    };
+
+    foo.bar@3000 {
+        compatible = "example,test-node-name";
+        reg = <0x3000 0x100>;
+    };
+
+    foo+bar@4000 {
+        compatible = "example,test-node-name";
+        reg = <0x4000 0x100>;
+    };
+
+    foo-bar-@5000 {
+        compatible = "example,test-node-name";
+        reg = <0x5000 0x100>;
+    };
+
+    // TODO handle also "-foo-bar" which is against spec but accepted by DTC
+
+    foo_bar {
+        compatible = "example,test-node-name";
+    };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-property-name.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-property-name.yaml
new file mode 100644
index 000000000000..08e0d1eb152a
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-property-name.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-property-name.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with incorrect property names
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    const: example,test-property-name
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@1000 {
+        compatible = "example,test-property-name";
+        reg = <0x1000 0x100>;
+
+        property#foo;
+        property+foo;
+        property-foo;
+        property-foo-;
+        property.foo;
+        property?foo;
+        property_foo;
+
+        vendor,property#foo;
+        vendor,property+foo;
+        vendor,property,foo;
+        vendor,property-foo;
+        vendor,property-foo-;
+        vendor,property.foo;
+        vendor,property?foo;
+        vendor,property_foo;
+    };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-node-name.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-node-name.dts.txt
new file mode 100644
index 000000000000..bd8d7e21e243
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-node-name.dts.txt
@@ -0,0 +1,13 @@
+# mode=strict
+bad/dts-node-name.dts:8: [node-name] node name "foo_bar" is using discouraged style
+bad/dts-node-name.dts:12: [child-name-order] child node 'foo,bar' out of name order
+bad/dts-node-name.dts:12: [node-name] node name "foo,bar" is using discouraged style
+bad/dts-node-name.dts:16: [node-name] node name "foo.bar" is using discouraged style
+bad/dts-node-name.dts:20: [child-name-order] child node 'foo+bar' out of name order
+bad/dts-node-name.dts:20: [node-name] node name "foo+bar" is using discouraged style
+bad/dts-node-name.dts:24: [node-name] node name "foo-bar-" is using discouraged style
+bad/dts-node-name.dts:35: [node-name] node name "foo_bar" is using discouraged style
+bad/dts-node-name.dts:40: [node-name] node name "foo,bar" is using discouraged style
+bad/dts-node-name.dts:45: [node-name] node name "foo.bar" is using discouraged style
+bad/dts-node-name.dts:50: [node-name] node name "foo+bar" is using discouraged style
+bad/dts-node-name.dts:55: [node-name] node name "foo-bar-" is using discouraged style
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-name.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-name.dts.txt
new file mode 100644
index 000000000000..f447743383da
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-name.dts.txt
@@ -0,0 +1,14 @@
+# mode=strict
+bad/dts-property-name.dts:11: [property-name] property name "property#foo" is using discouraged style
+bad/dts-property-name.dts:12: [property-name] property name "property+foo" is using discouraged style
+bad/dts-property-name.dts:14: [property-name] property name "property-foo-" is using discouraged style
+bad/dts-property-name.dts:15: [property-name] property name "property.foo" is using discouraged style
+bad/dts-property-name.dts:16: [property-name] property name "property?foo" is using discouraged style
+bad/dts-property-name.dts:17: [property-name] property name "property_foo" is using discouraged style
+bad/dts-property-name.dts:19: [property-name] property name "vendor,property#foo" is using discouraged style
+bad/dts-property-name.dts:20: [property-name] property name "vendor,property+foo" is using discouraged style
+bad/dts-property-name.dts:21: [property-name] property name "vendor,property,foo" is using discouraged style
+bad/dts-property-name.dts:23: [property-name] property name "vendor,property-foo-" is using discouraged style
+bad/dts-property-name.dts:24: [property-name] property name "vendor,property.foo" is using discouraged style
+bad/dts-property-name.dts:25: [property-name] property name "vendor,property?foo" is using discouraged style
+bad/dts-property-name.dts:26: [property-name] property name "vendor,property_foo" is using discouraged style
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-node-name.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-node-name.yaml.txt
new file mode 100644
index 000000000000..d9cf749e35c2
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-node-name.yaml.txt
@@ -0,0 +1,7 @@
+# mode=strict
+bad/yaml-node-name.yaml:25: example 0 [node-name] node name "foo_bar" is using discouraged style
+bad/yaml-node-name.yaml:30: example 0 [node-name] node name "foo,bar" is using discouraged style
+bad/yaml-node-name.yaml:35: example 0 [node-name] node name "foo.bar" is using discouraged style
+bad/yaml-node-name.yaml:40: example 0 [node-name] node name "foo+bar" is using discouraged style
+bad/yaml-node-name.yaml:45: example 0 [node-name] node name "foo-bar-" is using discouraged style
+bad/yaml-node-name.yaml:52: example 0 [node-name] node name "foo_bar" is using discouraged style
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-property-name.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-property-name.yaml.txt
new file mode 100644
index 000000000000..6aa3a004532b
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-property-name.yaml.txt
@@ -0,0 +1,14 @@
+# mode=strict
+bad/yaml-property-name.yaml:30: example 0 [property-name] property name "property#foo" is using discouraged style
+bad/yaml-property-name.yaml:31: example 0 [property-name] property name "property+foo" is using discouraged style
+bad/yaml-property-name.yaml:33: example 0 [property-name] property name "property-foo-" is using discouraged style
+bad/yaml-property-name.yaml:34: example 0 [property-name] property name "property.foo" is using discouraged style
+bad/yaml-property-name.yaml:35: example 0 [property-name] property name "property?foo" is using discouraged style
+bad/yaml-property-name.yaml:36: example 0 [property-name] property name "property_foo" is using discouraged style
+bad/yaml-property-name.yaml:38: example 0 [property-name] property name "vendor,property#foo" is using discouraged style
+bad/yaml-property-name.yaml:39: example 0 [property-name] property name "vendor,property+foo" is using discouraged style
+bad/yaml-property-name.yaml:40: example 0 [property-name] property name "vendor,property,foo" is using discouraged style
+bad/yaml-property-name.yaml:42: example 0 [property-name] property name "vendor,property-foo-" is using discouraged style
+bad/yaml-property-name.yaml:43: example 0 [property-name] property name "vendor,property.foo" is using discouraged style
+bad/yaml-property-name.yaml:44: example 0 [property-name] property name "vendor,property?foo" is using discouraged style
+bad/yaml-property-name.yaml:45: example 0 [property-name] property name "vendor,property_foo" is using discouraged style

-- 
2.53.0

