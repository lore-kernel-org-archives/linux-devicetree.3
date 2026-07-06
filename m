Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFDE42A161
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353242; cv=none; b=XgzMPLr6PsOvrEpqWuQRYGfb0UXKb5zOS55Pfb7u6Ogz5/RwBd/3Dx5lxdsXiOiQWS+y/vtYJEbNYpD4tj5SbAnVMGmU0q/3DIiOLipWVbSHlYr7H4QEKNmcXyHEZtRUHb7JM4yZJpGotRAh6HdckEoBZQHBqzskzlGCVMaEBHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353242; c=relaxed/simple;
	bh=pC8luel+ZucUFbeLSP0MGwZNUPY63bSBZN+ZQQWmGcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C35jO4RkHlQPpzSJIEOypq7iQ8iU8P+BA9NAF1WNFNLpYpu0DNBIBFHlyKCgx075Pm/SF9Buq2/uedM996SPDca7Iz0gn/WOtKoCvB3GoDgjhv5fNHAiYSdzusAobx2KlG5T6stUzYqdcS9GT9XQTPfcfQplNrm5niaECCxf38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFp1P6Ow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXNfGR0Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFp1P6Ow";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXNfGR0Z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFIal958831
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LqLzCSXA/jI2AwFh/R2KfkAVC4bW3qzNnUw7cC1zuE=; b=NFp1P6OwUp5R/dWE
	zbRdf1rAObWr1niiwKpDmLal7IsLUO00A7AfHaMu6q+9MU8f9zi03K0bOCor8De5
	I7orjOKCWJ6/WGOm4wmfUiI8l45LBkqrw9MS9oIqSLAsUGHfnmYG4V2YPYYn6HRU
	pKdxV+698DuflO4vmkcgDCqZJuPrGFjbNWkZmm3a5m9DGwvMSRchjE7iBQwdmJNt
	BV6ZzS1LNHYhr/JQ4ezPXqvd46oLIL9MsX1C5s/VuodqAWNYbiC5bnyEmNfUuQqn
	hCqFvLNzIPEmrmnltlXOdBxIgj4DlnVxyULKzMqRTR/U6VRo62UJVgni4jV4TXHZ
	WMXNIg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9a3vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:53:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915f6ff639aso576981985a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353239; x=1783958039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LqLzCSXA/jI2AwFh/R2KfkAVC4bW3qzNnUw7cC1zuE=;
        b=PXNfGR0ZnWCoXepGBJdPxjdsyidW1oROTtD9kWl3oQq0PiyXygP0tFi961U+I3bBlF
         P7l8DGepSTT4gfNG5FRaPA04BykBFsvCQkuoiZ/TXpIbSL+V//NUgAd38wmI/mXr0igo
         poGuW78zK3Ux1kG2O4fap5yh36u1zNN3ytQrEMYAOy6O4jbi1FLtKNcc149L3L8fZpE2
         GepVZ14t3vGOVQXv8JIaPsgoaIHBCrAWcCMnLW5fn/YPRWbwUw7S3Y3lbBmQgA5FABAm
         gi5gAqBMAwXPKka5B/p/RodAVHOOIwqkBpYEqexSuj2TqGfdcDGu23uxRRFHhBV6vrhm
         43fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353239; x=1783958039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LqLzCSXA/jI2AwFh/R2KfkAVC4bW3qzNnUw7cC1zuE=;
        b=ry4ife11UfgC1KIIorSyzfK0tB6Fc5UwjlQMITK9SvGjIQbkH0UiGqEZ0tGIdrzVjK
         VZ8CRRz+TbLozcV/xvPBhhFArOtrCtjWU6xnoTls+KwSkGYB06B1vZoSO++Mkz6GZR7A
         xImfVzwPhiYcWSSBqEIy4DRKpUF6FTfJPNPc45neDpokfxz5MkPwA1VoTnDM0t5D6Pel
         ALJ8B4SKKGR5RFSlP04EAjB/M+a00OLsybhs0TAgYUnLOoGpdBVe2bl9SZaZOVNXSpJF
         VTgjgk5+qIJZV3OAl2kyP7j+gRNNUOKkFE8Aj5v0FG8LkVQpDSleBBziXofpmDsh2B7q
         HvrQ==
X-Gm-Message-State: AOJu0YwXegxAJO4rl7WCvXRwqsIXpuyOPwrGPn0Eda+8NOIHaIvyGRTh
	pmVFCc8GIlxvwF4jpWGGeUVzRCNOoofzMyKHJc3ucQkWdUgCtz8oNPlWWT8HHmnQ5vrpfLPqzK4
	mQej/K6phFRdcAwmeZHe7vCk+SVtK/uPHBjKuDdaCzdm/SNOtkhXz/ugKWi3mBrGw
