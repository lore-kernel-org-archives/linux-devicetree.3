Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805316;
	b=tsmxt3O6QgPyg+yh5Kk7hOo5+j86kmEHYowdql/5287IKrDI7DHXR6URnqYQe34ApuXZ
	 KlFP+jGzQcUyzFJvmw7g2lC0fyJ8Y7SlOCZDhVp75Jwo8xW0QFZYtkFDF743nou3Z6KLx
	 fOXbdhIOaNCwBElR630QB1W8dI2VdhXEOehn3xtLoLyY5+molCRRMO3vA51sTTifp9Qqe
	 6uC2KWDqLsdZG0aim4t3Hvp+JZWPC1kV9JgRA25j0bI3YZ9nqMczzwhpV86g+o0PwM0OU
	 mvEpgz18bnR6rJKv1PfWs+ONaSRS91Ama2ylEO3JpCUz4cpSqw6GK1k/WRWp93asgbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DvzKNWBCSVLjdhk3OCIyEzZaa47Q2w26gD0E6/7Rlz0=;
	b=HaKkFSDeKnFjupMjO4VMuhLIeMd5PVCEflpRmmWZb64VqvTH8G5IbOUY7Mhle1Pttfv9
	 U4Oy2RzjFeDzdu/BKjDYGDoo4wyhg/qR/u+SmnPZPTn2opD0rp3eBe88r+ERRtVOq59ox
	 BncSQ37YKz6CRNWBHVREzuZVpD1RV3/Smns7X3BPj8BA7sVyQtDZwK8TmdpRdg9awjqxk
	 RLM48INFn3kaUf9X9j0APnJon7w19X8aRlBi/lmZMB0nZHhGgoZacqHrSld3hop4rvqHh
	 gI+DxKW7qpN8oiebdovZrJpawU6kNq4KDWzxdLrrJsmZYvVJfCsud197tudS4LyR2YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Atw0LqGM;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA95606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA95606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Atw0LqGM
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e00eee27dso472044f8f.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805315; x=1794410115; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DvzKNWBCSVLjdhk3OCIyEzZaa47Q2w26gD0E6/7Rlz0=;
        b=Atw0LqGMB/2/XTkOeKqUeHo62urG3bqpCUaO1iiTZqhwAZKM0tCVFLLTFdcigPn3Ni
         hREtpXhXKweCPF3emkM7dRNbA0KypJrTYOOwV81hV63Ej+9uK4IQHVBfSt44WgMRocKD
         YEA/4s4cVoebzCQGw0cy0gSDFGKx8ye5WUKui3y+tXrNTWyG8BRYF2rA9kHRhTQe3HGH
         GQObvpisw8rOBuiUL2l3NNhIgICacb+NbbIDUQzx69RO+EHptQLd2ZLvw7EbMT7Iya0U
         QRqf2mlLif1JqVac3SptEfVasbVwAqdIAuvXXIuYxxzveBpN1/Bl++SF3IGZWtYoNR+Q
         I0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805315; x=1794410115;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvzKNWBCSVLjdhk3OCIyEzZaa47Q2w26gD0E6/7Rlz0=;
        b=VpCHZenFqBrBlEvIslBau3grvEwLxvmDtOjp/YK7JLCmJZ/s/+tSLF3/u/nonPPAwK
         GtwKFna+4jUO50QtK7gwV6L21bDRtYE8deTsnFOGFYRm0aKarw+t36NgKowIgma+sGG9
         DdwqhJ0jwAp6kogiCLgblq4f9PAXj0px0QoAAOsn6V1N2uIvF8VmVFxFqkcbpVqHZLQG
         R4g4/VFb2LYk5rWI1iSgeIrolPP9HKn9yL0d1xOmP8Gj8fRIvCpbAZYcOOH46PQvExRd
         xj/e7gXje2TRfwHCtbjpqNEEun7tpdCZiIpSBiwErwPZxNac/n/Qto2Kj4E14BtrYzLA
         LXoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP9gBX1lNXtb+6unrxDt1WYzmskIRfv7JOSY8wh+rf/ODhJTdtFNo0UwVeOB64UA23gB38mq5EZ7e7@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xjp/iMDKgeua0h4a4Qfm9b5LRSxIAsNcJwMJcfkdbKeP0Imn+
	ehsqJXYDEIPitL2GtRa9mX1MJyFjnh0aLWgVmfLm+4qZ3cp1PxC4Fyp3
