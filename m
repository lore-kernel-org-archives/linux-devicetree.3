Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172905;
	b=qZuNCC2c4TPXy/ZKFz0Dh82S+e5N0U/uqBLlIFH/0Q4NQLizIuABAlUHgzizo7EbVCvZ
	 Pf5fVCq55GRTnivCfdppwGBxyrikeyCZTJAPr5AXbe+P693O1LBR3tkOSrnsjqHt6zW7w
	 BnteGmhFFpX8IVYADTKI6n/mlJheX9sO1CIvzaf1lKDGPuiVqml0djwsQwE2PzTrSaA/u
	 UoItQDXdPQoNTsjx4+4ojYE5ajDaKBfkH7FG4AfV+17k+d8mIa+QxjnzC335pXlZTrRTF
	 oVbKENic1WeYqjKQsDSHTjm4cQ4Q3CpbDRFoqt/pmgwo9WR2g7DBhqN09+ji0faoZJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
	b=VWYY2TJE8l9TAvM3Fia8GZ1kbyia/tNjJRxM+dA5aZynj+3gvs5jQFco2GLtNmnmo2hv
	 6cnhgjF9z5+ztI9BR96Zzjna18j7yMc3yO3e6OpGC4o0JJ8VO7NTpuk7atGtysZ+Db823
	 hBHbpDJn9W19K2nZEz08VUEaPxudrdbs4eLISF0tHKn77R4arhBkrHSMd7x0xDTP6xRG8
	 ZbUgCfC5Sb9nE9aoFUN140v+tH3hq+jqWEjP5eizuMD9Gr1RcneTiA8PYg0OQVAK0ZrNU
	 XCZjotD5T67FOWkUs4m/eaNSungSM4mcx8dizrtvruh3KTmhGHyhnR4l8Q5Ej2VQkLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFgqblB1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCeFH0R8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6695260A6F62
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6695260A6F62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFgqblB1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCeFH0R8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1ru2433128
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=kFgqblB1KyOqBzjl
	SI8BRPIVJCHt/dZOvNY/RF9Var1F1JFJYPJwoH5d/m3NEMAs7RoNmUPSAKp0G9Ct
	nwveGZltxWkQSbrPADXZgyrtI26A5FofYrfhOWmexCgsziC7nmQlvlzOQiVn/aly
	BGaa+hQeQ1Ir9dYdKfXJMJ67wRO/lfYjaddOKVUW39B2Mm48ybfT4ZJLT4bJ7/ad
	xbgENLiwFp59D0b2uIPRf5qotAdPhwzfGEGtQshjtO6iof7pfVR4TyGWnglOImsT
	qwITw4fRx1y6399xeihkKRCDamzcClB1DBo4LaOPrKuBga2gfWkZVvNAuAjfVp+Z
	mRmZ4w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9f4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso1973148eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172904; x=1795777704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=aCeFH0R8Fj/QVtvCuZmc3QYz5D8+NsM33oOlYtUxxoeulhzzN7/fIxRWwEEcWMr4lP
         ioYQKhYjrSYblZWLGIgKGhPsfLjmRleHTqffSv9OJERuSWuojdDnxx8/ZW49wHhb61XK
         s1Sw/PVW4hoH5sg17vLw596nBamh2R0XWTx3imdmF/GIs2tXSutnabG65xy+6/wyYqnD
         4a4XZnm1d92T2bQ6qB+QjtsTofL3Y2DY1Vr8YyTL86rZBm/S0zqeJ43hWb1Hc/P+fcF/
         vl/tC9wBkQhaJ1LeMjnyhf1FYCczJ1VC1VOUfm7/hc1LXKzkPausFrlLeoM5E/Sz1y2V
         lg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172904; x=1795777704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=S76y+8L3V2u+N0wJVvUMXfVffTaakgesQAIj3uU+p1hF2j98j28sGLFHcCo2i4pnI8
         hrsi2IbsOusL8BtiWSPVph92Zrbzxu27L5EKKL2khaIGtLabSEkD3uA356kDbjuZPlvL
         axS6kC5K66EBEFs3+dV4bX7zLQyxF0HAdJJyqXUEA4i4wPiUmtB9gfhcjv649+SceqAM
         BTxAQukvLTccpUcfIShDK+m4JFZ7UGqMUk8AVqZ6alk557lqbKsRetCNtXPdx1Re+HvO
         Oo4qNOIttU2sd1bvrVMT8K3qVjwbmSq5zhJ1+cYT3FHlLUEB3qiqJS10Sg7uvpVFwBxd
         1YVg==