X-Gm-Gg: AfdE7ck34PYjX9j83yFG7md1MQwhI7M7S1QS93M8vHoF2V/4ewuyupG3B7ATmKqdvJ9
	Y6gplPMQYjQmrm8Z7HU7VG8KY/giL43XWXEZc2HMPG8kp/8q+16G0pccWChUByWYZaWBaIwH6Xp
	jcJuNW8hXIriIF8HhHs893scDEo9HIxX2bTiuxu6qpM/lq5No581ss20RU6mMOdjDLTfDRyuH1h
	nrnSE/PvkDyEDL4Azw//jzy/mYwyrICm/nbICjP2xBieovcgZ4+gAmBxx7XzFxQrfK4ukwzGbLH
	zkCmRgW9CHt6znwf1P/oYwX8Mu9OsYujEW5fBbs4MbqCIgi+dp9SU5IBa0pHn9rkJ52yErh4rTr
	f0+z8qj3QQ5FNo5vDbvJRs0A9conUrz3gCLk=
X-Received: by 2002:a05:620a:4082:b0:915:bf79:3e0a with SMTP id af79cd13be357-92ebb4e2e31mr168393685a.26.1783353238595;
        Mon, 06 Jul 2026 08:53:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4082:b0:915:bf79:3e0a with SMTP id af79cd13be357-92ebb4e2e31mr168388385a.26.1783353238012;
        Mon, 06 Jul 2026 08:53:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm23174169f8f.31.2026.07.06.08.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:53:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:53:42 +0200
Subject: [PATCH v3 3/6] dtc: dt-check-style: Rework handling YAML/DTS in
 rules
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-style-checker-v3-3-03ffacff9226@oss.qualcomm.com>
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
In-Reply-To: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3892;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pC8luel+ZucUFbeLSP0MGwZNUPY63bSBZN+ZQQWmGcA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS8+IjxxsA3tlbSayS46EHPaMADYleSRNLH5RA
 08UY70C7SyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvPiAAKCRDBN2bmhouD
 1181D/9IUqSy/X7hiqzC4CFVjJcX2ZUCRk5t5HuT0iCmUjjUD13u5SklxvxPI4NN/fL0UbPPrk/
 Wze4S0cUS4kIeWqoEdLxNQRyWli90wrzlAV3wKx4IDzZEFsVHbMMJ2p0j3+Sm1NBESpKvyGv+uS
 E528sEka14rZ5OQWN1WYTN8UPVAqPxrXFDWUzO4EWkPKJpKcWoQhFc997aXb8lSgK3CkoXp4wJl
 6q8WSLLgp40mJyYo4RVgO0VHUo21jbD835j+hPTOuKOrHcnjbGzVzfg0weIj+sRgawtAus3EL6A
 ivA5PIJwy/nNiB8gbKV32rXJE0ZBra4Jb0oPGR8edvSpBVcP0uxneQRV5TSDa0IynZzFoE6FflR
 cRPoK0PSeRA7UFiLXzT99Mvw6+PZLb0LS4lQqfTpVjTHOmInUejdZRI8X5YlFLLaUFyGcTv39q+
 TgDlrWJbFOoRph3beaD5miun/+VcMLBjyo1A3ied8N6zUpVsUQ3iTJH7+dbcPqiXPceE8nWjiDi
 eUhFaPePjsZRo7Ffc9UlyGV7aXAGb2PVzX25SZnl101enQJLNjbPgPtguVRlpoeit3q1Vi8LyW5
 KByGch9K5dkRV/iWlai0JxxWvyLRaKhb9e+RN5Jo7TbjoofhMbE48r2iMNTXF/x85e8vtJ5dRmR
 zV6nScnTZ/X7+wg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: iXEokYLmPV_SnEEmjIZnLr2uJ-oFi7fB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX0NFjdN3DCYrR
 F4mDN5uQ5f1aTWp093vTsVdkeIlVMvOi8VStqfWvY5oMxksW2129F0aVQg1Ixnhc3dj3lZJ3gKI
 iHHGyMA8rtB5FaJHRZ2bY6XxjoJaM6o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfXwXlpibw48DIA
 56UZ3WwuRc2p7FaM+VCpi1g6fNYGhAB+GqWLT1cSGCXyKHQ05I1NLxqmASdXdgDKe/MhRfhBjbo
 xH6+nREtu5TbNA0uEjRrwZ38W5ENmvjCsgd6dP9tS4arl7Dm1dJN9dRSSnks1dG3nQlR2mklC77
 MeGsgrpUbRtx1APybFpXT2iST63J7Q6xEP7AHMTVDtIU7vTH4yeyLutVt7gJ3EY9pR+S9DJCGpJ
 pIhWRuEvtYYzueEYLbDqtjnApbtPwvv8BMR+nNLh7vCfE7CzwuyJEKvHOCbUbnvfi94OhopzQpt
 hY6jYm2IcJMxDxH8YOyaMY7et8slBZZD6+ojzQsySTRF0T1DDidDM2m4mBVwiwgujY5Kcom+HCj
 zyuKhId2ABfzZyBXEjYd072p5OnriANulg/VwdFWdunI957n3hnSw3Uwec8jjb35O2tfNjXY/OE
 uZYAmlznbwC/pwGl7Wg==
