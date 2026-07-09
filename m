Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B344195B3
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618899; cv=none; b=Luj2eUt348O48eGSjTfn10PGzgL/HDCNIW/98EEIwnkAcf345wDrCI7nPBXMQKRStfwrvmZ61lDkPE+is+zzpzmjVGXvhdvxWiSo6ePKaM2Jtb/2wXE47GV00aYAODCixOgDQX2bVDX9jSomDwB4QylREd77BLYP6F2ZVkILF1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618899; c=relaxed/simple;
	bh=G2bXd/eL1oQYJ0l760V735gooPZRhUjHojCT2I+xTys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nBLCEaL0SywvXls3bzsEcpy0PxIVw1cXocx8N0zE2oK5Z89X3noj1OuD+a2hJRBG7DKOMxMpAdcRckN8IbOuHx8x6wXvUXavrj5w75Mi2OsFtXWhRszah9u/28IcK0kdplS5A81L3Mr4thuND+kn1zJ7UOCaxHhV2FKoMN/ZBdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DA9NUgDS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHq0GwHb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DA9NUgDS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHq0GwHb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXJOx2386412
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iz6MMBBcLVyXem2iMOZHffZZPDG2zluSgPsoX6bhY08=; b=DA9NUgDStP8HI8ZF
	AlTlVqeWQuktLz+vx4iJfPCatQreBCf75xz9qbtizStVO/oWZTz/w3OBJ6L6RYLT
	+oIEjaOWRTGv4kQmFe36wmVATrlu1Kj7FtmPlkWatwWoGARLbCSJd+KdQxJrFJ9e
	8hepcXjrMEZROpg7lr4mZWztZDG2jKPIUfwHGoQusWkIB4/fms8nmGJmJHNc0VtG
	ErOEHK8txMxjfgcB5oUzUxsuhomcx2akUmBoyyMrRSMjge51ivvgB6At5dN7Igcb
	sX1q5WmtccU94McObeCrCzZPBtHmWSaBFw0CT8XYfNXyzMxGM0Z/IljxvJdaFb2h
	U/q0/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydv71c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:41:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c110a3b6aso507341cf.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618896; x=1784223696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iz6MMBBcLVyXem2iMOZHffZZPDG2zluSgPsoX6bhY08=;
        b=YHq0GwHbQNmO7yOK2A9WPMFOz46NIgKueWvYokreJvTrrVXPiXzTtNQIZHqIm/jgO/
         WizG/UiewVYGh+xPI/6OyBJsAlEapoE5bm2arzeVxvDN37yheTD2iJBBf7B0pZnBOVYH
         PtAT092vsEsdf7txzLNzd4EVS0jwtLRdaNNKVRk7MCewVXsUhnVvoWG0YfPbLIQWSddr
         GIh3pIBFemC3bwVhyW7OLv62wDxe1C8CV9+Q+aK8seZHAOE+UL+cN+zQoAnaBSslWsqU
         0MWXNpTUGYafxwKDm2JVS+d7yllBTM/DFD1BGogAazN0K6l8p2OTSdEQIqpOjWoCKsJG
         6U/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618896; x=1784223696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iz6MMBBcLVyXem2iMOZHffZZPDG2zluSgPsoX6bhY08=;
        b=RSZEgwkWOGi7gmXpLXmeMFKZwJaORJEbwcF2GuI6kYDsY6LER8Da9ISBN5EHm7fDNr
         DO0AGVA3XZ3jJ5Ej9ajBYruM/EaQyHfvOVwfuv2TfwCtM1V2R7SW0OxheE8iS1GPJeRW
         COEIm5U5wIDtlA/uHs3AxDnvJYJl3z1UBcZBMy8mpzv1scBFjgjnRKYvscxsKVS7LxYv
         cSu7WPGeFkxrBPaZMWP/fzzr2TqVIwXQ+sIbNu6y7g/LzRnM8J6gkHqOPpH2s1b/PBTt
         4QISRM9PpB3AqPFDRXby+8ryaEaALew4jX/VtEqkmRFzGfzZiyAHGkq2zy9lBqqPLEFB
         F7Aw==
