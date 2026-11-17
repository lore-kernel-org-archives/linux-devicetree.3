Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933711;
	b=st89UQkXlSGCZBna2UFCotZQBXlm1VXCe8hE+IMWl4xzLFrvws6kngVGaFzI1+SHylqy
	 LKQMu2K/6UTi2Pu53h7xiVRLLhYCFBJ2nFE3/nNffZt94u0WOesGGpZn6lPwYeqabOmWn
	 Wp6lrTBHht6uZN7sEmX2q37umEmm8jmW0gCXvZS37P7Z+vu6uq8IBTEUnL9KobIxDcT7e
	 AsXX6koTjewJUL71DARGP0wQRVyNuVW4IyiERpCZVkchKpnw1KUSz/LzqbVrZ5vuVLou3
	 ajepSgK4biKRwbROh+mjwRHTjsw7efxusHARAUGQdCsnycmSF6LJl7byTV3pzKjFJJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
	b=mtGhz5/XLsiakWkvECd9BtRH4kxv9DLPSFGsCYlXyv5NS/fe5aUSHQrtOs4pJlA/ymFU
	 7TpYewUD5wymFZX/EYl6DDe9EbIY0N70sCSlL1l0YqsHV94AYV2MlW9XEFkONYvczkggs
	 rDg3gOLJhSQU5NgDeWOgIv2TTOOvvGagRYcIH1cmmQvKMahZzIqxOb5GQLpADwq+OlVF1
	 uFrf4VyG5CikSddWT/Inui7M18fB5Cetk1QY2UqTy5a23akPEqMryit2p7TuuJqF9oYu9
	 EEjsrS5U7DHohY2HqPfRD/VBpxlV28x4Z6v77hgzPl5Z2gZiZC2FMy1rYwtFJQoSCDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLuUHnZp;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA35606A333
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA35606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLuUHnZp
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so15245815e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933710; x=1795538510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
        b=hLuUHnZppPhy/Th6btQWxH3Y1idAk2DUmxE3csbcvOL4WPJtEDyOtKiMqDPCv4zs7z
         H1YGm6j32rohyNx59bNyLs2gexyMGcUwn/D5gDnBwTUxKDaus9E2ic2phRPpNXPHWL3v
         UTAM4IcMyI56YDOeTulD4LVRL7DGEUsD3GbLEAuaLaSxMwIGSB+vC0lkZJuyqOzpokuV
         a6cahj9NsKekQbKC71QDL1FREYe6stFQREX0J9VICqTgbLT6Ra2+xXzLxaVGvmwechD5
         u7ve/hUHQ+yGQdtUtR4gLk99ZFyaPEGln7Z5I+RSkWi0iXOlipngsrRFy9gFhfiI/bRL
         pPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933710; x=1795538510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E9UqG8kgoxzr/OXnuk/9PMtioBhC4J7rDT1g5ReJcaQ=;
        b=zfzn9yZlEwOBUwTINHacLSWHw4ZVYXs6NJbO1Ekl/9rARohUfo4r/ftpzgIW541Fzr
         o3DoR4kYDgCJkYrROwJvDE5mp8mCBQq1J9Hu70Pp5I6yfCNy/OuNquCDJVd357EmDS+l
         cx8J8NYv+VNeThLw2BGxJPUzoeIfWDxMFbb1AYTt6ckHBZAL9H0qMfXLLB0I/5vxMBHi
         Ek3Bsrgj/ytG0XrCML0mQ4ktJvQW8rKRrRAewJo2PJul31bq7rh24KhfiBHyALEqDEZD
         mm/NgaYpAVCy+2epz/qQ1tOwIDUN2Q4Tg/V4HGx6zKNWTJwOpxfTrI11e8ohP0/DACi0
         wq8g==
X-Forwarded-Encrypted: i=1; AL+hErFhS1jc6BmlO7r54dZyJw/wCqxO3v6dOUwF/kzrBKuLHd/W8DKt5lZTWbVyXOnQh6XO5JxCu86uCpAd@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nwv+3EN9ojldsUvDXJij/SROpVQQZUY0756vSMrV2TChEISIK
	mxQIKznm76L6kKQMX8Wyt4adQzmoZ4Vwjdp5B96CILmwTjy54sD2+FgV
X-Gm-Gg: AYBFou2+kCMAw5HMCa12cPYi2C7EzTY7vW16SzINO9hCyIO7KHEqjex7zxYBRu+WBZu
	9JfE6CXgmXHqNYCmUfEYomaDYNqpDa2nERTyhm6vMqvahFRtd3m2EVrxVdz3UYuTp2Sxcuy0v77
	vNob/kzKBHJY6yx8X4Bqy8BBJm2be2zBfafhQW09zYTcpKStHi4HTCQlSXZ816ln6SDHgljZ4PL
	6/PJ3vTAcnnDrvrX7l8F6HoNF0nCrGTtjr28M9ykAyTQG/yfqZgnfHskvJ61vN1oTDSbtWuC5sD
	FdYVUhrzx8I61g2DGtzrPlnBptR4YB6J0jbwJeM9tgDbpxVEClgZDDo5KjbCSi0J9cOoyCVpJA2
	Adem7/20iclVJoMoU2ssWjIR+As5E8Wl9Tdc4Apz+ObEDBKkhHXH9R0rjI7ad2ljDxEqmPJz2Jk
	QaVcDVIFKJKZGJlhVpA+s8jE6HFfqO+PZDVBzAFGgYSzMaTSNR6oYNFetloHb6KJ+kIQVTSfwc4
	oMTWwss1L+B+lb7J8R/sRmT2ZCcLWu7hLuMbUQ1SLbSIOgrHZzbQY4VlJ+Z3VlOOW4N8fd8/mrz
	YTq5DxKvdAt+qRtdH/MGPZ4HYCYoqEdTNtztPrR/Hnh/yraO5CGe8WBJIPke63oA3DZ9p/N4Ece
	yjgwjhvdKdyzvPA0lPmIsAIOtfYjhnAU6onmRwzeoABUUf0wpHiodPQY=
X-Received: by 2002:a05:600c:4584:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb7837a4b9mr69213875e9.7.1794933709681;
        Tue, 17 Nov 2026 08:41:49 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:48 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] an8855: add MFD driver
Date: Tue, 17 Nov 2026 17:41:27 +0100
Message-ID: <20261117164132.47167-1-ansuelsmth@gmail.com>
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

This micro series is the AN8855 MFD driver that can go
parallel to the DSA driver.

Changes v3:
- Rebase on top of linux-next
- Reintroduce switch part
- Add already reviwed switch and phy part
- Use fwnode API
- Use __free for mdio_np
- Use capital letter for node
- Reorder header list
- Use ret directly instead of ret < 0 ...
- Use macro for u32 shift
- Use full 100 column char
- Use unique ddata instead of nested one

Changes v2:
- Rebase on top of linux-next
- Drop switch part from DT patch

Christian Marangi (4):
  dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
  dt-bindings: net: Document support for AN8855 Switch Internal PHY
  dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
  mfd: an8855: Add support for Airoha AN8855 Switch

 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++
 .../bindings/net/airoha,an8855-phy.yaml       |  83 +++
 .../net/dsa/airoha,an8855-switch.yaml         |  86 +++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/airoha-an8855.c                   | 568 ++++++++++++++++++
 6 files changed, 928 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 create mode 100644 drivers/mfd/airoha-an8855.c

-- 
2.55.0