X-Proofpoint-GUID: iXEokYLmPV_SnEEmjIZnLr2uJ-oFi7fB
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bcf97 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZK4BJI6VOU2p3dBXLA4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060161

Individual rules behave differently depending whether they handle
bindings (YAML) or DTS, but the code was focusing on type of indentation
(spaces vs tabs).  That indentation is actually irrelevant in some
rules, so differentiate based on file type.  This will be more relevant
in the future when more rules act differently on DTS, than on bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
New patch
---
 scripts/dtc/dt-check-style | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 29a2ee658e2b..cf61e92d0568 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -311,13 +311,16 @@ def collect_labels_and_refs(text):
 
 class Ctx:
     """Context passed to each rule check. Carries the parsed lines,
-    raw text, mode, and indent kind."""
+    raw text, mode and kind."""
 
-    def __init__(self, lines, text, mode, indent_kind):
+    def __init__(self, lines, text, mode, kind):
         self.lines = lines
         self.text = text
         self.mode = mode               # 'relaxed' or 'strict'
-        self.indent_kind = indent_kind  # 'spaces' or 'tab'
+        if kind in DTS_FAMILY:
+            self.file_type = 'dts'
+        else:
+            self.file_type = 'yaml'
 
 
 class Rule:
@@ -347,7 +350,7 @@ def check_tab_in_yaml_example(ctx):
     a #define value are tolerated (those are CPP macros, not DTS).
     For .dts files, this rule does not apply -- tabs are required.
     """
-    if ctx.indent_kind != 'spaces':
+    if ctx.file_type != 'yaml':
         return
     for dl in ctx.lines:
         if dl.linetype == LineType.PREPROCESSOR:
@@ -420,7 +423,7 @@ def check_indent_unit_strict(ctx):
     unit = detect_indent_unit(ctx)
     if unit is None:
         return
-    if ctx.indent_kind == 'spaces':
+    if ctx.file_type == 'yaml':
         if unit != '    ':
             yield (1, 'indent unit must be 4 spaces in strict mode, '
                    'got %r' % unit)
@@ -431,7 +434,7 @@ def check_indent_consistent(ctx):
     unit = detect_indent_unit(ctx)
     if unit is None:
         return
-    if ctx.indent_kind == 'spaces':
+    if ctx.file_type == 'yaml':
         if unit not in ('  ', '    '):
             return  # let check_indent_unit_* report this
     else:
@@ -1016,11 +1019,11 @@ def select_rules(mode, input_kind):
 # Block runner
 # ---------------------------------------------------------------------------
 
-def check_block(text, mode, indent_kind, input_type):
+def check_block(text, mode, input_type):
     """Run all selected rules on a single block of DTS text. Returns a
     list of (lineno, rule_name, message) tuples."""
     lines = classify_lines(text)
-    ctx = Ctx(lines, text, mode, indent_kind)
+    ctx = Ctx(lines, text, mode, input_type)
     rules = select_rules(mode, input_type)
     findings = []
     for r in rules:
@@ -1100,17 +1103,15 @@ def collect_findings(filepath, mode):
     formatted output strings; count is the number of findings."""
     kind = input_kind(filepath)
     if kind == 'yaml':
-        indent_kind = 'spaces'
         iterator = iter_yaml_examples(filepath)
     elif kind in DTS_FAMILY:
-        indent_kind = 'tab'
         iterator = iter_dts_file(filepath)
     else:
         return (['%s: unknown file type, skipping' % filepath], 0)
 
     out = []
     for text, base, idx in iterator:
-        for lineno, rule, msg in check_block(text, mode, indent_kind, kind):
+        for lineno, rule, msg in check_block(text, mode, kind):
             abs_line = base + lineno - 1
             ex_tag = '' if idx is None else ' example %d' % idx
             out.append('%s:%d:%s [%s] %s' %

-- 
2.53.0

