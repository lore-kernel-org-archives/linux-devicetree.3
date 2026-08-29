Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4606C3F8250
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033221; cv=none; b=Pa1aUXD1DeXqX7l21M5lB15iJXe05QBCbmuhqVdQnF6wasAmDVlDDx9PmA5r4BOTCOgRIS399ZuuRS48MbzarHNCjSnNr0RfvqON5HYKOM30dmg3xu/ujQckXFS0rDHLOFG49KHVbx1PDODUOn6try3rBiQ+L+f1622FFWJPMlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033221; c=relaxed/simple;
	bh=isuqhP8+OaULPc9jjYiOY5JsnRD/wGRbFJWL8Im3RVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+f9H4A9wIoPFLkbHzYV3AtW7zcGYcYC56FKioQoX1B7436V+WCbeLVzse96B8HGCC6xFsOQ2cdRCidMJ+bWWnSCN2kCQLVmQwKDFyJ9W9XtvvjB4SHSDOzoe6sM0vUBFvtbQLnOqCjLkGO+g6+xCMqGN9rMlfBFXUtdTKpM5eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l2w8msHj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+wYBaZE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l2w8msHj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+wYBaZE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TJlRP52172052
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	okPqt7QLBVpqv61RtFochhp3Vo2DJbdu6ToGavr+pK0=; b=l2w8msHjPYocOwcQ
	tf8JXU2bPIWQ0GwDYUzYpz7fJCcMxRoVXvDdI8cOm9nTFn2oxActlPtOtIVtnWfO
	LjLJo0w3WCMg7lzBENeRTArCGpCQiorv2ZEhZxjjkMKANUtVady93CNFWW9U0nyW
	PGC0aASyrj4ROS7acOK4k2KR2Lk3TJV8y0HsMTQau0FOxhmMC2yboFIw/nBxgz44
	hXIoet8ZAQQjxPFmT8IHdFfwgzG7UqkEfSL2WCSM1K/dTM9tUX7q+fYAQpW70nJA
	t9BnGcALZ0FFF5lM8xEdXTvbVCs+d9+RPkj6SHL8/a5qMhwFToU127qsMugYiq+B
	SfVMQA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6hman-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fbe82672eso6042761cf.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788033217; x=1788638017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okPqt7QLBVpqv61RtFochhp3Vo2DJbdu6ToGavr+pK0=;
        b=e+wYBaZEgvhmdH6JpphLLnNwL0DIpctI1B2yF/g65PeIuL4vnzPOChRRqx0Hdm7Met
         iwq2nDOYaVsX/w1wca8RnPdRZziEDB45a4JSXMKTyF0FMpXV1PK89hPIopSnJX1uKRMy
         /274526pb9sZtSFWbJE5tOGva0dMGtM3GQ8uggqGpM4EfbucYNPSkl9KEjMdULNZOHaG
         aqvGmya/DNUgG3jrD/0falJfVk4ynwjvA1OlSpJAb9QbFwOptSUO4DCyZOoqNyAwy7xE
         iFpwxM1BjC33NRFpisK8CH5lgLk4f7BYjNWA0LrNUEICNlX0AVe38bS2B1jdo3p+4hzT
         +b8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788033217; x=1788638017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okPqt7QLBVpqv61RtFochhp3Vo2DJbdu6ToGavr+pK0=;
        b=m6T6huQ9dhx2t1YWL3613Ab89B4LUKp1JSV38lAz2wAFmwyKro3Z06jHjJ/TsylX7O
         3ukwZ/wOGWISa4x/NukqNqPTXMAdO3t8bhPjx8EMyX2zesJ5VuUri9yPDVcZr9kMA1lw
         V32acJ/VgxrutHhb2ySEp7J5qac23LVyjix5RRs3AU2frDrT0yzUeMisuhDEjV+aXR8+
         E8QLlh1dTjpJYVgx7yhNnOUQgiWZ/OtB05yP0zPqGlAaSgsy9g1XDe9HipqJ2pgNgaJU
         yo+9Tub7TmD1B2ih9Tdvkw5bFtdZ3vjfMQ40QTRxgfnJrwesC7p29O+1J6QD4YWFi6Az
         0xlw==
