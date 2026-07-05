Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EA635F193
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239337; cv=none; b=SeSEddKY307/w3LlOerGGfMwfItvvpTp2LE24Hj9fiLhXnipgY1ogyrz6eDlxrfp7xQ3SoGapJeVrEDgGdJL9vvdjXgUNVardehUfIYfluefjJnDXGRZJf46kt5i+IdoyLorSOAnuVyiASrLOPP7iKBzml+a/FiO3/v+aJvQGX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239337; c=relaxed/simple;
	bh=aslSU2Lpvqb8dwyaQ8YMkjZ9kUmX9fUts5FVIZUAkTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCS4qkDrhdUu9U0tfqpF3l730AGPwFCDkttF7NA7pPE1TRwCTMF0TJMEyQLx1YNUi1O75LIbkOlUuWV3Jt/Wju4bTXS1PupXv8TpmIGkwagovhMejLwTQw3au2rvy9qMSwjpiEbdgAofJU+5avmEYqc5R5Tyhm8C+q/ZUkvfifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqjMzpkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iAZjQ0Gj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqjMzpkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iAZjQ0Gj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664NtOYU033370
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4k9UzutMXiZdlWIeEIUwNCwlg80QNOnzM/93OOz7hjw=; b=IqjMzpklbdTVi2Sl
	eJU+QuXMihuCVjTL8+eQIS+B8Sng6SlLTXsHqA/PgfjaZwyo5X6kv9TGVKxPgD5e
	p5bra/LAAZAiQ8zip11R16R2Gdfjln6QhSJEEcdas5k1lPq0OKHOIW1UlXAiPeb9
	U9RnZC+tk0FMue+ypLLWgDKEAZv77mXZu4S1m6PImdnd5E4oQKGCniCNulUEX65p
	/gfgAZuSnuZIgmKTCBYRBwDvdci9K6wCIb1nUDUB9F91CCXT91DvgfGiZNNqd+uE
	WTUhOgcvs9c4CFEtkn2OKChWA0f9f4eZzzPdzENs5kt+4aoB7P86/UzN7pRWazSo
	35rQ7w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf826j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:15:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6bbd0afffso41288425ad.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239335; x=1783844135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4k9UzutMXiZdlWIeEIUwNCwlg80QNOnzM/93OOz7hjw=;
        b=iAZjQ0GjQDNZOlVVBNYKfJJM0L9qgCf8A5bHvLPu7lTeONgDes/Uxrs3vYKgb9f7MA
         4MhPdCF3XlE4Yj1XlN1YTYYDws096P0wfBWZcDgdN4q3xifQbxE/BsucI/EQk5hpZFKY
         5x8YIqxcPp3wZiAkMDWZy/3ZaBoXPxKBfbUJBF1SCKTSSbr6C9yMqBJAPCI5C6IfcClV
         TDJ9EpZcN6MkBssSntmmGmvyui84F7iQNirY1PX/W2QWHxvKahDU5aaICZsylJUz3jQ/
         KDcYVVZNpxP9rZ5maFaFjRg+9Oz9U/sgFm4z0djYPsnQ0eCy058v1KvvffqRbz+aEOQ3
         xsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239335; x=1783844135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4k9UzutMXiZdlWIeEIUwNCwlg80QNOnzM/93OOz7hjw=;
        b=hV0eZUjJGB7xq/1t1XQS55Fgzu/87WMpdN+GICrlAb2OT0kRk2xr4Y3qwwXgGKBtqN
         sUKpZlos1mUJdbam+fPpCpDq6WP7frUOUODGQdt4x4TdFbkqbcy01u4jUtCiE0kcxMnZ
         0GDRTa1svo/5Y+9VIYIind6iHvK06ih73pICtAMHRid5j4opAAchQ1XYdADoxU+qvzjT
         Kxrv01a82/84psaUeLxQLzf6V8yF6oNWjKoU4xAfcp1x5eUrTt4nkaApcHkfn9kvnFWr
         fjo5kc/n7j53T9+hV7meVbly1SLGv80WT+a/hgJLLdFGD+/hHk2kWlUCC05vX+GLHtit
         5ujA==
X-Forwarded-Encrypted: i=1; AHgh+RpDCIBouC2oZU7SOvhiYro3ktLBftoVKLh6o+pX6obXnDw+Pzkgn5tpCFMlRb2pcF99+lr9r9KplRoS@vger.kernel.org
X-Gm-Message-State: AOJu0YxMPfTS5NM7G/ci4cvqsr80OKFrtsgGHg9iCPo7Id82y5C6tCy7
	pPqjnzW+9lfzJXM4Cja4ChuHGF+Z4/s34tEZKZ/DHhzI7+XzY0fxzhn1p9dhiANTTvKtzA7NINz
	aIa7jKbmcX4RkAE0Y3gaIZpSHhDdNpSTmkquksCA7IfcrqEdAxKdcIN4b9PX37B2P
