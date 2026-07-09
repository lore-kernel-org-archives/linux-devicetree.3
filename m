Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E54195AC
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618906; cv=none; b=imhtKWjlYdIoEZbm29qvd4hjt3sTSsiyNnCvp/cK5uV85sT0h9rjtp+wHcoRzNd4ACpbay8bgkYbBivVwLhrj2MpZd+QOrhYNXZQ03yy6o3Ohzp6xW6pmIl0fobptFs/cLmwbOGP3SCUPwc6rL1E9JL0CTwhu2L4i1gUV4pmPeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618906; c=relaxed/simple;
	bh=cPk+k52cx3zcERls/C08uAkqlJGszZ6Gi56F7QHtvuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sC63RIfTMgoZOky2Mo7hWELgqBvjx3mmV5AyOi375GyjDv96pPMWP8UxxMmWtW+0AucMrO8SSzkMuhuZwEJIXoym7UfwFC+vBgickqot9Jug8bkqIWqD5r7g67R+IiB3GLIgGWeb9TXdo6ku+mRY1cd+mQDmNRdFLxWcmB27b4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXbd3P4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zp3YX01z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXbd3P4F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zp3YX01z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXEom2420608
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UroyY47lYCvFUoUH/t3BnF4GTok3nQAcb0cM2LhvS8=; b=dXbd3P4FIUDjAkQr
	jukwOPzE4dbBlb7tvvwKt4QzlbHPLreKL8s1TVlu7u/IWgyuc6YzdS+9ED0okz+K
	aa6A3itg19UWyaL/xTfB62gvAgHt0VY9L1pBGCyndsjhZJ5+7z4lzJryu1jt+PXM
	/wpQi3ntSZuUMimwuAYWgbnSWOh6Z/oJtTh6r2JnKCcXK/7+gn/7Wt45OvlEZ/9+
	lLoXU8ltpQnv4zBLXPjSju4aPOGr9QsJrvj8ZalQ9wNaNoyYw7WW0Yn5nbGcPgCE
	/dL9y+im+whHvcQ0z14+PDhZN1RSRZPECuDxNzX3yByLRxhevUW6Kekup1SGsQYG
	rokerg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj8v3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:41:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07f25de2so269801cf.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618900; x=1784223700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UroyY47lYCvFUoUH/t3BnF4GTok3nQAcb0cM2LhvS8=;
        b=Zp3YX01zy6LZ0CAQzGIhAbwdc/gV5JsfEj0eT9ACOvyRWJ8u/oJLLfKGo4/DO/NAHN
         wY7xKlVoawXheoeySBHMwA+kKWFIN2HdRTEhCFNHZ2MfxCF0mngxFo+zV/GUNRtfAMfM
         aJzJRhSOezyXzZ0CgsVEI+4Ns5t+r5q/xmod4hngDp2jcmPiKzqK+Pz15a4Q0k2/AAr/
         LqyrdRnWPs2YW9r3DQO9NGod3DN2PqYahVUcahvmUOIL8W/E5lXWbm+G2ZN/yKHRe01+
         S+qHEN5RlEXOUI9s4Okqi4pGt/HkG07eq+GvNeAKtm2JeAnR0kXeG5I+CKYsnDTJOs+B
         +QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618900; x=1784223700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UroyY47lYCvFUoUH/t3BnF4GTok3nQAcb0cM2LhvS8=;
        b=T+qWW39dJq4CYEiI0xDYS10ETIzR1oNaH4ROolVRCLyvR5P85zLkwPicRQh57o/ZbR
         Q1JWrn1LC98cMiKBBJuRYoFNsAIo2pWUbEK2k0Vp11BcFv1bZijkMQolYh9rzLySqyxH
         ZYjwWjsN1wsB0vK9yxGS+xiioAtpwEz/CqwGaOWBX7rQ2eU30PJIaLk8wEvnc/fxDSOu
         LBW/sB30KANZJgKPUELYsqd35yZDJqqMZfTEp0TLvXP7nqgn1OLmJtirc7LUJkjIihjX
         SDxcZhIaSK4WPz1aGrYH2XsC3WCM2ZqN17jYl2hXMiwthHjmAhjUvrI9yfscPh8pLHgv
         DmOg==
X-Gm-Message-State: AOJu0Yz5UWlghxp2owoYV0MCXIDsYIffmqHnRYMVZssok9Y0rjmsmu6y
	czR5LWPZKeGtxwE+Hnoj2zgwdVgMM32yPIfCDbdug51Gf+yAKQdNCE8yF7raOSOlXJZQNm2rbi1
	W3RxTWk4FM4JNOiYrcGXVa286aEZFCyAmL1zoinnYumP6hUnY8BrFCUMhVxj0HyCE
