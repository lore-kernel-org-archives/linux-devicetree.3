Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44E7377558
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221032; cv=none; b=Y5frBmncIM7fS306p/aMuxHF2R43J+Y1X8RQtvpt2zmxggNuJxfuXAGB8qpe5MSJDvgP79I+dOnF7UwYGnnT9seuGkApVnV4hZqRsWSeqgQNI16NBpkP3GfCavYSwRE6jsUibrD5pb7KSt2RkrEzhLeKMqW4c0OatvTKH+O/9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221032; c=relaxed/simple;
	bh=xefJf4taNqzjGatAXI2rBWohd2g6rjPS8P4XTRUHYQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2IPALZJN4x8pa2GLCvJI0V65o2eiKFLtVgS7cXc6AWm5CIwvYEMDBcQYrHX0mSaWNaomR4CTGj16VLWCEDWMRSjRaHA2nzxk5DRALB4Phyefhh/pZQ46lwQbSrI0WecTj326sZWEcCv8FaMy5wJM413iHv5jP0UZqlsOaTikPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLq+QsP5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUApPWnz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLq+QsP5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUApPWnz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExLnk1237954
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGMEPlMJWjNErOCLYNyrnbFEdPZNeBMnny9oGDvpMHM=; b=OLq+QsP5NS1+70rD
	5KGl0bj+lfC7dseJQLA51w3kb7u4y8IQk2GSLbCtx4KNsVkO4Mf/ZOR7zZ+OpHTH
	hMQbZqaXdR3O94W58VU76z/Xg2HBuKmkufyiB7hjF9kV5QBROP9ew4HwwU4ZxTSL
	puD39fmcyUWxnWJ1k9dZA+ZFwmW/CUcA6vxb1dfg2K7fI3rEETEv1aunVgZwCv1F
	aKSwpx7hnTTm4ol1KZuJ41lhjti0hmJ51OX6OSbLkgeFJ/qa3pVz5Fl7rdV8X/jK
	E40BLp4FlKBOFiMJECbqG3M+eBCFbhl3LnoPwf4iuuNYV+2hrYkSCHXXYxsbERol
	/G6cPw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3ss9d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:03:50 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95f5daf2d5bso6632147241.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779221029; x=1779825829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGMEPlMJWjNErOCLYNyrnbFEdPZNeBMnny9oGDvpMHM=;
        b=YUApPWnzrUJqxxwhyBkBJP8j8yTiLBA2Ie++c8IA6VdtSbIIQWKwmrMAfQeabJIWLy
         wwll7FHQVczqGGpw/d6QBpxDKvQBktWQp7FvtmOTBjR9XlFbz0dmgmQBoyzpb0gk4taw
         bY9yFaWz14sgrpypQRghNPRHeJCf37AwDG5wVC4hT8l/ngPlm1fOOFCM2zb2OVhkot18
         30hqMW1e2gzmIAcAKAMvqxit0cXUaLJlOtKFqMIwNgapAFrpGuF2rk76hH5ztQHYnQdm
         o58bOIlIyfublO+RzONp39UkbpkLSFHpdHzQlY4LMYuQvk5q1rz1++E/VIlL999emA79
         G8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221029; x=1779825829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fGMEPlMJWjNErOCLYNyrnbFEdPZNeBMnny9oGDvpMHM=;
        b=E+wIn7p4+fRrKaXL/+IpOxGTVskj9tgUntlfWDllkjrDVgTJIwArYFiKyZLbWPwRgq
         K2x1jzzrn6IecQb+PIq75+c0X1AUkjZjMsyYLtFEbEOH9X506ZrISACGTijkjfzUxlF0
         HkRBXRMEuuVAYtbVLumVib2mDYWZ9/gcj+//vLvfdXgC8HEUiHPAYm/IDO2Mo8pRIqn3
         O2V7GVncJYDcPPgbWmvVw3t9N08bvAERYyIW/+2CjMh8FctX8y1oB9eI/opnVGJuJLkk
         B4OMW12czmCOAvLVuJghSz3Cy90mcg61isPPImc87oebahX/c+d4wAcuh2/F263AZhEf
         6XCA==
X-Forwarded-Encrypted: i=1; AFNElJ8jmQ0dxWuYhjWiekLNnJKuBXzRz2XyMDmRnh9zuO0oaACcypGMd85+riyPCQ7fejiKrwSSmt8Deh9g@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr8cGgX4MpKe9ZIpGocKGAZ9g7HiLfbIcLJmUXkWyM273sCgDe
	wg+3Yq/KFe17Grl4uwsN8NEaWkiytARESlFnP2PlAv384N7Py2eR5vlElHRWJvwZdtV8mNZFhrr
	Lnpr8H/xbJUgIOHfSoMW+XNF3c/q9snVWWMJVQ/ohzKu3ntnaEh9tphPpLcsar/eK
X-Gm-Gg: Acq92OGbniesLqzU1dkfDHSmskk/jIqglJLieoW9xWUUJhiElJlWQePCp1diyDacWfN
	dc7bYDWDirqSl9eVgDHEUT5WDWYiP3/fpNc+mOv0dfw9yVLQhT6S/6RXLiwAGVSJ89AbibyYUHi
	G6IcKPQk5isUhVqgWVyqgl54Ppv8ym0EA66TPfIHJk0O9x/8dmigVl3/DNc+UERsWZsxA/zQVyP
	vfdp/gxf3Jnqc3agZlRYZnnPGACXFI+ZhMciWTbusDevnyl9LSuX3z6BjXHF/H+qbwixas3xcjV
	wDMJMID2Nx8ZHaSFOL+CST9ncn284EeYpStW8FL5tjJz3Hhb9JgIguFnRDFoMoviKXFmn0mJJ0F
	upJbzv6zpSnfWAziW5iR2YAUQALOIyhh2qOOzPRdtszXw
