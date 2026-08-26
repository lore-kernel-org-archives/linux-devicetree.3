Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D56A3806B4
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727981; cv=none; b=MPf+8ZZHUEk1ZaEuq02kuTqtzVtjMaLnJt9J3mft3VYGycNi2ITH1LivZmW+cPM+151mIhArlILQQXVZUItTJgcqTf1M8vyS7SY7WaqGNZtlEwFIBfYIweIh1KtUrkInZCtWWV8EGAG0KIf+pdSAJUfJvzj6Ugs6s26RKs8i4cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727981; c=relaxed/simple;
	bh=IlBZ7/A+6aQ52Cw6c4QTonWglV2MNSvQc7eWi9Z8zUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rSUS1UP0XN/kuBrWdfvQUB0zKVjbyJYQrI0WTv6OZA9vy2nTXvuS4bZCUETFRym28oBbRKtassAbk88szOQBJQtEMou2nZodLVjrLGVupJ9SPswNPCQo9mFjjxAVjOm/TeabLdrlxzpHPiHrsAY5fQPoCRO1Jz2OWVoGHe5pA8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQV/KriW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8qqlNQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQV/KriW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8qqlNQz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6S8v24097253
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7fNM/vMVtO8BnEM7l8vZieQUsAHP87Qc2HyklM5VY4=; b=LQV/KriWQlgAOSh3
	hnNAS4yCcu9BSCHlQNFMBiMxMGC/hceWpnvgDIZUWKhsY5Al5Y8njk9zjoQOHjWX
	qDkda8AKTqjKazsIdldZ9izu6KYQMMHMBL/4p8TX72bep85WdAHWM6cqE3Lp4/YU
	0vLbgJHP7U1HfgLieTiXk7aRkJ+UFzcds2IZSYUE63CkFQ5rWiTQzX6WuplqKWNd
	IgRANkO/8R8cTh3gbUmMnEEeFx72mh4zOI89YyxthnhJsyWR0hEaTheE1X96cijY
	c+rhK1bbQfI/8Uz4wp3hPgot1wwRk636T4OvPjYU5kT2A+cMo9eOrfGWnJR2NxOx
	37Mc5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcetkqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52cd0374265so11638581cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727978; x=1788332778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7fNM/vMVtO8BnEM7l8vZieQUsAHP87Qc2HyklM5VY4=;
        b=V8qqlNQzggq74TN1zWioBwZKhlBrpnK8zonZ95S/hugC1FNMbetkZnpQsL8bOc6pv/
         BfCloAkWXKvcnTIQ4gmgmdrJ8kg6nNLMkBu18j6JzuslepwxAYRMeDUliu214o8w+Vb0
         utEJAUHws5meXCbLl/tT2qDWIMWOaF944DpFSNgdqdzqmkdpFlS+Ly6QlZ+nIN/0ISBp
         f7uJhib+tQSsZ5/3QPkCQc9cnWe6Qm8P50HBGEa4AhEu4bpXZ3n1aQSkXywiRl26CphQ
         u48qfDXGJXZJqu+M2+Fik72AGY1hIGf55yrV7lUIWInan3CJZBDDqGM7jGGiBFzxbtwV
         3WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727978; x=1788332778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7fNM/vMVtO8BnEM7l8vZieQUsAHP87Qc2HyklM5VY4=;
        b=Y6g0NtCxfHoBt87xRnIEOE5/P2VX3kSTDdedtq+xYeB358zlxNpYgalLu/++0Q6skE
         KrsbC12KIWoHJRJ0JBvo35jyEmDVEE5IUV4GWBac46nXxDoieGC7lEoYJb3sq2KzjGPM
         TSN4YdgV/tXHURWMKAEh4zVBKHbRt+noBcFjE5njAXi3FGVE8ML5rWlKt8nfuBi0PR+T
         8RFFgYPa8pRdnlcs6YTbF+dviHLOOEXNX/KPASmMNjwQaWm2BxJ01x4T/ao9BdeYo459
         12aEzEM5RuMJHKYdIfZufUGK+hAlWVzGLjXlr+CdZUFpTSpBYy9tO2WRGRR5Kl7Us+CA
         aGOA==
X-Gm-Message-State: AFuF++mJHPa4l2S+kI2evTYnZ2PbKj5uTx6W1IQ16HYUllVS748wEsgW
	d2kD/Db6KIL6r+KwHDBHRkLDkAK6d6nnp/PH6rlJ0RYlk0jwLqjbzwSGJqvIl6bQDc18SsAIVPF
	DuBw9nnLgZE5X9Y78fSeuojY3YhAb693S3unqFBVZ0kTl3VnKfpDlszUxDTGiC1bm
X-Gm-Gg: AR+sD13/kekzJZtmUmWIVfnXmq4c3CEImJd34f5CkjgG0Qsjkf3LCWE/SQpT2G2XNZa
	gRCPaaabO0CDWDvqahhRbUde5/TGX8G39nkhPOmwioZJ43X0FVlvS1NxekIk9aj/OndGUfwZg+D
	NJX3GB2qBGgDxfa/WRh144x+MGfo+SJ+Pyuo2OUq8B7jbeQhhue/8TzOLUNOzwcJH8ntpZx4/BV
	NCEssBIzjSgU2wUnP4XNeAl7lPs5PXh7GVBex0iPEsFviko3gy4NT769rvpGw88Djr6UrhrzHuV
	hagqTI55NMI/iDo3oil74B+jILgWRVz32EMDWlb7HGhiTP0XD69mqDLbn+k3NMyMBJa+xXdSxXA
	3kpOWrUSFBcDPZxE+ae+sv7c=
