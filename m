Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6263815E3
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649086; cv=none; b=oSYewES3zWFgXm+DosXSLX4ApIqVbm71uIF81JlfnnFJxYb/eVWWt75awZ+M7OixH3zsGHeYc1HX5FTnEYorAb1Gytf05aIIoYcn7Tnt9P9fXXszh/BpIK2gDrm2N+mKuHH7/GJSI9mOaYhLJBaLY0Z2apYb2pQGKp/4/A7sdn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649086; c=relaxed/simple;
	bh=jmfZMXY2+BGGtZtP2A9SNqzjmS3weGa45fP0SoCxPEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYJtdvEVdnMGMJTYtUizxEJBa5ScAZ+o9uxhqxIpSDVUIHRzdYq+9avrtEkYGgf9N9Cd9CY0CxAo7U5ow5AL2EAKfBu6Jcncy+qkGeFE2+4vd92wOh8Z0n3a2mQ75PO1TcfOSs2q1Uy/j7UsdaC17NOfSrXOZsFPEHOWmUaplcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXdB89Ju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdhZzAns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXdB89Ju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdhZzAns"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfw6R1707197
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vz/EEJCGdNhdhKJw/J0AWn7zxktXXb18r9YS1k8E0N4=; b=bXdB89Ju7A76OwZ2
	QfhsaxrF7n39ciS7RuE581bO/a4Bp5g/ajzoU4Z29OM34AKGvZb5x9etCMgXjgEs
	1YqOoCS6nrsX7PjnlEtxno6DyhsqWzL9lGOP6rj2Fy9m+maokQ5fSDc7uIQoS5J4
	thsq0NB4foYU3NcOjeQkav/nXi10v1/8PgQz2BiXN+oujoAELnGN0rZQUjKGAVU+
	dqwXrY5o/AlZC353zJEL2a306U/9Ur/gaZRarJkfoUhmuDNBjpvE3gx9ykE4MuT+
	8MxXOwpt+EwG3oUAMXp7vAbHBf+Aput+96L8/YN8pZREkFa339BB0ChowuXccFID
	fPVtOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae8ua0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so310463491cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784649084; x=1785253884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vz/EEJCGdNhdhKJw/J0AWn7zxktXXb18r9YS1k8E0N4=;
        b=TdhZzAnslmyHU3/r8H8ynptWP+40jyy34eZndspct0U9ZOgNED9OAmJHdaynEyaLpv
         9CogW5ryiDXEEJ5R8SDL+pNGU8QGvDU8MyXt9TX/iOCov+1iZmBSl9Dz+P8qbU1YyPuf
         jwBVEeSa0ggebI1fw3lyKsHRePG5Iu+a2fRs6idalrDTRvPOWk9Hsz43lu6KvrfhaJ1q
         ++D/p0uBffDq1CX/HpgScwEgBTCq2NEtVVou/aP1WXxPJDb/qOlPWamlJblJ4VJ+XzrI
         IEqlsIIhsnJUsWw5Hke84dlH7RN4V94Bwv/kEb30uuL/qgw28Ax9DT4PmSOP9Cvco1QK
         27NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649084; x=1785253884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz/EEJCGdNhdhKJw/J0AWn7zxktXXb18r9YS1k8E0N4=;
        b=cz9lPVHaf+zUZS0yUm9tRyEgGxN84yk2Nzy5cc5N52qvM3I72mrWXMG+vqCQ/uMOcY
         f5m+tOXC0Gsq9+jrws+x3abKZ+gbkKCD86ERJvpjx71aBSdjOiBjwPMJToQkvP/2S74T
         DQegZdp2ZvqlGoI/31/zZSdshZGQGMX0M0UMhq3g0DA9GU0lURSf7rvMzFWEiVbegxLc
         YoshmbXPAdW3L9SVB5IqapOYEYTGEifK2cb0ZT7m67EqLwsLQYDxD2w3gifC26iqY1IJ
         G9cQ6fxFuMNlrY9zJu63xOrx7aC88cYPkQTM/aFk7QuxPL31YBxNuHNHeCO1PlFtrBEU
         2sgA==
X-Forwarded-Encrypted: i=1; AHgh+RrLoRxbsN3Gv9sARs5uvrA3ao9lOoch7eMWBtBhhxLs2zO+rGnRSeb2xyMkEKobTl/ZVUFCPDKq7OKc@vger.kernel.org
X-Gm-Message-State: AOJu0YyNpLdha2U6Bb8MZOXIwdgA9ahNxUvPNmb6KlhNiLBuhvv4iIpy
	tnsLFgwiT4FpzQOlS274/Xnc/ZajhcGC6ROd9lPtDd3mQE56g1v8D2PyA+sa2kzEM4hzcgjbeJN
	/eHcAaupEfj+UcYi/XnaWKUvexi63yXmQg2IcK8hHIUCAWjxntUTh4Dunm8bZLLd6
X-Gm-Gg: AfdE7cn6R33kz/L0ve22Lma9ykHqlOOh/Pgl5Ah0S/g5KjZ/GO0JbanxJycnFk8iHTf
	1uzYaEcjFbRUX+JnNc1izxwLcmTWbWo9sDbTtGRJ9dyBNBWC3BYIgCjkmvYIvri5yPV+cQpJ1bz
	lJk3R1qj5uTl+waQLgxmGlZXJBSvVZqKGhwz5dMHMkmtjwrS2kj7/GDMxXhCcNjyz0S1Ct0nC31
	6sCNa3q0eRZ3ncW+OvubKsWIi3GvHZ0SO131BlNrjfckKPZ+7xzIykrsTTYTr2xrWaZ1yv/xlKd
	s1cFKV2NvgsbLFJjhd9JJcFXk0OpcETZceoPBd3mjvgWwLxBzICLuh72Qwteme7Wlrsrsz+oNeO
	7z+ktLO5sGpkPDnh7oKlUD1XY
