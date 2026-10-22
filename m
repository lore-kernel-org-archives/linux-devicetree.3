Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693879;
	b=lzKbIXekq1GPlKxaAm0vtEJtTt0aq7P+AtpwwBGtKHJKE2etx+GuUhSO5BRe3bfSddNY
	 DKodyaB/O4tKhgF4I3zrP74s8LCoQJoLwmSBBYMtQSulVYxDbvagBJsSynNEyp8QmZEac
	 nAri1DUFC5dLmfjrer5WYsiOXLvezCLLW7DfVDwQesGV82lXmPeW8icf33KnnOM1ackuJ
	 d2yYQa6PC0I4yeLxV87gbSklDGcuwkQD/VH4VtSnPBxHarFVs6XLedBIzAnptDxFq1eYy
	 /PaO0z/TDFg2dTUVI16SB0gAtEMjc8OZLlNU99igfDjGrzDxqnZMHzMUlXjppAqBROw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=;
	b=uu+XFhWWbXXJGavFxW6C83bQxOZeu6xViwAdXKt07W70cH6kU0DvxX65yvYNTIvm5MyH
	 AMG9D3E3DSHDVTH8VXuchTe9m7LElyU03gV66qq9PdSy6xCeWFSSEOqtF2hd10P00k1+2
	 z/e34rJf6bHTkARVNtPVFmH0z2ZJ2MouO3x7/VwQye0Wl9B2iWDMrIzhztWAQ2YE9bpql
	 EVwSpXC72FxTblCpVAxG7CLTK1/AgmV/APOswXeif62uDfvD7cogBHKXadWeYj1XC3wSh
	 6Tu5Pr7tuL9PlUfDNbgJxtfn46LzS/yTzAcPWSyxcLYo3FPcfpO0lk4vfux0xC8UsTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KUl4wyUq;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E227460A2612
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 18:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E227460A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KUl4wyUq
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so1141065e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693876; x=1793298676; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=;
        b=KUl4wyUqYOpZkQN0agnn58oJoBlqpUZTS8nJJxND/opK9vgTTxiqGUROLVWODBEYtq
         et1nNyUCeneSvTzmFt7NgVBX6wcRgk0gGim2xln/GByIdLpagBJ4N1wChatX04cKS/iO
         jggg6+R7Xybfw2O2nQzuDs8AJ9GuC3XcPgV+9N3Z1ilUQT4Ej1stbNByohTsdimsWmeE
         R9/STk/alN2f3TFRRIDFvGh9hdpNyaXBKUpW6uZAyn9yzAV6ik2pfIGhMmf6swm/sDcc
         ojaggAf0v+uoP9j4TwNeKMbZkNKyIfRTd1bMoYS/XexC3lbrTto3NNVIPZ7bQGPbmKne
         zrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693876; x=1793298676;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=;
        b=m9ce/Ar/IcpW1TRD5ayRCUGz6U0a05CQzEOeBCA6JRmizXfJTGZF8GVU/QNHwycSYj
         xd46LphGqFLJoL36luBshm694tArpEwgSdSrVIx4tWTgkDGpzqCBXhwP4sU7Nn653DGa
         +GY7c6+q2Zb+HWwC+PA4AASqinXqPKvQ3wZkXoYrvREiYhV/ZKVuCWYIcvNRpSnN3lwH
         zTwDkKq98lwLmCPSXNWgMA9bIjxbdbHrZn8okMw5N61JKHFJ8UnFir7HODhrQ6Oh5MDG
         ViRRW+Pm8d52uYGGYAIS/Lpe3jL11jO3CorbF7irFRUEMnicQDPQ0+BJvh1FUy35RFLn
         /HcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwKrxTwCZdwTmgis3uPXoUW64VqCWY9+bsy1OHLt19TZQLAZKRGzZjSWZyf3gnMZEwmJAAPRmFIqXL@vger.kernel.org
X-Gm-Message-State: AFq9FYKKgGaXqN5u2uGPhkC0FwiCWam9R5BCp1O3SOsZ6PDVoEmSw4Hq
	tIN0+I7D+GXG287Ji/3w3ClAcfgY2SoMnQ701pseYH0PtW8QWRJntVrosYf11IflF18=
X-Gm-Gg: AYBFou3IFJRfr3OoO72/+XBvQ0F+FSpOL9WqLDRhPra24KHwNvGN4DGoY4DCDhA7sUS
	WGV619MmrY+6as+PvZDIWjtlUIOe1aXGAMQajdjSGTfT1lRnRsKfBui5kDk/eOEm5AVsZh/vu0l
	Iu6l43aUf02ZjcIUqxrhPTfXcf7xFk7Kb2ruQDATdLELkWwHRm28BBcVVwZPIYPZj0zj0sgt80h
	q0CH6XyckxgzJ1R5leyJLFRR9Ax28z3GVekfgHcOHn0cFZvue3/XCDPKkGyI3iQnTKTVUoHevmZ
	4Y/Zk+QamNR9GpOKxXXUKPT438zzje7EEPEF/9MZImi62OdHV45YNNe8pC7eHTUSwVQ7u4J7h5S
	A4NRAqH2XgfjDYvtIIJNQG3yZOrDaGAWRYz9CpGrAdDJ2Vr638E4/2/bdBH9A3/wIlaBNqKWs0y
	7Ml2vh7DJ7wzQFHXuyTnFbOBx1MeYaEWsIvr6VyOBlyY0KgUNtPefOZHmouCVdZ+lmIujkf+DNX
	NMn4eD1c+3bSFnehf/BK7SeRPZTZW7FnMLl++ewE1kc2pg4wcDvXIYutd0VCsv9SM0bdaQXP92X
	cyX405i9ysMYkwMJUzPT0vkc7/Rr2jyUF2fYdPD/mA==
X-Received: by 2002:a05:600c:3b17:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1fdd31aebmr127571525e9.16.1792693876294;
        Thu, 22 Oct 2026 11:31:16 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:15 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/4] Fix and complete the GIC description of Amlogic S7 and
 S7D
Date: Thu, 22 Oct 2026 20:30:26 +0200
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDQAyF4VeRrBvQUafoqxQXTia1EbwwUSkV3
 93Rwtl8i/PvoByEFepkh8CbqExjRPZIgD7t2DGKjwaTGpulxuA66xK4HVCfcR47IUKVH6N3VUH
 OltbnFuJ/DvyW791+NX/r6nqm5QrCcZxFFhwhfQAAAA==
X-Change-ID: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The S7 and S7D device trees describe only the first 256 bytes of the
GIC-400 CPU interface, which spans 8 KiB, and leave out its virtual
interface control (GICH) and virtual CPU interface (GICV) regions.

With the short CPU interface, the GIC driver disables the split priority
drop and deactivation mode and warns at boot (patches 1 and 2). Without
GICH and GICV, it cannot hand the GIC over to KVM (patches 3 and 4). It
needs the split mode for that too, so KVM gets its in-kernel vGIC only
with the whole series.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (4):
      arm64: dts: amlogic: s7: fix the GIC CPU interface region size
      arm64: dts: amlogic: s7d: fix the GIC CPU interface region size
      arm64: dts: amlogic: s7: describe the GIC virtualization regions
      arm64: dts: amlogic: s7d: describe the GIC virtualization regions

 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi  | 4 +++-
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 8610d31587e139380db9cb8708f4263833b482d0
change-id: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

