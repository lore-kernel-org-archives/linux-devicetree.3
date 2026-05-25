Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A105337F747
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709677; cv=none; b=tfTxdi1EkXkGkAUoRdQgEAdMMnqpYtLaobVLII5VPErfSM+Jr8uvHX0uAh1HGDVsEvjdjMr/YGppDV1GjtdSm+kJKf2ax4obLDxEc8N28rqE89Xb/x8oGH69mfjJ49HzUUsnjxkT5BS0O+gVUMxajNEoPnuFTNprlIqR+iIPyaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709677; c=relaxed/simple;
	bh=AM04J1OyDHHszJKmHU6PypKdHXZZRiX5wCcGvE9R8dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQuPq7ynrQvddPBk2MMLK8A4EIowm9gyPQuyANug4QtqwnOsM69ESoGe48FKhfGb6ibo8v6cBeaVs+us+0Rn2w1RGKYl0X6nsbAtwg/koXDDzUKJAktMleg7+JVMDPCEwnbCjEgzUkzTQbr8A8q76fQZ1nJ2VhxIEsOp8+2lur8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U62Ni63N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyAQKOUZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U62Ni63N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyAQKOUZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9ER1b079361
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2TTTyw6UMxq
	zd9kC6WQm/5x6TB7QqHCpC/ziXnZ4IwM=; b=U62Ni63Net81Wb3fU6hLXzwlZ/8
	eGkYKUDIuNspp/eHMT3sRvkg5iaeqhLyCJybJw0EL4iJCmsGd1faUnfWe0YEG93B
	yzOKvDCKlcBIUSPK1szyo0ocD32qOFW/DISjQXyJPq+TSeoClnqR8lW4qLOdwu2W
	i3O9OF0Xe3lM6fOZ3kfdCRQSg0OTPy9pZS8e7UkSmTJ7MXcnfSZ5xwQ1tPFYiFRM
	eD0AfeCK8GO0bAHNzGLQtpy2+eUEdqnzAh+54gL1O6y0Nzb52QLbto6h9RSJ5cL/
	ViJ02UZgkxKbBOQvEBpyeRE2X0b8CCW1xQcvZ4z9a67WhQfTqZdeHKtJirg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma8g9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:47:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516ceea1984so77902731cf.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 04:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779709675; x=1780314475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TTTyw6UMxqzd9kC6WQm/5x6TB7QqHCpC/ziXnZ4IwM=;
        b=DyAQKOUZvHApAGNaEexFp2ehYMMiIs7IfNzIx0qDgf8MyL/HjpmbquRuYWktI4XxcS
         xoGaCaP+vPYRGth1Nn7XYhiM/3v5kkF7o3oTAnk7J2/4qfu//mwgEpQc5oEo+/CaO5L4
         d4+6cR/v5rsAqNxsyS/gbKFxV7/OtXfm/FHmFldyIraAUG0aNzFXpx519Sfa49xHW8XC
         b59i3JdKwD9e1IjhtLlzHp4FS5FqmCp4mV5uj0XlZy1mKePpYAZ0d5uv2iNMN+iHC01G
         9twzoVe4VEMeTcwRiizX1ge+D+zV/QDXYHIxk61z+YFWs5wrnOM7v9M8eQopBQdWX8iJ
         hR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779709675; x=1780314475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2TTTyw6UMxqzd9kC6WQm/5x6TB7QqHCpC/ziXnZ4IwM=;
        b=XC98csMOtcjQeYebFpIHvVczEAXw1Jg42O3BiAInwztbuD+AaYyx+ZdjIZpeV3zdM/
         CbR+SUFxg4ewObNiIjzYoqil1e7G4wAr0Ht4425ovPQY56Jx2ygm9rpVyfSgRTdQz/bJ
         fikA2pLMh1JeuXEj9OvORxlF/33gFIhkFXx18OMDR8lHhyzb1x0bADsGQlEbYrAPW1bV
         uN0N93B/q7KM26f5QSy6x26PJKOU6ALEVbIy9Vw446c1PhGWk/m6aoIK20W3P93Kytg2
         Cb0u8u6XUBleHKFB9xU3uZYTHeEE0oiiZxGxPuCv06G04mzOp2kZbZKif3w1pY7/KgZ2
         Njbw==