X-Received: by 2002:a05:622a:e109:10b0:521:987f:bf28 with SMTP id d75a77b69052e-521987fc349mr109884291cf.46.1784649083205;
        Tue, 21 Jul 2026 08:51:23 -0700 (PDT)
X-Received: by 2002:a05:622a:e109:10b0:521:987f:bf28 with SMTP id d75a77b69052e-521987fc349mr109884011cf.46.1784649082794;
        Tue, 21 Jul 2026 08:51:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de8895dsm159554075e9.4.2026.07.21.08.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:51:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:51:03 +0200
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dt-bindings-qcom-soc-naming-v3-1-8f275c9d3412@oss.qualcomm.com>
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
In-Reply-To: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jmfZMXY2+BGGtZtP2A9SNqzjmS3weGa45fP0SoCxPEs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqX5VzIVfQ2waj6dbzWVAcHJPjffqTjYAVlXk/d
 VR2GPMn7t6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal+VcwAKCRDBN2bmhouD
 10GiD/0aYNHgugvdT6BLRHed7nK+F+GLgi4cKLWDbqPp3boh76EIkjCBQ8MreauAq7MwQCwDbpJ
 KfDtNGZkc8TA5gHE+sXrgrMTL+wyd8Q9a82+/x8mbhUzpDxIRYBf+cJt8likZuue7glKx+Vt++L
 bdX3MBnHYG+Lv2yuaOfEvELUDN7a3lp963soC0sSduPg1w0ZYI97AwSfkGYtfTeXlVT6sSxgXOw
 bgqFEsTCUl8o+DlkjHM//8/tXq99qE4Jv5M+HdgpGp/BR9AuXCvJ+bKUHZb0qjRFDFZCd6GSGim
 raYXR9JrSD7QnLTAKNwPba5/RmT9jrzHhHgMMoDOkC9uK7VaJAshH0TWnIcYNAqYeTMzjqQIAK9
 aL/Yxg3QUp6p7JKPSxXrHXQWbhTSfL3RHTIaivMNcMPuEYhWEHlRrC2O0Q1nOL8taG8aVHqPmkO
 bUQTAHVOgAj4qGOdP7Ul2n7UhR/HbDUSsso1KfjR2SMM+dMfKm1zmg0HEwuu3B/rl95Iv1Kg//K
 mJ+wM6nMLtXHC/V9lLF2ld9roEIGATOsoBswleqD2ww334b5rQkfx6H0fGUe3zT9zcowHd07Q+u
 bVDfw5TVd8FvIGyVvjkX6nkVxtrDqRK3kveSAkQRv07/TKIPru1u0WoaPBDqryWdh+nshxwz8OJ
 QkLeIBGo+u4vMkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Ry8Klf7Ynuo9bn-1xB2IOxTcmK8wj0dd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NyBTYWx0ZWRfX3QJKOAmvGCTn
 5k0qRvx7e7UuCzlqZIIkLET8NjlmuWU7x5EEiXz8vRcGCWNyFc9lltiMUXeMVL4b2qTGepLXqN8
 OszjvzABzsrSs/BRnZ8u7fk5Z4lDz+c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NyBTYWx0ZWRfX+xZXUROFikHC
 ApMETB6NnvP8LeLDwwi7/US8A2vWWXdDYAiS/dgSPLRxnusCnU/nHbWeK3/oRxbC9IqZafKdXaZ
 PartPoC7ApO/fd892Xch6a5MUfOd6NoaE5uKPfwlkE9byRM+aCXDuPTdj+NcwA/sP2zPvFW/Yro
 61zTQS5JDV640H3FF3iOTutS+yPQXpyNHB5LwiqBvZu+JJorZ/0wwpGKp2Pb19NuZ08n3ud8DnJ
 bJs2TCO01SaV26YsLiPdQI6uc3qKSC2GnWbsOUpkrd94qzcPbXXk57EHQE2bbIDO1L0EsHDxxHH
 AzpIVAdp90XmGMNLXZkW5Dv9i4zUGLB270lJQsnZeRI57r+rIzG5yzKZX6EmuknFImtWFhuIPLr
 5WLMrS+HBYP5CqcrNCFRyojGo5QDvsioKuDd1S1/Jb1AjO+KVdBZjL1n8CKP03HJe2zDP+kDLNw
 tArqiahOZ8hnYmQ1Acw==
X-Proofpoint-GUID: Ry8Klf7Ynuo9bn-1xB2IOxTcmK8wj0dd
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f957c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ujLjCFpqU2tUUBGeNqAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210167

Grow the schema checking for proper SoC compatible naming style with
recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua,
Maili, Nord and Shikra.  The list covers only SoC IP blocks, thus no
Hamoa or Talos in the names, because these are codenames but not used
for SoC IP block naming.

Since switching from model numbers to codenames, this list with explicit
codenames will have to grow and list them all in order for the schema to
work.  It feels like a churn, but the compatible naming is still mess,
for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
style (qcom,glymur-pcie).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 37fdd5a080b7..1f9e52d9968d 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -25,7 +25,7 @@ select:
     compatible:
       oneOf:
         - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(glymur|milos).*$"
+        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -36,7 +36,7 @@ properties:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(glymur|milos)-.*$"
+      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:

-- 
2.53.0

