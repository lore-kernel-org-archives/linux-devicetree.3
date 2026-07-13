Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D14B3E7BA9
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938377; cv=none; b=fwqi5HY5a8ohT9jdOWs8cku9ExJ8zGnrGKdnzSLMGqaQ7mnjFuCsoHv21VN4pHUxI9SXc8G7AcbK5bXE4xgmP6N3L3OB9+7Bxam3hCyg0UJ58OR+hnf1qgxoaA/76aKWzbfM8YimwNHFMtEL5G/jTrxEVe3NIlgd111UITXabs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938377; c=relaxed/simple;
	bh=QnHhl2+ObujLedzMKhxPMg2g3QqycowdwM1ogFg7MiM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bJaJcTlvevmYfCYZpghzJPccExjHUVSJY1ZIX3n2lhGxUEGSUjxhyEMUZiNFUJBvbz8PZZ/MBiis8E0rjFzdTByYDtgS5qQzaDmtLkt8QppNmw1WcjXVdZ+Zh40LCuwgZpICUgDZr0rRH/DZLiu1C4OA8AgfQu+ZD4eLMntLfA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTvVG+u4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZD9K6A6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTvVG+u4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZD9K6A6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9M0ia1090376
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vig6jlHsHMAwQCaPPXnXQE
	Ln/O+A5Dm0Q6KI4DyTuck=; b=aTvVG+u48HzYrz/Fjqer3VogI6VikWRwVTJb02
	yZpVWewzwoz3q83S4MbmpElnctoA4q/xWLfhzgLmq+ZGB7KdsczqBYyaVHihyzTI
	D1e6zSvuaJxr/KTQAm6GdkbjpqH8Ks/lotropQcqHiFe9WnlB9nAr3nZ2LBjXbIa
	Eoh5KdH2IUPZg4euUiFYv5kmOOozXxTW+yVddyQtGBvuwesGnH+W/zP/xgiY+EuP
	UAcCQQPqYberpZU5SCGhCroydYn1UxfbukMYcl1EMTYrC8F4mNu1LnAg5jM4+RnD
	hUrGhsz3lxst0zxvRGlEF5rLMJNFlhcU2DDJ3+/6XichgnVQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavr7rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88da04b719so2910503a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938375; x=1784543175; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vig6jlHsHMAwQCaPPXnXQELn/O+A5Dm0Q6KI4DyTuck=;
        b=hZD9K6A6T75loq4/LRlfxG8K5zno80hqq+ej/oSNTVn8tFB3tQJF35LVV3pi3nOyCy
         gcfBQ2tiliPfdz5iYXIFFCE/ziY7R4Nr31eZnAZ6EEeURvRIB0hqkAMLuX4k9E4iOLa1
         z1dDqsN5Hf+PU+lewzD/Gsl7FjGnBvIivKg57wArRwJnMV0G328RjQ3328+VTXRRkIbf
         TlxbJPkofGCWY1OQrHJ34gxBSgw3OUkVgkY9+Abn8mp7tLkz3Bq66K8y6foL00ZwwNed
         4tLeWpUufRytG+2NQ3cy3PTWvUdow1EYp5/15up+IgsgkpaVzj+CWkqob1IUTiiIAS8v
         5nSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938375; x=1784543175;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vig6jlHsHMAwQCaPPXnXQELn/O+A5Dm0Q6KI4DyTuck=;
        b=ZpjekEKY8XWh/T1r2Endv9u4eFOLmrjFvpuFvkRzqllpkgusU7+5ck9NAPLujK1T9+
         5DMDeZr7W63+7YE5XsOn3TQ6nduBvwkY2zBqs7W6orVCxwwG0/qxOV98Jo7TQpzrfB9K
         nevCTvbeEq+CPeg/7681J/B8I3ZCXiQkrVhZenSOoru8kUdanX2/6Jlp5Qd7U0vkHjv2
         tg1Jp4FzfI2JiUucpAzKVagN+mNoaRD10fHFlN3NlqgGWNRTC0BimW/Qv7M/tNFY8ZPf
         ALXDnid1B7hYRgaP2u3pR2ES7EyhrwhDBF6hIUY48aKDoiadXf2kxzFkHs4l1LElmL64
         Nr0g==
