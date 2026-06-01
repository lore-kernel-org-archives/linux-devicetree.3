Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35400399377
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307235; cv=none; b=ghYjTDNb8vStwnWjqFlSfzTj3WRvbOrvI5k6bZX6iDO2f6jIHFEu+5ZuWSt5xskGutlLpvtQKNIIiO+5h/VX0aBMKyxNJluGxWpLYvI0SMYOwKkM5qJgegcrjEBA6aW7VnTo95vK8pdJjmc/W/28+K0BW1fWmX31N1UFmtgt8kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307235; c=relaxed/simple;
	bh=QjvgCxT4cjyfExqVSl23BqemGzEEeOq4tGjsEdwhVAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZ8OtfyAI/+o0XEpehBJl6PwtiF1GP5FGaAMK12BD/RGONxhvCrmfhwVi9D3F5s5Gqoo2DM/ZdhaigbgitgdciCLaO6VKdL6MBNDS4x/k8xzK1DftdVQ7vYppepNDTI1+8fzYwILTnrKwiQ7eAcKoEX7tmgl3uTluaG2RpjYP94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkqXE7X/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xa9PDqir; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkqXE7X/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xa9PDqir"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fNQo145069
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 09:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iAynyGPj/m6HlAQLnycghU+jkG7FRJqT7laanFnpBMc=; b=QkqXE7X/qkvx0ziN
	ZALrVq4dwcXffYJ+sMpIvKYY9Nv7bZqBzuA9+RdGdBlaM/yKprK+rmLiAUBPAV0I
	Bz8vxf8EYMmTT/Vz4RCtMo8ZNWmalfy52aN07DqUw3FDgjy3pqLEEUmcPzemeOqk
	tNP6viGbB6yro6tlx02KMgzCkgcohEVIzC8jkd/TKN/wQnrBhWweMX9OzLpZxMi7
	EsQR16u4DxHCyDsObMgi8+DULFdaY797NileZiifPDByLSkeitOLgTcgq/3Kp7EN
	YQG6ivI/AlDKzoVTOFma0oZGZhAplOJ6LgDlu+B2akIROsTODgB8zjSkMGCmWd6R
	emW/4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6str8c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:47:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a0e93eeso36854271cf.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307223; x=1780912023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAynyGPj/m6HlAQLnycghU+jkG7FRJqT7laanFnpBMc=;
        b=Xa9PDqirXFpL0UVJASlvEmEmiZw/T6O6Bg6tSIgFonEaq/acMfw/bAFkEeSzR85Hx7
         VrpVlHeh7tyqU92BDn/ziTXz0tAP2ghXLrxw6UpMYNIRYveLmAxSi1gLqc2dVFHvrMP/
         wLEFYHiQY217i8esn+YcYLk10w90wEpV14HW+GodhwRtS0m2Z1UgbIMU0VuynS0/hb4V
         Oo3075xBfxY4FeqnT7zvkXISs//7iudAelbTqonDRf1UkGkTMsAYxFRIxMMFpqTsmdfo
         y8zIWLP+9bwBe1oKCslVmDu17XBg7xBPcF8OzcdGC7GJpK3gBGWjrqeZ4mIPw+kuF7aw
         UB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307223; x=1780912023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAynyGPj/m6HlAQLnycghU+jkG7FRJqT7laanFnpBMc=;
        b=GpZfjCWNsgt8B30xgLNPtcs6KUnUOFBCra/343TjJ9f8DldypQOIAmkEs5oxD7iLPE
         Mx6swJZGGWMp78cAr/+xXvq8jKrpRGjqljOORCpG5yiBWNW9c3sswwB8ubJH8ugWKGV/
         jU7GRIKR4mXIgeP+bc2Cz4VvFat13LVEhRn64rpTUJFshJdBgl2FnG+b/VB/UEzjIua9
         onLWT7Q4oFADY6si+V7qkEKcIxS3lB6fvikgfjCHuj/GMAxzlyEab4ZXceJWGyxagZ0c
         b08afTUJn7MC02ncxgywW04uBddE8JaZLqGo3GvVqKNOlp5ofcMZfAvp4UvgfytyOJFH
         HqDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Gx9nzvU88Dk4vukZ0WkDbIf00IczqIT2lwVXETr1v0G4lr7XBfsPeCZVUQ1I0f0I8Ehdb02jPtvue@vger.kernel.org
X-Gm-Message-State: AOJu0YyD7sZlIrIY2n2Cqkw6vlHPwc7V7z8UlbaWoWw05FKw9OQ1fErq
	RkSORCBPO1m0S6k+G4aI9jgI54pc037DSa+aX8DD3mSHOuaneND+iBpM0xwbSNzlyQJCqsHc97G
	ScBfoSlpU+tiDdZFgPW1h3bTeVt8SHs5edGKK88rTThbzcfHv5DHDTyuuzNApMPzl
