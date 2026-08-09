Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F573793D5
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310969; cv=none; b=Mtm6KkojARlcHT/lcJJOxL2tpG/pB0PqKiDPFUUQ1O7Wj5w0ccNdH7P8ZqSqAgbvEYxGRLZjfZyJadA8rI7klj7Cogp2vZh7DtUXFeS1X3J2v5isG/dSXbcKhW6f5ZBvYsDtjckAdFwtqQZ5Z1UZpN6Bl/p6+ROS8eGEBT82vNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310969; c=relaxed/simple;
	bh=uk998/66ZhJEP8npAHhETVS/AoVjpt5dHoWqpClPnjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nCnIlkfsewFMtHtBgDsY90dySioDP7s0KcKoSDVYO88hksTfkgRZ/RXfLSUCSnepuLTl42eTDP/2icw/r5Bdw6ODPQUkPS6WT1l7S4/JmwQHDydKzF1uV/aRiZlxcL/SyRND5pf1zxJsSzfy99KUFTQZRpJTxRGVPQhCdREcXZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4TdSWkM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dj/IVERE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4TdSWkM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dj/IVERE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L7BLS141144
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 21:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f+n4Rcg+Pp/LYqaRT7CKmn
	gjyiocpVFdAjf5CZAA7cw=; b=M4TdSWkMV3zrQE2WIpws/CitxwV055aH5RTLSe
	+BjPR1B6GmbtKXBYRAKWizBvg5FduyXQfXtUUfhqkBvwJMjA+Z30dFsZbHs6yU6O
	t0WfM7RMUDR/dXNLAE6xOpPaVM2C5VgeXSeGW6iDoB1dF0X+JtaRgHFIGNB00NaJ
	bXDW4ZK6N5NWG69yU2Pj6WU3zuzrRq31c7ZQGWkaZ94QJvk96aVXxMQpzojY7AYx
	0t7l9DDCO7V2IbnklqNOHQqpDhKRs+NbMNRDCBVLCJiRfkfIU6sl94v7HOeF0Ov6
	l9IQEDr2OXBrluIH6KT9NCTBKNQ75E1erbvtcTrdmb+d8X0Q==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqknnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 21:29:26 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-82112a1fe2fso44004397b3.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786310966; x=1786915766; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f+n4Rcg+Pp/LYqaRT7CKmngjyiocpVFdAjf5CZAA7cw=;
        b=Dj/IVEREz8sIThWHSJWPPZTWR660Aq6k8kpXB+/UYc/Rl/bgvFRENhOzhskk/wJOdO
         dyInYwLos1YRFTHMT9Q58I2oLave1zOCA0lQXojK9lI4dVpgNDOm+wfrdPmKg5K6aTMK
         48NxMbe4ux/l1HdzBknhSRVokdoG0hqIOCgBOxVeqkCr/Hh8sAYPuiYrD7J7d3Pt+3nq
         JtvszpIkKoBPBMEGPwWm0Riiiacmr3cjIjjYFjdyuETGd/ox4vhF46vVjG5UmZWYikph
         F/O3ppFyp3bJ/R0EkIHk23gRW4Yzg0SUshgQkaKzOaH8Wcw1gFhemA6fQ3g+nSmf0B1b
         jnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310966; x=1786915766;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f+n4Rcg+Pp/LYqaRT7CKmngjyiocpVFdAjf5CZAA7cw=;
        b=Dda6rNoetZXcljgdn0jGWObY7/Kz/dWqezSF5zQik5wJH2TdkCfDcFXqZ5I5AZIemV
         es2GE+2G2OexbZsCeg45m4LDUWnTR8t7FiSThM0i6ylfdJuIc91XyO1FEjXlNeISSn4J
         IQWBRO7XCkNoakQ/QuXVmxf7ZtcG7sMncgHF84RakotvBx5vdS2XeZiDsHmN5OMyTWGV
         dR0FM9ov+cbZ+pmyUJruzd9ii/fEkIQ0B74maMkQsezfXsdw6Gc7CnMw1OqqqQPcLHq4
         n2wqVySBVg3YVXBcWP3ZP853zfyfmJxZrzP8L8FoklSwKTsrpWP8VwcHEZVONeuaexwi
         nyNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+pEe/kXyoUHmuxpaGvlMsdnvULbhaoVNt/orVAsFXUpIhRlNkqQhOVVkkb630j4nAkG+qeTl4spYe@vger.kernel.org
