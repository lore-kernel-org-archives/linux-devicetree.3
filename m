Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391265;
	b=5YURM5ElGck7O2ggcLHEHoMsEs+5aRH0gKVhlmVDW8Gf8WGEl0+SHRjQAtwOdlx1C+nm
	 IhzfHIztoEuR37laWgCjZi7GT50v+8OjmPJ4alAeP3k9vB1pTbm4q+zyo4zpQ6W99WyaH
	 RjjqGxPQc2Lk38gK6HuBSnF1lUv5D7n6vRE6uYAmaUcQyGbgo6BFk73j+93IQOiQamm1R
	 ruSab3LBb4QEXMZCsqFoBC7lpsP1bpjZsWGy1hdT5av65GcQeMuTs5I7te/slfG5Jvddc
	 QxeR4MiW3pefpJkT15F86Kv4AJcGz1/A7YDuHRAyE6tDjjNwTRLef6kSr71aPX0kpOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v6371ZwO/zAJsKINRttU2qdrq8Z8ZGN1i9eIzeAJUqc=;
	b=JLe+PEekP/YUL1kCD+8qwurvUWAc70VR3HVq4hIg8w3U1s9UmPlOuRKq0DAz95M1tPvr
	 OqqSrKDUtU2Xd7ZVG2jlRSsuBp/nq9Ro7dKOo+My9AC1/oWQsRm/3quCSTypPeyQU3XPn
	 Vrnr41vmMmqWI4wo8XlePKm0tdKDP1xt5nqxqZZXAmOUI0rb+1EZsyis2LocR2mE8zU3m
	 Uq5qzO7/SIoUhychPwDmw+kuywbnSs7qgL9+QAElDUSihelRmgUcj0svF8hZH5Mkt0Eq4
	 DX5XDWauh8AsDFkfzMT/pKPwYra1vKw2jW743LNEdz7YvosfFDupPVav1UTepp2fAzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EgdJAR7y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwFPhT6v;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181CD60A2639
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181CD60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EgdJAR7y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwFPhT6v
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB8v9JW015539
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v6371ZwO/zAJsKINRttU2q
	drq8Z8ZGN1i9eIzeAJUqc=; b=EgdJAR7ymcJOO8bQxiHAAkLF5VE/0Uj+614Co5
	Ksv9ip7RStWBdziGphGa0SHGA/CdbszlhpNyMe8SnHFtNBA/wyQMsGuyMajfmkUL
	QOmje9t0zCebqIMXbT0fTUM2DszOoz9kd5Gw0W5E792O3JY80QOnfoxKQzem198T
	I+BeyxL13lqmyFRWPUjnhPE3Sl81V17QSKDckzbQmX432I0Iewx6i2UkWpE/Tlir
	Sx+SZn42oS1zDf4gbMSS/YlhcKLjkfbWypJ51DCvIgap4gGRn3uPC+xrijU7eros
	rR0W4/PBFFVItC5F80NiEpPlUp1McmUGvs04wuk7jVxSe4eA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvna789g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:00:58 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4eb0b989f0eso3891491b6e.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794391258; x=1794996058; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v6371ZwO/zAJsKINRttU2qdrq8Z8ZGN1i9eIzeAJUqc=;
        b=cwFPhT6vOfOE7I98cCiZw2WppVMNhRXpw2wvesNxhA3uJP9n8NirgTiarB8Dm8psCZ
         X8v7fpLJkhPJzy/sOctdSHQT1ZZsJ/HO3q6gW/e16r2BWhvL8mIMwtXT8dQpA9gkvv3H
         P5trDSCdUUau/msTwsOiwTW0YrgERW9saZKyN+/V9qEIlQiPbVYznVRDE/kXunVb2+BV
         DSl10jmOBra5AaUk2mAJOh988rx/AgWKx4xbtdImSlrR72fjyGx/MBsZt1nziyd1VImr
         /8ZWysZAAq4K1mzkeW9Qdo2J4Bswce8Do9oLOIU4i1oY44nGADH/27zljolXi0ILvYI5
         c3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391258; x=1794996058;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v6371ZwO/zAJsKINRttU2qdrq8Z8ZGN1i9eIzeAJUqc=;
        b=bnPI4RKkzuKyQhv6YIvSJ1moNU0iUBLN5zaDKR071+V0PzWqCWsxXk/K3P7Y+hzo3k
         m78WiF5dUydK3lXixG3Bd7Nsz9ctpDLvOrjIAAfdSOMCqI7d7foXfI3S5oG6WGIMKALb
         QYDxMa2JEPXKMTOKHBwgTUL4IbfDwYSxoXQDbKWMw0/MCIPwuikgCDm7UQsGJsRIv+nq
         B3VcEg84DtsoLw7GtWlo8EubfAD7VYUrGdqo5lM9YGc72EzDS2xEMhgJa1Dyq7xLeuw0
         onH2PpVsgMs1PjHLMSoBqUE99R6kQR8KTe42hCSI108eEv58phhN2c6M8JVn5+N0WdAn
         LsYg==
