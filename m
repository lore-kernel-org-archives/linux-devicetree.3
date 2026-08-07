Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B158D46E017
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091321; cv=none; b=MI26OYG0c2voJ7VcNuZ6xgjuc546YqbzfJ7Uic6haeiNYjVelVLSCa7/1nn/x3b5j22mZol3/YasN0w1c+HM0vmlEWbRn17P9V+oDFK7skHygZMU5D0oDLOdl2Gkgnt4dOZ5ZDowUbc0plAblMhbSCh7QB4QkNW4fCs8yv30vMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091321; c=relaxed/simple;
	bh=Z5SsSJ+MtmbywYAL+yRcDyc+yQblOfhMrEJFzYs62Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+ffr06EMLheAyYFr+ICwveL/W9XrNgYyfjPfhgP7YAxwWXZlh5oJajn+4D/XqJu0R+xaH1R3wffhJTpjriJ3+XdmWSYZin96BY+diUbTPQbLFDn2Ot32nhq6A311RXp1I7xu+iep40mdiV2sivhcnSdRExmoqfYriqMgYV+CBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEROoPv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuF597Qf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEROoPv8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuF597Qf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778BEhG3477030
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/jMN4hDZiHyIv+z1oMYkJz6QCP0Pz4ujHu+qN6EosU=; b=HEROoPv8ZpRPHiPB
	Jeq3EFFkHE4U16utQBH7VmtF7RWsRflwhfcfzs6kI8qdeNEd7n2IsnIc72ouQDvN
	VEJujgYsg3qPxL+VWBx+tOnP1FVnZwsXrIAa0/ljuo1/BPP+5ZO2F8ZikcxcKtHD
	6nibDgDwjUzHiawo3x7y14YBT8Z93rJtiffz/7bBEEPK6b007UJgVS+lClqxZwn6
	Y+8En9r9wDvWrXo4uK6ihd34jYFh4pZL5bGaK9V2qoXC/GpDsHXDfW3AMVoduN8J
	cI7uZMD/ZA5h+5Bdse/3LmO8Nbv2m0ZDLnZGDNAtBjt4LCRwcQvGG9gP9+ObZvhE
	hyCeRw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hb19q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:28:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso76515115ad.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091316; x=1786696116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/jMN4hDZiHyIv+z1oMYkJz6QCP0Pz4ujHu+qN6EosU=;
        b=JuF597QfbtXfkqcJlyD4yRlX1RtY1FPcFZ+5VLfJd5vdgrdshueC8dYlccZq8Jj7nA
         48glwwG+lKGdKaC90Styu2mF1EuHk6/3Caa9YszI/qVuDoQtaKEWStRTcgdIlB01+GuW
         oFEjalXh4yrbwSKPdw9lj2vR8NMPoxz0DbXepK/JGgEOUl2w3A2vvwfWxrsIG4dRNhSE
         WsF546EIag6idU0FMDil2z000tUSTGahIlklkR+B/odDkPfDiFIWK+pyq9+QartPPRtP
         zM6Y/RKeGh6wACyP5c6r7TB8TcU9I/uiVOEOpBZHOJd7UGE6tCCiw8ZmT4fpIwiznfI7
         NemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091316; x=1786696116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/jMN4hDZiHyIv+z1oMYkJz6QCP0Pz4ujHu+qN6EosU=;
        b=Rb6uKGrWmiP292O9g+XjjmEW1h/XjeAJB9+JupMZE/tvJKH6johWbBwYhYwQFvaxIt
         7LrDM7BpZglhFHSjyMwAZL5sxdeIVhYzAsLbQxwLlEq5WuA7GrZrXItM9bGokmk55mDq
         GMdEjZlhc/7pE6TW/ZnLtSx9Cww5F8D9jZIAMZCTB9ggOJBd4v7+tgfaehRBnGF2NPqg
         +VuXzEP4tbJOV9kNCMnJfzOryP3cxsWpq6MioHMdqMBkCvFHKhaQ3+DpUBPIhpw48x69
         Tmk2MpSjt0F0iYLyKrGoli2oWlHSeP06JIlPoUrnSm5vhqsUL6mWmFvgR96JrbbpxPYq
         PBDA==
X-Forwarded-Encrypted: i=1; AHgh+RoP6AROzmaM4e10HAw6+hHnj25YlkAUs6qLTwcVL2ohmox2ojc4ix/yRQni1yy1R54/Gq3RJngupDtV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc87DpBbq+p51suI8pjpHhEu+jb8FQyrdpeHsyihjJ4Xvms+p+
	BYU9WhZvOZGJ/KLjlcbhOkLxMxptPYxGsSiqylazUu2v6tbaRTuJdPIOmHR/ra4288agGXKZlTh
	0/bk3aViUiwPAUCVhJ+J7ci5LjwIdcOliDzBvSNRb0p6Mi/eC72GnpZ+XveNZgGCs
