Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FF938D3E2
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642411; cv=none; b=RePYATCHFlN3pYIheyQex1PqAiqFLtoWT9W0lOLvEPTF7XQi9b7WyOJf9azfe3iVp9tkZ4HFts8UALMZ+xE9VxCM69l+SebLY0hUd0tOXLj8jlkY/SrBH+LDq5tK5H4SOakYZvJ7kJDpC0Cb/amiEO99FT8Xy5drahdr/SxfiBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642411; c=relaxed/simple;
	bh=0DvgJe9M5nomijPW4Vv8W2x0taaIpU1qtrUmP5eB6hw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rGJITNeOG/GkwC/RJB98gVI9SV0Z9mUIEbRwrhRobGRKJyMbDCGosz7PNa1aShBwLR6fKJPbAoYZnNCCLDUy1KHuRUoyT6bknPFBkr5CHTJcpgp7fUWN30czSlyhijiXvIOb1QMlBblXJtPFeOd/B9BtziDqNpC9LzeRAGUd/ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSqR/1ki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zpmwxf4c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSqR/1ki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zpmwxf4c"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTbdQ3706099
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MqGpVnYqXLR5cHWayrBhIW
	b8rehflXSiYS3wKSRlV4k=; b=JSqR/1kiOuXAchQLEmA7oojfY+HVN3tvGpVgfr
	f9n/UUBmrza3YG8D2x0PNCU9k3svNKKKcqa9mEuaPJD3naxlXy1eNfHGruBYVtwc
	Cg1HbuY0qFa2a2ja5wqyA1wqnIbh7XXcGwHRdhD4g734aGyurHRrRhyqV+WBEoOW
	S7sIgjetlsUlmDGqjPeB138MGUR3hRaaDa9SzdvWLP3e8dCv8qVW/T190swB435E
	LLv/Mh6SyQBAzug3QleuVzKQurK5WtDRBPUBojfHqKQqA0YtTBxSNmhMjtblpT9Q
	Dx4b9QF4u0y7Tlwl91jdyBIV5ESQbERQfT3nXTQLM5dJDKJA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5k0mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:33:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3883dc4ad23so17862a91.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786642407; x=1787247207; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MqGpVnYqXLR5cHWayrBhIWb8rehflXSiYS3wKSRlV4k=;
        b=Zpmwxf4cNjDmPkfsQKvD4Je9H7inQD7FdVuIKW39SxbFvK3DWQXZOskZ7u4Nw1Z/z0
         YiTPg7KecR7RJtyQKyaIAgCau4ro463Oi+NX5iXlwpxU9ELkwOXjB9AJR2hst/1euL9v
         kzDwRfnFkdmhjx2+wGTOiUJ4wiNVHDUiK4n2GELsIA320UEs1Pgf7bmaeGA6bnywl7CM
         WdaolmvUdapzOQ4rnW0LD5jj1T3EE2kL8xfJwqva6HhpBOLG7Amk5t5CetSroet7boJP
         g3pxlVlHAhd6u38RZNBFqwoeT+/CwVN6EaPaLmhJjgLaFO/QXNIyZzQinF1x0Ink/Pww
         On+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642407; x=1787247207;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqGpVnYqXLR5cHWayrBhIWb8rehflXSiYS3wKSRlV4k=;
        b=OBncfGJL8OXU4hIMX3bTwintlLP8zDVLsHTaNBgzpeHx9W7WprZDMtWbxvpH5E8lvy
         iAGQzwiViYJqgTz2sdB+L4bV/mit8XcYBPKEkQ8IKW1/xRsNEmod9lk1cSog1jUX12lJ
         gWfHKbDTz7v3H76fZ05e/Z7gPsZJgq8tpGTeH/mrJkuYPOD4+gSeagIxIXEqlprhioPk
         glqTR9BY7NHATkPKEsXERZvWWCJ+B0vRlkIwitgt2KyD762Y+TpgBan1K+BDcEPQZhFj
         TuxVEBVCTzTfY2tULfMl7Raj7z54BKs+HffJJQ89Jo2YnSd6eW6aLt9vAAKP4tC8G/FC
         I6eQ==
