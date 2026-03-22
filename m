Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A893009E2
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195719; cv=none; b=qrvkIQMcllaakP8JpQ4GfG6nGKpWDUNzAZRpbZTezjim0MMdqXYxCv9WsYywSoCdROSH9350rtsM/3aES2j+gpLPX+ErwaZj/okXtm2XIFMwKSGrAphMtf4pFiqg9j8M2aaVVvi17OOU059+c/+mNnlIKoUIXuVnRJcnWuI8cjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195719; c=relaxed/simple;
	bh=MWKYUpvYdw2OF1ghyk63JJ4cIjAO6kQ7rkYGkKMoz8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AeB8KftDZfFDW1K+ZylNnx24T5EmRhOxniDL+hRnUbgihi5BMqB6kxOxFAcS1iFQbKKC3Kh/SY01vs1M8B53w5NJWlCyAgVqp7pPqJ7eCC3XXcxAC/raOhywvJdZ+rnfi2PxYlCnxAHzmePJq0l8lhlR0gA3EFRs9psrblxihkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuCwMtv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzX9Jese; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuCwMtv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzX9Jese"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M9cqiV706454
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYDW5AnySHMFnEHi1fw99uUO+hBP5ybPg/fnZXTfyK0=; b=OuCwMtv6SHtxFR1d
	+mg3WCVaEQWawYe3IMZW3+CWm9UDFUDEN6UYvf/BIZjbpcT0RXVCbZmE4p4YU8Mr
	l+OwZyiPbxps+w2plESQ6ml9ig48kYtjw8ie5qRSZJEe16CBW7Ek9u3SKyjyPYg/
	QwKw3y3R3noojlXI3vDgM8u1bouDfR0n8PCr0fYwE8mSOSZbSmD48rb1PS0kZvKt
	tMQvQzxKsZ0HndQtDVDRF71+XBf4NLTeQw6LYeLTjfQV+/5dPgJXusZZrIQMVsoD
	aiSTBVRBKp5T7gelOZu//D2bfcxLCiI0bXl1u6LOhLu1NyyiCa5ow/JStQ4ePouR
	nEddLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3cth27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so107304841cf.1
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774195717; x=1774800517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYDW5AnySHMFnEHi1fw99uUO+hBP5ybPg/fnZXTfyK0=;
        b=ZzX9JeselQZrpok5KPwAyX+Abca3fws2IjgHCwRwa+TwyyKJLLPAq/lZRqpXGaICa9
         mBh3EdWNGFrPLW0CGdkC1pQrdWRavSTH7JKDJQJq0yoWEoRIODYf2Jwk7qPnxWO2y2/N
         rbgCzV82xEqpWgmezws62Q2HBtQQLr0IGVsI2pzNl1xKfY+5OU2iM/RNYiRF+s3AnCCC
         oxC3jb2B6xk++VcWVCIO8WDVDB/LYc8/SeNJ78+WDDuru+KRBxKMyCaa6S7LJIBBXhX3
         C0xUIhNP6gdMCP4SxjA6ct0V0+olE2h6EsCxuSuCvP8NrKB2dpFj5VA94b5bH3xKfV6+
         btIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774195717; x=1774800517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYDW5AnySHMFnEHi1fw99uUO+hBP5ybPg/fnZXTfyK0=;
        b=PyKXvvc/Qtigv8h7IDg+o42GNlioTXas4xFC1ruE/UdccFb+zsfs57doaB9dGOcL1N
         3fPwtswXgTeK5d5ez9qRtMyIrDvf9l+r61ZNtbuajfmvh7M2TtqL/5D4XjgPSL0vcCx/
         MATARMOLMo4a3iQD7FofBWw1bHNmgV371YHR+RCMhQR3EWTAb1RXcwQBAeNa55kVQO1J
         Dvl98r8cmhs1z6Q1iPt79uX9gj/1LDuS0suhRLUzr8Lm6qftPzWYaEVIwQXXDge5NqJ7
         zcbIWfCl8cB//Jw7w+I57ma2YMXrCKNVO32rz3JZEIcXqe8Z71y5ymdIBZx46JwHMVSI
         Dr7w==
X-Forwarded-Encrypted: i=1; AJvYcCU/pCQLkCaCd7CR9s3PgUuOFp0kcisDgfwZmIcqv2jHDqvsGGafEd4EfgM5U7sdMnhmde6mSMlLW90G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/XAFj97kizNqTr6yK/faeeveFNWydiH1b603Yj9+ZT/CMw7xb
	rH4a49M0zlzcYcpENskI/5Zo75ds9ag+IIUCpyCn+zsiWRfJpMG4OCHvv34ALR39+DLO+F5keSG
	TDQFdQd2hJ0/sGQV7UKmxym2BXm2f4o2hT8WNDdOpkeVFr/Hk4szSJ1IY9Jy0ASBm