X-Gm-Message-State: AOJu0Yydzrunpi8yqqP/BT/X4pSGeyLwC7jg0aZYf6pZb9aEJWD6jotU
	FEnZd+NXxkVFHVbFOAYQKCDVYB5QlGfv3qFgpQKkcpTyiNRgClCjqnNuzhLT8DkPM3cN1gKPFNX
	VkQxEqUJDH5FpbZvqz+FkAqYtrhSUmfu0x2DE2qcJGUDqmgXhC8ByUAmdbPYsQ6tWEzP0pTnv
X-Gm-Gg: AR+sD10K3hiDIirCfa71mbhazYQptKhj3nPj/6aU5oFcn0RcIWXBtu30q1reU1xrVkV
	Gj9FpTUuvhvSNtDwUYm8J6uhMqs8tgKsdu4T5ppnaXY/3GeujVCWOeG1R5M1J03ahCd//heLwHN
	aNb0tBdAH4ZzO/JcLiikBi6/0mgjfgQ9zryZJRAdqaRJbGPvd9sx5qKvq9hw44CPOQpDrhZyaL9
	xMKShP0i1gEbWtc9d7fAkauZYpOaEmxgttRNwv044utT0NkuVpnUbEglQyJeBL19G8jhQDdEWqc
	yMbSroSWaizj0I1fEIULpf+Q6g+92TmfBgR7d4cfHiHWshdlN2WZWkbnIr5mI4vt82UD6i94Ita
	KpPtDR2xVioHSsHfCIoNkKrhtDs+BMR78+vrZhcKcS1O8Da6IA8DocKxpIz1rLggcamBiTIC8a/
	V1ahLuSF54HZi0FuWHfpZT5xgMokS4IP3LgDTIlQB4rQ+0
X-Received: by 2002:a05:690c:4a05:b0:809:9422:8c47 with SMTP id 00721157ae682-82576533cf6mr89277817b3.22.1786310965839;
        Sun, 09 Aug 2026 14:29:25 -0700 (PDT)
X-Received: by 2002:a05:690c:4a05:b0:809:9422:8c47 with SMTP id 00721157ae682-82576533cf6mr89277547b3.22.1786310965444;
        Sun, 09 Aug 2026 14:29:25 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:3150:772c:4c26:ea11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f75c1c17sm45248167b3.47.2026.08.09.14.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:24 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v3 0/3] X2 Elite HP EliteBook X G2q support
Date: Sun, 09 Aug 2026 14:29:20 -0700
Message-Id: <20260809-glymur-send-v3-0-2d1ed10e3a89@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDxeGoC/22Py26DMBBFfwV53YnG5hVQVPU/qi6MGQdXwSQ2o
 KCIf68xrdSo3Yx0R+NzfB/MkzPkWZ08mKPZeDPYENKXhKlO2jOBaUNmAkWBBa/gfFn6yYEn2wL
 nadGKLJVcIAsvro60uUfa+8ee/dR8kho3xPeFo9sUNON+xnryXkZNnZyipRT8x3LtFlCD1TBz4
 FCqY4VVnguV09vg/eE2yYsa+v4QxuuGb6Qn2DZmrBNL9xEi8Ygl2/7TGT8ObollZx71ey+BT72
 CDUGrTAqlW46l+mOLuFn8RuTPCBEQiBXmqci0bvQ/iHVdvwDMk52/gAEAAA==
