Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3E33D4116
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739708; cv=none; b=JOXNuLOlGKP0kJKiBADDN4H/+h8eTg1nbfHxFBYf55b1r2YNJCc9P97LlU+FDNWZZAcpxnmu4uJouDWQ/3aqUnpBa3DF4pxbmyaD1zpDBq4iYUi/sj0Wv21xTLu/YYasP/oJpQANTHg7HkGyPf0E7rz+lYcCaYRa7/KPAGD0Yd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739708; c=relaxed/simple;
	bh=aDvEkqQt6kelBDrugNAS/u6ayLc9LYlkgOGqmq/x7Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgpp7XmGi5R+SWtH2dHE7w8Lg6fvF0ylliZK7cvKIf7llWfCA/rIDbCqdhS6O/Nuayxz6AhLMaz+XDBUB/LBhI/311ezCsilhfg5xqjIxADUqTAY57wB40ta1Kk63d0SEiAzV5LnLaK9tJOrfQwDF4fQgeKjnrn4R9TlbJHaMS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3Ui3Yes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcWTqLuf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3Ui3Yes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcWTqLuf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGTMw1658488
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5w1Cg0zBsR26u0WpOExxHjYidIfSHKslGd4PsdiEYTo=; b=C3Ui3YesxvBn8IS6
	OtHYKPb8mdG4wl/zT0n5H8+1N8Z8I0D6Il1cgiVaDVtYx0JTVHffDMVwk44sfIYo
	XjhuT76R64Ka3Oz1TBpqkumqgsvzD62Z7SoCILhA/GmBOykbmhtnV/8cdvZwfOcc
	p1CL3RQdSg+mzl7rnau7bldg+OxvlKQMju5oGXzHBTD5rhK0HDhmBfZk5R75pW/8
	BCaiLSBWzeCPY5LGTXeL4gOlUIB/jhRkTF+meRaS6WDNO6FXyUcaSld0E77vTxyZ
	mDlsxDQm6qwR/BeClKOqc6p4YSJgib67Wlo1/HfU9Zzu8iVwnpMC/10qHU3NsWyV
	eMXKpg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1rr9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90284139cceso17489266d6.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739705; x=1788344505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5w1Cg0zBsR26u0WpOExxHjYidIfSHKslGd4PsdiEYTo=;
        b=AcWTqLufHKDTlMb7U2ND2vwWamwE7vUb0r4A0YqKiKTb7/YSsXG+L/pZYP91q73wDF
         4NCGE8ZWiPzYLsRemKdrDEOH9S5oHyt+7GwYUraU2LCNkOPb0VmZTNJ3XQW/iyBPZUBx
         BVfoOW0NQMi/YeK6IHmR6Cf5CerwSy38AJPajwNtc81LZAwAZwvcXkVMjbmsB3QmEIMM
         uSFsvE9xiYFPrnWT9ONJ0I02T4RO4R4LLWdGDNsGi+iMyeN55QCnOOR2+n3Lp2fXHHSa
         OXolu0NPq8m6Je9/bymLXBFHCoRB0Kfd3+hbkhje6ikrRHqCYnE6ZY9LkIGQY2sIJR1M
         XSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739705; x=1788344505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5w1Cg0zBsR26u0WpOExxHjYidIfSHKslGd4PsdiEYTo=;
        b=PWgAF5HQIuQ5Yz8+zL4QpC2wlrFocqT/mN3WibW8pt40NMd0XaCR+4SREle2gkdQso
         eIEkO+CIBP4sqAFLLF49wOJ04TBhM6IQbtNlUaqqsjscuD62lFbqqvJNcX8RHQx2uXwX
         95Lz6hRkzpwD98ettpXjpuPOYOqk+48CvF8KjOapbN0R5vJoIavCB95S6mmHtQ+9wlYn
         4GkM11Z1PSJB1/tVSb9QKJLQPaWwUCs1kTwnFBBCTBfwS6sUnxgTz8dQgyASH3fMN9TC
         Bar9U1aH9BuuKym/XggY6wmVxByOLw/uTwAsb8tj6LB4q8liAMEEPH3rGnwCn1kucXaT
         hnPQ==
X-Gm-Message-State: AFuF++n3gjjKwxkWOTRkkcnQAFX8jLpC8RjfDWXdGS0ZMzvDzKyDvEOy
	rVr9/dmrT1ycvBZVitRE2gFX4/Ro8kVt7AlMY53kP0S7cPShLl9XEeJypGUg8e/sh3MaPc6RcHr
	rn4aHmXRuKeYB/wGK5LcZpHSa4W11khs472oLkJDQ1ZyfMTAev8WzHzQMpvAqgkkp