X-Gm-Message-State: AOJu0YxxD/f4ZTPYayJyQDN/IhFbQRENPpKC1QRYPfNV3M4BmSiqoUPO
	WUVY/XSOon19mrd6Bx3pnUttou9cAmRgqQ5eTr4VnXL68fV78JWgNVam3yKylSjYnXEJbC+XY9S
	ui4HwUm2jfdst0EPfCQc1hoNYTODwStrdfGurR9vwML6LA3tlL29a6a9/2J5axkeW
X-Gm-Gg: AfdE7ck11sFQTG68UqHaNxzF1wiAZdr28C7rNb7x4fXPwWt6fSdQOmISWSS4MLx9Ly7
	rC9PLgSfoK1X7dWoZSM9ICWQFiSfFDUhQrVI3xNIpZRfA7aGgRF9+3ob4LOLYK1CS2XBCk7Q/Hb
	BIQrAxS+CM8fUnQYDUf9lJAzWANuokkxZGeBs4uSk2ZvJZjfCKPU6yYBflGW30oy7tR4CHIFtjQ
	OPQAsKlAH5oCa7kvaRyd10kFDM8OvQ6aWwIRuU/OHXaZiLawwcj2j5WuGaK6sNU+UGLU/mVGHTP
	7xoLSVMCsDr6BMwilgGtQN4/r/R/vpBn9HLb/jbfp3xndbQatz2p1vb2lRHovsUQBIQfway/M2T
	BXDWJiOWW7oQmk1Agh7S9Ni4byspeShF2
X-Received: by 2002:a05:622a:1925:b0:51c:1291:911c with SMTP id d75a77b69052e-51c8b398cf4mr102047051cf.14.1783618895887;
        Thu, 09 Jul 2026 10:41:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1925:b0:51c:1291:911c with SMTP id d75a77b69052e-51c8b398cf4mr102046801cf.14.1783618895533;
        Thu, 09 Jul 2026 10:41:35 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm55174048f8f.21.2026.07.09.10.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:41:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 19:41:29 +0200
Subject: [PATCH v5 1/7] dtc: dt-check-style: Narrow disallowing of tab in
 DTS only to YAML
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dts-style-checker-v5-1-fcc147cb697d@oss.qualcomm.com>
References: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
In-Reply-To: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX7W6QmtSXOwzw
 D94oE95Y1zopAp9uzPJJNYhU4URKx3vzmWcFm/W04GJXUvzAunXcFWNqCMZ2anLI4OTFlp/u4zk
 aChoeVtL9i5ccKoqWm/+OJ7iMPssLzo=
X-Proofpoint-ORIG-GUID: f90LdNqzt04TnllZXGRN2o5IoMOXOjCG
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4fdd50 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V5pUajA8bHdET0NC2RYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: f90LdNqzt04TnllZXGRN2o5IoMOXOjCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX4wUgfMtHqp3l
 1K6kl6KGAwO3zexfcX3lBx7e30J6eIGtLoERLlMGwrOUfXlxq3+fjg3AdwmbZ9THvuJ61jBjQ3P
 FS6kX8UIr5QnpOpYSFQ9MsRl6OFMJKwkh20uziK0SXNzkypOoU7jmggCyqeEcpXm/VfVuyyuxeZ
 inJq+ruweFs3h/bmV1uU2QgQRQTyjh82N6x2u0PF/pasRfUD+7r61EKK9mV4zRKVdliAMWG0aUj
 x0josUVcz7cqbjuJDiae32NOk2UAK5ScRYeCr7tliGnQ6k/kAfyVB+pCgIwPF/GnkPUphtM8Maq
 IxSGl38AxyxCR1HOajkigUN4Z8ipEVbNkxau8Uy6zyDWrYxgIWw0o3CEyEpRwcYdTdy+0+d5ssX
 bHm5WNGWXe8mQKpXCSLOMq60bgsQKQDqfPJUVQ9payYvT9XSk5w8zL5tVM0FITmKq2b4nJ7Nh9B
 v1RZLf3Ggz1J7nsTKMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

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

