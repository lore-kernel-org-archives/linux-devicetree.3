Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205495;
	b=L6inLfyH1H/gQOMXrOu+5Yz2DCXYlnQ/JhfvsBudYBjjpgzTsyeM+ghr/u6giI+2bYDY
	 ighF2okYM8Qhy39y1TSz3NJcEksqnuETkgYazE1cl5HOqrzsD+9ANOL20u3Gkl3z3pbLA
	 OHBla3Aw37mKx/LU9MeO0cQZZvdQbUA/0S67fO/UZyU84d+M/NGWLcBBG8quvyCQW5Mbc
	 qy5/4CLV9YMBzaAGiohjyHtzesB/pKft5o3Rqwum/iMsPLuFEmcVjY4TvXhXQd7jB3siL
	 cZlc9FKvz6ejL7uy9MDU6v0JRkH4/VALHt+uQQDW3yNqs2mYFNXS7S8DItSkWiOfw9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yLO7PfoHPrwfWKb35FF8N0dGUstLX6IC6yxLIlxOY/k=;
	b=Z6bLE/LjY3iyvJO7RYBNNr32dSrTNCZsnuo7JD3n2lRDVGYDw0A9H6T2gSBbn08mHL8M
	 0FsxAwPNofVGBepY1mh6ntDxxHNaHHIRUNRYMqEjQNon5mnEllYdIxt+09RpYTGn8APOG
	 mjkr6fhg4/LyM5A70zlWRJ6Sso8Mj+7bEfCtzyXvW45+wTxHwJoXaGbCCZH0JvrYMO0X9
	 iJeCftoJafc/Z8j2yaCotehq+3SHjydjOMo8m+9ht/4tfUr051vx4ZDs3xqHc9HHjZywv
	 SeI05rtcPPgKcJVuMA7HuM7I15XS1on72E0TNY0BV7pkiO4mg/k/PIm6PK3nawizeQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DyfM1oMv;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC0A606A6F2
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 20:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC0A606A6F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DyfM1oMv
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso644546f8f.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205487; x=1795810287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLO7PfoHPrwfWKb35FF8N0dGUstLX6IC6yxLIlxOY/k=;
        b=DyfM1oMv01evrZ+ltMOubx/jrmw9Li/OOE1kUesIqFi8220Op8+hHG703fy+G8YO3y
         1WDmwPz5q7K8Rryi1ENoUHFsAwoEqd2Y4DTVOkLTI4XGYLCIuJJICpuGly/Qn/n6QDb4
         5XEUdT5UPAIGP0nT+mFayGgbttqYjO9oHvu8ASV8PN85smz0gFhdy7qi0ShEFUhypyuT
         s0vN46K3ja+aRnetM3HCeUqqcsnWSBOuBW9tYp6Z9pIxrt3WPc4PA7sOVLRXhSltnjBU
         T8smtxQPgcKXpD7xKIcTOTLDeLbZ3nAJKJaz7PL6hW7LUMKtNU3tZ7xmHcDeAN3VSObl
         /DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205487; x=1795810287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLO7PfoHPrwfWKb35FF8N0dGUstLX6IC6yxLIlxOY/k=;
        b=0o9OPTIxoh1Oftc5+yUHQv/Fyx5C+kEuxQsytV9TZ1L4fl3Z8C31DJQuatG4XM2tQZ
         LlVOmQNpcspaFZM3eUCBF2NThqWCPxHHpTzAYzfg6lj9Kykggq/GnqK96aPmCKQ/UaHJ
         y3l0LxAtq+D+6Ylu1z0Pbh/exVVvTROcywo9k647bJO7IUF+gecmSOQtx92S+FaTOetG
         SlcR7fk5WZXw30v/4do1gblWm3riPG/eab40BmCKbcVW6J2PaUaaWmk/Ydt2eq+k5fv8
         udFUTDN9Ev+z9hJwWvD1NpgGKxKQj3vHL0IR5gH0ic/m73UfUBnmpyj8DAekmaCaiVFT
         TJjg==
X-Forwarded-Encrypted: i=1; AL+hErHd8ejismd+AWvBRmwgBLWLW4y0unBSC33RYh+7BrQpDWYXzJeiRw+SLWoKDXJWcoIHJ/O4Q5y0C3ms@vger.kernel.org
X-Gm-Message-State: APuU4Z+9/BMM/UO/whdUdtcKkZVj/1XmDoDkjWSmwlMhDdsq/ELEAEh1
	2TXOf+G3ZEkN7IFCLFaY5Jrcrs+CguWyUkFho2+/M0MS3OUQoH7FoQ6r