X-Received: by 2002:a05:622a:408c:b0:52e:3a51:6fd2 with SMTP id d75a77b69052e-52e424270c9mr49782471cf.31.1787727977724;
        Wed, 26 Aug 2026 00:06:17 -0700 (PDT)
X-Received: by 2002:a05:622a:408c:b0:52e:3a51:6fd2 with SMTP id d75a77b69052e-52e424270c9mr49782101cf.31.1787727977332;
        Wed, 26 Aug 2026 00:06:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:05:55 +0200
Subject: [PATCH v4 02/10] dtc: dt-check-style: Drop stray backslash before
 quote for continuation-alignment
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v4-2-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IlBZ7/A+6aQ52Cw6c4QTonWglV2MNSvQc7eWi9Z8zUs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBa2+W0Np18BaJchJxyG+rKdaShNWd+HuE4U
 3Na5OocBYKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QWgAKCRDBN2bmhouD
 12ZWEACEhwfcHgJrckY6VY+Z1Ky3aY0//hLKN6VpvO37Wu5sF1QnGHcd1srrj73om1SYqkGih5G
 a4kJKj9SurFBjZWxcl3fa6nQrWVlY2hkhqPlQQFAM96cL6ehnzpdGrO5SoXicFt+xYnzF8KuSIM
 yh1H8N2WyDbJzB/a6io1QAqBsDFufVlTXjHsEL3isU0NkCMctKHVPAbEu5+uJ5TzB2EgtTkxbBg
 wTsgqF+lIN9yDH+YI79gw28BFgTjyfUzLSTo0JHYI04uk3sZOcsbNZgs3Eahl1E8NZydUKcsGhV
 6jhUVO8fVg9tf2aGleAueRzPZBisz8Y4skXLk3aKzUzMo8DZqT/x1LvNOIZpnY7Bl70b6WytKYl
 90Btwa/YjqWkR2MZwRuZqW4/qayepoLOVJnXfzgff3OmppCWdHIXd8JR2+mazWTvr1ll+H6XBJ3
 /O/OiTlM+uzZkaWa15iJ8MrKX4uU4zcWQI2sEIeswgFyEmBQ1jwzBI46HTdQfjKbIMaUnw4PaBF
 vT0dK0vKxjmSOS4+vG9yO9Mz2h5sVP1qOObAepped0IH4pCqdza68pyppw5N0qlI8Xeh4kX6+Qf
 6hVnqX9LWCmsP6D3vMqxXohfc3ovzVskoJtp+usFArL1WKF4o5BRb69JM7RZZGbKGukq18wdCzJ
 Mu17HRHTseogZ4w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8e906a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gm1a3DUOUa9zjCqAlRYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1NyBTYWx0ZWRfX+p0x0sBqIzcY
 cAu+5M3n8X4RDs554HkzbyDpq0FkIpQAMdobIH6h/Imzg32YW5MDH6sFlI6UpiBQeqIFmjCQsfr
 ZWbo/vl4hpY37sNWjMmb6ZT5z+oEyOs=
X-Proofpoint-ORIG-GUID: nA8EaNQbqOKwsz4rvRDfaTupFdyWXrPz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1NyBTYWx0ZWRfXzKOPOsN+OMOx
 WYe/FBsryA/rRHXh8EGHdiiwkZCcnT34KYzKMZ1ji0MuM8jhKA19KH0lkbhQDMpiILk7g5IhNVj
 +Ri5R7LNkdaRpNTODKydmPTmiC3WwzgSYV6SqeTjaRncxF6RvEMHpXUFCupmd41inDPTnOCmorx
 SBkAIHodL1ylqPLiNIYMRPRUTGZRSo5sufoaZsIOGS36zXynDyRAT0BHIPqdvczwK9d+PxiRz9w
 zyoQ+Q7pzYGP5tM+0PRMj91DeDx52cyV874enkETpIwIeAvFQLYM6RJcR+fXjegHJL63NQ1JF4f
 ipaM2qOl6MhwLE1K6M/bfgj+x4W5nc+mgQV1D9aVLCLPIcgk1sWcKFYNWDA6fdX3Ty2fe2DG2Xr
 sTReur8ab3lF08VFg81t/Qevy71ep4HEZaCl5eCdSfToWTpbCKC4cXBZEIhIGCE1MKCLlpEO8lG
 V4rfrVak4Y8LSHXw5hA==
X-Proofpoint-GUID: nA8EaNQbqOKwsz4rvRDfaTupFdyWXrPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260057

Drop stray backslash before the quote character in a warning for
continuation-alignment rule: (under "<" or \").  Since the '"' character
has no quotes, drop the quotes also from '<'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                                      | 4 ++--
 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index e5f26d3e2792..833f8a03ddc9 100755
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

