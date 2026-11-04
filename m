Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801036;
	b=rhX0gvbN4g6CnNP2hRJPh/T+0QYwonB0krsHGkuIGjEzSira7tzEXIHMAT8KXPEkJ4sv
	 HAFvVDXbvcbYvUZNuhRcAeAY1ux3aRaA1nFynOS8EAgYHsiyKs1PdbF5gWLqsmB4+XUpT
	 PYu5mD/nkKmPEB5E9SYUgUHR+CmZ1b0DcyB2UiIzv/JU5ihGt9WhWHZPQVwxtuawueDlF
	 daDdU9UatUvx+AZHD7sLHsoPWM2cF3GPBnrvAPCrvYqsaStdPw1SwI97An1tH1sWAu1ZC
	 8t4bPwSkXo+TN1IlqpsZcI9whbW/8xdKRFmjIrRWzdzSjxzC4lmO3dtrQETLEhzyJ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=;
	b=Dem0RXCrYzw727+YbHmZvqnLXwsIPQnLVQ7PTfh7UXTtUNNAPmFYtUxc42FqstkC8RQD
	 FniUxnpXDXus2tQ6RSVZ3iLPCiD4YtlCtHyhkvQdHfM1GJGov4vLoFCZxhInVIeWYMXsV
	 BUDGyGAmhRo4oo6BjK/Ct9Env4Rd4z9/9qyTUiDaxTYAjKg9PqqvfpJAnOZEPtFRHKTHx
	 yKhGuLFr0M1xswuePKcHvR1W+bb1JAIAm1gpirJFrWUrvAbULyYQiE/Jp/7ZB8s7mPds5
	 NFEZPIZ2a+yBXpFowY7O+TdvuYKm57QT1b2EWJzkKuKygehZ6HZ+bSiPj+26hH069oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LXZTo5Km;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTgjxl4z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6102B606A331
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6102B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LXZTo5Km;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTgjxl4z
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZsGe2284167
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=; b=LXZTo5Km0A0vFqq/
	6Y0PXUM0Hds2e/I3T65N3lXnTV4dtiiwmrFv53Q0UGQFgNTpetWIXSjLUNQDOF8A
	U24XwMAd5TktWstO1bXssbRUiD5P8EqL4zRpHJLeYnrgpxiHA5Vb8leJv9MxPDCK
	aO52Ogw66FVaX5Zyj2raKE1G4k9rKzm9AyWHJSx7qRZtq5zB0vbIxMEcVxOTKCiz
	X9mvA9T0F6W4Jsjo/p9T8NNzY2tfc0I8S1gLHmTgdgFaYzr1JnTUitx67Qx7fEVi
	BoqbLzPB294eYHUCZ+43cBruXROBIvjzOdV9wQm2iAdFI9jP7wh2QuHbMBz/tpoi
	7bYnjw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s01r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:03:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so987462eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801034; x=1794405834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=;
        b=XTgjxl4zEAdTMHED6e3/u+guzv7MyqQd3DHa3fThWi/kxKh/DEVKBgrebwJE81Wv/r
         9z422YHosgGQxbU5GZcgJkRs/y/N4UJOoksjebSQ2HIMYa7kNqtFTiDt7/F9lnecT7Ws
         wrPVpkqydj/K9Xz/jqwFqVkRFNGosxVGh1iGccyWlS+/nfBs3W2NyIYIDM2+cw8ZGaO5
         YEht0B7E+pzIrsKEvhurOYnz693FFUCheCr2+NriALq3Mubs2OoV3BBT65qW+5JZ9dgl
         RiW+37hJdDGzc2K2UJOJUjIz52gTpcpceBRd4u1tPgq5vWLfN0zXzO3774uM47jhUZUk
         t7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801034; x=1794405834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MFmC+Yy3MFeMoS+Yjav3ofHUpRiM+CWnAzcmIMs5iM=;
        b=Vef5UIVfPhdhV67FrF9XsUj5H1zHfjdX14Hm1EpUvZcM/m9cbFVd14ETYcJbxyzoWE
         pVTemuXO+nsLmJY7TM91gjnTg/1Dd2/gvQBYEkTc4Lq2BF1FHCzVYAIdYIq7cgxXGA1C
         cxFaRaJOcrDQ+G4+9EW8uDNM9pLsvGe/AUi1GRv5w3j60w/3flIUW0h+9XjJ6llQxJVu
         ktSR6BHc1FHixBTrHyY6IuG5SKeQTxqJvQ4Z3pCv4b7Ht1qMsdNjTXFoTeEg3jqFTZ2b
         979qMSHPzhhvwFY2P3P68GNDYU9WCdaVuo9o0KkdhWMx7pxCXM47DuY3lVSh+Zy1VJSC
         ZpQA==
