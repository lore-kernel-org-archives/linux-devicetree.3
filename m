Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720525;
	b=RNkrFuwM61rcucPJ7KsUtcSf8w5JwEcBmJ4H2c0SiZ+ofP9RdaQKUU/1n3WoTibKkv+r
	 7bfyvx14oMYw3FYaiyyK9qBgiqjrCBF6o4KfYZd4V2P4IOS0rP1VbO9QMeke6en4f00AX
	 LmFJ287i5upfB9lRGbJgsWIdZML0hl7Jy47o9gGa7k9VJbFCY5L8H0Lk/L93G5VwilKtk
	 rjjbknANbFJ/+8l22AULo4cLZ8fyPyEbuR1l+jlgeQPgtrsYdPV8cc7n2kSyAPBVnh8K2
	 Ox/pZcCrF3TpnOO8XcfAMdjZZCmkSU8vbReM7FA4KS853ka6aFOEHHU/dBwNIqkM3sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
	b=snt/dSPHGuLDKDK/WqW0tE556R24gGe8cr1B9fA73lCbxvpNZd43akkXLtE/Q6+WQtJn
	 EtX6DwSd04A65+w0UDgoNwzh+UfWT9IPABIClu43ky6Beb7MJIp/aIJq134aPgCCUEcEn
	 7Q9FdxtU6TWjdNL4T6ZEPoh8Eamz33WfQtiyah5cvIRv3hgWGh71072SflX23MMxZFI9u
	 cKfKraJBVDBpLaDDiRtV4Tm56Zg6ty32orofHpLMxj9eM21AFezbmVVTNCxz/SG6J43mr
	 cA7+tnZkYmOz9bHG3G+tBdoOg1dt0Q3EhLV+DEmEPgTPoVJSrqEw6/mv/CuWRY9pZTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYWtzdo5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j7JwNDxX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2070A6082BFA
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2070A6082BFA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYWtzdo5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j7JwNDxX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9x6t2727731
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 15:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=; b=TYWtzdo5m+Wkafbd
	r7iRuI11kwmGXIeLRy0fD/CRCOkdOVI7KXngxO1AufAbA/yR+zURtnu8KW+bjNoY
	iblGYKm2zIlYWuochRQ0COJO7Yg14pJOgUu/9Y8GkwCGhnYMZj/N6oeeAIT9M3ki
	dLIgqZyL/mp0wNmvqd7z9bed/02qj0/7RXSWNnN7hdQT9sEGF3jD+QwKWSqAoDJ2
	WiEMmIQrWzp/LHrPoCKgs2Yu0KP5J99ULsPvPjDKDhr1PpLnXtXqn8h0YAD1IRhH
	bDQllzgTaPbxv5sdqTKHKPun7gOlokyVtg4FagsaL/9bo2WCYqyFd0SGsAO5fnL9
	51POXg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bgdgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 15:42:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so9371259eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720523; x=1794325323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
        b=j7JwNDxXNF+NQK7scVnvtXde63D/5vGblM5TQMjgp9EpLEIJtcGFXK+9xROQE6A638
         4gF/ubXHQNF02K6z4jS3EBgMiOYHFlNf+1T6uSp1tKNeZI7gGQnQHvE4mNrMGJBCmlt4
         ld/snuYlbQsZXzRDOKl6Nd/8NjNMOKL36kHf/PSavLR3P9s9XMaKDf3+S4oPoH+Eq95h
         T5eMDq6W47gVgaqoNPq7ntK7v7xBikxbDvrt0oDV2MQQFHHnh5LAdrhWNJLLV6BNL1Sb
         MznKZRW5Bm8Kn0TUVkioeXeZt6s3pGSlX6g93Z842aC0H62c0Y/5ZiZCFO0oWyut1KU0
         g1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720523; x=1794325323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
        b=pu9x3cY6O0whbBdzhFSa5236yXTatPNaGOysi9AP1u0gUaimQFmhNFcTL4pjzwsv58
         1lag8A3GYCGNX83/tJWKQfDyMayZuoStPPatmuTsTgSZsJL0n9iXc0ysdB1zKChZWwbG
         cSNO7OVUCiWxI1i/VYVJlFRdyJP3sHLy0dHBeT2c+ZKsoeY5F8/TKHu2FlfvEhcMkfp8
         yiJ9uq4i2Ls+afBy/WzNL1ZljB2U5I6BgwrWjbD1foNUG90NfYuKxmpRo1E7l9234qTs
         9zBqx3Wc5xMmsqQNtvPDcYTFVpHvvpsSkLD+N1sO5G5P0+bx1cOk5wuGplaLQd2QsVDb
         bXfQ==
