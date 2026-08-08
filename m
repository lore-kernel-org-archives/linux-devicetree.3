Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEAE31E82E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220628; cv=none; b=h7/b1rTv44YC/hU0/8SBD3qQEfhtxZ3rTcr/wxaj7u2kgMULU9jGWM8serzNu105vT7bZukAAZezj9HgWqTqgMrEPYI5vejHda6zC1r4N2LF2FKtxxe7+FVp6MXH8HyuTFmB5iGQis7P8rXjvX+tMtWsbAWrwSQ+JtHAeaOvqjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220628; c=relaxed/simple;
	bh=NQniVy/YWmPOfxhyjuHRr6BhAD9/uAH7kVnPCXrgtHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHDHRqSjMQQba+bOeNDj6+2sr0mV/2Dsgl/M/7GTqmgSyOR/DbpEeBOx/Yan4b3cY3WjUoHpJr3zCN6aT2OIrvd0gIh3Bs9S6a2YHXDq8jxQX063Eh9FCe7oU1mF89zeT7CkxJhBdY22B3AnikpbRoa42hBkYq1CBRfrh7O+jDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knyBMTL2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enZxACo3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knyBMTL2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enZxACo3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678K0Bnl463852
	for <devicetree@vger.kernel.org>; Sat, 8 Aug 2026 20:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35yBqf/L8pKpPbkljIq386QZBSYHcWB5hxAydwTSIX0=; b=knyBMTL2yEf6BufI
	H5H3JTrF9sIa4ISnrp4iWekuxq8JbvTGTZ7OwVinkhJ16FNKzAI0FAtpuWcvqwfx
	bdO/mSYKatSA0QkTGyijUJj9p1qM109w84n+i2NjZ/piifdwIGrW1ffUwgQcbyPK
	cNK7z1+vpFTP6CsUEMN1H8JFuhb7OlNWMsl6LfyFMoEszw/KHCzsemYqt5kZ76dx
	E1PUiRsjoBtEYpy8v5R0qnubANjL93EPbEHb8PsbMcVYWcnvxG0pxSgQ+RMzs1Bw
	Xsv1GH9SoTeCoBk5sije8DNu5iGQlAiepQaRyFnMeqXCD8W3MbXllvNWJT+6Fzy5
	h8t73A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8hmeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 20:23:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso418755a12.2
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786220625; x=1786825425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35yBqf/L8pKpPbkljIq386QZBSYHcWB5hxAydwTSIX0=;
        b=enZxACo3WtFmc6ZPeyk/FC62jEPf+DtoPgzJBQraVMI+uiESg3g11PGNd0oVP5SbH/
         0zMU6ADbMR7+gfHj2RwT/aecGfxxsOXjLK7O5O0QOnAUyrP8yFhjBzxp7hfeCR8dfPHG
         VqBoPhs2itLnlw1tgtnohy5hRJpiR2e3hTuDt4xYLZKgWjP1/AF65ppmzZRGr9L3FN/v
         Yzs754fdElMdhBKDSr5b4v+nFSEf9GztP3BylwxLFTnZqZIfb6DV3oRWS76KkK6MdcIr
         r/ssq9sok3dHNjfRFD8pyli3XxXyBZGoOsuzDuKQ/1o4qQe/BMwy6o6b7qEyxDEiW/e7
         rH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786220625; x=1786825425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35yBqf/L8pKpPbkljIq386QZBSYHcWB5hxAydwTSIX0=;
        b=iHoj/g4705ZMKY8Yd9powhbA9firCv+mpsEfJhVpB+v8nb+4pscIkVR4c1Bcd1kpbD
         rweVQRuOgtp2tQdKnSUhjZyt+DBqDYe4GDI4LAXMLGyBEpmAt5TUELif29J+t7OjdydM
         WaC9k78zazvsXX71GjnkMnBvxRxdchtEzl/E5PZgv5bYG9a/FC1I5MWR80M7VmJg3AmF
         JJ8hQhjAl+PrrkmqK2KaOkivjldPVJG63XRjdaWhKB1WtKa4NvFLWyLuO8Ler7AnP5Pt
         CmH66lc3YGJLJdPPkBcd7EGaJzMZ+UqtjNvzNfSErt0QMca+sh81/2oVBW+B5T9I0u+r
         hF9A==
