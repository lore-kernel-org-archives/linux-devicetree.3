Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400095;
	b=BABp7QRNCV9+vGu13uFCNzXIbJaPz8BerFNVQJNcU6KS5JlAMcTQzUkL/U/TML5EPPyY
	 EypphLxbBzbEAFLhyrEi/TT3LhTfYuA5hzNo70ylIMT4UJud7kFixZtpWMDLAmfD6JdRL
	 0uVrxnPpGp/PdmpOWOJPgCsFKZBA+wWxO5aJLLWb9TStw6pDO1xLSmaWw0CRv9HtD9CpT
	 Qr+QpdujbaYzSg4MJwZPwQI6MuuemZ0QP/uCjbN3X/lDH+xnOG/YKypGUwaU+syi6VVak
	 H41SBOc/vyI5aOGSPjn+N455FfrH7OJ5p+7bNwpEmiW+KSckcayjtk+wBJ4uGDz0Z4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400095;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5E6sgeg0LYrcTFywVWbADXySmsuGpioelAibcxQDN8Y=;
	b=3hibZ+WiWJ/HyUM/Eeb/n139L2WEsn6jjEb7cNoqrw+h+tCmyiSVg+WEt9CZH5Ssohoy
	 9ylht4eL4rDjaVHrD7lMVpN6EKJ1TCnawthM6imfJubbczMokWkHRplCD7Ecxr8OYhz99
	 A28gC5bRBTyZeDgcrSK8xQv88v+sjkwx/BMKt5rYFM6ySMNYZryAEB6NHvu7co/yinvVZ
	 TD3zolrpBE9HfBsYbRPvKE/lRVgJ2iSUFtO4gqU7+RlWQBfOtHzdEYY5IOz3RdJu4mROx
	 dauB+2G0C1G1chLh7hyyAOw7S2sDgSBFU0B7QeyZnAa3pCYWLwZDYQz9Ez1p0E4uIAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Wm8PwYtY;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A0D606A321;
	Fri, 30 Oct 2026 22:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16A0D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Wm8PwYtY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793400092; x=1793659292;
	bh=5E6sgeg0LYrcTFywVWbADXySmsuGpioelAibcxQDN8Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Wm8PwYtYmdbDLzNGjZaFF+D//OoSbNBCIIN4UzudkyBATyQGSVq+gJNuc0KlJ/vrl
	 OK02SdsEG8iWe8VM4/LGnZRb2gReVeQ1tRb8gLP8uInqBtk8vVM2deGRBYzCh19Y9N
	 za2KzCswpCavEV8OC6401sTVJlVcaeMrMeMweYIUH1H8uBiOG8bQD9i/exmSCFNGsn
	 msB4MmheFbQBrCAzooGKKzjZPKct2Pb5hWqOwRMsSlKuyBZ/r7HO8G0c2hEo3IUDuO
	 iQGAFXmdXPk+vpjJdluoESoGkGUGAiu0GgEWrgJrG59+5DR6IPC6cGqNTpE+cIpVgl
	 5mOS3NMahoDXg==
Date: Fri, 30 Oct 2026 22:41:25 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Enable some more hardware on the Nothing Phone (3a)
Message-ID: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 8d038dbd0fb169e041546a6cde86b32c54ffbf52
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series enables UFS, Bluetooth, Wi-Fi, IPA, and the display panel
for the Nothing Phone (3a).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Drop output-low from pinctrl states
- Allign the '<'s in uart11 pinctrl-1
- Move gsi-loader & memory-region to SoC IPA node
- Link to v1: https://patch.msgid.link/20261029-asteroids-dts-updates-v1-0-=
79351337d681@pm.me

---
Alexander Koskovich (6):
      arm64: dts: qcom: milos: consolidate IPA properties
      arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
      arm64: dts: qcom: milos-nothing-asteroids: Enable Bluetooth
      arm64: dts: qcom: milos-nothing-asteroids: Enable WiFi
      arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
      arm64: dts: qcom: milos-nothing-asteroids: Enable panel

 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   3 -
 .../boot/dts/qcom/milos-nothing-asteroids.dts      | 309 +++++++++++++++++=
++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |   3 +
 3 files changed, 312 insertions(+), 3 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t master
change-id: 20261029-asteroids-dts-updates-ce3d00b4f844

Best regards,
-- =20
Alexander Koskovich <akoskovich@pm.me>


