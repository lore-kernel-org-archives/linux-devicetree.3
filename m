Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCBF2236E0
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333485; cv=none; b=c58UUqyDN4jsYUE3xobVJPyltQMO+rrpYNOWFcfKI1E0AO/S55gAr2oaG1gTqhnR9Qnk4ZfkwaRgVRmBRXU1JNfUmVjPP8fGB/KtG2Nw+PtYj2nl+nRVQUdMN4VojsXYY73KjIAnGSPdBHVu6hmRNgzEyrK6Fz9JD+wWPdxHK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333485; c=relaxed/simple;
	bh=Zwt96CcKm1rNZeJ+V7c56NV/q8qB+Iu1EWK/bSKp5yI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPk8KKhrQhGMWeoOhKyXK8Y8R02xO7RIjk7WsnNfRjRDO9n82e6bfINg8XCcqHyhsZAscQb1vfIfwn85G5fxFRMcIr4Fa4Xd6RN81PN45eIKHuCaQnOsWUeitzYnV7/29TJiMvOik6X80WgZVPxky/VzCxIaqn7/T2t+dkeHGd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8c76V0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJyM4w4o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8c76V0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJyM4w4o"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693wfs109132
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3wdtbkCeNakUYTqeH4Ry5JPgi83jbpdaQv+
	DkmfbDok=; b=I8c76V0WJBr3j2IycoQ6fudpYfmKcMgiPCtZn4ktU3uI0rQm12E
	5qvmlnV5mMbbqkpqgxheK0NweeRrWZjK1Cd7WQwXi6HxEyQR/MvK4Pzg2djOMQQU
	A8bSwBxjy4vbqt+2g0X62J0gbCVvyVh2cGdaFamkFkso7fTjGXZUgM9uvsJ2aXhY
	OoPtg1qQlDV5tFlDkGycDya/9G0AmHgKg1BW7WEirxee5FV0Gt2IF0Cdf1Qw0x9w
	jrs1Yz2PKH4LnzQKZC6A5TVwa6SI565vhH55jU37AO4lEhIu2ANGfDroGTQrX0Xl
	B1FbXFnnAkCSMNF8+4LmuIIn+pQJtcd9Rsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h98jnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:24:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e632390d2so541583185a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333482; x=1783938282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wdtbkCeNakUYTqeH4Ry5JPgi83jbpdaQv+DkmfbDok=;
        b=FJyM4w4oYt4TIpPuA/5OlD0FIYHkLKd6ECR9KcyjbWZj9qPhv8paFGxnfj8VLrFLC2
         qk4PwkbfkG6SRWSEEaFwCTgKFAxNp3acVJQ4Dl84WtV0FfgTbqV4gx8+S2Nfx+jY86Wv
         X4cz/PVVDAJQInxU77LwmPr3sZf13n0qnxk+OPo4e2/umCrv1wRsPdSe0n9MyA3ElNmI
         wU73q46T58CwszsLA8d0bdTPJLNaQ0Sif2uA/6o0mmquvgq1Mo2KQp3UG1WRlZ+mxjh7
         Ko8KaI9Ecr6BcKL2OkWhTfuaAKikl7Hc6lj9ZRlL73HNA+8IXQcPDadte06KEULhNnwP
         7jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333482; x=1783938282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wdtbkCeNakUYTqeH4Ry5JPgi83jbpdaQv+DkmfbDok=;
        b=WbUgkvU4ekWkICOTE+eBUit5bfpduzcjAPRhbZE6ZY5jNhV8q+Jgj+/tWuLv9DMaSU
         I1eFSGz8G2z0Ov7I3gAlat3wwixMQTvQWi3rTCnqcftnZptHJ86C56ptIm50TmWda30A
         z79gLbmJWxWlmxBKwewR/PukEeDw7c6bg9Ef0hPL7WeQbS2ljo2xxSLBDB7DCCwr7FE6
         WqGhS6VX8Uh2dd+46jkHUBwrxCfUyZWtG5yL4JgwKGi6ppvKOrhu5UK2v8/ghqbhSTur
         94d+Ev+q6mCy6IDI26uuzKJsPLOyGi6Cx4ZjHx983oWy3cIZjotfpAFZ+2Swq0eJ7ILN
         IkNA==
X-Forwarded-Encrypted: i=1; AHgh+RqiSU5td6Z2JiAyymHOHroOlELIKNnO4Hk6Mvi8GqHIHSBnx6GUHyHOIXAA5YGcu9ic0rxqWpVV3Uk7@vger.kernel.org
X-Gm-Message-State: AOJu0YxLZQxxanRyEgo0CTk6pbNsjm9LDDR1+YYU5Gza6l2y1iSLZPWN
	R9TPczrkvkCuSNEy70uViTFApTSMALdRp891GUJ71dwlyMhaFG4J/N/NOJEEXN5EGJ55gM+FyWc
	kLzBVBMhCQlSlQqcph6N/mfSxXZJwu18mKcTg1GzCtUssRx3JRMowLlWMTl0p63/B
X-Gm-Gg: AfdE7claOxV0ym98NPcBzGx0rZpnd3qhG1Jbkv4PU5S9UlSEwvnqoTLfvV7EkrxevaN
	fofVyvOsKcv1CqNYmpqBxAf07bruG06+y+OZmHwYHqpiXA3A5QsuqA2PecYINtItvBCKyTgR9H3
	UWYBu9d8+HaiAM14kTPj8EN8nUzEd5zzK7KDgHUWGt8F3sLXYjJAukC+bBjzfhLhQSesfOxAU4r
	8x3eev+/qt0B8BtIxMykpZmQTMnqRV2EI5kDpTmpCmO64RIwVONZYVzeao99wbIQWczBsa2hyLf
	lcsY2uNbdN7RakOEOU3wP+5o6uRZtYQSG1zUxC5lmTnaKX1XF1ET4zzZL+ovADZYrsoqpaur9tD
	HQKKyzzaWXNKzNbGTQlIaHbjRmEY=