X-Gm-Gg: AYBFou3HhIn2GZxFpBj39xqU6M2cEgvyaXoFKi5SAPyiMJEOG2SUdnV38J98pKQ5SFt
	82veOUA5J9c4rS/ukDK/F8UtVUDZGuC3EgBZRdx9Wpd+1N/pzwE/gtYgrjwvVlC0hD4aNNYjI/B
	9FxGKXtkPKy7IMzDSOoLy04gkCojmb6wuHA3WCY82kvA1WrMLHy/xQt0gWRCLBsFuuyCXLS+hnM
	l+6gAdPdKIn7v5MgC7hQwhhka78thTq+Gb9OAEIU+ZLIS48P1StQ1/Hy/YyqexYiNf9ksO1G8XT
	m/jJ2kOXIy+yM4yOmhogoTn4/5ahGmSrvXJ4xbBKL9SaF8OHVGBHKmRn6FWdiTaFZMACCn8ArX3
	HjeaHb+QSiPi5VOS2gbpljoSEeOQNODnTfkI5v4G7Z9TrO3VwpP9YHDwPVLuvIHLMs2Zi0v2KNZ
	LW+rbih7NtZUDSYK7LE+JY8vAGddwTS6YU43T/OrI/++AgmqCOG+53t4oCgLU+t+NU6JNCTqsmZ
	sc4iNSGCsAkO+PXDGRSIXW38LdA1f2cIZWJGDUYV9GrGMTkIuZlRuA8IZtYLEuVlDb4x0VWdhrs
	jsFj5KZ1ZGET2blzzqtnl/Jh3NVkZe+BSKW4/HjFxrMKQD+AVw==
X-Received: by 2002:a05:600c:3ba5:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb8880f29bmr107885145e9.10.1795205486993;
        Fri, 20 Nov 2026 12:11:26 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm115561275e9.3.2026.11.20.12.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:11:26 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add ASUS Vivobook S16 S3607QA
Date: Fri, 20 Nov 2026 21:10:51 +0100
Message-ID: <20261120201127.90969-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds support for the ASUS Vivobook S 16 S3607QA, a 16" laptop
based on the Snapdragon X X1-26-100 (X1P42100, Purwa) with 16 GB RAM.

The device tree was derived from the Windows ACPI tables (DSDT, PEP) and
the existing X1 laptop device trees (Vivobook S15, Zenbook A14).

Working: eDP panel and backlight, GPU (Adreno X1-45), HDMI, USB-A,
USB-C, NVMe, Wi-Fi/BT (WCN6855 NFA765), keyboard, touchpad, lid switch,
battery, speakers (2x WSA8845), headphone jack (WCD9385), efivars/RTC
via QSEECOM, CPU frequency scaling.

Not enabled yet: video codec (iris; the Windows firmware is rejected) and
the camera.

Dependency: Wi-Fi needs the NFA765 firmware, which is now selected by
ath11k instead of the deprecated firmware-name property:
"wifi: ath11k: use the NFA765 firmware on the ASUS Vivobook S16 S3607QA",
sent separately to linux-wireless. Without it, Wi-Fi falls back to the
default WCN6855 firmware, which crashes on this module.

Tooling: an AI coding assistant (Anthropic Claude) analyzed the ACPI
tables and drafted the device tree; I reviewed, built (dtbs_check clean)
and tested everything on the device. v2 has been running daily for over
a week on next-20261112.

EL2: the EL2 variant boots via slbounce (VHE, KVM available). At EL2
the ADSP/CDSP and QSEECOM don't come up (the SCM calls fail with -22),
so there is no audio, battery data or efivars there; I have not tried
qebspil yet. With the default EL1 boot, everything listed above works.

Changes in v2:
- Add the EL2 DTB target (x1p42100-asus-vivobook-s16-el2.dtb)
- Sort nodes alphabetically, drop a provenance comment
- Drop the unused i2c1 and qupv3_2 nodes
- Drop the deprecated firmware-name from the Wi-Fi node; NFA765
  firmware selection moved to ath11k (see above)
- Link to v1: https://lore.kernel.org/r/20261113214424.220241-1-ingo.kubbilun@gmail.com

Ingo A. Kubbilun (2):
  dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
  arm64: dts: qcom: add ASUS Vivobook S16 S3607QA (X1P42100)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1p42100-asus-vivobook-s16.dts   | 2115 +++++++++++++++++
 3 files changed, 2118 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts


base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
prerequisite-patch-id: ae6c33cce4db2472b5aa360b5e6cbf29763cfd69
prerequisite-patch-id: 85373c0c0ff98ec4cda496c612feffd19f715d52
prerequisite-patch-id: d752bf7c6f8768fa3d4d39387455c3d4551a8481
-- 
2.47.3

