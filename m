Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0081D36D50D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256367; cv=none; b=vFCBSCvN+ICoxYCegNoyZOdfA8ARS6ZVqjhBNy4iAtANYddAtEJBc91SuotgHy2gd19FWyovBRcnb6dkJNMxf2ketx951tiLA+qYsSeEsObXzr8tCJSOSXRwrVQTOoyyjDaiJb1d1fxn+SzP+xirO6aUTbnamk3BF6RNosJP6Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256367; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjrFI2BDlVtEfOeiij2A7RWOf6mGQMFnV3pAyXjzQ5nIvdIS/2R6erxdaiZsFEdC/JjUZIHvmKX//cxomig1+d4qnMfZOb0muIZh660M9gOXugrAOLmpluDARqcZq0s1i2i93zzJtiIJHEyauLDhLr9ea8QMbHjQ52ONueFn93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0lp+KTQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSvceLR/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0lp+KTQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSvceLR/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39YKJ2516164
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=N0lp+KTQW6pkD7Si
	l7qUOvhY/D8RR1ZiLGw4IX7+TazNgOwuKHn0jntZPT9V5oMA3HzQx+yBRynFF0GK
	zGwHsD2PZA8wDctJYwKDGX2aWrWkbjvUfvDk6S2XL+i57sLid6FBrB0r1ekmCJJS
	kbDl9CpvcrJjQLLJisnitGecw3grRpqNQaWxgPF9YNO9TQpKhf8oKpRWIgfkznqP
	UchUbygKKKGyfX8hsVaMLnFu62eN1hK/UnZ8P1MaNwdM7jIQ1Kbfn4fO1aliki53
	LfURV0sbueZsrZOSr4ToGTrq6lw245YyWtYtFThh0Aq/8rD/PwyAdHFtKKXzMY1c
	VnVL9g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r72cg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963b744b61cso724665241.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256361; x=1781861161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=LSvceLR/FLQ6T/Z/VF5JsSErqtktlkKTrG2l65ynn5sP4rxkffDTqVj4Mwz59/xJVt
         DGMXMBNIbgavitrhj2XmoWqJH5RCW4418JtwJ6nh27iFDDModundtB+3dawSc33VcrVB
         7qOu73IP4mD/CwSPuPqXlQxQpRycdxXp96syXz0AmGt/c4ERljxK0M1knCBHVLNzPSQc
         eszcpiq5IWVLqY4vP0037JIgjSmRPwWAAeNyAyCxjDWkPSHORPac36NiE/PY+eG2skvS
         o2TPEifZ5zXd79xUW0p+1nmzNpyxUOCsaG1GcY4IZBzZCorJpYsgXT/3VQbOohaAJd+/
         5e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256361; x=1781861161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=gZD3hxWwo4qjqd7gbXNvuCx0iaZqbDhBj4Brdn1Fq502KvAgZpZZqUPSxdxjrFcQAt
         eUZhWCKVUuUCJhvawFeGsCoTo7aqpva3C4FdCgOXsEkpnJpa25BYHh14s3z+GyqXvBQU
         e/JNIJIw9mq9hdT27PF18LFmhLDd+hA8aNNoeWdh84vkQY64H221U1/IcpqsgayevFek
         hc66ZZ6LmS0dP65AMu90z+S2ns6ROiTGHM60+qRL159Uma3Pijm7M1oa/JqHQyQR1M86
         1rtN57ddMUwAS0/pfp9qjt4Z8oGsKf1nR2gnwtCmmCfZpCQAS6btugGNXiZm3qahTM3D
         Ea0g==
X-Forwarded-Encrypted: i=1; AFNElJ9yUojNcD6Td7Vf4OfBuGZ9kefwSuDdIGl/OiGE4/Ky6bVQ1L9ni4lRHVfMYkmZdqMGRYDDMsaFUtkh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7KHNxZ5T1AvtFucD0W88VtMiSP1lkzD0kat3G6wkujuskBhPA
	HJUnSNRK+LfGK1dtVzcL/eIPUJcjrs86ruBS3Q87aSy1qm03ula3UUh9GqT5ZWbJ1RIkwnfWk1W
	O+Ays/iqECO2kze83xUsi5ECklr/0IerqKKHBq7IlLPk+/yywN/3Cw6vAf3PIP9NI
