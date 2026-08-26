Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2259381E84
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727995; cv=none; b=biFoVDL/5dLNR8X4q9R5IB1PTvGFfkxjf5+49dC7O1xmSM5/mUoIA3pE3wG53SwRSeHpAJiwYm8wJgdjsc/VFKxpoJMElM2mofWMJk4Is+bYX7cIJlRFNZynua+fwU8XUamTuCzCWqaIG8OEVKXttPUIBkQ8IHfldIb4cQy25cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727995; c=relaxed/simple;
	bh=FPeedyVcOBXCW3XWVDVXuimg6qXUY3mVgEYbtrKbxZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOICLBJoujyLtjT+/R6G4yIChgHjTIfqdwPZG/YgcQcmg2wdnC24FDkrRWyxVj0sowfsRrnFUiIht25JGCgH9GVeZKLTIrkminWhuuFImoJ0qJBPFsRsVMgmR9ROsmn90d5u2heVIzzJrCvZsT5Lhs7MVvVb0a/oPbZscVQnXLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTHRxJs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/U1lzyy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTHRxJs5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/U1lzyy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Ruxs122883
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NlYonceip/HjNNcd5x5taiH0FWaLkMJzjDZRZYp13jo=; b=HTHRxJs5YGnS0NQJ
	tuiYZcfNRMeZNqRI4pk5SYrFCY/7vtszu7iMYt1OI2nw50t914Fz9YnJrbXQaTBI
	tK1Z40YGsG7Oia6Hc0KWZW16WUWDH0tbfRZ9bzTODPsqYLmy4/ZBMEjfGzJtTmwx
	8/zk0C+lzul+Rs+z3Qa8BjsTI9r2MRcmnEeaxDijWwYHwmp/3eE/0EX/NP+Aufzr
	k3tU9xgGoKNJE86FAJW/P1fS/VIDv7EgfpNBBYDBLurFVtx8QhFwtWPzNMBWFEvK
	Jy4jGAa2pGTnJhf55wuTTXVlQIJFGRrldj/k7VE9MnW+TeJmL6NMnu4ClrvWaCqr
	VOKh6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mtcm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so4846151cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727992; x=1788332792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlYonceip/HjNNcd5x5taiH0FWaLkMJzjDZRZYp13jo=;
        b=g/U1lzyyMPrWCqiay3XBb5FzVwDu5dQ5ionHyIuQ704qyfkwCGcRoQvL73hmyb/8TS
         Qz0sqFaBHxIJcH+Q5uG47D2TOKSO2oLvdoxnKNCKwIL+irg6yNxakL6oZGUdLjpQFGka
         Bx1tePwwApQJv6BmnR0asIBB6C//fIbsv331vhfRYcfJt9XMGcPkzI/wj7WBsP6M3LNr
         muk1e5rwWJWF10lBmSSXxh2KM303gQwRMgYfQLb/XS/wBQgpT4QpvIMR2H2JpIJ72XiQ
         OCu6qTCXHOsycG1kbWA9axSeY1qguRciDJaUx7qTZPL1+YVjJFjO/zp30fcNBS26Rcvh
         96gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727992; x=1788332792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlYonceip/HjNNcd5x5taiH0FWaLkMJzjDZRZYp13jo=;
        b=WSfDa1rK6MQV67zqvOoebvvnKFJqHDwwErjiQEXC4n1q9rM8WWHD67it9X/YVmVz34
         hWe6lHjxIwbkW9a1BxuzxCSTjwRfUpjKO1ICc0xh0caQeE/mWSJul5c2nxver8a9gm00
         pKhlMGW8bvPK28r/L3QD6MScLciNCToXn91e4PuNQHhaW1fWQ8+PG0euTWPG0D847PHf
         DSgYQ69GQVnzNlXAJE84UqWm6Dm6aPbzyo0mLAYo/37vsXXAiEcMGzpWh+ihG8dsIBeM
         o+KJb5ahKY5CsDooomSCMZ0UgAxmHXruaBPhoBQ/DW8B1APEwX282ossgJf6ZhwTQkO2
         Km5Q==
X-Gm-Message-State: AFuF++n3GuR7AqTJgW3eWGblv62VWDnG8GhJpG6qU4u0u9cBQW8GPbL5
	8OigV1xfenKoa2V3Dhs8MjDKtc0ClokQPzXDaeHZVCDSvCfksdtlKkSSyb9bBIUOrOvjUCQQutb
	M1lTYf78FHvlxf2oppl06NostWdsm6KvbVhXPWwa4oPSfMIbG5IFBbba6Exa3DfNd
