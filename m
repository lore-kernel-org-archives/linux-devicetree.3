Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E93144839E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121759; cv=none; b=ZQjhZE7/Rpq4HybsE56V6AdyQoE1wjqx7/uLkxENo4ERBRWpcLGuBbD9X5DgvoDrOB0+QjEDuLADFqgeWNZI8s/UGi9lHIi88REf5bKNhh3hk0/EalJuhs6GF/187E56C5NQUY8+Q0StIPS4jCRFjM+GpEKSSIEWvyV4xMwwGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121759; c=relaxed/simple;
	bh=+wdwCRdnJeHhF1zaeA93mid7aVTN7E5hSE1rkcZl2sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Okbprs6BaTgkTjdowEHGLiClDAqfXoS5i0ZD/elItmuAGNMfPEoFuJW7QmuHaMye5EuhPHvWZ5yC9BuHb3QJkBg3Zj6pEBaGkNv+fQS6Z4mUtFMpGwpE/3LBg2K40BTzEJpYya5ejTjekii9FZ/T4m5G5/nBLRvjOt+5PcnSLkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbv7SUzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNoRrv1p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbv7SUzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNoRrv1p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcqsO523523
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=; b=cbv7SUzfKDzqB7SL
	SIcVNR5a5pVGtFvqRO4pg+YK2eArvCplpJNWKdn9Ls//Ftg+FS3ipZZda5d61GiI
	ewLov4PKLatf9FdEAHSMiqlxqeFV5DOkKYky39OMdPXa015TYCeWA1ivljwonOf/
	xGtnQDhZkyu6xC4q5CMK8V5wIeEnh/0mCT0fqEGqzOpkjI/KXkJ2D4rSlGKhJh5Z
	V0xikcSf26Xd35ZBIpAZIKJevTcvggn4Gh8FlNLj2/P+oRQUdrxPbiFsmDTQD8iJ
	fCW5himF/CWXqENJ6+TH88v0/ciNcgfczeggNNd0WeeU3TJsLXBTj+r0xLqB6rXj
	5/GHNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68ws87f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ea24a2db9so856549385a.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121756; x=1784726556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=;
        b=bNoRrv1pI0FUAfPYbRgF8eGblhOEhmQzKROeK918vWHuk6OV35+C+8U8xQKvU7E33l
         kzIlXfgVr5nZjD0Y34hVwUunPmwZSicIme+QwwR9+UqFhq8gtt2VDHB6bjwIhiYzfox8
         00BPW1j8GGRhWEWt+S+nwza9aRjlDviE1WZcN25fWXUSF4qAXmT6l7Wiph/MwLH3eav3
         pUD7Xfk1RGSoY/rVnTtK6zrrXC+VR/sIe8IdrzoBOjyP40A9KjWe1eM5GUhjoC3r+NjU
         XVGs+nGpR/NhvufokN6BURHqhHZNFHz4g7b6ZCVlhBWzOyykLsgmxqsfW9AzsaFGcgMJ
         8O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121756; x=1784726556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=;
        b=Ntnu1WaUg//X4vEXAc/6D4sLbjDIjxpX1O4tr/It6abm++ICGwzV3rFpCbID+QUSLa
         VcQrZhNzrq/m8oxAZ3yl4Wlh4vQGbMkr3h7iBIOFIdOVc4pSMVn1DjJQcqPBef6fcvC0
         qAHKWwy1KMpF08nMqTWXqKto8VYhFGq8lAQeSybkoV0uyTh7RWF4vMnQvrbUvWBTaN7p
         a5SYMeSBw7gxw9SgBFUdNByO9UX1NxT1Kic59SbsszX+n6V09yoApb/Yfy9k5yplyrWx
         H6/MvwcTH45NfkW0EY+58uaHvrrE6nw0TusBqFKInU6QwVmlRms4tlprdbugivVXyAiL
         6+Pg==
X-Forwarded-Encrypted: i=1; AHgh+RooiCrOcX7CPnDH2b8hGpZN7PALUr2NtFe3kc0MiORbgVMZvmM9x7HRssJKxT5xG4kXWvFa+VLhrFEm@vger.kernel.org
X-Gm-Message-State: AOJu0YxFedPMXW6yxMV9dc+jALik/m9aEjyYuI5BRZKupm1vYgxkhQui
	5j+H+DuOKwgCRccPniZlAVe4YvmiR/18GG6mj3S8AtZYq6QF+kBCYlThtw7d+XP/ZBGeVsCJqb8
	ejnZ0UQ/aiD+aGjrt+JTaqzXT0YPwFHh2epgAk8o3iWMeAsYrUBfIsjiP49isNbOSNQ9ZRNvZ
