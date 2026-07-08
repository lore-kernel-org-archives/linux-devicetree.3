Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012130D406
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521657; cv=none; b=o4qziCbfjdCIOY2wLlUArvadr/31l1UmsLjgXVkMZvmXPBdiAIGvk+2A5CS+IkH7hnF2QF+yisLnhK3KWTssqLBiIibQPrnTJhbIPQ1TgzvAYUD7uhjEBuM7bYK7iWgxtCt6W/ihnmTKAP22m62Zfjsmy3On6eQne+baL614IVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521657; c=relaxed/simple;
	bh=G2bXd/eL1oQYJ0l760V735gooPZRhUjHojCT2I+xTys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SViHBTI0nml1AOG6HAYPju0mszV3bZDTNRpeteHVvyAZbjAwWP/zyz6INExJCTbgBVrWhPC1/AkerU0NoOehXM/TPA0OwhSUp5dg/gAwolWMZyMgs7LblyBb+8oVv7mPMxQ1oNTEiziUNO4IXUfXjmYJ0q0nJktZYxIOPHQ2agI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqwecQcT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A24EM34j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqwecQcT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A24EM34j"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Exq2792336
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iz6MMBBcLVyXem2iMOZHffZZPDG2zluSgPsoX6bhY08=; b=eqwecQcTFr1OiPSL
	TndN2ddrRhP8ypovJvVfsXmjgDAdowguc7YyCUap9S57FFjpBW5g8IFqR/zcIAVJ
	DdmR1HDo41YpVVjpxpQ146BIhbRqZ+NVK1vD+AuuDeAwi4p7PcgwC6/UrqNwgXFP
	wUOaA1MMdCDzWn7NPiiIwkKj761elU8T9LsgABYEUJWSBRPuXjTkf24Uy5MIAHu7
	2Cg0vblHYAlhN0dYUZRlYwJA1f5c84IfxUPqPp5Mp1Lwuf06cspNpTJj9GFp1iLQ
	vwtjc5FjMAAq3JOGwT04HxFxB457u0slnhNM0M6E2Pw/koMFA01MLbAnyLI6PvvU
	+qdR8w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cswawy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:40:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eac2620cb0so12455846d6.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521652; x=1784126452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iz6MMBBcLVyXem2iMOZHffZZPDG2zluSgPsoX6bhY08=;
        b=A24EM34jbu8xfqkuUEK18AWoDRYMAmNUy2SAbsnX4TYVcu7DfJAxbOynzIoaZDX8Fs
         MAR3Zc1Cy8QTGEn/4JUpde9UT6UqPfPgPUr9qsZnDy3uNGcOjb9wn1lpzUSWOc6eYW5M
         qJ5y6iS25xOYUnmeXOeRGGtbPt4qoafCSJ058s8UjJWJ/4XqL9V3gSQStNzv7AFs95aL
         mBZwpwseplOXR14vGgiKSqxP5lYwp3SAyYO1NWoSGpW18cLDtDICyG+n95EvvwGl7svG
         iC6+FooZM1Euvz4gMOfcYD+971Ah7swmS9czufVAOV46RfLVpXdHHuSFPOWQ6Wz9z5Zg
         deaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521652; x=1784126452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iz6MMBBcLVyXem2iMOZHffZZPDG2zluSgPsoX6bhY08=;
        b=Y0TIHWK+D41b/CAZxjf7icw9b1NzW8+jl0YxXxs0imx4XPmAt79J91C6mh+R8qVeDY
         GRVBZmg695ik1VS3Hbk0BqYMTwOHr7ZcT0JA6TmlpbfIvpxDoFJ4HJ8P+CD3I7aSxJey
         92BJPj30OC4THklTDRbTRls9x3RtRS4HllRs70+cNAJRGfwiEXcaNONneECjgni3/usC
         vruS1RSpiPNdYwXgRU+OKNnFdy42ihL8daDTLV279gIMFiwqPV1IZBWzpZacwjFGC/1D
         NUiwdmS54XMGZ/iKXjWhevtKr6nHMap5uZiEitFJuFV/ssGE4i8wpGTnIoOYskxpmzJz
         RKmg==
