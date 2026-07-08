Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6E73B71B5
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521669; cv=none; b=IsIzO73oOCTjYSBrTZBsVLvIIUydLYF77secLNxrNlUBT4ZYKoBhX8f2jlRGiboWEAYr5P93q7yN7iV93OmYjhhV9SEOwctUgUTlOOxIaLE1MW8taMZy0dwrNys7qP/aT++0y44MxdgrB0L81J1IyZ6otZkH2pjqFZnw9pq+Y5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521669; c=relaxed/simple;
	bh=tubZzguL+WhV27foJbHxv2tvacR/v4H8iT/wG+L14fQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=luQ5VXtCqEo1ucRbZdQp6otaOuQejkmPDNpa3g8bj/j+SVKxQ+AmMcQ6O3noHFP6b96K5ZGW5twds+TSbdWFYFZD53EASoihWYSfUPaGKZnIokJ/RzAC3wC6Jiwj7QBoIDd5vvIDvt7cCCfzPmOaXQtFloqAOOI/1U47MFX2OBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axdkQMAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nm1cKZ5X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axdkQMAI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nm1cKZ5X"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3acu2727603
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qok6NGQ/qJpHcjWeRsahVyAkUCO3bYjcuHXJFMe21tg=; b=axdkQMAIO46M5UEF
	TYy2w30LO++wd46Tf9IQIjizIXdIR5fUYYRMsLOJdEY0avnqge3/kwKxKvHMtFyG
	aFQ82fxmi8EVfvaqHgsbdx1Zef692nsq9FicgpB9QT2MLiBQMFXWjr24KdUUgKc6
	JTZ2P84hAqtHJIxzZWVo5LFc8zQsq0OHznt2sEEX13rJZe2C3871MvQHhFSwoyKV
	SmUoriU55X9YNljtC1o1pfMHqsPIj4r//Plbr4EWHoEMuPmOXbBsh9GSTbFIKkbW
	IYXfT/zKEawhzihKAXkO6Q/Ph1G1+0qC/ZVQrSsT5uy+xRUAdpgfQjl2eBa9VlfV
	bekkxg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6ab3k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:41:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso9363781cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521665; x=1784126465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qok6NGQ/qJpHcjWeRsahVyAkUCO3bYjcuHXJFMe21tg=;
        b=Nm1cKZ5XkgpFASKutHijPuSBI5vRpEJ+veE2hYILMiZS8S3z1dEsnJgpGdbHYNdHYw
         Kih+b2MS8rEHrfeN0i/yzhtaiTJihwcUb7rbACBAQN6JycZd48tTeVOvHQ9bXdjAqCtg
         dTuNyjxmXlDn1yi2hdisa9GxXzL9LOEIq6Spqp1XyDHDXwjgbzV51i+MHJ7M/h5Fp01d
         VXi9306IIjwHXuLZ+vAOSM0zmOJ6g/HmCc48e5RA8aJTQKaFQhbNFsk8Bi4Pm/5BZqCN
         fgUIMIxD43nd1t0wYdxUpanK5BqlCECpXfDMcEJClBa9IesfncwqHn9xtN15A4nliiA9
         RXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521665; x=1784126465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qok6NGQ/qJpHcjWeRsahVyAkUCO3bYjcuHXJFMe21tg=;
        b=H5eEHcnM7QNdn9XKVQeKoWxllWJQr4+VyjyyeXJhhJzNNTKd2zyAjqjEQoXCdpA+3V
         tG5bIAoCekacGyz5DAAn3dWrw3xLefCyBopSb5hYdirxT8hiCkaUksRNqqepMlrEuQBq
         hKad6+MBTlxRxu93of5p3n17Dp/KUNjuIruat2CjyUYo3DpdEqT1boCcpGvQGZ0sY6Ne
         R8Kd/NCkl/BCDp5Xh5vYsFIY3CDynaCNEk+6KLIl60MxZtLnYht4/x6nfCmPVynpXCZ6
         OBBN+lXsfQ9d6qcQrG1KmlmfidTuRNtNDYoWA7HDopWUfRporzvsDyauX0caQVPgcfzU
         sdJQ==
X-Gm-Message-State: AOJu0YyL5NFlu2LUC8DtY71ZflaArXnW1N0w8GTJMzsHcu1C7Yu4tU1q
	egZ5Ai+G/hmU4dIFsc0uBWFdKgoz9Wrsdqj9brCnS36qM9TLHxhys1ZIbWS/vzR63caplKY5tYB
	SARK/DNgirsgP9f0R7n4surYw0aUnuUp/26/Oz0AhpbfWnjqoFVHMXD5ezohSxDvf
