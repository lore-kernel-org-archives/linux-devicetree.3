Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A83B8BD7
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459874; cv=none; b=OBon8QFSScXAk2MLzHpVteRPhTDqkQe5RtFNZsbgONHxBxporLe1a4UsS+4iCIkcT4bvA4wbx7UvQuKgBda8fWBErmYxNiZqlnpXeqEe2F++jov1418FrYB3tgqskjWmValr1r3TpzIBQruc7wGhNvLXByG18uqRFDuha1Y8PjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459874; c=relaxed/simple;
	bh=i/EfGcaVwPdBD4d/EhaLA+xeFVF7rZ7sN3Hf7EI7L4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Om0Csmz3kVAsb9nr4VDBWwA2UxpmIHHoU5D0A1vVwQgwYn8p/qP2IUnzUOPFBf7UgJM4R19KnUv+dwus32VFH5O0rLarACigLi2QTR5FLpS9bwvU3KGTjTTWtMELiRRkMUUG+OdZTMbc8bAbCjVxvUc8XuIqPOLKqWUwwoausDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbLXFfn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM8PlGiy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbLXFfn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM8PlGiy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZNTN2983817
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=; b=KbLXFfn9q7GCpyhp
	jOQ551fi83GZMF6dhGiRqj5X46Ep5WUQVO+ax+EQpo23DM1wjhbKRw7qcpxaNmje
	nsq5YGSd0CzTr3I5QiCFHzOmHaLQ99cwX3bqW3+OSRjAVP1E9tahWVDD6t0D9jGH
	0TNLPX7hJYHErggZ8XlMppXUp6TmmLGczEXsYfLnD7HW2n+j6YFCegNqwwKiOLOW
	+g2Alqs2/BTZ/fpmkuV7VDAlkKbfrU5gQjSr3M1MTl20O/CBW+Z1PLStdaYQtOe9
	D6htfSGX761UVIHKRnQeiYA1BZaumfSRtMEMaagu9Ojx8heuQAhW2mMZDCqgekFD
	/LO03Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet375v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104ba8bf51so121014366d6.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459871; x=1790064671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=OM8PlGiy1AVGX8O0RMevY+knPujl+BMtfyGJXzHY23riqne0WWikact90YmT8T9/pg
         zwyT9ac5NQ1YctqBFOGDmce7hF2h7TDWtaE0vDOUAizJB93a/j+yH+cSJv6eeiat2jor
         djYpouShSebbsz4QmVJScuzEUiXVxq9MXdN/UcrH5veezd8AjzeGc/3v+gIfscjKWXZS
         9gZ4xPBxUv85CBEYCNox6Se7tB3A0IN9QQidG/zG7IX9de/FdeJHv6hlogmLWOD1JICl
         RtCa+6izw/12LrQx6Uh6TrK4zc5HEx9eJFJrZ7mznJOK6xhp8u/xqKgrKHzIFPL20wMX
         EFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459871; x=1790064671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=EHglbkQXaRG2m4kKvM9Co8lDJo5YmXn1uA3XySVPOAnt504sXtSMASZGB1m2LOm66Y
         ugY60V5ONOMGH6jWtD6eJRmb0pj4AzAaqUK0nfxMWTKBO/9BuGi5G6v9yHW6zl5fKUCp
         rimqAOBrffaM0d0NzWPCY0z3LXi+UUXZGDgkuTmuATmitYikGC4hOYZxiW/TZ33U4rAL
         RIRl45gxYCr1V5kzJukGH3M0Km+PviqBgITfQi6b6I8b9immqy2uCqHpS8zW28Q927Yn
         XS7x5cF7SuTQDvMl0vuo8jYFp6nGG17YoCQAmrV415A3o85XiG9/IjfOMCI8IRf11xxJ
         99NA==
