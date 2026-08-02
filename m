Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BB6390CBA
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660355; cv=none; b=JKR+tV5k/SL+1hB8UtN8vnEpup3v4Dao1dy2U1AE3q6Qm2KHYAvJ8srwiWNFUCm3ZJgw1GcjuIT3/TeGXcC/CT98m06ApSRBjjy5qT2SDbA/H+f5hWhVbpUwLhU7nUNpcIy3h7P8yUu3DZ4XNpoC/eFjRxLpNWLUwFspAxznMPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660355; c=relaxed/simple;
	bh=3d6JoHnwLLBMDi4qdXJHd2hTgp9SSsMvpq5g9Qu/wW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpgZuQsUhLNiVLkoAaa2tZl9jyTknI1L9CcamfJ8Mr+/3ba3tFjSiMGLOxj+5R3WjhLL9JJlEIMN3I0GVWHvChb3o7UBrpANZx9Q4pA8Eb6SmzgQIGpV1ItRVEbN8G42ilPZmzj+vkDkxxWA/XwtldO9zCsAy4+WpL3Xnj5ZVhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqmnhXAk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLNcOJGw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqmnhXAk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLNcOJGw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727mDTA1082140
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdfkPZMqPXPoIik8eTTmpCNYgii8gSMH9EZhR5xzM5A=; b=OqmnhXAk4J7kpPEF
	yJwEWdWhdyG0dUHkgolJQNWCwgW+YWrYvx7SHwSTPWVCSpAA/z4YeZRo4eNtzmPu
	2SfyGIraG6BLK4GcWKTHPEyQGHkYHE0CTIjSGVpm+1jP7vEPtQToUw/GT90ASgrt
	ffId7VoC/AVncGyPWIQXWV6FNy4qRzBHeA2iF3KHHdqy8rFkCawJC6aO9P+JT6cp
	NFRuEUa+WHYEvMYPsMuSvIAfVaGxIBZ+rSmAQNixx1UHuWxjeoUQLQMN4OR4z5/j
	esczF5tQraNW5rX47v8NkhUlpUSLoP3qIkfEThc8tAzRKU1xZUowfr6No5wqLoJN
	qBaJFw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6jjkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:45:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so25485836d6.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660352; x=1786265152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdfkPZMqPXPoIik8eTTmpCNYgii8gSMH9EZhR5xzM5A=;
        b=gLNcOJGwdExzWAr2xTBOMhRWaOOcNnjIXFyh00ZWWd2hd829BKA1m+5XrVp+7TR+gv
         BN4ZRb+9MExFTUb5gM6rqkub0BBCCzjr96mRfSYQS11AfQ5MB2nzWs+z2IEun4Whi4E/
         657WICGPizNIJDcj0raL2W5Ctd61bGxFtsnorF7j29pm8t4hzp3CNWqzqVb8S6q8fPWQ
         B67jzoSaDY03qra0pZ/1JgcWPPN0VXGc8sdxZajIeVZUChgsVZBBGzWIL5pz6iytyegB
         ir5QhlADtiNEyWXC1vZPHdAlJXY8h3mC48gL35yDvkYhb095Pq9w1qLXs0vxBLgSFLQD
         kg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660352; x=1786265152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdfkPZMqPXPoIik8eTTmpCNYgii8gSMH9EZhR5xzM5A=;
        b=ES4kWVhio0tU2rWVhcud8hLOhZW0iQnNrsbHDGWQ4LgP/ZgQnvYuWW98P0rKRfZNsU
         cx52t7QM1ezs1nCbDMhWV8Ylok6030Lv+ajfOpMQlZFOYNEcIPU+cu+aPtZeugkCyglQ
         BfJX3yHOhJCh+3tp2sopO34d08hEGFVeuU91hJQPFTgceJ+PSs91WOq68345067ka/iK
         ilybBV5bb7yy8UClpWl/zff4KtC8Z+BEXTtgieNpENsCwWBBt0Qy0C4oZgLGxfOMCDN5
         II4bhf1UK809M+pE1qRsEfLsaj+SSYUFQfvVmNgZt1dD9OY1quWD45SwhuZd5doX+0UU
         H7Ag==
X-Gm-Message-State: AOJu0YyKooZpmSNVmsC2QYLUZkwU/fqSnmbW6AOGszDXAy5WTgM1X9U1
	i+Kg08w91ZUMS6UBrKC9XrWINf6aWAJrfrkt+vITPITGrqMa3oGui35XUWkIQQCRUfGosPmF/wV
	eZUOThUggjqWiteODbUZ9kwUG9jvMc48EQhPTLzNyOnJwm7LPNr1X4afSHbNHsvht
X-Gm-Gg: AR+sD132WX0EoTeMz+nixnGZeFghYOFhdMmq3FW4bwgbMPVeeqoAREW2Bc0H9NjjrqY
	vpCcE5dBIjoDADKK8I2sfW+aC5FGAt7oNV9B41Bi05/ee3USFhOz3rbZz06KEPHFYzD/e7oIYEn
	1obV6rjNOKkfozbLEIJwCow7ZejK6VZtP4DcBtnh+2LDAG+mUC3UcGlRVeCWyhEbUoQGGREBYta
	jXQKLJCI5yIjjhQOQCLhPT7agT2YkD4MzWTLbYfP/Fc4REqgriHT1CoIycNH7MAkrH260fmDjbF
	QUkAYMavwqNWmlAGNtD78CkCmBYrHIN+HObpJUyPtzfK7/eF+Rf2Ua6Oj0jLJQxRQ7G4XxENPnB
	8ZFOHbZ45Ck+k6tzL32IuH6ji