X-Forwarded-Encrypted: i=1; AHgh+RrViaf2Kcsz6A2uum+bx+8kYWm5fjAsEdMnqNuUjwHh/zpTTFxTl+2MbJxhQR7hTTfWtbS+Kq6Mzv+y@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdoP9kHQlVzSKQuwF40HuKBNQWFv+6m8/1JJQOnbnnX5oiaPz
	D9pHfBEQK6Il78W1ZFpsejD9gmtORjIWJ9IJLLQ1Y6AX559Lcs+mnZGeEIwxXXHMxeW8znUmXMP
	9w/uJ+qi0OZDUjgSho0CWZPRg0vlEik54PuKuwZM3WHmYT3nPoP7fThYieVh2stE5
X-Gm-Gg: AR+sD13dMwdOtIT+hkbGmpDt877SCtHQ53E6j0Es+WfWPimq/ErB37Jcx/5BU+/prHE
	WWSTUN8J3lx6TGtwq9CSpJy9/ZX6SQuHNkn44i5FPVVpnPjLRlUxXYG8rx2PI38NxX8L3imuMKC
	xELEQV8ehALfeQ2iUfQItU0YyeeGJdSfiUP0lZy3Bv52z2gf7YtfSGLUmLd4k3++o0R2wckvrbB
	IKwTXKFesQx2pl4GgaOdjbhVh28XhEtpzDZl5iXLY2v3NJ9PV8VwSpNiHkqBwcmh2xoL0pR89Ja
	L9LldwFXVs91vekHlee6xrw7dCpryfwul2HNZQh+zl1lNfoROooJXx+6uWKjLmMqh6flF2/alc+
	ouAjq7UoIPgmMJDbhGIDZufk3fJNlJrIVcp/hitpeOtFaGZ15Th5CJ0d1Xe4mEmdfr4kcDX+XvP
	B8UxUtvKJD5P6BIAhokPYL
X-Received: by 2002:a17:90b:1d4e:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3931e282b77mr6160256a91.2.1786642407417;
        Thu, 13 Aug 2026 10:33:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4e:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3931e282b77mr6160224a91.2.1786642406966;
        Thu, 13 Aug 2026 10:33:26 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd46309sm4300696a91.5.2026.08.13.10.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:33:26 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Add LVDS display overlays for
 lemans, monaco and rb3gen2
Date: Thu, 13 Aug 2026 23:03:19 +0530
Message-Id: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN//fWoC/22Q3WrEIBBGXyV43VnURKOhlL5H2QujY1fI32oSW
 pa8e00ChdK9ET7RM9+ZB0kYAybSFA8ScQ0pjEMO/KUg9maGT4TgciaccklrqqBbXYK0TNMYZ+C
 uok5SKSrPSP4yRfTh68B9XM8c8b5k6nxektYkBDv2fZibwisp6hKlQiFN7XztRIWtUIwyYytWt
 qYumdZyR/eYkjnqNMXr2YZpMM5BN2vOmIU2BpcfrBIoZKDjnAkulHwfU7rcF9PtYy/5eHvOy2O
 hrU7ByQzYgRstrDzjPLfcY0m1VvoJble9hTSP8ftY5MoO19+Wf3a2sgxkPhuaku+O/4Dkum3bD
 4TDDCuaAQAA
X-Change-ID: 20260708-lvds-support-2d40d60654f1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786642402; l=2925;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=0DvgJe9M5nomijPW4Vv8W2x0taaIpU1qtrUmP5eB6hw=;
 b=KeznUSG+LRUVVULhqe7UaFKnqL/DbRn5ekGqEEUJjm0ziBVtFTABN7pSW7mmEXDKoSB7lxj1O
 /Sf+ULou9BbCBNNZ7zEUGYUpbaHU/6tLFPY6YAinGlMKO9V0jY8K5xD
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfX6EfTbH+g8DWi
 6y89TH3Zk2DYZqAwKC2ctzNcQdqGt+SEELNa+zyIbbxDnVymSRFCUZPdn2L18Pj7HIMsbFXCOGt
 kBdfU+wxZXXHy6x28Gh8XXGw/cOMCTk=
