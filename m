Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342352;
	b=ynEjAeSvVSettB0/POqA8GDcd/Bml/AHB1x4OhVA1JTcVLKHTuamBUMCK22qH62CuOCM
	 zze+nOOo7jeUO/o08+/bZZBx4qT2G8sC3jhiWYVIsqR9hqwSKCzn+iA1igdKpezS9AQQw
	 GvvjVKgS380Gq34XbKNxZkRRf2ocils9igFr5gRnIzBZIuZImpdKGo3xrgG9SZOJtA4Pd
	 UM8rtXoHa1T0TugnsNAUN1I4p6wGVXCJCxdL+70TwwljoT+ByJY1JyZ5sYiP5WXd/Jzgz
	 n0+hrANshDJqhGX0hxxaK+4+W0yKCydoLeqku2wrkdDIaQWeTODOkgLluxF1fb/sPGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RoyEoopnifFOj6tGri7N/w21DgtNJiN2PVsWRCx8KMw=;
	b=2TL6NgObHdFI/ccRXvj3B6T9LOwkZEr11DNFqdz2SjdkBpvsk89AegAiwHPOjC/Xvz1k
	 8yu07VRQ11BQFBrRrx1DtTrHgz4lgbFBWaAuTmEsM/u0IE8u4N3pLps09KDomk3o9FKQP
	 e2ScczLBcTTSQMzC9P1r+qTWJFBgPm0q/ZYM+CdWLIKHfgPY4cVNC8xnY/HNAr2quLJgG
	 rgQPrEu5QePm7fLR3gecGhc4cmXpKHqP/Kx6/IjHReC4+oJbu6Ia5hHxBIW4/xarEV6XO
	 wuyQ2DtVIyW6vSBYSJKcD88GmRG28CJyBYjLN2JstA43PWxz/c3auKOJyj2B77jsygg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOHw70Pw;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD9606A88E
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66DD9606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOHw70Pw
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-85a6c747dc9so1614832a34.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342350; x=1794947150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RoyEoopnifFOj6tGri7N/w21DgtNJiN2PVsWRCx8KMw=;
        b=kOHw70PwAP15j3Lih3uGj+Agkqt6PVJupz/DSiNlxtGHbcyMwz6ohmZzL1xhKFAUdc
         q+hTYB6agrxlHVwWiKgq29QdFZH2GTVKpOspnwfAeW1ASXEKw8eKHdoEWGCAKWK4FLQN
         khxvT0O52f072MND6mEAqIigRYy49pCaqnMKdwCM549pEanbWsE3WSH5e1sdIixSIbfY
         ywRB/itephbCvt7FlqFXU3nI8z+C0odRGWDAIvJXVOqYlH0yZeV9/98b7IOs7j9A/bdr
         pjqKA7vhcnlybYDrhVCWWsX16Ga0JV2YcOsxyNLvdioUfJzo1hg0pVdpFTxQUX61X8c+
         pVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342350; x=1794947150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoyEoopnifFOj6tGri7N/w21DgtNJiN2PVsWRCx8KMw=;
        b=S3IJDxNzswZbjoZ3R6pOaGgclIvwW5AD/Kn+B1C9LKks6FqLrJslPLEDq6jFvZBhq0
         qKgvOOOWwqd4+SjJQmEzMkyKJeOe/DLmXujit0YpVXf6NYqUWcB3vdXIj6S9G0v91Afd
         u8v2pbjlPUApP5G9I5j+ZLDa7fFBMAcfXWVMw8E96YxTh3j2TES1nphGx3R2O3ytHh6u
         hjudcuH4ADQwNbMz3DXw2XGL2JV2+5omYmJ1Ju69eqDgZy+JlCWpI7xEcrVIQSD0dYHv
         9IaG69WjFZ32ab+Hjk0MHo3IE4yCWOWiTbyb2IPOMKgHjYndhFuWZP2XJ2ev8HrPUDw1
         +NBA==