X-Gm-Message-State: AOJu0YyHDeJySUeSfkorgBCzyPqfunwsQLuWg0f/ZM0b4Sa8nSTYgvke
	pGLScmhOWMd5/IlimQa6dydngy3McTv0kIh6Txeb5/MphsUBoeaEmvTKcSPd4Vk0saEFyu5dlpc
	TqcHJVOY3eycsXI9uQ0FhbDZTJQUZGTx+WoRvrW460k7HZMiSFiwqreEDzs7uC2wM
X-Gm-Gg: AfdE7cnuLrgyxqfPstDUWuPDQxgdcGnpnyJVQo6tTvAuPSkOVc9vlAXr/DviWOdzjzo
	aDtOkMDidMjy8+XjgB9EWQEZX5D9mtEe2eYtnzGVmYb6tbUsEVsHVUVkZAbz93b4Zq4Wn4JDZq8
	KXM7QpTM4OZI/gXGNo3m80iiTkmxxfRAJzZNSdf2hifbKKGIVbAkF0SHJNF4z6uOGW3fQIneCqf
	pWcwtytI4tZ0tSb8UluUoFDjUssLrqzQRqYPPJ3C/mPI9PX7ruX2NVbTVSEfENl9+NFII+fuzv4
	VG1/gOJ3LZ3U64FkbLPA/aVera/LsNVoNl+Xrc0E6KL5pBq97jzBEDSwjYJJDDeJaDE8QCO4XDm
	akHL/eyhnqQCt2+5r8x3WJmNsc5+GA2Lkqkc=
X-Received: by 2002:ac8:5dcb:0:b0:517:7277:9362 with SMTP id d75a77b69052e-51c8b3cc267mr28182261cf.48.1783521652551;
        Wed, 08 Jul 2026 07:40:52 -0700 (PDT)
X-Received: by 2002:ac8:5dcb:0:b0:517:7277:9362 with SMTP id d75a77b69052e-51c8b3cc267mr28181791cf.48.1783521652032;
        Wed, 08 Jul 2026 07:40:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15da821c58sm52543766b.48.2026.07.08.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:40:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:40:31 +0200
Subject: [PATCH v4 1/7] dtc: dt-check-style: Narrow disallowing of tab in
 DTS only to YAML
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-style-checker-v4-1-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
In-Reply-To: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=G2bXd/eL1oQYJ0l760V735gooPZRhUjHojCT2I+xTys=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTmFnkkhbzDmionuSIEQRDKoPgajxDRXyx4jNh
 PEhTbnWPOOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak5hZwAKCRDBN2bmhouD
 17JPEACSFt5eDXfF1ViI60gaOrhaf/iF6tWtnk1iHV0tYytB9hYz1wYiqWpQCwxpIguno/trMj5
 AlQqjb78z4ccp2si9Ecskma2lKzu2x8IS1f9zYdffuBZM7qQacKX5vupZvmnTp13WFwPPlNidHt
 tPMztfud5/sYiaiv9sWApBgXKKh/peVh38cXBGgLqj4OD4wJpCR3uPLhNyzJcRInmdjFC48IUYa
 gh7AeV8gs3etDD9RPXCLi32rD91UrJQXHncwnNNarPgzjCPpZsXBGojc+ozj8ru9vpuC5HiwcTe
 d7kO/6lGDg/fkXx5t2m/L8Wc0YWsHiRm/n48MIJ8MvA2tjtuZ0ZovzU5/hkUgT7W2HOha4QHCPg
 42Oc8MAnGR4qHczqRdgGiaJkcFrycLzQyoILJvcobzORWAa6FeCcog0NCuiawmg7oWiThonsEw7
 yEJ1e0oX18DeJ/dbUhXbtJFGiYsnIV5WpnQo4kTIyglTFKGglc6Umhxf8qguOec5Ik4NgyzAbGU
 H8YCsHwsheWdpSwUiyrTzsb6SFy3WMKdvVpyRVftGpcZ4s2ph2S46WcbdL2L3O/G1YtSqsiKRBZ
 TVGCQ+Bk4ManGR/iPSoO4pGPWyQxj3CluXjhYq2famq3WSl8cJfbzEHVT5wKk/vp+rUep/E4LGu
 912gnqrU50N0+IQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: sKOm8UFwXwjrIbZfTVaFM1XrN1kc_n7X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX7PESLjXu+XOr
 Ao2a7niMomIqYuFF7cAY27rRYhhgEjBx4iMnKslyMRg8WJ/m6SaBjCq/cJ5dVsxQGcX0Od3p8DC
 YLX2/2+BYIaqZz/m4y4v8t6B4wMtReQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX+VKTHKaE9Emd
 Bl8xgAEfAg0RHgbWCXTluBRA3fiuvKA/MG/uKZUGA6LbFUTvBE91AZIZO5UFq1djuk2sE15t+9w
 kWKCdKeUk0hxBMF6rFYzoBm1Imdd/DXrEUl1qAB8vs/Paz1bValWlOzDP+Iaa2dJCg4zfsNSYiv
 JiYAOSTnmxA/KkmzBC9r1wO5XjN1Rm20RaFt9nT4ohfxV7jp5rnecRiY4UxgVn9pcMp59qycNDa
 WAlsl04IAsSSQbj4XcOPFJdkpiocIfAVRduOleWGjr+0awlwkb0mnIIJvuKO4sNecXEXXJ+ckp8
 ZiRqsGlE7xt7ECxZtC69a0CwxI8tFpsSe4S1VBxrZRsLoK24DlO+G+rAiY53VnILwON28g2WAeI
 M7BzTiEezyK0/zsBiYXy+MbcI3vhv4z+WwEarnBzi+8h42S1YTaNs2QqOdlm4owpqfTjNDIt8rV
 GiKTRu1iqf3QDvMytTw==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e6175 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=V5pUajA8bHdET0NC2RYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: sKOm8UFwXwjrIbZfTVaFM1XrN1kc_n7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080144

