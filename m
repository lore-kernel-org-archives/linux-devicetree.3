Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F7D4399C0
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382719; cv=none; b=NdQCT921BCfzNulJ3U39kxqa7Km8CZPmkshTRJP0np31lAtz80ODE1i7bYChKjxqrD79OEqKKf0Gf4BfqrcukAU1ow5PbE1XEuzg07qwNggvpePOjLkmxL5Szf1tTJM4vXFp5qROapg4yCOevRDsYbpvlbq9VHGAOtybCf70iiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382719; c=relaxed/simple;
	bh=VblMUtasfF6RjPCwMXNJ66KxCQ5fC4RR8B1FbYJAMec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+y6FxgMOTe7UD8dgazN07v2UlKBSHxQpl5ebHmBaODktfyiSkNbOjsPAEy3EzOh+dbcuTzPac9WE1tO4DUHhr29Fb9pQ9EkaiXmR9hAatRrNeqm7fULmqRMOLRzGnu2nQk0dDqXTxeB3CT1Cgy+RZ1pyqhTg4y9+UjvWNKWnNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTCY3NoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkfKX1fh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTCY3NoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkfKX1fh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nPrI3731427
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZDQ+7buSGCLpRXUFmxadkYINuEGI1foNY+nX0ZiavM=; b=hTCY3NoRxxVkl66c
	IXm8m7gpB4mR4T5eNRASpEebuV6jE7bzW8UWTTwlTPgJv/9KL9X2MqLzarXM9k9w
	m/6l428Uvuo+FqaEIiYfJiNl0h+cDaBob8tQC31bDRWI2FJ4X5eFl0LVVde6EN8Z
	ONeqLGiUaM8wj2mQ6wjBm0deUcQtasuXe1L4Zp3/01bY3trQffsuzEZTSKRdHYQA
	pjoE1J4ZXWxqoKU31UohsWmlhO7CuWxNQ2kLo4zIfLZPA3Th8Vfjj6MjtsDLMde4
	jrd0eBVuqF9v7fR52m2BKiUpbEkasdKYWMnRQmEgAHrkBwyzj2C+NMrs5VsON4ck
	F2rJkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0j0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a08ff8451so281881985a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382708; x=1789987508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZDQ+7buSGCLpRXUFmxadkYINuEGI1foNY+nX0ZiavM=;
        b=NkfKX1fhGejU7UKmGWwtU6j0zZlr6rVv9shKXQgMZNNLvQeYwSrkNmvwrbo8QBcwHB
         YuC3psT0NF0bC9VgZl4ZiHSjrkO7xdeiYaaS/CuTeV105GLfghN0qbM0ZhSWsgXSJu6j
         UugO0vpDNbR1VDLs4bWzIucXa7fNtEd1KA17L4qQx/LgS1IjqA2SQ5huIwVUEHX8lFd0
         OPhfFavUo4foyU3ymjk+Opeu7VbROar+835m+2DPRCwzDRSuOQ/UUpRHFJ7+CNakpO5+
         Le9qwfkuCdtEqxnhJ4lJ8B3iBvUO7o18Kj1F319e+FAiRzHsRD5sFrRJ250u/ZtGdpe+
         sVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382708; x=1789987508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZDQ+7buSGCLpRXUFmxadkYINuEGI1foNY+nX0ZiavM=;
        b=tPrVqH3AGZ48cZvGBWynsS4jEenX6xHBRL44OJBlgARf3uSY+v6Fg7a5cJqDdln8Bl
         Qmv3qTZ5tCGMcQdJqkSibOJZcOtUVwvbjLQRoZXca6AWLF2iRqX3p6jd283c7EqgN76J
         0WL2vh0jme2Ui1FxPtrOnho0LYEEJcmy/6m9ODnAeQMOHIKXOLytuj/hMFCQncDj0iCs
         yVyxhLxMlXGKDX6EpUCQf+AguUHHy7BVgX9JCXQ7ymLQS7WzSfXMMN5dWuFfP843G+Gc
         zhqxIgDEfphVXA3o72Nuals2MUm7K5SUff7IgW7EiWu7qxQkL0pkw8c9RZAH9+aUOFtZ
         VBXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8igGHquhHfSyfe3QUwy3Hx30IoRcjTAchmKZxPpGjZEgK9qTHyYbGrCkRrJYB8wKUffshIQT9Uflv@vger.kernel.org
X-Gm-Message-State: AFuF++mHRs5PiPMbl6Pqw5S/+AxHXy5JOUseO0i+rRnyL53//ZkFanrZ
	hmM8EM4uOhKv+KLG/7oOBH/2JbIkimV2DW5vP7InBk7uhFfbb6T6Bg0baGnbtIXB3CyY6ALLLgW
	vUerE5sYmW/o55w1j+ZkoPfNuXdKG6yU/x8DcKBLXgVPyGzTAWqnlL+XyBu+Bqicy5hSgcrQJ
X-Gm-Gg: AYBFou3pqngm0aaj9Kun1+xmL3kIJTuJOl3xfxmW4emrZNB22+3sjh1ggQfA5jQHe3E
	LYkQdPoivlum9STLxCYhzMJHqK9jyXJvD8Of06GQSb3j6KT9pA187hnxMxkUtAQtlVk70Dz1wY2
	hvKMX7t4mbvKajw9vw2tozVcDFAz1hvJl7W8TE1t3Pq5GBH5X3Eg/JpVI7wGGwxFJNcXaum3Kxv
	bQdxUq6w9OY/WX6lur/XGbo6P/kIQQQkMRpucgRQSSfjPIUnU9g2x2K7DjN0UPwNl6+yVBBleOo
	73EYc9QaS2lGevRvd9YL6BrjBDj4Uy0J666moXSL6p3M9wbdHKNtoq2lNQ4QpN0khuuuq3UT/3t
	NXDBkg9fI