X-Forwarded-Encrypted: i=1; AKwUvByHI+j3aKx+37ZkfMWhITJKwKPpXcZBWXQIC6DgXPP5Ot9Th802XKRWhFQiyqZgIUBJLjiYoF6ruKxW@vger.kernel.org
X-Gm-Message-State: APuU4Z9G+CusMLIJMUK483CtpMbPOEHL9zcUubS1Mru6dbEnU/zO7nhV
	2CmfD0GYFpvFAcPGH+W2Ou199+zq8pV7S7v8blXTtVWLTXbPVNZ2gVxOYj0uxolk8OS8hmjEQR1
	IuUJv60AUdDV/gG5zWn/s4KU5jPoIQyvlWIcm5h8NO9QSJ0bYBnEXAOXva+04goY5
X-Gm-Gg: AYBFou0bTzrraLmjP3jwKoB/fwFYnV3PG2Ol87t+61j8CE2H3BeKEIx4oXikg+ivxgV
	1v/NudpAjlojc/9ZQeTUdJSI6OfKP855EJF7QjYwuMEJ3JDckcmdojAIsrCqugkPP+nhywzHhmr
	Uu1MRiW1liuYlKw+gv1iZdS64AZjJHhAQh/WuBJPR3PE0PsATLJmEgsECb8f+ksNGlZnSmI72AC
	Ek6jLC3eDeoI+GtTx6T3suqWMogupMY4xcthiSw8D0ad6k3tOGLWZEuXpT70C6Q6AMQPgEykvSc
	sW45B1VIQWA9evTLiWLxCMADAY37jM9kQe9o8rZ+/dZH6gDtsPPv26HtrRTuOByTW7ANSOTSaGC
	zWkH21VZNmsWHP0lXvO8BY95bjAJu44ufMZkYR7uXmp1dXrQTBtk+k1v4Az2kYiMHfgSIZvTzGo
	d8TfjQP3WP
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18968999c88.26.1793720522917;
        Tue, 03 Nov 2026 07:42:02 -0800 (PST)
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18968954c88.26.1793720522366;
        Tue, 03 Nov 2026 07:42:02 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:42:01 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:39 +0530
Subject: [PATCH v6 08/12] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-8-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=3423;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=TvEDrATTFZXUolN4JLbo1FGUxxzhhCTU57S+Iqt+3XY=;
 b=muFvx6SokZrG9kmmwt+swXlq6Pep9sBfIm6Gi1ogj72KnIwO+GykcNHOcHvSEVqOAMjXT4aoX
 5Uicd+B20epCY24mY45OXKuoyScn5B5KHddSxmm1oTUiusm1jt5oCAk
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXyTsknCile4oB
 +4EU/0MgG9ywn1AYvu1a8ddykxaMZYXwjejln2calsLqHU8Cli55LjG1TdfOtKIcVP4jD5sWtpI
 Qmk6tOIbCwU7VfNcAiuetA1MSmYmFOE=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea00cc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 35ND2LM4vnXJiBvWDwGIsmyN-0LPpVyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX1SNhmf0yEwDi
 lPQ5sLjEax+L37s7VvVFrD4oDVMuoXYuF2wCH4zEf2h/FH/QuDmoSXRkjbHlLhmwwl1zaC75eHA
 uNJ0ZrUd6IoE0lfWb8ewA/vwoHe2O7iM+EKahQXdWYuTUkM09ymBeUeE0xwmP2KS/4qeqxfUXsw
 35aol+sf7UMhIayRuxJF7W+2+oEclhTPe3mTjsQT8A7e6IZeef5DxlXnB76AYI2yB1CVroSQfkR
 VPO3Mq39uKGFvEYPLzGmfU5qNAsSJwp6EkvessPMXVMMaLOCR4oIZiCGYrqliLI2RFotJF11ILz
 Pj7sntGdbt8vMXdIQ5la+iWyZ/RVQsyh4O59A8S9mBzP3vL7O8Sf/owd+PTFZx3boFlsJ+VaZxh
 RP7TiF1aJSttkotxeBFbQhlKOjtZ91Q/j2/MtcNZ5NjcsX5iprK8JNEP6W5H3s6fXApP/n61Hz9
 Wnds+EQUCuOhvS8jvkw==
X-Proofpoint-GUID: 35ND2LM4vnXJiBvWDwGIsmyN-0LPpVyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 03f6d40edea71821bd763ade144707bf8971b65b..f98f1c705fb3380f1d5f94ade217c0c0538ead0f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3707,8 +3707,6 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
 			/*
@@ -3718,6 +3716,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

