Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC35E1C5799
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695497; cv=none; b=YZv/y01IM64BCjcKkyovdrRPaglTbiORRW5cHXu3Y4qGYnMuJZBtOAcfQ+QEvQrMbfWgK0+eTQubdeFDmL0Tv5zuvWb+BqZGteqUVBOlXxVql7QDK4W9lT1w9CuP0zSLFfrsrl1a7Uvg4A/3uu1l7Ou36FVaFkOD4U6/3djcpV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695497; c=relaxed/simple;
	bh=TPOMZ0Ibtw4HolQFNNFSkZ9GSiy09loNaQa6G1mBBco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UFov3HR72HMvpv58Mzvek49c/z2/BABN60RrJBNIvrJ2qTnf7FUCCEiF1BEVahmydRR/kr/Aa4bqVf7H87NRxetTU/PwBajvYSNs4Opf2cM59SwzXRcWFYyZANBSa1g6gKpRjgPgqPM4+kwhLcFCGd+Yz6bJhI2kY24g8KJb2Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYm74jzi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4HgO9Gp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYm74jzi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4HgO9Gp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLpO2c3859915
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RJFv4jaDk9DSuiAZjb8SracgSSjeQqpG2+n
	DPX3Lu14=; b=AYm74jzi8Fdau3C3hyuKAiVmE5PALKfzjjHiIwGCLSZ7avd462N
	EhaxO6+72/PB2u7ry21VAwfZOjxMq0ak1HaTKoJmwzS3QuzdrfdH3Ib8a8rlKEOD
	ibYxOkaHMw+JpfkGd5zBTdjIM2AsXp+QLxOEMSe7QyoIh7TD4K2A1O9Aly3qql6I
	O8qWbqPGopb0G5WILOZ9jM3u+GGL/+2U7x1ygf1DBRfa8BUmC9KOYtN7/6vhvoOH
	WTf3AgkjTddGhuNKxAz/JIkDByEa6H7wX4yfgEUAR2qriFuAmpeRTdKDJCqReyMq
	1MCmZ0kZQENSNMAK7B+GddZY6yyNhXDSAUA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg40rm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:38:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e25a5f6e8so533410a91.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 18:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789695495; x=1790300295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJFv4jaDk9DSuiAZjb8SracgSSjeQqpG2+nDPX3Lu14=;
        b=i4HgO9Gp6gexbvZ8Ym+rQ0INZXbQkeV8AeTjXvMcahZJmpqP6rmu3YL1IibRcwu5tz
         U9rhVBWGo4/r3zJjg5GuBrkqebWpxzMvwwcLulErwKu2Y4W8WaaJ5GC+PSlqwonvM2Bp
         TebG7+nqo6tz7fk7Aoncwq8S+XneBu1V+54xA5tT9ScHNVrDGC6R99lqB/fBxjpjWO2/
         bosGaAw/AH0YLbwMn7JJWs3OUnrguh4swk+XWSH9CThTLGmMKgLIiGqtASJOt4Sx3E7B
         9gmXPrZTv1W3QlSmZQtcnnXY93C3AaCpD2KD0w5aXIZ+IgYGxt0Q4QrHHnCkVnH5yPoC
         WzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695495; x=1790300295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJFv4jaDk9DSuiAZjb8SracgSSjeQqpG2+nDPX3Lu14=;
        b=P3+AQc4EyZGNuEPP2epUy8++VLksZoLCDhH7UoMscmW1aPlTUte+f8EPVzBm/ceqCq
         S+MvRxYlVy+r4ITq0gnkYCmDx49jTMAlWZi20xX1vnR7ZKcu2UFcA+Br4o/26iYjB4FQ
         Codt+FZ2AloO7EjV9YpYtPbMOG+hkvHjLik/AtN29656UABBH08wKlbI4QLAhrH2nxoJ
         6P8U0CYhfAd4Yw54sq8iWNOkmaDFOYNn+E/vvLN07s6IfOwrnTjMibelbbwvPHfaV7Q6
         YcmVHPaX4RFd7TZ8tSeaS/yVjOecoy3XlbUbgITCEa2NWVX79i5B8MPTRYj3q8ivUPIp
         Anig==
X-Forwarded-Encrypted: i=1; AKwUvBx4rMZ4IFUGSlpya0/c00EwsZs2Xxi4l7G7Of/OZCUstQlOvN7xiVNdZRMd5VdsOwNqtteGXSrgskJz@vger.kernel.org
X-Gm-Message-State: AFuF++lwIzv64bryJpMjpuZjcWtXv5ZNCDokcZZNss2wI72cTHoW4LTa
	lbNiNbdgq53x6AiS0by3LPCJWB/levfJ7jZ7g4XEFX3tYpdBUHxXpc5YXEfzWRoBuH7iPeCzMUK
	ypWgdknzsM2aUxRcb4HcPZkX106ch/KspT7YZzhjlDRjHcL+jB9EuwCdE1noNgTEI
