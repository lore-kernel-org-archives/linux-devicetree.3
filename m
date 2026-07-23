Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27D495518
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809568; cv=none; b=Z2TnYuzhBmnUlN5fqmV0clYDEEbg3skIwM3C+bHjTe/pfC1LQPqaq10Jiy7hPtW2pC1eoZQ/WI0Mbk3BeaAkxP2dglozf/B2MXCYcmNDJ1CWnpka4PtxXUPF4q0sAxI8ZqQT8UjdEUpYbE0x0bNH5SnigQoa5OJNzipca4l8eG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809568; c=relaxed/simple;
	bh=TNrAIXUuc4YXMvVsgFD4VJ92/fGFEn8rwLM/jlWfNKM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VHLO9V9i6ywgops/g4nQG3Qs/eZwo2kcDEvxl97MyMUyhcmpdfl9Assrq+ufUC2Lf+K9eKgYbVCS0q36T8vZmd2pMt1Jfa6ctfsWeTn9hW0kKqdXvEuVhzQ+Udlz0nq6tsb/dHkPDOP42FIeam1eGFc6qk/2i5H8utfBrXcaBTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcwMnYMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H225mOux; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcwMnYMA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H225mOux"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qVHV3044533
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ROn9+8ZkHxWuXe0MXT1wSr
	PfX1k81ekk5p5iywWFemY=; b=UcwMnYMAZFpVMwQrODs+xwJy6YDp5S4GiLsuC4
	V3kmVSGx9puwNHaMXkCsFk3eJ44n/IFEURr46BCLqhlSK1Ybxq9d1X1FIlnJQ4ir
	1mkttF2sYWjMtkx/jWbtB9PMlWPlPGYv6QIYpvd5+vcAOLMfhp2A/xnWSDK412QZ
	VUM+lFr4tWHfSSi8XeIIiLC5c0SXsuqJiFRFAV+l5isTO97454oOYhtyFrY5/Qqd
	INzL43M15bNojq6Bxf7zRONUznzPRgL0Sy5TbgEblkDpkbpQOElm+EW0pan9zS0C
	Lfo4s1oQhMrXI9NYAHtWu/puyejTza8ZPgzAMIal+soX5ZRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq935e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:26:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so12282361cf.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784809560; x=1785414360; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROn9+8ZkHxWuXe0MXT1wSrPfX1k81ekk5p5iywWFemY=;
        b=H225mOuxRdOC9YaRVSt24Z8EaEqyloK2SasV5tIdaAeSi/+X0V+EOrn2z4GdXaTiY4
         a+TZi8ZVGSchwVGwq0uAhAL0z0Rz6+WwZcJDikC97DCQMYahEMv0J8KfBP/qzBCOtn5h
         hO8NAgc+gVvqbCbZSJwFr9L3BebME1sROxCgs4Co/H5Wbe9+dv1+uXU6AKxbHbBDRZ+Q
         dTa4473BxOxWwTZqMJoyD+ijjmnVtdKxRqC3KVc4GBKA2qRYMCeTYHY0j/cRtD6ej1la
         anatkbFRfLt9+P7rMsA/QVMSJw5ufNysp+kYeoTe7EllUxFQXF4HJJNtD/i+wEJNBZUI
         NHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809560; x=1785414360;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ROn9+8ZkHxWuXe0MXT1wSrPfX1k81ekk5p5iywWFemY=;
        b=Pg3hwSvK4/Lcx+re8WhuZu6iGTBK6ctaddOVAGNw0shL8X9QI6SaqntFNgHRI74t+R
         GHn2zT6l9EHei+00ePpTvUuzHwOpfyqTm5h+gmnNAo1rYqN4qJqNRWJv7el9gpKVJyoH
         o3Gl3Lyk4LkW4FFwBqXG6lYvIfziyltCMlBD8jXMT6xggGWPejg46A6zedbrmlyePjHo
         TKY3v2oDDx5VW7roCjuFI2qnMiRlbCeDxaxqhUlxVtM3sbJCm1nyEbkgUn/G0MT4jRZI
         yid3iS0z+YWsC1r/UnqVqiq3UpvY2+XFDFsFqvaqllXlB3lE8mru4vlxpJwDM9IiLmzw
         5C/A==
X-Forwarded-Encrypted: i=1; AHgh+RoTOxNyHUXSrSxmNGyH98fn4l6+hwJP/x+M3jdf5U1bBmFY4tpfDxpN+KdKqr71D77svWk5ShftXpor@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ0jEVJaebvjUTLir0SGTGjVtXC8ZQ7Weo02QxXEs4rQMuN6tX
	0xDNg8BuRJb/xDofGmVm/FhV6OMQ3/L8KrrNud6O9b72w7B1DW1Qn9XCsa15cNvlagS5HqK7krA
	9efdB8AFMXHuM/U4oybFt0L/j4ijhUQyezUMBvQUR59/GjFJGbwMgI4YQdztWRixbEWdAEAvb
X-Gm-Gg: AR+sD12NPBK+sS+6VOj+z80mryQ3bBGmHsidtbM820K1HgROoW68tDAW5DeVh99Zqp7
	vlyKoxPOCYgyQDiZFcsqPILl/VF/5koHCrSodE6P5Z48Jls7hcrjOEnIkyKP/QnQGl/D2JEA8Eh
	zvnMEV55LxF3grw2K7nlRejQNRUh9JbYC5fTvMcQKXMQSqoHw2YGE5jvJWAcNyxaKfUzPGOMG0s
	TPgIcYFANwIfizeWHMAbKf5+k6mX3+S4DtBsWBG1nyM6LKtZeWpoC3m9yh6y78Jw9hH8URez2nr
	p0kmcwDQCx3QhRlJUhtQJjuHc/ULkxjwZ9B1NgBKSuF7vWPFcSn1jP+C2RMxFAsPMzTLUSVZyTg
	te55Rqz5o
