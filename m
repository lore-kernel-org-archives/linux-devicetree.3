Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7118A424648
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600625; cv=none; b=s/xERE0zjKbT8Cy0lLeljZj3YxY3TLSYR6NBbT/pxe/ARdYpCURtO+tEo9Pb+nfUuvC2o3DXa6r6HQ6fVm0r2Z5Mq3NCsT2g4nh4tVwJDP4ncnXi7Zms3txm1w/ffbNgg1xJEdmBtireQUSvQdSufIe4JYQO+/Z1IHNmpYfR1kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600625; c=relaxed/simple;
	bh=xR2CfjR0Ttsj8SQ32cAovG2+MahSFFnfKHW/Fftfk6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjTjf2kjLB/wmO0kzA+i3+tdRBskxsySvJ4NPb89sbWg6cybHE8FIw/c5fDO+Qu7t90XvqhboCVZwfGS1/KTEHoIqEnsgY5GiS1KS0bRm/x7ScC5hNnI4rlUf+ZoXTzXrxMRa3W2BelQhAU5rgCMxPwqzfvzf0/dH+1OBGXUPrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekFPnoA0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCQhu6LY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekFPnoA0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCQhu6LY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNPNa1667790
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/564X+41nZIX1jBTbCiHmQUaknwndKWmhk6gZcRTSxk=; b=ekFPnoA05skgA/PO
	BSkkex/FjtunAQUVVsI59qKO/8+/hG3qtwxpMQDVtlBCve3MYzeWuYE2UMqrjP5z
	JC5uMJPl3a8gkkcRIzpFFQr1cR9FbOpfGOveNqc/1zSrs1vYPYbNQCjPwN1TQryj
	VSSJpgyGktxppw24bOmH9tMCzIrFPv9JdLF0PVrtsoMlTzcjtfyv8zYjdd1Sue0U
	ivop8VTgVFe89IMdGet5e87IenGsmgiwYbxavarS3LSkocdergoZ2tgMbpmjCrD/
	nXQLP1EJx7ib8xcs3GcYwE+zOBfEN9r1ysrwRJZGxyQyWFzeT50dmPgGJOoKDYmF
	x3B3lQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6krc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:37:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1046897a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600621; x=1784205421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/564X+41nZIX1jBTbCiHmQUaknwndKWmhk6gZcRTSxk=;
        b=OCQhu6LYw4QnsywX+nrMS7KUBj5nKJ0tsEVijKkr7nx8mGeUtszwpqWhZ4RYswLVcb
         2FcbkveowemZaojVAV03uMDFbnt2c2uzZ/CGC0QVIMVAL28u4E9tGpCg/pS90K6FKTZ6
         EdhmACXFWajNW0GDyGdBKLrnR0IdlhXzJeFgETMx4QJugE8xprOM7i/ailpn2cTi6EZx
         hvYF4AC1EnO+Sb1c5dua+1D725eLErRaLJ+oQ+X7Cw13mJMgrOPW65ePOLCCk70OaI8b
         wKy59mKiPorZ7692vmiVoNf1rmrVry+1XQAlIOsGLIkmXFCF53MFWt2pJhmB4njQ2OT+
         c2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600621; x=1784205421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/564X+41nZIX1jBTbCiHmQUaknwndKWmhk6gZcRTSxk=;
        b=cXmRf0lHVhn3MY+M4CqTFhMyh7QF3WCD/49NGnGu3glwXdqDeUMzjqV69dd1b3qDka
         lbyHMjRQmA6CbfcX4rgfrVmTcFwTWGNyVc7wpPVrfTbrf7Jqbp3OtnN9C+zBAdR3wHVE
         4Kika9o4ER0qp8UNuy5iEIPrLVOkvue8OPmuPS+6wyvwOpToLdMqcdNSpyD3yqBpkmUA
         yQLuNskspoKySG5RmBmsWw65Yp0XVxO/fpHIF+eVLjv+eEU6XQGudsZjEvWd6hJdTxGX
         PdJxAms2zC+l0TxwqYGhEigq/Jfv0HvMu8km8/E9WlCwvaZQYB6CoQQrEI2Ds4EcMgYd
         v23w==
X-Forwarded-Encrypted: i=1; AHgh+RpWiSzVvIQPehdfiPLrnqQm/26DNESvHeMbbuVle8S/GDOxB1/K0Se+5SCcYngKIA3WC2f8sV6F5fqH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4XSOLNbkyiWk84GKi1t+dY9S0Yl+h0vYmBEzhlU3QE4bYA9T9
	dpiAuuf3jeZdA0oQ47NY5boBLOaPiiNzTUxjXCZcY5GeXbML3NPk9F9z7TwCjNiWaYLXLpcbRfx
	bTRxqZGgUiK7h+wkP8ShG6HkW/jPWbXWnH6LE05VcsUaPFboNbvcpk8MxV6V4YAuN