X-Forwarded-Encrypted: i=1; AKwUvBxQRBUjYlYZ6TzuLfBGHlQkpph9OVKtXIB+nPTReUs+BugyOjjVM3tIyr3BcyESDSK4g+ThodxsLeyy@vger.kernel.org
X-Gm-Message-State: AFuF++mzKurMFOnlfcIw8M77Wafclg7ScxN3AXiXD8n5k5PTsy1BDqP3
	pFkHwjeXlBQkoe2b+cJwU4lGCboETysPpsb3niRFXkODhOocLI4MAyN67hfKz3xdjJFpF/2E+pj
	UlI5Lc4UW0mLZ7ioRgETAp0cO5tq2wbrrAlWfm+8BAaoCEiu/NhG/+9Q4TKEtlGYj
X-Gm-Gg: AYBFou1yhhQUpwkzjj4wE2VqvtncF2DeLPxKBUlGx8od6bTuC6pVF/P3wbwnoV84u4d
	JpNVJK5US6G2Y+r8o9UqnnnAd19I+bQLyakX6fmJFOaCvx2tuvNgUhnWNvu7VW4M2ohC9zuz/Kn
	CdE4RejZVQg85zumeTzqqzogPp6ue2X16XY5C+hPGNt9U1gqK4rt4qTmZEx7VNZSnq+0knEdLe9
	5peRXTDmgRs/j9lcHZDhlZeTI7D32f1j4EmXJLFj9lArga3Q4slkXHMxba7CdhWUaqPGqMzzVEA
	3p7g4NoMtJntgVoozCmsgBc93ZRPaW4O1gKPezR7WEfoY9Lk0iFXIJ9yvBgcJNc/4BxcNcrW28a
	8Z7rV8hsuu4OtrQp6X+WDGnrkSgvLe7QCNXFQeaVKfS+l7iA6J+G8aA5adPlihoUsTW0md6ubB9
	pLYsGy6qqlNCQg0pX5/E16Wf1nmab+VyfbMUmO6rKYWrCT9a1ATlc=
X-Received: by 2002:a05:620a:8006:b0:93a:661:56d5 with SMTP id af79cd13be357-93a299f455emr1089408285a.40.1789459871375;
        Tue, 15 Sep 2026 01:11:11 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:93a:661:56d5 with SMTP id af79cd13be357-93a299f455emr1089403385a.40.1789459870932;
        Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:06 +0200
Subject: [PATCH v7 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-3-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX9lzvzcQvmnAq
 r1b/SmockTQkx0Ococi2pUYwOtSX3RSAM9nJVtG9fMGIclHNX7tenxrKxKrtIr12CFm0M/tKAnn
 p9iX2NBeS41Zp/OPdeh2qliW0NLn8fo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX6yo5pSQpouwi
 QpXwiuEP12aZ9wYnHWe6eoxDJ6OH1tSgFpDO64tkqapKfSbOXhavHz+XRdQ/srbxhg4/lKSvwZY
 77/ZullPdtzCbrvv07dBtkcYPuxc6nhrOUgmHxsshqgMZQDOa+hew7oVt4fBDSITl4RzQfhiH5P
 cuBrhox6nFg3SHJwlv7ApHCyqyKB4IsNZwFA10JTdJpQFNdo88Z+1RfY2gGkkI7SO6/qutaF62o
 Y87hoMy3bfBoFcT1um23dvaPemvr85dV+M35t3aYDI4wZGcE2NbFXGVXiBMMA4n0T2LU4FxrlVU
 f1zRntppS1mKq4zEd+OQP5QYH5/UqZCNpE81I6F0LBGLuQot8Up0unxysMpV6hFBvCBpMaECll5
 B+mXfYvsvHdj/uihQdNn0ZRe9KBUBf6DTiYwq+LDR2yVQ8tnpJGUd6tTLC/UeW7kQ4dKj3FCoAQ
 6HpJ6l0DwfywY9mw9Wg==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8fda0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: dUQ_erQSz8Bt2cL8yvg8b_xac6aahd9a
X-Proofpoint-ORIG-GUID: dUQ_erQSz8Bt2cL8yvg8b_xac6aahd9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..90b54b9808e5999a4dead404aa2063ab695cdfd6 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,8 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
   reg:
     maxItems: 6
 

-- 
2.34.1

