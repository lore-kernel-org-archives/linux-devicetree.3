Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23033911BD
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369217; cv=none; b=XXwuIctnRMD4rrKN5KON3KxSKrKgdUowYPMfMDDfeJzsvA8jwjl8KFSStKjXO3dWjHyTa3/eouw6G7zprNmAgEYiABXw/2r/sVGUypyPUjeU7KrqQGeko5AElKSzaHEZR3sWvZUHaf4trFAeSfPNJn4RLGyeW6gShIH6nMukypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369217; c=relaxed/simple;
	bh=8lFUkrMCvq9yxa8/vXAjVv3pfeEakHgtpG6g3VNJoSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWQDp5Xf1P3MI5eUUNf+APi92975Muc84gGOQo4p2p6PdTqbx9u8JjFSemHXjIWhh7IgQ0Z+eldC8mVaEz469HuZAYmbPgJOFca3HYPgMTVkdhwv43Mk9JP4GqKU74QNXVRQhUuzUMbQ/DuKUlaGgiCYRmbvlxZK30wS8C5yz3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1oW2WWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMIKtxl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1oW2WWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMIKtxl4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5islQ4058198
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llEimAlAXt0FEBTKAYZOMTEMuGzztI7DugU5oh8mDMM=; b=O1oW2WWxyg0e8NU3
	WY/p3uLy1fBLMTOrmjYevzZooSJ8ZG6tWaiH0CNdBKMjuzNNgX+cNZzUey4RERWg
	STtI+zCcgveS3BlB9iGPsaSslKwKhG1yfNWPvozMnxetFfvRnC1JGXdWnMf5sDNG
	19PpyuHD70I3SLqPFIRin+/ZYP8Ij2lvFYVnyl3Qkx106zpKKLY5g2uZw9gQGYhe
	7tSuZtE20Ke+XJ8Ys+VCVmLsDKjGdFigrHTf39K+U/LtGB4vpinzf07JaUBtDmdM
	rHrUlNVXSZZHHYuvIxu1CCXadY+Jly016tMil44G9Q/2NhG22VBFVCmdoXCpUiTR
	LIEv7w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hss7u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso1028082a91.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369206; x=1789974006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llEimAlAXt0FEBTKAYZOMTEMuGzztI7DugU5oh8mDMM=;
        b=gMIKtxl4kb3Xu8drfMr7RmWnmT20txYgzpuhLx1Z87O7rpftYw7FS7D8aYl2BvWtPH
         wZ77IRPzJBHCa7tw1N2L2x0zhKKwELhUc0uNFgx14mLTrfHPE57p9O5vXUEkcQphyzoJ
         0gdlojbgR2d4GkhWnjU3meS7i33/h8ZXm/rqBPZmk5CKv6TeTmpFNDLkh4gJsGutPwnA
         nM85Y9Cz2/DvSXvAR7QVRbOtTwnfqLEeu/E1gX+PZpgYJ3VRmnoIzRr78qmcA073E2JH
         Szu1w/EvQl9aC0VMxBviJbej6Dwnc9iX/iN8GxMxmRbPmfxFhjE7Q7PfZdnbu7fkRYW/
         1I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369206; x=1789974006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llEimAlAXt0FEBTKAYZOMTEMuGzztI7DugU5oh8mDMM=;
        b=KsDXlBlZkF88HrETHgXJ63FiIyDU9RWXKn1HHW+IY3jlZHfLEaNpaHYqiv8N8Gu4sv
         PCf7gw+PJPYEhqCAqrsj8ndcYEuTlmqNCl0SMEbOE83nnYtJ9Xzx5cu6FTIwEZrLDzg5
         lP3JFJ31jscCKJjGa/b3vcGC/QVt3CVBPLEFBZhzDlSHAVxnMI3qXLCmvq1X9zl5aAUo
         QVHfFtyJYgiEZiTa5r0li5NKjtvb9/8eV47OyUTgQXV39X2dY1l1NPxIyuPA4vkY0QFL
         wVG0Em9r61xVAth4JLWIRy9naMssp2RoYldncVuhCQvkQhQVm8KSS0CCs02Rf6RvrLgd
         QyIg==
X-Forwarded-Encrypted: i=1; AKwUvByTwCpxg+tljXe6crwnLgurtkMWItoi3bO8ziTl0spypIS06j+e2tF/R4wWVgkhdSmslZL3tcGoJr9D@vger.kernel.org
X-Gm-Message-State: AFuF++laiPG+gy/UREoySZGbsrLU1Lh/SaFCDVJ6Q/XcylP+kXOKTQwf
	f0dMRWYvCVj7UDrlOkBlNuF9nYsbae7vAcWa8DfuXxTXc5h2uN1a5TCawQ5BTZnomIw5+Uu0wTl
	FV8LsHs5wB2RA+M8JQ/V9oKvaULqgH1UAiNiOhUZqjC4CkxAHlQAfqMTA3ojCkpxh