X-Forwarded-Encrypted: i=1; AHgh+RoYkEELuDO9Lmoyn3sekxd6j4XDEmEgoQXU+CtelGb2tA99Z+URwrzwJHFqpqzzlWht4HSlolVqOEOE@vger.kernel.org
X-Gm-Message-State: AOJu0YwpwUN10I8s1OUCIRCB4NPsmalY51iePA/2H5RxCL8DJjruXX8J
	TZuZizUrhZnUZ0koe27sk2cgeiU4AbdFdXE/pJkhplRi9uY14IvM+pbLHIRE/K/A5+GyPeomUVG
	Ry7wQIpyn3mKwwVIB2Vz6894mvBG09N2eVoD8Ml/N67x8m+GPTy+jdzcrHF4wO8Zm
X-Gm-Gg: AR+sD12cLCLhuXzsypcjX4gLzt/9DeC4YlJykHgLwKtaQ506DSy5DT0/T/iJ6qlIbk1
	3T4SdANQHU2l7V/Cuix7HS899UiaS9zzR38p8njSPVPFWbKShk04r/fITpLTdz7HwKxzWEPiuMp
	i2JVZscZe/BFgIJvYTdQDCnLGnocPCJFkk80DFsCP1Kyt+YcsdXmHGy8rSYZ2nhy9NzumcGqP3q
	5I77WS0D068Iq2FRw0OJS94LcCNP0UcGt2xD9VInyENoD6qJXIeA1ap+xKuAjmp+mdhQmswF3R2
	ICmf9bOOgsQvrKDxEckiMaMEHjW7Ap/htTXDd9TfHWthdk7NCa1dm/x8kD5RMiU0tEvcvBJXA1j
	B29eBvk6dSkW2y/t22xSvzfKW
X-Received: by 2002:a05:6a20:4324:b0:3bf:6ac8:8d29 with SMTP id adf61e73a8af0-3cbce8d863fmr9053249637.21.1786220624576;
        Sat, 08 Aug 2026 13:23:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:4324:b0:3bf:6ac8:8d29 with SMTP id adf61e73a8af0-3cbce8d863fmr9053204637.21.1786220624074;
        Sat, 08 Aug 2026 13:23:44 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm26357417eec.5.2026.08.08.13.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 13:23:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 01:53:10 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: sm8750: Add GPU and GMU nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-pakala-gpu-v1-3-207ad1fac1c7@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786220595; l=7793;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=KpRjvaN+POYnf/iWbLactJsvS/uONwYdIqDoQnawjs8=;
 b=lEWC0spHnEQuK2FZr1li2EvJoU8Un1fZN9V4lyQZAdKTyDg3gqBTJi8CE3H2aKp8mJ52wpF3E
 pbVRMzZM279BvN6AKIhq9dGnalZeFZ5MDbc6M27TpeDLv5i+Spj7Zps
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: iuKO8GV5GIirZWCY3q5YgJUvFjQ4b-dy
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a779051 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=AfwcTw3k21529EtOIw8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: iuKO8GV5GIirZWCY3q5YgJUvFjQ4b-dy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX637im/dDbf1C
 p3oQKf8BJyeEfadpO8n5rdZg9v8NbVZYSg5IFjHDkPj3vhhO9iNVYemDCZgm+upZcaCoPmJASq5
 6dpXzrVdxqoIYzaQkhq3wMnN6V804Z+TglZHs08i1MVwuWnlPt7RWNDKlVUMq0ARkDirn93s+Uk
 xi0E72RYAzIGSCUp+lAMojeDyrNu0DrtfmdIdfxymoIRSRGQvi9KQSKceqd+2+ehimjObbaoEpb
 FUVv459/ZWD8tMeotYlg4FiWkfrL9UuRvhSIPzTYBdeKPz+U9nYKBW0J4fl2iqh7wTFoUaQq+W/
 Hg1olxskFEFw+RZVgu3i124Xjm6NUXDRxXz7Ri4r46RyFnGEnpvzaLCKvu5M/r4dusWm0YQYw/v
 4XdZZzUEkwqEMqR8CSNSYGFbTffDiQo5JdrmTJy54H75zV1dB2AmNtlXsPt7tNQ6Q8kh2kU9DGL
 td8LZFq8lNlYE+IqBIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX9Hbea9kzfiTy
 UQ8hj3spu37MuTiJfP1MlVTaUmQshd/2ThFSICMLnSrZcVl2xfmdrLutJyEzC8iRN52gDNlSitU
 560tPphwdnUe2ANoi83n/GPXyGd0RWk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608080176

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Adreno 830 GPU present in SM8750 chipset belongs to the A8x family of
Adreno GPU. It is similar to Adreno 840 GPU with some meaningful
differences like GMEM size, register file size etc.

