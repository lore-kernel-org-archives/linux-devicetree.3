Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956457;
	b=2sRsXGygct6KYlBWGSCglQfzMywhSVjGw3hNK1iCNCbV8p/F6QBvwLuXfTw2p1UD/tOc
	 iG8PFeaS7Vi0TxXQRX6lBBIpxpIyhtWxigW1g7bEuL4FIY5xbd9TPc7ugFlBjU1vr8EMP
	 QsjDaaFYYCR4LByS3G8y3xAqQ+wkhXHPRA0LIzsVHxEjvh9Kkm4edegCy8mwCGap0fx3g
	 i/Wx0k2QIWkCenyzGfg9xiplMkt0/PgP7RZdOLZrP5tPm8gKygj0nVfNkWOS/aMtLLaa7
	 kTsBLY/Nn9GuH4sUZtOh7gPVuLFQoN9bly+cw6sjrkEN1uZBbELYtVdzV4laIzmUudQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=;
	b=4aGdLU+VcPV2Y/xXdtn+ZSv/FGi/vv5cSyRcDJPJ+/Q6YC6+TgBsPHcSesiMV195y/SM
	 BGZgxK0Z9CZ/g9CkPWI4HgIit09aL5Us+vqoSNSfFMgRxcsgTeQUU17Ik8ctqD9cLXGdv
	 01u0WbyQ/78gqBvCwJ3UsNyJln9hMigLYOWpFAM/ZbODf4s2d7HErjfl1HnhKe/SCbJ0n
	 w+Hr+l8R7p5WFJrNb5hvbpQSqdZQ1yWrbH61mJoJi1YMA0ji40dURTfGijUqS7wUdZCVC
	 KjR6kBytCBU9UlGTeAIdbWqmNZPOPm2CLYLgWxD4Oub5SoC1ic13Qz7LM4vilGak5Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3iKEJDW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRk2Maon;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C3F606A337
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C3F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3iKEJDW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRk2Maon
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMepWF1958023
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=; b=g3iKEJDW7pcwY9Tk
	3PkHwbi6tdb1uTlCZBxozCD6XYBTtFgBDgscb1reT0I2gVnqEidafeh4Oy/6HU7u
	g2zcy7qYmOOxZMVIkv9grByjJcGYFBoPQrKLuhNcBOUwEw+aq5P/sU23usM5OI0l
	94tlYEFv8CNwqinrXNxse2XsXSbW5r/dOn/w3lwt9MqBz+PX56EOnMaR8I3Z//64
	rxnfYWUnrYDaRUTXvk9uRNfm45wCSkJHsq/Gb7sieQGcC0Dp/Lm0sVVTddQZOAf+
	9sY/q/4dApYPuOv7BRBC+CqFhRq1um0ikoWaqteZ/uqPy//3SQYJdqcdU2Zc+gCg
	zDAN3Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv982jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso70606eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956454; x=1795561254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=;
        b=kRk2Maon/sG/r7pPgtgFQ8Z8mc3n0Ilp9nKDP9cHcrCtDsYCBBXivLU6zzopIFUPDF
         yXbAeLtRtwf+iMeWj3Cl4QtRyFyjMmuaAIs9I3tJSNpTBT6NO3wwoIHxmJyD9LYHTd4a
         4F3ZX+VYf6jSYeQfSPibZTHsAiHXLKx58zZERLPVoXfn3+4N8upZyKzqBYiTvcunRMV1
         dM9Kgx3S7aZdGG1mi+QCe+sYZXP59Y++1C6Ie4RzXnrORC5mJR2CnHZ69nSJ/2DdUkuy
         rMAam97nZr5wIq6xQmAJw7wNMznsmVQ4u5EZ3gsYUyeQkBMdIfBAySz/yQSAqT11WHZ6
         6emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956454; x=1795561254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjPMvS6dNIgWnwxHq7t2pgQdKhhFdoLT9gKd8NpYaXs=;
        b=R1IeO+oY8gkrEDoydWu0SfBs7owmkIcX/ZbqKIqaA94BVkeWA8ADTvXd/kmj401J31
         OwJbeSTygBfh18MEgAePMG9izwgqi+T72gfvqLnoY1lyiUBk65h0+WGpwe4/5xy/gxTW
         NN0UoDTyCxSyXVqE+F3U0zaqSf/HWLXs0F8ZdUxgqymm/Lk6D0xTKgd6pSGVKYIFpP6t
         KmXN1wzVK3BqBQNIBolh3uR4jEta2RF9BZVEEPwGEWm4oruQu7/NP+2sCjn4TcqMSkT3
         M7yO0308vJuEsveafsOnRKhf3F30QNCe5Iu+gN19o9pC3kuYHqUXYQcgRTAAfiVc4Aqk
         j9sA==