DTS in the bindings (example in a YAML file) does not have tabs at all,
but regular DTS do, therefore entire check check_tab_in_dts() has
confusing name and should apply only to YAML files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 scripts/dtc/dt-check-style                                        | 8 ++++----
 scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt | 2 +-
 scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt          | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 2d5723d41ea3..29b25ecf15c6 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -340,7 +340,7 @@ def check_trailing_whitespace(ctx):
             yield (dl.lineno, 'trailing whitespace')
 
 
-def check_tab_in_dts(ctx):
+def check_tab_in_yaml_example(ctx):
     """Reject literal tabs in DTS lines when input is YAML.
 
     For YAML examples, indent and content must use spaces. Tabs inside
@@ -927,9 +927,9 @@ RULES = [
     Rule('trailing-whitespace', 'relaxed',
          'no trailing whitespace on any line',
          check_trailing_whitespace),
-    Rule('tab-in-dts', 'relaxed',
-         'YAML examples may not contain tab characters',
-         check_tab_in_dts, applies_to=('yaml',)),
+    Rule('tab-in-yaml', 'relaxed',
+         'YAML (also DTS examples) may not contain tab characters',
+         check_tab_in_yaml_example, applies_to=('yaml',)),
     Rule('mixed-indent-chars', 'relaxed',
          'indent must not mix tabs and spaces',
          check_mixed_indent_chars),
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
index c989f8f19853..4b3d990e0824 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
@@ -1,3 +1,3 @@
 # mode=relaxed
 bad/yaml-mixed-indent.yaml:27: example 0 [mixed-indent-chars] mixed tabs and spaces in indent
-bad/yaml-mixed-indent.yaml:27: example 0 [tab-in-dts] tab character not allowed in DTS example
+bad/yaml-mixed-indent.yaml:27: example 0 [tab-in-yaml] tab character not allowed in DTS example
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
index 9e83246fbaa1..0bc67ae48dd8 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-tab.yaml.txt
@@ -1,2 +1,2 @@
 # mode=relaxed
-bad/yaml-tab.yaml:28: example 0 [tab-in-dts] tab character not allowed in DTS example
+bad/yaml-tab.yaml:28: example 0 [tab-in-yaml] tab character not allowed in DTS example

-- 
2.53.0

