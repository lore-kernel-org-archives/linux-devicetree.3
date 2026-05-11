Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71032383312
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538249; cv=none; b=AfzSPM+D4oLxz5w+tR9Xix5o872S+ndF+UC47j2qPKRxqJnfhvdcVGI6uMM0PeTXHDiBszL7VIHPCyDSv76P+fpFjuT8vsIUk2Ni8vQbzjL7kOyo5s72F874PrlWskpur/r63QOUkAYNJR/12FAJ3S6QapeoCccO7W36Uygt1Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538249; c=relaxed/simple;
	bh=97HQIGbf+tNFlTRiyh8gUJ2fs1SWaMmQ0EPBudtudRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QxRwxYjKn/04JquGY4fMqHWXwe9PpljDulwkv2iqGZTtjGWfiJheFdLzoiX0NVuaB48dDNukp9QChRwQGZuJAl+X5biQdZ5GzcY01+senIZGtbKjLhKB63TxBCbk2WLXCxHO5yVmYPsXJ/pDDaXIkElE9Fdn5kp5eyC2MtZdnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CG8l9Pkv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpkCYn8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CG8l9Pkv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpkCYn8F"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6gkv2573888
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUPp2c9rAOL29gHVGIJXyIeP9TpBMN1OdAXgD2H+ohc=; b=CG8l9Pkvro36Dld4
	N/0dSJ66oyZTv3rClHs/r32KRRKZuk1OnZV5ZHWIsV2e/b3h6q7lxjL6QFcSb2qm
	JLNjdXW9dnssebTUeCvUdRH0M1FRxbFNFoE7FuHhfXMlszdbDO4ezcNvt68vJO5u
	bsml0ZEI7vZYmfsumcc7SPdF1h3RmaLR3AXRCNPi6SR4XfaMT7US/n7uyjMTFGOD
	2UgkFS67Xq2iRPlLmZ7rK+5Mcgf6StSyqBMTS2PMfdAOITQjGencCsLYvgcIcPAk
	/b8WyR+gkEmASOkZQkQH7KOlJScJ3NVm5Lpkyj/B3AvwbKMWqG+gcCln5Sq9peEL
	i8fgog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28fc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso3388192b3a.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538247; x=1779143047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUPp2c9rAOL29gHVGIJXyIeP9TpBMN1OdAXgD2H+ohc=;
        b=dpkCYn8FVf9TNXfqIUGujke4rXrmFbMd9+ervf+7l6HpfxYGDqz0HVnkd70vyqBxBO
         HbIS+RjX1dbkfaWbPm7zZDlkigFAKlM5kJ6j5CbW8zcuCyXemxpxWwR8FciHVnEqkTe3
         9XojrpKSzlhiImPGDPzFob1h1DfRrHuwsGvoC9rpcaMm0q+d5KVJm6sebAKrxxHVn3BJ
         6NTopKFX9rIxKpp/oNwAnUHI4WHxiWePj9SYicZ9zkx4ogu0ASWIjb+e9tguKuA8GSkx
         /OSD2lhAEzYnSPYkhtobzatItbWZBdoAmSUojMwRUfPipl5w3kuxVuVyg0vj5rkm17ue
         Vt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538247; x=1779143047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NUPp2c9rAOL29gHVGIJXyIeP9TpBMN1OdAXgD2H+ohc=;
        b=MNEMYM4cZMhd2xv+0H9Uo2MrZ+72WMURxM+urUX2tDS62Kv+6w8VCO2g++QeM711Gf
         elSzLZC2sz90A1Y+Gx03CUCB8MeJJ5N4+aCLlU9LDrRWeVInYZDKm6LwQEfMQLWx0Z01
         T7f/yLs2Y4EnUVmWJKOXNddoYA+RBRw5qgINFfDI36rg0GpT0DYh7G32EnBf5GhDNm0m
         16b/KLFoExji8ksdqeeNi07FYsC4s1xbZD9geQKWeAXu7BkKfVJNx+/ITF+UyMfXpeXY
         dc1Xwi+apRi0FVpN9UH+nzuXhJN8BHjjZ2AcRHl3Au4mtCpsBqM5G7d9Qx/jNloH+aKx
         K8pQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zlQYjJ3fJBK8cX2/VraMQvcNYwPL2Ls06XglvXFqfhS50MF5ZIl8KCFKm61GysWhRY1sguXnCHXwf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/JqwxbI/74qnNlEg0qJfndqjxTRaD+CyUG3VPiwC6fuPAoQ8C
	SWKig7Z0mFv8A9MJJ2L2GUAqnSRYxS879IEEAAVbD8TlorBBSJOETHwc29dtTHoNBP8aO14v4/v
	7PpycZyvIrtQyxgfNzMildG4zQnoDKvv0IJFzMeltuXKFLTmwwBmxjtcO+SZUF95tJlvogSTi