X-Gm-Message-State: AFuF++mArLHP+sMhOgKINNXTrEPSrDcLQNzFd8c4SgltsA51Et7rxRuJ
	n4dYAXXOInp2VSC2VNMOHmE8qU4oj3PL2tV2qZbknxIEXLxkwXupAJMECrpeNuN2MRkiUuml9mV
	iB8MrIyNtQ1S/tu55n4rLrCZx2vkEuRxGx1YWboEQyHvkZr9xxk7TG5Tg7ELh49Kd
X-Gm-Gg: AR+sD10tXWhu+b9qKz/qBq83ywxcZowv56tGN7yye1zXLFjEisteFJRc6jhpxZp/DPX
	aiyCBiGSOhPMA0nIEHf6p58vSl8JzXC6jDf8ISggTDjiNuv4DCquvrt2OMn6uScpr4Gi98gJtyF
	80Iyhmp6e25qhhlfUTACexlPHcGRYjON0ZAOt4I0+kcmFpZuJ0vkbVVWT1sidwpO3n9iJOFjCdr
	nU3eGSRalO3AD/GCXCnW76o5ddhjbMRwpBAth1NruTJUcuSv9v8jvmQptjUUtWrrUQfA/kzIk5+
	O+eTyFZUWN+NrFHlfnrK7mh1jcKHMZofvwXBjkg+JgOy9ZAhvLy/XH6biX7CMXolPG2VQU1+nkg
	cTU8z1ixMxoq9GP579ImRc9Q=
X-Received: by 2002:ac8:7e90:0:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52fb96d371cmr191374131cf.27.1788033217276;
        Sat, 29 Aug 2026 12:53:37 -0700 (PDT)
X-Received: by 2002:ac8:7e90:0:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52fb96d371cmr191373731cf.27.1788033216807;
        Sat, 29 Aug 2026 12:53:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm12446343f8f.34.2026.08.29.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:53:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 21:53:17 +0200
Subject: [PATCH 1/6] dtc: dt-check-style: Sort rule directory by name
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-dts-style-checker-sort-v1-1-6693a37d7ae1@oss.qualcomm.com>
References: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
In-Reply-To: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7253;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=isuqhP8+OaULPc9jjYiOY5JsnRD/wGRbFJWL8Im3RVc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzizxy/7a822ZRnQTBPkNX0RcLMwd3uXADLEZ
 4RIo60xfgmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM4swAKCRDBN2bmhouD
 189UD/4mUGK85SbHbRiU2g7JAZ3O3Q9t/x7U4x/gKdVJK5MsV3cdyIibFfNjlknoK5aktotTamg
 LTax8dBpIv/VLdh0RSLCzkP+4EoENwMxfOT1Qk9sK78Jf6rO7PLTBx3s3YnvVnEkqaG7KmACFs7
 dpfbVBQ4GMa5fI2QGJWVZ+djgX0isloib6/5cCIub4eyJFtWYhq9T+IANyMNck0miEB2QNa15Wx
 z7N9auBQtnLymWy6SV5BtsRFkx/UEkmhJKcUcpNnWdkUGpEaRAS7gh86cf9iR6KafnfwNzbwHxJ
 WXoY0/zP+79/v7pkH1qTKtIlFPg6FaWKecNfQMPxC+a0btwyeCy9ky8VzGfIL4Qmw4s43nOGSoI
 W5PiV/L+e3Cg9zmAG37FVvTIhyzK3iZDQ7tWaWK/Lx4BHKx5t8RWmwiKLf3KUj1lHv2B0RMeaGi
 2/DAqRZsYzTD+RQN2q7ArCONDV+GNOq/NdLlilbk/4k7XOe4ryaYjBrlmLzR5HznWDs/WawKQNf
 12809v6PK9illn8vPf0s9Rp4kyjEZnplpvY3biqtHAjasEnAriLEgOfHPTzs/qdXgVbD2m31SWY
 BlmKO0IVZhU1maR8uU3qL35ge+BxZeTcnWXd4Lkp2DW4GtPtDKsshkWkjpXAFv+ZL59L38EhJwo
 7MaXNWNPdHVR1KA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: tkvFU-mARuyNFh2U6AL4xrvLw6YgVMHU
