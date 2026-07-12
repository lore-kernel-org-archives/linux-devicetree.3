Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B297356770
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783873343; cv=none; b=eD/7n4Edx/09SNWPgopY+wRe+jDH1fWLEOryGwYXASTQLiFN4M3mV4oC1odqqA//7fcEVMpS3iR18XvPnYoqntFzy8TVv4Bv/naZZhzVTEPbmJx6ZE0fJt/WV2H9BM6xgXtJ6k5e82QLhBFa8M65zhD4k+p7MrrJ2wd45TH9xZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783873343; c=relaxed/simple;
	bh=m7sNgFkWWWSKCBvhQRwECvFZHSWU0qxXYNUklOLYymQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDCtmIjdzOh7e0XRnAheOodPkPk1ZIP+vBxc0J68abN8YwwpCi7KImGsFsJgoad7PzV2C1D+N1n/CFnaCDRERtgChPAQx7BG6v48KDHVYx4QiP6Ftk719OIgf8IqLYwY9YyufdMoCCl/46oLstSorPRUnIPP6i+s0qh9UY7n7/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asllG8dL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPKOifgs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asllG8dL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPKOifgs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZfeh2603367
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 16:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J0TZ6pT7O99BP+k79Go2fZyr6dXMY2OC68X
	HJwUIjII=; b=asllG8dL1z5nVSUbwj+K0SOUIjZJF8nmqhikGixCUghvOPu4QMf
	ZAwn9pmqysbcRUy8+xXeqzu+T6VB4ueQS6trblJ8Ch7s8Cg7nBHPITPhRS++f25t
	NDLvbXp4MFz+YuFizLFvYQ5nGryxsw9CB4rT9dyO0CI4Dg80KCdOugMU5fE8nWUa
	joaRG0nOujW9nGpDY/n+lyeHph2zAe9X2Zb0OQmQhin2CuHBJone2NgeLbCcl1Ig
	aCPipKS0qHSCs9mHIvBZID7S8Rz+rPhvtLkJrBTc/ftpUqIWcr0rT+8P7RYi3ad6
	JOofA4vOxzYtTHbrfpTPFVX/DHJScUL5Gdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekck2xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 16:22:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso27816171cf.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783873339; x=1784478139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0TZ6pT7O99BP+k79Go2fZyr6dXMY2OC68XHJwUIjII=;
        b=GPKOifgs6jOuwAMD0Oux0Rs3/rI0MsSOql3KUjnAooHYQdklK0N2Dn8ApIceAlQwNr
         GEYdY388z9uBQO3hFM6K1iRIksGsN9IR6N5QCWwhqLwA5vSkts6W7ZRUuQPD3IXiGEeV
         uZWEU5cn7XtkXhhD1/OzNs3tYwAngxx3Fo31T4E1nVLh33bvX/CHVGJ3s2PdlyW64P2A
         gu5uJqsJvdV5Q8+i5dP0hJY/wEmQxF3cxVgQCZSvU8Znt5jE1euaHdV0+RE3YSbj+xZQ
         5cKPIkTdFfVh+RTW3rKiv3TDdVDJNj2EO1OaAvmODHOHb/kn9tmG1LO7JZ87jJP0R+or
         dz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783873339; x=1784478139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0TZ6pT7O99BP+k79Go2fZyr6dXMY2OC68XHJwUIjII=;
        b=HjtLMD+bIVghSTT1APPye5i02JE9sDTsc74Zy3of/Nb7tUEwN1fp7UneNtSBBZDpWA
         10qqhK0YIL/REmvBSZnRJEM14DDzArI9rmJR0u3QLTqFc2JFNEczlQb/Tx7uNhqpXqIa
         QMhBj2+je3gzN0G6S2DHO5+CJFJ9C84mp1u++TEA406FbLPGtL2pLmX6e20Ermi/5U5q
         8yMTv4V2cUFRfjPPcLSDxVt+ucpK5mq0O4KhNhSvo7JT3yaRdjYFDC4XfOcX8m+CwTWe
         GEmJSb4TYG8IZiv8DsVIuPocsLCk4EEJkzNy9UzJwej8fe+/V6AECqcRt7/74hCWyymj
         p0qg==
X-Forwarded-Encrypted: i=1; AHgh+Roz/e8MMhrYRAz0AnL5hE7S6gtcMZSqSKvaC2yaJl3U6xaB7cOcYXs2CxcDlW9/+x7Ibo7OlqR5ABHV@vger.kernel.org
X-Gm-Message-State: AOJu0YympQkVWn7uojJ8l+siu9anebH5+p+jP/CHUU3wXFD+nM05zssS
	TReixILi9lqSKEuLWeMHF3mtJN6GqzSaNSNCLrEFEQ8BnsDapTXF/iJL+iLECQfNHrrWKdaQmlV
	KtlcvfSa9/Th6+wLydJfhkRHp78ke6ZaA4kL734VGXV6UQDvaD+rUiqXExSISox/c
X-Gm-Gg: AfdE7ckIJv+lJdZbEhtI7ipY+g6itrTqR3tPA9CVroiVEvtkDBcqjvuQgziBRVHlSl0
	HbWyF3Ii8nlxdO0gjAkawuigJOASknZeADNApop04aeloK43zicIiT+2fhafHpBDgG0XvCHntvR
	t0/r/V2bVno9yZFo5RN/+ohnzD52eOwkFuwybTKS6PjJo1KPvRpsffFwEmwiq4Vzm4QM+Kzt4Fz
	ku4qxh23wr+K/9Z1j0Cb/0gHQIWv3cO+GCQB9DfG7Iq6YJeMWtCocSmeO6BFPydhTqkFLav2PBQ
	qUNyJ6gCdZ9yNYaPTpEgmfhIPWgHyg5Y4t0PoGfeI6tVmwxE5ufm7TxlsZmPgXdqAs0lu5xvXY5
	XaqNSoSJf1keEmJ0ioZX/heRBGug=
