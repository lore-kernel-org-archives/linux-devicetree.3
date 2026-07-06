Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE4D39734D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347247; cv=none; b=gYaIvHj28e8ue8O1e4Gj7Rm6xaJlz0S6Vr8O1J76sQzcrIpesdLy9ktArhw1TQcV6cBQGWVV3FwFZReGqsXzJS+pT1DsDqLh3UWUvHOQgIdivFyV4FYZDBePD3DlHHQLhpRNFoPhhzu4P+eCQ89l+N7NAAv3oR7I6qMQzFwfmjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347247; c=relaxed/simple;
	bh=HGcqepg6YZ1JLarkhjM1wuzRvzUo2nasEdQ9WRZI6e8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qvKeDn9yx4rqsk6L/v0M9BSYoCrcyGRNBsAVfkTBjdTrrJ8NuY3swjxUGgJJqwxsWeSR6nq/g3xT+Mc9cEy1q4ieYOeOjPfhK7pIzHE+rHeubbYnimRxz0q7FvBtErifcUGZ8kZK7pf+ZN/G93AbhNdRP0j4BBFU5goohkcrjSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgQZLRKE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbqyyqze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgQZLRKE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbqyyqze"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxBGY361297
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+MKOt/7Ya0e
	h2rnAvsxZyC5RZn0azraaMZNkScT04os=; b=NgQZLRKEXvq79ImwhmYQ2d0np65
	X2dEax69go0VE4uo3kAH0C6ZSa2MkfXIcCqV5Qqs4yoPNqPJvtH9g7giZVk0KxmQ
	gsCyY9HdVw1qwynoaXbSfC/440n3+ZJEi4SqdbJlaiy+NExfWg0g9T/3VDVzExi2
	6ik3ZirTCboeIpfycbkel6s3TRT5jWRScP/qW5qCLiM/rbJgAC0RHfO2PsDP+NFr
	RCve15TPTCe8sqfJZOBZT4joe/A3Ux+J//5E+C2OETWi09h0JmYP2gaapqEP9uFV
	yDe8YGXTSwHF8eOWqqU3FOcswrtZi82WDQnKtV2CvUz9sD6FbrbpAcvJFBw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h51g5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:14:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fc66ee6a4so5860356a91.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347244; x=1783952044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MKOt/7Ya0eh2rnAvsxZyC5RZn0azraaMZNkScT04os=;
        b=hbqyyqze2RqAriAPAPXPhrD+xC9/5nVi61BUCV+mArpjhV8jEPgTw3+da2QCZRiNRj
         licNaQSLRdrkhBZjizShmYv4O3kNwPmBV2YX0pCE1rSmCHLFbNKWSxKxmULF/wcOcmIg
         9u6ju+UbGg0VmNboU+PrYN6EEwb7K7ddYCOylpP/jqsMwTskJOgHnyOc+On9G/10JY3r
         zshJdp5ZU/O12B0aPLmYfjzV4g6zv5FGgxAAWxtub7IkOClhb+8Vlffy45D+3jJggd20
         IUpmCiPsUR3hXpMpPVpwOrReMrX8pTEM7LWigSjq+DdC0PemzfoN05YntfBXmxksvzud
         Q+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347244; x=1783952044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+MKOt/7Ya0eh2rnAvsxZyC5RZn0azraaMZNkScT04os=;
        b=bpM3+1S2FkuIUKCxvaNy+e9Pqfrt68Jh2uKQAu8VJ47ay5MhceiXpNe08sSH/6fa4J
         ByZpLlgs0bQMwf3VLj+KoWbgePzQU9p6J5iI56yf/SAiPk+Rj1/csZwIkcZCGqH+gRg7
         0952ZxpAa1+PKFmZJLtSW4Nn5Ybkl20gOE4yMXIDZmI1JLKY5i5L7txo+wVDopL3Tffv
         8Yh0iFCJLsiCJaH9tsTxkxElKZ3yStrWa7YeKJDQbd0hhrdW9jLhKlnLxELvsHwa2OtA
         hjmeDLlHCGGK+XP0C/TETeqNS8H6DRoeKnzuFbPspWQ5T4F/v57Z8Iv2UN5HW3KyIb8z
         qB9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro9lHzbhhk0Vw1OyCWQwTp0auLWGHZSsoI5OOUZF1HXSJFy7mi2MSdHuLHKVIIsijzxvcuN5Gtvegho@vger.kernel.org