X-Gm-Gg: AYBFou1hRWV8slU+162jsZzUm+Bv7fxKbTbeuUk99qCW2jiaWsrwEVxnZ7RtFmJsRy7
	hKB9w+Hm2KV1hbqOc4RVwll75QNRiW3NTu4ie7YejFh6iXGPBsPh0AY98cqyGhvxz3RBYGybhoR
	ibLk9G7Vni+iX62I7iDg9JcjqGvMX3zEmwb/kdvFoyoycqiGhm1UwdGHxUcZju+7sU3dL5YZk1s
	pKaa434R1JrNTTjL+/xC0691SqnD+w1Ab7RRA/+gUhPsIWJIPDVzSflDeuZiajWMEtkZPmMSKBi
	Lk2BmyPJwyA46KQ6b8a0R5NUtfx/g8g6ciaJtkwGtAGOK094+rye6PM16a29osAyQnUPT8KC9fB
	jYCnf+MTXW3Q8NnNIsbPGilNCYFbI
X-Received: by 2002:a17:90b:2d86:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39debf93e5cmr3622990a91.9.1789369205791;
        Mon, 14 Sep 2026 00:00:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2d86:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39debf93e5cmr3622876a91.9.1789369205285;
        Mon, 14 Sep 2026 00:00:05 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:04 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:36 +0530
Subject: [PATCH 04/31] arm64: dts: qcom: hamoa: Add domain idle state names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1384;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=8lFUkrMCvq9yxa8/vXAjVv3pfeEakHgtpG6g3VNJoSs=;
 b=6/dYPWaZD/PgHI1eoWwyaBKHi262jdEUdA42V8wOrrTjNC3CEe06NEhKJpTWYeMe+gi6I7+E2
 fpNwK9cQYuoDYtFTsbbLeIMUVYMXo31IBIJ9wLTCIJUwkwTK2vXjuPO
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX6lESNrPc48uX
 cnXr2tNtuslQLz5AMwK2YrPgVxSVQRTaRvFteugkVtS+avz87S3nCkSI6JLk9lixTFnSdaxMLqX
 02OXgHgxDhEFetjmJVP2UFm+5FtCWYMuvtBa2j4d6cqRpDwUbzM4781Wge6ZRETZfmSNFmFr1Wg
 dgdgevQn5loaGAM8YdEpzYmA0Is2RUkPm1E6ClSoiW+HQ5H0yuXsrMOkIVU24/2xjejJOKymIZd
 MOlGND9Fp90AceYR8YfS14rOVytV2PvS+PbaslGbuX/R5cQRQYQ0EFBUbJVcePgcQ74ngJPDKS4
 fjzo5iE8DPOBG0eHvD1BmlmzKrTNfs1EeKa+aTD8CJ64d5geDLhtTYifaAmoHTFi9YPmlyVU3m7
 Vf1KoWiEAKVhmvzur7A2eQu3WCMHjTMTu19BpQw03JbrWhkKpK3BqUykOg/o5hYB6a8auyry1sd
 rwtXcKjoLGVIDHEYSaQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa79b76 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 0vYxv4gIm_6j9A3P2zpm2wJ9-19ZUpNe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX9nxUsyFlzRkl
 rngqepcYwGqZWvjxnILG4M9BfpVCTLpcr1cUTDG7oo5IuJ8kFan6lu4E3/Cgw0NZFFbRDTWp9Z0
 zbWIok5KuMcHUM8LTDhVvry1AC4Tf4Q=
X-Proofpoint-ORIG-GUID: 0vYxv4gIm_6j9A3P2zpm2wJ9-19ZUpNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index fcd88e5f5d7e..1d3ca2215914 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -290,6 +290,7 @@ cluster_c4: cpu-sleep-0 {
 		domain-idle-states {
 			cluster_cl4: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-cl4";
 				arm,psci-suspend-param = <0x01000044>;
 				entry-latency-us = <350>;
 				exit-latency-us = <500>;
@@ -298,6 +299,7 @@ cluster_cl4: cluster-sleep-0 {
 
 			cluster_cl5: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-cl5";
 				arm,psci-suspend-param = <0x01000054>;
 				entry-latency-us = <2000>;
 				exit-latency-us = <2000>;
@@ -306,6 +308,7 @@ cluster_cl5: cluster-sleep-1 {
 
 			domain_ss3: domain-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cluster-ss3";
 				arm,psci-suspend-param = <0x0200c354>;
 				entry-latency-us = <2500>;
 				exit-latency-us = <2500>;

-- 
2.43.0

