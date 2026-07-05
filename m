Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E43290AD
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238494; cv=none; b=TabxmidgxIlKHAJDfIGsS/KFgfzCYxKi/RPNzS0eC03V5jARH5WO7cVn4Zw+Sf+1YhyvZAWRVgxoii7c8hCnxHc4OEwessylKJyCj60d5GDuthZKCzJatsjcVFe0O1Pvc6AB6i5FI/NMxCI0aderbUNw1Qvg0JmVcAyfwOtYtQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238494; c=relaxed/simple;
	bh=G0Zey0vCB0Bai+o0HIhDN6EVy1kYwW9UByIsSgvhH78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvWKurTKqqIX0HMdBU+wQsAhMGe5bjRZgQ9cUuQnFPNtgaVg6QB8Cn5tfWkpVNNyI6aPMHUNWPYewt4rENAwBHeBAib8XlFoBqtLmAtrjO34wtRyoSDHTxCaXxEzgXlxI5JFGuZxKN0UBeKRkyWdzVTrsVjEWpVu22mwzMBbMgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cC1TzVjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEs8xQSt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cC1TzVjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEs8xQSt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6651jLrg258736
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 08:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HQ9M/4GETx2H9TaIH+gNmu1Gg6SM2o69SmVk1KgoZxg=; b=cC1TzVjM+aQ5i25p
	CqQ8uKZCejk0meDh+G6X6/lLS1Tc2HdI8996eWYDyjTJNLGz/bzVg5GEl/Ow0wSM
	px7b/ZJuiCwlvnyIM27S8jg35QHM6k7f6vXhaTJUZ0b4d9kcFjxuRLVjU/KEcJ5e
	VboHEkz7v2zA5TUkRgsjjt8X5amJ5eL/3F9UUbxQgb3AckGcGrF2MMK9FM7mnZlj
	LdauW0SKv83vdGsypcC6U5tZE0J5UdL5o1xbdTLVNVDKTgLWbux+IBBasMpEdF5m
	NzbDH0PSQNkriDn01UD8xVZcXEr4vMfD3G3IqvaTExjU+9Z40ChtrPPDV6clDQKB
	VpWrtA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txej7mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:01:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so2305308a91.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238490; x=1783843290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ9M/4GETx2H9TaIH+gNmu1Gg6SM2o69SmVk1KgoZxg=;
        b=IEs8xQStjj472lI7rzP/NERSoOPLyhfGDmMBRlMstbWTVvbvNaAifp+flMMtffaUBP
         9t3hp+/5EhqFE7D+zTakl23w6gd2LcHXEQowJALK1uzXVp/KQ0KWUfMt2PZF5bUvEacy
         pKiHlLAKzQaR880WUT/jj6jOPgFNCZ3kP0bFwR/3wh7VnGsCpWNHwMrKmyAGsKQlZV5w
         L6TLubEYdJn+C/ruVO+thYY9mtcBpkkFlyslIM7gB1dkg8CsXTNBaNoqo9Nq6Jrac9TE
         uLD14r6QtLtkGQfn1bVOSNhV57khJUCOuQf64N/pONm/woN0ZDB9nwjtHqOmtsOAKX6y
         TCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238490; x=1783843290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HQ9M/4GETx2H9TaIH+gNmu1Gg6SM2o69SmVk1KgoZxg=;
        b=Fnhfgjr1XC4rXGrIu5eA5ZQ8GFc9GZssgnkzD9KLJbWWIv3E2xvz9BGe4wICJ+huVK
         1MsN9Yun2f5ivM2et/4Fcwm0y3XoXB6Qf+Q1BWItl9inFMFPsDFCd4BKcQn7DAgpKQIU
         uwF77d6MmkEVYgqM8E2GxVQ3pRpDnEUtIspoohZ7eRrhmkajmFjQ3tFWJ6wOUW7C5xf4
         BovP7n68gf89TBOqncWsa0IkWXzyMvnFE54m3TPPZlEmw8bjPORO45Zsnqz9R6B7Lmlp
         me7PZGli8942gggmPYL4RCrkdxlnQg/HtEbxRepemsS9jsZL99yTcdoINXipAM4SzyRs
         R6UQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiC5Sae7KsgMATuCboPjhikDTVLMpHHhIvrucxLiMjloZSvq6zc1/qpO4+4L1p7KjXcwqf2ZeLV1R/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgt/PKjETclcDglXHsl0c8XtSAKx4DV5hVwfQtRawRYYI+hjR1
	D7ee6m97QglkrsK8ARTUougDIU/sQYkmjgCnT/k5Uzg9jNlXgFXFjpC7bS2v3wghoZ+WZOyNMUJ
	2r3WmYpMI93tum6DqvAOV52SZ3BddUK1VIspG037PgON0EN11UIx6X+rDwzvn8WVH
X-Gm-Gg: AfdE7clAyzE9DTJUjSuEeS5YvEtYaWnCPiC7pFKiTQGq9IwkewRpNj1j/0c2Fadl9Ob
	dY0bGJXFULV3tMe50JVy4zt+swxgOYIT7rJZJRw7Eyq2RaZKCPxNVtx0w6RQDuxudTXyb1HVpr1
	vvKeMcUutrbXkWUbGU21wu55HwlbeWpiDNj9q9L2PkDTfdkUdLeG1Rj9c4ugQeLYHu46Kc4f+no
	dI9xPhgWYNrWlzsNbTH8eu7p6UQXNrA78ZxFiPTgi6yeZ2JGT5xe7OdrIu+Mmsn52qCAH5+expT
	L+qX0vZyJvksp1o+jDh84Aes4EzXfBDm1ib9MzOECc7hQckmnyDuJ69Sb5y8LufZpNWgQK4Hti4
	9VA1Hhsx34nZ//MdC7G2rpck2q7JcvPc6fRI=