X-Received: by 2002:a05:622a:1353:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-5283ded4093mr25973271cf.42.1784809560359;
        Thu, 23 Jul 2026 05:26:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-5283ded4093mr25972761cf.42.1784809559571;
        Thu, 23 Jul 2026 05:25:59 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm15236106f8f.35.2026.07.23.05.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:25:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Date: Thu, 23 Jul 2026 15:25:49 +0300
Message-Id: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE0IYmoC/4WNzQ6CMBAGX4X07JJ2EUFPvofxUNpFapC/BaIS3
 t2CFw8aL5tM8u3MJJg6RywOwSQ6Gh27uvIQbQJhCl1dCJz1LFDiTiZqC7ZnaE19AyrdU4O2Foz
 lBiSmaW6TvUkNCv/ddJS7+2o+nd/MQ3Yl0y+6ZVE47uvusaZHtez+V0YFEmKMKYkTjVEmjzVz2
 A669ONb6I9YYiN+6FD91qHXkaIYszyLjMIvunmeXzQEbt4mAQAA
X-Change-ID: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TNrAIXUuc4YXMvVsgFD4VJ92/fGFEn8rwLM/jlWfNKM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYghRySsmDr/RjBX4e9lAYsVYbFQeLFSXxmDGm
 tUcgkbXo9OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamIIUQAKCRAbX0TJAJUV
 VoY0D/0S5l6+ohb7sYLxZKLBEwKHchdUrsyQjtl8Pysggcw0IhSD/jCsDHsr0uhaMOSHtstfAw4
 Fb4uZfMOJRmLUEP41cDb3Uaw/K7o0NgKPGNs0oEy1zKrwNOdYa+dSRy7lLTNaJaLd87WQARUAPA
 Ehzhd6habwIhrq2BgX8c3LuE0ee6iCn3cER+7BY6efLq8mpJIKBhqU4zW6FOmtfqUqrdXTHMz+z
 VtXZCWctJKwoFOnjzzXEJgWBQMGbray7L4/o9LwCqNb3h/1OqJOXx0/lq129quotVa4H+1if6Th
 KBnmDSX3k9lD6wDOg9Sq0X8dHshE6nWEyRyxUZDcb8gJaB8afcnCUUSL0dXM10xHxSJTh8QZtbv
 3zCl+X5fSDupAnCivu6PVAb81jFPfzKO4V2ONvgupypB1ZSddsyrrktTYY3xw/7z9sJaaMg/ZGL
 1wIWPfTJBSRt0kVckxUg3GYidfgrqH9pkwotxOVkbdsZptmb7OseS8oUb6H+g12hVjgF2vUcqmc
 JNUfXoY+CYZF9u23WUZKxK2kQ2eiyu6cgpV9s/+c9gEPr9YuPvV5pAGNIDltGKAticB8aCuyUfx
 i3hh6JBDtu4zOuKjG7KKnOL9VbKIu/rPvOHNu+WQjXa6NA1znbs10A579EQrmfqJbokyJDygu87
 OvJgiCFWY3ZB+ow==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfX4EIinwMFB6NV
 BH5TIex86jcnf2QvArkgcmPEXxV+yKory8AIu4YKMU9H0Donx4TwI3IqYmEai+1yvjGnjZQ+JG7
 pdHeHCipws6J6OQblPMJUr6GoqZgWeg=
X-Proofpoint-ORIG-GUID: F8yv_uNo61bpOMf7mbGK7NS3v_bRkNNt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMiBTYWx0ZWRfX8pB+zM3LIDes
 fuhBqaRdDiV55T1sUpgLU82XzNI1e1eRuSEeclEz2L39dPDH2/meT7JY5pSWJOXn+IPaFUb8AQ1
 /nEvT8ebxLF7IsOQ4plgjruXDDNSdvZG0RUTGTBoCSN6b3XgKOD9diaBHyNbivvLlY+NJA+bHz6
 oxORrCKeMxEbiO+m4/yXQWjF0wBFF5YZxGknRBTvfeZboAn41KNW0FQ6u8VyGGs7j9GiXZ3/krA
 by1Ba9WQk0834ySeV9aVMd0P6Mn2c3LBWc79qqDmciU5mccqRJVSnioeVTE8wq9uurH7o+vVtgW
 TFTKSKo3YNzbh96bUmctp3+EZQhKwHICfNzDNiXXOXGpgp2IXFLqWsgFWODD+H6yXXFQfO3q1qZ
 /v4SzWSRfGPEUvp4NzGUqr3W79e+uJPjFhkuG+LOOYiUFdH2uHfVq/cj1swbdfK1aR9thoCTGh9
 xi5K7bnBmASUsjzYF8g==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a62085e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=l8yhyBgH5Rc5wHxOoCYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: F8yv_uNo61bpOMf7mbGK7NS3v_bRkNNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230122

Describe the CDSP node, the glink-edge and the related SMP2P, then enable
the CDSP on both the MTP and CQS SoM.

FastRPC node will be sent later on, along with the ADSP related one.

Driver support and bindings update are here:
https://lore.kernel.org/all/20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260722.
- Picked up Dmitry's R-b tags for MTP and CQS SoM patches.
- Reworded DTSI commit message to suggest that FastRPC will be
  sent separately, as suggested by Dmitry.
- Added the GLINK edge node.
- Link to v2: https://patch.msgid.link/20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260720
- Picked up Konrad's R-b tags.
- Link to v1: https://patch.msgid.link/20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc

 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi |  7 +++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts      |  7 +++
 arch/arm64/boot/dts/qcom/eliza.dtsi         | 75 +++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