X-Gm-Gg: AYBFou2lQhYsO/+Kc006VXrC8FJ5IWBnvmQXzZM0/Uf8zT9V+2ru0vIZ3JFBuVzChsF
	6qnCVzCCSr97uZl50MumPXZMRgfXatpl+D82EGFEi5r+PnbhtIT75uNmz/WVTF1SNq2cBjikn4Q
	mmWhdFQGw8bli/agPcU+O1z5NO0aUqyM9tBr4YIiHuOFRHGOOo40gj3VO5cYfbJYl9U4QQLVHre
	WkfXlB9R1NOwveaEKmi28DGspqNlSYMUe4Db7kUrjbHN1AZUUdoPbEN0K9QhDKsejevOHUOIfOU
	XVUfImLb0qm0i94GjUQhFTOGiNzTjpD95TGnEs7f7yVNwi7QAxIh2uhrmK6cjXMHecsTk72Bwpa
	Ny1HwJTNhEua1eLHRV6trxTUkBM9TJzqtGg6Z47zEuoQ+5D9Kjy58QfeCNB+NJpU3SkNX8lWPuj
	ZZ5oy5HNMBbIRraVbs9OF55h9+NcsW+8tUj1gpP1+utDY0/z61plK6axxKdRGmLPw10HEp6nAZE
	NYOWPXwmBGw1pn/oIOnNhI2ai4FPbEoFZ5AE0ugt4E2Otga3fAyiB88awHRtw9Td3A1mc1Ku2CW
	DyhJQQeQVnb1sw6kEFsV0IJr7JyVB27+edir0yg0pym0Bx5N7Co8iqbt3dpU7c33YvQ03h64xWK
	meo/tsLNcj9A=
X-Received: by 2002:a05:6000:2410:b0:48e:6674:3b2f with SMTP id ffacd0b85a97d-48e6e5005c5mr38318127f8f.51.1793805314720;
        Wed, 04 Nov 2026 07:15:14 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:14 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 0/4] Enable USB2.0 and TSU on RZ/G3L SMARC EVK
Date: Wed, 04 Nov 2026 15:15:09 +0000
Message-Id: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP1L62oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3dLipPiiqnTjHF1Ds7RU0+Rki0QLoxQloPqCotS0zAqwWdGxtbU
 AAgjMGVsAAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=1499;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=gHvgnd4OP4SdT2y42oAvYKf3GElQNiCR0xYw32xnBHg=;
 b=fQ3AQclEY2DOskFDLtq6EMJ3Sd6igp7HqCHLlTD4VC6AgnHTLAqrGCbq47fp9NRymKzapBwcL
 vw7uwp9FLbnCr/Yo/i+vH5DWxy/5BnCLwji8f+bg6KueJ/hg7/fLUfr
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Hi all,

This patch series aims to enable USB2.0 Host/Function and
TSU on RZ/G3L SMARC EVK.

To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

v8:
 * Moved patches from [1] and [2]
 * Replaced place holders.
 * Updated commit header.
 * Dropped redundant nodes from board dts as it is defined in common
   board dtsi
 * Dropped usb1_pins.

[1] https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260925061617.127349-1-biju.das.jz@bp.renesas.com/

---
Biju Das (4):
      arm64: dts: renesas: r9a08g046: Enable TSU
      arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
      arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
      arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 193 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  42 ++---
 2 files changed, 210 insertions(+), 25 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-usb_rzg3l-16fe5cc8a82d

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

