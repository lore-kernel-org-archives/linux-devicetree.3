Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215130;
	b=3oHABAt4Y8Qh2ZEVwvOy/q6B2CPdyfMPJmWNhcTx14uteZFvNpAV8BThVYBbIORaG/lL
	 sGhZvlWkJ/wtr0xpQv7mf6h6NDpoFEzE8BysGHlAiYRfo4CEDaqxp5Qsyj2erN/Y61QoG
	 UMk9q/dYekPTbRjnv+vDq0wLaKP+YnjbVcLT9KCs9/TcWtlHVC07ShigxtQyeJCaQj7X+
	 GUiwlzTbEIH4bcBbD2foID13cUsTD33knMfkcOL87rdCLyEbqLZUmNRVefB2/rwuQn5VH
	 5sJRzEcYItlVpMtEYe1rNVNd42TquksyIFwRKwvVnlYN92QxIFsaWl0bGqtYggWFaSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O1G5M1f9Y/OD8XK4DhamsKx4jsdaVOstj5LTRN/WC9Q=;
	b=4cQxh1SitSC2g6KtiOO62egWfD4zT5ijfjG4T7UswZMoUqBlPnfG4IbP2PsSKyhMiLc/
	 HLWglEeTFm7nbCyjBEB2mCeZn9bSoO2XjEU9kFYRoeutpIX2UuXD+ENgVAUYx2cK6ocFM
	 Df0EZ5pc+VJ0CipwC9OD9sPXjQX6CvDVa+9miMYpA2Y+/0/2G4i1NQ21AT7QriKbS3H8A
	 WxZSFEdgrD2z7r2dK9PcTiiC1NPsVlmk1K4WYhBlMiOOvnR7sdKYSCjKmkO+5Xej8MhY1
	 rTRB7oK+uR1hWfyHU3SusohaHi8vTJxOoGHqGXnnESBNMd+LMg9hAvY7DXGh4CcEm+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poYg7JtD;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28536606A321
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 19:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28536606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poYg7JtD
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-43bf9548df4so1148575fac.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793215129; x=1793819929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O1G5M1f9Y/OD8XK4DhamsKx4jsdaVOstj5LTRN/WC9Q=;
        b=poYg7JtDStt715lgpaSNPRhqcRR/NCASHkbcxI2Vh3WH2m/+ObY04VAI5Z4kMq00Xf
         aOwkqLh2V8bQ5JwX/uKoAmPenhlTKmqwzs+xLW3WJlma2HME4vwPyG1bFOa+HmC9Lk1X
         ronkRHLgtqngw5ofLvaduIOv2lH/58Ljm7LV+eGbqq5z5j9WjZYutZ4atQiahIllJSSz
         ZH+FdBpfgetva2PC/KgR5P5L+X7/dW/Td8nbwT9jP9VlVyZps4ePAwX9ksPgpBJMz4od
         8lXmG5M8XBXTzFPMleYn2OrdsIeq/ipbW8fmobG44F0scnJsrxuAHRJcuPDTPtB/caT8
         SDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215129; x=1793819929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1G5M1f9Y/OD8XK4DhamsKx4jsdaVOstj5LTRN/WC9Q=;
        b=nws2NKUUkq1MnfiB0OCrjEHwVS1mMKKLp/aVmv44mqUQwI0Fb4rs0okCSla3wdH7XZ
         75de0CGt4t8JMPTABbhgQ341dHh6Co3JP2Yj+K1fRS3xNM3e+L6SeYE6PqVxFVgrAa85
         lfC6g3UOnov/kvilkhRYfRs3uWxKGA2dXCZAKsN9HgG503xGThe1jDR8hQjVFHT9hLTd
         xJOk2jpTSh5uJzC3h25ojvCDa+MuB8xN2jiRpNpdcsYvOnFPla6RyOS4ZXyhHHPdGBXv
         dxWEKBJZeQzdEk2k50cb41FseONzmYjoabpBslpjUcytju3RgGPb6CAluwte0uyWyaZR
         UCgg==