X-Proofpoint-GUID: 68-WhKQvBWgmM2FPesBk8oZjmyisbNWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyNiBTYWx0ZWRfX9OAPnJZTWpxq
 B7BWLYM75JHB/DRUp9ILxdlnOW6NfU8KgsJPudXM8WEjfsIwCtLT5wNe+yTKZL4l22mVMth9VvC
 GuRECSF+ZOJarff/5okZVR1gBds35HNa2IWmCeQGLN5d+YW7eIiJd6S6GhnZiqjcCUA7tXaEkkI
 h1vFN440r4PCuduHw9wnUhklu06BCp1LIwGsrmB2gQGkT1cUu/8etPcgM8atcFX9IvzEvhqOhI4
 xasKDM5epM/awgTDdVSuqaYauJ6OfwZh6RlgEmAMkre/HgTCiJcZ0O6mnTDXTOjkQBMcbrB0/Kb
 t3/Z0UjF3zTcA5E0iPtTHxkS5vPXhfsEwbGz/0ENx0QfKpMPFYwQsVRn6Xfc7jlaK1XiLK0zgBg
 A7ZMiN/cU3Jn/HLSu7oDficjpEPLx/UMBwm6k6I04Zf37LlH8kemvfDgM8tRIeKWJS3RuPyHjn2
 tX6aeHNGT88HPOMAgJg==
X-Proofpoint-ORIG-GUID: 68-WhKQvBWgmM2FPesBk8oZjmyisbNWs
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7dffe8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7Z2I1jc64i5zuNuQ5A4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130126

This series adds LVDS display support via device tree overlays for three
Qualcomm platforms: SA8775P Lemans EVK, SA8295P/QCS8300 Monaco EVK, and
QCS6490 RB3 Gen2 industrial mezzanine.

All three platforms use the Lontium LT9211C DSI-to-LVDS bridge chip, which
converts DSI output to dual-channel LVDS for driving 1920x1080 panels.
The overlays follow the established composite-DTB pattern already in use
on these platforms (IFP mezzanine, camera, el2) and are structured to be
applied on top of the existing IFP mezzanine overlay.

Each overlay:
  - Wires the LT9211C bridge to the DSI output via an I2C node
  - Defines a generic dual-channel panel-lvds node with VESA-24 mapping
    targeting a 1920x1080 (476x268mm) panel at 148.5 MHz pixel clock
  - Provides an LCD bias regulator through the GPIO expander

This series depends on:
  [PATCH v6 0/2] This series adds LT9211C bridge driver by extending LT9211
  https://lore.kernel.org/all/20260719-add-lt9211c-bridge-v6-0-e56d22152586@oss.qualcomm.com/

which adds lontium,lt9211c compatible support to the lontium-lt9211 driver
and extends the binding YAML accordingly, and:

  [PATCH v2 0/2] This series adds BOE DV215FHM-R01 LVDS panel support
  https://lore.kernel.org/all/20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com/

which documents the boe,dv215fhm-r01 panel and add timings used by these overlays.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v2:
- Updated overlays to make them compatable with panel-simple-lvds-dual-ports.yaml [Rob (in panel series)]
- Added Empty lines before the status property  [Dmitry]
- Link to v1: https://lore.kernel.org/r/20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com

---
Vishnu Saini (3):
      arm64: dts: qcom: lemans-evk: Add LVDS display overlay
      arm64: dts: qcom: monaco-evk: Add LVDS display overlay
      arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  14 +++
 .../dts/qcom/lemans-evk-lvds-boe,dv215fhm-r01.dtso | 116 ++++++++++++++++++++
 .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 117 +++++++++++++++++++++
 ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 105 ++++++++++++++++++
 4 files changed, 352 insertions(+)
---
base-commit: f86573e68e56a7df7d54eb58101ac413ba731996
change-id: 20260708-lvds-support-2d40d60654f1
prerequisite-message-id: <20260719-add-lt9211c-bridge-v6-0-e56d22152586@oss.qualcomm.com>
prerequisite-patch-id: dbba64d1ace696df388c5df3d1cb05a0701df194
prerequisite-patch-id: 7729b9c67a7c274b25fea08635dfede3fc604ae9
prerequisite-message-id: <20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com>
prerequisite-patch-id: bd3612ce053552e2ae7401a1217c4884413563f4
prerequisite-patch-id: 1d3e40bbefcb2550afd81c5cced812a1d3b943a2

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

