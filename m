Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877084;
	b=WlGtA56PKGj+1smxscy6G+ajrkioZxbI4B+KbYj3wfMVkGJGY9mS63TsRW5Vj0i0+QvV
	 pXpSJV0t5XARxkj+wpiaiZjik+mMqAK2CXPfFWQutRBtF0nnvocXKHYqk1JybuQyY0YsC
	 Fbqobh1eBkwz7ngMlezLklQbGBtrXTgzNy0hc/+ZxjkC2wO+8BYqa783UxvPiUZnG/nG9
	 W1MKUV8tNMYZLzkL8zcI2ESjwBUMYsV1JvqMHDlfGR74XKmc5e0Nj5P3THX9LwrhxshFz
	 XvbQHIbSZr0/3zHw4Bqy1nl+e4OJg2LT84B+jw22pyikSEVrLesE1KOOxXevZPp5eeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yTUjoB2quATPPTKdjmhmFsI/0k5GGeEG+FF3P7TWbbY=;
	b=g8hV5TkFvohxo9heys+zmta8Ge4c3OYdaLott3On5lqiyinc8qPgtpzHUVAvFRIDLl7h
	 QTH5hsQww67hihX009vXf2x1DNiu8wos3HWO1sL8Vj0YRpqEn5zc5XI5dVG9XhsDEklzL
	 3iX0lOX5d/EzRYyOZRZdikdpYlgnunhg/VC3p/O1mxo1p9uW2p38tU2gyOg8ctOhWPEV7
	 kNbKFA2z1aRDrVYuWqdcsWTP0hUwOlc6yf7cq57jL2XgjxyLnsg+xtwDHKJjhilzF8hEO
	 q/7s7LUxfpXLFH3bDW6zBjesvFbP4VWbIdj2kfEvP153w3amuTJzBQuCB10K0bKnMog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A50yTwIG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HwsboA/K";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494D606A33C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D494D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A50yTwIG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HwsboA/K
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AhxaH1582975
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 11:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yTUjoB2quATPPTKdjmhmFs
	I/0k5GGeEG+FF3P7TWbbY=; b=A50yTwIGKM5i1OQiJfTq48HjmfTZocnHk3E3JE
	muf8HCKcL3Bl8d0EtmHUnT7QgOus5/lEUXmGdFSpjxkSmju8BelOyG+vNv5gtmQh
	+cQtgFWY8iIqW10poJdEYx/72PyFiV8modbvvAplkHv45MuG2va0g3gqqNUOzCdj
	7WmK9jub8cw1XPyM7o6gqC6JSTG9pvd8aewK/iJRPT2Rp3rPZqxdJUU4RUBRCMcA
	b2/ChDLdnCvyK8VaAx/osKdrgM6GOFsR0tD8uOC8VghBT6Tb6ZuXFQD9CMefO2tt
	9Jta3wdViwvuFFjLhdEZY3CVBp4BZAbbkUNjUDvfmgbYed/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraar3ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 11:11:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso92805985a.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 03:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877081; x=1794481881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yTUjoB2quATPPTKdjmhmFsI/0k5GGeEG+FF3P7TWbbY=;
        b=HwsboA/KVViNXmME4Oy8ILCsun5gwThlDF07+xov0jBODudPsf5pKYygUt+JN0djFG
         xokcXkoUPMYKjgqfrIqL6vTwE2+k+hM/Wl1AduTxybKGMcG3MNxJ7G/IuhAWkR5yZHE+
         yOuXhns8zlVUM90oP/ATo8bl9KpTBGm6loUKh9Q9oEax7thrvktAYeVQIdwV9lzDzKyM
         ykBUi0GZgJJVFDyVaBE7lxG39ZG7WMzN8ftGE9sT+HL+ig2jDw6vOyYwCOEautRpizCU
         L4uQ055bfMgMYpTdXIslOQCgYHHjlYMMMO+aMa0hJpwHAIM5fE+QS/43kHI9uqZTqFFh
         LK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877081; x=1794481881;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yTUjoB2quATPPTKdjmhmFsI/0k5GGeEG+FF3P7TWbbY=;
        b=FkcFCxbNNJk8qcpY9nk9i/VYMhaDt1WV1+Y+M50+7re+Lk9qVE/+0NssyKO/y2lqnr
         wlxbmyGsq8Aa3ak2onElUjIMH/UmWvQe0U3JwOB3k2Sqkhs//RUcMnRIljVGuxDKAa1c
         HQvjAa4lPj91kXkdfYT1YKueQ1g1hVk9e6aEN1/iQ0atguX0krNXk/42TsEDwfifjkZC
         ZAqddFKQ3ZTfw3U960rqElAaYcs69sRD7OI7XyBCsjWGuKhxdmiif92TzEqnkFWa0K9S
         INdn2hU4EHr3wUGlD24GrGVY9R7VTqTkog65dBtsbs0QZLJuMM9l8MBcpjp0A7ItO0gO
         pwaA==