X-Forwarded-Encrypted: i=1; AL+hErHDmz8YjyymCMUbiuGK0M8R88BE0CicLmDT3dpCosNKiVEDUmlfhx12/cNuxoqsEFiNLaM7QHPRgEui@vger.kernel.org
X-Gm-Message-State: APuU4Z+EsXtaiNuryr6JWJwLTq9Qvu4ISlyac/zy0dkogZDmA/Hiax1L
	fjnhlOF6rIS+I6gnR0QevQy4Oqf0AUiWMLs+XY1cJEUGx7ERc64/a3FNVVDDpP3l8inYD9ggO8Z
	46KI3t5bsVrp/cNqDQ0MFF9Rhf+/f2uwSP6QIdT2Khy0GSV2ZzbGrBgBCC8Jt3vTG
X-Gm-Gg: AYBFou2GZnAQHjGTFcyPTKfFaIJ4cUDIDPxz0deYU/PVgDnYvRvLXJa2m1OArRZLrY8
	35bJtXx0MDV+nUjkY2HddeXfBCUfo/MpA6EDItNpETgohEqYuuehlMI7Sj3P0OQUV5+FOX+uXMi
	FFIrbcaF+g2sV8SVmcwK1+HcC9y3coRpWDNalwCAiWjBNTJgbCFhpUAGgrg/6fJNFW0gZB24r12
	MFZOkXHlNcfgQ9hVk7yxm62NfOS4IOk4WPG4t6dETycTHmaLlUbNMLdXYLgfS4Dstd7s2MkI/zY
	fJ6xlni9Pa26oONp1AnFuygKAeq5o+99rh/V+pgFtFyOoEXIIeoo9iTRoYcrkhMQygbuLAwVlq6
	lEhDNAq+bpmA8FqtI0Yu0db0POgPekWkOLmhyTH9wyZaOCpaERjCaeORcL7pFJALkTPhjv3m19w
	==
X-Received: by 2002:a05:701a:8458:10b0:151:2e62:fe4b with SMTP id a92af1059eb24-1b543cdf789mr948003c88.23.1794956453953;
        Tue, 17 Nov 2026 15:00:53 -0800 (PST)
X-Received: by 2002:a05:701a:8458:10b0:151:2e62:fe4b with SMTP id a92af1059eb24-1b543cdf789mr947951c88.23.1794956453138;
        Tue, 17 Nov 2026 15:00:53 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:52 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:06 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: nord: Add GPU and GMU nodes
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
Message-Id: <20261118-nord-gpu1-v2-3-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=4762;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xyYYgqzcHaqG6oN0uFpCZ3eFSIuUWGDcbZDkjY5Kcic=;
 b=5UxRY37gGgict8xRQRg+ixx8UaW6DFONQtSdqc6NcTDJvUa9OR3MHLVLYYFAcnS5GdS1TuycV
 fEobgq7L4YKC2N62k/Wh8HGLMHpWCdcDZflTH+YN7AEQNagWDkbr56q
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX7GsdP9Ql0s+U
 ETcu5w5LLMGIX/G+NUtG9Q+xj/cvuH9V9P89bCqyVCC1ixXZ8LJnRfQB5LAn7yEmg7nh8LCUANJ
 V6kI6/5aQrCBfSIZEXE+qoaSJFbzmCE=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afcdca7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FdsHoUj-PjsiTO6IAGgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX7qjnY//TzwjW
 At2/AImqoz+AoFTfY3eWdOXXQVJlZDwmkesI8YGS6XR9FQMP1tEi5z8a8eRu4YApvQrPqkZmDqM
 7gBfjsbtFpDcUfmsW4/Wb6Zne71wp4D0eXXHHS5Q4tj6KO30e6yq7ypJ75FfptWTXsNfiVBmYA7
 sh76nsoXTakyuDFeOw76uoiZtepyyFOVclDL5LmDkYJMyxbZM1e3L9X732SdRzqREOoCWz4KN11
 fgzuJfo/rvPHvL4ilGRl3+MfhvZCIQsSpDTFCHp+58HAXMWMTTNXdbitw9ySeiX+my8C12ivkaD
 KNNiU49ZPPGbOLVBsAEXg19kjhbfPO1+JU0WBkLRLX0XKXkAIsji7+DFaeqXAZ9iPToqOUyNy8L
 U/4PdyHoMVVKaTyF56ZR2AJ4fG99nOd3gAwTWZ42jm2VqVPg0RiwQWHVLtvZaO9Ej8yfofgDnEY
 WnoZ39/uGA2qYhLMmRw==