X-Gm-Gg: AR+sD10Xszp4APNFDZPcQpQim+JUsmdhG2F/erWuzIf1mXD9KtZKYmb++LZS0Dt6Tut
	ZFjrS1qQjm8LjBEuCEyeg24YrqsV4m9mlW9qx7bTMKJuBE7oWam0+yzaIuyKP4ce4qYo6RLX8gO
	Pr+uCJwjz4orWG5ORpfnaIByPmqB8rYv1iDBJgJ81lawkz4ulxVbhYXAPIUJcgdArNv0NXkXHxs
	1xHzj6CW8cmpFI1hhFDRefRa5+gu2GJ9U6PFaHJ8e6QchAMZTASiMYYdwxZ5hzNhdnh50UxzVyH
	EGusO/mxdFpqiUwhCT4yV2NXaYUn7UlT8Hu6wCpI3Rm3Xc6Z433gi/K4Jt/U6J30zwaoqomGhSa
	xMtufEWcO1sj/zuL11HDcqd4=
X-Received: by 2002:a05:622a:c2:b0:51c:555:7dea with SMTP id d75a77b69052e-52e4236caeamr43894441cf.30.1787727992118;
        Wed, 26 Aug 2026 00:06:32 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:51c:555:7dea with SMTP id d75a77b69052e-52e4236caeamr43894011cf.30.1787727991553;
        Wed, 26 Aug 2026 00:06:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:06:02 +0200
Subject: [PATCH v4 09/10] dtc: dt-check-style: Add warning for redundant
 white-spaces
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v4-9-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12566;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FPeedyVcOBXCW3XWVDVXuimg6qXUY3mVgEYbtrKbxZ4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBgNzbOdpkZS0yce/l1txODGulEAiSrIhcTP
 v5cxditbvWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QYAAKCRDBN2bmhouD
 17WmD/4tF7683zPWDlEViBUe77te8CwH3tEwUiVou/npGVophJYrP0MGsWc5D6Fk9tv2SGqyPNk
 CWtnBv0ETO5QnbHp0wVi+VU/a8Zu6tJ12b9TvU7WGPVwtWSAgzAM/dHCpnkgy+jJaa8YlBIftOh
 c4t4Rl8+b2ykaMLYVldxeiMHClZ3s4nMrHGG3OssjaT3Jd8XcsvSREsczFWRNp4EQIX/U14oWGC
 9Mi3FCFTpNIB3ucwj3zGEitSwE9yKmVvFqND9ylHDL7Xf7NaCdJDEm/3JoD247ZL4YMX8X4fMGN
 X4pSYpmWZn+9Is9yAJ2V3Hs5LfkG+E/ZZf4oHS3erqBvQn2LwI6yvpIpIDlMZcyzpqFvsQ1AryZ
 mqyAHp7r/h6DwHTrb6zYS7DilhD49/dWUSlXq7arIUYYWuAT8axlBK/80nxkOxbNzs6QpGuRrCq
 sPTA4lfCCWqB56DswjIOPiVM6G4n1zInHyD8O62cKss10LcUQ7jqHyLIf3ows92xtM917zE5Rb5
 UsFEI1GYd93nHOHKdxprYEV7bFi1V843ZlVP2VStNcjF1kuP65UyQy4e4IZ4Q1Ris5E547tyoTL
 npVPr8Edf3o33g0ie3SINjCDuwJ5miRoLibl3suqoCwaEDMVpNHDj1JRPawmqfHFVCw759gm/Ic
 h3CdxRe8f35Yl7Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX5Yw6zTXCHWWj
 KuMUgpwh/UAdwbyQCj6Hql+zpw6q3VEv/51l7PqC5AqP54FiBpNXdwGauIesdNbHIC3Vho38BgX
 KL7+Jd7r3QSCLCAaVvpsZ9Oi7cEy58Y=
X-Proofpoint-ORIG-GUID: wh6FmFl4NtWu-uQhDTebr-Qw900_4RXC
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8e9078 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5jFD4gabhsihpJkUSYkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX1eoW9/oUiyHF
 CWks37HaMwMMsDgBe82ENzhQNCRFw8MwvTgA/r55hm3tVMuOLoalsnLKXPSusGSDR9n99pUDSN2
 A4+0j5zGS1gQBxrvXeWB947eI9Zb1VFejZ35LDwCsfaCpmL10lGe6ThFYbwSDgNNyAMFEPNxENw
 Kct5PfTJkGB5pHGHzG/A+iTIZYTvMMhQhr4y9Fvba+gp22ffHsc6SWkwEq/Hvk02JepGPAzLHqT
 Uk9hywiqjgHokO/IyZGG7QL/EIiQW0/GrnFVW3Fnmsd7h9N4sZp6E/qLhDGIISYDQdXm2uoemIX
 MQrlVzxPWnRvQHYoqY5Ysdz62mBr3QkxNCJqkVsS8vezeQIRUGbtd3jvltUXt4rRmij+7IP65pl
 DN15yj9Hh5e5OobewXVSKaYF5EAiJvCNQe1tX3NjIL/NVWOTE7nJs8p7CpfLxK/X1Mojj0Ayu0a
 ozwynNPZJvdbPeKCYsQ==
