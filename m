Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182196;
	b=0Hkoyro3sbN54TNOsXSskIoccF+vfom+noeS3BfQD/6LUpOJBsxaaJqPs1MXrsFHUqhq
	 4wofEhGQTz+vRRcsACttfWRfdtwEN1RyAraEROXqrmPdyx79B0PsLkMiSTT4ubQhE8rp3
	 o277MC2FJprwEZtnAVTxZ94jxfbEM2kngTPf3yeQIxH7nucW0Sv9NfAGTkuN0ox1+L/QV
	 f92sBU9ekuwSKu/goTsux+8PP3bFqpVLKsXTeAueqAuPCTEbiVyDLqB3l9YbL2Qk5whoG
	 Ib5xmKsqTpOOb9LYSXgl7DJrVk2wKBqaqWFrk7CcR1gXu999o6A/2dgBPAWq1mkPqHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
	b=M/NUVjr/Kk3Enh+rq2PeP27zHb1Dj1chLsXbYhXG1Za5gsM5H+aypXs5OwiuIsmz2TjY
	 PJ2ajvw/0NK2QyFoYwPcRGafz06RLrrAe7401FuCbpkrMr0UwMB4rL1fiIMUWZglcs4KH
	 GQoHIMH+qQRGD/rLW2CL3SBo/7Y8YmVujaX8PmA07ajoAkFxui1ax0H/oO+jgWVAJKeu6
	 kxUZj1HYz3dcHJP5a5FyosSBR/QMwN9+yW/HXCJFjVvoo/UHC1xhrCz3TGDtA+KaIgJyH
	 aEpHWpP+M4vPuvKFFE/A+VwrWA9SAUM0RSpZcULXgOqhlSMmF7RCd/dObaETPUv0NhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFsZ1PCY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8I4cOHo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0147606A337
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0147606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFsZ1PCY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8I4cOHo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk2Ok2433184
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=; b=WFsZ1PCYPHZwYXdX
	pxhYoFglf6/G/D2b3NNcvvzBLrRh5QxvC+BCLZMg9Vszi/5Eb7q7PEk58DZInPbC
	eyRUuDkYdMArQ38nEVLVcFLKZyItTbGKBvi5MuKF8gOn/OIYJAHGc4JiiRWkFHRS
	aM4gXpMCvmq/eny/ITWktSa/6eHTHwyzc6aAlps5g92HO8uLEzBXMcjdZJoXp+5K
	L6ngePj8ny/IdmwoenVRlrudlL2Pheq5IWqXBAWBChdmHg7E5TEhp1FX7fpFSZF6
	VbDiW8KGqt4PCeOoHRKCFFZdoLHWzMiRO51HZ5tQInjTu6x4wreHqZaUiHPwf8lD
	v9i7zQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjja1ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so855433eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182194; x=1795786994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=E8I4cOHo+ohh5Mpg+B5MIPhQBXCTjpcyiTgMjkxxh/mc8lOTbR5NFrMIcInFCISONa
         uGuz501lE0bd3qIJLs1JZXIUBqr6dAD1EaXtkcMujwjZ8CBw/7U3byHcZ6iCoMF0j9Rc
         SR7D3ufVmXJz7pOrji0HSWMlhxYP9AiVLAsV0XV9AwcEg444d+wcuRkvdTJ4dprN4i4T
         3W2amCOW/zWSApZyPGGtG83hwW1Wy2Wxmt7X8WKuyFJlS75v7lEqZiW0lchy2+WtFpyV
         S0zvVbgbLlVaj3ozTCT+SjlF4P2gCEioSKcGaVZ5CM3Ivkwd1EbgvuhH+0CnIr9gTuE8
         9+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182194; x=1795786994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=DrLmLEQgX5tEfNoNqiOOnYCbewpUyUpDDFGn3M7uF59qCZNqrjSEToxveT5RQnlP9Z
         PAAAWZJYUZLRATj2Lf4ZTBpORqG10PoixLYZ+22bUNVouMSsRf7Z9v4lMNmbatpk/GhE
         edXX4xGT/I68wVUsyuZjeQRoiBoBHPn+9o3e73/6GzVcObzXl1B35B5JppOvPcKorYE9
         c+IPhDuHnJSPEHxPxLt49hd7KWbTv1KexgcphgzzEEqgx6ErEJyUxNWtg1MGMkHZQt6r
         wRdsyeiW3HROaByaJ0hzx2J6KMY3yd0gsvQQkAkXsWphGiJ/RHZ8rbNGuNDynrJmOwWO
         PCDg==
