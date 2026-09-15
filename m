Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5F633C1AD
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435883; cv=none; b=qZJmUCXwYyVjSOqVKS1yIt3RdbkFaFrZzyblWXxgCJHoZFNPIt+xZE0gXBRolfKBmmYn3VHW8FErfMpfQ7HquCDQUWWeFApEFdzH8O57DtBU1tlKnskaUcNaYoSvHpAnXz767Vw2+yRsiA/FKPGFK8iZwBXhd6j9CkMRvDGqsXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435883; c=relaxed/simple;
	bh=v9lj7OyVmy8NQnxBmV0n5wJr8WwGHjPSO9DJ9cVLyk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocXnVWIFbjaRkiiTvrm1jVBiCIJgvk9WwxUJfxqB0UrA2vMJnFQfphSrBTMJQWSYm0CI9a7bDUoMH/eTsZB4Uytw0VpLLTD5eNCEamFfAIG5OmiJKSr+nDU3sKjWqcRmr5U+HTKkDDjV3u3MYeUGgqXObuAe6miodQhscMK8KwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kx4CquQB; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kx4CquQB"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so2049664a12.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435881; x=1790040681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkjxOhGzqU+8W6VS3//UzMLrdiDuidVOSy9K9CHCyjw=;
        b=kx4CquQBqUCKghpOmpcJ/YwS1rtuDZBk26RkOlmLXgM5VQC5M++DNvmUparbz06v3u
         jDHtT4ot7Dka5yUX6HJKWKCx1BnMLNKdATEMT8sskC62GkcHb22lvj610t26+X6f/F04
         9sAhT8amsYtqwwsXjZXq8XMnzA4LqfBB4l+sOCfEreyyqrWA7Spe69+Vba1QsA6n8VST
         VVlR/+ppiLLnwzZJYxtqM6WrZoWHABalKo0sOiZ77YxFf+4Q3u0aROs+eZa7ZaLh6uBx
         LQVTYvaBIar5u1nUkAF/yKpIfgjU64Cu5Ce04sLH89nNNYSqlHjv2BqGiuyX8HANVwL4
         NSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435881; x=1790040681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkjxOhGzqU+8W6VS3//UzMLrdiDuidVOSy9K9CHCyjw=;
        b=aj0k81F7ATz3YT6ZTn5UANwkG1xIPH7DJ5nU+WZtADxstcfgL8NVcRoCSwhtdGngJq
         QROA78G+Fr6p1WfXXah8L3m0qR9/VqyOCgrzWvDJhraCkxaRCrGhGZC4EE/tVXN8PERA
         /2bXS6cSPA5O/Ountfs8i9l90WhqZAzdxcqCrFV7kchuPIDhwniNoj4XtljGeyv0DY4H
         HE1vMdpaOH0LC9KdSiRAznKKsxLaar3xa/vV52+/sy4R15q2BHSxoXL6apEdHYvsGO1T
         hcUbWzTvElNJpzUMo6XGJimoqxSxR/TrnnVl4olym5T9nppiz1RSdQ05SS7XvSbQ+EPW
         0XDg==
X-Forwarded-Encrypted: i=1; AKwUvByy3mUZEEM/YsYVgB/cXorGB7Ex7ARqkVfW4f9ON9c6JI49VaE43GBinGngbS48uBkeLMt0ncQktzdw@vger.kernel.org
X-Gm-Message-State: AFuF++mpAkZTO9ySLtaeSs3JMmsD8notZjbstgg/4Fx7+Vt7pXbqpTkw
	jAcUaByfJOjco5y53RcFSn+eNS8ElX37GGMV282fVu2LZjZUf+RCZ5rm
X-Gm-Gg: AYBFou09B5yexmx5DfgXzLWv9QReuR1aSoXibP0j8gGGq5eCGOvCo8gpkntLngCMtrD
	lRAm1YedGVlUlppKT1DV/j2HIuAltp/xZwByeQBFqSXVT9VEytUklktthfJhGitFnhG2IJPcxPW
	ckxuP3q+MQ/zICkixl/w/+shrlXME9RKrFDGaVsYumYUAQzb6gVq0mm9KGxTa2XbA5EjM+l/9Mq
	olrblVSIVgkkhQefZ9re5jrEke+d/hYZmvPpSc3k16nj0Utfgmey7KL1lAx8Jb4lT3VKQriMX3l
	LE6DLJkg2XM7fc1lzrR9evu+zmCtalq6weiFbgc7i7e6kzfczEbVtQzVWCBgv5bDS8vTuszUq+G
	8iwlAvBzfJsgmDjxHH2Qhco0w3dSZq3wlPI0ExBE70bhlkM46Y96P6sCht05uZ9Trotr5mIg8jq
	L1MEnzWrf96sBGblObIuoq96mQTIpUssVcYP8rBp/hCxPSWkhJbx8hlQ3Vurm2xcMg7EVejbvGH
	W5b6of9ceBefXnsbCyoayK7sOU=
X-Received: by 2002:a05:6a20:c901:b0:3cf:a7a5:e310 with SMTP id adf61e73a8af0-3db404aebb2mr12126866637.9.1789435880642;
        Mon, 14 Sep 2026 18:31:20 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm27111575c88.2.2026.09.14.18.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:31:20 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v5 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 15 Sep 2026 07:01:08 +0530
Message-ID: <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree support for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

The series adds the board compatible and describes the BMC memory,
SPI NOR flash layout, UART console, GPIO line names, graphics
reserved memory, I2C EEPROM, and MAC0 connected to an RTL8211F
Ethernet PHY.

MAC0 uses the EEPROM on I2C7 as the NVMEM provider for its MAC
address and is configured to use the RTL8211F in RGMII-ID mode.

Changes in v5:
- Use the I2C7 EEPROM as the NVMEM provider for the MAC0 address.
- Configure MAC0 to use the RTL8211F in RGMII-ID mode.
- Use the standard OpenBMC 64 MiB flash layout.
- Add confirmed GPIO line names for the reset button and host power
  control.
- Add the reusable 16 MiB reserved-memory pool used by the graphics
  device.
- Drop the previous RX-delay-specific description.

Changes in v4:
- Validate the MAC0 RGMII timing configuration on B650D4U hardware.
- Keep phy-mode = "rgmii-rxid" based on hardware A/B testing.
- Add the SPI NOR fixed partition layout validated on B650D4U
  hardware.
- Correct the BMC memory size to 512 MiB.
- Order peripheral nodes alphabetically by label.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 120 ++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts


base-commit: fcf94f5431858d83003cf18d60df67bd87b20ad2
-- 
2.47.3