X-Gm-Gg: Acq92OFRFI6scRDAn5mbRMLZKd9ixLJ/hHXMg9iIdv+/ldimjm3FBgxqbd1I9bS5D2f
	vXgmT8rWd8uu5Kz3+D7K0j7ArHTCA4rb0/5ax8cM9KgXwweDUXVT81eElICCMcisUcYX5wQG6mD
	DGzB1o8YPy44RjPkHKdlOEl2r+CIjkhPNzgQvO0V4nAPxnG0njn/qv04wNknyy7K7nA9o77jv5Y
	6Ta8iUMMlkOrQovbCZOx9f6Z1j0lmKevaKiKPtdnj7vaCOF7pj2htfnvvWI32J/eArwzP4hRwlh
	ls6tWIP/FywyATbpDMdsPoHuldcnvx8I9v9Ac9f063YwmnyGp50NFJ8lDe3k0WTukmkrMz1t20p
	V3GBoglYzGS8ER2wJU/bYZRaUIG3ZfqxA19CIhNB6cVl9IE2aYnGnjt6JRK8isVDnfRG6YPufF/
	mXFcuZdpWjL33TwDRrn6L8cb+FOpa3ABrzTfg=
X-Received: by 2002:a05:6102:330d:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-71e88aba506mr803584137.2.1781256361105;
        Fri, 12 Jun 2026 02:26:01 -0700 (PDT)
X-Received: by 2002:a05:6102:330d:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-71e88aba506mr803574137.2.1781256360680;
        Fri, 12 Jun 2026 02:26:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:40 +0300
Subject: [PATCH v4 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-8-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQzimk7CfvnnnQnvM5Hl1meJWWFSD8oLzR2
 KXbIgmwWBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1WA9CACAN+xCfByVuOkvI4/VINKTW32xKp94696jqfK+4hKhstfWSAhkJgNPk5QORhUUlu4qbhT
 5trWiTjxwSN4H4/ccLmpmFOj9IWy8I5v2tnXCyzbnz+NPt9qFT50crT/JuFMpC7KBbh0bTVpJGO
 DY27k49aYB9nS7pnUCstiT5jERdV3j95swRHSIRgBiEv9SAGI32TL7xwREenVCRtZuVMhGOyPiE
 SX9MokSEXM/8ID5dPhhpmtKFJuKCQ6MAhOR3/sQfmDzqMEMC9aSngPemX+U/6fBbz4W02w3rtIa
 eJ3hxiMTHPtZvObl/TzHCGoiWYiPm+Y9jKjGfH+rUFHa6DZ4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: KZdsH1ADXq-JxUfe1ZjV3LxvTeRwidN5
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bd0aa cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: KZdsH1ADXq-JxUfe1ZjV3LxvTeRwidN5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX3WZg6Q8cPiK1
 4jAji7S4ivNTt1ioy14dgdHtrm8bRtiJgmCsDd9Q+bQx3EnfkIdiS9a+DBh6y9l0S/4te1z90Km
 O0swa/znYfMSFOX2FRDAM4PyZ3c1Sn4k7IbGSroFfmbZZgCyOYfL7KT7R9IjCB4IDOt/cb2DyHI
 EY2TnhOsKcb+WLlTQR8YC1RZbEMnbFOTwNOM6OQRCpkDiQ9GJJ+jNH6XMyd2LsBgc4qmTqZKEQT
 dfpifvkVDMIOYl1dxl3G86KvGNTLqXGs2Boer2R8daFIuIfNpI4q9JtGBlZLrxCeYWnhv4HpXRE
 TgfdZ4DqqlbtufVv4JMVaeK2t8cFFQzNilOnpSq4Gy5G5DPQPABQVh5lv0DOz/uXWwFIKnz8LS9
 ltZ5WIhTBJsZ6S1JaBAwd2x+fpu5YR4GGCIy0l72fLO1d7jzszTz75P3ekAW2IwkHZCEbYFPMkp
 ME+CwAVVcdsoNg96y6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX1hdpvcS7XsqC
 ZVzHRoU9KyWDqP4ZsfhhJOe628VF/oaULbrfrpgWSAs73dzQDytgir4pMoKzbRRTCtgyWNDO4/H
 JC96CoticKG9ygH2lLzg//Hk007s3/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33a34573391a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -534,6 +534,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3

