Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374520;
	b=LCzpFsdhD1m7fMzMTC3XuEKEtbvlnuKLVfhJlCkiSVsXUUzF2VSJM9V2541rgPVO8BFb
	 ltcGtHzWBEtghNyXUVn+7PeKouV5WzCtv4NfRSLvqy35Cs2jg6CqpaWbMIbqtT05VCQJC
	 9NPBCfjJ7zTjp3Y73ZQ7aUJGrtshtZN2ZbFn8wTguDdV16deG9Is5qkTaYEqSm/ouAacp
	 cBXrk29y/H8T/gxEnjjOjvLmtWNOlBWHl6+8Pn7WdzED4TyD+HzieBVKJ4QtliOwxOQJf
	 fhPTRhVyyM3tSff5niKRGJ97M3es2vgtyPsgB4vQRpw/Xea3685r56V5fD/RBZGTPVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=73sbTOBTKeNDVIbWsqHqrOHKy267PO+zwpsv2AnOAio=;
	b=kQfF0wLje7XlcoTYkENoy9YxFJQ4HPjUgjg1y0HY8pKwH7lazqiN/Wb15cLPnLsVrTZ8
	 I1nCIRijOSdbjgFsnBi5xNG7LE2MQBq+6nOplHGPwsBkEk5fCQ4XyLli1Y4dOG7l7dva5
	 ofDv5rjeAnd5iux/lIDuAVndAuoH0IIpDMS0XYriV9qMZee04zwTSN23eMD6aa5vVSYvM
	 hRrtkJdTyT4wARe3tVcK0XgzFWJAVmgBhd7jzKnSWT+1uNshLEQKuX9dikKTB//jlSLBp
	 E3XH2/AmmCl2dX+APASMEwXU45Od7lxBFYpAeSN+z6yrsmk5YKe4OZNW0SyN+4fKHCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=imBWeynG;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEDD606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAEDD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=imBWeynG
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so17490765e9.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795374518; x=1795979318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=73sbTOBTKeNDVIbWsqHqrOHKy267PO+zwpsv2AnOAio=;
        b=imBWeynG+POI9udwOD/SHv9YDeIv8X0KAHUSoUTVByALVgl4/If+IUmBpPfNHM1+Kq
         sDacnPNicFuOcpl+mEzUhOFwiJGuH+ljFCxYLG/qjx29zAtd7VndewJp8+tuUx6KQq9w
         XL8awbtO5vIktvddL81lnknmie4D88Wqc6YzCsf9LU/hgBBthvjT/f9N5W3jeaI6G43P
         C63la+MoksV14gtEos/ViauIZLD2sY1ix+szq2SUVvbHGTUsT8rBaSmfQM3qw3kvSXUc
         YIyOZpUno/lXMor2w4dx+sM1SCmc+bDxD4irpO0prlt08D4yZ0IFR0CaaLojNm5Wt1mJ
         cKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374518; x=1795979318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73sbTOBTKeNDVIbWsqHqrOHKy267PO+zwpsv2AnOAio=;
        b=OZLuNZph5DKrXCbKa+UdBOQSE9k8aUoyJWF5FZwaHgz+062Hp9IZ74UtCvHGkTFZqZ
         McyqmFT5gYE1n5QLWbejk0wYDsPernfIUjqvb9A+UmjAJNBjN06gZcV6azTZnp18qBKW
         o0pPJeixqNFp2iptKxcBA7q0f80FiQopyCjpRbjxXzGfMKz1vvsi9GxXgMWBMbm6tS2Y
         RhZ+IyLmA1B+I1yFSAnMRlHX0jFj10BcF3LHXwitfvlPbXkRxSwx36J7D0dDNwbeWD91
         rca7DKCzMJLjSFId5Zce2DfQUfe5TYWiHFaPNzn4jUgVc/n1J2+s3MEcBzn5AMeQIOZ2
         cUyQ==
X-Forwarded-Encrypted: i=1; AL+hErGKtS4zflQOYYiR5HxjUrrNXnmnIuJ78y49ldBSUj3xyQstBjZfp/1bPRjTxu5zo49m1cHlqViIzkRm@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZUq8I6Zh6r7/IdAX9gGIEFO6nNdzbZV7x1TP9XGt1L0KTUPIf
	ckODlBOj/HFQzPffjCc0y4kxnqjPlpzxsJxzyzauR668XfIimV1vEu9o3DiCL9j3Q98=
X-Gm-Gg: AZFdTZe/HmfC2LJGLaUd9f4JCVS3e/fCSczwr7s2Jeyp52g9KswI4veqy3a8/BQZSqK
	ZYGGUvLIsC204yAHf0MlvPSD1f28aKWUBmAGwjtwaWBqzhqwndrrAs8xLwwGThFvWHpTxKHUbGt
	456icO6aXx9nFrC2IvtqkKK20UbB15gfdePee/ParSRZs4BSo07Wot84qR6cmCwFc1zGQd0IiHf
	3OvQytWEb/ga59ie1kAzJV0lu1nAmmqTuFtS1N3KBZ2XzdJ+su81I0v7zcAJfEnUuwyrUqgKIR9
	J2uOUr1xETT31UKVWY9b+V3sFuS8O6rhWma+EZpvPo6LpP50HGPpT0y3ZWcELK6qh9fn9v+jShv
	V5LJ+/+HQ64mt3aYiR/wCiUZa/eaou76Eh1DzelUPm9IiJn3D/K3Ey4TDGc/rIt8NlemfFnitij
	uIBrXEtI9At3aHg8/g0N7C3i988dE8HQGHqukzP1ldjvAjUfQNb0eYXLflK39vP6h893eBR5srO
	0+t+IwxSDTUwXFCsAQZV8YOOMP/lNzkelZqVmQvQoB4E1zUbqlOEhY7hprgp4V22UY6YHkrcdHA
	lIyYSWngBhKmA9pkF8H1/UgsWvcGiDZcRk+lVvUoSz2JVEh9ighBsZpJleozjl0ikO2wx5fEJS2
	njRYvaVetdl4=
X-Received: by 2002:a05:600c:1d03:b0:4bb:6118:4f57 with SMTP id 5b1f17b1804b1-4bb888130cfmr226843875e9.18.1795374518011;
        Sun, 22 Nov 2026 11:08:38 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm103080395e9.3.2026.11.22.11.08.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 11:08:37 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] iio: magnetometer: mmc5633: Binding, supply and mount matrix
Date: Sun, 22 Nov 2026 20:08:33 +0100
Message-ID: <20261122190836.66111-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The MMC5603 and MMC5633 are listed in trivial-devices.yaml, but boards
need to describe their supply and orientation. Patch 1 gives them a
binding of their own. These bindings are also used by PebbleOS, which
is where the need came from.

Patches 2 and 3 add the matching support to the driver. I have no board
running Linux with these sensors, so they are only compile tested (W=1);
feel free to take only patch 1 if you prefer.

Changes in v2:
- Cover the MMC5633 too, including its I3C connection (Jonathan)
- Add supply and mount matrix support to the driver (Jonathan)
- Drop the mention of the missing I/O supply (Jonathan)

v1: https://lore.kernel.org/all/20261122093412.71604-1-gerard@teslabs.com/

Gerard Marull-Paretas (3):
  dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
  iio: magnetometer: mmc5633: Enable the VDD supply
  iio: magnetometer: mmc5633: Add mount matrix support

 .../iio/magnetometer/memsic,mmc5633.yaml      | 61 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 --
 drivers/iio/magnetometer/mmc5633.c            | 28 +++++++++
 3 files changed, 89 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml


base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