X-Gm-Gg: Acq92OFEFwz4kPcGje5WspiYTuAAH2uGcaVOLhXpK6d+IoNpmEVEw8uwe6vsMugSOaY
	qcJpg3knUzS9RxKVzHGKXHaz9SOHr0AIVQijOwu2wwxbuq/Cd9/IiIr76Ot8zCzBJ8h4oFYHYQk
	Uc3ZTBhh8VeFWU+i10sorNKVG8+iWDBFTv4ZyHlA5MsVFDJW0JwGDJSdTFVTahbzz+SKknluEL6
	jBWtSVXFEjaMssO6SbtyIf9STb1cKyS6KEfwCvKnmcpr+luHtHopFURGkJECBQWQRCfKPFzq9qC
	aiWXiVq9UHndIcSofXCcYHDmXNBbzEwwIuVnSOWllrF9/WIjzmB4Vrg4qb6zTZaIiUMa8BHL05m
	sAsCXWNJFbMSLX2/JiVlXtJvbH7R7hcMegoEZKe8o7KkDcQ==
X-Received: by 2002:a05:6a00:a90f:b0:838:af72:fb44 with SMTP id d2e1a72fcca58-83cf4f760e7mr18257633b3a.2.1778538246802;
        Mon, 11 May 2026 15:24:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:a90f:b0:838:af72:fb44 with SMTP id d2e1a72fcca58-83cf4f760e7mr18257605b3a.2.1778538246344;
        Mon, 11 May 2026 15:24:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:18 +0530
Subject: [PATCH 4/8] arm64: dts: qcom: kaanapali: Add qfprom node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=1012;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qA59djGG78P3MNRfB1Y8EMktq/ELkcaIx0EmOPVu47I=;
 b=9OvPBcF1MZb4Ksy60cJdP9QxS6+kk6zi2B0H2ygRxmneK9+uTtViTgI5ljZCjPD/i/sq+fEEV
 0s0G6D2JEOpDKJB6PzrAU5NDlmvdjlzdEQD3pg3eLjw+GXlyZfoTeaD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a025707 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: QMw6AdylRTstk1SdKvYREIBZboH6A4gO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX5Yyqvj8GF6If
 dNW4J3lF8BDGVdZurU9s/c0Y5Ig+UZz/5afacMPj5T4wCRYCliTfB1b3dXGx4RzEO/un97j1hrs
 ezQtu/daRx8kYR333yaLJvOpDgTwNaKMqmFHyCF+tR1vvb6z7BhUrtD4JR12L0aBdwZ4EsZ4Tyq
 3XkocTrHBOXGxCtE4VF+QBI2mFChPpdPPLg2OLHYVQ2i8dzH4jdd7NmgjK27UmiWSqtUOsRmbn6
 Mert+Ab/MdRfoAcOaXWMHG5US2zxo4k7mfRdxPmDBAj5y5j++fbm9d9bH5q5huh2E1CCXEoxPEi
 gODUpBx7/byvsmAaLLS34ZKpufPGbschrJ3y0VH9pIqGqow/hUc82/E2BlSnoQuRdyys52M0G8d
 KuQGMRN/F+gB1XGzolHkWm+ubd8jwtfRUXfaXl2Cbyogxj9f5AXRWmwqBZDivegEoBhnLLkgDQT
 q86JnX9a7ORbPirDQJw==
X-Proofpoint-ORIG-GUID: QMw6AdylRTstk1SdKvYREIBZboH6A4gO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236

From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Add the qfprom node and gpu related subnodes on Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 26a4de9c8d45..0211fc9f8c88 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5868,6 +5868,18 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		efuse@221c8000 {
+			compatible = "qcom,kaanapali-qfprom", "qcom,qfprom";
+			reg = <0x0 0x221c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@142 {
+				reg = <0x142 0x2>;
+				bits = <3 9>;
+			};
+		};
+
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.51.0

