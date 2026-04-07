Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9233B38AF
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569921; cv=none; b=Iana+Al6M14nS0VWz+iQ6d74ycTd9pRlKjDFb5lEmwtpVRbHCr1AcNbBzmEVoCNE+UA54gvWaFRAdHlzqSIlYlmMjoX0sUdTPviNjPLifcCcHTxIMqlkrEK1F2QZ8cO+RLqwJvnqFPgad0TjXec5scOHuHLROo+qizY7f5oA4Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569921; c=relaxed/simple;
	bh=CteRO5i+StFpZ/Hbkxhr8vj7aUpLMovvcEdfVXjBI9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MFpg3MQWkOYF8lZuSD2qkLALbDQ934O8iaD+2OGf1CUjtyIHTICWUSWg1j398wtQH83pw0ZdYM3Fp6F5hB99HleHpndeN8/EmrHDJpAgl86wAPo825nkIDKm3/nr7sZbKmPgXDe65lcGQxxishyWgWerbJXyGvAv/VIPvxujeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gpm6wg0J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNhp6N5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gpm6wg0J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNhp6N5M"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CKTbZ2550324
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 13:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2OdwveVLuWKs4xR/AeCW7VX+1fWjnBXzZwDqkn4RY8=; b=Gpm6wg0J8tP2rOQi
	F5hDgsxHElF37sl9lXhAzdfldIqOnzfQa8Wvr3eyOukxbyBP73ZWdA9yuiQpX7S8
	kOp5eAJwp927Ye5ALyl/TUDrQtDaBwkzCHqqBCaw3pIzSOzYCOrOPBVFRCqq9EwT
	NsbH8bBwF3CLmFAgFMkSH6DM23EdiQGSbSVS0cGfXk/GIFMy6WTJx6lzLVT1QrOH
	ugJ70s8Oi67gPp3iUsPPWHbnn3d5vIAb6dnWVUnPkJq9OFD5AdVQWMNpWkS6/yp/
	lG1iV/J3/g1m1cuJRzWdQE578JERueUjBWhiqRHVL6OqofEHvSgrJj1BvS0hzx2t
	3js7nA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmreb058-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 13:52:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b802961ecso64678281cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775569918; x=1776174718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2OdwveVLuWKs4xR/AeCW7VX+1fWjnBXzZwDqkn4RY8=;
        b=cNhp6N5MxWvo/iOCI366bESaIhniM4Z0APXqKsooDq9YLaiuaBPzYGPzWuj+Jq8EKM
         INylf1pUnVXRqHhLggCmGmM55wsS5FK6BX0caj8NnePfrMQWhnqTylsSHPzpGgRovcLm
         wt/6+z2nzgveelcsswvB3HSsqmrET0bD0ritucfNCNi+kgwRgvAB3YuQrsLFIEEQzrrr
         zynhj25FTPPHssatOXBCpbpYwREu11sv0HIgiVIMVLPqd5jfxg4Ovm9/zv5eKcY+lVbf
         MzL6chUhJOjsUXH93lmDWO06rFdKk67B/72vccBf7F65Le7EGnhZooo6oTVbJzklZYS+
         TtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569918; x=1776174718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H2OdwveVLuWKs4xR/AeCW7VX+1fWjnBXzZwDqkn4RY8=;
        b=KUL9iDsycRiUC4yBZck4IdMczFOkT4+SFXeU0+RMFq95wp9uzz7ULjrBgrnrJLKhNE
         KYJX9V6AGtzZa5fXw82feKuhUiZ3pLiNLFqrHwJBXbR6+H9L0iMLYLtmJDsmLzfEzIkP
         Bxs7aEfr95mZ4yHbJRBEhbXy/BNvJEnlNGPeEqSks8Sh+Qq2rwpaCOIPtpI9DcRpAZl3
         2JNQ1PosMLtFVw0kFouo/yfr7JCIIjV6nmjpUyBxz4folW6+4HbZWKBx05itmeUEaPr+
         QRHF+CVg3SNrWofIT0EocX4/oDd7ECM5OVXheS4yp7GSJIgRth4nHABdQ8etQ7UXyd5f
         I0ug==
X-Forwarded-Encrypted: i=1; AJvYcCWl+YB6/ftVkP0E5djDZBxyZ49o2vbB+IykxvS7mnJz5F2jNX7mOND1vEn2xKAix0zhhyQQddngNhOh@vger.kernel.org
X-Gm-Message-State: AOJu0YxFzZnFA1qJHVvVA6mVvQ8eVE4pyjFXQIp9NrnnqTQWTMkK6IbP
	XCBAM9V55lSa6yoNe8Ooo8LySrzD55h3Krplhux/IbyKaDyFAFSdXy15GJMn/yeF8E7RxQMDcDg
	e93JZS5NYFSq+aBa2bNJGOxXCs7f/WH9yL+HKJqPq2Y9OBL9jfWCwyDwwkVMKHZvg
