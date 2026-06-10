Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CB53DB305
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090130; cv=none; b=lki1gIPWNhLuxz3F2oLvEhHudR7sC+535egivBvQ4MnKgOj73FmRQ6kZgJ7bhaUgN74vhcb8Z7IGiOyHYkKQZ62YSlG0mG9MhCyAJ6/7GrQGfU97ZPWJJNZWclYd3ClwwcVb33PDhnkAelk8AgJ4MIIoJSWnQid77x33O3LmUk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090130; c=relaxed/simple;
	bh=x7+Fsm5Jk2Yz0bMc4s75zpL4JuFOmFGRBBISbD+XDQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E1NECluz864ex4rNGyqeE6KaD0Hn5FIumSSV+StbXZWA5UGqoSgFixnSAiu2LXewN2tlVEBBEq/iQSKxwM97rLoqpcRzpocByQyGTKeAqRFT8UdjZD+kyI3tVDfKW0cH0+qLlonBlto4LFoGCEIk8UiKOUKkiIAivYGDl1EontQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+PxSRty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3H92gmP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+PxSRty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3H92gmP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hjFP530204
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YB44qVUGLtg
	M3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=; b=E+PxSRtyvg7d2Mr+JinMSAZ1qNT
	MnOEITKL8dKrtRr6532f2FyM6eQ9A/fxHSbEVDErHt+P5ZyoEBIRhtKsYkVt8ujz
	inJSJsbbeRP2OnNW3wuCwHj93oAv+M6u8fUNC9gT8WK4GRtZiNi8Ra6stlb5Dgym
	dYf51xMAEjo7OocXY+fajId0+lLFMu0ahGEFdiuX7O/Z8RscbnU60C8KcMEjnBxu
	7yHFVBKeHGaXnr6kVMnReRf6Bq7+xQR75bJnvk7fmCrBcc3PtyInWHAtpUI98XTr
	M3xXG4dtJRQ+DpNqz2/6wv4APYQzhkU0CibPBnTOlLtzPoE3s8ubPMUHTRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2j5dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf160f7191so39525955ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090123; x=1781694923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB44qVUGLtgM3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=;
        b=d3H92gmP/GBcIBBYxPShDYaCw3haHbbzSgv8588HEQiZ6VI0UlKikPB9i3jJtOugnm
         aFvHXcjLu3BpDG5G2eIAWJxp11quWgyBOoQErwsI3P+nooTKkgQmvOHvNYrnmB+FjJ1h
         r0UDT+R5wQ+7aP9rYJkLuR0GUTcybYTlJ6IeLaIenYisxeIkCtBonyw+6VgfQ57o6N9X
         bcQFGBDO5DDw0cEW6IXgWgesMMPhrgSAoCCSvF/XUnc53QlpwX7AfDyuwzKJY3boEHFz
         aW7/HJj9nIkMgkZQFL20L3Q5NKJ5ziew+Xi6LMZDw+LMJPepxvI0Va+5P/Q69EXPVeEF
         Z1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090123; x=1781694923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YB44qVUGLtgM3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=;
        b=jR/EUeUYso5TY6rQgRBfEjEOY98mcaq6MT6htHvAzpkDCmKFY4s9VRCqBhDozWShUN
         Yj0Qdf++DXCoU2Eyn7oSawLDdf78LicczSSJXvXCNz2kq5RtffovJC8wehEt7W9JFWED
         n41HQsafiujJefndQp6JPXwEGLAqgkt2uCTcXq15O9VaxOCWS6lfjaL0Q2aHqPSjaCM1
         he9P9puR9DtzYBtLu7KhfRl4IiwX5bLhZsheqiViZgpPjHndrOEP2WkOehdDaZqMftpS
         sx87bqUmvNBtvy0ad/0g7gHMWcCUI5FFPTaR+L94LjXRDSqcsQteW/d3ATfV0zX0LBEl
         kj7g==
X-Forwarded-Encrypted: i=1; AFNElJ9QR6SS1izKUHgztIEhJ5To5TdwGEKmv6NQ341u4OY2qVyzBDr9gudrkm7I4bmx11cEkgCGkiJMo2QG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQcBc+7+hlQNB1mOnCAKxbYdFXMEYDh7VcTTDPeP3dBuLyzAi3
	1MpuhkE9s5Gnjz/tfrrHo9Bz7vkPnQsnSpJJkQ4pjPGeApQPStX7w6Ce40iC4ih9ozIE5OjhZ6I
	cKdbH+5GzOel1FZ9e8/QrKZbTHgkVjjSDrUySXPaTVzS3kIUc/J8yZNV3RMn9hZIc
