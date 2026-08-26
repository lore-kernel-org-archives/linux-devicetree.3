Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ADA37CD2F
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742984; cv=none; b=VY1iD87ezD8Z+LWvDupgUdKybJxVT3BaWkF8raOeYFktGDV4vy7v4BPHc84OWz3St4ddgXfaBRh6Am06jBU9L8Zp18LKOtOXyeadvrWgHbJrlxwgSsDdndBLX4nQjv3wGPWtAVtkcbj/L+HBhAVsmefdPvbnF8aNsVOrhjSFoKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742984; c=relaxed/simple;
	bh=Q/J7FN7gGPyhDSdt/FQ/VZn0+1FY2L615paV5EC6nxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLBm/BvWnONZ3tbmFbfQFa+Zl1chsz5kM5aN1Pi68mQCX0KLcYJNYXJKPshS3m+jKPu0L2L7nNIuKmtafD55sgscZ0Po09wLPh/U28dy5GnLTkSJB+9GZJ+1bdIMV7YZiYFkK0qHjhJpkCbNNRNrtMXMQHXhTDnz2Rr89XWgdto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4qFOAvl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQq7lFbk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4qFOAvl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQq7lFbk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGqc6972280
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nx72tm3aLXOwX2pw8bT1HprONt9gl/DnSxMz4SHqnoU=; b=o4qFOAvln5+/MuKe
	Ql06AQf2eHJUUe8MY+r7M+E1hGoU69ncBiIOvGpNClvoLSRZHMYKS7454nXrcWDJ
	ew+orQsqKMAZgiPpafH1/MkBeSG0FDUTJSKqK2BD3AhbCu0cuEIlOHyKdv6oRkHs
	8AQQO5YcOeETkE8/1lhYpKv9TGLbt3Sg9myPTgn6s2/63VzLARflirXTzlAkf3Mb
	8J7NQfmcDcK1xYsxQiSQMYpRenW/Mh1PU9i8oty/7eHVGU0kYHoQtkQHYm5YcWoe
	PyMwEx2B0Hm3WeBs6v9ZURp9XmELQv5qy3Q1g80KEddgzLEhU5KfS+f9UALhVyUO
	xTuN6w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghrrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso23927121cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742972; x=1788347772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nx72tm3aLXOwX2pw8bT1HprONt9gl/DnSxMz4SHqnoU=;
        b=RQq7lFbkFAJh3jayP+lTQa1tMZWed5wK/7eJXZlZOISxdadAdgugwm3cqDeGQRqNdT
         leT95W5p9TYU/MeVo2THGkDJDzcdrem0eIz0aZ+wLP5ucOflpzF6yBpVgyzqY5zI5vOz
         SS9Ktikm6BPdc4nbVhb3LuiGCNqstBzAOKUYA2M2X6jcy+55ljmdncKkweIiKBgnwMVf
         c96K34cFzeRJkAbXQTLffSpJaqFwp5gkiDp0lRLzAd1G5m6aE1BUXr0tT+2yh3y3zYES
         7591Ad/JE2qyoDW14y0kby1/ysYAXpFbQtRqcSL8giz2yH+VXqdwwyO/WW1F9+9d131U
         0MmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742972; x=1788347772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nx72tm3aLXOwX2pw8bT1HprONt9gl/DnSxMz4SHqnoU=;
        b=KClVgnQQu7SsyvvgNUMyr/7j2jUGr3GwjeFKALacDclSCd2vskxAkhJwbyHUAuq2f1
         yQR+Eo8L6R2Mjkr7vQxSEOwjHsEJHYOu3an3W8Ri5YFYv522bg96gd2Iavo1lY0P6/rO
         oRd3vVJ73czXSn0nfQZ6QHl47hAIZh9NnMQsED7D+Ju09LBZU6su/zoPrpwcLRkoBXdX
         24oaiCTCBWMFc/BNFztxmi1kuH8A0oze0TlVCcnlzJecy4HlXeqZwDw+rN+uqryUILoi
         GwBygR/4Z+Opn5v20fWDQNEdoTJd40tYFVejlKq+dSzxzls8RyW95X/kMJjnmbmYuFb0
         U9Jg==
X-Gm-Message-State: AFuF++l7I1kJ4KVIGHZzYTKEx/dnciBJXZO8UHrrSCqn26DQvWfFs/2k
	7RUVEVUQxH3Y1ciEoI/mw8HqCdP4HcVqDNdoFRuuAB5t7T+3hOrEs14I5QlOjgaBRRGgh1VyzKF
	ZuJl6j6hmQe19vPETpXwdfY064OVAy9TlwV/jCsKC7yxgWh9b4ga+NXhm4RUEe9zC
X-Gm-Gg: AR+sD1122lFD44a4L4yjTN/oYBp7MxpdbrgEZS5XPJYsSGNQmLmiLh0hgPxrAQI9CKz
	mkKyJt9alsUpIBlf8TZaFRrJwGEdy5pIzCDJbu+Xuz0fumWVzrWIR5irQOnVI7rsEumv3IvEd41
	a33DVTqhbEta3wlCMP47jHKpHSh6hCnNVmFTDLvuvzClWuaKYxbAwvw4lTN0LcKx0j2zW8smZNn
	gu1sz8FmQVesVU94F7XyZz7/qYRbh8nIcjSHff5XOe1pd/EQY8VA45+ojgY++bSp67SyguzU0Lk
	Kqx26UmsZyVDuXJ9LcXMv+zar08aJEcy0RO9aL3g7wpsnuHQAuxLyP+GBy550VU5jh1QhyxVmGC
	3KLQHOJ2O/UkUWgOi9TCUCFw=
