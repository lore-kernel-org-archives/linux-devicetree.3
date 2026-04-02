Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628DB32E6BB
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 03:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775102059; cv=none; b=i3c1LusfbQ+nG5QKPpDUZ05GQbU2GVdYeg1GjIAJW1+4sD3HHcHylOX6xSazROGGHjpgoo1WtEjeB6RI9IJJZGv2aWKE+iqlEtdWn5qcjuFvMsI5aYw3TYHrWfeRHhwnKhgwRF5rbddfKX337BdK5ZWz+BDlrnJkiXQTVcfQwe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775102059; c=relaxed/simple;
	bh=0yGPmguvPqcmAuI1dBu0bsIItGxwXkpDtxOYuGehWlg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FJf/DjbryGQ5xRNzeAYjKMfDdTYCa3DwiMqBZb3/U4UgpQYxr4am8n7bB6RfcOGu67DVfeCmfaTlwIgv0wxmOSm6wvBmgukRqITJexn9Y98qtkMRPugjSMc0ZDHxi+9wHahLNB3GPuUCmgK4ABBRe9e5kzii+XUe00cjgBLTEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iF0xJUpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvE9Lfgk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iF0xJUpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvE9Lfgk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4PaH2904396
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 03:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ri51iB5cXCkdkK8wdR2vo1
	E/J9EV+x74w3mmVibn3Jo=; b=iF0xJUpEvDHikaWs8n4gMtIdEJP8ySAMHgVEnC
	tqj/8zW9yOC0+VWjlM2AOLaYnNFASRIspQzijFjC8E4L9Avkg12xdmUpsnYLVvf9
	aPVGpf8uHHQdOYUOMcaYnMNXzeiRYRaY/JS5u5tUU0h3Qm3nAcIoj+SzugZ2uFDH
	RT9PHPjzfIjMo5WInv4flxF3giAI8fJlAl18TQFbTMeL841YDz+E46bFDQXMy7LU
	DTzWz948pZUOHlVxnPQzn8EjjcILx/xSzs3rn5gQ+EJ/AXvPCNdNKEyhkHQ/OXwO
	eJFHRQut/3XHh4I3n4ZDz6teE88TsDcISw0GqQmybj3OFLsg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954canqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:54:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7422397574so671308a12.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102056; x=1775706856; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri51iB5cXCkdkK8wdR2vo1E/J9EV+x74w3mmVibn3Jo=;
        b=OvE9LfgkPOR0buIXJo33eiAXmEZTBsDoKKYCd8I7eziKRJWCHiY7Pr6Be92gL+Ejdb
         SHM3fxcNnPtCPpwMxbt7qpoq+WtlS4oFso9Y9bjBit6eEfgIiPxoU2GxdU1Ctem0hrnN
         Jr8HQ1mN2yS6Oek1K0jI8g+Fuuo21WNkGGLCVbIX4g2xU57xszton9kVevLCSWGJUBsF
         /UFVEMBt3xsYuPRbwjz4BKCScorYfQyVOG2WTCr9lNDtUHGypKBLceIRPLfxL8dzUPRH
         gf2dDkwe/I5eg99uQHrGynoKfkA2lefysOe8emYVrg8S5FUin3eMnFUiTIv24vQ2M4z8
         xhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102056; x=1775706856;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri51iB5cXCkdkK8wdR2vo1E/J9EV+x74w3mmVibn3Jo=;
        b=kKu3hyNCmZ0W9ODQmLB1FqUF2rz+0hqcdmZK5q0pLo6beA+qDGAOuRqS0k5RFKrmuF
         XHoZtO/aXmVb80SVinaz46O5wjE/BU43ziwKuC131xSl78iTjaurcb6Lu2Ibkcy9Dh9D
         XcJ9eUKFkuWDEv9Vb1F28D6pXASlrI7K0heyLzOfJ7kAMVqoY+FW1up2fB5ILjvjjsXk
         aOayRoYlWEzcsYDYRsWohmhcdtx8i/R3lOSSpeYysfoI3Xme2xLNipzej1UxcRYwfSan
         Sin0OTcTfvxHMuCOjI5uD6Fi2ozKZ/hZYY2gm4kNxyqKTHNDWHcN/UVvKO0Zy6W+zpyf
         FhQg==
X-Forwarded-Encrypted: i=1; AJvYcCVVuAA1l4gUajIwAlzmioyp89qzyliRz2FUpcVBH+dTK5ubwFALdC4omg4GnELyM4hFgwsb/1NgBvTS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb3Nbo5VYulHdG0EaEqourH6LbfWyEFNJZlPptgw0zkCgxMWcR
	iiy2Jfuv/FRdp+2sm7NREQKAr0ZnYBW5ezO4Okz4NIw2dQiqxFcxpbClSaabQda3WEq//Su62sA
	K0PX5uBIgGeO0/SySCnean0RWkxEDkSqJ7fuwt6rSeh+syYuxh2/YpuKGHwwLd+8w
