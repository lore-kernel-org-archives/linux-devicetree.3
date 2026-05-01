Received: from outbound.pv.icloud.com (pv-2004a-snip4-10.eps.apple.com [57.103.65.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7E33D092D
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650996; cv=none; b=fBPeGHcXjB4/bMxxkOUUZ8cTh45dEydFxtc9Kj1gxzDKB4LX9IBiJayB4QCZOpQdd32H5kEzKPp4cz5K4G1y4BjhtBtA7iVU9vebKDD+BJe+/l0hS2pXhYqkbkdbTJZfhJCCPG51Dwr+P3JJjN3r6PT59LjVqMPqqCFEoWdIjkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650996; c=relaxed/simple;
	bh=YfIRItDn14CNBMZcCOaaF94rc9K0uQaalpnoXSA1g8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bYSQcP87cHCjojQeaDYF3qXg1lhhmrG699ixmWF6DyYMPRKV/dlQUPMfIcfhXgpDjVhdH0fRbeBoTnrmrxbC2chtoXGoos/6j+PH7Gkd2iol9UR4S2bC16JM1FemZGV8MQkpjgXMp70L5jHT+4UZU0lP3pyfDsZbaZG7Irsn9RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=cRz6Y2NZ; arc=none smtp.client-ip=57.103.65.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="cRz6Y2NZ"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-6 (Postfix) with ESMTPS id 232D01800240;
	Fri, 01 May 2026 15:56:31 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXkkOHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCUkCWAJdA0IXTQdUB0YDXVQZWgF3DkYVUQxACFZFXxUHWEcURw4PE0wLRwJaNFYfVBlaAw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1777650993; x=1780242993; bh=ZZtWfVzaHJWKMPy9qGU8l0N1qwLoNuG8Asya+JqQJvA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=cRz6Y2NZhSiTfVBTkhVgvW8sgaaAHQnMlhrZrvXHX3mPmtKxZCcQSSELWN4LrXcCB4XvfQ73wQdAtVrk/pGxeUzhrmKrmGjD3148QR6UHLhX8heUf5sqkhhLXAJ0FChkGDiCDnlTqEZzqFik0P9LIFceQaVIS4RP29RMgZlHUEePyE4rLx/uatmlTXwYEEFDitznImMV7O9rH1vKIpe6v92Wnv4Y+0MLwNdxDKgWPF339axPg6xUPzrzthJV7M0CwKoGxlnG0POBNkUkrqFs0lY+i2CcUulOS1I+6qFpMixkHEaKNv05weq7P/0sQTbQXNIPlN7PSjzN/sKfwqWmOA==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-6 (Postfix) with ESMTPSA id E98011800238;
	Fri, 01 May 2026 15:56:30 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH 0/4] Introduce HONOR MagicBook Art 14 device tree
Date: Fri,  1 May 2026 22:56:08 +0700
Message-ID: <20260501155612.5490-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m9iP05F2jfFm_qhLumZoSpI-ybNyn_1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE1NiBTYWx0ZWRfX1GYF9n+iMLM5
 jwtW5WcFqEAUy+jpzofWIaAACpukYCxJ9BntZfIdPmuQ0dpsHiwJ/w1rT13tDb2ncZf8KhxMhsN
 VR0fLO4qAKf67IWpL7iv+2uBwLZQiM5Tw0HL+pSBmo90zR7DuonoacIz1EPBO/+2NB3j84oN0uj
 0q122omiLCzkR5sflF91TKN1iW3oTro51hU1TtPl9f92Nix7e81UtC3AQRuouMzfE/tlojpLT+x
 5wjqcq6f40Zdt8Iv1JXayEJCJ90qD+HSizFukcn4H+v0oAYlmv20I18UECLArum3OBCPFClez1X
 zWSpcx/2xYRrccNslxU/RxPMUmkyA8d5em6iNSh+b9M+WoAQzN6x6duEfdk0Tc=
X-Proofpoint-ORIG-GUID: m9iP05F2jfFm_qhLumZoSpI-ybNyn_1K
X-Authority-Info-Out: v=2.4 cv=auK/yCZV c=1 sm=1 tr=0 ts=69f4cd31
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=4SG1UvOAAAAA:20 a=NEAV23lmAAAA:8 a=z9go4UkmAAAA:20 a=7tzHwC8QtcCRmX470X4A:9
 a=bA3UWDv6hWIuX7UZL3qL:22


Introduce support for the HONOR MagicBook Art 14 laptop.
This version is based on the initial work by Kirill A. Korinsky [1]
and Valentin Manea [2].

I'm using it with an external display connected to the HDMI port as
a daily driver for quite some time now.

Supported:

- Sound (with alsa-ucm-conf config [5])
  - Speakers
  - Headphone jack
- Bluetooth
- Battery
- HDMI
- Touchpad
- Keyboard (with backlight)
- Touchscreen
- WiFi
- USB-C ports
- USB-A port
- UFS
- H/W accel

Untested:

- Camera
- Fingerprint reader
- Sleep/Suspend

Broken:

- eDP
- DP over USB-C

ACPI dumps are available in aarch64-laptops repo [3].
HWids in dtbloader repo [4].

[1]: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
[2]: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
[3]: https://github.com/aarch64-laptops/build/tree/master/misc/honor-magicbook-art-14/acpi
[4]: https://github.com/TravMurav/dtbloader/blob/main/src/devices/honor_magicbook_art_14.c
[5]: https://github.com/alsa-project/alsa-ucm-conf/pull/755

Konstantin Shabanov (4):
  dt-bindings: vendor-prefixes: Add HONOR
  dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
  arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree
  firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/x1e80100-honor-magicbook-art-14.dts  | 1542 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1548 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts


base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
--
2.53.0