X-Forwarded-Encrypted: i=1; AKwUvBziHgnY8FsxzUuTo2IAadMFJzbzRnk6AcCDcl57K5qdDlBjDERC5szfdC/fs+hZzPuZGz0OwRdwVn2H@vger.kernel.org
X-Gm-Message-State: APuU4Z8FjZ4CTU78DNP60g+wEso08B1yNNfWbKXeH+GwK2kdH1rnbd9d
	Frl0YGPIQaSLwzR277g+wxY/QOFcUVWMrDZc9Js39bB/SGONIboQ819jjE/kvM/ugWa8DOkcx9e
	O8jxEWh3k+M6SNvmOaOQjGmP08kDWNjdoAoBrRJ1J+kSRrWeBKZnFRinHSlqVW4kS
X-Gm-Gg: AYBFou3ar9FZEQChFqDXdj2mpHNrFJLqlasQENzL09TfL1EMmQ6QQfpGSgQaOnQQ1el
	48yNY27VB68a3+NGhCvUIOsmhWfZwmnMNX6yZ+elikLPC9T/Jjv6rBoHtqVZ3RcbfXaeN7VabOj
	owm2ciuSTSZrv0zOc0oPC3/2Jz3wfPY0YKl5zbs7pfst8b47mUNL0QEQvDY6ZBF8SyBcKpF3rYe
	jW4pTePlcjm14BnWbK0cSKd5H/M0jV/a7W2vSu/QejSUeaIDYPH1jU65cjvwLbV+qc6l6u+T+Z2
	ZF4MljpFeSl2rRaTKkVP4mKEzny1IOmOekZxd6tAvmioas/mR0z4AlTf1ftVxVw+bYz1/D0CTxr
	L2rkaS2HVObi2XKtAX7nuSAX8evpopFQL04f4IHKR2UTV4UwmbcDQms1g4a7k7oIQfgj1sfoBoR
	RdiO9bs5z1mTFudbjmiDiQWlFStdurqcoS5qTx5Bm5
X-Received: by 2002:a05:620a:258b:b0:93c:3863:ff7f with SMTP id af79cd13be357-945e1231638mr358615385a.0.1793877081022;
        Thu, 05 Nov 2026 03:11:21 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93c:3863:ff7f with SMTP id af79cd13be357-945e1231638mr358611785a.0.1793877080528;
        Thu, 05 Nov 2026 03:11:20 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] Support the Nord CCI CCU output mux
Date: Thu, 05 Nov 2026 19:10:58 +0800
Message-Id: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAENk7GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNT3eTkUl1LS3ML00RTs5TkFAMloMqCotS0zAqwKdFKQW7OSrEQwaL
 UwlKgiSUQmdjaWgDg2c71bwAAAA==
X-Change-ID: 20261105-ccu-99785a56dcd0
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=2583;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=46oTe7kPy7FuqPo9XNr2S/V6jdi+yv6WkUX1TjqwpPM=;
 b=Dol529a6/PFWr/JmX2UCTfZDRm+kygGEkLiJ5I4XGx49aXLdT+Sl4/aG0KJUZRGVrOtpfvGyd
 4gV/RXtflxMBM/DfYF5SIV5V1/JEo4mgZ8kk/3WcZgDOVFHp2oa75LU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX2jk0bh0vBm23
 QI48+47M8v7V0nfK/aq6k5cwDFHpz2bUO0Zu+VNlgWYD/2AhASlm589gp/GFPBdul2mmxVq9Wrd
 0Cy7tvLOrQaXJRsJpm87iOA4zXZP6ig=
