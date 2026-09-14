Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DB638DC71
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370397; cv=none; b=NgaPLwvFI5D6xmQmeF0tAuyp5s4wZgi0hYqgzzZWTOK3rnbM//MVwJU7dFPWUN6rUScjg6R92ZPA4zfsvwLsipnWlwDSbAbJRP389MmcYJT+h1dhJ7iVFSvUdT1nM/piesCf2cGj+X71QVhf+0VQ3xGvc8Mxdm7kppfgx/q6AYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370397; c=relaxed/simple;
	bh=q1ljk6z59O3AZSsPtTvFwtfAbufwzglG7sgdImtEKuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PEAFMYIsTAaEkTZeTh76xRQunqngWEDvmYofhsSSPG1s5xlYM+NRAsV8GI5tlkvhW2tK2KI0J8SxtjUUBe2kLHkJmJPNif2thLrzttQcff/0x9/LqJwtPvF7NSuQXl4dtRaIE80rT4r1mVEiT1Lvmu9hHyRhDjBRKa7lZLEDG0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oh7ZNtHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpCm6s0Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oh7ZNtHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DpCm6s0Z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ivWq3739594
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8SX7emL9Dk1aIYNg0ZKMDsjeP+BjQgq7Sr3
	pyrxA7lk=; b=oh7ZNtHMfgGyk1NZaM0giPbdhcB3eNh5vnPn1xziodmUx1fMcYu
	WuIjEuh6WOP1By5B8ArVtOgWvVzKj0DoecFbpR/SHcjOKJxuX/AobS2ELXaR6N6+
	fLchPo2BVqkQvtG7s09WJESxrHBwAa7kOk5cClZECOV8kky1IVSsFfAGCkXG20mg
	2MX8LMg4kdUayhKoTcaxD4yg/l+RfGkHr4/c5wa+JwBcn2uQT4MFGSH3I1M7k1ap
	YT3ULZkPkA8lBTYNk5iBmgYf4IWJ8ClvNHdr8YHt8sM+jWhlXWdthfB6/Fi6lk0+
	ZskJGKroA2KNvSMsNb+Eu+cgcwvUPKAz41w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddfwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:19:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86917d18880so4563710b3a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370393; x=1789975193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8SX7emL9Dk1aIYNg0ZKMDsjeP+BjQgq7Sr3pyrxA7lk=;
        b=DpCm6s0ZgsAQJaLUnUoZVSR8UPp5hk/VEyzEZ1IWQyP0fkxsOE7Sm/guxItDnGgZdJ
         vTSp3EPkBjAqhPnKaT86UYDApt5EvJo0UOcobNYp73hOIxHzPfeUQQXIVw5W/RGyXZUA
         hNpj4HjG9W02aOlEq/0u8MpVljydBU4spSe8+KimQg74MXB/Au4qWQAdzeAGl1AizNz6
         3L34pLd4J0zc85RZvMjwvJquGugwa0ezoZdvWnaGNQ2B5inkNnoEWuVjcE7hN7GFJLcH
         JOT3fHIIC1yJoWiZwZxB/i16hbHoR/84i10ryZEOXPWC/lCIzUBy6liMARNdlVysv9ma
         Byzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370393; x=1789975193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SX7emL9Dk1aIYNg0ZKMDsjeP+BjQgq7Sr3pyrxA7lk=;
        b=YxawyEWo4xgl79eScC5jPjtfpnvpWsjr769y6k6STBHWrQ5vcPktVB0TpkniMGFN5v
         04HDO2Y762fvZz24DdJ6jNTCAUwkAkEtJrz3Ic9dx0DJggLA9VTiDI9H3gY0YYXl4mpD
         OneeQVvSEdmzF7vlclAAwcfYJEpNXKsZTB9sTwrAwFTZmA/8i3yGGwaStBWQ/dBOgN84
         P0ZQ83E08PyCfj35i8HqWk9t34LaRDdd2Ka9YbnCwWRNA+1y1ps7rxWdbmpHC0m+1MIM
         CTSjb1rKvutO/KIk/qTpBvcfGGFgeuVg0gkd5frn65g2jOS/pb11cE4ZK+5KWAu6zlfK
         VqQw==
X-Forwarded-Encrypted: i=1; AKwUvBxW+SxijBhV3L1bh6nh6kNwk6BcHAK+BqpD0euqb16YCX4yTfSp/bLWGVyIAodx3Of+FNanN8eDvVaw@vger.kernel.org
X-Gm-Message-State: AFuF++m83hTbkFDAN4vakKX+bbp4qoO1k2YHszrCRaJT1cl9WhDZxiqT
	If3J6UyQ8UluxqjXKdXHJRq9cjKQH6xoHOVdKJn2g38+20+L2d4sLBuvNfS2V1UTwcIlfFjZyIU
	tmizsf+4GgAPgQCwOMSa+3ngvnRthyDpjkEzHIUb/i8tcU8sWkK7kA9S5po3P3R9J
