Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671028;
	b=wDTZIYFBW0GyGKjpG2dvvzNq5/vd1BO1iZ009y8YaMFY/Od5TSqmaXwZy9CFvMBzlX1X
	 3F2TDWcDAZ2NLf1n8o+xIK546DYPHQ+IVxnjW4Xivsky8Un8fJCp3hf0ihJcpswv9bZAv
	 GFjzR8v4Q1fR4kyd64gy1HqVnoriqYOC4UCul+Xx3lX00UV9cTEFplyoxY86fv7y89cnR
	 GodG9biCDWIX1CUEzNO2DELAAMNBd4EXDz8/3kE/DlTYj5vPSbK4eYRtXMHBlOsVSZ2pT
	 5MKMmdTgXJfUNW66XPvYlcqZzHo05YgJkAvyLy4DHzKFdaUJvj8xup0HKASe075NxOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QBd0fIjBZy2q5+3uKvf9Z25rvlT47bzcs3hS1m9kjVs=;
	b=ipoYQi+8ERXHpyDmJFiIbEZuI3uXykxXyidzMmlkvFa6fS8zkULccXyqndfJuyIW+0dM
	 BjYhTUTAGowHV8MB4+HGkvaJg0soY+LdtK/4+t9aDVpWS1UTZSr5J2B5pG9jPB8qFCstP
	 kKtrm9yUMAEpXcSvA93vigGDpedBT+0PGr0HstFGr3YR+HuSJWw49tjWGRGN9/xU//UMF
	 8Git5sf2mS+DzeJolmC4tUFPkG5DPpTDHNkggElGhLH8M7D8TrJWrH3gdvvNCbxLC3aYi
	 HdnaI1DEZiC9M2dvHBW5OfoOfma8DOylpzsgvK9f9ZojpvPeVrrUYkvwXr08CfcfV/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nJ0IE/8f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmW5wGtw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE34A606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE34A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nJ0IE/8f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmW5wGtw
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Wsn1812945
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QBd0fIjBZy2q5+3uKvf9Z2
	5rvlT47bzcs3hS1m9kjVs=; b=nJ0IE/8fcXfzmZDGSnupA5QGLUpOsmf8YA7pw8
	petfDPVic2FVQ6pwTkY5VgIqZDli0a4VuTwHceglfAIj8puMPTdk0IWmHzHt1JVm
	8ceimq/fA/HLS1HOViE4NOsJJ1Ys0d8mVr0TJJzvW4Yyg1mJd0zoihqpQf3lZUJ7
	F/yR2q2uiF7Uj4GAji6B5NhmC3IFrMNlqy0msT0MLfHXKo8Lr04Q7eBz10RK5PQo
	ptvmJ3cyst28/QWPoFKFAqlOJ6JW9T4cqNpkc3IaK/mluQpu/zX8sT12ckeSrrui
	IkmKpQxvpXmT6adLs8FucLH9icCksJolv8mFS4kuykxm6h/Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak00r1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:30:26 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so6344051c88.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671025; x=1796275825; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QBd0fIjBZy2q5+3uKvf9Z25rvlT47bzcs3hS1m9kjVs=;
        b=AmW5wGtwCWjHDjbYNmzkiLt4CYYfdZMQihjxX2mRk/gcBcP7WPnggINuf76ZtateXy
         lV5kvZvNpxjaChjHProKL9RXpQxy99rjE3hh5r04lAJzvSUAvz3EWsUR+rTK9p8a/OoK
         V8ThxijXa9Y1UnLhR1q2Bcm61VVCuWnQ73oVmHMemLmsLd7P0fg/KGik7bEqF39knVIa
         2kPhQDcg0IUPeUz/BnkHhsiXFFiqxInc75a/j+u5Ywmwe9/F36nX0C9pRZV5XdkZ/Xe2
         ufDTJIPRfM/foAq4yz9bVyZDRrvZ13S59ayFVoP6pMLlmsOUNR3iMENkYQM2MhsndBG7
         TBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671025; x=1796275825;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QBd0fIjBZy2q5+3uKvf9Z25rvlT47bzcs3hS1m9kjVs=;
        b=VxeugIalsDkwd6n+/oseCJK2xbbCnuOqCY8vOs1r+7VW7SAEGYeM1nqOklHFsaBtVI
         akqrswLcIb6mpMkp7K+TLqSKUULADYEcTOkuHwgH4Ez7t32Elp0Nn227qvXpYK1OTppw
         nKo4f3lTo4dLcKXq8/8iiNmiAhmqS24kITok9Ez4LwW82zU9o35vCcDx0zCwAp5hXihT
         pQ5IVUjTYSfw9Qb2RpkYTO4Et0I1Jn9auxLmiaqhxy4Wtef9pHhclih+ZPueD76TgLcC
         PFwCMNkLDKEFW5OMRU7AmZhk0hxEmRqqqMyIYxE9bawo93U9GhxaKqs24BUjnQCMCVgG
         qZAw==
