Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695114;
	b=1coRVKg9P7zrO81KaZBFrFaS+UMXzzL8c9kBrgRI3T4ACREe5vAdrwAVGh3FUt2mrRBg
	 EPpHNiTaClRoQsBWLW9JVdAUJBrVib7ovXJYsX8wW2hF6Z6mNQe9O8n3tm4y4hadl2yul
	 CAub660A/60IvF/akGP0kErnTG/eghmkquvzI8a9EyErlclkyimud41j3acT5PzKA3TyC
	 hFfjyVpTASSHtFDr65R2r+GTAWooQwOFVxeUHynUrh/y7YDbUHh0AiVkYjxQeJ6Mwi4Qi
	 Sq5PfUteIcK+rTFM4ShZUNTcaUqyfsWGupKlB94Omm+TgOZ79QvvEj+0h3pxwtobmDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695114;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6YcqAiMhjLIcHfIkqluvjER3LnqVCQYeKkQbLJ8BJqM=;
	b=u2pvOonCiZXRyP9wNB4l6Qw/rRvWiOM7yyfNyrZ6tZgUtHWzXxTQm7e+QjO0Fohyse/B
	 5Dx5EMOQRmJzQN1lsYrc7tfo9FT8UyvcELKMHKi/ooMWTEC+QCGsPSNAeWNjRVdiP3yOU
	 PNGhhv46gQhDejunFf9qPuaEuQA9FCDhGYRUEMLc+lvr0jgB2NMAPuYyiLK+df+W0iYNV
	 uHD9ApD2wxctdsY+uODgUOFOVLdJOLUhbX/jwUpvsoX5ONFdyGjRNV9avz5LqZTkoFwKf
	 CNiTzMZY2daZKeYorqAmZNWszoG0VZOryQ8Ds0/Hwrg1ugndOPNNPxl4IlUH7O4El7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4NCSVD6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlnjWHCd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77237606A331
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77237606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R4NCSVD6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XlnjWHCd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVSQn1497082
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6YcqAiMhjLIcHfIkqluvjE
	R3LnqVCQYeKkQbLJ8BJqM=; b=R4NCSVD6joHRx5pwlHZETz6Subt0+tJ1TzyaQs
	vynses9Pl0D4ZN3clt9/1O+H2a5eEcahne2X4D+rj21ezBeK4tFCdTclcKRDHie7
	FK3wIyXnUFjP33TS1A3mnypdc2JNPlzFrqJ86sH8EjGZPXE25P1FvrmJloRhbAdn
	+uAWzJHK4bxmkvsgGJ2I8hS6VuuriR5AAOsuDPTVK4ZSbDvP4kWfbWitH72ivrZl
	TdM0vgAZsVv65s0Oj0f0TQQF19xd1D//hBTYfRWGwh8AYyidbe4qzRDPN+0RCgQg
	fpQUPzdmm9b9QxK0ESU8M5f6fbXxPC8YmmPKEYlrzbodW7JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y30dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so1038800685a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695112; x=1796299912; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6YcqAiMhjLIcHfIkqluvjER3LnqVCQYeKkQbLJ8BJqM=;
        b=XlnjWHCdZ91Z6lpCkxS/UGi9x22G2f6OdYlvzjg1B22Qo81jgKpNoBWSqi+RIqu6R8
         RgDfaEBl9yIFjnQt73CBLc8JrAiaLAU7pKQPn9PrLEAbnHNUvFcOxW7eaGsgDWcw+hMq
         z+BF1c9px/ncK5rNuhg/j3VfEgUPOs5+zvm95Hncz1MbqAgY92DBJXKAVslgonBzqitX
         Krmauk/IyO1HLzmpIJ69yuyb8LwiGl2hhB52TH2NHjfXaSGfcxOv+AahgbRQwBx67Oxy
         AEvbBclX7M2IJoqAbeozsvzdxCGR2uUEUx4JyRcRo49Jiv5USPiLCPxJ72dAaCKn61Rn
         Tl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695112; x=1796299912;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6YcqAiMhjLIcHfIkqluvjER3LnqVCQYeKkQbLJ8BJqM=;
        b=Ow4qq0ImwFSWo1u43k2JYtfn1W5JxlYShrtaxxlY7T6sZnXPCtwPYOMKQEEDrlypzz
         +EA7cZEZGLsE6oNSf7cVvSYRvho41YuR1PvL0daX3rS7f4TAYcpONMw8AUDbb+0LGVCk
         6qNznKNzgyNF/gm3VEXpTM+g+GxPfso5pB3leL9HaGp3sFreQUykourPLmuNffUxNPh7
         doqpRe1wJ8TADahp/DjxaCiDTY6DKSEv5RoHoetdNEOwRbatcyvaYUR0QxFqZfyteL13
         3aI2HfZILLL6fdP56BRBY/iP7wp7trayL4//KfYSl/nckgzpMmGUJgfnllEiOOpir0XV
         eDmQ==
X-Forwarded-Encrypted: i=1; AL+hErG2jbep9h72ownwfJQalCHaFUbStALsFaEU16dXfnPGyrsjnCDfcO/Je79y7xATHEgPX7xjm0yLnDhD@vger.kernel.org
X-Gm-Message-State: APuU4Z+LriXxiEflZqWASEuIDVay26fSO6es5JnYzyoNda/vPRWIV/t6
	NKetCVZ5aG0MQL0bNsAC/+rX19kbaNLsJCI763nB9Bz/P7j6N/ypwf/iSVm28+X7YH0x6HlwWzj
	BZwL3C7Bg8osUZJwjlwlk80fNPFDCwomsL1oXhM+XJZCqwZjO4tys3jqV0f9wlz01Dm6rvnHd
