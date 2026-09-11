Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB01456DF9
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122609; cv=none; b=bTkQLBJ30BjIaA/u4SQyAoT97e2stOXM/J+UxlATU2G87pN5RwZ21OO2EU9CIqc9f00R/u4ISMpIz251sruO5DLpl0M+k1xzzGELELsqlQpUHH5pE40HqvSCgeMWovhyYjZzTiFWaByOnkiIb4t6G+qg4PjnCNgbpV3fE2knQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122609; c=relaxed/simple;
	bh=OkF3pqNY5sBAsIguyZS7ydBERaknMe6JM23521127sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p71N5JOEvdi6Org46H1BPKawdgRB2jMN1uTiooEAULOqyc2lbxxFBO2tOV3VxccFEjX2rBvF0vAhzecHAZuTgd95iPlRZv/x606gH0NQZSKSmkcHBEbxVBqxR/Ps8NATwRku7tYBAC3ZAJ445+Uk/Q2ZVBlg0CuCz2fYLM7wnkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3ZhNICD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HT7uK/zY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3ZhNICD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HT7uK/zY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kvop2832840
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5bFar5H27cJqwd2WNphcoVppq++/ChGc+WspNucP9M=; b=K3ZhNICDVGGt3Ja4
	3PifMTjl3NR1UemPKIR1cwfgJ28JuWrRTLjE7qBPv2d/vZPTtvJI0zXX1MA7gfAR
	HaEXXKvOrNBp/XSKVEiiM0LkNubr2u2YwyZ2kaHDfX9hNvLIR4eij++P2f2e4t4A
	0kWvZ2PAzmO3ipSVHWMZVUGP5zqg9RKNLasi4KIrHCqhdenLcrGX309HBczozJaO
	bROvySyf7VMj9wPFOnbgKgVDKd2Cxtq56PoJbUwdOONC4msWlZpKJct3H9iTBJ6b
	H5Z2wnzqRTnEyIW1BOYuHLRSuggbNjqQI0+yyx4lmpmVgYfmPpYUA008iIGnn/nS
	2AD6uQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfgwtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 10:30:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so108248085a.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122605; x=1789727405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5bFar5H27cJqwd2WNphcoVppq++/ChGc+WspNucP9M=;
        b=HT7uK/zYsh+8N6Ikh4wSNx6TQR+v9znuOLezXPPmn1tsqLFyk8QgpbXMflAkrLcDgk
         oYscAW9yve30sazdQtSYOrtFJU+33OAw7H6io90O/sHQCKLuWuzwACi6sad6ud7JBKhG
         Zw1H9r8Zo25c+kJjeabkKC6j4mhRBB9VKC36PkazWJM48Nemy1afrzwnCOtco1yZIC5f
         5ha2CT0xCbMzvgknkLQdIZWrIyaID1T5KkyawnfwvOi27T6FoRRwBa0JgTsGDusGzWpM
         TR2SMRES152zALf2N5gO/CxuXMjsD5kA/hP/HoLBHElbmc/PfNX8HPa9B7bz9WP0Yap9
         9/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122605; x=1789727405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5bFar5H27cJqwd2WNphcoVppq++/ChGc+WspNucP9M=;
        b=Vkf2+jiGDvnD6Mb7L1eJ7xOXpha5M/Q3bnsgvH0UJdsb6nZlmge2y0FnCCK3x5+dt+
         QXC5uwW3FW8T/29Mzfjg/PRc9nnfK2cnmaJ9C5ybFMs+ebMtM50HQOIe1+1NDYnc0eew
         9iMSU/V536yNr3F6slAdtkYbip8JCrpgEOZzpfFeBsTlcB4Jm2R4fbpbpcweu44rUnUG
         zGxkVG15hQkgsZogxOrAoiXi/d84GwUW2kldF6IkTzUYoDa+nsY3JdyBWPGNdWc4Imcd
         97h/xksXFsXyuz6OKBQE/rDz2xGVQg9wYQ/+Z71VUPhazaq5oEGxtYlEMT1scmylASgq
         A98Q==
X-Forwarded-Encrypted: i=1; AKwUvBywAkqHWdt2Oj/nzX3BsEXC/FrW3JMxNotAOuQgu3zs/mzDL7NQrUT5sW1mQcHkj/g1L/WGw3e+DdrX@vger.kernel.org
X-Gm-Message-State: AFuF++m8cKQri0QXytVEMCcSh7othSa+EMHPiOFCT1HG6G0t/D91JKNY
	lKnynhrcEwG9bNJzmteOxw3bnlL7On+5Xza2pneERaYCdKeK2VQnzxOtPMwmE+5m0X6vNXbf9uy
	TJ+1x23US4TuclFXMTxH7Om3z/p/9bMXNNshECkECMtqZOUbXGTaFUPq/l7QA7z1C
X-Gm-Gg: AYBFou3KA9vO1XBg7hoOEJN5cwhIORUxCsYCErjI3bogRkmrSYmAMMbB4LQWHm+ivEx
	q4xVm9W9s1yVgDd5hZGZJ24xBq9EqE/pq48+KU1DyC7jyz1rzDjShVDZpCZMEcIXcnUDIE1v1tX
	VdjWtDk+SJxU4dIqRFrCUcpMx741N0WrYs7ajutaP94AcASQ3++/aFe6Sv3idr3GaQfQUBN6Qae
	lCm5g2j3pbnidRPyx2cPcZ//jGm4W9elhOOKiZ1p4zA0dU4To18HFk9big7d5xPKbagKLlCM9rR
	lQZosIORv2B9AZ4gHDwwOsQ8GP/jro5z3e/oTNvSRWr8Z8h/zfV5AF22t0wv+HPdrgI0Q7FAeyK
	SuxzWWfadu8PFtEDtA3Df/qk=
