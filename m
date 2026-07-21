Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A2C46C4B9
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649093; cv=none; b=uMF8ZO/YZnEbeI6rZEmKkuZjpdao0ZbVD7yzas6fTFRcRh0SJbOZaAitgOErzAtZBme+mEkpt9PfH3e7mKoS02Qc+3+hjmE+fuL//y2cl0WbLK7zUX0bZSZBiC9llu8/wjXaNusF93yYIUZ5a3YD+soUb2pCh9dT0sb9UkgMJnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649093; c=relaxed/simple;
	bh=NBwC4NpfPry/8UlEyrp01sZtR0mecP3JsuRaB0z99ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoF0ytTWbARPMpByQlvTpn74Lg3CuY7lXhZthiq++QeHCn+AjJK+RB/btKzv6TQeSTRPGvfkizXV28BPlsegluEEntVLw/D5ujEBiC3R1CUU6O1xU7SLwVpcH6dc5i1+9WxbBvxVJElEuw9ZdrAKeTNgi52AnUGUOyHJGjI807U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zwjy+Jaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SH/5LaiU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zwjy+Jaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SH/5LaiU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg0Nu1841250
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GeKythKs+xubyvgoP4AielhBYuonbeI6p68hdxDxjfo=; b=Zwjy+JajO3/H6Gmo
	N+0eAlYcp2xnVQpvYYqAFyPu9fEYIiWnbmwBw0HFuGx7kK33ZS3jIv2no4lbty3q
	VI+cBtHlJG57UUkoJ9oGofc+VdxZYCCxx9JDGR7JbJLSsAKlLzzCFDwt2qFIVkCE
	qhQLOgHvwqb08ocX07+1ykSQxb++SdFrKwWf6ige0Yo9a+INRXlDKuBbEJFEuudI
	LhbDa2eAfXiDb8xRh70/1diqf/tnQ/g/cQaODHkSbEaTFQfJzdINsfS9x8yKgzn4
	HaTeiwuLgYONZ7Dn8lJOx7WJuAYjLHzZIDFA4n8NpSb/OXDPrYzN6tCnhF0OCj9H
	zr0bFw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se34y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:51:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eec6acbe21so306332396d6.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784649090; x=1785253890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GeKythKs+xubyvgoP4AielhBYuonbeI6p68hdxDxjfo=;
        b=SH/5LaiUrJzQ9/e8JYuvP+JaIAdvNnZ/5GcNuiUWNJyJ0c7qrIvVP723wzP7uqph7r
         lxMlaQPbh44zEtQTEvM6YwEGTUdPSUXdOgGo7p/mayLn1Ah/LbhTSylZb6N8n7kHWBoW
         iLulGaE8v73OH2Cf+f9zl4bcLG1YndvI/GhyQB2LISkQXaN5Biv2Dx/z2VLBiOvZHRLZ
         bAQDyd477uAHSQheECdGHh9jmZXByE1dfu/u5ptI4xvotpnEwUx8mHTNOLF8mx4p0tEB
         Rk6S8xvFmun8VWiVG6Tqd/RcROFVkzK1oSQZpTJnbr6/ox0BEozQsnYo7CHciOXa6pZw
         Z48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649090; x=1785253890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GeKythKs+xubyvgoP4AielhBYuonbeI6p68hdxDxjfo=;
        b=PuBq+bxR7q3xQVfDZCGv/nE78ojkzU5qC/g4QpI3rlGn4zIw/ae9XK9+JIfrGxypei
         6+Y20wcnSJfTBAc22ce0NgtdMKghYOOBbrKphSi/NszFLKklCoZ3nwjtamAcF/bx7U0C
         IGBfQ6OAW4MkpOSLRGFVkNlig64d6+wfIQ/aqIEQkI6ZididrWzdX9NJ9t9tWj783x5y
         YYxY+zYhgMIdXi4DNGUBtcdDw8ahls2ZlTqXR/hefW/1V8qz5uTtd5Tjwf72E/JbHV3G
         Q+a0Ix0S1WDTGYmwfwWZsv+2Upo18rrkQQFktCykqfNvh0fK0aOLR6Ik8Vw0n1zBd+LA
         gfyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1JBWI5yF/z5jF/itmlljs8d4XwSViSeTYHWhHN1YJkUcYJ5jGQRjiLwFKUcqWJE9ccLb4lT9q1yGq@vger.kernel.org
X-Gm-Message-State: AOJu0YwQd4e56hB8fNxsCD1p8m7vrKSn+Sim6GIx+KIMX466yReP2rUm
	U48PlA48wK5t9CsKIYmCYoFkb0Yb4Wca7FRo2376DSjP5oe78jG+AGjH1t4dO4duHahIq++ZQRE
	VXLSf1xX9NknCYukd9r51ST0pkaIK9HPIzD8f0GqqTfIw24OzUrCwMir6ld8l0MOgScOwPtOL
X-Gm-Gg: AfdE7cn4ca0LntWhaT4uLdyE/fIxpDpnuGKIzKpHL11rSaCLGDGhunU9TecYc63NzVn
	MtfYhrvWqcL6LLMYIFJMZRahEH3/AEHumaObKREL5w2gBlmxLaj2v9jHVWsxmLV8ukBTLPjsASK
	GiBJoKw7dCCyYNb4K3SNHZ3VVYKPVnEpLHrIhtv9HfSbTP2vkyCwdROKllXGFMWBj1+EfmUNQXM
	IP+wMvNrrjjuh0K/ep09gaDRNC3356x8LuPATJDsjUjyRk9vcPyYJTAT/6sKT11i6SELwvElpjp
	dcXI4ouEzB/UwSd1xx4UujaIQFsSdcrcVg4rIVKGKzOlNxUvEamN+AXCe/6CfVCo87rKBQCSr0i
	mtUa5Xo1K8Bu5CzcIuUEjwbzn