X-Proofpoint-GUID: wh6FmFl4NtWu-uQhDTebr-Qw900_4RXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260058

Show warnings of too many spaces around '=', before '{' and ';'
characters, or using tabs for these.  Both in-tree DTS and DT bindings
have many warnings for the first case (too mant spaces around '='), thus
keep this one only for 'strict' mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 38 ++++++++++++++++++++++
 .../bad/dts-redundant-ws-strict.dts                | 27 +++++++++++++++
 .../dtc/dt-style-selftest/bad/dts-redundant-ws.dts | 27 +++++++++++++++
 .../bad/yaml-redundant-ws-strict.yaml              | 31 ++++++++++++++++++
 .../dt-style-selftest/bad/yaml-redundant-ws.yaml   | 34 +++++++++++++++++++
 .../expected/dts-property-order.dts.txt            |  1 +
 .../expected/dts-redundant-ws-strict.dts.txt       | 13 ++++++++
 .../expected/dts-redundant-ws.dts.txt              |  9 +++++
 .../expected/yaml-redundant-ws-strict.yaml.txt     |  5 +++
 .../expected/yaml-redundant-ws.yaml.txt            |  3 ++
 10 files changed, 188 insertions(+)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index dd3828b14638..e67ba1e5164a 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -349,6 +349,36 @@ def check_trailing_whitespace(ctx):
             yield (dl.lineno, 'trailing whitespace')
 
 