X-Gm-Gg: AfdE7cm+EdTinLp3w/G4+GeBdPUm3F0QCrOQWl26Q9IZIGyqdAVLKHe2FqOAcs5kjHf
	CYNYqzKQaKNQqL0tgc9CnJXxgC9gocwlhMmEC45vBDEZfMJiPcu3sZ83Y98ONNYpVcJrTgCJbbC
	Igzq5cQ3KKhdzrfEHwUA7ohzbg5Q+oMJRoNccXYPdCNtV3skqPg3wj8eHiYfaxqGVNarxXMIFnA
	uPrHQyDSeWIiePiEHm9euLQfLZat4U5xZRVk1oYtBei3E8Ic+jDIE6R47Jac645cqLHHxgqhfCP
	bubMM8jKBAX1yGInAidPpDh0Z1tg6lCcpcwLVdSOxrx0hDJ6qoJ7zaJdS49xR7fxMw9IxYK5QF3
	+hy4cxV9kk38d6U9oIUwoVUmuk6zVjaf0WTE=
X-Received: by 2002:a17:903:3c70:b0:2ca:c01e:8836 with SMTP id d9443c01a7336-2cbb201b5c1mr54322815ad.13.1783239335229;
        Sun, 05 Jul 2026 01:15:35 -0700 (PDT)
X-Received: by 2002:a17:903:3c70:b0:2ca:c01e:8836 with SMTP id d9443c01a7336-2cbb201b5c1mr54322345ad.13.1783239334746;
        Sun, 05 Jul 2026 01:15:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:22 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: eliza: Add GPU nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-7-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=5380;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hj4XTXJRwVTJobJx71cynzfN1k4QxqJRtGjaWZFWW2E=;
 b=35fe4KBw3FTsKp/hdtdHgczUQWi7qZh48PQEJWcKngdSxoOThZmRYCaTgT42VxCbWOhn0KKp0
 UEUQorWapK4BW8DnOpoaHEFoo0f1BSJ+my4rJ9t3PMLzdO39S3p3+89
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 42hEBN_hSCbYh8TY5cOTZ54cV7yzc7XD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX+NavPUQ9fxy/
 RMwjgnuJB329Be4YZvdVgm84B7WmLJ6Ob7mWzIZy5GyhF78I2bxbO3n1GDrUJqfxVOlZOptv8x3
 kf/JvduwL1jcPz4dvs5Ye/kz9vWvyP4=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4a12a7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=p8LQYYvwJZuHz2WWpfMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 42hEBN_hSCbYh8TY5cOTZ54cV7yzc7XD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX5nDv73gY2+2q
 yDUX3+OVkKBvbTKKlTLnObPBzKN717SacOKBnLuggOfS8GgY0z6Lr1m7I3lU3YIt9yFKiuZTe73
 irfWZJ7Fydu4pD03evAwjpOwi6rFfVazc6UnKRG4QfWBitIuBv88DGNorhXZ9MiP8RC4W3cd9I5
 CLM3rO3QJZiThvLu5bUOW3rb9fVPcdqOn21QihTOyIZib+k4O6EEN0hLxspEz0iUQw8qh+WKXCX
 CjxbskLGul9a57JKw1zm3H4l2lW89vrdd8DEi9psTuMDrAFfAzGf6M8ZReyYXhqtTNQf1XMupdc
 pD/MXKFRCagHNRlEi3ob1GpYKyHig7qjFuft5B5mpLNW6eFYxJY3smoLg+k2y+jWmPT9KcT8wgr
 VRM0a4Ti+sx/OsgymLDzv864I9ZKWBf1GkSw+QoLmRKflBZjeDUXLmwq6ve64pk91sfry3/GcsY
 zNyNupWGN9nzMyftyxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Adreno 722 found in Eliza chipset belongs to the A7x GEN1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Add the necessary devicetree nodes to describe this GPU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 152 ++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index e5b8377e6c3a..c24c5e9695d5 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3742,6 +3742,158 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-43020100", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0x0 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-259000000 {
+					opp-hz = /bits/ 64 <259000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <781250>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
+				};
+
+				opp-345000000 {
+					opp-hz = /bits/ 64 <345000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <2136718>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
+				};
+
+				opp-515000000 {
+					opp-hz = /bits/ 64 <515000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <5285156>;
+					qcom,opp-acd-level = <0xc02d5ffd>;
+				};
+
+				opp-645000000 {
+					opp-hz = /bits/ 64 <645000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0x882f5ffd>;
+				};
+
+				opp-724000000 {
+					opp-hz = /bits/ 64 <724000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <6671875>;
+					qcom,opp-acd-level = <0xa82d5ffd>;
+				};
+
+				opp-796000000 {
+					opp-hz = /bits/ 64 <796000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-900000000 {
+					opp-hz = /bits/ 64 <900000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-975000000 {
+					opp-hz = /bits/ 64 <975000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <12449218>;
+					qcom,opp-acd-level = <0x882c5ffd>;
+				};
+
+				opp-1075000000 {
+					opp-hz = /bits/ 64 <1075000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+				};
+
+				opp-1150000000 {
+					opp-hz = /bits/ 64 <1150000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-722.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x35000>,
+			      <0x0 0x03d50000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_DEMET_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "hub",
+				      "demet";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 0x5 0x0>;
+			qcom,qmp = <&aoss_qmp>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-220000000 {
+					opp-hz = /bits/ 64 <220000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-550000000 {
+					opp-hz = /bits/ 64 <550000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