X-Forwarded-Encrypted: i=1; AHgh+RokmNsj7yBZ/eGXF3tbOyOsovapoORTbzFcUMey+l7dk0lsjVYR/vnTRZofEZRXeUmtlapfqnoTqFqG@vger.kernel.org
X-Gm-Message-State: AOJu0YzBS34vLEG1Bx8M0bCFtCGSjgiLqdLxvHMOjCttvrDvj3hAZlIK
	9ZIXFx93UXDxWdhpu4j8NZjqwED0Pc78X5ViGwjMfj4kr+g2JySJiEI8ato5qnlfh6pZXHisJdA
	XR2bDNVadrMyCs03iZ+le9AYzNy/KC1KNcnqxiJGzx7Dl4jFhgNqk52l+DJ0H5J3w
X-Gm-Gg: AfdE7cnJ3Jgq9jUEd292tA7fwF9StGbGzfLYXHCu1SpBO8xx8uN5T8vUi2xlWYp4Aw4
	4AkAS6CcsutGEaTPPU0n94nlNrZ8y7tCPoRl8/A1eoaChJqkCvxpjlqfUsL0ir+T/WZpNh+sejp
	wunbChTgYOxVPZ++o4cxl4wZw1wQOUTmz+fO2MzlcP75EpvdSuDuViuIg2Per2iRUIe7rn13DHw
	bVOACB6UNdH/wRUgqygYkfTpmgJjX1lPO9JnZHYKSYlA7zO79hVKbP0T0xYEtkm9LKvxEXB1MmK
	2LO3b7whq8/Pl85aoi/cSgGk0u/dWf7GOKzMRchwJltcuypsGNgXT62fTq8ewqEt6oBNQv/jzct
	K+2IcfvM/LNkubHhj2uPI8VlkjrtbQGbXP8SPFA==
X-Received: by 2002:a05:6a21:700b:b0:39c:235:c5ec with SMTP id adf61e73a8af0-3c110a0fb58mr9762222637.34.1783938375086;
        Mon, 13 Jul 2026 03:26:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:700b:b0:39c:235:c5ec with SMTP id adf61e73a8af0-3c110a0fb58mr9762196637.34.1783938374548;
        Mon, 13 Jul 2026 03:26:14 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm48465704eec.8.2026.07.13.03.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:13 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v3 0/4] arm64: qcom: dts: Add display support for Qualcomm
 Shikra
Date: Mon, 13 Jul 2026 15:56:05 +0530
Message-Id: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD29VGoC/22OQQ6CMBBFr2K6tqQtbRFX3sO4KLRIVah2oNEQ7
 m4LMW7YTPIzb96fCYHx1gA67ibkTbBgXR9Dvt+hulX91WCrY0aMMEkkkxhae/cK6wGve8AHTVl
 RmVJQLVC8e3rT2PfiPF/WDGN1M/WQRIloLQzOf5bSQBP38xcb/kAxwZyXikemyDU5OYDsNapH7
 bouiwOlmsD+ooJsPRpYFAnZ1JpKURrFN0TzPH8BkSVANRQBAAA=