X-Forwarded-Encrypted: i=1; AL+hErF0t5CmLrCfnkEJoYXFeup4GFUxy/l9Dep2IfAQudnVjzlIUcL+3fO0MUNTrmf71aVdq8cquDrKYjsE@vger.kernel.org
X-Gm-Message-State: APuU4Z+FAkOoK80ry3pylPEqi4ALsAA30hDYj0AHxph6wDyTi3ILECEf
	PN+I9g+aWhHVroeZxQqKAU36bWUkwtkBzEMUl23H8RhxLcXhkDwGUC4Ut1XhPO6C6L/v2yE9/Ub
	KQ9n1YB4WpzVvRXByQO5C3Xg6JaPqiVmC31YUrtVzKyc17Ok1DtSH+2l/vQqqI1Yq
X-Gm-Gg: AYBFou2OwSiEU+OkeiNPvzV8u/u9eBpO9aCkT+hK98YCtR9mLuSVRQ3ssjbHBjcdTpp
	4KGH7zaC+dIMTstQIESupk8ihMqmINMsZ9qzrmrgZ/eKjx6rZ6DqS6QyiuuQYo75S+DKmgvkv+1
	jzdNlEYgISEpp7c9JiqIPbQhcF3G2BcQGvsWfU7x9j+k2gGDTXgCxNQOQnB/b7fHk5vHrS0hFnN
	ClbCZWbc93gNT6Kp8z8NArV3ZuXRvhs76UsGa558UvcbaPUCno1EXSsJxpR++vZUSuF5AanH6w9
	iE4ZiW5De8jgOkKUdYaI7GxXItbzY/+ldWvRMsZCQvijwiW5mA2EaTUERf7LGBRppwEc7Rk71g5
	tOW7barRsG/2yqBxyWjsHU9guwME5zhjsS90Yz0oa7ArnECzK8BtSgL0g2jwAmcC2vZdMJ4iK3Q
	+Z33o=
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2865615eec.5.1795182194229;
        Fri, 20 Nov 2026 05:43:14 -0800 (PST)
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2865573eec.5.1795182193563;
        Fri, 20 Nov 2026 05:43:13 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:13 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:40 +0530
Subject: [PATCH RESEND v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1040;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ifRBUNcG4S75b7wOEESAYY95LUktSUoyNzDBhGxm1EA=;
 b=Q8yu6sFl8SVM8dspFiUmMN5ffOmdMre6HaKrkUdqERV8yylmH+IBEB/LBKQmZQ2KgivVAqmFt
 gDOq6Ul9ShaBwk+4cp4/63XlFWnZijGOl+HjjqAQOCN+ti5Cre8mnYq
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b004e73 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tc1TWAvYerzeY2VvnAsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX+3AFRItbmlWN
 Td+cag/SQhH3ROsyWzLqhapkMcnhvfPV3V3tjvr68Dncbx5JEfH543/Be4hClQ71QjjT/UkY6ux
 um39QO/fDtHzZlEbMVookKuoMX7+jcA=
X-Proofpoint-ORIG-GUID: U2vdRFsAjU5aQAzyASosn90o2XrUITJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXwm/dHldslAqX
 m1tCmkxVjW7w6CN+nu/I9zqGmcTocJrD36kmnFGH1smJne9REoGVLSpRhCmSooL7mp2C3FZ3roS
 9B1EzPeEWsGeYue9NCwFW4pHztq87iZ9yysN+kYqkbrDmxW+lU1e1ZJtRTBri7nwDOmzjeHEzBw
 mHj8JN9gOdVKiTG+7NeHibQtJvMnO4dJrCc2vLA5bI77Vy6sDDYi23vSlZeKsx23MUWiPb8WAQJ
 eHyLuKUY9mNwxAKty6Sw120OL1QDCKoiJi82WibIhp7Ox7bTaxa6IDMilH+5L3gYS2BJI4/dEQH
 f80Yuaj1hRTzTG1oQDJKyhlBfiAhS/gVHHAFNQNivNS1yfdXUrz/SNFO92JWl32QVeJxdBJMR8r
 2LRBQ3VCKaPNTPySOEexqJ5Z2tCMA5XdNx//g4aWPWN0TvfB6BgVXSAmdHpKNtH4ycelZOLT2pQ
 Dc4WyVfYXprPPNKu+Jg==
X-Proofpoint-GUID: U2vdRFsAjU5aQAzyASosn90o2XrUITJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 7b9966e8fd4d..4edcb06dbae8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2566,6 +2566,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {

-- 
2.34.1