X-Forwarded-Encrypted: i=1; AL+hErGFjra07oxTbNGP4DeB7RbE2nABki2lfnmpm+XWDNvc6Ulpk0aYYKQ1M3o0BbgKeH8X+LUlHtDn6xR3@vger.kernel.org
X-Gm-Message-State: APuU4Z8RWgQDPv+HgbcSg24hQbRxfOJ77uTjZgwASB4S2sZbAHOygPBh
	DqoILF6wW0i4VjH4iAmzyKsnWzmMh12DlzIoCiVNeu5/cnx/MI/12/OkkKeNHzjV1bIQi8adRie
	ejR7lZ606YVNUELaB/hcnMN8A2+kmbh2Ha3Ia0IB4VNeRs7zzJpbpQAJUxFSzml7x
X-Gm-Gg: AZFdTZe0GLf/4VoZXBY45ctF09X2RIQ8G7A8/hwispUM+UVNEOkyV/rD93OhGqN0g5X
	5sokfT+ck84aUSjyQknqnHev/KMXCyvHslRkmubOFmut0Ea/X3/temHNeDNtKxFmk3dsKvR5c9X
	syLNuZAGxMzcUUWSVTPVIxw81ArT5iFoMLVU3aUmvIvJZQPOBdTG1IrDBZhp6hDfsIqgXOmxhKR
	jdwO5aHjWVAlKN/VFNKu6ftpnrkkv/sFHK1ieRpqlUKeS3gg/Ju4xW6ZPk/3B6rt0mWMR8BURQD
	yzlGx+f8N7vZ/XxP1VVeND5RQd+9aDk9D6dnRURN0ikgS1iibP0u5UFhK3kEWxyPsgwxZvNYMpi
	kdJZXUjXwY+VJgVuTZX5LrA6ZF6xmVm/9iwyiDMnsyygRuiOC8kJwBhEvbJpQix5+m0C5Yx/5rY
	jO61hI
X-Received: by 2002:a05:7301:619b:20b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3856f45057dmr2756091eec.22.1795172903798;
        Fri, 20 Nov 2026 03:08:23 -0800 (PST)
X-Received: by 2002:a05:7301:619b:20b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3856f45057dmr2756040eec.22.1795172903140;
        Fri, 20 Nov 2026 03:08:23 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:22 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:59 +0530
Subject: [PATCH v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC interconnect
 for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-18-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=uW8nrRF4SJLtr5/e82lnBVVXICez3ZPhzw4syEcDxKA=;
 b=UVzRHXN0oJO9hdlh7U4rxJrqxQy1l3cZ5Rlb2hk0YTnyggdfF/MY0VgoShryhbLhtW6NCInlJ
 H0MBMdEyI19B4ktai3TXrSA7fgr24uRXz7FNw2lNnZDAoaeKB6/8rsU
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b002a28 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iSr-qRAn3DWi8jR0IaQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4plgFB/TC4y2
 25s0cEg3Zrg7R7BLAV7QFO9erxjoTIzm3CbhTe22LZQ5jBUzAIopBJ0171lE0wcnKrUl9eps0eo
 /4wtUbgFA20cTKu7LHN/YosixvPCsfM=
X-Proofpoint-ORIG-GUID: KCf_BwZbfoVkL98_KNsnJvx1EUjWDquB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX6fhSYnO1kg/J
 6aK4/ADQyGV2iofmR25OknPS/ajev1nJOUXvfvn/Va0+5gaFcqXYhsBksfhbLPQ0Srttl0rK2OR
 DRZRFz0Erp5gi7XyrBWi0YZI/dfOBE+MLAHGZmsmkW8gUxWLE7fCqFmQkvCy7eeiAShF3jRW+MF
 sbKjIC4wASOWOfjwebrpArUEFBlXzrMZaU4wod1ATl9fPIXsvUSXMoZNyaYw7zAlWHY01RexrmK
 NUhMIbJAVBjMfh36Ghr+UncDAMvwva7U2620lvHgJwdJlvS+RHFI4XY8fsxapGfaJAZ8MhFEul5
 Sv2279YgGh6Apao5HZKL1/5jA+ocefP2ws3AMYKbILED1pZCVqzzSSjaI8Vu7KfFS4ekuObk1qU
 p7FYlX3lqqLmLdWlxyb7vzKfBubBp5ezhVykBjQzWam2+srDmRG3IAkVUH4sK6WZDGT4/kmFTNy
 /fxVROO+I+8AAVSxOig==
X-Proofpoint-GUID: KCf_BwZbfoVkL98_KNsnJvx1EUjWDquB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 9cae93b6a610..49ea0a8759f3 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1988,6 +1988,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

