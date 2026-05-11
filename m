Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109FA383301
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538242; cv=none; b=fVQaMHoUCGqiI65urS1YY/xp79AZYcy/wMoNnqpw765PHeUj4oq8u+hRy0najb7r/nlaxz6tjwVeAKDLFGXcS/yK0onOBo/9ubj5LYmYvMOPUVCziZWIfEfDra70q2UOt3XKoAnZgEP/plot17rzSBXVjGMsYKq7JrNZ71CEVL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538242; c=relaxed/simple;
	bh=E+1GLuDyRo5xJsPchj6gbw1ljk884w3Mcmg6k+BHHl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJjRX//utveMCBcB+3csfgSJwVUikj9vWBiA7rrH/g4JXLmMhxdzwh0zWwZAJW7g+I9XxWIYq9W4L81ihdWFGcmABpHXhp3KHH83eYKgTYwcZsxHNqrbsdJ7qWXbxx+MBe0YMobaMM3dzvx7u1Vank7kTGEbmqp+fnvoLJhaSLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3DMw+w+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSRXRCm4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3DMw+w+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSRXRCm4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6mdv3384821
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=; b=b3DMw+w+N/9GxBUS
	1NB5SWDv4tBz7QN0HA/VcqtKp0QGd1l9LFbuooFJCjvq9aMt98zzNa5Abs68fRA+
	cLQZTb+XaFkeRQxPHcl4NdKM210kU8S0xUZ4iJEssut9MJQ628Gew+i4YvfoDjeM
	Y8EJdSoIkd30D5tJWHr183dw8Wvr6CqUWrvfcMHiK/E9uMHeiONFwi3QWlDh+Is7
	Eymm1a3jPTpHYJOJA29abjOuEOcrMjFA6lXrYeacIi7oDfzfsLnyNKItau6eynO5
	QtFHv8YxboWx1SDVOQCM3rhHqieAqBbbmf5sX+ooEkBXBvzprMos1nFXtRGcA+ig
	vL1a4g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4gewv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:23:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba7662827fso42567665ad.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538239; x=1779143039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=;
        b=ZSRXRCm4uGSc17iVqez83PkHJmKub4iTkhSivPhw2zpKmCLdD8YuIco5MCZqcpWKEH
         ItHRzxj67g2rhsQRjE0GnA74EmZQkOaXisLxMp8znuMN+3DBTxmHvyr3NVZs5lHyiMMy
         lN9gdMXYPdpkqE0+h3ewDColfdpH1Kfl6DKkGtVFBHzMoLsgLhn0DBYAj4D6FutDLvDX
         gcevPODOgnWZFrnCoS4dSnrUqulBC6xf5PfCrq97Y3Fq7FmBNMwVGniHOjP3mT2b/wfX
         m6T/lIUlOaf/lA8C9ntd3CsIe1nZ75L8JULOfbvmZBmcloBvpFPQsvglQt8kNbEp5Mp+
         nmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538239; x=1779143039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=;
        b=YkfsrE8nSvDj+XaYN+oc+QWgo2WfY7N/FszW5mUAewB7u5k2V9ov/zoH/biHVIFgbA
         SlgGSIvRNsOIv+wgOSTuci1Y9QFcEtGfouNLSZZxx61+RDy3ozawZP48Kr7bV4yceizw
         OuVdVdQVn8Tctg4ooEJDAtM5nqmYa2idh9cGRYIwlEyTq4bzWK2TgDqwHWCZ431R9kcO
         X003vOIQo1lY2BRTCYLWF6yvXlhnLf83cjcm4P4KFNX2ClZoj9SpVbOGvT5uAr+Qc42k
         7cbtPn7ZzJL0IYtrqOPp3O4BlBqqTSLATS4ctQqkFeObezOeLYeNGPrG2RO0XaxLiC5N
         QEKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Z0JN+/bBmqBVRnuK1iffV9IGPc0Kiprmt5KS9nnJA4Hg7rCWPv1u7dvRDXw9kbsGOUUv9+8V8rK5r@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFf4bKq9Nay2qPj6Tn8KyLJFuZaJSYCtCjZ4CWz70DyIUxM0r
	yjlwmYsbRv513Uin9U4kKJo56VboOdFJu/Q9BcLhSkdUE7aAqA+cm0XwwEMLEZxEZus9CSLFCHx
	+gaU/M8tG9vaYAgdlag0Q6H3QOfmYjyaKhBYjZyMD2f5g5ds0EzuIMgRDpICxsY7m