X-Received: by 2002:ac8:5a0a:0:b0:51a:8c97:9374 with SMTP id d75a77b69052e-51cbf24a839mr58229181cf.60.1783873339548;
        Sun, 12 Jul 2026 09:22:19 -0700 (PDT)
X-Received: by 2002:ac8:5a0a:0:b0:51a:8c97:9374 with SMTP id d75a77b69052e-51cbf24a839mr58228921cf.60.1783873339129;
        Sun, 12 Jul 2026 09:22:19 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm72909467f8f.30.2026.07.12.09.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 09:22:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: soc: qcom,wcnss: Drop redundant $ref of firmware-name property
Date: Sun, 12 Jul 2026 18:22:13 +0200
Message-ID: <20260712162212.184592-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=m7sNgFkWWWSKCBvhQRwECvFZHSWU0qxXYNUklOLYymQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqU780qY+FWlPAgWuN+HepYSkUMaYaZ6dqWeyCV
 WvBUNQzBjGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCalO/NAAKCRDBN2bmhouD
 16+4D/93B5mrkuEDCgrnbz1oObJrKCJ8rNxmGX+tToZVxbJerTr5lIFbZ+ad4IzW0WFPl9NNUsH
 jeI9IImDYaPlPjIg+342l0UgCOei5kpBm71Vug1vahaGcLKeOX/MT3U9bo5qf24Hxqs61y9PMVm
 9HZXOs7P5ReVDGx6ENlAb57C9W/YkqxW1ASF7DxZEBnBg1RwHsxFDoUcKjE8KPNCbrNOyWVThiO
 lYXlhMqeRjN2uJFTGQYfFowcnAx+Lb5k/+YST0f/Cvf/XVVq26GGEexkpFq9mFQNvd4RwwmxT0K
 iU6NoPdwz87wTPoeX92TEYptuK/TQRaTO3mU3+0a8yZN4N0uLCjET6caDNIF7GLiUKAjGDNA3O1
 gcww5fP2URDd9oui8FzQZPMQNENfeHNVDQ5gW2Ul+9LFZ1jHgS7KNX6z34pP/eSkhKmvBld2taj
 FmE7OGmHubxLLinpR+6FHmetv2o/NpYT4FumGmFeRLAuitnTfYUR7DHIz8LdrMPn3xbEAhO5+md
 GCVKObP0HPSdMw8FNGg4i9qIR6iJRdAlW6pa79kvfv4Lhm585aQD/I/mlnzt4UW20/EY9h3ub9m
 V+rmbxAH/r0BEekjW93KXgsVWnLP7vbkobcP/CaVGsCmFoaFIRDdluXwMg7EbQ35OvhpLuQU0Xx 9gQyG/uzgfuNFdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE3NCBTYWx0ZWRfXweZwcTywKC5i
 IPAqkAQHs4310Nd3ttJ/G0E8o5MGtJoSsCizoWfWzAFGBVhLuCqGvaiAgroO1oCOeQAS9MOHL96
 9uYAwxUTwPT680aEiYdSDm9Odc7YdU6c5E2ZyxsS/DPl1ehe9keeCDXms2aR+IeNfzYki5OlHeP
 UfNo6rcVjsJgxZcpKQA/xU73eRldIK0nt/Zara3Vzs79B9PT/jBDanG8pIBQrNeNt/Upzm6dGdx
 KaeOdkf2gnPVHnqwPzB2YVcrjHEgsWON+WLuNX9AHvK/wzxt1GPVRmNGm5646YbfU7AT9eeaD6a
 Q+iqArise/xug7sqVAnuemn7jC6FSLeEGJhklfoohLqW/ox2Xq1P8lwmjZfoxo0w9NzbkmFGsm1
 MElxoWImXNKHHu+oDOHVvHWtlyzj2/dCQyEpGU8+FKymsjDsH/HJeC0POAdGyI1n3ln/zT6QhZf
 VsNLa47/DZwoKdF7UFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE3NCBTYWx0ZWRfXzQQK2JcjpO3J
 /9tshiXXjPWSUTEI0XN2DyGDr55np2BVLAuVzOh8xqqUb8R7RmrWdxnl1J8JP/IMk2uUI2FLUa0
 6w5GpROyeKNjxNjQTjwTqUGhozKXZxM=
X-Proofpoint-GUID: Vm7xDJjTVgjSxwjVN-pjKLcxEQ5HL4FE
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a53bf3c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=A6QOgsZt3dy8YBax7uMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Vm7xDJjTVgjSxwjVN-pjKLcxEQ5HL4FE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120174

The DT schema core defines the type ($ref) of 'firmware-name' property
as string-array, so individual schemas do not need to.  They also should
not redefine it to a single string, but instead just set number of
expected firmware names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Switch default to an array
---
 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
index 72a7f8cb09ba..cfaa15d86ece 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
@@ -19,8 +19,8 @@ properties:
     const: qcom,wcnss
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
-    default: wlan/prima/WCNSS_qcom_wlan_nv.bin
+    maxItems: 1
+    default: [ wlan/prima/WCNSS_qcom_wlan_nv.bin ]
     description:
       Relative firmware image path for the WLAN NV blob.
 
-- 
2.53.0