X-Received: by 2002:a05:622a:11cf:b0:51b:fcc1:a0b7 with SMTP id d75a77b69052e-52e2ec51619mr141529341cf.8.1787742971912;
        Wed, 26 Aug 2026 04:16:11 -0700 (PDT)
X-Received: by 2002:a05:622a:11cf:b0:51b:fcc1:a0b7 with SMTP id d75a77b69052e-52e2ec51619mr141528711cf.8.1787742971326;
        Wed, 26 Aug 2026 04:16:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:15:54 +0200
Subject: [PATCH v6 02/10] dtc: dt-check-style: Drop stray backslash before
 quote for continuation-alignment
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v6-2-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q/J7FN7gGPyhDSdt/FQ/VZn0+1FY2L615paV5EC6nxY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsrtzlh7ve901Bh0v3qQZe2bZ/ysv800fqaQo
 BZITNB7KJqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K7QAKCRDBN2bmhouD
 17WND/0Utn8JGRqE9MCo6Ot6oqZnM0JI4P+EZKTkutGHOFqIIwi44Xl3NkdplMRTImCW4wzuzRp
 EZVWLp+xKyCETOUI8PJsaGCweMAeAvlfQL14vOzUdbJwpUyCtnaNuCM9WOJjg4auDU7+1+Dtc7q
 jcnNgrA8AjXrb4V7GquswcQ0fmNQAu8SMXKRiz37XPg1yqLQJXVGNdghTRAw+YZupwZbSJRo7Gd
 kGihElHA7uUPogdQZTOjFfcswy4qqbDn+BFl5UqWlNy3zAl/jG/RRxKDoRw+6Vg2YKfCuSG1eJ3
 B7Us+Y5PHtF+z5x1jIz6DqYv/4HYxRchSsVfMkXrIi4R0sRxrpOhYMamQJGn6zH6SlpXL+IU4Hz
 yevBkzlkBjIHMr0Lk0YY2lECqqSE8dLJHhPLvtQrUiIOPg9UUXltNInDWqWbb6z7GyFevV7lbRR
 idsmyhj7rII3a/zXRClrqutI+IxJyyeEUfo5xtltBpGgdDA5M+vmmfNNRifEj1DsqSEK8iNNTk3
 eAW8ZRQgCQFk6CxkZ8ynGsKJGmigxhnkRjqQvXGAp8xZdNPxxODfI/f8vCO89SmTCvcpNQgylzY
 r5Z4U/a7jUkRN+avbPknHgIMkY5WMKdN62ZoDK1Sh8eg0+uUsKRo+wyINZKhKqU1jSC6IIjpiAp
 Pl1Dwl1v3Fun9Lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: B6hG3IPUZf2BjlLEseQmCdFT2c-GtWMi
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ecafc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gm1a3DUOUa9zjCqAlRYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX2LgYHZ044Lyg
 eI+B9HzDFpmXl5piPSGnG5TqroUH1p7KzYdaxLHrAV5jagEzQEGkBVaTDcpEI56k0sP18WJNBRx
 8afEw3phDMm3zaoYdyTBXA7iWN8b+nY=
X-Proofpoint-ORIG-GUID: B6hG3IPUZf2BjlLEseQmCdFT2c-GtWMi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfXytfHKdeqP344
 wBJ1/mQK65NimV51me/Y5laHKh6e92BLsm4N0tGtWs5F5oR1fJHMlzdxjta5POTpeyzg4STEvcB
 Yj0HXjuW4M5KHyTSvhywVp9IfKhdhrJ8JduUroF//ur2pfNy3+qWJPGxEtvmVUEuIclUz/BcxH1
 7oPuDw0TWrekdFXhHuOy6fLnqHZJyEumR4D12Yxz4UrVu3K6vWtrX9+c0XVPHkV9bFq21fiyRuG
 IkaBYUCzCWai2l3YqxbpNbKm9Llyg+VruOMgN4zgLSoA6oVUmgvnfEg62gZRK2/Xx6MxcIFI/AF
 ttdK7UnmsDaoCXSm4tl8Mt8azzKAhhoiM4hWlXrz91fOqxJbq6G0xLuV1uZtg9uRfuHLH/uAnc8
 soZG7QT1AWKpYHgPnDubgAqpRz4OIIBdQO4qX2n/gBl//mTJd+IM3vHm26yo0fRZAlfh7JE9rzS
 uFmNzoGIXZsK0jzkw1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260093

Drop stray backslash before the quote character in a warning for
continuation-alignment rule: (under "<" or \").  Since the '"' character
has no quotes, drop the quotes also from '<'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                                      | 4 ++--
 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 5a9985baa051..22e1ceac7f8b 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -948,7 +948,7 @@ def check_continuation_alignment(ctx):
             if _display_col(cont.indent_str) != target_col:
                 yield (cont.lineno,
                        'continuation should align to column %d '
-                       '(under "<" or \\")' % (target_col + 1))
+                       '(under < or ")' % (target_col + 1))
 
 
 def check_unclosed_block_comment(ctx):
@@ -1052,7 +1052,7 @@ RULES = [
          'lines must not exceed 80 columns',
          check_line_length),
     Rule('continuation-alignment', 'strict',
-         'multi-line property continuations align under "<" or "\\""',
+         'multi-line property continuations align under < or "',
          check_continuation_alignment),
     Rule('unused-labels', 'strict',
          'every label must be &-referenced in the same example/file '
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
index b5576dd0f6b1..c0801c56d5db 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under "<" or \")
+bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under < or ")

-- 
2.53.0