X-Change-ID: 20260619-glymur-send-1136d243a120
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfXwb9o7nD5U9rp
 W066ZE/qG58WqKIJ3/aWKksTH+DvlQZLacs1cEpaY76X2eHHmjuich7B80ECv6h59hWZh8YfKvb
 jZEK75vDFuekWld9XYyMUtHYTrnIOPs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE5NSBTYWx0ZWRfX4wByStcjp5ZN
 QiyJg0k7J4MUgmMuQFg6mnxqMYNqv2kAB2Om8K4ZxOCQ0us0+dpGyCbxzcWlCeDMhOvhzdRoQOV
 /hHYOLwMXV95qO9QnnwzLd0CnEiTNWivsescgflHFEsFVuZ0O6oWT9fHoCptQrpGoo0extZj02j
 Ugsv4VWFf5Htpb7syF1DiIJH6VArd29X93AqJjMdR9jqd7MXabkWp6HcrHCGPW/x6zcx/Pj7cCa
 BdKYonyAdGEN85VkyztIbPC/1AMG0LabiaBI4XNwpiJiUA6Z4drPp7xlFCTyfI5c6ZwzlUreq8N
 9EFi7A4sZYWgM6NHgHVOR5KF2KQlsKkPCN2CRuINL6gDn9o/TAFHXYoeQbYzkiaEJOW5yKyUcMA
 A8P41Ztl57rVJ9XlWBDyw7shv9cwcGFHMZHGXR3+oWvIMCopVbP67z0OTX0GdQJgDVBgFHx/KGI
 owjCae6th0qfp4p4lrQ==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a78f136 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e0PlQuoavrcFzCkabjgA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: z_NOpliA_dt41ZbIKZWakyR7GtGTyd4U
X-Proofpoint-GUID: z_NOpliA_dt41ZbIKZWakyR7GtGTyd4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090195

This series adds initial device-tree support for the HP EliteBook X G2q
14" Next Gen AI PC (product SKU C4JG0AV, board 8E91), a Snapdragon X2
Elite (Glymur) laptop.

The board was brought up and validated on real hardware. The electrical
description (PMIC rails, PHY supplies, the HDMI bridge wiring) was
verified against the live unit rather than copied from a Glymur CRD.

Working on this laptop with this series applied:

  - Internal eDP panel (samsung,atna33xc20)
  - 2x USB Type-C with DisplayPort alt-mode and USB
  - Chassis HDMI output
  - Chassis USB-A host port
  - Fingerprint reader
  - NVMe SSD on PCIe5
  - Wi-Fi, Bluetooth
  - Keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - Compute DSP (cDSP)

This patch series builds upon the recent work of Qualcomm engineers to
enable another Glymur-based laptop.

Like its peer submissions, the camera support is missing today.

The audio, GPU and SoCCP series this board previously depended on have
since merged. The one remaining dependency is the Glymur combo-PHY
configuration patch (prerequisite message-id below). Until it lands, the
board patch trips the expected "Label or path ... not found" dtc error on
the DP PHY node.

SCMI on this configuration needs CONFIG_QCOM_CPUCP_MBOX built in (=y).

The bindings patch is independent and can be reviewed/applied on its own.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v3:
- Rebased onto next-20260807; the audio, GPU and SoCCP prerequisites have
  merged, leaving only the combo-PHY configuration patch.
- Added the TCSR reference-generator supplies (vdda-qref*/vdda-refgen*) and
  the vreg_l1f_e1_0p88 LDO they reference.
- Set dr_mode = "host" on usb_hs; glymur.dtsi dropped it from that node.
- Reworded the usb_2 and smb2370_l override comments.
- Link to v2: https://patch.msgid.link/20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com

Changes in v2:
- Enable the PMIC RTC (qcom,no-alarm + qcom,uefi-rtc-info)
- Add the SMB2370 eUSB2 repeaters on usb_0/usb_1
- Enable the compute DSP (remoteproc_cdsp / fastrpc)
- Addressed comments from reviewers on v1
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com

---
Jason Pettit (3):
      dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
      arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 1039 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1042 insertions(+)
---
base-commit: 115cd2ef86146afa47f363fedf97890575abcca4
change-id: 20260619-glymur-send-1136d243a120
prerequisite-message-id: <20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com>
prerequisite-patch-id: eb10b682f1419fa6bbb45943afca62a8250cb68b

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

