Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E473BB12C
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367040; cv=none; b=UGE3dZlDoYkIKdw2oMHiQ+924LvKZdvzOLyVxe9XC4fyNrk7CfCzOu75GbtzBV0Ix+W+6szHywk1KBbP/yRx3jS4Y/ZuZYa6tqSwTzpnvDqH8dHazQPs9ocUJh+l9hMj8jkYDm9YGQ9aIegBQbCrtuGkbbA/LdIPO+dws0FWWvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367040; c=relaxed/simple;
	bh=NlzhrkF7JSpIHBiXXSqMcyHhSGAiA8qh5mZEtT/g0Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E80coYKDAj2Dz6+QUExab8dzrywYMmY6S/ZuvOjWMyQe4mtajxy5iW6Zy8cwuEh+/eCiJ/SQSxxFN4Umy4Dz1oON+vxjki6nwFA+JIA8rHSF/nJd0CZPbXrY9b0tCTWN/8vm+El/CoOTJ+7/mF5sybHyLpSP2MneolTNCsvVIm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IY7s+oGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AByLXowW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IY7s+oGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AByLXowW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj4fL1343128
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=; b=IY7s+oGhbnQ73ds6
	ORMd8jDkWkQgxGBcOWnum7NYYrcAIH3KY0URRRWG444g4SzcG7xw2cQ+MJ4HxR71
	vWhYdmTWW55oLjAnC8FlslnR5C3+A0C7a2MapOf6KylHRv0WHAawcX2Iv0IXGahZ
	Miu7DIbHZjDfVcnWKFCfAxP753S/YQAFdhZ7AQg/+vLVDmykpWHAPTAVmpstkq6G
	JIeF1E/au8Srw8FwhJXE1IxAQrGC+Y7BtnBYLwgq8ZYYpljGS8s/wk76CKkjxJrb
	irANjtJx9R1kWKDMT3n3DXwp5o/mgF2aqV++Kbqu/7HWFCMIxhdPG18/vb5rvBD0
	K36lmQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v59jmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:03:53 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7ee59eeb8c1so1263284a34.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786367033; x=1786971833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=;
        b=AByLXowWdDVqyahV5Rw7qi6WB9+D+YRQdDm8di24aMDh+5bLUmdMpyxJ1CSmlpP0Ss
         BLccBjJ93V2bPq4I/VGal3gZ1UODGOw138SgXHMKpqHvnWuJiNt5bhIa5LadZsHX8pCq
         SL17yQhUg3R5k35a6bW8H7CIvOM6UB8L/hxCxsUUHDR6BGYJOjd+4GXJG6SHymM4gRuP
         HNN2A7yEXbk88aT3+yfbXl204JTeE7mXTTrZKuTtk7TTFjJgrO8saNNmU1xn9x04aULN
         3gwvSP2WIc+sn+tXgwpN0eYLkdLAqkVPC/zuFErpiXMj7aHgFFEipvIHkcYeCJ7XOsF+
         ikKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367033; x=1786971833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zs6SgYOQTGF0cWtvmW7156pRkDFZkuJqOnalOR1+T94=;
        b=RW3H5jl+/ApjJ6snWFEcbKMdB+t2OWmRtH5pY+RWykO3ZlB9xG1sh7n8s3vuv/eTjy
         xt+Trk2/9k0nrAAeImKA5yIR/yi73j1nyFfDoXWx8guqQf6c3A/mpvE85lUq0r2aeq2c
         FnSbAPozT063AMdWatHiEtq/PIua+XfXV3liOjVIU9stOk55CcV4gTgDgnNDTybxXSUI
         EW5I0yES1U1BVEXAhWPnaKJ2o2GiiWk+DHmrfoD87kVuJp4QwvXdeQPBP8Lyqt1AmrOK
         u5ytleKTHGlqfHozmP46FR3sEG0QJkBtyTU0rT4qLTAy7f/9z+Svpw672S0e/2FVOYzK
         uPuw==
X-Forwarded-Encrypted: i=1; AHgh+RpL+3BIVEP1XPqHV1yIF4xiRzJxms6wQkUpa1L0OewL1suUSUFnBgDOOJb89qn7STgdl92zT0gECN2K@vger.kernel.org
X-Gm-Message-State: AOJu0YxnCDzGR3d7tL8V1xGBhlnWi3Bsvrg3oh+Bt/MpJz8wJ7WkfEcy
	c+Bf9kCL0xWHp3cXT2kl6P0y72WWyv1HcRXcKpOW13hJqEx6ctmLEjbpUhMmiWa5hoyYTZuGsXS
	UXsOoeP8qMFExDLPOVwT3VbRcFCXVVzzsOEP2+Q7TXTgeUhySNxJWNy67Fga5YDjY