X-Gm-Gg: AfdE7ckX2uY3fNFlhqZMC3EzZzWGP9d4mmYSm8mp6OHzIRZlcb7I0sfKAbc5gijd8DA
	8iN2hi78yRvNwBmuGZd+CR1Zuh890LxMkALRYG4ekWxxB+jfOWaK5RyAg63NIJ+zE3zDlAIBXen
	ThizoHIhGXcbI/Xl15OIgDTadDgUEBSopPkiqJVQp++OLQm8FIcMtqMoYJz7JBDaO/oNQJvdBYm
	pbMBK0BWFCoT2s2BLkjz91xKjFa0FJiIBrxVt1BzidWaMKJZemvmNhomKPoT3jTHt7ZJuTSL968
	Xe58BSwCpm25V1eCcpEukxWuC8+ZZfWJ1BNKuWL6ZRBjDKo8QwDWOkYrZxRQfs6YeI5p3y/v6q6
	lr5/tIr1H8IIpFgZy2I5nUrRty0nIIAVIlsU=
X-Received: by 2002:a05:622a:11ce:b0:51c:7e12:bf58 with SMTP id d75a77b69052e-51c8b3b5905mr28410751cf.48.1783521664924;
        Wed, 08 Jul 2026 07:41:04 -0700 (PDT)
X-Received: by 2002:a05:622a:11ce:b0:51c:7e12:bf58 with SMTP id d75a77b69052e-51c8b3b5905mr28410331cf.48.1783521664488;
        Wed, 08 Jul 2026 07:41:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15da821c58sm52543766b.48.2026.07.08.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:41:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:40:36 +0200
Subject: [PATCH v4 6/7] dtc: dt-check-style: Print proper line number of
 indentation detection place
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-style-checker-v4-6-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
In-Reply-To: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4041;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tubZzguL+WhV27foJbHxv2tvacR/v4H8iT/wG+L14fQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTmFrEnhjCUTpy3dsYlWg/R1MZ3ISWDy79pnEv
 VUfDGrY7Y6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak5hawAKCRDBN2bmhouD
 14BlD/9JlEck4aFElc5T6teC9AQVJGHmw22JzhOgHgwVmGDuC3hAFZZ3QwZet9t4vWg8EENlraI
 LQC8KwEJ5v7Tf/S2/7QCEa92OuVRr8j9ipWajUZ6+daWDinZsSUr8wBXqA2Gdp/pPZKsZA3XILg
 /aMEMqD1uJVprh31x0m4jSDhpQzY8ObkREf/YL5DiHpzMHxGQpCchHvj4xboaSmLivvojZLQgzr
 2RIX6dT7lXpRbPpZJnH2oA/XMOGcwd67qJcrmbFfwJmQmx3bbprDkKRo+2mgUyKXNowOEC8XKtf
 71IirR09gK3GM8/eMZ01jutTlPS7dGUk0VKxSpH7xVOjgD2pqxRJ/tZoMjNvA7NkcXRnS2lx4jx
 BQd9FlOguYCaHAb2NO0Juh68/QZeDF1A3+MtP16UjgGStjDcA2LrBqb4LwvzFSojMNwetySOhNT
 DIOyZDKahrc2xyYnJL/KEF0FxjmF8EVqV+VZnFY126vP6fPjJlOGvcHBg4oKj6UGa+ugQDX3Rm1
 gafLZI2i84LwdmDK3tjaJvgKmo2NZs7CXE2UZFrAUe3Wat6FVJIVTvHAzsQuBAWkP5Rzu2PlWPR
 f2JoKWFBzMYDHb1vMwqtGq7lQP1aiGQepqOxHgt3kRu23QizHI6FQXBT1llflkRYS4pAndBsWvF
 OGb3mho+pkxa0Zg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX8xJ86kdq0YNX
 ogGPcvQo4BS7TVQF9hszNLvW0OKBGDdPoCHIxfZvmJN6u9Bc5BL+Bx8jzjWBXZePCMJLPe4TBkO
 963+y/c4w3y+rxna5Eb0yM3qabnIJWUZERCGtwTtMm7gce80jiDZfWHBixnupKomaYbudFjnQAj
 YaCAPf10dc+cg9mCzOMmS66/KxHQ4yOu0ei00Djq4vuOMioY1N+iYeTGq7sfb3T/4YOJWlseo+T
 H7hqaw5F2MQ4NGAL0DOxPtchPMb0p86D9g5M9Zm1A61QQ6TpsQhrKVVaQpce1OQRFpnaOcfp1JP
 wZw097BJQTqhK1lDcJZ3MnV1Sm6bAAvUr0kWfcTjRRrtassDgjC3AY362FuYtkGw9LRVf799ehE
 ou4KWE9GRvY7FvfMdfqYrLwsJGxMcj+I3hwjiz8xslOw/MiD/5IAsGcikrJuLAQ/WnfvX32+1F9
 cio5MU3WXlDh4A8WRVA==
