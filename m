Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A14D46D545
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091381; cv=none; b=T61MNYlqRcMOoizfDax7kT6oEZ7J008tGdyOzC9sJD5PMIgDgjeBqARz5vZGRGCuVK5/v7e7JbOGMkUsIN4d2yzlkDbfBammGSGznzgH5ODJN24I7FWe9uEovI7w/B4PF0o8dRIonzOurapB+smbac+ZuMmYLB5v4P4yuk90iRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091381; c=relaxed/simple;
	bh=rjKNf1uzaDHv4GGBTB8pZrw/GU88SDfnkNhNQc1gHIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dAw2rvz2J4dxCkGWRQ11ZY/oE/ADpgdpeqVJJpu0xyanw8dY6DX5ywHRIKGLHN7EKSU49KyV0Do+bY1+RWnZ5tzLRSKyP4QYw77tJ1PGX3DXwPRzfRNMUekffMD87QmOBmTByRpG4MW84ex6LcS+VajsRVTuXEvjDrnMhrRPEKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUrKBif9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/Quhk3s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUrKBif9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/Quhk3s"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778FWqn4063303
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nfm27J04Y+o2o2lcWzDnwVQu7dQ+toG9EacdwIwvdH8=; b=BUrKBif91OnXo2gs
	GYVYDCVdqfzfusCXaQ65eOc3Bok5kMlbb29PQ8N7n8UUWQgIHnRtw1L4/OfdMbVQ
	/+cmWruUUDKG3d/okvVY54q+eyxIadkebJQ+9z1qSYh7rvdsTNOhWtZ9Bn3zP0e2
	onox+pVBa5Blzl321Ip5310SbJdU9/5a8BXBL5gVJvyfViv+BxgmjjpUFVYafv7+
	6/0Ch3L4IHyEV3yb6CSRXD23Ls9yGT9R/bQnQSXep6kDY23YMilrB9Nvs9f+lwct
	TtpXht3H+63kJsxKFHHYOUlr5ticZ60Feo0ivP58FQ4XRQ7P5he+1iwkxC2mjveh
	Ro07IQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hax84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:29:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so38891115ad.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091379; x=1786696179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nfm27J04Y+o2o2lcWzDnwVQu7dQ+toG9EacdwIwvdH8=;
        b=S/Quhk3svTeXijt2WLFe8GIkDcjomIVb4EFX3nxpGNNl28DcpG1V/bSpPq9cEvsS0m
         vLBLJJrHFmcamulP9yj15G7qQTYY7Rj6mB8IOR8Et4/bqr5kZDBrQLBk5vNrqL9b7OsN
         Yuaqkque7azYSaHGZbXI4+G7NTeqaJuQdFdoocbi7s5RssP2P9F/BiTynzo4HizuqCU+
         wKiBJQPWGDSB2DKAOL2kDtCEMU/wsMGcEzLNrvzogTvnJMVX4oomSEm3INM4xxHdrOfP
         uPB3littQE6AMn2oRVsWvpWS1qN6mqw9io1WjbVEChw/ifKYnX3WKYY4SejN5oXO4z01
         CP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091379; x=1786696179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nfm27J04Y+o2o2lcWzDnwVQu7dQ+toG9EacdwIwvdH8=;
        b=CcSE7lnTDJMyMmEuZA5H1aDbG3krgZYf49qbEoEwrvR4K/phohKY4Tjx4RlsFx9YRT
         suzE1742Me7fZ6grjzGNTna91aOIl9A6rDqpAojZnK/mF3tjEwrI//yeDQlny15WGNCS
         dz4Z4O1lUGQjHMw0AxG9nfTT3BGHsqy8EyBntvPkGpSO8sWHUL0qmSVCj+IzUsprMtEc
         ykuamm2MSWP99jeagYuQ0BdtEnBQrmnXtEqKWI+gfCcFLerwFDZotcVqoA2WEpjmCLYU
         42heszqqvx3lbe0JBR23pZLgt0VJJAoqlLcb5cF+Kk8B0SX7747zTz3C1p0ukwMD9y/9
         WoGw==
X-Forwarded-Encrypted: i=1; AHgh+RphWASVDg6HdyelfTblPgt4N/LRd8us+QHtJ++EmURJn8kFpZJZbtepqp1EiIZ8mGTO1zA1C9GtkgtK@vger.kernel.org
X-Gm-Message-State: AOJu0YxqxcDP/J0VwwTaWAjdVemM4MrlhlFDk5Wnk43HldGSnTTg89Du
	rxwrMpl+G5PCkbRF5UTeksbnUuq/dMhQhvuAi8KUUrUf3bJzfpOCWfU/B0tiTOLO6FwSQx+c85A
	kP+nvCc50Xj+E4dg3A/MFLORK5DRxdVtT//cEVM4Hxu+wMX3BFIyzSiJp3BlaoIUM
