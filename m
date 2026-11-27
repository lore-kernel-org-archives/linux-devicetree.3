Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768372;
	b=gh6HYEHxMxb0eAvQ8Ct2wRH8EKX2cnY+cDO/JCi+gXdl11REyUpFkOD22Wrj6fbHWVGX
	 QBCDPbUlfrlm7bZF35oxuTEUUKQWqvsIw9MHGspj2bbT5LdRcr/0LZr6TM1BasUjeqjJQ
	 7K5/JopAT5PqQLxhsx8lLuXVWCPmVdHE0J46yD+JGihoT83/3M2tXjZqV1nRxs8Vbfz0p
	 0tBEj/FwgnbLT1vAFUtc77WYpz6z2k01XcN3P8Rb42eYp5sWWAMVe9MGUPeuIcmgNCYWm
	 9SG62GJgKuuaR+DWMsrlpaR3IiyK+8CBXhZgYtZZtHKlbnqz08qY57ENeYUr4x9W4Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768372;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=HfHISjpzMYBVFK8WE1t9sONuYzF5gB/6tJYmJRiF+7I=;
	b=s41EqVSYeWBvFsnRisN+abkGEGjmtCFMYQ+BEG+TKz/dhUgVts/kXyJqhgxVdhDIGl0i
	 t66LqlQDjJhCPMYm/oZp3dUYPlvwSZRQqKMpn2o7fHoumCkpLZTgm82CQBff5G78D8oKM
	 DO/QgxMvscT2IUU7nhMZhAMeks1PWzZZ2g1/3013V112scIZ26AVvtQ8E/MlPzsdbELwi
	 4XoBJ6WUZHnDAN2OhVC4FzHn/Me3aoncFn1JZBELtVj1GaOm8fZSvz3hZ9H/X37QxcyMn
	 eXiHJezI8dgINqGtfpZznKG+bq8lx4t9v1lb1NrYQ+X96AQAINIVPm9rpG1gqPptGHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE32606A31C;
	Fri, 27 Nov 2026 08:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1795768350t8040eae2
X-QQ-Originating-IP: 75HLWjuk4Nno8aIqpZG0chT4xEadJNgSr6HyFlW0Z5g=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 16:32:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13343494202343594793
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 27 Nov 2026 16:32:21 +0800
Subject: [PATCH v2] arm64: dts: qcom: sc8280xp: Add missing Iris pixel
 stream ID
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
Message-Id: <20261127-sc8280xp-iris-iommu-v2-1-34692fff579f@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQqDMBBEf0X23JSYVA099T+Kh5isdQsayapYx
 H9vtPcypwcz8zZgjIQM92yDiAsxhSGBumTgOju8UJBPDEqqMpdaCnZGGbmOgiKxoND3s7C21W1
 TVNXNGUjLMWJL6/n6rH/Mc/NGNx1XR6MjnkL8nNolP3r/DUsuUjBZTFGqRvtHtH61Vxd6qPd9/
 wKBpJ3oyAAAAA==
