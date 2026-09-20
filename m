Received: from v54.v54282eed.euw1.send.eu.mailgun.net (v54.v54282eed.euw1.send.eu.mailgun.net [185.250.239.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E04144684C
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.250.239.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912407; cv=none; b=BeaJ3E8CrIKPo1be9kpT3Um0OST98ZeiiEWwMRSm0oEB8gwlj3qJUIDGfs9OWuHnxABHlmHSzQUXITcrNV3wuLUAkgQlmBule+yZuOOGamYTtSHoCO2Mp40UJO19D/AJ5VAefmEQCbhkg7XwRcg7L+0GPJQjV9791bZ4UWbXdr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912407; c=relaxed/simple;
	bh=OkXPpOSSXY0FXOzDjAh9QlD/ry9K1Ip04/+5M4CeGUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rd/OomYFIMIOsm0A2YU4dFfrrwDR/ak7XgkVRSjVKJkkoXoNU+gmOs1D0AJvFZgtUEFPNmGcrQ0kNcMK3ea5MoFcNmgpGHN2jXass4Ci+Z88jfeE4jMCADPuDw5e2GZxdW2p0UL+02PSdm+mG9QPRsATLIB9JU6Zf19m+ewCv6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu; spf=pass smtp.mailfrom=plajta.eu; dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b=qozxdo15; arc=none smtp.client-ip=185.250.239.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plajta.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plajta.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plajta.eu header.i=@plajta.eu header.b="qozxdo15"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=plajta.eu; q=dns/txt; s=s1; t=1789912401; x=1789919601;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=+RBK0WTbSCNGeEF3NaooYJdGJAeK6PcHmlL0cOsfNeI=;
 b=qozxdo15ZXLFrNm8zSPalgwjsXudheyeQuh9n+GHDSNgTsUbONYB1GwyV5Kgto/GRO212/gM8tOtACKzuzLiNP95knvca9xqIswja1NzIKQl+rD46OHD+zGRLXDeA55M/FDhQDpmkf3XTq4wV1ECLnpjXD1Do8VovXHC7kHLlCJxrQRaF/uwzdz2E0qVbf8S+ml31BD4Fdnw1cR527jCwo+ICoqQcArjlWLfJr6XkUlsBQ4kOxdj4I8M1bB1afNv9npL8vdw999rnpuMQZTuQanAEoLZDyiuYxKy/tnJoul7kvmJmdA2A0uwK+kCIVBp7OTyHhgG5iZ1Ywqg4r50uA==
X-Mailgun-Sid: WyIxMzMzOSIsImRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnIiwiYTkyNGIiXQ==
Received: from tensor.lan (ip-86-49-238-222.bb.vodafone.cz [86.49.238.222]) by
 62dde763711f91b09babc141eb112fb8433c3bdf14f6a1f222f9cb9a27a17a83 with SMTP id
 6aafe5513fa6daf3e872dfeb (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 20 Sep 2026 13:53:21 GMT
X-Mailgun-Sending-Ip: 185.250.239.4
Sender: andrijsalivon@plajta.eu
From: Andrii Salivon <andrijsalivon@plajta.eu>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrii Salivon <andrijsalivon@plajta.eu>
Subject: [PATCH 0/2] Add support for Amazon Kindle 4 (Yoshi)
Date: Sun, 20 Sep 2026 15:53:12 +0200
Message-ID: <20260920135314.3191171-1-andrijsalivon@plajta.eu>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the device tree binding and initial board support
for the i.MX50 based Amazon Kindle 4.

Andrii Salivon (2):
  dt-bindings: arm: fsl: add Amazon Kindle 4 (Yoshi)
  ARM: dts: imx50: add support for Amazon Kindle 4 (Yoshi)

 .../devicetree/bindings/arm/fsl.yaml          |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile            |  3 +-
 .../boot/dts/nxp/imx/imx50-amazon-yoshi.dts   | 60 +++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts

-- 
2.55.0