X-Gm-Gg: Acq92OGa0K3UDRfXAogOqSAhItxfbHkMHGh8HNVWInh+G+Z9Sybvm4JKPTBUxV+Utrf
	LkjEcQt5VAuALXkhOWiQbB5fM7v2p3e76teoxtkr0UIIJl0MJth4iPovVrC3EFeDIHo43zLKWkV
	b/uzelYNdnU8qwr276nwTXBA0QVJl/zioDkKG8r6Y58vhR/oLEnpIXqGthAgZLPlvhw2Z6e/eI8
	A5//AIEW63pee+rJghzV/wltYD9pN375S0wq0ZMAralZ5BLwH5blY1XjQcB79ZmVqdHS23YwY60
	SBbyVGxrRGtteBqwmb5BkzIrpLziROYea1NZP/8e69ITEQ6tDcGRIL72pQm4mPyEFrO3MJOobrg
	4PknAdae4+CTsYAFUTxC1RV7q1YnGUGMjUs0Z1YG2qptir1yILZbNMdRe8zpKLa74PR1Q/FP7/k
	uLMWiqDrjWkfegQF1Jsu+p7p/aGBYbRUPIJ47pEcj7b/Onkg==
X-Received: by 2002:a05:622a:2289:b0:516:e833:64f2 with SMTP id d75a77b69052e-5173a61b308mr155830451cf.12.1780307223346;
        Mon, 01 Jun 2026 02:47:03 -0700 (PDT)
X-Received: by 2002:a05:622a:2289:b0:516:e833:64f2 with SMTP id d75a77b69052e-5173a61b308mr155830221cf.12.1780307222934;
        Mon, 01 Jun 2026 02:47:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:47:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:53 +0300
Subject: [PATCH 5/7] arm64: dts: qcom: sm8350: expand UART18 to 4 pins
 config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-5-242917d88031@oss.qualcomm.com>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QjvgCxT4cjyfExqVSl23BqemGzEEeOq4tGjsEdwhVAA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVULL9vA98gnb1vk5P6BUKdenYE36uwUMwczc
 eklc7UGkxeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCwAKCRCLPIo+Aiko
 1TcCB/9Ju6oFg8fhJQdx/b+0NIq/nalsJ7rHRSaj0cfCy6j/WB4c7RAbf/wVgPTuKG9aqavA9he
 9Nbn6yvgwTHTPX1HC1rY46piFDOkAlpOnmMj6vV+vSkCbzEDFaQpDXnUwouZ7MadIGG0ST/sXAW
 /sMDmu1f2KiaeB5VoyLAhuJZ/iNtUmEQPCDwzQskxbLE2UB/crRkEUVEa0sml95PLW2IULVYOOU
 bbrFoaVy7Y5JAFPN7FWkVZ2m5oWPVrZqPe/nMM4P85MGVfoIuq5RbXZdXLYGf+o1iJBWZVtFnaD
 ioQ09vSKsf7vxhefn0Ual5WTrmsIHgB0S5G7Lw0P/Gfdrtp3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX0Omv2aWVRAYT
 xUFuQMFnY7rLLzeGgCAUbfuedqvcjRXJfSyF4MSsCitpHNK9SyfoxertURHuobwdSeA6hM1M9/d
 l54qDVfFvZadcdo0aoOhRUOLncl3TySQnTUvitx5OgRJ7EetXNMmBrh0CljhYPR+pvwJewz2cwp
 Iwqc9GsWehTTi4DZwR4VLiUYEsMbZacfVZw0jeS9saobhHypQRbWpSO6UO0N8OGNTbNJoUIg0WZ
 ueftBnQR8K9ZwE1e6STsfVpEcxt6+FMO/gnEMAXAyPqgFQ1q/38Qlg8+oum/gevqUtg1m+uZmEo
 48NP5M7KSq9qZUuZkDgXDssB95sugWx51wncIJoKGa6/xzygULTI8nbuxOrIV9SXti8YcJyoMRd
 ItzsYO9AaKndL4altZ1vfl2mUQSXuQeNSTWb7Iow7ZdL7yLpOUiFu02aJhnub/1rK09zb19yTIq
 NA6aVgZQoWuLVWpGH1Q==
X-Proofpoint-ORIG-GUID: 4pJnS0I4VUkfMd9FTFWtfI78DYkhErDT
X-Authority-Analysis: v=2.4 cv=HrNG3UTS c=1 sm=1 tr=0 ts=6a1d5518 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=GNmHCbt0ONPBLg8daWUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4pJnS0I4VUkfMd9FTFWtfI78DYkhErDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010098

On SM8350 platforms the primary use of UART18 is a 4-pin UART (targeting
Bluetooth or other similar applications). Add all 4 pins to the default
pinctrl entry for the UART.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..eb2a795d8edb 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3309,7 +3309,7 @@ qup_uart6_default: qup-uart6-default-state {
 			};
 
 			qup_uart18_default: qup-uart18-default-state {
-				pins = "gpio68", "gpio69";
+				pins = "gpio68", "gpio69", "gpio70", "gpio71";
 				function = "qup18";
 				drive-strength = <2>;
 				bias-disable;

-- 
2.47.3