X-Gm-Gg: Acq92OFXoeRflnWzzxudNeYZgqnjZYZhOn99SFp22N+yaclkOud+hQf0QIAlJ9VjkvR
	ElAaV9qShNqyPnUlgWhw3HHlaQAEbhXpNWWhILojbdSD5UrsM8Jr8N5/DBGRrn+U8pwO5T85PTa
	Rw2ntjvSb3YbdzUWKL6cIa7bz3mZY1g4GwZsB5QiHOJVs9rE24qydXJQkGseOS40Zru00vPfyFB
	60CBVENghgViz09QXO2u3KxDD9hdlGnGwxIPb70kKrShfYK6HYLrxkfUjk7aAiR5WH5fsnDvQNN
	uSgU7esBpzRCT0EilDNnakiWnhvdK8AS1JNBuruLCkYJtYNa5MReA2GJIYhKVhMst4lqBb9CarW
	CmOKGu3jNz2Y+XOzK6jlxhMVXC9eWRkIx5o9gyTwv7HZXkg==
X-Received: by 2002:a05:6a20:9144:b0:39f:c93e:c7f7 with SMTP id adf61e73a8af0-3acc3538b93mr1274560637.0.1778538238653;
        Mon, 11 May 2026 15:23:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:9144:b0:39f:c93e:c7f7 with SMTP id adf61e73a8af0-3acc3538b93mr1274515637.0.1778538238163;
        Mon, 11 May 2026 15:23:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:17 +0530
Subject: [PATCH 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
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
        Qingqing Zhou <quic_qqzhou@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=2262;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=rscpl8C0bBlWpsGZRfQr8cfwna3yHTFswaa+FyKvunw=;
 b=coHh6zS2m9SCj16Gzyz7t9BkZ8HEBuHE4W4uPRbQpDal5KptphD8Sputqj9jokSZ2d48QX9E4
 JAbZtSW1QrVCU4M5AZnST+pgHSljyAF0noTa/1EOUAF/8SwP5RojBAi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a0256ff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfXyylQ3ebUnhZK
 iog+gHVDqXFgmiRA0P67yPaWkVTuGxxqqdPfrdxQFqvu8GASeWkPnMLyP9Bmvh04PKC5XBZTSFu
 dStoNS2ovsNX5qOvtbl2mbPc+aumcN+35OoYlIUqDNLlzHzUfke7KUdbE86sOQTyOrSowTvznpA
 mZTfNpg109L3lU6Rw44erSgaLV6i/JLmjc239KWd+6nWOl7/yJ+VFxvbDB03ga4bLDKjj6OXiRH
 +htcd6SYdGQEuzfizITxVxOZ9vFex0KD+Ys4Ugl8DA8zU6nOnD7TiADK4NznNANmstxKHQdEWu8
 iTIv+z7PAsIaMMHr+2S8jNGN6a+4dkjUp2jMhky5YAjDPiftN+ZvkgF1RXdM71GZYA8aqwXOEIy
 xjapdtCOOvoSkfd21HpszMBh2jCBv2EQxhVyfMKEOwgeCeHTOmKn61OY6swMigxyRFAgDjoT2mA
 tduykb7jtmDfM9iHiOA==
X-Proofpoint-ORIG-GUID: 712DuRP7JqE_NdGHWorCDYm6ywWfZfB4
X-Proofpoint-GUID: 712DuRP7JqE_NdGHWorCDYm6ywWfZfB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110236

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for kaanapali platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bab654bbd6d0..26a4de9c8d45 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2597,6 +2597,47 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,kaanapali-smmu-500", "qcom,adreno-smmu",
+					"qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x3da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;

-- 
2.51.0