X-Gm-Message-State: AOJu0YxINCqsOYd+8h2DcF+MP7p3Q9HRoo+Hj6Y8GETDixZ/WewlxbfS
	IlRw2+kOaQ1knvf5+FTXaeElegoGkbICEn/D7Z4u4hk6ZAr58HzMss7fJ0COug+f053fcCe39Ak
	BdK7WwMIqeD9OOUsfDYk67COnCTfD5FQVbU6wl7LzVVEuLM0iD0A7dcfKXnJnxNN5
X-Gm-Gg: AfdE7ckAzQA1Reh32ZLuw59j1dUodY5bezDqlxerldIHiP1m8nnQrmkGNuLrqAPkfoy
	mTS0plq1ZXurqFaP6n9uKaiigddIb/arIpzhuOIxk1tzMk04Avn+/hJ+gfZray24lk+uX8F+l6V
	wB06Je0CKUccnRpvIoIuVyckN519AlPEJNkZ2z9DimvAOz0eaVbmxjs0qYy2KFVkVEwUrFqoOmR
	GlPDmp5aKTDgIRDaYPTz2AHrGHGIqgTfSjUWiv7SL6ZYUK8lYO7REtFQBYcnauFEC/tUUNsPqx2
	cgN6KNndHo3L9TE+vyXabnlpg3yWD5IeoSZuVWliRpO6PSELeVUWOaNZ+K04+eA3Vh3iIXC+67k
	tYsaMoo3LJ70Jy/28J6dDzhJH3GB4/CbNatBu7g==
X-Received: by 2002:a17:90b:1c0d:b0:380:7763:3b16 with SMTP id 98e67ed59e1d1-387581641c4mr626226a91.19.1783347243869;
        Mon, 06 Jul 2026 07:14:03 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0d:b0:380:7763:3b16 with SMTP id 98e67ed59e1d1-387581641c4mr626171a91.19.1783347243299;
        Mon, 06 Jul 2026 07:14:03 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae5b06sm5118416a91.3.2026.07.06.07.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:14:03 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V3 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage for SD-card
Date: Mon,  6 Jul 2026 19:43:43 +0530
Message-Id: <20260706141346.4180348-2-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HnoWP46g24LumHdTpmV2Hirl9iX1Gg3z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX23H7XRDvvhy/
 vmI0DsHAmyP+Oag19mhYxsWykmRByQkRZa6IBtkIqr2guVDQ/VOo2XgA9i3M8bYdfNSf8DeH7R1
 Dk3BgJEfYNuIkeZSC0m9fGURvn7XsnA=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bb82c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RbnQZSTpM6gPS1NYG1gA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX7EP23VzVE899
 9ziiyxBpFCiYpTuRY9X0ikRduFzW2PHJG+7hbJ7G5eAa7tA7Y8REr2fLZA5zHNCTvFZeIVE76FV
 rVXd7lORl6/FQb/EkuUlfRqK/IPC/fOVX7GpTNyyO13AWZCXLiRb4REL6aM4HQcUDpVJKXGDul7
 hDqhEvM/cyzKw0HMn3VAkSplLjtz6/lPrrFS7frLY70L+7lP3EIMeVI1cQ1+ji5a9CR3VLNWz//
 8YsyQYXlutcVe/fpxQ/lRVlZCghgsvhzD92xiXwhATkSVGxkkccVk8HVLu70bTbtfcBZaOoMuD4
 /hWkCcsDIHcYZ7+2kLF75sHUzVieARPcjQ81Py5NbohFJcaNXF64nb7i+StHLaJFi+5SMwMQU/h
 8olpMxQV8Xtrr87XC5N6UAPeCxruPFJA+UWf5sHsCcs4s78MX2sXmTYH1tDHBHVLVb3SCoxPaeP
 DOXb4MxS2rO5rEl4UFA==
X-Proofpoint-ORIG-GUID: HnoWP46g24LumHdTpmV2Hirl9iX1Gg3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060145

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

