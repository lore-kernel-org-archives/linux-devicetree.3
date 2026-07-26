Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B2D3C9880
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080869; cv=none; b=jKyGSHFcoi8wqqIH1XRg3iNZqAItWqtAwMo8HYc+VDAxylH7PhY5rs4Q+e5MwceIweMcNxSdUENyCoYjR/8lM3j/mHbGGH38HaoVze3oqPbHi9R2Kjv4v7OyLhvYkiYPucsbfAHkADXrRJlR+WReW6MMMbWV0Qp1T3LZjme7VQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080869; c=relaxed/simple;
	bh=NNvNiWJhgq4RY8xP6kInyDFc2ewW4MP6cT3d+ODyh/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k35TVar3Bc9v5DwVUs8NeEm5Da0DPFrjv/ZckkzE4iYLIktFwEm/LeQV6EACNwAHhVZL6stSMP8ZGBH9lrtFuVAr/8q4MYa4q0mcgzHEvmUMLamgJuaXNvaIHvtg50qIsLOuYavz6/YBFHjq2VmQbX/AmwrrZRoEZKuW1jz196I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQL1Quu/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZhxgSCt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQL1Quu/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZhxgSCt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE2gJI1973637
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CwH032mbud6aZuDV477ha6MxQje5iIlFs9gpfwstCcc=; b=EQL1Quu/WUSQDVFX
	cLaVNvxhlhmexJ3yphtqMOLv4sqOcN/hohOfuh1kneyi0oIa4ZFdon9UZNmn8tgJ
	PIE9YX9duuYRJoOB60jb5ibCawkmPTY2627XKsSzqCulkdXFU9EuKeR3AglLVoJG
	JwQa0YJN5g9e9XnVWYIRvjSZ+S/iiUG+0atODT2BoTqtxTMuU+Qy3w3r3qwsHiOJ
	prcFwmRJ87SbQ1xlOUzsXx0SmVxCMSm2u16RuJ3i7GnMUKsp8aECv6F/7d80yzHY
	I3YBfkl+Xi1u8VjGBxjvxHwesjQqV6hEX8dY0Ogj7sKgl/m//CmyQOiyBaJWVh07
	w294OA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufuf7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-522de3c645dso42370661cf.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080867; x=1785685667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwH032mbud6aZuDV477ha6MxQje5iIlFs9gpfwstCcc=;
        b=cZhxgSCtwHrzmCYawschly+yeHekycIf2So9Z3zdEr+8yLjQx8cCoEBdYMpLiIvGEO
         meEofvVw6rGh6pkb1Ohlm41xVujNvOmtDHQC+9uWCXm5fvIwZhawTX4k5do/2amGnZgR
         3tI/RYI6JK63nqoxgSVkfewdj+2PXmIhDdveHqidiQwQK1q8C/mcNQ68/rJ4iMFjcxEv
         juYI39nPLxyFzuenUzW2Fp9s6If1y9ohbYWNkBs+LSN/OKEvM6yElujdRvrO/U7PlFgq
         3Do10Z2o0w6I0hD8htvan2+lxeagSiO85psG5RpISEF87lGnMbmdpDjQKCKwVglcjmJN
         WOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080867; x=1785685667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CwH032mbud6aZuDV477ha6MxQje5iIlFs9gpfwstCcc=;
        b=B+s1Y5Jg8ZP7Z0O5dcKNr33x9bvi1fStRdXdFpFVPQjj/gX+HrUE4DZ5XJ0aSJ4HOa
         TlcQFLSCDEIZ9thutWELWkU054DG3U9BnS4V90EU6SRSJu7vj5bGF7gLw1FfQxkYsCXv
         kXkB5YoRcOIKAJ23M0FCiaoslu1Tw17OPuVzhWVeVKdI6+yZ+eXpHnTpWWo+Md2GOLFH
         1suuJTt+Oks5bdOOuSOOQvwLq1WeoCqcWKn0iQj2MG7Eg1FkgfT91BH5yXoYexXJGb7y
         o761lKIAjGpSQpM9jv07bqNexZgU2Q72rQ/u4TCzA1RsbRVQ7WADmgytqG6JOVFYtcjh
         q47w==
X-Gm-Message-State: AOJu0YxrFIMOVvtF4bh1wlrboX8SvWmBFPJm9tZoLqJC3TWFOhsVTQ1I
	tKtUguxlnymUT5dmP2pd/GwXzY81+pi+RasZAmGrvjcmQg6Jc+61SF/Gws2l39KIqsNBoQ78pL1
	pntxEOdeRHNPC9xInE5GfzZtG9JOTWIBOivdB8qLn78HSR94CkcCdL8nBH1WO2/bH
X-Gm-Gg: AR+sD10ggEbIIGZzGJPfEPXh9f/FADdkvsV0JkwNL+6k+Pq7p0R/r0DsVgJkEpa7n2a
	BK6DSjtMjjc2VLNriEozQbrBogXRSGccTqiCB39Wa6I+BzwiIC8tcteMSJ1AwHkG77cyPe57TXS
	pbqqMoGeK8G1DMZa5AwUnJb0UABzWVYAGPcvIvfRbvZ46ri87qmkM9W9BPd3TJXMo/XEnIIBXC8
	SN0jSHB7r3dHrbyljgZ1Ozi55OZrIHJng7cH2wdnE8ywvJYfo1989f6CnWUuC8rdPcOLGg1U/lb
	U4Lg8qjHGYvir0w2832fQHec3CCTLLHSZrqxYiLy6DvHQUJmaay9/H4YkGhS/IKS53bREYoTqSb
	qKwUJc9vb6YIDe4L+9cxEOJC1