X-Forwarded-Encrypted: i=1; AKwUvBxo+o/O0LE5VWT0lFKlHEMrm2buyY0irlez1DpTfgkByY6YDE4JgO545qI4ahQmk2aS0fUhGaWtBcmN@vger.kernel.org
X-Gm-Message-State: APuU4Z83f0AyMx+c2955/e7qRAy1xzc+rJA3+f84yWxu11QZh9IUYZTW
	6NfMbngX1qK7Nl02ejrErK7Yrq6Nd4lOG2P4IoDuneS+V6aDSCVrZ6e5Czz/BrunYRaCyb+/pCt
	2+kNom2mFPBtbV/csqm8PfuQ2tl1mPqisUmyC9gxwaXWeE4EiNF6eXDo/VCLRV7KrFs+QA9aB
X-Gm-Gg: AYBFou1N4+JcmTY/D1sa/C29OWG+Xu5Skum9GOnNJhnzrEKvYKoUHpk3LkoDUnDsaPo
	kIkYigeljMRZj4ALJiH5Rkq5i7cMWSofpKSvDbKTwK6/HQqH6+Qgie6cW5FQAZF/Kf9WpOp5aFj
	RIFhDbK+V2IHhu41H4P21HlmZBe/bafmgwVzvvx78ynanTvfgp8ZSheZMHd15qW/pAs+Uypvb5n
	D7UEHbJYDuF3jp6jNOFT5qA9Ur1DPZkVfbSjxR6ESkZMMhkBEwNjl4W8s+U+rX9Rv3FofxrUuso
	NJ+wUcrw3kv/NF+Vn2iHrTmA5dHPI+bHYwyejv4HxQJxXuCXVhv3St4EGFceWWf2lhlwEQNpVd1
	BkjqR6g1mpDvaabuXgwzNILs4M35b2m8FStZyg5Xw33KfZ4I7tFTIwCOR0I6vZr91
X-Received: by 2002:a05:7022:2522:b0:185:b157:f271 with SMTP id a92af1059eb24-1ac5d2c58cfmr31477037c88.23.1793801034018;
        Wed, 04 Nov 2026 06:03:54 -0800 (PST)
X-Received: by 2002:a05:7022:2522:b0:185:b157:f271 with SMTP id a92af1059eb24-1ac5d2c58cfmr31476972c88.23.1793801033221;
        Wed, 04 Nov 2026 06:03:53 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm10195570c88.15.2026.11.04.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:03:52 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 19:33:31 +0530
Subject: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
In-Reply-To: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801016; l=1307;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=tZFCvJe/8G5jFqrkaVvLL0DEwVk4n8owAXxd9ixY1mU=;
 b=aj7l4WZ/ua7uRIhw2ZClbEQ/r0H3bWDdM907xuipcHIouOyKlUFKqPDaWRHN2rw8XHqySaFry
 4lB6ADRbfqtC7te1ZkCTCyzGCXfZCcEeUh4qjMtnRIuzm7+0r/CSccT
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb3b4b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bxtqQOLgvJ2GUwSKSRMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 9qe64_OCd4laMDFROlKJz_KUNc9ORkbl
X-Proofpoint-GUID: 9qe64_OCd4laMDFROlKJz_KUNc9ORkbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX4imwlFsle+DX
 Dkr6x/uSRFdiXgeIwJZgKn8m5J1/f92OiGYCtE7cdZLhhrGBpPLfxWeqJ1LUtbHhafo1lyIkIcu
 3lW4MdqeOayLl9oIAgbvkgo/4trLzWfOLO/jFJ1s0mAqq2GGM6xpeRxpWqgYdCmQMJT+cNSW9vV
 W15HNR5hkSr4bORfeX3qHBLnfL9Emu6girgU+01aJOpGYd9ihmU1d+YWyl2vkoZw2PTxdHswrId
 CLNZ8KrFtjbKprKDq3a9ha1TUUKwHacecsM6Ji04gX8y3l5j1m/cR2FVyHugVi0l4o83/afVjf4
 JiL1b0zq8+8UaeGspaNIy++WvdSMrhRJHUmDmv1J3OdQS3JJsLNOhTKhZdKnoAKGKRExM2c61fn
 keNtpkVoxgAIPneqJFSg+Xc0j1y6NQsGaRx87temMyaHwKrbfMQY5YaHMfMSMb85F/k2pRm4xnv
 Wp1YGjn3Ld3V/020A6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX93rNIs4Wo67O
 YlAYpK6Z3w4EOk+9VSDqac/8yhhn+QH8igtUxVtKFZ72Ga6lVpJYoemW8ZGj2wYq7oYSMLQ7aZM
 AjWdrHBjqCvPoHCsnKSPOaUeN2yN9g4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

Add iommus constraints for Shikra PAS compatible:
- qcom,shikra-cdsp-pas: maxItems: 1
- qcom,shikra-lpaicp-pas: minItems: 3, maxItems: 3

CDSP uses single IOMMU stream, while LPAICP firmware uses three.
These are needed to describe the firmware streams when Linux boots
at EL2 without the hypervisor.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..8c8a7616d478 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -112,6 +112,8 @@ allOf:
           maxItems: 1
         firmware-name:
           maxItems: 1
+        iommus:
+          maxItems: 1
         power-domains:
           items:
             - description: CX power domain
@@ -134,6 +136,9 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          minItems: 3
+          maxItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

