Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBFF421880
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575658; cv=none; b=jZDSghnAzYZvT8vqCOAmViDK27QHzjSiP5YPDGjX8T1PiX3FFAmlyVgANv/k6u2rU5tDQK0hlzHapE/fAHvkIRqfxHCdrnHSVLIYPZaqLKsplfz+jyXpAtXJZaLWPc3DxV6NV4rUTGdKRhf8ygtqnlwJRKhN35D7HLrEyC02GI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575658; c=relaxed/simple;
	bh=p5xkoa1gmzX1cE3P0oVCRxj95EpSdryxboA/A3wsVfo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rogFSq3k1iv91WGrf1iZ6cCxoq1C/8irt7iq/2KaHFJ/oWmevCPp9/bzmgXw90hCl2rM1W9GU/uPgdmlIpWLGMxOpkqha9QsFMq0sdG5rvtM1deu7ostGanqD7RsBuoxCiS7osCD0oB3YSmhthL+OuYwBbhIeCYxA0pE+B8t/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkSlNpTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jO3h6HsG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkSlNpTv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jO3h6HsG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BJoKM944404
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 12:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=shQsQJ31RNDx6YS8P72R3K54LrumYBDuPna
	sYDlIeVs=; b=GkSlNpTv+1E4moRuv1BAC3kOWj9w1MEWZ/fO3nBL9VAO5wSCqkH
	7YVqndGukM2rGajUq2S1pyvmeK4kNDdHt54v0TxoPKeZHsjycCRnPCMQ5JcJ/Wex
	Q9uKprDdd2ecL8fPs1JmKhq4tGCAixM9ies6bUvuVGvnF9Rv7+7fSG/b7P+iFVWW
	/epj3CKhdKrxNLiY9WRLroZqDZNMoufrJ9PsIB4vI90Zb81yJ2SuI/iIW96D0m3B
	3nwJvSXnWpQ3ncnvbjEs+Y2K0zhsXdL4RW2CgoFqhZEoxn7TDx9H5OLIiizXVwdO
	FMfbbw4llryJnvkU+Ol9XIYjgWG3VJ4tvhA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8d507d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 12:20:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c859d79c10eso805314a12.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780575656; x=1781180456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shQsQJ31RNDx6YS8P72R3K54LrumYBDuPnasYDlIeVs=;
        b=jO3h6HsG5t8uhRySCRfkhAtWY7UkMisd+sThzIsT/y8VKbKAUETkKllpAmg55DeLAe
         nOf6YqD68WK5qVNF0OVylkHKWmnjUvsJ6DGEDviVAfb5/nu3ra4okd2Y5NhKUempuRI3
         mT/DKf/ZVz9AZwm3Z9P6EMy98y5L9FdaDK/FN9JJwsGIUWnaPKvsSsmTs4c/99zuUmeP
         heirnbgVJGW6mrl1LZTuo7uhczSRMs7k8WI+p/1HviMSJauECRmzUywauin0n9mKDiZY
         JYut7MyeuCW5n07gkU83SroL49GamZnsLixCezjPDhIcEhtMV4bbhBUCv2EUQDEKg6Qu
         OH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575656; x=1781180456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shQsQJ31RNDx6YS8P72R3K54LrumYBDuPnasYDlIeVs=;
        b=DE8wzXevef9uS8cGULWbCF9KPWRXKaMeiPWCL48Eq+epl/TlEPJcpy3g0gPmISGo6l
         0nT8X2ZbRvNfn1ji1OG7xMkLTwD2VzpC5ZhqF1+af0qL5mSiDCfnV4NqHphAdyNQ4cua
         8BbjpE7rc2ivt+5Zw9ryN6kozlDQ4/xmhMXHM6J1KMXP9bMTHvK9xwG/M5sFEWZCdJaY
         X29AbbNwWVStGdSc+YQrkNn78iUSbnNOcwYdWXnFzHTuS4MjbPJ0wf8rCrSZ3hT3wLRc
         GtNeF03sb/+8/RL4QfS9GjAQBA8x6hhrDyaGAR9MMds0rgWXiLEm64tsk1+xcV6uSU3D
         Ul8w==
X-Forwarded-Encrypted: i=1; AFNElJ8myuq+toUm5i/3PfuJJcXVHYzIFCulgWcQ5r0fhWWzUW9JG5aQhs4nBJ7MIDgnaq1hPplFGyjKv2Wl@vger.kernel.org
X-Gm-Message-State: AOJu0YzzdjQ9RbmfGgCoK3rGmpvUyI8nEjhC0NQkDIZ2mqIkHknGhr+q
	IySLNb/2pTjsJDxLWmhr6NCfNnlg88Y3zjTODC078VcqQXVbUNXjj6ENVTlSLXUY27rVmZTU9w2
	yfEvCsTZgyaIyqk+HI9a/9VSMRKSNCjIcQcnDvX0P9kUcG5VXylPDWylv1qb1r31y