X-Gm-Gg: AR+sD10A55ds3vPpttcL63oXh+NnJUcuGTNaGxqgz2jDs1nr0XOcfBdkSKMmmhwZjnp
	TbBmdjO80ny+nEUXk3KvLsC8L/Ev3R86MGPG8pYMQgKXCaojDxL5KsQ2tPKfIuA4/F9nAR+YcZa
	OB6AdbLga4El2d/8FEytwqIX3/B83gddHmiAzrbjFeOcO6/a35J05zgOMI4CJWwpTPL2iIWIt22
	5N+59y1ztuYz83XOVVGuDVUSc8FvzzMD6lnyw0jhKMmW/exZFvmrXPup+lTFl/tT1mzl/hfyHp7
	dX1tTzVTXK45r5rAkXuf6jyLWpnpebypqWmaRT0AynrYxVTI/u+Ld/7tVuKMDKBlbG80+IoBcrr
	wbTP5isjcOcKoN5WDQMOeZppQKaPOkkKFpaY=
X-Received: by 2002:a05:6a21:7116:b0:3c0:b55a:80ff with SMTP id adf61e73a8af0-3cb85ecb5f7mr27820207637.24.1786091378787;
        Fri, 07 Aug 2026 01:29:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:7116:b0:3c0:b55a:80ff with SMTP id adf61e73a8af0-3cb85ecb5f7mr27820150637.24.1786091378348;
        Fri, 07 Aug 2026 01:29:38 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:29:37 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:55:04 +0530
Subject: [PATCH 20/22] arm64: dts: qcom: sm6115: Reserve low IOVA range for
 Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-20-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1921;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=rjKNf1uzaDHv4GGBTB8pZrw/GU88SDfnkNhNQc1gHIc=;
 b=YzCJWuLZ7vaXO9Gymk3tIZ+lQIGcQkrOzeSWun/a27Cis2FBfb+/745+JNcTroZVUe5k64B0+
 Rl79iBcNbiGDo4QPVnqAIxC8qwq6D0m21YR1KnQ5mgmK67eEa9zpG8x
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a759773 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v_iTCYMvPXNbf3EXzDAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: uKZhlqzMVkmutYrRTsfqQctYH6jgIQJB
X-Proofpoint-ORIG-GUID: uKZhlqzMVkmutYrRTsfqQctYH6jgIQJB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX4EcDWal9aBP1
 3iaANxXFpur7C78Vz/F+QNlnBQX01iNj+O69OePiFjBVoaKyOLsdvhSQxlX6jdusMQHron2h8Ez
 iHEdoWbCeku3/StdKUuhynv4VHSmT1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX2gJsPKPHiUhK
 DGqYptJepsYSOu8iO+AYCcBnocnumsaosgryI8y6BuRPiGXdpS6L0zBfFLPWkbYt/wo+oi0HxAn
 ZXaN+sMzjiSIr9D5kaTfq8xaMgw/h8qdf1ppt5aZk7l1+obussmoucDZ7MSMYVX7zNoazLnWw6W
 zyxklr8WvkTq6HzSK05zNlboYbJ6RWFpbFgnH9Smh/SW5u7eJuhb1R+X8XJqfuwikZXH3KGDkNL
 rXfJiqjcNHsPChAgYSsFzMu3K0KaPeSs6fvZAhTBSSSl34j2mo+6sdZYWICa53jYbaVN8AFpaPg
 ZRYORBol+sTsPsSdMBBShfkOlU66KnQkVMiho0vwsfY+DEx1v+PIiv1pr+r+dFmeSoVMU0hVenA
 dChMi6VQrzWlRg15zbS0xd0kcr5ID5C2brwu1kQuNoyPpB6BcL0rVItQNKoq+pMoZF3mAXGvEWo
 m+kXOX3yVvNtxSOzbAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Venus VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the venus node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: e0511284f0c1 ("arm64: dts: qcom: sm6115: add venus device")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 3520802d1fed57fa722371424cb11a33b277de1a..93f4eb8d18a7161fdee2ab67cdc0b4e8f327e9ee 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -532,6 +532,17 @@ rmtfs_mem: memory@89b01000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
 		};
+
+		/*
+		 * The Venus VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		venus_iova: venus-iova {
+			iommu-addresses = <&venus 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -1880,7 +1891,7 @@ venus: video-codec@5a00000 {
 				      "vcodec0_core",
 				      "vcodec0_bus";
 
-			memory-region = <&pil_video_mem>;
+			memory-region = <&pil_video_mem>, <&venus_iova>;
 			iommus = <&apps_smmu 0x860 0x0>,
 				 <&apps_smmu 0x880 0x0>;
 

-- 
2.34.1