X-Proofpoint-GUID: tkvFU-mARuyNFh2U6AL4xrvLw6YgVMHU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX4YSwTTxDLb5a
 Sbwk/oYikAq2x76AmOnLrg0utQAC3f1Dq4E3hI+Gc8Jxk5JyiuFLphlAaodjYMJLLZbMhEujQ43
 5pfuyUrOJkUBC3Ej45a8qVoGipH4eQSeQrfuwzPlVQe6+dh0W03u+BXm9dxXe07vjJOFVVUeu2z
 N3cqkd0XKDxYKcR4UpQCy0D3sWt5zRopoi1093EsDWk133qa4GHIdUxCngnIzUEDFIAW05lTS5C
 UUxzp8PtWSLTlEsXs0svhTfFFwO4IuKr5x8292YaM7Ypt2gw5Mqw5xgVd4cIRGaquV8ejXLGTjz
 pcZXvz5vykeXqFKUndTikC1krHZD/uSXR1uvBGL9fimU07oOzeLlnqxnTWZB76Xahprn18u9zdV
 OAJL2Ta0SeOI9YHjrXmxhMuAm3sbD/wtk+mI+Xz2Yky2KdR29oiwPR8R5QwcgtIauKf7eIll8P3
 0qfQWLctHfbp0pctAzw==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a9338c2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yqRInNeA9D87wOtwJ9MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXwLxjH8u4UP/9
 bLgFGuCmM0Ja2Lzwt8mHNDty+t4Ap4cz3NAdWoT6+boVsnrhZTG91zKwEwj5dsASwZpmvPVS8So
 xHQvMfuhnVlMyZ1UCpee9hO+uDgv1EM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171