X-Received: by 2002:a05:6122:8482:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-57748e1c34dmr5761319e0c.11.1779221029063;
        Tue, 19 May 2026 13:03:49 -0700 (PDT)
X-Received: by 2002:a05:6122:8482:b0:577:48e1:8aff with SMTP id 71dfb90a1353d-57748e1c34dmr5761279e0c.11.1779221028659;
        Tue, 19 May 2026 13:03:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe794e7sm112085175e9.30.2026.05.19.13.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:03:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 19 May 2026 22:03:19 +0200
Subject: [PATCH 2/3] dt-bindings: arm: qcom-soc: Document more of existing
 legacy style compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-dt-bindings-qcom-soc-naming-v1-2-005d29d261ae@oss.qualcomm.com>
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2848;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xefJf4taNqzjGatAXI2rBWohd2g6rjPS8P4XTRUHYQU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDMIbSFhkWJQzBS2n1vWuQsPxGIic3orKP+8KZ
 cr6FuGWMfiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagzCGwAKCRDBN2bmhouD
 14MJEACSdQyDx4uTVhQqkS6AfLxa8u25yyz+hh8GCz7z/JpZsKI0D4a6wlXxDI4kg9PLuJ+OU1y
 I0GPqwupCgy/vI1e2v76V758lpoSFNIOwVZ+zVRRDY1B1NRK2xSQdVuaAAVYVjxVtYs1iT/P5KQ
 GoeGgEGfm0nIL5xQxvmbdp8sdjgcUY+OLKf88+W7dMM71BiqbvklOno12VjsAivHxrgrQI35h4j
 S1OD7lCAOTmf4b0f40pNDlFLT4NgCptUB4s+JTnsVDfVkfhUwx3i3bSAmzvoFSK71SuTr1N+Uo/
 rq271h/XaU9IarPSYnfSG+TvC9N6F4Ba3jG3zutsiIBoolZJQhwEGDTY3hokpdQpF4uSIKU9ywB
 IRcn8EF+bUnLEB1cjSgPnOBr+Fqbgbnz7PdL+1UJs5OrIJLasZhO1hObek1ZnVPFewz/Ws/gJJN
 9wpNKJYOxYHul/8n3DccUWi+ohZCx6dVAVFHqRyFh2KzG8fCzTVfi+PfIgRlQyAG+tA9r0KClzz
 a4RWGKH/v9+JmzBqxqexDfG0qnF9FGqIhhbHr3UIlj25G6dnEpStL3LHfcVHE0usFGH4FRwZU9g
 eQLzPH93frUFl1kFi2dMr6pOjYZl3kci+K31qtfzRF65ZSYVYPj35Jo02pKQax/zyDXPuDVjac1
 kjB6pttrzhZ4rEA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: _2wW0GIhsZfi262NcS5HJW1CARvczIiq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIwMCBTYWx0ZWRfX3BZQytwjvkd6
 o2OXe7GYOWp08jl5g0fk3DFQYRNqU0hi8BLGv6p7O0+gbatQpgI01K6mJ5+ftHdxMBpboTr92Tr
 PM32rqhyvIEx8aefOfG9mn7mLTu8UnsK6KM90QG/fLdUiO++N7gHUBT1szQTtTvPBx/WZokGEeJ
 /SnKwTILSLQymWHbZLM6I9z7KsmfmWRMaasQNqk0NbDeMGGH7tkJitlJ7xxi45vk9pttPF+/BLX
 qrywA/CoHuF9ws1D8zjy0KzYe9XYkOwbdL+JzvRaUM/gdCX4kZRb9LkSHA4h4upqHWvKMmYVb/s
 5FUtfpQ6kXo+DitdvjJBJKvGQKb373SwLJurAhWpeWLQ9eUPfVNFETQt7dzY+qN4vplSstGILSr
 eTfNCqUHJHjOjtnzk7JYZUlQgBD32rks3zAjPdERsNykF3caUSPbPf5WYkwf26/NcLXfsqqtOXl
 GpyMXAj8gkUKdYb/Vsw==
X-Proofpoint-ORIG-GUID: _2wW0GIhsZfi262NcS5HJW1CARvczIiq
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0cc226 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XnlRSrfGtDqKx9uIGdYA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190200

The schema misses several old style compatibles with SoC component
trailing in the compatible (qcom,IP-SoC):
 - qcom,apss-wdt-x1e80100
 - qcom,apss-wdt-xxx and qcom,scm-xxx for SoC with code names
 - qcom,kpss-gcc-xxx
 - qcom,rpmcc-xxx
 - qcom,tcsr-xxx
 - qcom,usb-hs-phy-xxx

It also missed qcom,ipq806x-ahci.

None of these were flagged by schema, because they were used with
fallbacks and the schema checks only for single compatibles.
Nevertheless document them for complete picture and for future change,
which will apply the schema to fallbacks as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index b5f3a750cce8..d7d64e0e146b 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -40,12 +40,20 @@ properties:
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        # qcom,apss-wdt with codenames
+      - pattern: "^qcom,apss-wdt-[a-z]+$"
+      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
       - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+        # qcom,scm with codenames
+      - pattern: "^qcom,scm-[a-z]+$"
+      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630
@@ -61,6 +69,7 @@ properties:
 
       # Legacy compatibles with wild-cards - list cannot grow with new bindings:
       - enum:
+          - qcom,ipq806x-ahci
           - qcom,ipq806x-gmac
           - qcom,ipq806x-nand
           - qcom,ipq806x-sata-phy

-- 
2.51.0