X-Gm-Gg: AYBFou1hEWwjX0aTem7IzDPQeok/xlT8+p63ZL2SrKMDfzWSzNIUwt+fupNN1aEIHP3
	f933Kf29zHsjVNKUU/AjgxBtSlnxbrSjmKZRlK9zPotindqRs04eXH9GGD8ibjg0vQYCk4MuZEU
	SJn8QzC9MtiwQJcj9A5lvm8dU2JGKnzpY9KkN2qUOC7eVbNC3jeQ1jXbg+lGc/Qe43ZrSXBkHVh
	u6/DzH+JNRx9PWir2ut25R50lLSyBDq5NCGE1c0fzO/jqztwUZm0fmfJhLa/9Y7guDHUewwAjhy
	VAq6TOmfIouAikgfOfbTxFsBXGmdvde4BYvc26CbZiAp1JKllBhQTBOS47Taq4qjvbdo+KNZvos
	LsXrDpKngYU9MeCBi1rK2FflpXaPTQX6IGn5nCN/D5CdXcnNc6lPwOz5ZNZzL
X-Received: by 2002:a05:6a20:d70f:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3db4039d992mr2900070637.4.1789370393464;
        Mon, 14 Sep 2026 00:19:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:d70f:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3db4039d992mr2900019637.4.1789370392985;
        Mon, 14 Sep 2026 00:19:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm14782238eec.9.2026.09.14.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:19:52 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: nord: Add PCIe and WLAN support
Date: Mon, 14 Sep 2026 15:19:39 +0800
Message-ID: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfXxqQrhSx2gkuT
 A2ZeVbzSBfOq8xI5Tyhy8S/G2aN6VJtQtXHvW80XRwnOrpfLLP/TgswaJxXherNFalBthjcai86
 fZXUdrz4NLtq/VKPC3eEEV5B9guNM9fIqW291IwWLYlR4sVNtt0AUsV5veUFSuw04mKMsySjLyH
 hxT5rvVUaLWawFldKPdN5cJ8M0JxZtoB4WreXziqQTUYizqIgF5Az4Ws7NAvtpo0JwNdb/bTchy
 A692W7PXul8s0gZT3OPjC3drF9Tzg3T8dgTV9AQo28Wku8jgySIkfo0IlWY6JoaoQ6DxRCCRHCO
 ZIQ/CdGca1Lja56FB5paw8W3bMIFndaLtVxIK2VOUCMszDYMxwdVIrcH05t/aF5oYhIZbwL6EI5
 qsHiCk/pdq99YDLZsb4DunB98UMPkX6bBVGPuTPlbMq09Q3nymFXwVXpUY+Ah7r8DFs2sJOUK/A
 mojDMeuDmj1dPnBaydg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX/XQT2+3kotEV
 4WG5fVclX7nQ0VRNcFimOr/Hzt3bw7vbt9V5xcO56WRswpUjd+UFTDWXlnIOUtZHf9c/ku83teU
 qQYUZUnSdcakgKPnL2mkqjYO7+IZxfA=
X-Proofpoint-GUID: e7wMIjnjhVRZhHV3pZHVY0CfZqodXp8f
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a01a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-CvtibuEYNIfTV4diQsA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: e7wMIjnjhVRZhHV3pZHVY0CfZqodXp8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140103

This series enables PCIe on the Qualcomm Nord SoC and brings up the WLAN
modules on the two reference boards.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY.  The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.  Patch 1 adds the PHY, the four controllers and the PCIe
SMMU; patches 2 and 3 enable them on the IQ10 Robotics Reference Design
and the Ride Embedded board respectively, along with the per-port PERST#
and WAKE# lines.

Patches 4 and 5 add the WCN7850 WLAN module sitting on PCIe2 on both
boards.  The two boards power the module differently: the Ride Embedded
connectivity adapter card derives the core rails from the module DBUs
gated by PWR_CORE and PWR_CTRL1, whereas the RRD generates them with
discrete on-board bucks behind a single core power enable.  Both are
described as they are wired.

This depends on the Nord Gen5x16 multi-PHY driver support [1], without
which the PHY does not probe.

Dependencies:
- PCIe and PHY: https://lore.kernel.org/all/20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com/
- DTS prerequisite: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shawn Guo (1):
  arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support

Yu Zhang(Yuriy) (1):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 151 +++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 158 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1528 insertions(+), 4 deletions(-)

-- 
2.43.0

