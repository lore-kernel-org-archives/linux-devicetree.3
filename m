Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAAD192590
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790560; cv=none; b=cMrE2YMPl5lD/ej8fQ0+VEu3va6b5ECwF9waXqW/UZlvw1n3cMEjxZHGq6YrIoAMfmxcm6Lw6p+S+tJsE0u9BUrE2v0wU5z0wQlxzNXNtc8ThddNqVCAjPGW3gryb2DKaKrcN4oTBLgsmNORNwuM1hExL4AJ+kl5TtOyeZy91AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790560; c=relaxed/simple;
	bh=f4pE3Zvzu8P+DAQL5vVTUoJYEDmfp4P9T4XKe9DB7Qg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IN6AVDkT8pOYi10lUDnkBonTqI64t/a3vHWwum7EBZhGi8cSUSavB2alBFfxKETs07LGfXrBrpbNpwFBrTxpQzuiDjfnOLhGmd3LIFkIHgux7LHbHdW4mQOe5MYuFJCrU7er9Eu+WG+e8hSBvsYRMfSMOV5hRpsV1xFywOPrQSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyUe9AKd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+DjJjDf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyUe9AKd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+DjJjDf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639NE6C43934613
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1dxvGyIYidYhvhxvl+4gTd
	su1WHR2txxNOAVJpPP3SI=; b=dyUe9AKdQ5T3fvjwxp1IOOP5xvL1pC41J8oS2h
	4Aw8kCxYMQfq/OaSW4uS2j00FfZTaQUOnrOCm5ziLu7SU30zhwpsdBcKz213rep4
	Ik/7AUcR26EB5KJ+4NWmw1t9cZ+dmxibI57JJIqRQyHm2SfVdtf7dBDYgNfVJbmV
	tQF+hyX0/QDAlzh83CqliLnTVcAD68Y9p4qDnVPaynUo1Ngmzy2INR8Z0ucezi5K
	ZvYU/y2nZovHuFqoM5ikOSqC5b4SzU/MacUpw/+u/6kmhTpl65AOzk+DZ7sLPpNM
	fDL2JQiLHCTHBDqAYxFqiIepNLmJn+IUksgTVXtr7MVCEJzQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5saaca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741f038f7cso1115363a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790557; x=1776395357; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dxvGyIYidYhvhxvl+4gTdsu1WHR2txxNOAVJpPP3SI=;
        b=f+DjJjDfK7c7qms3F+EWsCR6nzMEQpvM8SdX8VmVB3c5ijW5NantOxlW+wyyCS2/2+
         56FhZpTdZQRTD1Z+hRhttgC8iF1Bc+qqq7ITnQek4nWmAne/9k9G7NB/2OGVoJ1LaCXG
         cSnquL4gsnAtAFK1gWNX/PGaaTHrKVZVUYJZ4HphGV8xLx8TACG2MpxorPn9jexQ6L3K
         96JFd77RIjsAl/TQCIE9mFs/300sRiZ16TdYZltmO1ihdUPzM52GP34qdMRxxZUHZd+U
         MFOGJKC3NTaI8MVjTedugSsBo/llVGN5qCprTvVuoF4sIoRHwFgirBABl/2+bXMfG5Fb
         6kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790557; x=1776395357;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dxvGyIYidYhvhxvl+4gTdsu1WHR2txxNOAVJpPP3SI=;
        b=fupi2xT27GGUD1OOWhElal7PGKID9LqF3Ik01yjuzecZCKAU12+3ry3pKIlgmWgtnh
         N+VjEySCJTaNRObiydUh9+5ZtPRHvwa90f2xl3av0DQ6RtPR92/COdumC/Xv1EcOoisp
         zdNxfNPnZr2iA+Kvu05xervP6flgtGS2ZW3mptbmZ4POW1/yBjvF8iZpz/JgIul4tQ6N
         90MZTVpYXOKbSDeCDdvHWzkALva6o/ufWYvf2sh0VVCKRIg/u1efzIrWqaxps1brhiD8
         OyTle7DymSbq4/UMIDsoepbDgm0odEq+OcOSIQWvdZ9JQXF3xjLM6zUwe+wUq/JDcrMI
         H7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7L8fJBinvShYf+RxRSNRZ++M0tj620/OTldUhRcrZyROW0tsJS2w4cIcfeFBuyaiyAscIPaxTxq8M@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw1FQYbwXtP94GRLDNMAEdCgTKdQblgxSXghKnGCZxrD6U/VEd
	yvbkwVPR0VTppT9FZGi3z6MYQ//TrqHqsKbfot7hGKBj+Wgq/UNFG6e/nE3fFT/HdZPwaJ0HN0e
	nmXTKWam0TYxXQwUe7aSCdhnab9VNgf/MxaJHQvlk6Hbq4i0p6tQ7czF8gn6bzKSgdo+vfPHJlG
	w=
