Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81985390618
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369242; cv=none; b=nslSsUTJhpkz9pSUihH3JFfU9sBjkysb27qCXDTbfTEp8ZL5b97HPC88sT7/1SZ8mnUrEW2WsNGx8wCCZ1SYukJj5srkZSF2u5x0U2ZAf6EEHoZTHB/2mtYWrxTZAdlDT2+ib1IOLz339iiI6pi8gE38SQuc9GJUSS8vsWfdx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369242; c=relaxed/simple;
	bh=va6xF6vr7UsAt+0AMfDPEagkDJP5CNMoR/tre/z2rzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlLJqFSbJsE44MiaGizWSQre4AqzYr6tCOSiEcGk6NdLZSf9UmZJ+4VyT/mIWvon+03850YB4frg7ON+8UQGGM+wWmMgzpZ93ADXA6wycuQs/jZR+E1oIbHgdojpxoLzCs0WUMV2r3spxXC6wp2TCm+tbAZTsTBzLzfWZ6fBaUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFQd7xiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jkr+sdv6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFQd7xiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jkr+sdv6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iljf793355
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Rb6LBoC22FXoSxAF7j8XDfO7U+rTfI0Cxwnb4No8SA=; b=dFQd7xiPTvNfzrx1
	+qo95GhpWZFZR0I+9Abxep9MCdIq1wo+lmRRzuA+XfkQJeMgyr+2WPLWfBIy6V3d
	YWJDRwIrGtdEza2WSo97RhReHmMQErpOFtq8MrGM6Bne4tKFnYyAYrjQwG0WK7R1
	jKYPyU8c7rAdjP1MSA5+LK4or+v1kdjCPDJ0dq2dbH2D56vI4HpzHlyJ4CZTMW/S
	SbVergDLW4SyFUODfOrYUphCfx6Ns93aKxhOlNT2VOw4wHzYQwUWbkg+pDkHubCg
	y9cBuI/WpT7IxTkwXEoLx+QWfdDdq6vKp9eVdYcsQhtUp66fl2CuQcvhRTNMnJ9y
	z0Lt/w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cncwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so4463970a12.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369231; x=1789974031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Rb6LBoC22FXoSxAF7j8XDfO7U+rTfI0Cxwnb4No8SA=;
        b=Jkr+sdv6h8/dOwwV8V7opz01zAbHLrV6ZuoZHTKMI7H00g6S8z00RR7BS0uAySBsK4
         jv3XQNnp0kPuBBAr6eCemFSFbGvmX9AyDW8H4fRwjBosmLQOw19QYhXhcRiKVSUcSOF/
         MY1xWWxzkd9GU8TyXcUPFYt8zDe22IqrFbkJN5VuuMDM0CIumCQCUmx0dbe7SfRR9d0r
         y/XGKt/sJP+0R/gAU2b1uaS0g0+7vec6IZFsz18i2Krs7VtBYcEITm/3ayl6jMFWkNFY
         8v4NhK18zFagixvjaWIoiSpJc71ho3back8gt0vMNJ7sEYpsU9GWkYqXkNI3pT5n/cVu
         e+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369231; x=1789974031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Rb6LBoC22FXoSxAF7j8XDfO7U+rTfI0Cxwnb4No8SA=;
        b=pZk2OjYfnJOiZ58CqYCoj3aRmDRYASBFwxo3ltkw/G6CaPKUjdfUo4uDghrTWU4DAf
         eUPoMtq7a7OMsn99m1njYbL8rVjbUXhIWVltPo06j1cA2JEFMKu8WmGSOI+1xChFIyxq
         4R9aDkq1KIbGzGIXZBexxiXfXVoLzagfqZf9a+0qtWhSu2uMgsNzURS1fm5jiczgMvDU
         vsqtc4BVRYVTmqxp8EV3b9Ovj0YN1L1BEDd/u/GV4X2vhT7sRObBVsFKvfEPt0B9qQvx
         +D7724LE1ll35aYspgDNQH9yIPm5m4yP6ANhbIAcWv4xyTO4UneQl4k+nd5Vtk/yCmXH
         YIIQ==
X-Forwarded-Encrypted: i=1; AKwUvBymVvIzpVbp2L94+Q+GuYW2iUYFDe92OOT4qW3e1bOMpLUKxfxSO/kRJnM5faB3GMCLJrvud2nXVLfa@vger.kernel.org
X-Gm-Message-State: AFuF++lXFqvR0Fn14F696cyhlk7vUWE4YCY6WaJEYN3cs1Luc3iiLqWy
	zuHq7nGcLD1z+UVbm1S6aOUbZswyoaoM9CWTsgRNXhJ7Nxo+9v86vBmizp/yA46HYdbBx8mhlco
	EnZsu1kv4KAK04x4aZ86wSVzwD4NQ67Fg30NIvI9xtBdIW666thEQmnxShsICahMv