X-Forwarded-Encrypted: i=1; AL+hErGu+X1hOwdQBc9/WSzMpyoQfbcIcF60nIrzh+a8Zint+t3rupGPxbe40VRE1kSnU0wG+P+BLqq3WsWV@vger.kernel.org
X-Gm-Message-State: APuU4Z/VhhR12ie91IriUL6js0XlOPn07ATugD3Y7u/QbT3I215v82mb
	A0AEGcr4pGYlV0/YZBUk3mDl0eJ3XWxW/bWcsc5RDRXp3KMl9dWZFR/pefqoK7zkvJSBm1EW8Bh
	2u2FHwgsASTcqrufvB/o+Nme1EloNQ2AC8ZUoJblA0AG1lLHIXr2ApvfgWJ5Ibcp1
X-Gm-Gg: AZFdTZfGX9jXL5EveGAfwlh6xEnY0CD1qNjzPTNJJ4zEkfaw3wywVDXC5O8g4ohck0g
	72MABppjzhQ80W7x6nMR3dz78Muf6EBVB3B72QAIoC0fFJwayADJxD5LDn5WzU3Yudtx0s+X0H2
	sTfJ3YFBiPxSRKuJ8x8Ig8QgY4SVbi7E3BfQPBZecyviiP1C7YTXAaYN2gFCTLxmygN7/dsfZy9
	eBLtUwBiTEgE9DR16lW7J4rmc5Sjyxh8tq7JJ1xpQRiqBA1cgoVkqUlirGhgPCjmHfEvgzEfvPw
	aZnppHbCfGkXdrOgD+3L/G4F0p0Xy19DN9aOawir4XUybecWMGroYvW7UkcssF9ibneaLxNOoud
	VS3XdXMdf8OvxrirrYFU+jJsyVaqaaqJlJY1zarExFg/GZzTwFPWZnwueuUrgi0nSRpkcVe0lxX
	7T4wqFp7cRPudvBpaQwC1bqzfz1c9zbwFo0IC0aw==
X-Received: by 2002:a05:7022:3d14:b0:151:6e80:baa9 with SMTP id a92af1059eb24-1b55687f17dmr30379305c88.12.1795671024645;
        Wed, 25 Nov 2026 21:30:24 -0800 (PST)
X-Received: by 2002:a05:7022:3d14:b0:151:6e80:baa9 with SMTP id a92af1059eb24-1b55687f17dmr30379263c88.12.1795671023882;
        Wed, 25 Nov 2026 21:30:23 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm46802081c88.12.2026.11.25.21.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:30:23 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 21:30:15 -0800