X-Gm-Gg: Acq92OEvuKEd4k0fyuDraBuEqGKkePEpvAITzVr/RuStdt/hH/E3zecFE6kMM7zGpW5
	LA5o9HGwiJlv4y1twLNKmT+WGm08HZCouolMDQU1+IpdMq6KTXkV/8R23XwUM+sz0n+ZgaeZ8o4
	t4GLuBGPrvk7IsE4YJKkqIOaBbeOmi0HisLCLXHRTZkC2SP8ihGJzKVFCAoXMO4h/DSQEbR6yxB
	SpUIEBeffEMZjBUlyKrovEs9F82s8NzAjKbM/mW+qNd1g1UXUdS+5NpelH2zyWsVlWbl3YKvlYU
	oDPp/uSDt5liYYVcP4NxEdyj4SvlqKnhpVBoRmm+8K8nnDzqaAPDEJm/oMIGzz3rL3ixYa9EAmV
	cTKgIAoDAVlQ8ZTBYzTNJiHE+c3F5lg/zaD+zAlN99gF6nOepOlXjYYxRFoE=
X-Received: by 2002:a17:903:138a:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2c1e820e32cmr259826285ad.37.1781090122571;
        Wed, 10 Jun 2026 04:15:22 -0700 (PDT)
X-Received: by 2002:a17:903:138a:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2c1e820e32cmr259825635ad.37.1781090121898;
        Wed, 10 Jun 2026 04:15:21 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa213asm256052545ad.35.2026.06.10.04.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:15:21 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage for SD-card
Date: Wed, 10 Jun 2026 16:45:05 +0530
Message-Id: <20260610111508.3941207-2-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a29474b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=RbnQZSTpM6gPS1NYG1gA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX3Qri7JmTDrdU
 8uzSXqH62awBxU1qt1ndu5C7UjEVptdbWmo4Oqc2aqrTiDLA2heJ4dQo+VCXEcjuOU7P1+4Fgbj
 MDPwDbm2o0ZJZ7Q/ckSbagz3LWAhdvkA1Ll5nWKhSK1FD3d25tytAkWfinst1mH84ulw3+2by3r
 wjHvxo3tS3bfdB/O5H+kVN/kFvHeh7boLSOI8SHtoLFIAo/M70HtUijsyRbPtNXFwUmuo45dy6y
 PeCLhxLgnyUSHxLCaLG4ZtfthtdyV0vsNPVHyu6zdzYhK3eBfw+hxkz0Y3yP1qYvWB0K/zQ08Qc
 9zb27XF86Z5dcReJTXkFFuflVq70gzioKrzCIOAw8AfQmimfWHhA4/+utorUoc1CXxbe/1Zcfc3
 ZkYEHrfr0drbfE1hXdMnTgoWiYfNwrEmjmpSUfUrA8GM5z931tJsJYCsOle3ayQrRDPMngsu8qi
 iCAZc+XoqyyDwPPEJ/A==
X-Proofpoint-ORIG-GUID: K-IXaml1XRiDTnr8KZRkl5S6FpD6uBBj
X-Proofpoint-GUID: K-IXaml1XRiDTnr8KZRkl5S6FpD6uBBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100107

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

SD cards may need 1.8v VDDIO also to be supported, to accommodate this
requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
supplies to VDDIO pin of SD card.

NOTE - Since this SD card is the only client on this regulator, this
change should not have any side effect on any other clients.
moreover, SD card driver takes care to explicitly vote for the
regulator voltage based on the SD card detection sequence.

Also for stable operation of the SD card increase VDD voltage
supplied by `vreg_l9b_e0` to 2.96v.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..af6f42cdd39a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -228,7 +228,7 @@ vreg_l1b_e0_1p8: ldo1 {
 
 		vreg_l2b_e0_2p9: ldo2 {
 			regulator-name = "vreg_l2b_e0_2p9";
-			regulator-min-microvolt = <2904000>;
+			regulator-min-microvolt = <1804000>;
 			regulator-max-microvolt = <2904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -247,10 +247,10 @@ vreg_l8b_e0_1p50: ldo8 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l9b_e0_2p7: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p7";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
+		vreg_l9b_e0_2p9: ldo9 {
+			regulator-name = "vreg_l9b_e0_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-- 
2.34.1