X-Gm-Gg: AR+sD10N0ntlauk0sXZntLnu7p88QdSl0kiKMHkWlUiBGo0HhFPZxrvte5Wf7ac7wab
	55YqzUylTIJa0hJBArhRQvShG4iqSaD+lvHSEf2uWzszg+DVn0PV+x3IRbq4/ZD7aTjcLDhMq9X
	/HFSDFEhpR7nkjZa/73nPh1E/ilq6jn07RHs2gyv56VN0L3an2tIkfkaBSEicsSeN4w8QVzTAvL
	YtOjWVEliBKJb5lpC8ozdP9ZIHDrNGWQEoOTcLb4kH5AqplS11vBvWIWdXgjWKPhForlUgeeJb9
	hIN6nZxXrpVIS8cy5Kwp7ui2QC7D5OG4bqE/zeiFKDoalJVvoEzP6K1cdBi42NkL/kO+V80AhAd
	3mx1/7IRG6QvH523jih2SkNU=
X-Received: by 2002:ac8:5a93:0:b0:517:c65c:4987 with SMTP id d75a77b69052e-52e2ed676e5mr130217141cf.22.1787739704957;
        Wed, 26 Aug 2026 03:21:44 -0700 (PDT)
X-Received: by 2002:ac8:5a93:0:b0:517:c65c:4987 with SMTP id d75a77b69052e-52e2ed676e5mr130216901cf.22.1787739704547;
        Wed, 26 Aug 2026 03:21:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:21:25 +0200
Subject: [PATCH v5 04/10] dtc: dt-check-style: Consistently call 'kind' as
 'file_type'
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v5-4-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3656;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aDvEkqQt6kelBDrugNAS/u6ayLc9LYlkgOGqmq/x7Hg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4oa+DCvN7lMwUoKvVV4IpMx2bcwwa8ZW4jf
 +WUORXx5GmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+KAAKCRDBN2bmhouD
 1yUtD/oChlggxciwQFVgzJ3wcaF7yHouUyk9i5YbEbgShc7N9sxJcktXN2v5rAb8uh2eSrA2wte
 BHlmtosRJTh5vdoNNR9xAn48dqX2DPm9KQJKM4+2Kb+3djR5mnbPTED5QsuqALbKaetxJS0Gznl
 nBJ0uyzubo8UoUqmHlfTeWGMwNjDBKkWhu2SphjpR1sEFhtATF+TpmLzq+NS1SKHAeH7HnNtbgs
 6R+zfbuDbxig66MKZZ16rJ4cb/9QJMTMRzodcQpI0u2uD8NkRuOZk36z/OdNr3YDGsIwmhxrubi
 25R40/Jwk1JCpsCDALA6OHuV7mqIhJeqv8Zq6YsCkOu9QHfqVGCLNPwTaRNxeBFoSrFgMjkT6M5
 WgIpnA54/yafULECxAgGVK7p1KNKAe5a8fckpVoYYCHf+x0zg3rbOZvp+iFJoMqIZ/quPOKpqCW
 l6Omj4oORX+LtN3zu9uBY0+KZ/W2EItn5BZ29nqbf4wIuaw5UDY5+UcSFV8Bl1ibOeVF+Xx1xIE
 hFg8mdompSTeRG3IeJfcNGxDMzUhRRX5ArtJyLxIRdTweys9v6Bmsd7/4HeeFp/JnhHwjxITzo1
 oB7OHqOCVTCpMLC7wXBOgmcDLQJNISXvtv9pHLitbX9ODu6UNwZYMPb1/2hxGbF/Qpkqn2QC7o7
 2vXmYufS6Agk1Bw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: TZmsOvXww2zHrDGLg4Z6OA1or19euT1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX6qpr6kxzF47/
 0UAL3nn2ZDBfe75JG/WOfTLNmJCObyys3ahjZlZmtvNgaUlvgP1Dkc8xon1roxiLl2b3GHuXBU6
 SJQVrRL+sVCbzK3kijx8j54yvqHpWBp9Bb+x0WYOVxEv3y6Mu/bthETmv1TIcfB/aSEtnBwhq2Q
 LCFNLXpxaStrwoRo7sjsCxCn+NdwoFgd4PYi+CTcnfM/fDlrlqarHcHgnG8KFrIEF6p9HxI5OnS
 +ZH1diRzdYVwwiPvXKAjruekY+JPbA7rpxudME+i2yZAx1lW8lZNdTkjR41lQH9SBWN6Yj2tY/F
 hJRFsNhpAj1/Gh5O1iunYIRaLNt9YAe4ZuAHCMyuE4OWqFEOGh70q9U1x3jRAJovksw+RKmzZOU
 vxdPk2/MplthdN1HvX9UWUjxa+BzQgfoUksdmAmqxlAi/wnTpjC5lg3HVC5kzvf/Zrb7uH2jJ9o
 mf/pHtWp864H4v5PO6w==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8ebe3a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6JaV1sFd9OF9Hac_-DgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: TZmsOvXww2zHrDGLg4Z6OA1or19euT1M
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfXxnDkfQL1cHby
 BMMLp58/7lPSI80g33AQR+zxB5Np+V8C1XU1n0Q3r8ktOMUWwjtXEEeYlR0Knr/mNf3UXaCJGMz
 y/P+rirTO6VBpx3rWI50ITqBQ19BbB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