X-Received: by 2002:a05:620a:288b:b0:939:6de6:9517 with SMTP id af79cd13be357-939ea2bf754mr384622385a.46.1789122604967;
        Fri, 11 Sep 2026 03:30:04 -0700 (PDT)
X-Received: by 2002:a05:620a:288b:b0:939:6de6:9517 with SMTP id af79cd13be357-939ea2bf754mr384617385a.46.1789122604515;
        Fri, 11 Sep 2026 03:30:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:30:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:40 +0200
Subject: [PATCH v4 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-7-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OkF3pqNY5sBAsIguyZS7ydBERaknMe6JM23521127sE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gVrcZu/TMDuP1i7PORWJEkHVwIonipCvxhL
 qXzj3ig7OWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYFQAKCRDBN2bmhouD
 15DsD/oC+uEKgZ7M5J4X4LpAk/JlszlMZ2civ+kPChZIYdG2ZJ9RYC5bHey27wDiMIrv7YSLK38
 u4C9MfRPd9xqE6nuH5qayj/jAjOfUVqttQkyzZFqAVtU0vXFY8DatvN/oYC1OiIga0wRc3yzw8c
 KeypBp3vOhR7QiSQDpqCnEZJE8T/G01setUm1hmNMZoVahF++feF233o4tKWGPqppFdC7vufVEh
 a78a4ytiNRAh3h9FkC7Io3M1FM7gqZfIWykCIW0RrKHkAAZ/+OnsmCGgW+9701J99atgPBwuxPf
 dBEjN8cvEnVghDl5nLpoR+4s9GGS8jYF4BVPpJEBxYRN2F8xAtA4NmwxONUahJLMO2Qggb0d5Ah
 ZZxCRoQ4Oi3uH0FbcViqkHJ7nbLOMPmlvKhgQE5YclDTV4rCfPkpOh7ej3V6LhU0iWtUpGPU57z
 Wh/i3zYgt6HAFC13buF5fu2bK1IeUXsQeX0klMXEbCrYlOQBKmU/r0cQhVDFWmd7r+npJmKii9V
 wcgpfBjCtWr6x2GrRE66WTujzwBUBSnBfxv++aJqeWB81Amu955ZP3lWdkYwRnzLIrmRMGqZBlO
 ljhkeeX+ggqnEyAl7gcZMa+JRgjZJIaJOqb1y6yIZiHHegNp7pYYp9Rp1Pbsd/98Yb24Vo7Ckeh
 NVptqF+TywOqi3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX0KogeYvxJ2Zv
 afH032wa1jMyavVJgSACh1TMhIjZ+VrN5osCHu+E0bdXG0eHsN2viM7E+ZLicPT2mLMPjl8njLi
 nyq5SGB/3IctaD5Ubvq9Rg7iO9+ATWHgm2kWmdlprUBThZlET56swq4E+bPSRTItat2JHIz7UiC
 9WWNDK1d5IxcjJk/Aui/2RCC0mwWuIZSdHzE+cn5FnFoAyXqaYfQbtezq4ZovTYODIInQGCB5s8
 V+W88P0NQMAQ6GvCNitxgkCOeOgtKZ+auTwRuX63tApqLZbbvsTSIvePCxyUEWs7ZeJX2mr+Qqe
 7fXtCpvIFyDjiN1kJkw3DCJygcVvlwIYco0rbZ1jB6CovHTp3MyfI1QdH8K2KD5UcMF+zfCxd09
 u6Mh4meJf8PIzIWh0igTeSjJzCGLA6rT8OBzmRaref35J8TIwi2iLc02va5niSWqZpm3H9uXEgY
 Se5iQ84K/SZQda1/Qsw==
X-Proofpoint-GUID: U_bMzyp3lyY2mxnaQ_Rv48-pmy9DM6Hs
X-Proofpoint-ORIG-GUID: U_bMzyp3lyY2mxnaQ_Rv48-pmy9DM6Hs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfXzkAbTfZxES01
 sxDWofjhDIfapCpKK/EObSQyxxNNtczfZ7pKaiRp1cKmFZsY5c+trzXWJCWJnsO+mynu/8q+s5u
 TCD/11bHHc4Yjxj5EF6ilhaOuTgKz5Y=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3d82d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=LSMMCDwwRte7x3nqQVUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

There are no properties in DTS or Linux drivers called
"core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
wanted "-supply" properties instead (which are defined in the top-level
properties of the binding).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index dfec6c3480f3..02d27ccad024 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -113,7 +113,7 @@ allOf:
             - const: core
             - const: master_iface
             - const: slave_iface
-        core-vcc-supplies: false
+        core-vcc-supply: false
 
   - if:
       properties:
@@ -136,7 +136,7 @@ allOf:
             - const: core
             - const: alt_iface
             - const: extp
-        hdmi-mux-supplies: false
+        hdmi-mux-supply: false
 
   - if:
       properties:

-- 
2.53.0

