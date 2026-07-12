Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B5A30AAD8
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 14:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868231; cv=none; b=ilSYMnTsnUQWrtuJMqTs54DiHL5emBVZuzZPdi4SFA/Xu3hmR6e7nvzZqMIcbPR7h+R0FCHQkDKW5+dGp96iB7tRv4jTLp4y12lNAz/PdxOvZ+ZYF62qyosBxW2YFiPmQAthERiryfJ2LJisosv7YXLO5AYg+TGuDf3Xp5tYGVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868231; c=relaxed/simple;
	bh=Ewxp0eWN9scx7NBRSiYW1UAzNKRXni9sv83O1PAoMnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WVIDnDkenFkIj86QA890HZESD123Rsd3AevBASec8qwJXTpf3npCQxVBJmFH5R5P7LiircDtM1+fBIKlNXPOTcsHsr4+ZXeEhCHIjTMyvAatGuemPN6kBp1dUGxeTQEcEaph9dKSZna8MXa+xzRIDaQVi+N5L6XAAQkmfTjX8Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+JFFlqB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLfeZ1GC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+JFFlqB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLfeZ1GC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZg2Y2698074
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 14:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vJRsdfLIQ/9jC/oP9S0fE5V21GX2hmcaZQB
	CCJftBGg=; b=E+JFFlqBP3WDfCEg3Yxy3y6Ku9HHTiwu9ox6KfKnF5p1dRx4d62
	GBZmcZ6DdTQF67YzATjwlzpIFmkLE620NHi53D5cgtVptgt9oNbCcKO8vnzkJ96q
	+bDHNv6nZIpO8px7WckYir7nb7AkG7ERZl89M5z/B0VPU2z0peWfI1aCqIu+inl6
	4K5mrbaQBpwXFCRXvRfTzWdB/7sy4Eigrh4upodsAvJ3LeIjegHIp78AJtjVmD0N
	0iCxFFVgadd5xlgVYeFKtw/RpubSGHW2pdlY4R/0HqjdbNFyyE+1s5amQw5aMaYd
	Ee1QOHrdwLtlM7xtxvnAF+IffGoYJygcYhA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamu0pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 14:57:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8efe7db1c42so33185436d6.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783868222; x=1784473022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJRsdfLIQ/9jC/oP9S0fE5V21GX2hmcaZQBCCJftBGg=;
        b=HLfeZ1GCEBpOi83M6qZTnk9VpIc6dMk7crO7IVuaUR7biknV7tesHAgBGoA94GjIBv
         cej9lP8WspjOgARFJ2SQMlONIlx7rgMc9dv0rdv8XtTNsuFoo92hd1C9KhCG4+XW0gew
         EYgtlFqoCGUT71Th864juYEtWr+zNHddD7zGXNMCO9RRRG+gKPwD4ygj3phMZ3zKSAxi
         ReIq7j6G3x9rBBL4G2gLhNfC7d4WZ/OsQ4TR0edlXFiK2G6d94MGaolENF0+sOI1jD0k
         /0ReB/M/omXkle0oEfJ/WVbnLY83LtSfL4gF4mjFIKBtYMFcRVzFvSFOw/Rgo7c9IyKQ
         PNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783868222; x=1784473022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJRsdfLIQ/9jC/oP9S0fE5V21GX2hmcaZQBCCJftBGg=;
        b=kDqUx0F5vNF1PcZIKEm60wrdI60qJN2EPQUM5Ils6LJ4qtYXxxtJ+rJwSUn9Gen2IS
         KaIRk6HXsmBs43el11i3Z6bfBs9ldHkpu7IYk9JWcLSsuL5U45WRuyJrqj9WZsgNw1lj
         Sa2pJzmGMyHLp67fN/zxEPNVmdmNV/55UNENxIJH3yQvgWvgwxd5hUIBP7tkW4drgcZJ
         a0BIPEkTm7aIwliuxO23t/QIbB8R4iANtRfLM4hdaXdNnEeHRq+zVIlu0Ey4hArtLfGI
         7D86wQBuWY8ZG05pJEU33Sm8GowsJTYejpvQ4B6piNvi5Jb0vVn06PZKDDKIXlQYV9jt
         YpHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqatu7Xr7q5I5uEhmQEL5n+NxBY3DNmg97vifl6Iv0j2POAwyT2jwVLyMoV46WFdCOsqyDoIuZ4t1QU@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+/EK9WrzqRpzmBeioMqtJ+3dRRbcz+UCdR+Jyu6vSyAnDN3H
	TITxLS/O1p0L2ma55onrtqJL1Q1YKGExFAS9v5WB9qipm32GmYMCRhc9z+cH/fpgOUJFJQXwcXz
	UaRzv5JN4zri0BPSDg9W6lmPsjP3rhlJX/AHU+tTAU8gFuBhW6aWkT8xEKApg5+4F
X-Gm-Gg: AfdE7cnETf+jr/2xgWgs7xveO7j8NNH0spsbikKPqdLCdM3McXOOMdN+/MAYUMEFrqw
	cuTmwHmjkJnLiKCQdvilFN5Dw1ftlgoVhN/gxEXeaK9px5JWJJm2ndU6qoybcHL9bCwbGGOZp/P
	KjITHF/zHJr3p3c43tFHqN5rlxtuylet6putYJP23UuqsdeJbghlPKAkIeXKvBQFdGL+wZiUOZk
	ZuJfpLaJ7CPVJGYmbVyX1rogxrcfRSOXlNr1knuOmTWw4hb7u7xlh6katAZmILiWL/FqCnF4zXP
	Vktt2IPGAG59GEN+Q5sVLNEows67nS82K1qEjeoAZost+bTYJz4ypYmiYsKIrT8p7TnPLX4Q7NJ
	LkQDDkqU8KlG87iL2znndowhXz+I=