Sort the array with all the rules, so managing this will be at bit
easier and simultaneous addons of new rules less conflict-prone.  No
functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 95 +++++++++++++++++++++++-----------------------
 1 file changed, 48 insertions(+), 47 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 487e76b85105..49b5c28563eb 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -1036,22 +1036,7 @@ RULES = [
     # 'relaxed' is the default; rules in this group must produce zero
     # output on a clean kernel tree (post the small prep-cleanup
     # commit at the head of this series).
-    Rule('trailing-whitespace', 'relaxed',
-         'no trailing whitespace on any line',
-         check_trailing_whitespace),
-    # See also check_redundant_whitespace_strict() and check_value_whitespace()
-    Rule('redundant-whitespace', 'relaxed',
-         'no redundant whitespace within code',
-         check_redundant_whitespace),
-    Rule('tab-in-yaml', 'relaxed',
-         'YAML (also DTS examples) may not contain tab characters',
-         check_tab_in_yaml_example, applies_to=('yaml',)),
-    Rule('mixed-indent-chars', 'relaxed',
-         'indent must not mix tabs and spaces',
-         check_mixed_indent_chars, applies_to=('dts', 'dtsi', 'dtso')),
-    Rule('unclosed-block-comment', 'relaxed',
-         'every /* block comment must close with */',
-         check_unclosed_block_comment),
+    # Rules are sorted here by group (relaxed, strict, stricter) and name
 
     # DTS files always use tabs; this is not negotiable per kernel
     # coding style (.dts files are real source). Relaxed mode.
@@ -1059,19 +1044,26 @@ RULES = [
          'DTS files: 1 tab per nesting level',
          check_indent_unit_dts,
          applies_to=('dts', 'dtsi', 'dtso')),
+    Rule('mixed-indent-chars', 'relaxed',
+         'indent must not mix tabs and spaces',
+         check_mixed_indent_chars, applies_to=('dts', 'dtsi', 'dtso')),
+    # See also check_redundant_whitespace_strict() and check_value_whitespace()
+    Rule('redundant-whitespace', 'relaxed',
+         'no redundant whitespace within code',
+         check_redundant_whitespace),
+    Rule('tab-in-yaml', 'relaxed',
+         'YAML (also DTS examples) may not contain tab characters',
+         check_tab_in_yaml_example, applies_to=('yaml',)),
+    Rule('trailing-whitespace', 'relaxed',
+         'no trailing whitespace on any line',
+         check_trailing_whitespace),
+    Rule('unclosed-block-comment', 'relaxed',
+         'every /* block comment must close with */',
+         check_unclosed_block_comment),
 
     # 'strict' rules are opt-in (e.g. for new submissions via
     # checkpatch.pl in a follow-up series). They flag many existing
     # files and can be promoted to relaxed once those are cleaned up.
-    Rule('indent-unit', 'strict',
-         'YAML: 2 or 4 spaces per level',
-         check_indent_unit_relaxed, applies_to=('yaml',)),
-    Rule('indent-unit-strict', 'strict',
-         'YAML: must be 4 spaces per level',
-         check_indent_unit_strict, applies_to=('yaml',)),
-    Rule('indent-consistent', 'strict',
-         'every line indented at depth * unit',
-         check_indent_consistent),
     Rule('blank-lines', 'strict',
          'no consecutive blanks; no blanks at node body edges',
          check_blank_lines),
@@ -1081,37 +1073,43 @@ RULES = [
     Rule('child-name-order', 'strict',
          'unaddressed siblings must be in natural-sort name order',
          check_child_name_order),
-    Rule('property-order', 'strict',
-         'canonical bucket + pairing + natural-sort order of properties',
-         check_property_order),
-    Rule('required-blank-lines', 'strict',
-         'blank line before child nodes and before "status"',
-         check_required_blank_lines),
+    Rule('continuation-alignment', 'strict',
+         'multi-line property continuations align under <, " or the value under <',
+         check_continuation_alignment),
     Rule('hex-case', 'strict',
          'hex literals must be lowercase',
          check_hex_case),
-    Rule('unit-address-format', 'strict',
-         'unit addresses must be lowercase hex without leading zeros',
-         check_unit_address_format),
-    # See also check_redundant_whitespace() and check_value_whitespace()
-    Rule('redundant-whitespace-strict', 'strict',
-         'no redundant whitespace within code',
-         check_redundant_whitespace_strict),
-    Rule('value-whitespace', 'strict',
-         'no whitespace directly inside <...> brackets',
-         check_value_whitespace),
-    Rule('node-close-alone', 'strict',
-         'closing brace must be on its own line',
-         check_node_close_alone),
+    Rule('indent-consistent', 'strict',
+         'every line indented at depth * unit',
+         check_indent_consistent),
+    Rule('indent-unit', 'strict',
+         'YAML: 2 or 4 spaces per level',
+         check_indent_unit_relaxed, applies_to=('yaml',)),
+    Rule('indent-unit-strict', 'strict',
+         'YAML: must be 4 spaces per level',
+         check_indent_unit_strict, applies_to=('yaml',)),
     Rule('line-length', 'strict',
          'lines must not exceed 80 columns',
          check_line_length, applies_to=('yaml',)),
     Rule('line-length-dts', 'stricter',
          'lines must not exceed 80 columns',
          check_line_length, applies_to=('dts', 'dtsi', 'dtso')),
-    Rule('continuation-alignment', 'strict',
-         'multi-line property continuations align under <, " or the value under <',
-         check_continuation_alignment),
+    Rule('node-close-alone', 'strict',
+         'closing brace must be on its own line',
+         check_node_close_alone),
+    Rule('property-order', 'strict',
+         'canonical bucket + pairing + natural-sort order of properties',
+         check_property_order),
+    # See also check_redundant_whitespace() and check_value_whitespace()
+    Rule('redundant-whitespace-strict', 'strict',
+         'no redundant whitespace within code',
+         check_redundant_whitespace_strict),
+    Rule('required-blank-lines', 'strict',
+         'blank line before child nodes and before "status"',
+         check_required_blank_lines),
+    Rule('unit-address-format', 'strict',
+         'unit addresses must be lowercase hex without leading zeros',
+         check_unit_address_format),
     Rule('unused-labels', 'strict',
          'every label must be &-referenced in the same example/file '
          '(skipped for .dtsi/.dtso since labels there are exported)',
@@ -1120,6 +1118,9 @@ RULES = [
          'every label must be &-referenced in the same example/file '
          '(skipped for .dtsi/.dtso since labels there are exported)',
          check_unused_labels, applies_to=('dts',)),
+    Rule('value-whitespace', 'strict',
+         'no whitespace directly inside <...> brackets',
+         check_value_whitespace),
 ]
 
 

-- 
2.53.0

