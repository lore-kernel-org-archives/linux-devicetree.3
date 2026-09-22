Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E02B3F0750
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051632; cv=none; b=nrF2H81RJSV8/wbZ0srRMUiuSKbINR9v0ojKnCs6ErDpljdEU5/8wPzr/8rgi6oFHqDPAr8G25QIavKxWpmWCNcHDyz/Vpp5W7na2FHRZOkKE8t2BZHj4rMYcSR9GhxmYe1qr6VxiA3nFz9MUDajRS3UwVCeLfpfmzZZYXwfiYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051632; c=relaxed/simple;
	bh=fUNMC3JGXhbiq9Y6lFVg/e1xZgyALQ51mRBs5zUcqVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBkYumYOp/FEdgVlQVtqkHwi+7aw5n7ghAWd1v8EM+VF8/syaCyjQ5M7HDRWc6ypaztBFDL7GQ8ab8/6A2rRQUNQ989vdPJsDDBXi3xeCTZTqw3g1zc338vBzaV6st8Dg3s2tbWgA2l7uLDTGoSwittGcZA9vU8/ujBZkZ9t2nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nk+TSupv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGv9cpmU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nk+TSupv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGv9cpmU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00KmU2673979
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=; b=Nk+TSupvOCDlxZ5n
	cnZC6kQe3QxOZl4qJQ1LD07huOMERkD633M7pbX1ZW1sikDg28v5d6zWXl8F1Wzc
	KyP9sbhOy9RYiSmgSo1lHzrzPgFd81S4of6hLjIL/tcbNaWWZNgwRWzwqpay16gA
	aml8YFyKrWSuSTyCj7AzPhfpWh6OWSL2ubOtR4djfJudWuZ2Tb8VuLvEExcS1FmA
	AF+NNQzZCg2DQbxyCg47+Ttha5/igmYfuAEPxuXabMJJo3+bzQzOkAaLH7hV+Chz
	E0DPZpacfKkGx9g7aYvwfJVJZsroFUBrhocY2QGy9LfEe6McVEDa9vNQAHdmQNKD
	vd1KyQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w7a6pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so69163355ad.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 21:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051628; x=1790656428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=;
        b=GGv9cpmUcI84qInG/N3c4mCvUkkBc2wO+Viu9YOtMi/aHOOJcRXZ79I5i0G2X4CPCt
         /23oJftOdYfAIf6kMASFy9Da4ZJuqULlZ0UHzA2UN7hY/DZxCdSV/+vm3BNF/9hPON9Z
         JHaQUNEHutGXqcC0ENY+mdxFAtWF93ZUE7QM3tsArhXk2BoNBRNqOaznvjXLYphr+EYZ
         xLiR0UubfJinpVN33GOxT3IxYAJ81cH9ntVPcqhMwOeKWCrgcXlKckoxwQWrMMLU97Kw
         43iC0br0GzXTGsy4W2bxZpXyrypur/n3kxq/MKnwksvaHT3myfhnzJNbjNufMJNH9P73
         LItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051628; x=1790656428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=;
        b=idVgn19FJDUpEeKKn+bzKerTkbPOsTykyyBkQehSBDpCHVdr8iJXfKnidCDW1l25cV
         3Ekabz8JCOqU3lHcRbuiTjhbMYbvBodm5Ye8FCmkGSzoX6zCpiUfx3OqiBpvEyUsp+is
         zlri2dwbS8Fe/b6kwbj3DpfzUV7aXCzjOJ2nut+C4hmuP9quWUZrFhk4XDC8E9vpj67L
         IDx5ykaKlGnU1kHNdLOAbik1eL5OMWOBD3N5SBJhZzQNWDhzrfBcx5au9ZVrFpd95EWf
         NYyx+saLEeyCT8H/airpUx6qv6pwo7YsWvNlUXqFB7Ha7fcde5E6nl3xTwdWmqtvFODs
         LKtw==
