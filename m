Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED23E5595
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553482; cv=none; b=e7ebsguNP+dcOa+2HUSxegaiLD5zgnwnw07NGjHq6SQzsI1pswvGewCl19TPKf+1xxMy5hNaXSt3uOXBeW5eBhh2Zu9ezM3iqErjgWVYIfns9xN1yfiJVQsMqB/1P5Ns7SMK2//Lso5a7LBPrAEpGnx3rF3h7fZbNLwVolHurK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553482; c=relaxed/simple;
	bh=WfaCQ+41KJWCn9Zcqsgk7xOgN9BIyqgBEVzZ+B4Ek+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GyQljnRJmMeFj1X/ipswKDBkIJtH0BivqU1lF8P9NH0p+PZu3Irms5zZZg/FFHny/yY7tWvCcow1xRPELgZTcxGghlbRHqsqPVBx74QzjnvW9LG5zry7Pmt9y654qVpmfKgpJwL8ExA4HMqqaODoV6scdwEhwrSkSPQBnQ2BF/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1sp2utC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/yVIUZe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1sp2utC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/yVIUZe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RKHI866802
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHRCs5PMg7VixneuGCvyGoyiqOCJ63TfKuQmXV3MgOo=; b=T1sp2utCVlNYSWEL
	S3dtXpPC1yV4IX0CwuLxZNKMjvisf+8ue3KpZBp9ZkxBnY5zwPym8nbbR7QS+RWB
	DnmrBBG8n9fEasvTpq3H+TOEoUC6LskVWpy1ndCwKbPHdclji2Yoe1adFd/izcCA
	8WkPADfOx3kPwlh8wpXJWDyJbcIl5M9Gp4ElqKYHHK2PPjEosFmDmydvxr2/OawI
	rmbz6lz1ls/6Gd5hZDZGwmAr0K7Ed3R7lrlbGBxe+LpcfiMqsafDHKmxKwPQNtMi
	Jaj5GyLyEk90DSFtwu46oCPxM3QmjP6waA3i88J19U5U4g+oXnjU1V/I4b6GtGU7
	HM7ncQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwnda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:37:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so6094998a91.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553479; x=1788158279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHRCs5PMg7VixneuGCvyGoyiqOCJ63TfKuQmXV3MgOo=;
        b=j/yVIUZeaih0CJG1b9Z27NUfAETrW0Qd2Z9BnGvdSw7xmXbpnDnSPoC+t2ma0tw7T1
         0Z8oKmuwEG8eSA15kaYF7rVpy2bQvs/m7iFCGBXXK4VXq/rtNWBJgFN8DiQtNp7/Rms2
         h1sHBYVwSW36HItDLnrXLrBimBA8vW3i0Ky+CpRRKaCi/MsJgRu4ha2rS28J/Emvkoiy
         XFYPhm1bp1Eaf4JjrpLAeZzze6yrOpZFGb3uKJ0uPkoUDjA3c/vDB+bA2LsBCbs7mx2Z
         7hTd78FrJSTFJs8vCUS5lITIkKG9IhMJbIf+OqwzVrrKTkMS7kO8KP0Ej4SxuznhJvzn
         m5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553479; x=1788158279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHRCs5PMg7VixneuGCvyGoyiqOCJ63TfKuQmXV3MgOo=;
        b=nnsYQ/PaAQh3oYhzA+Z1ddVPmPXD3DSVlwQcbi6LGn+rTmTDTvxAMdh28ac9soVhHT
         Kelf8DFHB1rzLUALKFo02/LUg86zqzAJuBIL6nyVJtklUr5uwT/JoHkKtuZi+lS674rZ
         ASIeurnlk1UhpfvaG8HtfzXF9dnPgAMmtbPmVIhd+4KG/x8SYaCG8M3AXe8vQEvIzpm0
         CkkSywJWDghlFAKP4cVSsVVH3BdIFFi/aynyPIcME3fW5aHrlSEzlzVIeiel0ln+6JKX
         FFvVMezFs5FhmRQoUIKJENbt5kJ/74f4Tc8e2rOzDdcgMBTjxSIE6N8+VQR2IXBvQQlf
         ujHA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5uua6UtPSyB1NN7bnkyF6VDp7qe+alXzinQDhdJBYwYn7NN2264zDccNTKSWBvusZU4LGXr0beGk2@vger.kernel.org