X-Forwarded-Encrypted: i=1; AL+hErHbPAJhcBieUBU6I4MipfuxmIIGcUsKBoXeXC+BCDTIhE52Iakl4Ivb6lDwrjh2C7znPHdWAAv+ioLf@vger.kernel.org
X-Gm-Message-State: APuU4Z+HC2QdW36zBOmD/h+XR8b8z3jLT7AT4c5fCZWYHx0t0TEvidS8
	tyxnwF/ePxuXcz2k2GH9V/vejm7nm97qJpIx0WngcvrDcngVQX1LlW7766GzuiTvO63453VTGTg
	uILEytluuBb8lqD/svqxMPKekWZeqaX51Q2zrZPhFPhxkemgcdKonUyr/5XANb8Yk
X-Gm-Gg: AYBFou2eGiv7w+2Dnk1LKUqJGGWupSLew97qiIy25kUhPQEtx+HNif9cdQXxw3BvzaL
	H99SZk2me26OMeTKfOues0ylNY1Qq0Cfoya2klNL9aTahEQoXl0J0XsFLkjlpeuGniNwEK2eg3X
	dFtlQ3tKQhzxDzJ0poG7t8YV9fy6KRuyAj8MPE5AlRmpgrSh3An4P3cnk1FDjvCZFXNMh54cJHp
	FR5a51ShQ5yJXHxAbpNcdgR6KaNBUIpSGv6fDdc+16BZoOIAax1Xz9q2OEUfLMiNxlMfWH6ECuY
	jdukCj6CTu0g2tbgll3tJKoff1p7elxzt4bhMhvYMWrenv175pLfS9ul5YEfhFbiUgBq6F5YuKK
	wPYICW3eIIQzPcuU/57WNuDbhVcmv/kkRyqgJhIO8tGLyxgFqoIEHPZmnXhr8uyWHBfXk6BW5dv
	e7wf0Q/uJbAJ/Omiq1
X-Received: by 2002:a05:6808:c126:b0:546:306d:45eb with SMTP id 5614622812f47-5688134bac2mr2879929b6e.35.1794391258154;
        Wed, 11 Nov 2026 02:00:58 -0800 (PST)
X-Received: by 2002:a05:6808:c126:b0:546:306d:45eb with SMTP id 5614622812f47-5688134bac2mr2879910b6e.35.1794391257731;
        Wed, 11 Nov 2026 02:00:57 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504c276sm4686111b6e.4.2026.11.11.02.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:00:56 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] clk: qcom: Add NSS clock controller support for
 IPQ5210 SoC
Date: Wed, 11 Nov 2026 02:00:54 -0800
Message-Id: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANY89GoC/22NQQ6CMBBFr0K6tqStrSGuvIchhE6LjFEKHSAaw
 t0tGHduJnnJm/8WRj6iJ3bOFhb9jIShS6AOGYO27m6eo0vMlFAnKYXmA4Rnhf1glBRVRwTAG6+
 tgsJpJwuWHvvoG3zto9fyyzTZu4dxW9qMFmkM8b1XZ7l5v4D5F5glF9zpBqyBo7JGXgJRPkz1I
 7nPPB1Wruv6ASoesijNAAAA