Subject: [PATCH v3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
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
Message-Id: <20261125-mahua-surface-laptop-v3-1-875b9c63d4e2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAObDB2sC/3WNQQ6CMBBFr0K6tmQ6kBJceQ/jYmyL1IDFlhIN4
 e4W3LjAzSQv+fPezILx1gR2zGbmzWSDdY8ExSFjqqXHzXCrEzMElFAXwHtqI/EQfUPK8I6G0Q0
 cyEiNpaixBJZeB28a+9q058uXQ7zejRpX17pobRidf2/dSay7LSEA5H5iEhx4CbJRUKKQSCcXQ
 v6M1CnX93k6bC1N+OPC6o8Lk6vSuoaCBGrEHdeyLB/7+C/lHQEAAA==
X-Change-ID: 20260930-mahua-surface-laptop-0ae6d2419240
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795671023; l=30653;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=6TpLshxycW0vua/H1shEpDcyChZscjb2pQMhEIOc4z8=;
 b=1kl2clTKy8+PvrIpSdbykpCq50NuwT7NtLVQmOmXE90BFECjd5ZpmFmeazC/xkdrMtg34RcCx
 r7rY4o7ThPqASM7AHKbSyCGcFuhEifFlvqeV+jXClcaSWjZ/cerzroJ
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07c3f2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KwPP0Q43572OzKEJjl8A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: SunNTIae4zW24zGHnCtGIo9kKhrQABR-
X-Proofpoint-GUID: SunNTIae4zW24zGHnCtGIo9kKhrQABR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMCBTYWx0ZWRfXzTjveeK93Hsz
 T8bkyn36gfuSxOn1CwQ1nMV9OAd5Fb/fq0puuLwXKnUNHqFCWVv4iqar/et5wLZnZt6I4PtHvHL
 u6KqsSlTocriwk12V5+o934Td8mDPKKT0zfHl/0lyrtysDOpGgO/uI73iGMpRmAgUg19sfMWLx4
 xrXMaosEaGNCUDUSizbrd//dFDkqXrYSri4q77QzOna+3DpVuLRaPTrroE02ZWjQ/4N8uexH8ge
 73MHeMftCJ33Q55g202DUW3YBjsP8pmXxAidoPN1+31iBlnm1MkLZN2tvGuVnAg0pF3DPPXobCA
 GEXbdUWkU51c5paQDOjllaVy/Fr9cZbFAKWGs7npl+hLDOtAllDF/nCtiuRwsw1dAV8hxFSQ+Gd
 BRKdxt+KgQvCCVI9ViynlJxoIh3fWfdEqYt9ZO718B6KInrw4ypYGRBaTQaja/4gnCRaeEmBpNK
 X+ijZ/YI+rkjDv4sE/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMCBTYWx0ZWRfXweU4wexCBVLh
 ThTh08s8P7zPadU/Ig8yFMM/zPbW3gJTTf4uZ6FZ2URJNBRALOF+7we4lAx9LkSN3QXVsHIrlsu
 YuyYi2dWXo3r5bz3GOS6ldbjkYx6Lec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260020

Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
built on the Mahua SoC. Most of the board follows the Qualcomm reference
design. The keyboard, fan and platform profile sit behind the Surface
Aggregator Module on uart22, same as on the Surface Laptop 7.

What works:
- internal eDP panel (link capped at HBR, see below)
- both USB-C ports, data and charging
- USB multiport controller behind the two PTN3222 eUSB2 redrivers
- Wi-Fi and Bluetooth (WCN7850)
- speakers (2x WSA8845) and the two DMICs
- NVMe
- keyboard, fan and platform profile via SAM
- touchpad and touchscreen (HID over I2C)
- lid switch
- GPU and GMU

The eDP link is limited to HBR because HBR2 link training fails on the
current eDP PHY driver. Once the pending PHY driver fixes land, a
follow-up patch will lift the limit.

Assisted-by: LLM
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
This series adds initial support for the Microsoft Surface Laptop 13.8"
8th Edition. It's built on Mahua, the 12-core variant of Glymur with
cluster2 fused off.

As on the Surface Laptop 7, the keyboard, fan and platform profile are
handled by the Surface Aggregator Module over UART. The rest of the
board is close to the Qualcomm reference design.

With this series the laptop boots to a desktop with rootfs on NVMe.

Features enabled in this series:
1. Internal eDP panel
2. Speakers (2x WSA8845) and DMICs
3. USB-C data and charging on both ports
4. USB multiport controller behind two PTN3222 eUSB2 redrivers
5. Wi-Fi and Bluetooth (WCN7850)
6. NVMe
7. Keyboard, fan and platform profile via SAM
8. HID-over-I2C touchpad and touchscreen
9. Lid switch
10. GPU and GMU
11. UEFI variables and RTC via QSEECOM

The eDP link is limited to HBR for now, as HBR2 channel equalization
fails with the current eDP PHY v8 tables. Once the PHY driver changes
(the v8 programming sequence update and the lane drive level fix) have
landed, a follow-up patch will lift the limit and enable HBR2.

The ACPI tables used to bring up the board are at [1]. The HWIDs for
booting with stubble, which picks the DTB on ACPI-only machines, are
at [2].

[1] https://github.com/aarch64-laptops/build/pull/176
[2] https://github.com/ubuntu/stubble/pull/97/commits
---
Changes in v3:
- Rebase on next-20261124.
- Enable the GPU and GMU, now that Mahua GPU support has landed.
- Drop the dt-bindings and QSEECOM patches, both already applied.
- Drop the stdout-path from the DTS, as it pointed the console at the EC
  (Konrad).
- Drop the linux,cma reserved-memory node, which is not needed here
  (Konrad).
- Drop the &i2c4 node. The INA4230 power monitors show up in the ACPI
  tables, but they are not present in Linux.
- Link to v2: https://patch.msgid.link/20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com

Changes in v2:
- Rebase on next-20261026.
- Drop the SAM registry and panel-edp patches, both already applied.
- Rename the board to microsoft,surface-laptop-8-13p8 and the DTS to
  mahua-microsoft-surface-laptop-8-13p8.dts, as discussed on v1.
- Drop dr_mode = "host" from both USB controllers (Konrad).
- Link to v1: https://patch.msgid.link/20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../qcom/mahua-microsoft-surface-laptop-8-13p8.dts | 1146 ++++++++++++++++++++
 2 files changed, 1147 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..b882511cbca5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-sa8255p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= mahua-microsoft-surface-laptop-8-13p8.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= maili-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
diff --git a/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
new file mode 100644
index 000000000000..2f8c93d900df
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
@@ -0,0 +1,1146 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "mahua.dtsi"
+
+#include "pmcx0102.dtsi"
+#include "pmh0101.dtsi"
+#include "pmh0110-glymur.dtsi"
+#include "pmh0104-glymur.dtsi"
+#include "pmk8850.dtsi"
+#include "smb2370.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+/* PMICs tied to Glymur's cluster2 are absent on Mahua. */
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Microsoft Surface Laptop 8th Edition (13.8 inch)";
+	compatible = "microsoft,surface-laptop-8-13p8", "qcom,mahua";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c5 = &i2c5;
+		i2c8 = &i2c8;
+		i2c10 = &i2c10;
+
+		serial0 = &uart22;
+		serial1 = &uart14;
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_tpad: regulator-tpad {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_TPAD";
+
+		gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
+
+		pinctrl-0 = <&tpad_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_ts: regulator-ts {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_TS";
+
+		gpio = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <6000>;
+
+		pinctrl-0 = <&ts_pwr_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "Microsoft-Surface-Laptop-8-13p8";
+		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_e0_1p8>;
+		vddaon-supply = <&vreg_l15b_e0_1p8>;
+		vdddig-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_bob1_e0: bob1 {
+			regulator-name = "vreg_bob1_e0";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <4224000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_bob2_e0: bob2 {
+			regulator-name = "vreg_bob2_e0";
+			regulator-min-microvolt = <2540000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l1b_e0_1p8: ldo1 {
+			regulator-name = "vreg_l1b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_e0_2p9: ldo2 {
+			regulator-name = "vreg_l2b_e0_2p9";
+			regulator-min-microvolt = <1804000>;
+			regulator-max-microvolt = <2904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_e0_2p79: ldo7 {
+			regulator-name = "vreg_l7b_e0_2p79";
+			regulator-min-microvolt = <2790000>;
+			regulator-max-microvolt = <2792000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_e0_3p3: ldo8 {
+			regulator-name = "vreg_l8b_e0_3p3";
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_e0_2p9: ldo9 {
+			regulator-name = "vreg_l9b_e0_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_e0_1p8: ldo10 {
+			regulator-name = "vreg_l10b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b_e0_1p2: ldo11 {
+			regulator-name = "vreg_l11b_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_e0_1p14: ldo12 {
+			regulator-name = "vreg_l12b_e0_1p14";
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1144000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_e0_1p8: ldo15 {
+			regulator-name = "vreg_l15b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_e0_2p4: ldo17 {
+			regulator-name = "vreg_l17b_e0_2p4";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_e0_1p2: ldo18 {
+			regulator-name = "vreg_l18b_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmcx0102-rpmh-regulators";
+		qcom,pmic-id = "C_E1";
+
+		vreg_l1c_e1_0p82: ldo1 {
+			regulator-name = "vreg_l1c_e1_0p82";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_e1_1p14: ldo2 {
+			regulator-name = "vreg_l2c_e1_1p14";
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1144000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_e1_0p89: ldo3 {
+			regulator-name = "vreg_l3c_e1_0p89";
+			regulator-min-microvolt = <890000>;
+			regulator-max-microvolt = <980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_e1_0p72: ldo4 {
+			regulator-name = "vreg_l4c_e1_0p72";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <720000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_s7f_e0_1p32: smps7 {
+			regulator-name = "vreg_s7f_e0_1p32";
+			regulator-min-microvolt = <1320000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8f_e0_0p95: smps8 {
+			regulator-name = "vreg_s8f_e0_0p95";
+			regulator-min-microvolt = <952000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9f_e0_1p9: smps9 {
+			regulator-name = "vreg_s9f_e0_1p9";
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_e0_0p82: ldo2 {
+			regulator-name = "vreg_l2f_e0_0p82";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_e0_0p72: ldo3 {
+			regulator-name = "vreg_l3f_e0_0p72";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <720000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_e0_0p3: ldo4 {
+			regulator-name = "vreg_l4f_e0_0p3";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E1";
+
+		vreg_s7f_e1_0p3: smps7 {
+			regulator-name = "vreg_s7f_e1_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_e1_0p9: ldo1 {
+			regulator-name = "vreg_l1f_e1_0p9";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_e1_0p88: ldo2 {
+			regulator-name = "vreg_l2f_e1_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_e1_1p2: ldo4 {
+			regulator-name = "vreg_l4f_e1_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		vreg_l1h_e0_0p89: ldo1 {
+			regulator-name = "vreg_l1h_e0_0p89";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h_e0_0p72: ldo2 {
+			regulator-name = "vreg_l2h_e0_0p72";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3h_e0_0p32: ldo3 {
+			regulator-name = "vreg_l3h_e0_0p32";
+			regulator-min-microvolt = <320000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4h_e0_1p2: ldo4 {
+			regulator-name = "vreg_l4h_e0_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	/* Something @39, @3e, @44 */
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	ptn3222_1: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+
+		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+
+	ptn3222_0: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+
+		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
+		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
+
+		#phy-cells = <0>;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@41 {
+		compatible = "hid-over-i2c";
+		reg = <0x41>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 43 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_ts>;
+		post-power-on-delay-ms = <150>;
+
+		pinctrl-0 = <&ts_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c10 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_tpad>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <4800000>;
+	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	/* HBR2 channel equalization fails, limit the link to HBR */
+	link-frequencies = /bits/ 64 <1620000000 2700000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f_e1_0p88>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie5 {
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
+&pmh0101_gpios {
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio14";
+		function = "normal";
+		bias-disable;
+	};
+};
+
+&pmk8850_rtc {
+	qcom,no-alarm;
+	qcom,uefi-rtc-info;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/microsoft/mahua/qcadsp8480.mbn",
+			"qcom/glymur/microsoft/mahua/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/microsoft/mahua/qccdsp8480.mbn",
+			"qcom/glymur/microsoft/mahua/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_2p79>;
+};
+
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p9>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p9>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p9>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p2>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <4 4>,  /* EC TZ Secure I3C */
+			       <10 2>, /* OOB UART */
+			       <44 4>; /* Security SPI (TPM) */
+
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	edp0_hpd_default: edp0-hpd-default-state {
+		pins = "gpio119";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio2";
+		function = "gpio";
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie5_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	ssam_state: ssam-state-state {
+		pins = "gpio71";
+		function = "gpio";
+		bias-disable;
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	tpad_en: tpad-en-state {
+		pins = "gpio102";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_default: ts-default-state {
+		int-n-pins {
+			pins = "gpio43";
+			function = "gpio";
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+			output-high;
+		};
+	};
+
+	ts_pwr_en: ts-pwr-en-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
+&uart21 {
+	status = "disabled";
+};
+
+&uart22 {
+	status = "okay";
+
+	embedded-controller {
+		compatible = "microsoft,surface-sam";
+
+		interrupts-extended = <&tlmm 71 IRQ_TYPE_EDGE_RISING>;
+
+		current-speed = <4000000>;
+
+		pinctrl-0 = <&ssam_state>;
+		pinctrl-names = "default";
+	};
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l3f_e0_0p72>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1h_e0_0p89>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	refgen-supply = <&vreg_l2f_e0_0p82>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_0>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2h_e0_0p72>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&ptn3222_1>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	refgen-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	refgen-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};

---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20260930-mahua-surface-laptop-0ae6d2419240

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