X-Gm-Gg: AeBDietidChMADdeqDNDgYZGDHHpxiNS9DqrMkjq+z67pOuO/E2eaqVOij3+ZNvPT1F
	7p5BKsdNJMCYi9T+jlaLFHNJSjwSpBuF0VjibQigi51NjW35c2pFZB0Wb6oBX8Lhn/7g1Fsle9Q
	efEVT13/otatR1YSIie9b7yhcayhwT4SGYZACJwSIpda/LIqs2wC32LihncRs7a31PXuevA9qjn
	3fFZCaveb7viIz6X3LrVgFY687+RsGuztK5HwhNjd2y3sef1xRYojsYKaW7B0OYHG8+RlzRtYkV
	GvhM1Jlv5Un5ynwGqw+4iiWqbVIZjoTV+0Ah4eF8DvOTj0olYAloXcvZULrsneDvycX/nyWeXcQ
	urpeA38y3BO0ktXbj0Rb7R3nbjmWNS9wHdjQP/yLJc1lagqtMA6djDSMBIrQ/a9Che1IjKRrxBH
	NQeqmNlHke
X-Received: by 2002:a05:6a00:39a2:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-82f0c12fe3bmr1673259b3a.7.1775790557406;
        Thu, 09 Apr 2026 20:09:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a2:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-82f0c12fe3bmr1673222b3a.7.1775790556938;
        Thu, 09 Apr 2026 20:09:16 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: Add label properties to CoreSight
 devices
Date: Fri, 10 Apr 2026 11:08:43 +0800
Message-Id: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1p2GkC/x3MQQqDMBBG4avIrDswRrG0V5EuJslfHRAjiZSCe
 HeDy2/x3kEF2VDo3RyU8bNiaa1oHw2FWdcJbLGanLhBenmxxsiLeiy8Jw4po9g07xxrG8C+far
 zOkgnoPrYMr72v//j5zwvAMwkAW8AAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790552; l=1836;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=f4pE3Zvzu8P+DAQL5vVTUoJYEDmfp4P9T4XKe9DB7Qg=;
 b=c2AMBocaCgdp5XASf+9tc5jXLL25cJ4skK2xhtfr+ujQf4C0PckbLaT1PJJaEmi5es9WQIiij
 WkeK66K5wu2Bapzlim8Y3eADnkpIQ3Tpl/OPFa6Krd3e2beInRT4dqW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: sIvR1rCNc3gcYjFOu_ZRXr-nEzLWrAQY
X-Proofpoint-GUID: sIvR1rCNc3gcYjFOu_ZRXr-nEzLWrAQY
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d869de cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=l9IztEvcrmCM-arMvcYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfXxv/mWpNdmmxn
 Eja6H5PChu4UGQNkfUHlL2QQdEHcwWaywJ0bymg9bj/pPMm1rEIvhgYFWWArlu6WyNVT7kI5ubL
 l7nMINdb3RMq7PZoJYf9Gz3+IiRcWitFoJ+6j3Ac72C/tYx+Nq708DWEau+wmzw2XC3lusnbwos
 G1xNpqk5nULzyexVkCQkj0TYdZApoFDZj1PL/UKfSVRKtUHyXsNxB6YQPsIxvQHSeZkjQOzre00
 MMVvdWGl72x6fT+en7YeO4nMyToYmTbw8uwRPeddxOW0juoEhRzCQFu9f2D5UWQVa4E7yZKWUax
 Y/RFH9qXVlGwdEHroM61RMZV0hFoRHCKPYXWbhU/zjejVXjW6XegjW9mnbjh8r85oBSNXoKMppx
 OQnh8rf5Eso1jvSNPwOQSly/DVnBOFxL5ysiwOoEnhJ041g8qWGLbzIX0QigkPWF7Jt84OXZW12
 Jlg8gZQwM4JWsq9DISg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100026

The CoreSight framework and userspace tools identify trace devices by
their base address, which is not human-readable. The label property
provides a stable, descriptive name for each TPDM and CTI device,
allowing tools to refer to devices by name rather than address.

This series adds label properties to TPDM and CTI nodes across seven
Qualcomm platforms:
lemans
talos
monaco
kodiak
kaanapali
sm8750
hamoa

With the change, we will have a sysfs node for each Coresight device:
root@qemuarm64:/sys/bus/coresight/devices/tpdm0# cat label
tpdm_spdm

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (7):
      arm64: dts: qcom: lemans: Add label properties to CoreSight devices
      arm64: dts: qcom: talos: Add label properties to CoreSight devices
      arm64: dts: qcom: monaco: Add label properties to CoreSight devices
      arm64: dts: qcom: kodiak: Add label properties to CoreSight devices
      arm64: dts: qcom: kaanapali: Add label properties to CoreSight devices
      arm64: dts: qcom: sm8750: Add label properties to CoreSight devices
      arm64: dts: qcom: hamoa: Add label properties to CoreSight devices

 arch/arm64/boot/dts/qcom/hamoa.dtsi     | 30 +++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 35 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi    | 12 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 ++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    | 29 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 27 +++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi     | 59 +++++++++++++++++++++++++++++++++
 7 files changed, 206 insertions(+)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260409-add-label-to-coresight-device-b17a2ba6030e

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