X-Gm-Gg: AR+sD12JK56gfTDdfIa9uh4vxPSrORMgxBLkfbtTTedstcDwkwlGi1b9ibd+wmHurtu
	Uftz+9tr+uIgF0dNOy0Aa1cAvWqv/sRrYVO39f8LrB06Nn3q5YccV1ZWTuM2Hba6izeK/F8Srnt
	dYI4P80fvarqU3umAaY+VCMRK5sr+GOkyqPU6SQMYINE0TpjrJDgRBTVCELdPw25LW4UY8MO+ek
	M5V7X1nmJONIQ19GMd/cwNyPq/1clg9yyC0W2OCyf3REwMkWMsL/En3dJyk7V0Wpb0mQB1AGfXZ
	q7a5Qvh/N5WWifdl0sg5vuLD4Mz/4tzgSR0448mRmG+RJFyQ3v1Juenyev+/VLvzDgWUuydzFyU
	tMcRAO0E187d9HoiZaILH3qp2J5clzqCK1z8guS7Wp8XcM9ezmySuoeXmpAYM4Yyr
X-Received: by 2002:a05:6820:201a:b0:6a1:8192:4d89 with SMTP id 006d021491bc7-6b0421e7d1dmr10154895eaf.29.1786367032749;
        Mon, 10 Aug 2026 06:03:52 -0700 (PDT)
X-Received: by 2002:a05:6820:201a:b0:6a1:8192:4d89 with SMTP id 006d021491bc7-6b0421e7d1dmr10154849eaf.29.1786367032300;
        Mon, 10 Aug 2026 06:03:52 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a9e431sm8218971fac.6.2026.08.10.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:03:52 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:03:28 -0700
Subject: [PATCH v2 2/4] dt-bindings: embedded-controller: Add Glymur QCB EC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-glymur-qcb-v2-2-9e6ea7987b9e@oss.qualcomm.com>
References: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
In-Reply-To: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786367028; l=1007;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=NlzhrkF7JSpIHBiXXSqMcyHhSGAiA8qh5mZEtT/g0Ro=;
 b=L2SHP3y6AA/DefISpvsaBMmLdWIK3RGSdeFaTPtcM2G30EW8oadbFiJ0Ba5drx6CeG+Rs0NJT
 TRSuRq4gEWsBDOmExnn01B9a9iWgKnpVItbsSRjdRPFBY69e/8mzWc4
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfXw8iqiwbgYIEl
 zDrqUcEFCHA1fBnyuYZhGCySIoANGP9iIHe9Y5Qjy2n7cPgovnv6AdCz6wPhbM/+hKNZcOAYj65
 k25fsCa6OPAeD0zMnOPr9VsD1O72eSc=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79cc39 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=34zfTHg3cMDFYMdkEaIA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: _7Ukm7bxq7At0R6u6doYj_-8wVeZ9sSZ
X-Proofpoint-ORIG-GUID: _7Ukm7bxq7At0R6u6doYj_-8wVeZ9sSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfXzdGmwCqVDCu1
 JPs1eDuf/YIF9jR8BCd8wURq9a3gwgWI85Zm+00DlwpRsxCCGboU18kqZQYqzMquADUpKtcma6u
 Uh2RABoqxCzuqyB7u+DEcB4D8x0JzAzI9MS7MFWFGCUujNlWEILDA5ppJAGLYSrR8lPkdz28j1O
 2HzS/W80tbpYfAW4L4USbVXMtzaYqF9P/Y/IDg1+73tm+yiWcae+Zf8aZF3JXpHwAj5qFylLYIZ
 hCmjHnGHdGOE5eTF+hKoPLt1e7TBxe01saVh7eUtzAsF3O8KztBs25pmOwhGXxmrunw5uPISAI+
 NH5/luD7bObI+FcEGQDdbXgnC1AO1n1aWkOr3DNBqEb5agJ9tBrUmjYJE1A3CE/rgMkROPLWhQ0
 6HVS59d405YrT+tr1BjlwNoRyM3D8AiJ6+C49/wtyWuneiQQOneqN6+erxaFwgX6UxZORPZ13oB
 TO0X+z9QM+IkfBniMng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100112

Add the qcom,glymur-qcb-ec compatible for the embedded controller on the
Glymur QCB. It is the same EC used on the CRD.

Reviewed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..de416057063c 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-crd-ec
+              - qcom,glymur-qcb-ec
               - qcom,hamoa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
       - enum:

-- 
2.34.1