X-Gm-Gg: AfdE7cm7H7TYCcAa2Kg5oUS/o7EsMBXbsmSzfngw8esOTM1Trx5F4uOtIvHizvmipJL
	SIDcNLHv9CMHMm1XR7l/a2EDH4xt3Rh5Yfl079XeXzFfI5iINLQJDaXSzO66HJNEQIEqdjn4vYF
	7gEMyMbKxNBW/koDEMRki5GHvUvNhnTRFoQimk41uA8y+La7srs/yTFv5Kj0vHhg0g+6WWMoeBs
	JP4Syhd8aRY3rXzbP5HhkBDHYttjiXJdEcUwyFpXB2E8wAFXZsUfwxl5vyPOCQpMnQ8p/HySAOi
	3rIBr05YShong8qdMPS6XFNdsiU3vfDQydnZ1LolsFf5fHtdpoXFADiLkdWp2o5C7/bqoXC28G7
	s2sBMyYV986fFCa9LkleIdtdhWW5fHWbOqqjlQsnZGojslA==
X-Received: by 2002:a05:6a20:918b:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3c0d6b262a3mr4004992637.18.1783600621295;
        Thu, 09 Jul 2026 05:37:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:918b:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3c0d6b262a3mr4004947637.18.1783600620839;
        Thu, 09 Jul 2026 05:37:00 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:37:00 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:55 +0530
Subject: [RFC PATCH 09/11] arm64: dts: qcom: lemans: Move Iris IOMMUs to
 child nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-9-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2085;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=xR2CfjR0Ttsj8SQ32cAovG2+MahSFFnfKHW/Fftfk6Y=;
 b=mpFWW1OvlnyHxqVN5Kgq/RA4A6Q55QDLBUTFY1c47lxXwyPyMw6yIG6YstH4cqCGSxoYPTAlq
 XYERYzUV8SSDp82L/859VJcCmYHpfuGladyUUhiPelnXQg4Td+npjen
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX9w1WrcAk8kNQ
 VDHKdKdAbtq3+jz+TWr3ZxvNxfZNFUxDnDFXAjEDAwEim13rKphLbAmKOvgVLv5IXlwsNcnG+EM
 asQkh4daZpvHKagg0Vu223AKRKuQhK0=
X-Proofpoint-GUID: HYN_aN84iEzW-nJA51uwnCP7a2T3d2LJ
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f95ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: HYN_aN84iEzW-nJA51uwnCP7a2T3d2LJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX/IORFRxTJv3k
 O0w9704+pcrEMXT1Env74MOKUFzCGlE+0AsAbyrJBzAgqQQKw+9kcA7GMETnDIo76omf8i5/0qk
 Jg9Dqi6aWl4VMmLzMp8GvL/xnFrzyKaRbEwj10rWwGgpV9GGl4tr9HMFTn+WgvN0G973SGlHi/H
 yRlYMmSCBlRCW/Vcb162CKO1kB8ggWgF1rf9hHCgIS5EBfVdU3agek1pVg1sUSabAIEN8anxYb3
 cCEjRDhdHbeDUPfEuLFvOr1bxOWhbImKiVLP5uhDQoBav3ermh5J2PzAMEYWYHD8WYyuu+FxlqG
 T2SfKMEk48on4+UCryW43Sr5y5U95UJz2k+Mc92wZWlKzrdAPFMRplllhvhpZ2mYNh6YCM19MCC
 kfqtXmkggZu83aeLVTZ20c6CLtJ9//aJIGfaBjN0v54uBQTDZ16j1g+Vio+v1kD2vHSZF793qiE
 Q/Bj7nY3/JHLP8mUabQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122

The Iris VPU has separate streams with different IOVA constraints. The
non-pixel stream must be limited to the 0-600 MB IOVA range, while the
pixel stream can use the full IOVA space.
Using a single set of IOMMU entries for the Iris node does not describe
these per-stream limits and can allow accesses outside the supported
range, which may lead to device crashes. One such issue was reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Add non-pixel and pixel child nodes, move each stream ID to its
corresponding child node, and add a reserved IOVA range for the
non-pixel stream.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index a10322c5bc35754042640d56ecb556a5ed5cf281..90c300461b5029b4084b8b28130cd826155e4cbb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -879,6 +879,10 @@ cpucp_fw_mem: cpucp-fw@db200000 {
 			reg = <0x0 0xdb200000 0x0 0x100000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -4978,12 +4982,22 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