+def check_redundant_whitespace(ctx):
+    """No whitespace between brackets or other code elements.
+    See also check_value_whitespace() for more checks."""
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.COMMENT_START,
+                           LineType.PREPROCESSOR):
+            continue
+        if re.search(r'(\s\s+|\t){', dl.code):
+            yield (dl.lineno, 'extra whitespace before {')
+        if re.search(r':(\s\s+|\t)', dl.code):
+            yield (dl.lineno, 'extra whitespace after :')
+        if re.search(r'\s+;', dl.code):
+            yield (dl.lineno, 'extra whitespace before ;')
+
+
+def check_redundant_whitespace_strict(ctx):
+    """No whitespace between brackets or other code elements.
+    See also check_value_whitespace() for more checks."""
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.COMMENT_START,
+                           LineType.PREPROCESSOR):
+            continue
+        if re.search(r'(\s\s+|\t)=', dl.code):
+            yield (dl.lineno, 'extra whitespace before =')
+        if re.search(r'=(\s\s+|\t)', dl.code):
+            yield (dl.lineno, 'extra whitespace after =')
+
+
 def check_tab_in_yaml_example(ctx):
     """Reject literal tabs in DTS lines when input is YAML.
 
@@ -1002,6 +1032,10 @@ RULES = [
     Rule('trailing-whitespace', 'relaxed',
          'no trailing whitespace on any line',
          check_trailing_whitespace),
+    # See also check_redundant_whitespace_strict() and check_value_whitespace()
+    Rule('redundant-whitespace', 'relaxed',
+         'no redundant whitespace within code',
+         check_redundant_whitespace),
     Rule('tab-in-yaml', 'relaxed',
          'YAML (also DTS examples) may not contain tab characters',
          check_tab_in_yaml_example, applies_to=('yaml',)),
@@ -1052,6 +1086,10 @@ RULES = [
     Rule('unit-address-format', 'strict',
          'unit addresses must be lowercase hex without leading zeros',
          check_unit_address_format),
+    # See also check_redundant_whitespace() and check_value_whitespace()
+    Rule('redundant-whitespace-strict', 'strict',
+         'no redundant whitespace within code',
+         check_redundant_whitespace_strict),
     Rule('value-whitespace', 'strict',
          'no whitespace directly inside <...> brackets',
          check_value_whitespace),
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws-strict.dts b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws-strict.dts
new file mode 100644
index 000000000000..201e3940ba1c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws-strict.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+#define SOME_MACRO(foo)					\
+	(foo) ? <1> : <2> ;
+
+/  {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* comments  { are okay  =  though ; */
+	soc:  soc@0  { /* comments  { are okay  =  though ; */
+		compatible = "simple-bus";  /* comments  { are okay  =  though ; */
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells	= <1>;
+		#size-cells =	<1>;
+	} ;
+}; /* comments  { are okay  =  though ; */
+
+&soc	{
+	serial:	serial@20000  { /* comments  { are okay  =  though ; */
+		compatible  = "example,serial";
+		reg =  <0x20000 0x1000>;
+	}	;
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts
new file mode 100644
index 000000000000..de1f383571d2
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+#define SOME_MACRO(foo)					\
+	(foo) ? <1> : <2> ;
+
+/  {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* comments  { are okay  =  though ; */
+	soc:  soc@0  { /* comments  { are okay  =  though ; */
+		compatible = "simple-bus";  /* comments  { are okay  =  though ; */
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	} ;
+}; /* comments  { are okay  =  though ; */
+
+&soc	{
+	serial:	serial@20000  { /* comments  { are okay  =  though ; */
+		compatible = "example,serial";
+		reg = <0x20000 0x1000>;
+	}	;
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml
new file mode 100644
index 000000000000..739c44fd7217
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/yaml-redundant-ws-strict.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with redundant whitespace
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    const: example,test-redundant
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
+    device@1000  {
+        compatible  = "example,test-trailing";
+        reg =  <0x1000 0x100>;
+        clocks = <&clk 0>; /* comments  { are okay  =  though ; */
+        clock-names = "bus";  /* comments  { are okay  =  though ; */
+    } ;
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml
new file mode 100644
index 000000000000..92ddfddaf5c0
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/yaml-redundant-ws.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with redundant whitespace
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    const: example,test-redundant
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
+    device@1000  { /* comments  { are okay  =  though ; */
+        compatible = "example,test-trailing";
+        reg = <0x1000 0x100>;
+    } ;
+
+    device@2000 { /* comments  { are okay  =  though ; */
+        compatible = "example,test-trailing";
+        reg = <0x2000 0x100>;
+    }; /* comments  { are okay  =  though ; */
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
index 65977f96331d..29283f3451c7 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
@@ -1,4 +1,5 @@
 # mode=strict
+bad/dts-property-order.dts:8: [redundant-whitespace] extra whitespace before {
 bad/dts-property-order.dts:10: [property-order] property 'model' out of canonical order (should sort before 'compatible')
 bad/dts-property-order.dts:12: [property-order] property 'chassis-type' out of canonical order (should sort before 'qcom,board-id')
 bad/dts-property-order.dts:20: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws-strict.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws-strict.dts.txt
new file mode 100644
index 000000000000..ac0d57bdecdf
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws-strict.dts.txt
@@ -0,0 +1,13 @@
+# mode=strict
+bad/dts-redundant-ws-strict.dts:7: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:13: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:13: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws-strict.dts:17: [redundant-whitespace-strict] extra whitespace before =
+bad/dts-redundant-ws-strict.dts:18: [redundant-whitespace-strict] extra whitespace after =
+bad/dts-redundant-ws-strict.dts:19: [redundant-whitespace] extra whitespace before ;
+bad/dts-redundant-ws-strict.dts:22: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:23: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:23: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws-strict.dts:24: [redundant-whitespace-strict] extra whitespace before =
+bad/dts-redundant-ws-strict.dts:25: [redundant-whitespace-strict] extra whitespace after =
+bad/dts-redundant-ws-strict.dts:26: [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt
new file mode 100644
index 000000000000..c18c1972bb47
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt
@@ -0,0 +1,9 @@
+# mode=relaxed
+bad/dts-redundant-ws.dts:7: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:13: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:13: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws.dts:19: [redundant-whitespace] extra whitespace before ;
+bad/dts-redundant-ws.dts:22: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:23: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:23: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws.dts:26: [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt
new file mode 100644
index 000000000000..fbf323832c91
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt
@@ -0,0 +1,5 @@
+# mode=strict
+bad/yaml-redundant-ws-strict.yaml:26: example 0 [redundant-whitespace] extra whitespace before {
+bad/yaml-redundant-ws-strict.yaml:27: example 0 [redundant-whitespace-strict] extra whitespace before =
+bad/yaml-redundant-ws-strict.yaml:28: example 0 [redundant-whitespace-strict] extra whitespace after =
+bad/yaml-redundant-ws-strict.yaml:31: example 0 [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt
new file mode 100644
index 000000000000..c85e80ed272a
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt
@@ -0,0 +1,3 @@
+# mode=relaxed
+bad/yaml-redundant-ws.yaml:26: example 0 [redundant-whitespace] extra whitespace before {
+bad/yaml-redundant-ws.yaml:29: example 0 [redundant-whitespace] extra whitespace before ;

-- 
2.53.0