X-Forwarded-Encrypted: i=1; AL+hErF4SyORwBp+PJg/6tgDbkjdJiQCD3JfFsZTZIVLA/FwKg6QcA33F9KJStFnfKGnYXFSmA9rNBoYbMn9@vger.kernel.org
X-Gm-Message-State: APuU4Z87TKDk1JjDBbWRo7+fEJqN1TXdNuPrT+4zA3sQSRzn55LKQsfM
	pRoWV7Hcn5cspPsaHmF5c8dpBq4oxcCYPuI/HUTioF9WfjfPqqmxrBgy
X-Gm-Gg: AYBFou0xy+YjFvIJZfTkiBMmH2gU6lVC5DfQgaqJMFLjjG/Z21rBFCPTxhxrtwSN3E3
	SP0NUzlq+RkiD//0E1AjpOxC0gqugXizmMtZ7hkqZf0t6azZamGyW34QVSRl3y42hYBb5hX7is6
	aO6ouePaTCa1QIbtIHJoKF1v5BOVjDuRg6aGhlG8XnrN1m3IXDXcMPUbHN1airxlVBwQ/qthUPS
	grEZlVO411b15sgLS2fEWJ1qVV4b/droJhtxqaz8rJoz+kUyg5y3PKAy3IuywF8kxDgteE3aTdT
	GflO0d9+eTIB5c+YAP7V1CmDgBsEBEzPa+EkkmCJ03V62iog3wGcGiVFjiHpk257+oVRi0wFOv/
	qS+t5eJ4FgarTwshV3PQQwRinWpStu4BSCFNpYI+jcLGS+KgwgPa7Yeuw1in8PE3Nvln6nMB4FC
	7u66eHvQyL26eTMqFNZ02WnRvAH6wxaSiPHeHgkL6WAs50k8zIdvBwcjCaJt3iOn4CVVNENKkgr
	hFt6kPqiCxjiQPFfHd9mV66fpK8fuZtouT96w8o2411kZ5W/8KbXmeV/mrmd6L15+RKjza05YUb
	ldlxg40Lxm1ZQ+R8vyq9U08bSCjzpl8ULlA6soV0APK1mojCDQG/6lMTTSvBDeEd9Imr/n8SDRw
	=
X-Received: by 2002:a05:6820:f00b:b0:712:b60d:2ed1 with SMTP id 006d021491bc7-71917857699mr90043eaf.10.1794342350259;
        Tue, 10 Nov 2026 12:25:50 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f645d4sm2353252eaf.5.2026.11.10.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:25:49 -0800 (PST)
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
Subject: [PATCH v4 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Tue, 10 Nov 2026 14:24:43 -0600
Message-ID: <20261110202445.14100-1-jeff.roach0@gmail.com>
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

v4 is rebased on qcom for-next, which now has the common Glymur/Mahua
regulator settings. Tested with Ubuntu's 7.3-based linux-qcom-x1e
kernel. Everything listed in patch 2 works there, including suspend
(s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v6 [1] (tested with v5). Without it the stream
  runs at half rate and the monitor shows no picture. With it, about 1 in
  4 plug-ins still gives no picture; replugging fixes it.
- The GPU is disabled. It works with "drm/msm: Mahua GPU support" [2]
  applied; I'll send a follow-up to enable it once that lands.
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.

This series was written with the help of an AI coding assistant
(Claude): the device tree started from glymur-hp-elitebook-x-g2q.dts and
the laptop's ACPI tables. I went through the regulators against the
ACPI power votes for v3. I reviewed it and tested it on the laptop.

Earlier bring-up report: [3]

Changes in v4:
- Rebase on qcom for-next: drop the PMIC includes, &apps_rsc, &tcsr,
  the SMB2370 repeaters and the phy supplies that mahua.dtsi and
  glymur-cob.dtsi now provide, and use the new regulator labels
- vreg_l2f0 is now 944 mV from the common file (was 936 mV); tested
- Keep refgen-supply = <&vreg_l1c1> on usb_2_qmpphy, which matches the
  ACPI power votes on this laptop
- Move the pcie4 endpoint under &pcie4_port0, since glymur.dtsi no
  longer has pcie4_port0_ep
- Link to v3: https://lore.kernel.org/r/20261028191800.27829-1-jeff.roach0@gmail.com

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
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 657 ++++++++++++++++++
 3 files changed, 659 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: 14825c9204bad7f4e0bd3a528cbf4a7e24e757d0
-- 
2.55.0