X-Forwarded-Encrypted: i=1; AKwUvBxbnlC+iP0snpDx4e+eDDgs7+fjgBjiNboVuhHHegRFq7mp2LQswuhLGbefR/63G7+eyzj2FjfinwcG@vger.kernel.org
X-Gm-Message-State: AFq9FYIQw92hWCe2W5RMpjnQoCooC8dKO4EBesHZTkbrN8NXGz5I1GfW
	fzdYfrTMUUqYDyGOaXolk2/+vQnnd8tTKnrYL9Haq/XsG/1SHw93+cjf
X-Gm-Gg: AYBFou17UuY+aTrcb+w1P6+WkoZ8bv8bcDIi0IQ1JsSTdLKb6xev+50CpwzaqohkGpf
	TrQWZun2A7aVu7lfyajshQqYuDDpPSWgzxQw+pokbNZgVVLlkiUryb6cpjcu3171l/CAW583esB
	5D5xAK1ndam4D5atYKvzeoTELgTD7F1+pUBx6jfweTnl5l7HVQMsyAGKk839u6Bl6Ls8r5XHvVa
	bawm/MkLlCwRdTnzSHMQJwnxxAiXeOuWPGYYVAyTu2dRMMGWcIMEwJAXmO3UEcc/OyAT/gF+5d+
	l4GL6YOMZWDOtvZFVEUPp9I7OmvH5Lmm98ndsmQix/pJTgMtF9mAz4l5s9XM5fF9iZdtE9CdZ8k
	1ghRWJFBqWosPBAb4ooz9I103rvO1dPnswsIdxOy/dzbvM1eG6hZU0vGgIBnpP6ntEQyi8NNDaT
	qtLFWVFTSv4nmYzBSJc3ym5Ey2PAoVkcSOTdJ3oDdhnQ0VUzo7NQekMdeuiCInt20tixQUEqrOi
	90oAUxhRw6PzaVfpUD3C50o53RPTBlko+WnSRjd/zoRJLRr4raPwMaYoMMTaZSzcFOJjAm5h7Da
	GiDr6Fe/h/ombGqS+BoEoWoDjTsgvQ9WgmM17T1xTafCqjgpHka7i9+Uvg==
X-Received: by 2002:a05:6870:569e:b0:49d:cac9:28ca with SMTP id 586e51a60fabf-4a8bb21d55fmr2619589fac.2.1793215128834;
        Wed, 28 Oct 2026 12:18:48 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:f26:718f:8dc1:b185])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b785d108sm3092916fac.9.2026.10.28.12.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:18:48 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Wed, 28 Oct 2026 14:17:58 -0500
Message-ID: <20261028191800.27829-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a device tree for the HP OmniBook X 16-cp1 (board 8F46), a 16"
laptop with the 12-core Snapdragon X2 Elite (Mahua).

Tested with Ubuntu's 7.3-based linux-qcom-x1e kernel. Everything listed
in patch 2 works there, including suspend (s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v6 [1] (tested with v5). Without it the stream
  runs at half rate and the monitor shows no picture. With it, about 1 in
  4 plug-ins still gives no picture; replugging fixes it.
- The GPU is disabled. It works with "drm/msm: Mahua GPU support" [2]
  applied; I'll send a follow-up to enable it once that lands.
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.
- I hit one hard lockup while plugging USB-C devices during testing and
  could not reproduce it in later plug/unplug cycles.

This series was written with the help of an AI coding assistant
(Claude): the device tree started from glymur-hp-elitebook-x-g2q.dts and
the laptop's ACPI tables. I went through the regulators against the
ACPI power votes for v3. I reviewed it and tested it on the laptop.

Earlier bring-up report: [3]

Changes in v3:
- Set vreg_l1f_e1 to 904 mV (was 880 mV, copied from the EliteBook) to
  match the ACPI power votes on this laptop, rename it to
  vreg_l1f_e1_0p9 (Konrad)
- Add Acked-by to patch 1 (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20261026154001.9323-1-jeff.roach0@gmail.com

Changes in v2:
- Add static data-lanes to usb_2_qmpphy so the PHY uses USB3-only mode
  (reported by Sashiko)
- Drop the Assisted-by tag, describe the tool use in the changelog
  instead (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20261024044650.9936-1-jeff.roach0@gmail.com

[1] https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 855 ++++++++++++++++++
 3 files changed, 857 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.55.0