X-Received: by 2002:a05:622a:400d:b0:517:8470:2d2d with SMTP id d75a77b69052e-52b56794481mr118044151cf.29.1785660352196;
        Sun, 02 Aug 2026 01:45:52 -0700 (PDT)
X-Received: by 2002:a05:622a:400d:b0:517:8470:2d2d with SMTP id d75a77b69052e-52b56794481mr118043981cf.29.1785660351716;
        Sun, 02 Aug 2026 01:45:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:45:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:27 +0200
Subject: [PATCH v2 05/11] dtc: dt-check-style: Drop stray backslash before
 quote for continuation-alignment
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-5-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3d6JoHnwLLBMDi4qdXJHd2hTgp9SSsMvpq5g9Qu/wW8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOuateRzDFPvoPHdMcWfcLmPo16YzeaJHpiC
 DkvFdaw2uiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DrgAKCRDBN2bmhouD
 14CVD/9y4bEAZlihN8XvU0E8kYcaHwJbkMsG/7sRecKOhK0/ecYcJCXv9YPnEucqKNyvG3H/HsV
 ArVHHCC4zt2cdGIaOapK7pZtDO54pkaSPrCT7SOzvPwNVaPm0tB9U9mwZ14+9mP5OXXBpwOchVY
 J4t0xrE+L5DM1AkAJx18dcCyT5CDROz2QD0kYbUBWgK5FwtzNmi2dumstm2JRT4nYU0k83GVZzA
 sfKiK0XW4QNgz2jMMdvRagIyTr3YkOfxEfm7zfaPnj4CtIp+/E/vEHHLtI2sKzjUv9iyBNE1e8w
 xYu4RQx8bfvh+LEbDwBV/3TQfMsdYksCb/pEBME8st7DuOqAURwpj09gjl9Ct6jM8X9cN6d9WN1
 n2Ao5eQ0dq/yT10Pl79E4RIivhVXNL7QB1Wmo+8VI8NdJDzcwA8vk2jIUVxz8FfnFcDp8/21L3i
 YBYZaODb5xSlE/5lpbN41sD/7a0VrAAqFJrQDKdL30BFaveuvdm/yH5UwpT2mcN1EHXcMMwQ/CA
 ftpJN2zHN4ge18h8y7Rw1A9snYhHpKKhUu/sXVhxzdJKKA7ReuMBYw9xgyLNYXEIaDhh8MzyfQO
 1EG/nc1KeZflEOzDEsr3HkfoQK1N2Y832S67zd+yue+CKYHUIPH36mWUH7bhTLY97GPYMJ+h2Ou
 kpHjnx4unglHeeA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXwZgvXOfXebRt
 wcJMHRNHn6hx/hS435li3YwrhnXqDzRQiVPzAnyVsjo04hjM0SI5FI8IJlaR/n/eNwTIdNgj/eE
 fYTAGDj9ozdmGtwQVg7F/E31D8Mc678=
X-Proofpoint-GUID: YKj8659-obxiM9zxFwyx9-_93un6euG9
X-Proofpoint-ORIG-GUID: YKj8659-obxiM9zxFwyx9-_93un6euG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX/mknvsYrJxSF
 mSF8MTCFDo+X6dSOF619IcDtZMxgFiaiq2nFwn8t1ACfB9BkUVuardbHxvrvk0Ah+KlFmNYFBzy
 +0WwT0+lZr0NoYLxr3cTckg5VK+VA7uZ8VwsF8iXWzr9g2K7c9yH9uJRx7e2eiYCQiptwSVxV4L
 tER41NdNYxw6sUyhdLIcykQzkyshTzmSrcVsTNg8y4APuUqGHevsme0rMqFcG7FiUCZxdM2UXQb
 KW4RyoexIdeEbw6iDaoOBkcOkQT9XM0JVo1M/QrM2C6kuOLWAw3Q9LclhyfnWPVqdi/x/szOn4l
 jdgvLMlvEjkzY+bUVwD+S2oIrBn9RDYIkLNfUq3aIGYtiVWRKBacWnvvDZWHC2r2qDPao8XfKJ1
 6ivlP9Tf6qB265kTD8zQfHM2Jdm4T9aGiCRsvGKbjLPYrH7qePCfwvIRwoLa3B1g+agmmOY2LR9
 96LYdEcUu9GMluiV3TA==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6f03c0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oYyeLu5mwHFlQtcaYCQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020072

Drop stray backslash before the quote character in a warning for
continuation-alignment rule: (under "<" or \").  Since the '"' character
has no quotes, drop the quotes also from '<'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                                      | 2 +-
 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 6a05929836f2..04247e39a78e 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -950,7 +950,7 @@ def check_continuation_alignment(ctx):
             if _display_col(cont.indent_str) != target_col:
                 yield (cont.lineno,
                        'continuation should align to column %d '
-                       '(under "<" or \\")' % (target_col + 1))
+                       '(under < or ")' % (target_col + 1))
 
 
 def check_unclosed_block_comment(ctx):
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