X-Gm-Gg: AZFdTZcBqkRfVmtTZcYVcL35hIOwrBy/HRHoJU41pFJd2WZjVXDU4p7ZFvjJvmwvzTm
	DV4aD6ktGe/NHSNvQWKvCn/WDtJgu4/nuWKDDReOWNrR/gUYEOrSQ0RjLvwQ5D6gYMjldrtGOE+
	iI166IQSoAiAV1ze/NS1URs9H1jF37DmM4Swyd0P8h+E6fLaMj6jaMXIL3lYv1pKEFkZwt23Dtn
	+GL5w1BsAufw+xaw4M4kbNg5XlOOlLtlEeh6RTVleQdXi+nxHevfVkF1xBibsu2P7ax1QRgHEiZ
	Uae79Sr774EcX9qQxrlvxyCk5bethLh1UouzmmV9CqaLPded3YbGIuFS8VF1nwkHH/EKy0ZPq/o
	kZy0wgVA27BLlKZ9iE3/8DzuQQpNVa29mHl4N3k1dOQW1N3Ji/DaHA9uogMTxcEeK/2eKKhb/tH
	V/AUT03SPUf+VP
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id af79cd13be357-949ba7cbc42mr3765731585a.12.1795695111737;
        Thu, 26 Nov 2026 04:11:51 -0800 (PST)
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id af79cd13be357-949ba7cbc42mr3765725185a.12.1795695111286;
        Thu, 26 Nov 2026 04:11:51 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm748736566b.40.2026.11.26.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:50 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: agatti: EL2 overlay and QUP
 firmware for the Arduino UNO Q
Date: Thu, 26 Nov 2026 13:11:38 +0100
Message-Id: <20261126-agatti-el2-v2-0-1ed468b4c52b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MwQ6DIBAFf8XsuRihSGtP/Y/GA8FFN1GxQEkbw
 7+Xeu7lJfOSmR0CesIAt2oHj4kCubWAOFVgJr2OyGgoDKIRinOhmB51jMRwFsxeTHPubGukVVC
 EzaOl9xF79IUnCtH5z9FO/Pf+zSTOGiZRtHZQ0vLuench1M+Xno1blroM9DnnL34ibnyrAAAA
X-Change-ID: 20261126-agatti-el2-f7c039f5c4f6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX7ovx7BaEYzl8
 ithlH5Pp6kwue6KcEGlBeT4fOIhmUawq+UI759vp/95F2udP+HYNJtGzua+Vdmk4kEVQBa+RnOx
 GAZmmD26KQt+ycIhp2z5NW7EfBKVYiN814sZZck2RcIjrRdL955On5VMUOtq28cnvKVaiidwIeU
 lINtgi1GjylrAnGJHDFabKf7J8yDE23aUWXpx6MlB3P5JtF7n3zTf72WoXhe9uR2HqH3rmKSbY6
 /0O45RPBjH+wjdThFyJBb/MJHEOr3wsoJnutQZfR06sLlluX+J64KDApWxdP+d2lUyqOZuKpOhy
 3idn/n2k5AmAWoPXMwKiY0jGqhSZ6mWuEvMmbpV90c46wNMO+c8NUuUDvdJg278xdLJjLGwQJAL
 XjQSnb2Q619/u1C1crxsET+9c1mgDxlprFg+YNV/Mvh1CSG9sOyL2qZ23vKGjmAwXSNkWR4Hwhu
 Ku+3XNJ35L0vMwmXrhQ==
X-Proofpoint-GUID: xAlNL2Qu9L9T-OxTsAFkqWsFNFzCAva-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX1xGPO8JdNsIq
 u/b3kVfN4CCiRNzinWkrXIGIf5b9VvoXGgDSA4jhFcjji5O0VvxQ1EbXjnX9mRD5oxWrXmKRASS
 4dlMqxo7pJGH/HfgatGxnw6F1VUQUwg=
X-Proofpoint-ORIG-GUID: xAlNL2Qu9L9T-OxTsAFkqWsFNFzCAva-
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b082208 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_Zj8K6houdA7szA-FsQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
two patches are the DT side that this chain needs and that does not
belong in the base board file.

- Patch 1 names the GENI QUP firmware, so geni-se loads it when the
  boot firmware has not. Where the engines are already programmed, as
  with QTEE, the drivers do not read the property.
- Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
  zap shader off, SMMU streams for the ADSP remoteproc and for the
  WLAN firmware (as kodiak-el2.dtso has it).

Loading the QUP firmware on this SoC also needs the geni-se fix in [1].

Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
and the Bluetooth UART probe, the GPU renders without a zap shader, the
ADSP starts over PAS with no SMMU faults, and WiFi associates.

Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
without the property: the same serial engines probe and the same I2C
devices answer in both cases.

dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
qrb2210-rb1) is clean.

[1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@oss.qualcomm.com

---
Changes in v2:
- Squashed the WLAN firmware stream patch into the overlay patch
  (Konrad).
- Collected Reviewed-by on patch 1 from Konrad.
- Link to v1: https://lore.kernel.org/r/20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com

---
Igor Opaniuk (2):
      arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
      arm64: dts: qcom: agatti: add an EL2 overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++++
 arch/arm64/boot/dts/qcom/agatti-el2.dtso           | 25 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  2 ++
 3 files changed, 31 insertions(+)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261126-agatti-el2-f7c039f5c4f6

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