X-Gm-Gg: AYBFou3h6hzKd02AgHZ5WLlnvu6rlBT0dyJiBxyMJHYGEMfeZ/FQxpVkZvCWWkIuCpD
	YlHyz5g1taGyDM6M9QZFyjchcKiMkMMOK/OvpOwFhZpIMbqz2XpP4WZ3u8vSYC0pFcgeOKEdDYk
	FsuwWu8WaxyocqsjiNjD6ZGGxiWglwKvOCnFBCjAjNCpmA8UKTtyfn5jwKXjXwQxdx9nJec5NgR
	PwOYUYfwNDenmWiNYAQh3MVW1kLX2Tnn9vGfI5lwBAq8Hr/MheYbCrlDtCeRRJFGnmIIhZ+YuBw
	RdZlrG/Vz/megieNqauhawvTqwPSjJQOtjIwLhr/XKKtCpP3fnzKRF0mxMaD5ZE834dUNH+rs7k
	EDBHcEp9WRKZWvMg6c2y2QQcym9N/snz9D4W9TrgO2cws/xgsA3TUTW2ylTpx
X-Received: by 2002:a17:90b:3fcc:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39e54c9c4f0mr2277677a91.22.1789695494619;
        Thu, 17 Sep 2026 18:38:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcc:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39e54c9c4f0mr2277624a91.22.1789695494193;
        Thu, 17 Sep 2026 18:38:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce03c682sm821276c88.10.2026.09.17.18.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:38:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: nord: Add display support
Date: Fri, 18 Sep 2026 09:37:36 +0800
Message-ID: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9lmPT8K_NNQYra4YJZ4mk30A7mfVwzmR
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aac9607 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GFXy-_TRr_QrNxvuQDgA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 9lmPT8K_NNQYra4YJZ4mk30A7mfVwzmR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfXzQNUIdEe5rMX
 1zY2FwRfE6MtbmVIZXc6RD/agSKnwhNupDPvyksjjnIFLTdKFV1Ko/Qb/NfVybaBjK1xpdw6e66
 lA+6Zk3T4Ozx9YlbLKApSQV+3+iDAX3Y3xw/RLULIcnM0M9Uo1pnBiH+1854CEE87ZWL9uxcr5g
 bZ5lZonaOsBZTCFw19lxsVq6xhG61WD+f+1ag0we+EKuhyitF/pgyd9TV2xPzkaNAfm6cMZmH3L
 tObhyCFnKL0NQWz2E8iuHhEInPSC/wN6iE3cHbs44L7ke3XRApUhh9WPLGvsdRK7HNAPtBMaA4w
 qDL5anMP6FJUFHPthdMCEO0X7cAzsBqSJoKtXTxLd8MBgAXoBU3M4FXrk2IV8LCI7iCUvq4ZFLx
 QRpoqUAV7WVDly6YB6++Os82z5Ltl0fqQN3/W56xoToyTAQ27PPxJtJrsRGjqMPCF3tYVcWWkK8
 v3DNXN502dPqwZfGBMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX/UYlX9dtXmjL
 hvpBkIUaQ3hOSZWysP1QWliD9Q/kIhppZl6RulJ+gkYBXZOM0bk/qqteehr/xldXzZ31g9v+KJd
 LFSdOl8vGGdyVNmiMPcwJhKLB21KgNE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180018

Nord has two independent display subsystems, MDSS0 at 0xae00000 and
MDSS1 at 0x8c00000, each with a DPU, two DP controllers and two eDP
PHYs.  The SoC is DP-only, so there are no DSI blocks.

This series adds the display and remaining clock controller nodes for
the Nord SoC, and enables the eDP outputs on the Ride Embedded (eDP0-3)
and RRD (eDP0/1) boards.

Dependencies:
- Display and PHY: https://lore.kernel.org/all/20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com/
- Prerequisite DTS: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Ritesh Kumar (3):
  arm64: dts: qcom: nord: Add display subsystem nodes
  arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
  arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output

Taniya Das (1):
  arm64: dts: qcom: nord: Add more clock controller nodes

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 615 ++++++++++++++++++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 128 ++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  62 ++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 266 ++++++++
 4 files changed, 1071 insertions(+)

-- 
2.43.0