X-Gm-Message-State: AFuF++lrlSOlmSAbcuKUqvGPIA/UzOtCNjvhUiTSoPpQ9a+Pp0Shkms4
	H8X1THWCEs+/6Ys9yi3JgTpkv0vBXGwo3m4c+ScwmZUG1qjDpwp6o5pyF3vgJztoyWBWaaaC2vg
	bR6mz4/fld4eFFl7jtFr5qCsm32hxj94QMgYN2hQWZ5nc8MYUotoeMb/OjNnMNrAYVhkSz33p
X-Gm-Gg: AR+sD1094fWmk5kdnd0c8DWtd0vXDsVQQ6VCAiXT6aBBRpfgcN49Z9v76n0O6Cwj7vF
	zgMc75NA7I+eOrmw2dyIddsgFSri8F2EO0SejQH9rsHSTSyAvH+FjGZxN23N5pJZASeDUzQI3Sq
	XTe86xEIiTM93CmwkbGMhrOdrQuIiZ1cCqojL7xVxTInEaRdrUrlLKmR91QGuZuKUD1G4GT7hsx
	niv/wmFhwcDwDLYu22xaWSxW6wdCKJoM1N4jzfrvowfMQngOqFYSi82k9LR9gKE8msQ0AsebFFU
	tqKoQvLI48jyRk1PBA5om7Awywd0GBby8mtJ4Ls/Ej7mOieYQphdVEcsyEUH3RLIh7EZsDhCGRr
	2A6+fL3xrhciK8SCAe/fWMdxUllFEtLxqmfEy/TB3C42ElwtFqPwh+FIjzEmbnIJwXbHJymeskT
	F4YxGaFF62fDgv9fMgOhXhObfRTE6MbQ==
X-Received: by 2002:a17:90a:d605:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-395df5e8fefmr30332334a91.16.1787553478652;
        Sun, 23 Aug 2026 23:37:58 -0700 (PDT)
X-Received: by 2002:a17:90a:d605:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-395df5e8fefmr30331676a91.16.1787553474536;
        Sun, 23 Aug 2026 23:37:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm21667830c88.10.2026.08.23.23.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:37:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:07:41 +0530
Subject: [PATCH 1/5] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-phy-v1-1-257d68a3210b@oss.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
In-Reply-To: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: StOKHF0KCwn0fpNyA1BBbV5YOWkfs3OP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXyB19GzlXgdcP
 eYm6xFsKYju10RDVH03G5TD84ILj1gCUJYDHV0fw2PhY73NB4TgX9UJrN1Q1Wks+ZoP3t/gxHZy
 Mht/Xxq4OZTEg/faIve15RlfR+bmMQDXLcSjjHNWxAA7yxxFhOAU7eL1jQuqq5Pqzmop6teia+b
 Pq7N7gIJFt4bLm5RPBI3sqRbufhUFdUzNyu+p2UYUDMyrzl8OodVtBOOL4YhcZlyOJtRbsPxWEV
 uBWgmQ1shY0n/M3GfLYm7U/vB1KgchpEPcH5kagB4W6t1Zi6o9aBwI9YAj+5r4nnk7NuWnFsRNV
 K5JuEBe5IsOlliHUZwCq64ObaH59Pv9Y1LiB5yRqcQwsbLFfmGQ3HRjsXCaysnLglFWVagf4Nvo
 GjruT0+ZRMSw0/Ymu0xsx1JAFlZptB4CeVsoU3Z5Jl1RA9V1bdPGXj1kbz6bJYrKlOGrG1iNoSf
 cVInnZ4aqXlvw5abzTA==
X-Proofpoint-GUID: StOKHF0KCwn0fpNyA1BBbV5YOWkfs3OP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXxeEPTBEb4M0B
 UyCfppAsZZTqn+4UKs+chgBknGok+SQxoHGULKsWXj9RLCsGaXRrBrkdQ9pUs3TDAibRfk+tUuB
 IWjcCXb/dxnnE7KVjkU03hm0F/w13Wg=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8be6c7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1