X-Received: by 2002:a05:622a:64a:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-529a8381d19mr58009861cf.8.1785080866737;
        Sun, 26 Jul 2026 08:47:46 -0700 (PDT)
X-Received: by 2002:a05:622a:64a:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-529a8381d19mr58009651cf.8.1785080866398;
        Sun, 26 Jul 2026 08:47:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm236848035e9.3.2026.07.26.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 08:47:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 17:47:24 +0200
Subject: [PATCH 5/9] dtc: dt-check-style: Drop stray backslash before quote
 for continuation-alignment
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-n-dts-style-checker-continued-v1-5-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NNvNiWJhgq4RY8xP6kInyDFc2ewW4MP6cT3d+ODyh/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZiwTICvG9DOThzaCtmyKVarHomrpGGvXfGLUN
 SN0l2o7INuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamYsEwAKCRDBN2bmhouD
 15fXD/4yLtKHxI5TH+wGSmBXJSbWN+r3l1i52ptEA3Ryk7kPLOZeVY1HHBiSPcHcYL0JS9MtQ8f
 Sd9pNdcjrIkVmF5ZNTI0bBsxsWgghpTvNo+UR8+obQ1NdOu/S0PRcoHuXtIUJwNj7NJheumkKRH
 VQZ/axSOJygxoxV63Vp9y71dNgOl+jYydjDcbGgMxtFhSi8P8K/mGVvLVuHOxHE3k1w3JG3CKhe
 pQVF9CJyiNtGnjJoZUOxjrVuHCy1oFGVGdx/bQAK1ryPJSL1bcJPS0Qp08atpRaqgw8V7xXlMOg
 v+EFgJwKDSfnDPGcZ3P4FvwP6L3+eAWqQtyMdMxIZoqqFNCwvlq8ihnPMr4Tb6s14iVd1mmb+Ix
 Rvt/ZfDz3i5jE9t/cslGb8IunUh3d6tDKXbjsco4+34UpbN7+jAlsUKdcMsV+mT71RBIma+B2iF
 xp88SYqeZeAB85DapCH8l5VOJsmF6IBpTD6Cvo7hKKGNOXygiktF/XO1a79Zh0QlHp1AcuaG76y
 Th3w4hx3xISCkO2oy761ihHm1OkFLYgVlncphDxR0HV8jbLYYj1h3p7wSC0Y6zIy8uucYX4srU0
 61Ho3uofSIfxLgJw1bCCyCwUOSZeS2cwrCgFixAcbKuYbxtbXcwx0gR9VxRvIhtP///ZPsDnmvS
 /ubDeO5Re4vsSlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: znE-f190IKNr8JpIzMbVaBM1kb2Irxkm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfXyQjjd1J68tvn
 rzIWfzsExczVyDiUZlKhuHnGvOgKxgeFZhM57kwgfwJHuq0ZxJr16Jjm0ykH9/WXG9I1sz4CbzQ
 nJNEomyLJNmskYyAfYbh6PzuALDHXJ8=
X-Proofpoint-GUID: znE-f190IKNr8JpIzMbVaBM1kb2Irxkm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX7KO7yQdwkQLM
 a8oe8AHmXyAJ4PKoW+AicAkpkSnH+FscafXJJUIZaCR1cpceB8P0RllaJHm0Fo2iw7OPJBd2k5A
 OskD+31gvn/8BQ0gYWCxsWHZI0LV4brNy0p1vjgEtJhwbbqMDw/r0EgKl86EhPOW1g2RvH3cJVf
 Ucl//VBpMHWhUYo1/9pdyrWIXps12V0fNCvbVYHMcnNDSGdHJVNQ9FBLe34OQeBEodB6HH4y8e4
 HV2Ha11VwDorcqcQUrcd59gwOwNGoMRZuWVj2Fqch/0PpRGmcugJas9tFDGrtVsDWAwvXgJpGLn
 Za9qZXWHU3ifUXJuM80o6AJfr/XbEorsHn0UF0bx9bVEd7RHY0PZTnad39+s+keen1KTXZr+Ej/
 ZtO+nQik+5QLueGSNza6nVA88j2AHJVgjc9MnJT3v4hJ6SyNJn9ztswGhrRUf5VpfqIuaEB45E5
 OwLeEfxcFFO+r2bxNuA==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a662c23 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oYyeLu5mwHFlQtcaYCQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260160

Drop stray backslash before the quote character in a warning for
continuation-alignment rule: (under "<" or \").  Since the '"' character
has no quotes, drop the quotes also from '<'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                                      | 2 +-
 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index db4451e30dfb..4d90fbec0e39 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -936,7 +936,7 @@ def check_continuation_alignment(ctx):
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