X-Change-ID: 20260626-shikra-dt-changes-8d127be951d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938370; l=3341;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=QnHhl2+ObujLedzMKhxPMg2g3QqycowdwM1ogFg7MiM=;
 b=1Yfun62PqPkuYsztT2gQtEwVqrrNsl/zg0aCfJ6KwmbEmL9+FYHaNXCqxe9E7SA146jJnUrGf
 RxkVdOnBw2rBvCXb8ooT075p3Uvp3G1kUMRzOGqwr9GHF05BwOVV8YN
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: VpxuQsua1ZjD3YYRn6Ykjb4ea5T6_uSz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX9YOPS8FsHXHS
 JYkS25cC+zd4j1kllGPDVACBgzKgRc8Qz5fNV5GLNYdVxmcU/Yq1ynVVBlEZfN8qZRF9dMRfgcA
 gWIocoaZ443imPwmMbel87/RlKW7n648j5psStg4RdrdWmEE3ckyzARgATnrb8FUpcV3ap7fyiR
 j+pAQoN612k6+io3uOHyF3bQkVrSy5gZ9nVgauLxPlhXqLKtFffOq6yHQFACuIjQB+mFMKIwonY
 l3HFpFuCkZRIMEefaJ+8emw2fh6Q2f+6zHXWSi8ppTCaFmjheykPGxAjcaCN2gnOKk8sRg8JazR
 fkuLLipZJFgKfxeO4MY1GIiikG9mB81vrNmj7ASotv1+tigr+FOs3KL01cxlV7NyZLRj4VVXZ/f
 712nUaZCyi7qouGraAPBB/xox6mGujr6gCMOpjEZTqvWmYozRLPX4SW6oh8fY77rqEdB5Ck8+yL
 GtwjCfd49NRiLiPATJQ==
X-Proofpoint-ORIG-GUID: VpxuQsua1ZjD3YYRn6Ykjb4ea5T6_uSz
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54bd47 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8
 a=hOcAhXLu4TPP6eDJ8ssA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXw6YN7fMTOpUT
 OB6fYRheF8H2F2+1Bm2oMFLTJ1HlxaHEud4O6Dt7rAD4m3LvRUL1qFTgRbsY6AuOkWOGclNulfa
 /CE+NnQgRKAihPqtG3K3FhDWfo4gAmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

This series adds display support for the Qualcomm Shikra platform.

It introduces the Qualcomm Shikra MDSS display subsystem support
at the SoC level, and enables display on the Qualcomm Shikra CQS
EVK and CQM EVK boards with the required DSI panel nodes.

---
Changes in v3:
- Drop redundant vph_pwr fixed-regulator node (Krzysztof Kozlowski) 
- Remove vin-supply = <&vph_pwr> from lcd_bias node (Krzysztof
  Kozlowski).
- Add the new line between the last property and the following  
  subnodes in mdss block(Konrad).
- Link to v2: https://patch.msgid.link/20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com

Changes in v2:
- Replace QCM2290-specific RPM power domain identifiers with generic
  RPMPD_VDDCX/VDDMX macros in Shikra display and DSI nodes.
- Add missing blank line before status = "okay" in &mdss_dsi0 node(Dmitry).
- Split avdd-supply and avee-supply into separate regulators vreg_disp_p
  and vreg_disp_n instead of sharing the same lcd_bias regulator(Dmitry).
- Sort tlmm pin state entries by pin number: gpio3, gpio86, gpio91,
  gpio151 (Dmitry).
- Add vph_pwr as an always-on fixed regulator representing the main
  board power supply, used as vin-supply for lcd_bias.
- Droped the 5th patch "Shikra LT9611UXD support". NAK by Dmitry. Once
  the hdmi-dsi driver is fixed then we will post DT changes.
- Link to v1: https://patch.msgid.link/20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com

prerequisite-message-id: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
prerequisite-message-id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
prerequisite-message-id: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
prerequisite-message-id: <20260508134009.4582-1-syyang@lontium.com>
prerequisite-message-id: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: arpit.saini@oss.qualcomm.com

---
Arpit Saini (3):
      arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
      arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
      arm64: defconfig: Enable ILI7807S DSI panel driver

Nabige Aala (1):
      arm64: dts: qcom: shikra: Add MDSS display subsystem

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 206 +++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                |   1 +
 4 files changed, 441 insertions(+), 2 deletions(-)
---
base-commit: f28fb4ff0d25819c58341fec6e3953f1ebb1fc2e
change-id: 20260626-shikra-dt-changes-8d127be951d5

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