X-Forwarded-Encrypted: i=1; AKwUvBz6WikwphHydVc9y3Yv3J2C2Gmja3dYdxDSSvXS22jKuN1Njl3N0lAGGM6ea6jrJVX771m+fOzgUQaX@vger.kernel.org
X-Gm-Message-State: AFuF++lxLlBMjH4cXRLcyUktOVBYu0IUisLfzjl3KXHpYaw/sKzNbztT
	YSmMbEdlEpZ6C1cb2loefChY0xKyqfsSD4qjiOz9IunK71wM5kAi1/MTkbRYMrLb4qfz/ubYo7B
	ik4pNN1brcBl+AIhznYwb7VBD9nUGZalGMJ1J6ZCJz2zljqy5m437awmDPCojMCpO
X-Gm-Gg: AYBFou2Ub1r9483WvjXW9jdhpu7DfDFM+5pUQacz3KngnmbainpyF7dhQZTwgBoimEa
	JcLFAxmFJc2Z9UlOdBu2kNLzZ8CORYOFL3cqwglFfXk3UCgs+1MBf9glnoNmgMy0WE520ML5eEk
	817QY4IHtJV9XU06wTw3n7u+TS+CgGfuakX88q1gBF0ftxoUN6dGdEi49LxZ9Ur+JU1Ia6LXg4q
	656XNE1qFj2ixlFloaGE537ryFDL53YD/2YZa/oGeVGLOJ36FK7Ww7PmEkp6y29NfJSSMwzSvBl
	hWafSdTgGinI+c2vi66pwFmouFfIJ/61hUit4ZmxSJClcql/CRMDcalj28I6aV6T0AiR9jH5nYa
	BEDLi4N8sYm3hsygeHKOrfblftR2NKuW5HlWS1vYY40MAgwJbpeWA8hNyNPWVMweUObGiVuAh3S
	/RUUF5LQBTUpWonTCApTsI+3iDww4xggHNbqs=
X-Received: by 2002:a17:903:1a4e:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2df5b26c9e3mr13235695ad.40.1790051628306;
        Mon, 21 Sep 2026 21:33:48 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2df5b26c9e3mr13235455ad.40.1790051627874;
        Mon, 21 Sep 2026 21:33:47 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1906375eec.12.2026.09.21.21.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:03:14 +0530
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom,ids: add few more SOC IDs
 for IPQ5210 family
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-ipq52xx_new_ids-v2-1-4b1a0f3d04b2@oss.qualcomm.com>
References: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
In-Reply-To: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: _3h3u-VrQ8EJ-xKAYh_CxcHvZLn1SS4Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfXyeFN1CeZ8pku
 AKDmMNicTpR3JoDSZVMS0kL9kXVEr6cRkjGpPjTVWOIFVw/1qNaljAgY6FlGNYKxh+5TAuBXQBR
 8GwMKQS4wTmE075o4ei6WF6/NssQWFwpa/RWJ0/XdkV77wPrjpOW+gjyCr8HGGkg80p04rBTYJI
 OyRAkNiWN2LlpeFm/HQvWjbf4NuMXYJRdf2x1JVWs0vg0m/FdoUZ5G+yChOHXYhhdNSiaO3JEG9
 X4dPqAiaoas/+FQIfWqAquQ3FMVQ/p1eWAPiCPsHpXtuEClvclhn8A3t2b7ZevaWvLAu9V4eOsk
 ZW6i18eZskiudZq+1HhMQvPmwXmiaBsiD37o8JayDEaYdO4jOLHVydpw/dNIZDIPmJdCIcwOSav
 tAxZkY8djESzeoviz9K95YLGzb8tVfrH85eDlwE46E59gZw0+5O9VV8FhJ37xpSdzNnMkZ9NDQI
 2NcWReAH5CPtPikxktQ==
X-Proofpoint-ORIG-GUID: _3h3u-VrQ8EJ-xKAYh_CxcHvZLn1SS4Z
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab2052d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ieg599Pkg-FuY5gSfokA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX+hv/9aQaTQTR
 LSykkWoRmogeToKcjHq1D3QqcUWKBmS99sWC0qprJloc2XZNgYQuE0HgQ4gfXc9VSjPAlIkkMgt
 rkQtdzYB+73ajIQuVST72fJmk/kht2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220062

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index b63e4a0b8e54..f251d4c75612 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -317,6 +317,8 @@
 #define QCOM_ID_IPQ9630			779
 #define QCOM_ID_IPQ9640			780
 #define QCOM_ID_IPQ9670			781
+#define QCOM_ID_QCF3211			801
+#define QCOM_ID_IPQ5211			802
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.34.1