X-Gm-Gg: ATEYQzyTN68e672txbT3yvtRJDie990CfJH4eYa8/7k/UKrovOIwg7MxJcukkHoEMwi
	f9lKyDsNla1swvin7FYugzHsL3vT3O16BfhY4ojSouJlsHO9VlqUYm5uB+09km+/89yM+TTfbLk
	Tc2Z8kQvaMlKbQVCkqebfCPyqNje2pYoPi1l0Z5H/BQ3Sp9yqV7L5plGWuz956DvxXrFsFvVNvQ
	KmEFgL9n82lENAUkhiNnAs3Zg1/MdfTf9FAnAvsN+0r0tfvpo7hyqO7guBlpWHE5hbfiZT7sRyN
	O8jDnfpRYmdE7AUeBKerv7VmalY5a4Sf6MMsCPGSzu6HruOAahcis/VV08h0uk9BGt2kJVR7RyG
	oAyW5l1mVFpF4PGMl0w54S0FoIgD7M0Rvz5QCp4IUSlzzNE7ftrrjOC/x5lXiZ4Oi44RfK0iMlX
	fuy42o6KVE66xAzDAT763Do7n5xcYF9BP1MdoyPNg=
X-Received: by 2002:a05:6a00:984:b0:829:86aa:e163 with SMTP id d2e1a72fcca58-82ce8931fb8mr7170798b3a.13.1775102055944;
        Wed, 01 Apr 2026 20:54:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:984:b0:829:86aa:e163 with SMTP id d2e1a72fcca58-82ce8931fb8mr7170424b3a.13.1775102045792;
        Wed, 01 Apr 2026 20:54:05 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:05 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Subject: [PATCH ath-next v4 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
Date: Thu, 02 Apr 2026 09:23:58 +0530
Message-Id: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFbozWkC/3WNQQ6CMBREr0L+2hJoCwZX3sOwKOUrVWmhvxAM4
 e4WXLuZZDJvZlYg9AYJLskKHmdDxtlo5CkB3Sn7QGba6IFnvMyEyJkKXc5fzAxjIblkum2bUih
 ZquoMsTR4vJvlGLxBZJnFJUD9S2hqnqjDvreznaHg/Of4nsXR+HczC5axXBZFU2mFvNJXR5SOk
 3pr1/dpFKi3bfsC2Mm8Cc8AAAA=
X-Change-ID: 20260331-ath12k-ipq5424-cddb63a46a97
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69cde868 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=hcgyll2ojUKJi-iaWUgA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YKX3UqZegE4VdaAeApcIrBV3eKo0DwaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfX0MPHABQEL/Po
 BCX41l0+Ymqu3r6cvSiAmEgAa+57O2qU8KvMB3ypV9WrsD3S0UKhJvqfvC9RV4aRzu1Nne+nFkm
 lN1cf+J32kbLNzWsmr5Ef20DiEyXLZzUom5qOCZN6FxiQuhzaSAggqyZ3NxRZ4ViZadcQKTPK4z
 fxnYWPU6njnX1So8eEqwCqXbcXHzddLfEoRTvrbA2Gg5fYugcqQ1XmgbVcxkwaXt3bsWwtwnivT
 db6GT+HUsdOVhSGHnuYTnVcmHHOWWXm6zIrykIfwxAhnV53B54qO9NmsyDr6kgd+Rn6h7F2H63b
 5HIahDzpUBHM7wNdpmR+b8eh1PSqK/qFul088/jN/Z2wX4GnRaaQdtViJMZ+e8ystHO6Dwudev+
 1gxMp7g05MO2IPFokP2C4eBsx/PpIlIE5NrnJLetDtcXmMb6/sNM6HeHdYVMF6vf+m3sGeEgoJB
 OeiH6up0rs8OLbXnd0g==
X-Proofpoint-ORIG-GUID: YKX3UqZegE4VdaAeApcIrBV3eKo0DwaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020031

Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
AHB only supports IPQ5332 WiFi devices.

The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
configurations. To enable the IPQ5424 device:
- Add the necessary hardware parameters for IPQ5424.
- Modify the boot-up sequence for ath12k AHB to accommodate the
  requirements of the IPQ5424 device.

---
Changes in v4:
- DT binding: dropped copyright update as per discussion in v3.
- DT binding: Used DT binding from v2 and retained Acked-by tag.
- Link to v3: https://patch.msgid.link/20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com

Changes in v3:
- DT binding: updated copyright.
- DT binding: Dropped Acked-by tag as copyright is updated.
- Rebased on latest ToT.
- Dropped ath12k_ahb_ops because qcom_mdt_load() and
  qcom_mdt_load_no_init() now have different number of arguments.
- Link to v2: https://lore.kernel.org/all/20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com/

Changes in v2:
- DT binding: Removed the redundant example for IPQ5424, as it is similar
  to IPQ5332.
- Added driver probe data structure to eliminate the redundant switch-case
  logic in the ath12k_ahb_probe() function.
- Validation completed, hence changed from RFC to PATCH.
- Link to v1: https://lore.kernel.org/all/20250130051838.1924079-1-quic_rajkbhag@quicinc.com/

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

---
Raj Kumar Bhagat (2):
      dt-bindings: net: wireless: add ath12k wifi device IPQ5424
      wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424

Saravanakumar Duraisamy (3):
      wifi: ath12k: Add ath12k_hw_params for IPQ5424
      wifi: ath12k: add ath12k_hw_regs for IPQ5424
      wifi: ath12k: Add CE remap hardware parameters for IPQ5424

Sowmiya Sree Elavalagan (1):
      wifi: ath12k: Enable IPQ5424 WiFi device support

 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
 drivers/net/wireless/ath/ath12k/ahb.c              | 36 +++++----
 drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
 drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
 drivers/net/wireless/ath/ath12k/core.h             |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 93 +++++++++++++++++++++-
 11 files changed, 231 insertions(+), 21 deletions(-)
---
base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
change-id: 20260331-ath12k-ipq5424-cddb63a46a97