X-Gm-Gg: AR+sD12aUoNRwmWBfhkKttQZR8W8Po/qc/k/HXWQ1gn+Phe2xCmMWJEmNmHqk09Q61b
	8Kf5LHYqdtpr9xMjmalpqCvlYZjV9drovo3Y8wE7xuCOnUo2W0jrTadFYhBuuJzW4ejCqA1IotI
	GSflVVLNFh8Fp9cYErRLpXp6zXVbFPHCDbrfHOcwsyl9Z2NhOHajFxx+F7IfWdzCrX+DsolZ83W
	/yQq3/Rfu7iz1zTl9lSJL2RkW5IYt3vZgaHFTlx+Bs3q8MI2gk/RFtavWnWlmyu+8RqAL5/Ups5
	Co+ihLtxUfbywdpV07aLpC5uQKaU98OxcxvOYTNggCTCGDsuvEzcvd/qnIFAk0YCQMtY9xAV23H
	wm8L3HnWCAjbfjBbBanWm/W6eMkofxUsJeTA=
X-Received: by 2002:a05:6a21:6817:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cbc0490091mr2816607637.33.1786091316081;
        Fri, 07 Aug 2026 01:28:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:6817:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cbc0490091mr2816554637.33.1786091315666;
        Fri, 07 Aug 2026 01:28:35 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:28:35 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:59 +0530
Subject: [PATCH 15/22] arm64: dts: qcom: msm8996: Reserve low IOVA range
 for Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-15-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1865;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Z5SsSJ+MtmbywYAL+yRcDyc+yQblOfhMrEJFzYs62Rg=;
 b=ebGb/RXaO6ClLAVk8FDSnFaaOMeaeSe2vv3Pddc4YAjnOOHvLjdczk12OcoBe+zd9pCK9eKbk
 V5FPP3Ej8jxBvSMlA3V4eR+Hj3mGavvP+kUTLyC0yf4eMzrRKIEQppJ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: SFZp-Y-TJEJy_-tmz6Lb-Lk5BTElEWj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfXz/3LDUbj+OGf
 ymDX4FQwZooQW9dxGI/yofoV/42A3bn8ijTmonVPr00hGiFJtx3bXLBJl9H/DTiv5faLQRp8Weq
 8geTnUCMmpgtu6WQpEywt16zi8RW5swtAXWTy68VVPXg/azaAz37ZXWjQfCkIicwjnWntU2RIQN
 aqRD9XxrUWVYwKZd4U7irmacJm7HmFajITOLvMTQWtbyrWPSbNsgBEUVFEgjSSekhIJbJLFrZ1D
 QemWR5ENwu5QspJFnSk/MF949dYY2w+PxoGej+kqX1u2m2VueY1ey5YYCpoJt6QGOmFEUe8j0VH
 7vL76bhZT+GRuQ3IRLVgUEps/8HhJ58gWEmphOtoHLqSxv7QeosshFRojILkCOAALOLjhlFeJX3
 nVRjBCmAbUQgSl8ZbbZPMPWT4ObDsrLl+V3Z+ltjCV7LAtHjR/K1Rlg+nPgxXLMs+UHAIJE3/H5
 xxpPiHtC4LKJP4VuUYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX1AvFyfH2aDXk
 A/ojBkZTwMi9s4pO2pvYOYDK1EAKCBFfF2GeWAdgK/nAaHqgT9yHOxwIt8pk4K6s+2wO4GfhwLS
 jdxFeesK2ssL6LdQ4ww9/c1eWsY3Kso=
X-Proofpoint-ORIG-GUID: SFZp-Y-TJEJy_-tmz6Lb-Lk5BTElEWj3
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a759735 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
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

Fixes: 902d97a44211 ("arm64: dts: qcom: msm8996: Revamp reserved memory")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 818e5660df91d9bae0c3077f476b50a28f2baee4..e8a01b4d0c462f51ff4b40af7ea1665f2e231699 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -592,6 +592,18 @@ mdata_mem: mpss-metadata {
 			size = <0x0 0x4000>;
 			no-map;
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
+			iommu-addresses = <&venus 0x0 0x25800000>;
+		};
+
 	};
 
 	smem {
@@ -2427,7 +2439,7 @@ venus: video-codec@c00000 {
 				 <&venus_smmu 0x2c>,
 				 <&venus_smmu 0x2d>,
 				 <&venus_smmu 0x31>;
-			memory-region = <&venus_mem>;
+			memory-region = <&venus_mem>, <&venus_iova>;
 			status = "disabled";
 
 			video-decoder {

-- 
2.34.1