X-Received: by 2002:a05:620a:4145:b0:92e:60c8:1cb7 with SMTP id af79cd13be357-92e9a46c321mr1295686285a.50.1783333482541;
        Mon, 06 Jul 2026 03:24:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4145:b0:92e:60c8:1cb7 with SMTP id af79cd13be357-92e9a46c321mr1295682385a.50.1783333482114;
        Mon, 06 Jul 2026 03:24:42 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm25593106f8f.1.2026.07.06.03.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:24:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dtc: dt-check-style: Narrow disallowing of tab in DTS only to YAML
Date: Mon,  6 Jul 2026 12:24:22 +0200
Message-ID: <20260706102421.343639-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Zwt96CcKm1rNZeJ+V7c56NV/q8qB+Iu1EWK/bSKp5yI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4JVpQWPNp446gZ0kEQJ022c1WGWJJcNIpgpP
 4DxhDjSG4aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuCVQAKCRDBN2bmhouD
 110vD/400VKSLyfhrtBf+CyVhLhbp1Hbt52C5adxYaWhXI2tuYGXiGKnf4HufiokpJLnzF3xY0Y
 HPPlUthyPVldBBEd5b5EBxj5beUtEpDJP75BFPzgN3x1A7MmFneAViAZVye1PvkLoqxOvXPG5eE
 q2o23e5c59VlJZqGThXl8d+Q7vrHvZdboHYw5p0RyLAH2YPqoNwoEIYV1VeTtfSSB74i2vw3h94
 u7G6y50EEACvtx8s+mdsPu+dXEZxewiHDH/rToOjPzCHJX6a6QOALTCX8zWvcYmEPhEHHR4ddaa
 wPypRmNQJbVNwfu4ZdCF3eTIq2jLO9pOvNmP9hOlphu0akRy9ERoIvkFUFFrOUzLwtF8caksQKY
 qOvGibK7fEXNPdEixZZnBFYZ1z8+EzGAjtxhBrrdcrmxAp5BxtGoYp5nUanNG4LInBLOOVZT0/V
 pAEtydsyL4UFAt44RxRMGtOKmBA62jgWV8+zCL9TpuhTf7yRvJ4b/EpMs8dNIA3RrLJdbUKR7bj
 /ipNzRy1FYP+h24bi5535um/QVvy/v4DzynGvL1leNIgwYV2UKW3oKp0k666VjNYgeiu7dQYTG4
 Z/9MlH6LZnv48R0ipeoze45f/1Fay2Kmv54qaM4pPhTKH00L+ArQ/l/rMVSH2VUlI50SyOpCxFr TPwzogaIGVy28kg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xs0YuXOt0afYGIOTigK4Opx8E8sWoJqz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX/fSg2GYgClza
 bufcToeOevtgnujawTu+5YWqw4M1rrd+bWjmO937FmNCsJdES60j0Ma9HMFCCXVWcY5Kl1pTXRp
 GxJuXfB92KSg+5DS4EQOfFc6f25hsh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX1ozHW4aK2JHw
 np0J8NrmnhnRpP+/5dBavniE0F4W9IkoZ4pYqWmB1Ziw0xmblkDfvCp2BvDqpPpzNLDdTtg/iN3
 z/p8O+1pzuFwSo0WN7wqNziyI94D8ZhlBic2GJXtW+Lj55ueMxQa4+i+lPHsQ0KpbWGSQzs03CV
 LHbOPNA7sPkRjhKDKgtrNU/ERYe8SCI2uVkZLPjIcQ9y1gUQhsTzM61UhwPSCrF8TgrSbpt1pOz
 PV4Gth23ggDx2hHduap4Zb9v0sEg74EgSUNwtRB+b90pLmCARzWU3jofD0wpibxkA2krD5LD5HA
 xzaCnUxFp6kWCAOSvj67pnu8mUARe3b+791uHH00mi7h8O6ji/psXO89mOJ441K+DXY8GW3xpQ1
 HxzXy/qPlvZH1TCST7kUGUnKbfwd6Y+5gFxyhp2QqMYCCgJm1E/ryYl/oI4YFJxJn9tSR037WM+
 VzV92IHaWSxQWngwtOg==
X-Proofpoint-GUID: xs0YuXOt0afYGIOTigK4Opx8E8sWoJqz
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b826b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VZw0atn0WgoYOWIgC3UA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060105

DTS in the bindings (example in a YAML file) does not have tabs at all,
but regular DTS do, therefore entire check check_tab_in_dts() has
confusing name and should apply only to YAML files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 scripts/dtc/dt-check-style | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 2d5723d41ea3..34e0f7e2a57a 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -340,7 +340,7 @@ def check_trailing_whitespace(ctx):
             yield (dl.lineno, 'trailing whitespace')
 
 
-def check_tab_in_dts(ctx):
+def check_tab_in_yaml_example(ctx):
     """Reject literal tabs in DTS lines when input is YAML.
 
     For YAML examples, indent and content must use spaces. Tabs inside
@@ -929,7 +929,7 @@ RULES = [
          check_trailing_whitespace),
     Rule('tab-in-dts', 'relaxed',
          'YAML examples may not contain tab characters',
-         check_tab_in_dts, applies_to=('yaml',)),
+         check_tab_in_yaml_example, applies_to=('yaml',)),
     Rule('mixed-indent-chars', 'relaxed',
          'indent must not mix tabs and spaces',
          check_mixed_indent_chars),
-- 
2.53.0