X-Proofpoint-ORIG-GUID: WT45ZDaGvf_gbCUx62FTZ75rNiFud39v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX+IgTETlKZkb4
 PoKduDCLeV6ibfCOzfm0qBG6PUbijec1eDTgsPvorSXg4G9qhHCdlGqmn9LEoxX4lIRpyGw8Ilp
 TpbhIj1qo9bA6ab9gZ0dLafQGTyjBQ4=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e6181 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eNj6vmoAg1EGTkcKitEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: WT45ZDaGvf_gbCUx62FTZ75rNiFud39v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080144

Script judges the indentation however always suggests it is the first
line which is wrong, e.g.:

  sigmastar/mstar-infinity2m.dtsi:1: [indent-unit-dts] indent unit must be 1 tab in DTS, got '\t\t'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 24 +++++++++++-----------
 .../dt-style-selftest/expected/dts-spaces.dts.txt  |  2 +-
 .../expected/yaml-indent-strict.yaml.txt           |  2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 9a5263a30663..df056e4d0a5b 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -397,48 +397,48 @@ def detect_indent_unit(ctx):
         if not dl.indent_str:
             continue
         if dl.indent_str == '\t':
-            return '\t'
+            return ('\t', dl.lineno)
         if dl.indent_str == '    ':
-            return '    '
+            return ('    ', dl.lineno)
         if dl.indent_str == '  ':
-            return '  '
+            return ('  ', dl.lineno)
         # Anything else at depth 1 is non-canonical; flag elsewhere.
-        return dl.indent_str
-    return None
+        return (dl.indent_str, dl.lineno)
+    return (None, None)
 
 
 def check_indent_unit_relaxed(ctx):
     """YAML examples: 2 or 4 spaces. Never tabs or other widths."""
-    unit = detect_indent_unit(ctx)
+    (unit, lineno) = detect_indent_unit(ctx)
     if unit is None:
         return
     if unit not in ('  ', '    '):
-        yield (1, 'indent unit must be 2 or 4 spaces, got %r' % unit)
+        yield (lineno, 'indent unit must be 2 or 4 spaces, got %r' % unit)
 
 
 def check_indent_unit_dts(ctx):
     """DTS files: 1 tab per level. Always required."""
-    unit = detect_indent_unit(ctx)
+    (unit, lineno) = detect_indent_unit(ctx)
     if unit is None:
         return
     if unit != '\t':
-        yield (1, 'indent unit must be 1 tab in DTS, got %r' % unit)
+        yield (lineno, 'indent unit must be 1 tab in DTS, got %r' % unit)
 
 
 def check_indent_unit_strict(ctx):
     """YAML: must be exactly 4 spaces. DTS: 1 tab (same as relaxed)."""
-    unit = detect_indent_unit(ctx)
+    (unit, lineno) = detect_indent_unit(ctx)
     if unit is None:
         return
     if ctx.file_type == 'yaml':
         if unit != '    ':
-            yield (1, 'indent unit must be 4 spaces in strict mode, '
+            yield (lineno, 'indent unit must be 4 spaces in strict mode, '
                    'got %r' % unit)
 
 
 def check_indent_consistent(ctx):
     """All indented lines must be a multiple of the detected unit."""
-    unit = detect_indent_unit(ctx)
+    (unit, lineno) = detect_indent_unit(ctx)
     if unit is None:
         return
     if ctx.file_type == 'yaml':
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
index 070025c4568c..5afdb101dcee 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
@@ -1,2 +1,2 @@
 # mode=relaxed
-bad/dts-spaces.dts:1: [indent-unit-dts] indent unit must be 1 tab in DTS, got '    '
+bad/dts-spaces.dts:9: [indent-unit-dts] indent unit must be 1 tab in DTS, got '    '
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
index 5ef290d3a847..c4f31deea4ca 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/yaml-indent-strict.yaml:26: example 0 [indent-unit-strict] indent unit must be 4 spaces in strict mode, got '  '
+bad/yaml-indent-strict.yaml:27: example 0 [indent-unit-strict] indent unit must be 4 spaces in strict mode, got '  '

-- 
2.53.0