X-Received: by 2002:a17:90b:3dce:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-383443b4d79mr3768000a91.5.1783238489894;
        Sun, 05 Jul 2026 01:01:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3dce:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-383443b4d79mr3767939a91.5.1783238489152;
        Sun, 05 Jul 2026 01:01:29 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:28 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:09 +0530
Subject: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=7741;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G0Zey0vCB0Bai+o0HIhDN6EVy1kYwW9UByIsSgvhH78=;
 b=MRwFsOEavnvAw/ye+cqHITNvYq6UQRSIrAFyHiKri8N35UK+JvJ9tUpMOwY3oYYe7SUUd1wex
 1g9SsSVZ5Q6AmJv80sHBh5rCH0QRYWRG9Q9XDPzPqH5k1Wo2W2Q7HoW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX/6Z5+SFLVpRo
 pa7wld/UTl1sUPlIRqmEVFxbZWnNBuLasoNoh9p9jZNEotObmZ6H4Z7ay82ez2FqZ86m/Fpae9L
 oolEZVL4b6q4sor9ZU5iGDNN+SBh8oI=
X-Proofpoint-GUID: Fl0KpT5LHtDsxeyWjRNgSrP7JQEkcQ9y
X-Proofpoint-ORIG-GUID: Fl0KpT5LHtDsxeyWjRNgSrP7JQEkcQ9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXzOYnVNiKwPLz
 7qVC6JhdeAmO4VUBiXJc7gjv7ZU0Oz25ve003NNU1JDu3KzdzgwZ/3YAguOdemhEDRyozMLOUkV
 3mtx3CRYrdy5XoG+bc09IgMLD+bHCCh5T1Fiv7vevgP5OuwG67n5gus72QRNDLVrGC0HYwkB1Je
 vy/hgCeHxlK09nhrlzFRiyT5lcbdNdHnJRBBqQS76usRm0ohq1o73WZ8FU3qZOqG8kI7n5OaNa1
 P+Vks4es8Hk2dDDQlfA550FJkeHKiZi0psjif5V4T9FnC49B6BSkRzYlQmzED09y2dZYb2UBXM0
 k176BNw7fO4r/pV2vr1mo2PzRyLcYA3aF/D3v8jrkvfl3e6udhvdLJ/fg2ipGM3MaRvbpklD9kA
 OXEhxelBwzbq1fdj2wUkC4Cr59LGIW8e01/99Ko9Bh7GoLHOTUDcmWuIDx8LLukLZVz8nM8uSyv
 ya0tYPtD+2uZ1+5BQeQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a0f5a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=N89IwGAUvIjX8PsTpEAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081

Adreno 840 present in Kaanapali SoC is the second generation GPU in
A8x family. It is based on the new slice architecture with 3 slices,
higher GMEM/caches etc.

There is some re-arrangement in the reglist to properly cover maximum
register region. Other than this, the DT description is mostly similar
to the existing chipsets except the OPP tables.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 240 ++++++++++++++++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 8f71f9dc26e6..009f0ae1ee16 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2577,6 +2577,246 @@ videocc: clock-controller@20f0000 {
 			#power-domain-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44050a01", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x6c000>,
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
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_microcode_mem>;
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
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
+
+				opp-191000000 {
+					opp-hz = /bits/ 64 <191000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2_1>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
+
+				opp-222000000 {
+					opp-hz = /bits/ 64 <222000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
+
+				opp-282000000 {
+					opp-hz = /bits/ 64 <282000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1_1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xca2e5ffd>;
+				};
+
+				opp-342000000 {
+					opp-hz = /bits/ 64 <342000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe22a5ffd>;
+				};
+
+				opp-382000000 {
+					opp-hz = /bits/ 64 <382000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa22c5ffd>;
+				};
+
+				opp-422000000 {
+					opp-hz = /bits/ 64 <422000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa22c5ffd>;
+				};
+
+				opp-461000000 {
+					opp-hz = /bits/ 64 <461000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L0>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82e5ffd>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82c5ffd>;
+				};
+
+				opp-578000000 {
+					opp-hz = /bits/ 64 <578000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-646000000 {
+					opp-hz = /bits/ 64 <646000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-726000000 {
+					opp-hz = /bits/ 64 <726000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882f5ffd>;
+				};
+
+				opp-826000000 {
+					opp-hz = /bits/ 64 <826000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82c5ffd>;
+				};
+
+				opp-902000000 {
+					opp-hz = /bits/ 64 <902000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1050000000 {
+					opp-hz = /bits/ 64 <1050000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x88295ffd>;
+				};
+
+				opp-1200000000 {
+					opp-hz = /bits/ 64 <1200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x07>;
+					qcom,opp-acd-level = <0xa02e5ffd>;
+				};
+
+				opp-1300000000 {
+					opp-hz = /bits/ 64 <1300000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x03>;
+					qcom,opp-acd-level = <0x802d5ffd>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6c000 {
+			compatible = "qcom,adreno-gmu-840.1", "qcom,adreno-gmu";
+
+			reg = <0x0 0x03d6c000 0x0 0x68000>;
+			reg-names = "gmu";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
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
+				opp-475000000 {
+					opp-hz = /bits/ 64 <475000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+				};
+
+				opp-575000000 {
+					opp-hz = /bits/ 64 <575000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-700000000 {
+					opp-hz = /bits/ 64 <700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				opp-725000000 {
+					opp-hz = /bits/ 64 <725000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				opp-750000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+			};
+		};
+
 		gxclkctl: clock-controller@3d64000 {
 			compatible = "qcom,kaanapali-gxclkctl";
 			reg = <0x0 0x03d64000 0x0 0x6000>;

-- 
2.54.0