X-Gm-Gg: AYBFou0cP7qZkHMRNCjLBoEr8XU1gDlGRdWzb8w6nJ5nLf5wg3rIaKHgewKIJW2+z8R
	phfF190TBgTsaEhEYpOetV65km3OPHZBu35Bd0xYC1t82TNWzdEhD0bTl8p3mKQ4uy4SY7b4GJb
	hal9XG3E/2EDu/wA56Nr5armzbZ+304Jvl7LUHZDSq9ZZc/8qOjyJGkpKPoHk6ds/Og0RhOsxeW
	Kex71peI9OY6HUHPkNfF48WJdRDz7WSKgdIcZQQwYla/vrT3UvN7FXSvw6rTRPkESXDGrNHfj85
	mQXSMJY5whKigRJ51/IhO0agUiNGqH5QzJ1K634pxjkbS8qsW4Iw9c7hpppEnsmwi1C+bhlCamI
	V2nzGxjrNOurnIj9iwGFucQUgKBK0
X-Received: by 2002:a05:6a21:113:b0:3da:9f19:bf2 with SMTP id adf61e73a8af0-3db4064eb93mr2783054637.18.1789369230945;
        Mon, 14 Sep 2026 00:00:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:113:b0:3da:9f19:bf2 with SMTP id adf61e73a8af0-3db4064eb93mr2782968637.18.1789369230469;
        Mon, 14 Sep 2026 00:00:30 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:29 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:41 +0530
Subject: [PATCH 09/31] arm64: dts: qcom: sm6115: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-9-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2637;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=va6xF6vr7UsAt+0AMfDPEagkDJP5CNMoR/tre/z2rzM=;
 b=6WOoHZceESG2EM5WDiZaE4GzIdxna278JZQ2Sjv3y1aHrtRXmPk+tlhgXxOdaU3bcaEiVgbmx
 oQ9utQ73qggCkPNGFvql6BqLCoE+DcrWFZJka7RM+2GmaKyB6fhJdIZ
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX4E5JvCidHmuz
 tNEEgIIDDGXFjRN3N8Am+kvcvcz515B7mzfPDtYC968qvF9vfOl66H4q5tqWFBpNaFz+g6jTNUE
 I72/p7NYpD2dv+KIXPho2SQcRQwYNxeSlGUMsCj3krrmmVUVXaFaLrF3cNpxMWTwAwPcGxR7ekX
 B049Vzd5WaCeMwneC9zXDI6svj7ZRMJp42Lbr40VHUo0opSM/vDlMpKlJ/3eqgP9AmRe4kLLowL
 AOaKKEYCfkYw2/JLn/hGjE3nzwuNvHOIMeklBn82ltJBCftuM30cQUJ69H4CX3vePhe6uiT91i3
 vwUQOyC8qCHhR79e5+FOVCEqza6Gy5fvVM1njd+kwsXMOHI+KpJmWxyfIZrpRjEy0Kvs4vu0oU5
 G9FdV/eChOiJHNESJ9q79979aOMZSPbwor5/rbydOqNydg77d2xRSEEwZLUOiAUoYsOGLWa2p5Z
 eK1oVnJzxpBvtKBH+IQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa79b8f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jBt9j5u6eBwbyPT3BWQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyoVBQWvH3y/3
 dOv5DzeOPASXaIRcNBE0uHcohzqQofLZZXD99Km0+NKmd8/7YAh/uKl8laDlOS/rQ9PKHjLx2in
 JsHVOMzYrvadjTpblr6LCz8HbL8bChs=
X-Proofpoint-GUID: xpKK01WjX9jqds0flpV31WmEV10qf4YF
X-Proofpoint-ORIG-GUID: xpKK01WjX9jqds0flpV31WmEV10qf4YF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 3520802d1fed..27b5ee48637b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -209,7 +209,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <290>;
 				exit-latency-us = <376>;
@@ -219,7 +219,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-pc";
 				arm,psci-suspend-param = <0x40000003>;
 				entry-latency-us = <297>;
 				exit-latency-us = <324>;
@@ -230,8 +230,8 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 
 		domain-idle-states {
 			cluster_0_sleep_0: cluster-sleep-0-0 {
-				/* GDHS */
 				compatible = "domain-idle-state";
+				idle-state-name = "silver-cluster-gdhs";
 				arm,psci-suspend-param = <0x40000022>;
 				entry-latency-us = <360>;
 				exit-latency-us = <421>;
@@ -239,8 +239,8 @@ cluster_0_sleep_0: cluster-sleep-0-0 {
 			};
 
 			cluster_0_sleep_1: cluster-sleep-0-1 {
-				/* Power Collapse */
 				compatible = "domain-idle-state";
+				idle-state-name = "silver-cluster-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <800>;
 				exit-latency-us = <2118>;
@@ -248,8 +248,8 @@ cluster_0_sleep_1: cluster-sleep-0-1 {
 			};
 
 			cluster_1_sleep_0: cluster-sleep-1-0 {
-				/* GDHS */
 				compatible = "domain-idle-state";
+				idle-state-name = "gold-cluster-gdhs";
 				arm,psci-suspend-param = <0x40000042>;
 				entry-latency-us = <314>;
 				exit-latency-us = <345>;
@@ -257,8 +257,8 @@ cluster_1_sleep_0: cluster-sleep-1-0 {
 			};
 
 			cluster_1_sleep_1: cluster-sleep-1-1 {
-				/* Power Collapse */
 				compatible = "domain-idle-state";
+				idle-state-name = "gold-cluster-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <640>;
 				exit-latency-us = <1654>;

-- 
2.43.0