Describe A830 GPU and GMU nodes in SM8750 devicetree. Also, add the
qfprom node to describe the GPU speedbin fuse register.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 231 +++++++++++++++++++++++++++++++++++
 1 file changed, 231 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index eb3a6990ec30..6ddc8d3fdada 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2182,6 +2182,176 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44050001", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x6d000>,
+			      <0x0 0x03d9e000 0x0 0x2000>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x0>,
+				 <&adreno_smmu 1 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
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
+				opp-160000000 {
+					opp-hz = /bits/ 64 <160000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-222000000 {
+					opp-hz = /bits/ 64 <222000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-342000000 {
+					opp-hz = /bits/ 64 <342000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-389000000 {
+					opp-hz = /bits/ 64 <389000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0xc8285ffd>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-443000000 {
+					opp-hz = /bits/ 64 <443000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0xc02e5ffd>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-525000000 {
+					opp-hz = /bits/ 64 <525000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0xc02e5ffd>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-607000000 {
+					opp-hz = /bits/ 64 <607000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <8171875>;
+					qcom,opp-acd-level = <0xa82e5ffd>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-660000000 {
+					opp-hz = /bits/ 64 <660000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <8171875>;
+					qcom,opp-acd-level = <0x882c5ffd>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-734000000 {
+					opp-hz = /bits/ 64 <734000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12449218>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-832000000 {
+					opp-hz = /bits/ 64 <832000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+					opp-supported-hw = <0x1f>;
+				};
+
+				opp-900000000-0 {
+					opp-hz = /bits/ 64 <900000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+					opp-supported-hw = <0x0f>;
+				};
+
+				/* Only applicable for SKUs which has 900Mhz as Fmax */
+				opp-900000000-1 {
+					opp-hz = /bits/ 64 <900000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <18597656>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+					opp-supported-hw = <0x10>;
+				};
+
+				opp-967000000 {
+					opp-hz = /bits/ 64 <967000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <18597656>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+					opp-supported-hw = <0x0f>;
+				};
+
+				opp-1050000000 {
+					opp-hz = /bits/ 64 <1050000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <18597656>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+					opp-supported-hw = <0x0f>;
+				};
+
+				opp-1100000000 {
+					opp-hz = /bits/ 64 <1100000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <18597656>;
+					qcom,opp-acd-level = <0x88295ffd>;
+					opp-supported-hw = <0x05>;
+				};
+
+				opp-1150000000 {
+					opp-hz = /bits/ 64 <1150000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <18597656>;
+					qcom,opp-acd-level = <0x88295ffd>;
+					opp-supported-hw = <0x02>;
+				};
+
+				opp-1200000000 {
+					opp-hz = /bits/ 64 <1200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <18597656>;
+					qcom,opp-acd-level = <0x88295ffd>;
+					opp-supported-hw = <0x01>;
+				};
+			};
+		};
+
 		gxclkctl: clock-controller@3d64000 {
 			compatible = "qcom,sm8750-gxclkctl";
 			reg = <0x0 0x03d64000 0x0 0x6000>;
@@ -2193,6 +2363,55 @@ gxclkctl: clock-controller@3d64000 {
 			#power-domain-cells = <1>;
 		};
 
+		gmu: gmu@3d6c000 {
+			compatible = "qcom,adreno-gmu-830.1", "qcom,adreno-gmu";
+
+			reg = <0x0 0x03d6c000 0x0 0x32000>;
+			reg-names = "gmu";
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
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "hub";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gxclkctl GX_CLKCTL_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 5 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sm8750-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;
@@ -6019,6 +6238,18 @@ cpu_scp_lpri1: scp-sram-section@200 {
 			};
 		};
 
+		qfprom: efuse@221c8000 {
+			compatible = "qcom,sm8750-qfprom", "qcom,qfprom";
+			reg = <0x0 0x221c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@138 {
+				reg = <0x138 0x2>;
+				bits = <0 9>;
+			};
+		};
+
 		/* cluster0 */
 		pmu@240b3400 {
 			compatible = "qcom,sm8750-cpu-bwmon", "qcom,sdm845-bwmon";

-- 
2.54.0