X-Gm-Gg: AfdE7clBDCinYu3HhW76+E75vn2Hr1Ev7Eu3IVgEfhH4UwAmYQthg7wqvqDoXTjDSej
	Oy4p8/LwBElxlIP2+hVvmBkglp/AaxZ24k4P9lmUK0stK0reqwmEj7d8i44slToj5LrF7kUkRu7
	cAgYP+5ZQg1IM+Tp0f4GVDpbUMTYYeNKbK0w17Tv270+ynoIgbA05vWN++5pD8JG02VPav9NWzr
	jkRZrMOyLYGIgP4PWKc0luFY6M55r0JSsWNGEPaJCkzRFMsflbR4rNza6RwUQnwQv8R20KVEG9A
	GE+rrlgBFyWtqp3zIhUP+bXYzAwRX3726RP/KfOUGr9tpPbYoEgZvoWEt/kCL90W3YyC/LtwVZy
	WVXKaGeWW8EzqaMxXm69Z7gSdHstfTsXru0ygKQg=
X-Received: by 2002:a05:620a:6407:b0:92e:c117:5eec with SMTP id af79cd13be357-93086c626ebmr565210285a.88.1784121756428;
        Wed, 15 Jul 2026 06:22:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6407:b0:92e:c117:5eec with SMTP id af79cd13be357-93086c626ebmr565206085a.88.1784121756029;
        Wed, 15 Jul 2026 06:22:36 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6a77csm1773676985a.45.2026.07.15.06.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:35 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:52:00 +0530
Subject: [PATCH v3 1/3] dt-bindings: interrupt-controller: qcom,pdc:
 Document Purwa PDC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-purwa-pdc-v3-1-be08934dc916@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
In-Reply-To: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784121746; l=1238;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=+wdwCRdnJeHhF1zaeA93mid7aVTN7E5hSE1rkcZl2sU=;
 b=x/mwG7AXDCs2T9OKZm1uAH03OxRf85+GDE9MZ4bFyDmTXKw00Y9bn7FyVnUoZoqthvXhxb5h8
 d7Yw/Jot6HLB8IpwiuRgFi/2QtDVflFWH2n43J4bhTa1nCh32Cynwgk
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: 78oTBsdz3joTK4wQFR11vn7ZM7pcw839
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX7pMjWWvMSbkG
 AsHvbWlwrL20RaUxNmRrRfsLVgwE+Bzsekqvjt9rItC/+8wVX1xJGMAtAuZyPL6Cn5fpqkZ/euA
 L3OQJbozH0FrteTa7t5+n4hjFlCuGCCyXtd7AQcnvc+iJDrsTGpUx4TE57TDf2z+0X/mOuN6DQR
 drd6vl/1g7+4zh6qWVH5HvXAuDRwOS3y7S9VA7UL6FAMEcp6bERreJrdyXdu7eJA1MMQIhI0KxW
 tC5RJQ8VPwV357C91ZuhWXjzjjauVWGZS6akiW99vINAyo3TKacKr9cgmDOU70tnXN9+X+nKZNI
 c1ZtgC3Q7gh70gkKrNFcSJPMOlK0V81u0rQKZ+/mh8iGzfvVaALTnyn+LKlZOPFhgbNO74KBzxM
 JcLqiPShZWiNZUOQtg4NGEUTnRlYhNpGA+TMDYqBraaf28+NpoM662U7dfB6yFLq/P1r2ZARYgR
 w68HOp5ktRwhgYXYrxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfXz9B94TNcII5G
 LFKQp2u0j2OQ8J0hYRaKi98DL5AWZcgA0F/NLjBII4imngtlvc2OytfvW1RxYcsVo9mNG+ICka0
 /HsVErjCv3pVVWDmGtxabKl6OMugMd4=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a57899d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vCmKDeXsP24Y5dEMWNIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 78oTBsdz3joTK4wQFR11vn7ZM7pcw839
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150132

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Add PDC compatible
for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..b3d19c86a240 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -58,6 +58,7 @@ properties:
           - qcom,sm8650-pdc
           - qcom,sm8750-pdc
           - qcom,x1e80100-pdc
+          - qcom,x1p42100-pdc
       - const: qcom,pdc
 
   reg:

-- 
2.43.0