X-Gm-Gg: Acq92OFNASV+jqvMt8It9NK/6lre01jnnF0Ppl4rlib+ukSsITob9Yx9/EY47qHENIF
	/gwq0zVfb4em3i5plNkSbJ8tV7/7x/X3l80gkhSosK/GzeO6mEfPRfF9FZw8kb0yPgK6PC/7g9c
	x4++PTBs3INePqnvPC4BKUCSDQKpo2ztQ0xZrR9zLG6O6tl4GIkVwiobFDwae7Sz03eJabANJJN
	MhztUKo2Itl6S9UtsBEwWwcpE80Wokir14Yj3cxPPCTOLdNJpGvR/oGcHKyT1ypxTEzsxVdb7oN
	Z2VOxsplW/zQa+jNMAB0rEkThXhI8vPLd9aMaLPTkuh+IocvxDAQofi0RoBxjtP6+2BwVOa3Y0O
	1flVVtCW6rviKIdaGFY7ploKSztIUHdKT115ZlvPHXmktq1TZHkxrXRUv06HIqdSKG40=
X-Received: by 2002:a05:6a20:d612:b0:3b2:924f:70af with SMTP id adf61e73a8af0-3b49798a73fmr9004093637.45.1780575656069;
        Thu, 04 Jun 2026 05:20:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:d612:b0:3b2:924f:70af with SMTP id adf61e73a8af0-3b49798a73fmr9004067637.45.1780575655609;
        Thu, 04 Jun 2026 05:20:55 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df045c2csm4796903a12.12.2026.06.04.05.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:20:55 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V1 0/2] arm64: dts: qcom: Shikra SD Card support
Date: Thu,  4 Jun 2026 17:50:43 +0530
Message-Id: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0mcGzuPuKPWNFPMfZeBWgfLPAVHwwPfr
X-Authority-Analysis: v=2.4 cv=IZG3n2qa c=1 sm=1 tr=0 ts=6a216da8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ms6Ar7DOZ4z9uL9UNCMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExOSBTYWx0ZWRfX2uqiCaPJaip2
 SQz3r7PLh6uCu7RhV+Z661UGykerKIrT9ifhPiTI9F9BEUoT0JYiW4OWRFlEbpCO+3JW8z1wJ6N
 nv46IrCErrXy5imkelc6ieieZG4LiFgDZX9qtYC1vTGMZB1zc0cD5mY7I5sby68eXJnJlNMO3Ke
 GjoAeZQcBy1gcrrNwF44tholghj/6+bPTWjs7lAShfRt2rC7lTlVFmSMG5pXI9C3uk3/vXZcWtf
 kGe3MhpKckbFO3HU2kIDC6FERBBQMeJZJnIjrcyrxhJYDE3k2YTw3CizNIsO3ejyXlKpkSJrSzY
 CoZiKOCaxcPx5My2nqwZeBISdMYRZap0IRApu5D2IV9A6f/6KtylUaV1C2aamued1VklNBLXjEs
 VcWkBIsWBCOsa51YH/PiNsKPl6PEmmtmTZWSKE1h+WAHvv4qLM4YYn1qQpZScyZNBwbTeBJRYmr
 ToY1rpvyyolAX/PQ4/g==
X-Proofpoint-GUID: 0mcGzuPuKPWNFPMfZeBWgfLPAVHwwPfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040119

This series adds SD card support for the Shikra platform.

The first patch adds the SDHC2 controller node and the necessary pinctrl
configurations to the base Shikra SoC dtsi. The second patch enables 
this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
the regulator supplies and the card detection GPIO.

Testing:
- Validated on Shikra EVK variants.

This series depends on:
- https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
- https://lore.kernel.org/all/20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com/
- https://lore.kernel.org/linux-devicetree/20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com/
- https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/
- https://lore.kernel.org/all/20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com/
- https://lore.kernel.org/all/20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com/

Monish Chunara (2):
  arm64: dts: qcom: Add SD Card support for Shikra SoC
  arm64: dts: qcom: Enable SD card for Shikra EVK

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 93 +++++++++++++++++++++
 4 files changed, 147 insertions(+)

-- 
2.34.1

