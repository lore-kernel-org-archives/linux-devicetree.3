Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678706;
	b=j/suUCXJ9glpGK9k6aEH9mcOD04sXxGIkYmfQ9t+ai1bu3ih3knNlFmmsvne/X/qRLpU
	 mKKAWYHxeQJ9RscEyQwmnVHGu+HBAtoMzSnaMbANZI8kxuyVMKjHRr0Ae6YaKzmSBuZGc
	 ZybWsm5EdEzbut/CFDM5PjfDu+jVCNPvsdqRNzhmv2il4TezW8Xl7szMutNRfZg2reuxm
	 lKUTwRhy4yicbQV4vsYmpDRI/Cl9VOYi8GgwepdYyBPtXi4/oWJwUtsRr5bWx2hPyqoAU
	 K4AVV01uNBfihoPNU4sdKyLdFwzLd0A5ASWUAfsYyRopX2LuT/WPznMelTFGO5xmykg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YA1Blq4ppgGh0yHluPfL3JZZmE/oyALbTlX72JCcysw=;
	b=lYzru/tQ0HGj5v3ZiWHSFUGiMxB0o1dnSfbO1tuRHUyY4FqBAZxz45zTla5AM2B2kUal
	 Tbkf6nG26YbqulJPqIQ7/mMIUQZv3koINCkv8L9g1UAfKQs7Li0PNd8ccc36h5D/FgMJX
	 OaFuu58uDkJnKie+UnkM0bL+Fcq6q5mTNuGUtBIWPRvEwdIaNmWLKexRxLuVCBsrYI7BN
	 F+Cl10WC2hpqBio9QSi+/U2pHk6ZRL318XiBisDF0E9U8fCPw2TA5cHMSvwYs578rktOn
	 HtzLCQES+rlBBCsXIF5o8nvMK6zG7GxV+DBrJj6d5Y1Ym8XM1omAQmbA7dQO+P9APBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cpH1xXzK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVGHONBO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7D606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B7D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cpH1xXzK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVGHONBO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3Qa2210829
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YA1Blq4ppgGh0yHluPfL3J
	ZZmE/oyALbTlX72JCcysw=; b=cpH1xXzKBhWVYrY9gl5H953oMoIK4Ud4LDBeCC
	rf3fBdmxLvLcScos3P0Qj4yELCD85kPHW7qFTM+W3ShgEjz95491wyS4jYX9XNmW
	nPe/O3X2+uQopm2Q3ne7T7U9VZ2HveD0gQ8CBuHvlcag1BOgjAVSlZ2/kxVpIqaa
	9LfeWnTHR2JtXiBOIUsJAj4/FFtKFjNRHV1kBZYZLGYa1tKOXk35++eLTJArCWOt
	aslOUGCx+IamiIYTRx9xCzMQhMCC0f6tXtjF+cVjmBtGCFWqSYXxG20t80S2qjlb
	8ur3GIa37xxoQvjeAOEkb5wgyMQSzWkRIR68L2XSHhIIEYig==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf9ucr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:38:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd652c0385bso4575152a12.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678704; x=1796283504; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YA1Blq4ppgGh0yHluPfL3JZZmE/oyALbTlX72JCcysw=;
        b=NVGHONBOdlumplamWq2K89MX7EPtwVhVqilCn7b9oY4xAn0oHVZ3Dr6Es2E6bttYFe
         XOzbcLrHCCBitjWj+PAh2okfoCNk5zDeejhINWIWt+POKfsniYX3bBW4yCJXRLLXaHeL
         0iTQxsQB+aAEc7SX+YQhyP7JuMlU7GrpkfQ36FLxc9Ig9fW8ka4DkDKBCALNPfuplZaT
         9yZmnLFMD4NwciOZdhays6MEb+obwROxE/fNQnxSNq9XAaHUmSkm8aCk5v5i/LaQWyOF
         RZiv+nSWriYf7unOISOAkssPXaGidvQBghIoOWmfxRTF3jbIqNfQVAGSsMwWokTewTYU
         aH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678704; x=1796283504;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YA1Blq4ppgGh0yHluPfL3JZZmE/oyALbTlX72JCcysw=;
        b=EXJ79hiNTzvEPPEw1qS5/Ko8ZsVJAQN6vl38lNOxgZWduWjsBMUdxDZ8h0gYueCTd9
         YsMJpUZLd9+JNUhv9AFy/NPwZ4V8KOaarAfdkwiqgB9tQrfgbGyKzf1qKThW0apeeTEd
         SRYXywflCfCZcYt6OuxeyuSUGSkkWBdbWgF36lmKGF/KjKE4U43uPU1vxMN46M6c7ZJK
         Tr2ugInGzRcA2Cj8p5OF/KsDpiKcMjIf3q3TfRKmxjNPg1IPc10iQjLo+4fK5zt1MkIm
         bfhm2wsFufSsy6k5ngOUMWLejzrMkJmG96MTT6a65F00KElD068AzcLdwwFUL47AN9Tk
         /fpg==