X-Gm-Gg: ATEYQzz6MhXXnQQ6M5B/YYVBs1fetgBfRGvm1Blqb08rXQ+AlvC0ntatvodA+C1EWY6
	2FLvOgA6DCEda8EI97IKaNasHotDUrvU4/tZVVKT+Y6pF91TPGYSjxDl+WVIvZOGyYwJLyBYitb
	dmEQGqXhOO/I/amCgwlY5OX2WVKYEhYv2jvMfBc4bN0w9Krw1pb0dTCLmLw4ERAjzc/GIa+/sBV
	NcJ4meeOF74lbggaxIZIbBPZxlBjCRGevKucTp0S4oSA6yJCp5krNaNdqwVeRfOWyTrC5bAaDmU
	zWfSpnTrYizeC2B+EJEAKLCeeeQ9OoEd+8uYjzWsy4K0/TtouUS6+AGgfpyxfRJ1eoE3O4QXBOx
	u3i3YhnfmzOYmfC0zAnvd53bcJC0=
X-Received: by 2002:a05:622a:4ccd:b0:50b:4be1:7c95 with SMTP id d75a77b69052e-50b4be18fc0mr71360361cf.30.1774195716635;
        Sun, 22 Mar 2026 09:08:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4ccd:b0:50b:4be1:7c95 with SMTP id d75a77b69052e-50b4be18fc0mr71359821cf.30.1774195716068;
        Sun, 22 Mar 2026 09:08:36 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm79087155e9.0.2026.03.22.09.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:08:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 18:08:20 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MWKYUpvYdw2OF1ghyk63JJ4cIjAO6kQ7rkYGkKMoz8E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwBP61eLt6gZ0FWqcgkYYcEb/A3f8bEvv2g2as
 WeQgwrntWKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacAT+gAKCRAbX0TJAJUV
 Vg15D/9T8n8werLPsmGcfZcUDqnjl9MrVGsE09/p+XgnOJwLQbNNtqfhPkxosUTg+WUdh1LPCVX
 stk8zEI+Jt9RjrkXTkPNQvLG8kfHEoJJJw5d7it0tyaCjWuZ4dbD6sJ3dO7GeAnGvgnDRdKjZJM
 01H/T/nnxyzGW8mOA2PJN1zDY948/PXhigT0pZMbkr4lfaX6Yl1axah60Qt/THTO4hvsr5ICx04
 0gbUDhuQDiXJHq1QNIO0pbyilX/+BFCWmoYm25DWgK2q72lLHG5+2U6xvWv7OTM4bO4s4FiQQvh
 mBAC1hqZDoMcO2YNFtbFx5JWUAEt0RPiljCT5mF2bmlKGER0REeMx03Jn1gXLHMIo2UvCxhdcYo
 jocM0fQTjvZYMpiLt+lslIOEIlbJ7y/hJ/Yi3aC/Zl7g/+DrTmJfIUfqYPFAC/fS/5g/SUU9GZW
 ICrWkJhUD3nWlKuZ69x21ueuy0LbhpoukhRgQQLjtBRhtVQWJSLPVQote/bJcbiv3qGhiXKVZT2
 xXBH/lTs4R58GQ9dd87bu6wsPci0vW5NFoxc0zOYGkpypwDZzSkq8S5zq277pQDcU5zYo86jDWW
 tkfh3SY4dkaXmsZ+vQw8hyehsNvBu+uc172rbjLAX9X0Z6ZEHGb17Hu/KknAsN2kl03lxIwPOQP
 zhiq15OTVxCPhiA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: py0z94cZYmOscLH4mhtiF2qc8m6jrJip
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69c01405 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yTESgr66MHD1aPHvgagA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE0MSBTYWx0ZWRfXxqyKAWuvqG7/
 SYb7JIlp7uhDNctAiN9fd/exbPJ1Nr6dJvooNMhAqz5olcCMZhFXtsGQ0mGcT6ktXFRVI+tMW1l
 Id7FddL5Wt2wdBm2FC/rI3shd4fueqGnk7crZPwLtoFTEXg7jvM/V+vlvY6pzr/6vcjbQuL4qWE
 YVCvbXU1WuO8HbEICb+LxyUG4kAKgdnMe5c1Ks1XZ8FqP7kO/wkLxH4LNUAqFwXKYlyOluCrgvS
 IgY3EPy6QRASzHHZpFoJHSekPh7h+31TJtutSttr0sNcgq8D6Mtlk4P96vrgjG1ySuhteG2nKWS
 aSTRxOzTfflGDSHM0A+jHKGEatUaz8+cTMylmYZjvOUWbT9Igo579glODCBKXyrTPrzh/dS7KwE
 3y4rXoulcEbGRZLy/p+d8/o67Dkjjd5rqDYajE1kDtO4Ji/S1TFCsI2GN+91VUfQ0KwLw8xhu1D
 VE7TmrucoK9pOnEQ+/A==
X-Proofpoint-ORIG-GUID: py0z94cZYmOscLH4mhtiF2qc8m6jrJip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220141

Recent discussions off-list highlighted that the GCC should vote for the
RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
aggregate the correct load for the CX rail, potentially leading to voltage
drops and system instability.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 5dc3aede6842..fab603cd8e42 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -617,6 +617,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.48.1

