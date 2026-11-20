Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172916;
	b=xiz2peeb0W+skaLGeb2koeg+2J8GfOsKQfHaDLLAby1fqG2a4CWjdFGSF2BmTYSbptxV
	 VGSUn0EwwJSnQD99s+YxM7UFR5cHVh3U3ioKDGEKyo25w/C73y85hFkYfJGcIVwK9D8Ms
	 /lvpU589pi/9pAG6fsybWIwxJfwH2XZaBrxaT8Rm/Dm2UnEZkMoaELQA/2y631OilxQl/
	 K0mDTe+MH3Ufb4Qw5eJNNWQIjP3A8ujrcW4lsaDT0kJbp7SS9zpMzjzhRb7lp57AAE/QX
	 a/mo9xxFQA+VbhBTBntaNGIRFEZFfM0Q6V5ZyA+v9meIz+XubT+APr+kZzUbHmM/pNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
	b=aETKYJvAUg+2atS4nUDZkyN7XQ37fFLdhrkyrUxBvQ857UWC9TlSouhQHEOSGVyK1CLr
	 rmg5LqAyhHgmJrmSPN5hq7GD2FTCcZHfRZop1r4oBSmWve9czWW/m0KG37azuMy5S5Qv9
	 3QQyCDtcwiLd61n7/uRSHFTriyH5eWGBbNkvR+ozmw71tx/jynobVbr/iqyZCPTUg8pvD
	 CKYhlwWH0xHaIeLpA/FpJVXhn9/ITzzpqDGwmgYb8U1REFR7P/VyK8q1EHW9cYywFESP1
	 esGH35wbc5sVD/t7ZH3lHR9jhLiXbdQGO0gPBgokxyZprCtsGftDgQpAtzeQYZpY+6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jDRa1RoT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OitSvhKu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6952606A33A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6952606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jDRa1RoT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OitSvhKu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoJr1462889
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=jDRa1RoTaVw+kV4J
	iIijYa9u00DawX4XZajLV97ka6+MLEQEBiV/fMXc2mMzpYlSptndOwbjGglq1A89
	OMH1BMildAfBYUFQtDQ29psB8zoo7r3mp2inArRf57qeL7fml9Ua/E/HD2Avgs08
	X6PGKImROaZV31P1FdjyXf9YtRv7ojUQ9V3nkpwY7JSGOuml2T/ahjm3dA+GD7ko
	ElBYa1MES5HNqGrZDoR0o+1gUktwWeKqOStxJokhQOfb3b28tASG+uO2EHMV8D1D
	cZxmO35EZY+KHxbrowW1rHgHg4uqUeydrPP4aMDQ268wzHiqoePtZ76ovX+3rQ0l
	plqC8w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so1029764eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172915; x=1795777715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=OitSvhKuKn70JIdRlFAzZ+teyFZm8emVOIR5evo7vRSR2NLssQhc44fBg8Btz1ndGa
         Wj7ZYztttLHrDPicUR4xBy7QDB2YdVxcdee1nFjk78obwoWcEz4ANjM6j9VP2PX4UVfd
         Q5T6/mm7BzVe0kdfIIpbFmQRuELu7/8/HtaDBFsg0f0W2d/vd705ZOYXnACymkL7pkKL
         kRMQgVJ+B4CU2iIa86YM9sN/jPkQMv7RXp3T6wFyTD1oZpA/idYV7H3Wb9qCDhnSSbUC
         19bgdtEkD8A+QyoHVF7b8BMgB7/5WfRRPYou1wtd85cH2gEuwPOPoLB63tYJUCzv3j+f
         y8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172915; x=1795777715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=vVSRAKbl9tB2ShAw1AkMKO4P13FouFRhSFTQUVFlIkFOqu1Dg7yyanHo7rrgYBL6Dk
         pEh0TQxst5iz5hMaXSMlL9INNwlAtBHBGzn9/+6qRtTtkhCGab7pYfTc2LyFc/M5PPD+
         Xdx7v2aJWeJpGRFZtGHdElgkkuNbPneReaxx1f5PJS8HEV+kDuZLahESpPT+Eo0wUsBL
         3WG5/qmbcL998U56cyUsMPJ3uvn82o8BHgU/4T3DBwkjQBZtLD2cV4NX2qiTaOOUEAoQ
         u8CpYAUDnFxcBvfDEu7IObKCz2boXVP1f4W6RTH2z9IgqZkgl7kdTuxcbW+cTvK86vqo
         WRSA==