X-Change-ID: 20261030-sc8280xp-iris-iommu-aaf3fb5774c8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dragon@radxa.com, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=sophon@radxa.com;
 h=from:subject:message-id; bh=y11Z0kgyIQp2jPwye+LZpBJTXg4J82IwwMcP+0ER91U=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDNmcDhL7N/xzbNvyYNojgVa7ThW+8xclrjZ0JS0Ir7HUt
 IrgfjCro5SFQYyLQVZMkUUhnmEue2XutadipXowc1iZQIYwcHEKwETuMDMyXFD3cyz0ZP7rNslp
 3om+gM1skw9Vui8X4fqplH/sjc9cBUaGuXXNyZe2XlJJ/bHIL9zfLFhRY4HQqhiTf1uiAzc1sy1
 iAAA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N9XwYzVBzkV5GMPvHgQeyy74wEx47d9ECuwZZhhSj0PS8B5Wn5qAcD0W
	V/3C//phonusEa+rYfYU956qf3981DJRGVkQ8ct8IYkr0hb15BjkC53GZaKCEWsCepk8Ydt
	ddjPsEJ88wtMZVCVxiVdjoxq9TYP3fGE+pYiJlSDOvXjm21qyOCYhhxXTsI+InTWVGuGnIh
	oUiUc2+VCqBOTs1vJnn0iaEnvfxueIL5xDztfjW+xKizSuPu88FXe9zGpnAxzVweZ9bCH7e
	1Oe+9/B3JCC/XCnevKf+qCQXVYmjA13ObpxXQ5gw2RT8vOwySjj8QqYySnVP3GjdS9zU++J
	BAhyVrzp+LV4e/SIah/tqMZoLvqLnsUIWwoABAfHqZWQcNsAoHzoPRBBLWrG6/powHkSMUV
	fUbWiNPK7Ol4T+l8kwaQcal6PZNafFDEALJcg4mkq2mmMWHU7hLBNZgWXGnDHjogAxu2ZWu
	XfPhc0sZzT7sejAKM7dZf+acr9k1P4hqJcDCarPv+xNBEHNS/ob7e1xCPjpV06O6PANIdkG
	A+32kmAjq0A+uouMrCuDwsSNaK/XL6gMJ90ex3gmP7WWZAitZKcEL29pjb1CTMuKjN+H639
	qF9uqm9kU5aVGeWFiUerM+M4W5spp+qSL8MKvuWBR/GYPvextaJ9jjedI7LPIhgkZ33d7xD
	qBqvfQwuCf4hUei/bW2KQLlTnXDurR4Y69HECPdepHrhXZtgG7JEk2RPaqaIh4pFP7slZHU
	Z1bCf4wWdYDybivenEAZhvklgAYduKuEfgN1tb9pjucBAE3wfNLq2NGYsEc0WXuBi8YiSuc
	HX0yM9LTdRQbPoDfNBqaI64PEwf6gcOHdPCObCZjakVgyrQStS78Y8+tVQXyZKePhuwn9HC
	z0OD5+ctrFmYcdgnEbxekcEmvzMYAZngtlb5zko5mo5DCphmOeNfNE0j+d53ZgYecbyIQbQ
	3uZ+4p0q7RqYugTQ6IzOMGfjaiQYHU1L752sTS8BmJkOILg1aL9kgMdEomlqtKWrMDR8nX2
	HgLt0aBlaHNEX0l82mmQtuHy248GUzXVMvcXVauDUqg4/otM+A
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The Iris VPU on SC8280XP uses separate stream IDs for its non-secure
non-pixel and pixel traffic, 0x2a00 and 0x2a07 respectively. This is
the same split as 0x1940/0x1947 on SM8550 and later platforms. Only
0x2a00 is described today.

The Gen1 HFI firmware sends all non-secure traffic through 0x2a00, so
this went unnoticed. The Gen2 HFI firmware puts pixel traffic, such as
writes to decoded picture buffers, on 0x2a07. No SMR matches that
stream, so the SMMU raises an unidentified stream fault, which TZ
treats as fatal and resets the SoC:

  SMMU:>> 0x15000000 NonSec Global Fault: NSGFSR=0x80000002, NSGFAR1=0x0, NSGFAR0=0xcfc03000, NSGFSYNR0=0x2, NSGFSYNR1=0x2a072a07, NSGFSYNR2=0x0, NSCR0=0x280406
  Fatal Error type: TZBSP_ERR_FATAL_SMMU_FAULT

Add the pixel stream ID so both streams are attached to the Iris
device.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v2:
- Explain that 0x2a07 is the non-secure pixel stream and why only the
  Gen2 firmware uses it
- Quote the TZ log of the fault
- Reword the subject
- Rebase on next-20261126
- Link to v1: https://patch.msgid.link/20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 703b4f4e2059..328f64af863a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4266,7 +4266,8 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 					     "video-mem";
 
 			operating-points-v2 = <&iris_opp_table>;
-			iommus = <&apps_smmu 0x2a00 0x400>;
+			iommus = <&apps_smmu 0x2a00 0x400>,
+				 <&apps_smmu 0x2a07 0x400>;
 			memory-region = <&pil_video_mem>;
 
 			status = "disabled";

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261030-sc8280xp-iris-iommu-aaf3fb5774c8

Best regards,
--  
Xilin Wu <sophon@radxa.com>