X-Forwarded-Encrypted: i=1; AFNElJ+DSTxYDrCI0754BFfNywI/eJl4t/Nr16sL1hf2d1uwHYuO8bKwsjVCjVdtMK/PPs1445q5zPNmzBN9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy65q2fhhgFqXs+qWYF8ZKQExVqdzNMy9oePUX6NFNzBCR1QJv9
	jkfrkacNa4/g0D7BW+fXdrfOTOvutrLHLrTbp1VArZxtJyFtq7aaNnISImAKZLZvNPtgagIawNA
	3+pSvVMsKtzeSvzvX9odxVcAchHgZTNaR0VBR98Hxqc/Lq/DztZWrMSYivqwowdAG
X-Gm-Gg: Acq92OHundTbGrm3kW33aNoXGkvhMD0tvtlPpUbSPG+kM9M1FINf8SYp+E/LTMBCbjy
	IEAI4heOw8dxW2TNZgQOOdtBHq6ykd0CRuV6F90bv2Ktg+/rXvvPmt28WuZmlQt/UMznqvekY23
	rpuW7AoGRZ8WsufOHX69908kDwAKiUx+dNlo6kII/YqhW9KKDoTX7IUSur2Vt6Ccj6uP5Ye0tgS
	2NHX7ZZWN0d45u1jPa4RFbsU8u2WOmNqkNiyRxsqlNlpS/FNDOUeEjjgTR369uvPtQZDj4TVhxe
	JNssJ0/PvME9nRIB2j4iNwFIgk4iN/DjO61m7Pv75Y6W465MrJzqYgPgVzCUwIfAlwuu0ZNuciI
	DubcwUxZ0cJyKjULV5tul2ri3y76Mu6FXX2Jn8+IxguetvApDa2vwPMrj9ymskVvINULdRaQZsB
	ffwZ7ilmNeOn26mLkY4xmRD9POaweglkLc
X-Received: by 2002:ac8:5912:0:b0:50d:5f34:9a with SMTP id d75a77b69052e-516d436f13emr186366351cf.28.1779709674978;
        Mon, 25 May 2026 04:47:54 -0700 (PDT)
X-Received: by 2002:ac8:5912:0:b0:50d:5f34:9a with SMTP id d75a77b69052e-516d436f13emr186366111cf.28.1779709674571;
        Mon, 25 May 2026 04:47:54 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc66dd3efsm384096666b.58.2026.05.25.04.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:47:53 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC 2/2] arm64: dts: qcom: hamoa: Remove mem-reservations which are already covered by EFI
Date: Mon, 25 May 2026 13:47:49 +0200
Message-ID: <20260525114749.5939-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a1436eb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=X34QCn1Nalu1Q_IyOyMA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 4qQ8PM2Ciw-EzNXb_0nkP19T6QgebnKS
X-Proofpoint-GUID: 4qQ8PM2Ciw-EzNXb_0nkP19T6QgebnKS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEyMiBTYWx0ZWRfX9caEmOunV0cV
 b9t0wG40ZTe9JMcBO2Y7NWC0L4mOXGEoWk3Hxge52MF1n6St7n4NkK+h6mg8dSB+tp/Fm+F9dqj
 Jq0+Rnv37ChETGFfxbmVOWoo2VqOd2c0N/q3TDRROpSq38oNQB0LYVORNc3nVPesKBZZmseJja5
 6X8ZCa8p8S06EW6KmnJm8postrWX3RvR3pd5NDD/nvkmLI75UoNqKrqkVCo/E6DL4x7NQ99Vd92
 at6+MAvxfS9ChbZksXz8e0Qpl+XYqzA5CFbrb1HfblGauCKzrgdpi+qcvWgoszWv6yQH+T9PrWq
 1KGHQS9KUcQYjydvyV58MxB0AaKtj1RUH3jfVCcXv4zwC8njwhrg0AGu/hViwNNR3FkkitMGEh2
 0bC8XYTaF+70fz8+OEVZSfPR3cCU3e3w25b4lcqwAWQHJfui0DJ2uasZXNbh4xbGudoAct35n0U
 db0KGBZV4f9kMRuekLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250122