X-Gm-Gg: AeBDies0W/wSAn9BLEqIVOacGvrToHN3dxvypx+d/ILFUaXJOA6sJ8uGesGXuzB8Y05
	nXhbpcTd+sTuxoX1IaCJ3VEGV9rgDDG/Jhbar6S0vpabFi/1n6J2OlVPDDAbvY3Flz0aqSocLbj
	ckiRw74xfyJdREoIwcUeYeUL1mcRV9QP6STaM0L5RJUssDxqn/bcTcNRTVPASxgd3sTPeNyEQRn
	z1IqI35UAwQzhkXHAEqoB02Cwi7UUl0MY26cs5c3eYbETcp1pO6Z8l1AF8UItgfAL/6/wFcnsoB
	wZ+NoDvmYQgRkOTD/AvcZRCP20N+Fpj6kgDcUWqmyelcRg+pRf1NwXOS3SvvRBPpYndENfY9KHL
	zmQqL8gYRbWZaFTp4XJbYRibIwyUKLdpeheetAtwe17np
X-Received: by 2002:a05:622a:1990:b0:50d:998a:2d with SMTP id d75a77b69052e-50d998a09bfmr76447191cf.50.1775569918447;
        Tue, 07 Apr 2026 06:51:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1990:b0:50d:998a:2d with SMTP id d75a77b69052e-50d998a09bfmr76446671cf.50.1775569917954;
        Tue, 07 Apr 2026 06:51:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2971sm49788420f8f.22.2026.04.07.06.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:51:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:51:42 +0200
Subject: [PATCH 1/2] dt-bindings: crypto: qcom-qce: Add Qualcomm Eliza QCE
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-crypto-qcom-eliza-v1-1-40f61a1454a2@oss.qualcomm.com>
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CteRO5i+StFpZ/Hbkxhr8vj7aUpLMovvcEdfVXjBI9A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp1Qv4uXLNfGZ9jichnIdi4AfX/zJ9xv08DvHek
 JHOYEzvi9aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadUL+AAKCRDBN2bmhouD
 1/EFD/wLHQteB6O28x3jC4oi28Wvoi9oeB7SyHR8+wf4vIXYIko2Pbs+cCVwT30saV6PmaDFrRP
 JQztRLJVl7UKHAExI6KNotQQjLXzw1M5gAqYvyUEJ7igZDN61BNP6IWjsLI9pc+TrzRdtrBTtQ2
 JcHFzv67kuLC1d32kHOCpiJDcrnYqpKXKT0ysRMeUzZwAY2uLVXmtMwQI6BSFZY6shROpb+AhGC
 xDqWTgvAwXfnduBBFO8SyAz3oSHbW+i5tq4DZgQB1rSh3i59q8neo96kidatDSNoYmSkKVkIlNX
 wrIywMEOrBl3XzbEpMtBE0um2VARfxwCfsGo/sWGwA8xXSL6K+RT32AZ6A004q8ht/4k0ut/nvb
 jSsotAAB+XJlcBsQJxIhUPsYEohbPI3gq2H/292ney43KUKRuJy47Ea+MOOpU1mIXoqYMkAUZ6w
 0KzhehlSpGwZcq3OrNCm+/ZXYlABw2HKaBeX9g0Ta4FHHJfQx1f9KwFk7BOTvkKZJo/3m20UNp1
 OlT94ikQ4j8qodtuCoeYJTxl15T0Io9qvrx23ygJkewOadFMWyS79ifdHK3BeQuk6VLTFjfXP2a
 OruExZ3V6smu4iaX/kvmaScsYtwYfYaEZdmqwcKz11QTSLAvKt4lW5831JHLZ6fL6kkQxHJDzmM
 lCvLV4sjMIzk6Jg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d50c00 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wJ7VZ_Z-PFiF5o5xSc4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: GIW7LlXQDTLx8iwEbsmk5GtWn8pVV0qU
X-Proofpoint-ORIG-GUID: GIW7LlXQDTLx8iwEbsmk5GtWn8pVV0qU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyOCBTYWx0ZWRfXwupW1o8oRDOh
 SgLQbOAvVvrMaDFIIatMLe8wfej7iJSAsuRiS8Nn4NNHo4GYKVYmfzFqMQRb0LWfAQFwTLsIjqi
 tRbSasxZo9EegDI2JS/WMtW7KSiAOyH3pL+EFwnv0f3wkt6ROMFn3H4NIcP67Zc9YuAO5msaJAH
 ujC0XM2rgNxiCvmyqAjzbpGcj1YJB2PNr0Z1BNqVxlhYFXSHxJSWPsJXSo6EWK0E1R5uP+ijRah
 jLxeRNTiQlsvK5gTw8Kwlx9K68HfFh6r19ZBJ/lXvqY3wdRSOKHA6sVGxAS1DM2m+fteGEfCOra
 gkWjDPNgiM7UBpD4tsPkpjGonCunGt1jrm6wDQrRYyn+zE+kubkQvaGYIsqhfXwjImQbFRqtT2Y
 LtrQnG/9MZqFeM4aKPuwrXdmTz+u+UqPTsjpM4r/QeDaaeX6Lz4MFKFGu8u3HgOuREJ+nleC705
 qeHfNchXKerZvUSrToA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070128

Document the QCE crypto engine on Qualcomm Eliza SoC, fully compatible
with earlier generations.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 79d5be2548bc..8ca7b3257b39 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -45,6 +45,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-qce
               - qcom,kaanapali-qce
               - qcom,qcs615-qce
               - qcom,qcs8300-qce

-- 
2.51.0