X-Received: by 2002:a05:622a:3d0:b0:51a:8c9a:8fb4 with SMTP id d75a77b69052e-5213f2788e9mr175126981cf.69.1784649090055;
        Tue, 21 Jul 2026 08:51:30 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:51a:8c9a:8fb4 with SMTP id d75a77b69052e-5213f2788e9mr175126521cf.69.1784649089405;
        Tue, 21 Jul 2026 08:51:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de8895dsm159554075e9.4.2026.07.21.08.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 08:51:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:51:06 +0200
Subject: [PATCH v3 4/4] dt-bindings: arm: qcom-soc: Allow WSA88xx speaker
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dt-bindings-qcom-soc-naming-v3-4-8f275c9d3412@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NBwC4NpfPry/8UlEyrp01sZtR0mecP3JsuRaB0z99ig=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqX5V2Ww7mqXPgZwcog1twwPXbLXCkkLie89Esc
 VrC6qDIKCiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal+VdgAKCRDBN2bmhouD
 10zjD/0Q82PyYzvmXW8tnxLR9JwOhhU93BqW0b71MWddgtHRQ31/cmr4YNkq64+OgTTUPxANpYd
 fgldaA8g73H5lUCvlHGN19Cyg8XwZ18kRDfm0cxpTvSf2UIRsnBYDlzzN64bpCYa9dl+h/mDllY
 PQ/soJ0KtwzKuxLx4buMrnj0c90YEjphjgHWaQYWDJMTlegk+dM0AVWl7t2houUZND/qI+mrZdH
 dL0f5rv2Kd8waaLTIGxlVwbF9ltW9Rl49swQEYpOTnqA6Sa0xSyIgU+7MLupl5Y+Krn9BrrnNM8
 7+zg5w4gP9CgccIXe/ve1vrloE2T49bId9bAGlAPPXuj/Tya8Gzhmq/Ovdcp1n9cvWs0dOzP4hc
 7w+HfT5g1PSPKtBFepjRkLk4EjkVk1/0ubJyMdkW19fU+3udc74MrWy2UaCjVQGpEX1XBGS+SKF
 Xeia3D9YK2S/+pTTYlAGCYXPNGG/UkrIKlwd9Iy1kIsibTfuXvpuZU3fcYxWD7DMX9C6V2MOUKf
 4Rr4bd/HrnMwnQ2h6EkEe3XOej7SaTV0D7Se2/UgAK3BV066tnMhWLR2kYNTlGr4vPR566pMvdD
 OZQWVyj9zcwnCdm5VwPAwpfeK0JkGhDMVP2C9U4Csot5k2CN9JAparpj/HGg5T4FoGVvBbphV9w
 SisXSD5I/muDuJQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: y82yMigPn_aRUVLESFtwEdwP2jEe_0fi
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f9582 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_rAPsDrPz3teXUbocaUA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfXwf4clntPe6/k
 n/Nv8Rubx5Sw3X2BL/DxqxXX9jfIiLw8Gl1JBxmy3zGzTEfACyZRXMCb30T2Kk+SREwpt/Da8wO
 QUnOkRM5rT8dXI9CEWFTtHD2B3CGRLA=
X-Proofpoint-GUID: y82yMigPn_aRUVLESFtwEdwP2jEe_0fi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2OCBTYWx0ZWRfX7LU8jEliW2mL
 ZRN/uITWl34JWSESaYSeI3VLs+6mh/3Kjrm7Ni9hM2m+xTRDprf8U/5YWBY+ISHs3EUY6e8I501
 4c/U9FrUTcGPA4gK0tnII85sfF+rOJ9kcMlJmLyXQoZJ/WqaxU4k9FkrBYGF4rG3s9aa2NzeOLP
 BvgE926wxjSNdyL9Sqd1x3QWPOQ5zijg7+JY5ajKwEiCx3f1YFHbzc3VQ60R+Pq3ERcpbcUPAQu
 SEz7rBDhvkCUjqNS2h61Mx+6TPikxvSUra/1A14hqPuxGgx/bA4J+Ggclyf6MCOyU9CD/Lk9pws
 xu1ZYeOqPfWgz2nhVt1Km5hsNm8IwPCRl3diQvbGDWjowHKbrtX8kYx1Di5kydcU2mXVSwKmqLp
 KPMGRpz78z/At67XLCJjT/mb99Bia4Mg7epq7ijeMBNWT+N/NRzMuCEgDc61rPa8gDWgkFkaShO
 fabyd3Z3VEszgcEffwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210168

One selects in this schema captures "^qcom,.*sa[0-9]+.*$" compatibles,
because there are SAxxxx Qualcomm SoCs.  Unfortunately there is also
WSA8810 and WSA8855 I2C speakers, so they need listing too.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

https://lore.kernel.org/all/20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org/
https://lore.kernel.org/all/20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 1b0f2dfb024d..e7160b63d814 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -83,4 +83,8 @@ properties:
             - qcom,ipq806x-usb-phy-ss
             - qcom,ipq806x-usb-phy-hs
 
+        # In general non-SoC Qualcomm devices do not need to be listed here,
+        # however in a few cases they got selected by patterns in "select":
+        - pattern: "^qcom,wsa[0-9]+$"
+
 additionalProperties: true

-- 
2.53.0