Script was using different names for variables or attributes with the
same meaning: the type of file (YAML, DTS, DTSI, DTSO).  Unify 'kind',
'input_kind' and function input_kind() to consistent 'file_type'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 5ca477d60889..8b3c9e2fa987 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -314,13 +314,13 @@ def collect_labels_and_refs(text):
 
 class Ctx:
     """Context passed to each rule check. Carries the parsed lines,
-    raw text, mode and kind."""
+    raw text, mode and file_type."""
 
-    def __init__(self, lines, text, mode, kind):
+    def __init__(self, lines, text, mode, file_type):
         self.lines = lines
         self.text = text
         self.mode = mode               # 'relaxed' or 'strict'
-        if kind in DTS_FAMILY:
+        if file_type in DTS_FAMILY:
             self.file_type = 'dts'
         else:
             self.file_type = 'yaml'
@@ -1071,14 +1071,14 @@ RULES = [
 ]
 
 
-def select_rules(mode, input_kind):
+def select_rules(mode, file_type):
     """Return rules that apply to the given mode and input type."""
     rank = {'relaxed': 0, 'strict': 1}
     out = []
     for r in RULES:
         if rank[r.mode] > rank[mode]:
             continue
-        if input_kind not in r.applies_to:
+        if file_type not in r.applies_to:
             continue
         out.append(r)
     return out
@@ -1088,12 +1088,12 @@ def select_rules(mode, input_kind):
 # Block runner
 # ---------------------------------------------------------------------------
 
-def check_block(text, mode, input_type):
+def check_block(text, mode, file_type):
     """Run all selected rules on a single block of DTS text. Returns a
     list of (lineno, rule_name, message) tuples."""
     lines = classify_lines(text)
-    ctx = Ctx(lines, text, mode, input_type)
-    rules = select_rules(mode, input_type)
+    ctx = Ctx(lines, text, mode, file_type)
+    rules = select_rules(mode, file_type)
     findings = []
     for r in rules:
         for lineno, msg in r.check(ctx):
@@ -1150,7 +1150,7 @@ def iter_dts_file(filepath):
 # Top-level processing
 # ---------------------------------------------------------------------------
 
-def input_kind(filepath):
+def get_file_type(filepath):
     p = filepath.lower()
     if p.endswith('.yaml') or p.endswith('.yml'):
         return 'yaml'
@@ -1170,17 +1170,17 @@ DTS_FAMILY = ('dts', 'dtsi', 'dtso')
 def collect_findings(filepath, mode):
     """Return a (lines, count) pair for filepath. lines is a list of
     formatted output strings; count is the number of findings."""
-    kind = input_kind(filepath)
-    if kind == 'yaml':
+    file_type = get_file_type(filepath)
+    if file_type == 'yaml':
         iterator = iter_yaml_examples(filepath)
-    elif kind in DTS_FAMILY:
+    elif file_type in DTS_FAMILY:
         iterator = iter_dts_file(filepath)
     else:
         return (['%s: unknown file type, skipping' % filepath], 0)
 
     out = []
     for text, base, idx in iterator:
-        for lineno, rule, msg in check_block(text, mode, kind):
+        for lineno, rule, msg in check_block(text, mode, file_type):
             abs_line = base + lineno - 1
             ex_tag = '' if idx is None else ' example %d' % idx
             out.append('%s:%d:%s [%s] %s' %

-- 
2.53.0