X-Proofpoint-ORIG-GUID: jriZ5vYLY6_yamf-JyS304wWNU0rhXgK
X-Proofpoint-GUID: jriZ5vYLY6_yamf-JyS304wWNU0rhXgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Nord SoC integrates an Adreno 753 GPU as its primary GPU, belonging to
the A7xx Gen3 family, along with its Graphics Management Unit (GMU).

Add the GPU and GMU nodes together with their OPP tables. The GPU sits
behind adreno_smmu_0 and uses the gen71300 zap shader, while the GMU is
clocked and powered from GPUCC.

Following the existing Nord split, the SoC-invariant properties (reg,
interrupts, iommus, zap-shader) live in nord.dtsi with both nodes
disabled, while nord-embedded.dtsi adds the clocks, power domains,
interconnects and OPP tables that are only managed by the OS on the
Embedded (non-GearVM) variant.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 79 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 43 ++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 5a1520e436c6..e9e830bb727a 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -76,6 +76,85 @@ &crypto {
 	status = "okay";
 };
 
+&gmu_0 {
+	clocks = <&gpucc GPU_CC_AHB_CLK>,
+		 <&gpucc GPU_CC_CX_GMU_CLK>,
+		 <&gpucc GPU_CC_CXO_CLK>,
+		 <&nwgcc NW_GCC_HSCNOC_GPU_AXI_CLK>,
+		 <&gpucc GPU_CC_MEMNOC_GFX_CLK>,
+		 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+	clock-names = "ahb",
+		      "gmu",
+		      "cxo",
+		      "axi",
+		      "memnoc",
+		      "hub";
+
+	power-domains = <&gpucc GPU_CC_CX_GDSC>,
+			<&gpucc GPU_CC_GX_GDSC>;
+	power-domain-names = "cx",
+			     "gx";
+
+	operating-points-v2 = <&gmu_opp_table_0>;
+
+	gmu_opp_table_0: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+		};
+
+		opp-625000000 {
+			opp-hz = /bits/ 64 <625000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+		};
+	};
+};
+
+&gpu_0 {
+	operating-points-v2 = <&gpu_opp_table_0>;
+
+	interconnects = <&hscnoc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "gfx-mem";
+
+	gpu_opp_table_0: opp-table {
+		compatible = "operating-points-v2-adreno",
+			     "operating-points-v2";
+
+		opp-468000000 {
+			opp-hz = /bits/ 64 <468000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+			opp-peak-kBps = <781250>;
+		};
+
+		opp-625000000 {
+			opp-hz = /bits/ 64 <625000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <6075000>;
+		};
+
+		opp-735000000 {
+			opp-hz = /bits/ 64 <735000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+			opp-peak-kBps = <8175000>;
+		};
+
+		opp-854000000 {
+			opp-hz = /bits/ 64 <854000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			opp-peak-kBps = <10687500>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			opp-peak-kBps = <12450000>;
+		};
+	};
+};
+
 &i2c0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..36a422db8ea6 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1712,6 +1712,49 @@ tcsr: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0xa0000>;
 		};
 
+		gpu_0: gpu@3d00000 {
+			compatible = "qcom,adreno-43051701", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x2000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu_0 0 0x0>,
+				 <&adreno_smmu_0 1 0x0>;
+
+			qcom,gmu = <&gmu_0>;
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_0_zap_shader: zap-shader {
+				memory-region = <&gpu_microcode_mem>;
+			};
+		};
+
+		gmu_0: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-753.1", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x35000>,
+			      <0x0 0x03d50000 0x0 0x10000>,
+			      <0x0 0x0b2a0000 0x0 0x10000>;
+			reg-names = "gmu",
+				    "rscc",
+				    "gmu_pdc";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi",
+					  "gmu";
+
+			iommus = <&adreno_smmu_0 5 0x0>;
+
+			status = "disabled";
+		};
+
 		remoteproc_adsp: remoteproc@4c00000 {
 			compatible = "qcom,nord-adsp-pas";
 			reg = <0x0 0x04c00000 0x0 0x10000>;

-- 
2.55.0