X-Forwarded-Encrypted: i=1; AL+hErEG8uXHo4m9MJ3OXb/1uMKBmqCUBYDuscJsBSkQ4C8xKyjFFpfEPUQzlqBZiA2YzKBUlykh5iFvleNh@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q89Wt5HH83T5Rt5hWd4p4zggmssv6L8STUR5Uwn2k7gZzdGCh
	I8p6L3xSRrFau16BUn9xpm86bh1EzrtZMO1gg9pvXCaemiJlm/GusWOFC7jRzvgW88Ag1wqcVa0
	2IYHPcCiDeLjBgTraOg2iHffj4CWhbJK9sh8JaW36iaFvo84+eY6v5ZSCLwsaq4bjp5WDsVDr
X-Gm-Gg: AZFdTZcXVxWQEJRoP2wNR/HeuqzpP5FotJJUV4S6mHRnd+jeH1by7fVy/DWVpRib90G
	lkeF82F2ynDFBdWD8ObP3vhVN4EHcOFiSBFizrvW3Ozjyf55myeG0jDYMxF1Xf5WBhSleab78QB
	Yaud3V9at5xmlDw2n0HLAZlBRf+dMdULhDlbOS9833CL3xZtb/UP2ppKqjjCg0T1uDj3fW0sZoY
	Lecp95hdCh7buvrlYn8QLYS1bTLqRNkDYFLQtcpeOyi45+kHK9xVfCNrYdyIseOVFrIb4HS4imX
	7lBgB8sa0gcUH9WDI1NporUvZcxNCa08vzYcsJAEhgL8TAT7bWcAgKYtzAQJkuErU02G8qJg/3T
	GcDDb4UA0IKmVH6T5P53UtmmkVOwE4YIcFUADl4PLDXOgdiYAHVGddUbpdLT4qMmblfOlxNU25l
	quKVPibiXD
X-Received: by 2002:a05:6a20:6a0a:b0:401:d3:b917 with SMTP id adf61e73a8af0-4014cf54aa7mr21944005637.63.1795678703641;
        Wed, 25 Nov 2026 23:38:23 -0800 (PST)
X-Received: by 2002:a05:6a20:6a0a:b0:401:d3:b917 with SMTP id adf61e73a8af0-4014cf54aa7mr21943980637.63.1795678703172;
        Wed, 25 Nov 2026 23:38:23 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm5042987a12.26.2026.11.25.23.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:38:22 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Subject: [PATCH RESEND 0/2] arm64: dts: qcom: Enable DCP on Maili MTP
Date: Thu, 26 Nov 2026 13:08:16 +0530
Message-Id: <20261126-b4-jshekhar-maili-dcp-enable-v1-0-3d65c89bfe7c@oss.qualcomm.com>
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
To: conor+dt@kernel.org, robh@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795678699; l=3687;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=CxeNKvR8duZnvJRyTCCs+tbLsc277Ha+QtpXq82oRHY=;
 b=Rv8Y4rzBHCVAOATAlQacBALWyXAnoiy+E4N1nsRgKi9YjLoidv4SByr81puMmF2TYN81kEpWA
 de33ukKD3hOAMUf5NjYlJ/xKg4S40siTT62HRpPptaAe73Bn3RDSHqE
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: mT-XDigclJvzRiBZNPhdF8upZnTFzeet
X-Proofpoint-GUID: mT-XDigclJvzRiBZNPhdF8upZnTFzeet
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX2JVoqWYZStkN
 FXYZ/B50KmjZVVPC9tg3bjhCEiaA1HXzolo0rFLmTHjJ7a+EZ61ccos2YIiv/K/s3GUOPmmYshv
 vObKrsQI5w8gx5oo36JRFuLPT+d8Zhs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfXwTxpXOphxgWG
 fh/sP+9ATzBTFFNG+yUcYkv2D7im++H85X5RyJMKXcKwGARxYMHR9hCKaUCYZCQB689d7P10vbD
 AvdEAmEKgqX9sUBSApCZ/ZHICBtKOi8o1Rw+a4ZKBj7VTCaoKLgqhZkh9nb4eB2FkqcWMzefMRg
 QamPLooGIBfwuDzwitBOoyVTsTLvKR7WtfzyfhdmagAEVev+cFY+JgZBumG594Mo0q1R6bcavIo
 VxwFR4EKV+3pi3ikcwsFX3ACLvTUfb0b0Ijn59fo7XHbRzOYp74YSAmTnj9zj1JeX8lky5qdcj0
 uvohTCGEC4lepb3G+BvsXzmhRpjmn+pcd8hUOuc/1L4jQ6dVvvS4Y/qd5XWuk+ILrxGal2KiQWc
 AEw4+Ei62D8tKIPjY9Wi0es/MzSeGiwIQfaRzW3GdzBvSnjWgM+FzrFy8j3xcPJnzvvK+qcGhW/
 wF5nNc3FXrvHHWFBa5w==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07e1f0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Lx_9dNaADeAjOkdmO44A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