X-Proofpoint-ORIG-GUID: _Esy_xcoumN1iiuOQsSjybl_xTku0ZhZ
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec645a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zavQIZ2TttM9Dy2BN-UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfXxeSkQq1lliBy
 N3Zn/ajJqDd0Y0cqLEof0cxVw3MljgPS6dHHTjO9qfNjGGlh7vTgrwFCXhWuylMACdaPBETkh4Z
 vXz9usHhjPvkQ32TZjKW5o0nVILoLYKs2pBnSsG2JW+b9mQusP0zxKcP0R7y/NgLPYMv6rUjesy
 RVVsLns4CrtJFQDGZw5G9aq6Edz8KNJUAOB3fjpoDSoXikvY7NcGwZEg+g+u3Exnsl5w6GQ/gOp
 ibIxrU+4QhEN75k4v8rwuROM83cd8H5RG3GcxZkrky/DcpyzwdjqC+2twDTCRL/C8hnwc92XjS8
 NAKx0LiHoJMgtyXwF9JWIR6xR/2QmPZGpr0RkSFny+YjtittBurv3oXpmqpTmAtOq38k8zxxejb
 GKXFlvtWrKoy9QyWjDdhswLk+NpNyOqN3l0Ihpnmz7fhVONvF3czAsNMPhRCcpL1NDvHBPVdLEI
 D9Fh4d20rdVFexUUyhA==
X-Proofpoint-GUID: _Esy_xcoumN1iiuOQsSjybl_xTku0ZhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050044

On Nord, the CCI controllers are wrapped by a CCU. After reset, the
CCI I2C ports are routed to the CCU, and the CCU output mux must select
the CCI before it can be used.

The mux register is part of CAM_TOP, a register block shared by
multiple camera components and outside the CCI and CAMSS register
ranges. Accessing the block requires the camera subsystem top power
domain and AHB clock, and its state is lost when the power domain is
turned off.

This RFC describes CAM_TOP as a syscon and lets each CCI reference its
mux configuration through a phandle, register offset and mask. The CCI
driver selects the CCI at probe and runtime resume, right after enabling
the CCI clocks and before the CCI is reset or configured.

	titan_cam_top: syscon@<addr> {
		compatible = "qcom,nord-titan-cam-top", "syscon";
		reg = <...>;
	};

	cci2: cci@<addr> {
		compatible = "qcom,nord-cci", "qcom,msm8996-cci";
		...
		qcom,ccu-mux-sel = <&titan_cam_top OFFSET MASK>;
	};

The CAM_TOP syscon does not describe its clock or power domain. A clock
attached to a syscon is kept prepared for the lifetime of the regmap,
which would keep the camera clock controller runtime active even when
the camera is idle. Instead, the CCI, as the consumer, writes the mux
with its own power domain and clocks, which include the AHB clock,
enabled.

An alternative is to introduce a dedicated CAM_TOP driver which owns
the clock and power domain, provides the regmap through
of_syscon_register_regmap() and handles runtime PM in its accessors.
This describes the hardware resources more completely and avoids the
debugfs issue, but adds a driver for a block currently used only by
the CCI.

We would like feedback on whether using a plain syscon with power and
clock management left to its consumer is acceptable, or whether CAM_TOP
should instead have a dedicated binding and driver.

---
Wenmeng Liu (3):
      dt-bindings: mfd: syscon: Add Qualcomm Nord Titan CAM_TOP
      dt-bindings: i2c: qcom-cci: Document Nord compatible
      i2c: qcom-cci: Support the CCU output mux

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 41 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 +
 drivers/i2c/busses/Kconfig                         |  1 +
 drivers/i2c/busses/i2c-qcom-cci.c                  | 42 ++++++++++++++++++++++
 4 files changed, 85 insertions(+)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-ccu-99785a56dcd0

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