X-Change-ID: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Luo Jie <jie.luo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391255; l=1980;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=ssQwJ0NVkXEo1RNZ7AhR+p1xjTksM72Hbr1MyGjEOHo=;
 b=ELfTtgQHmQKAVD+I8fcjmKdoSmQ63d3HgGAPghBonQAWNbJzX2cwn6xE89AK6bbrIHcF97a/R
 n1K7+DMC6nEAdr74VE+WswAMjq8sxzA0eAfb0UaHCo88wp1qmqZt3ig
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: xiDNkegk00b3QuSSX8fFhDuwz3Y4-6-q
X-Proofpoint-GUID: xiDNkegk00b3QuSSX8fFhDuwz3Y4-6-q
X-Authority-Analysis: v=2.4 cv=U7UHnuru c=1 sm=1 tr=0 ts=6af43cda cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cYQ6PdjOCuHZ1sjPTfwA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX38VcLmT3d+k+
 wNL8X+mQBSEvyKviohqHCFjD9dyZ1EMM/qBh8UhLrw2ikY4WNaTy1PaEzbsGuG0tTv9XfF7LMuf
 GdpBZNN2iweoASjN6Mwf8gcq702hyRCF2Z7/kTO77S2hfNcM9jrh6x2E3kurybimDvTqOsLz2dS
 qMeBMmgjhssyTx83871yE9/c6yHe09w3ocjUZCg7EDJso6B8GmJffIupF3PveVNBeGKyl95rZcC
 VoHcjE2VTk756ohO1Qjp5cwCkOM1dKTz8+4HTuFq6gj0mtTBKUk+APURn7e1c4vQje54P9U25oY
 HtHjPGcnnyHgjeY2IP2ii6Fd/av/xmkmKLy7bHF9BtPuDms4J7dbrDWvAehU1Luzi4Beb0x2ycE
 QPFojv4Fpv1dB8LXIio4sE4YPiRki4cCEsTTHqGPS6XXkQ9wm5icaLdPVpiQWTnNrp9PSI5g8w9
 pZm3knNIIgGWsi6vrqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfXzg1s6RbnO8Om
 ++0cQNwkTCZ2cZU5vIwKLnFCY4d6P22QMbDKCKZX/E98ntoP97hivqBvRz8jemTCSspQLslkxJr
 5CMOuEA1y7kq/n9PbxvWwoBtSPX1QmE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110039

The NSS (Network Subsystem) clock controller on the IPQ5210 SoC provides
clocks and resets to the networking related hardware blocks such as the
Packet Process Engine (PPE), the six ports, XGMAC PTP reference clocks,
PON, EIP crypto engine, and the SoC-integrated EPHY (2.5G Ethernet PHY).
Its parent clocks are sourced from the GCC and CMN PLL blocks.

The NSS NoC clocks are also enabled to use the icc-clk framework, enabling
the creation of interconnect paths for the network subsystem's connections
with these NoCs.

The patch series is organised as follows:

1/3  dt-bindings + clock/reset/interconnect ID headers for IPQ5210 NSSCC
2/3  NSS clock controller driver for IPQ5210
3/3  DTS: add NSS clock controller node in ipq5210.dtsi

Changes in v2:
- Use RUNTIME_PM_OPS() and pm_ptr() for dev_pm_ops.
- Rebase on next-20261110; drop the CMN PLL DTS patches, which are now
  merged.
- Link to v1: https://patch.msgid.link/20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com

---
Luo Jie (3):
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5210 SoC
      clk: qcom: Add NSS clock controller driver for IPQ5210 SoC
      arm64: dts: qcom: ipq5210: Add NSS clock controller node

 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   47 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |   40 +
 drivers/clk/qcom/Kconfig                           |   12 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/nsscc-ipq5210.c                   | 2202 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5210-nsscc.h     |  106 +
 include/dt-bindings/interconnect/qcom,ipq5210.h    |   18 +
 include/dt-bindings/reset/qcom,ipq5210-nsscc.h     |   60 +
 8 files changed, 2483 insertions(+), 3 deletions(-)
---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