This series enables Qualcomm DCP display support on the Maili MTP.
DCP firmware owns the display hardware; Linux accesses it through the
Qualcomm VirtIO host transport and the MSM DCP display driver.

Patch 1 enables the Novatek NT37802 panel driver as a module in arm64
defconfig. Patch 2 describes the DCP transport and firmware display
subsystem in maili.dtsi, then wires the Maili MTP panel to DCP
interface 1. It adds the panel supplies, reset GPIO, and pinctrl states.

Dependencies (in application order):
- VPU IOMMU iommu-ranges support (patch 4/13):
  <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
- Qualcomm DCP VirtIO host transport (v1):
  <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
- Qualcomm DCP DRM function driver (v3):
  <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
- Novatek NT37802 panel binding and driver (v2):
  <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
Jayant Shekhar (2):
      arm64: defconfig: Enable Novatek NT37802 panel
      arm64: dts: qcom: maili: Add DCP support

 arch/arm64/boot/dts/qcom/maili-mtp.dts | 130 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/maili.dtsi    |  45 ++++++++++++
 arch/arm64/configs/defconfig           |   1 +
 3 files changed, 176 insertions(+)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261126-b4-jshekhar-maili-dcp-enable-eb2ce69fcf55
prerequisite-patch-id: eecfd66a55b8f2b7b2fc7d76d815facca0489d00
prerequisite-message-id: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
prerequisite-patch-id: 43f30570f31419a014962e6012f98f5b341d46bc
prerequisite-patch-id: 08ffd8da137637eda4fa6d64a4a7fc5a24ea80a6
prerequisite-patch-id: eca5d1310fd57c909cedf1668e075acb966db4ba
prerequisite-message-id: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
prerequisite-patch-id: 72baddd88461d6eb9ae02be5987fa1d6483cba22
prerequisite-patch-id: 0c075c6b5ab526394f31e172b73d074382736e0e
prerequisite-patch-id: 3263d4ca08492441a2f3c4b7d7724ae97535de29
prerequisite-patch-id: 54c7c8d04f11036d716ec23976e94f962d261750
prerequisite-patch-id: f6e5093f779820655cdcc0f8d5693c040873a823
prerequisite-patch-id: c0330919436ea36a5322a93008d932aed1eca743
prerequisite-patch-id: 0ad54e3e5eab2825b24bacee114ad25cd7133204
prerequisite-patch-id: eb1547c27ab35800e8a38f4cfd760285cb57c0db
prerequisite-patch-id: 1c47b825b6c7a78d6d89bff5655404cbb9ca4ae2
prerequisite-patch-id: 38fe1330d79a5e6f4797f25588dcdc17f4a1450e
prerequisite-patch-id: 15025d3b58e7f3b7a23533111eb26df3554e8c08
prerequisite-patch-id: 655e9f37d822450523ebf1e485adc10d196e3a4b
prerequisite-patch-id: 824412ddb416d43256347baa0dbd47ca8485f6e0
prerequisite-patch-id: 6094e7eb2d3cce49e07be6f6428004321ec2d762
prerequisite-patch-id: 58da7873bb288df93ab9d6e8e9cb6e8e3d5c8ebd
prerequisite-patch-id: 53c063e0dd50f1462894bc5ba58d231e92fe3f1c
prerequisite-patch-id: 182886b1aa1fc1e3200503ece0380e56446fb32f
prerequisite-patch-id: 7f8ba80e3ad16ef84beb24781bcbbb774c8c6887
prerequisite-patch-id: a036601e6280e82b4d8f1ba0afdbf04285e76f73
prerequisite-patch-id: 529aec287f758d98fdc7760353a50297b737e87f
prerequisite-patch-id: b5e513cd73a3b7132a5a0e049bac9d486051a874
prerequisite-message-id: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
prerequisite-patch-id: 3e049a8a6ef8ba6dd748d88d60c5c76dda51e308
prerequisite-patch-id: 4b91b15bbaf8654013056643d40fdf40bfa043d4

Best regards,
--
Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
-- 
Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