X-Received: by 2002:ac8:6907:0:b0:516:df62:bdd2 with SMTP id d75a77b69052e-51cbf280b68mr53093531cf.55.1783868222195;
        Sun, 12 Jul 2026 07:57:02 -0700 (PDT)
X-Received: by 2002:ac8:6907:0:b0:516:df62:bdd2 with SMTP id d75a77b69052e-51cbf280b68mr53093391cf.55.1783868221806;
        Sun, 12 Jul 2026 07:57:01 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ea082sm318971065e9.11.2026.07.12.07.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:57:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of firmware-name property
Date: Sun, 12 Jul 2026 16:56:55 +0200
Message-ID: <20260712145654.126171-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Ewxp0eWN9scx7NBRSiYW1UAzNKRXni9sv83O1PAoMnM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqU6s2/WnOw0/8DvhdHRatl3OFbU+ampeU3bMd+
 Gu6Ibm5K/OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalOrNgAKCRDBN2bmhouD
 1yh+D/wLM75a39HnHBqGXcOhcj2Fq+ZOM+whd1OIuDzPF+LtPU8LKcgPy3H9fb5W6X8xyoHt1Li
 GJMeVnb/r5+WV5lwPcpAflYujiLb9r1xYttReNf5vx7t6vNS7Cmeug01KB+YQGNYFX4EX+kn7bB
 sO8M8dCXSblfHNcDeWJo8fkE7dxGtd/h3x5ifBFma3O+XKYldbDTVJFbBr5tU6MpZeJ4b5bwg/h
 lIic9H4mQDMe9lRQZwVVO8HxkKvVqQ16jzI9vcq+tdQ+PS/z6cUd3V9UVRhwCLTjdvmUdeeWY8d
 sfDchMQW8RJUrYRGBGnACFdz+dxuCaTEW4sd5u8RRmSwQy6zIMia8d6Frie+tsBfOIAWrPQGTX4
 2prOBSSmAx1689uk5Get3xgM4FGQIOPAFiCI8RRfAlVgMseCV4i5/XfjVmqMqMxrG5L28rZrRq3
 QcSErMQfTLWdr2ag5u45pb7TbE6H7L9uvWi5f9zzYlGK2g/Z5oeIr8jfvqSLOtIk60GN+AoP2dD
 Rm4Rl1ZhRgpZjJYkJq6w7GkVigHgYkYn0gGJhb9+pF1gUfysGe1DycmQxQi0N8hDSy8pO0EJvDt
 kKgEp7YG7QApErjdUZHZuGC9kpT0+jVE+SosCd7jTMuSdX5uwJIg7O831mUgW0RbkYfkLAwQAA9 OX9eQpnxWdzSRSQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE1OCBTYWx0ZWRfXzBrU3F4Ayn8K
 hVPdiwDRK65AUvZTA3LBKwZTguxFfpsfAxaYYs1CTHiHrDS0vhNQO38dlRl4C01YSwNj0GT4D3e
 ha6FnH6GCZlLUG7Msgh9Xft9KB6RVJ4=
X-Proofpoint-GUID: Qp-K1BZGEnmjAUBFspQDdtEJKMOzZYuE
X-Proofpoint-ORIG-GUID: Qp-K1BZGEnmjAUBFspQDdtEJKMOzZYuE
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a53ab3e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=hJuU4UVuZdPSbFSiBLIA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE1OCBTYWx0ZWRfX79ueh2myXH9l
 SF8DAR9lc+rXNggmvbQr1AnwC4HhQYD6oMDwBY7ATUMLKd5IjmncTcEfl1gul6j73odSwGDlf03
 wbouOc8CSgu1EhyxRxoE+Uuc0DBg3QCjK/W0y7skeLyiS+MfIbWiE4z7sQXXc8mTaXxp2UF+86a
 KYVJlF73o2p7Bcc/HhKYsC+X2qsa9IKxeeAELz8xkX1t2raU3wXvRqrduno5+oka0Gmlrk2++jB
 gLrge8QHAKB3GEVl6qfkLoz3O8QAeiqIehoLfObE5Wo9dvc8Ym3b7G1ZoQopEl3Q9QHTEHFJzPe
 UGsM42REgipt0B4AzeCPfqqevu/kgOI5UmMjob55wMbWxeUaPwmNrhfuLF97tb4GWfDVyLpPZW1
 bGeEb7TN0khQrF7Uv0/Mt3B1m/CAa1u7iOCHl488C0dKfNsVXUrgvJ16dHIAf/ocECiBb84xbd5
 5nl8BLT4/CaRnEJfYwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120158

The DT schema core defines the type ($ref) of 'firmware-name' property
as string-array, so individual schemas do not need to.  They also should
not redefine it to a single string, but instead just set number of
expected firmware names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
index 72a7f8cb09ba..eb76f222d681 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
@@ -19,7 +19,7 @@ properties:
     const: qcom,wcnss
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     default: wlan/prima/WCNSS_qcom_wlan_nv.bin
     description:
       Relative firmware image path for the WLAN NV blob.
-- 
2.53.0