X-Received: by 2002:a05:620a:640b:b0:939:34c6:a333 with SMTP id af79cd13be357-93a29b98060mr262802685a.40.1789382708102;
        Mon, 14 Sep 2026 03:45:08 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:939:34c6:a333 with SMTP id af79cd13be357-93a29b98060mr262796585a.40.1789382707562;
        Mon, 14 Sep 2026 03:45:07 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:44:48 +0300
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Add more compatible for Eliza
 EVKs and SoMs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-1-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VblMUtasfF6RjPCwMXNJ66KxCQ5fC4RR8B1FbYJAMec=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqp9Aqs5iHvG2s84MOEmhkMvVd4hCbHTdX/Q5Tm
 3FfsjY4N5CJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQKgAKCRAbX0TJAJUV
 VmDFD/jdG9jdHPRnideqfQTJhabo3ZvtckWih8iUlO6kI0euZqW76D0PNH2AM8MK0xsokbyok2H
 8ZWSMcxsgRiwgV8MMXIyP4WXFXRE9hCCwkDbfWHMZ15/6MkfZU5aB1cySIGvdOABuTxeHpTwJrr
 dpuV4hIER4Wfqt9rvttfWtGI4szY2MA+vr6GgIgDcxuT8R5jSEL5z7IyTzyi95BbwumPEbTfMNA
 1d6KF4xYtG936nJLeGGBeuAONHt7dTgOOcA62oP8Kz7odv5cVLxt34iCsZnq7nIVzG9bnXW6mcb
 t8h/RYkOC7IqpoJT8HwzrHfRBytpcGkfbKLzuullbvAGe4nlp+G1RhaqFH0f5AXSg4jLHdYzWsd
 02sllhq9VawQCACqEpWwGqFMre/Mi+CI1jzB59ByTYWLWLpQtM79L4SHJmNaNji/MpkGgFt1aY8
 O2U1+qbsd6h4qxc3isw27jLD7JVUWk0Aw/5XpoHWIR+MwzU2jtzmdqxxvpRoM43frIMjYK1d4/t
 9SI7WrDbUnfeUTkbSgBqzvnjamgrjzpIBg138eXU8LSnfa8IabWCeENy5chIEQ0PFVU7FQyS0Ms
 weOoWiS1Yyq71TqihsAEd1y8Bkx8OA8vali3nTgcpnDi/3BZE+Ts5o2KtpDGK/kTFGp+1cHUXEt
 h3Wea9D9zOQOX
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 4q_Xzd_QdVvXvp0XOfAXZuwfK0y9YV67
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX9FjmPbu3zl7r
 OKzQqFEOHwKd7z6ON57sGoFgPF16x0CIjR8QyoyVCY7RoQ78MXInD01bYgoXVpApa7adTyVgU7u
 mH8QKq79tcLCcyQRvwh+2wWooE6gC6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX71v9aWrGFPG2
 xMHv49vjYbsn//UvYjALgCzYa5sByBXTIW6neB3nGMY/qbyjR7FANTNB+nMu0fuKVeJuV6PiG06
 GK8B7q3VqK5Xti74HncDdd2PTj6HHpMQVtQ8Cx110VCdsb3+vvAbsf8ZDHYx1BbjSc+hJ4CaAxl
 m9TgiioC3RCxwfS1+6uv3/mp9KzKhBIpIUfmva5wyboHltibRT18T51E+gLSw43nrzQleUmOYDG
 WnsKgw60b1qx4nihb2IPC56tlziIXZD3+/5H0qgA0dHhj+LyD8DBxO/JJnFiYX9nomEzcOXanWe
 fOPaC9Nu33MZKq+GG/XfP8Z1No/qPZZwhbbE93pv9ABDCovy9xxF2T7/T3GbwoY4xzXNU9lQsdK
 7l4K+3WHk2dynTP1jaGS9zDCpztYhhmR/CaUIB1R6J2aMlU4gVepTBHn7EvkPTwL42yjah/Crs2
 if/03btSFxP2DK+lsPw==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7d034 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=l6ELImiZ1_B-ckXs1ZMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4q_Xzd_QdVvXvp0XOfAXZuwfK0y9YV67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140154

There are currently two different Eliza CQS SoMs. One comes with eMMC
and the other with UFS. So the Eliza CQS EVK can be connected to each
one of these SoMs.

So document the eMMC and UFS compatibles for each type of board and SoM.

Neither the CQS SoMs nor their corresponding EVKs have been made publicly
available. Therefore, replacing the generic compatible strings with
storage-specific ones does not affect any user.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index eddf87fbd0cc..1dd187e92b68 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -56,7 +56,16 @@ properties:
           - const: qcom,apq8084
 
       - items:
+          - const: qcom,eliza-cqs-evk-emmc
           - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som-emmc
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
+      - items:
+          - const: qcom,eliza-cqs-evk-ufs
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som-ufs
           - const: qcom,eliza-cqs-som
           - const: qcom,eliza
 

-- 
2.54.0