X-Gm-Gg: AfdE7ckHPMLsVjM78WmxDXwCM28xGKpVDmJ8aXnX8LP3DOxq9fx2AmupBJUJvuYghPD
	ywPJLYDm8aY5sX9VKQgMjk+nwGMGeXNBxH0llhlUtUl5RGcQ7x1TrvPppjvuxChw/vaN7vUL0ZD
	+wSOnddj2MvczCAomreLBcNWvJNcYqGTnvadv1jw/T9Fsw1pLPIbLrbarkS+XbKuvVZdm6Qi8XH
	QrgglAl4Ci3qkZRkx67Ek0Zvhz3jMzaLzd3F4k7C6jnFOwq3wF0vyNVYb/XBUqqavdNjdGDxflx
	5mKNoYXFOHG8/Pm6w2IFggAZEYavKDSO/Q9BrYh2DTDQo12WII92DJPCh09v1ELs1UrEDsfrq9g
	5BRbZzZmrrPh6sFRU4La/jv5+ub7WSL1B
X-Received: by 2002:a05:622a:2282:b0:51c:4eb:b586 with SMTP id d75a77b69052e-51c8b2bcca6mr90520861cf.3.1783618899793;
        Thu, 09 Jul 2026 10:41:39 -0700 (PDT)
X-Received: by 2002:a05:622a:2282:b0:51c:4eb:b586 with SMTP id d75a77b69052e-51c8b2bcca6mr90520641cf.3.1783618899413;
        Thu, 09 Jul 2026 10:41:39 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm55174048f8f.21.2026.07.09.10.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:41:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 19:41:31 +0200
Subject: [PATCH v5 3/7] dtc: dt-check-style: Rework handling YAML/DTS in
 rules
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dts-style-checker-v5-3-fcc147cb697d@oss.qualcomm.com>
References: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
In-Reply-To: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfXw8OHt2Mu+JgO
 a0MeRP0+3BIWzYvNHGwzcEskpZVWEM+u7KSkayO9G9MxEQxUa8K8PEXWw/mS/TDZ7ii+aZvFHv9
 2IzfT/pDaf9MBuP93ovxChvKQyZtCdpE7VIVQMIw09QQFOpluNfb5ri8Q8pLT+wc1ZvpRBrjojs
 jNfSTDbSHpUkw495AnDd74OZGY8pZ5UKMuVM4THtSIW3kmesnmSW9pbP6E/Nq4x82tWBD2v9UDM
 Ilm0z9wfn1H8D6Xgfj8Y5gUJDJBzj3TX3GaLjfARbT2k59OeLJ3Vt05jwdD3ppchz8p/KuB3DtS
 vJVsY6SFPl/lIbK0vnUwPdcwAfc252EbCuxITkuEVUM4FRjv5aoMjR3sGJz0kW6N48CilQf7Sp8
 VNuTAVH4FwUt3vJFJSNe4u9MI2pF4GPqLV/AZU6I+9acWShUlY0ZSPAomGSJCEXeVQcHUJMtGiS
 4ghBk6Sfa6zAaKJ3iIw==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4fdd54 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZK4BJI6VOU2p3dBXLA4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: dZJ8aWmFaSs495m3XP4UCtkPCogEcErc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX/dKYyTRYXzve
 2fcOjlLEyiGio4BP7NiCTY362xpYnexsWgtBppEVWHXBVwQELx/ww52rXe8fJsqqkEhhxA1DLbB
 vsR4Gqpc2Y6SD+w6lK6ylEdmxNO30q8=
X-Proofpoint-ORIG-GUID: dZJ8aWmFaSs495m3XP4UCtkPCogEcErc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090174

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
index e715fb1e741c..f5276b5fdd46 100755
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
@@ -427,7 +430,7 @@ def check_indent_unit_strict(ctx):
     unit = detect_indent_unit(ctx)
     if unit is None:
         return
-    if ctx.indent_kind == 'spaces':
+    if ctx.file_type == 'yaml':
         if unit != '    ':
             yield (1, 'indent unit must be 4 spaces in strict mode, '
                    'got %r' % unit)
@@ -438,7 +441,7 @@ def check_indent_consistent(ctx):
     unit = detect_indent_unit(ctx)
     if unit is None:
         return
-    if ctx.indent_kind == 'spaces':
+    if ctx.file_type == 'yaml':
         if unit not in ('  ', '    '):
             return  # let check_indent_unit_* report this
     else:
@@ -1023,11 +1026,11 @@ def select_rules(mode, input_kind):
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
@@ -1107,17 +1110,15 @@ def collect_findings(filepath, mode):
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