Remove reservations from reserved-memory which are already covered by
the EFI memmap. AFAICT there is no need to have these in the DT and chances
are that they might change with a BIOS update, so lets drop them.

hyp_elf_package_mem + ncc_mem are together covered by

efi:   0x000080800000-0x000080dfffff [Reserved    |

xbl_dtlog_mem is covered by:

efi:   0x000081a00000-0x000081a3ffff [Reserved    |

pdp_ns_shared_mem is covered by:

efi:   0x000081e00000-0x000081efffff [Reserved    |

gpu_prr_mem + tpm_control_mem are together covered by:

efi:   0x000081f00000-0x000081f1ffff [Reserved    |

usb_ucsi_shared_mem is covered by:

efi:   0x000081f20000-0x000081f2ffff [Reserved    |

pld_pep_mem + pld_gmu_mem + pld_pdp_mem are together covered by:

efi:   0x000081f30000-0x000081f37fff [Reserved    |

tz_stat_mem is covered by:

efi:   0x000082700000-0x0000827fffff [Reserved    |

xbl_tmp_buffer_mem is covered by:

efi:   0x000082800000-0x0000829bffff [Reserved    |

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 60 -----------------------------
 1 file changed, 60 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 5a2e84365901..0ee116ea660c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -465,16 +465,6 @@ gunyah_hyp_mem: gunyah-hyp@80000000 {
 			no-map;
 		};
 
-		hyp_elf_package_mem: hyp-elf-package@80800000 {
-			reg = <0x0 0x80800000 0x0 0x200000>;
-			no-map;
-		};
-
-		ncc_mem: ncc@80a00000 {
-			reg = <0x0 0x80a00000 0x0 0x400000>;
-			no-map;
-		};
-
 		cpucp_log_mem: cpucp-log@80e00000 {
 			reg = <0x0 0x80e00000 0x0 0x40000>;
 			no-map;
@@ -495,11 +485,6 @@ tags_mem: tags-region@81400000 {
 			no-map;
 		};
 
-		xbl_dtlog_mem: xbl-dtlog@81a00000 {
-			reg = <0x0 0x81a00000 0x0 0x40000>;
-			no-map;
-		};
-
 		xbl_ramdump_mem: xbl-ramdump@81a40000 {
 			reg = <0x0 0x81a40000 0x0 0x1c0000>;
 			no-map;
@@ -541,51 +526,6 @@ secdata_apss_mem: secdata-apss@81cff000 {
 			no-map;
 		};
 
-		pdp_ns_shared_mem: pdp-ns-shared@81e00000 {
-			reg = <0x0 0x81e00000 0x0 0x100000>;
-			no-map;
-		};
-
-		gpu_prr_mem: gpu-prr@81f00000 {
-			reg = <0x0 0x81f00000 0x0 0x10000>;
-			no-map;
-		};
-
-		tpm_control_mem: tpm-control@81f10000 {
-			reg = <0x0 0x81f10000 0x0 0x10000>;
-			no-map;
-		};
-
-		usb_ucsi_shared_mem: usb-ucsi-shared@81f20000 {
-			reg = <0x0 0x81f20000 0x0 0x10000>;
-			no-map;
-		};
-
-		pld_pep_mem: pld-pep@81f30000 {
-			reg = <0x0 0x81f30000 0x0 0x6000>;
-			no-map;
-		};
-
-		pld_gmu_mem: pld-gmu@81f36000 {
-			reg = <0x0 0x81f36000 0x0 0x1000>;
-			no-map;
-		};
-
-		pld_pdp_mem: pld-pdp@81f37000 {
-			reg = <0x0 0x81f37000 0x0 0x1000>;
-			no-map;
-		};
-
-		tz_stat_mem: tz-stat@82700000 {
-			reg = <0x0 0x82700000 0x0 0x100000>;
-			no-map;
-		};
-
-		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
-			reg = <0x0 0x82800000 0x0 0x1c0000>;
-			no-map;
-		};
-
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@84b00000 {
 			reg = <0x0 0x84b00000 0x0 0x800000>;
 			no-map;
-- 
2.54.0