X-Forwarded-Encrypted: i=1; AL+hErGqUqA0GOWrQQPFNzh2SpU67AVX968My3cmMxph1zLtwIquivqin295qBM2KTO5tN3e9osCFF9DuBqn@vger.kernel.org
X-Gm-Message-State: APuU4Z8UWarCvs0POml6MAsrEc4ZM2zsff+MF5S5xcdDYX9jJkfw4BnP
	nYbaGbXRGjG38HhYKXHubBmJcxlqB68YPs1MwUUINLEesG97pZZPwKRqgk3czIbsU5oP7PBXZN0
	17CImJPFhn8JiUEUVVlZ0HmZHOzUcuN1+r8rCgEaWvsJA+o0X8LwFh/b3H3IdUlnS
X-Gm-Gg: AZFdTZeVFQvmvxzKmbeTQ9vVij0qE8AkCyrdr23nFqVrsQIs3sm+9P3Mal01deMMRck
	yM5TtHKiQ73LeboffuZ+RihN6dE1Py/RJcMhIDTiJA4HL2OKxiT8WxTGn9UQbO+avMNdEFmU9EO
	THTeb2K5Sri5clw6qOC99cQvaon+MT4q6BzvvX7FGXkCvxpnUkFyJsEKnwRaHHXNzOnKx/LFJpx
	BXkODp7x/TfDKwk4ig5yitJGarBP7RMulGcfCktIkn9Hmauj+4LLiubY3W/7BKFJMdH6Vr1Yvi6
	hqIlKVRkCFhouUucmtKD9q/VZnDBozA1nzudhngQJ1ac8PKTGVV2/e75rFpAtg94nlUSi+FG3an
	J1aQxGoOMI3rL5/bteA5eI/xSN8ygCih35HIrVYYnkMl7fjlA5YBZn95MxejfBkC598j4xA0iKj
	zd/lri
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr1056750eec.22.1795172914334;
        Fri, 20 Nov 2026 03:08:34 -0800 (PST)
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr1056700eec.22.1795172913510;
        Fri, 20 Nov 2026 03:08:33 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:33 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:36:01 +0530
Subject: [PATCH v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-20-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1058;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jWnycFT0az2p/u5EzI2kuq2uyYSvSmt1HyCePSsKymg=;
 b=thxi+hGWX+1dy5BZtvJRpmYMDr9qfMtvkKDe2syJpJn9Hx1JY85585k9BWL5+9rHULVGt5OVu
 82NLnnek2Z5BqczmG6nsufHpIxgrHR4f3gkqXhQm+/IQ6mf3ViKyScb
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxEt85bZQpMqB
 WMzEOZlbyX2ml5a/2vD3H9GJsH1VwB/XIZrkbNDXGjB9Z6HlHyeFLNVAbPGw+gUGpCMhX78b9Ow
 tGBQEzYlZuogh0v2gg3PO5s28pW35tppq1Ft3S8DahfUlBE77VwQoMKT5+n+SSx6IGFJSlTubQv
 PpHXdD1kuMDfv0sG/gSZDxa+Mx9SKLoQ3fN1gnhEdPASMynldQ0cwkcQ3hAi+Hw0R28VhjIbCHJ
 J7R/ekvovSoiEp4lGwBZfS0hGLIETEuYRPoLUUd2nmybvWiwem13/EkfxJSl8znasL/gq04UjbI
 F4Z2uX6GpBCwmWodcMsg52GMAvorbAF5HzgbfuMgr1UWEjhzTzYgiNhhDBhSzdpdF1SmjRzIPCQ
 QCuF6k2FkEDM90xT32t1OmAjzepix0C42svaXswtWUEunkm0npW6oBAcLk6NDU2jzip1J/LE9Vg
 svfbOHju/fRlfeaGc5A==
X-Proofpoint-ORIG-GUID: oMJH5qnKHd25D-NcwAlACXZ-nFNreI5h
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002a33 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BzZyaU2VGnUrTJno3XcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: oMJH5qnKHd25D-NcwAlACXZ-nFNreI5h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX6VeCihMokovJ
 uhkBTAfGElLGvUAnMWs7rFCFT4oXZb6sogIW9y637VveAvU7AxteK2RBNYuXAF4+ZB1jKK+0VE3
 uNo50WLV+ZGGH0sXXyNEaPe0g+T7WM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index cc4077005e66..950fb83f26db 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1857,6 +1857,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1

