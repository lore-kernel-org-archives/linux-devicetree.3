Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937328;
	b=fdBDRFg3K1IVLhDqw2OsGL1sCmquBjuDQavHmytAHjMzy5wpuiq80jQBOtMlJb81ekTW
	 Uj2InkI+sv+PZH47HrjVPpB5dEbfWsp4hKvvSaO3ULv2XhPk8JIyGyPdhpgBzoxkyHDcS
	 TQsrk/8JJ0th53DL/XcbwH/ap+xhs/Z7kpFaNrPbsI7dfM++5BiE5PAvMJOpNODfMqimZ
	 8fv7PyFkfag7DS9SLv7N2cEVrBQfwMm2KVw75BJgMUOVfgUMyPki6Eogg5aWZn6ArnI/h
	 PKhisPhuDAS9UScuZn4WizIj/5XaTlKjjs5s5xN8vrdm5djfPcRlcR2wGUQVNrI+pZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
	b=zeeadk9BMOmliRR9iB96fP179rs63P8bAjiGLT2C/GGVkXwI7fi/HL5h8R3XjHnjVubv
	 q/lAbsBCBx3Ecfo1A0Nx0tcTxoENj7Rwi3Tu1BZ66llD4OJidl5rAZQcKakaMpjrIeXkY
	 8f0Ik+tu7byf+6eO3bXIXdUqrrSjz+5F9pLj+rMWBEXhpbHEMKBG8vEJ1wnNhXgaiEZFy
	 41oXZh2afzxU15Oy6+dILjRXr+tHH2OSitawC0pQgxWq+cg4YGI+xbHo8E0mdbvmi0v5y
	 AqI7J/uY2FX4t+OCKpZGEcJlU273d+DPOxrWhh6ZJycHq6BeSxrO8f4a2CicKI+hL8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDwh4KfT;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B47606A336
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B47606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDwh4KfT
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb61185057so1168105e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937326; x=1795542126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
        b=EDwh4KfThj9gvgd4ZiID54fBn43gGzte/ynCoDYEqJkB2FDrv4Gf/YpoLOTiiC15cD
         jtT3YQwl8mXytztDAUQUB0F3f5wsC/dGO96h8RGOCu9ocl3nTFJbLm3zC3EVCK9Bk1W+
         U+g6qQRqQ7ewtsQJLqe6lqKVT9qiGvEIP9ZNwZTttxt1Ag/XzfmG3wpCADEEHewCwlKQ
         3+AGbySErlBLCYMVTdnqo6Su9Hy9trzoBcpIgacMj7zNek9dyKZb/SHJpUGr1wlAAncp
         Tu4sDAz6ONg4yU8BDjCK7gjyAYTaXN7lT/790myHY6tXv0h1SRhHu5IUE5OVwoLk2Doy
         ycXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937326; x=1795542126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mk0QZKmfgNlcLXfZLYxQ0YCEj7H/gNwx+nyoD+NSv8U=;
        b=eRaXKjGYd02YFjZU0CkQciI7s9otcgo275Rcd8QNWzNio0hvgfCQe4abCmBkqBnd0H
         M3z3pm/NBC+6+IVb3pKfFQ9+UrfiaqRps8PH7G5EyUWAgt+ZIKJ/tNAZA1iee+QGkj6m
         Z4fOZM6CsfIS3yYWOeh8WXz9gAXxBmLIyziK+yhwBNR+m5+khIDDjPUb/HzY1G1MT20H
         7I+wYgJI7Gmrx3WLdM4WHitufAxcjdKCCdK1IVC7jN/nNl6zjG2iFNfLMaUN2/KulFpN
         a09+Pp4jxxbkpCLK7QLoT9fNOmAP43uxZurR1e5114SL0gdwExuzu9TTOtmJkbPhJ1Js
         rmzw==
X-Forwarded-Encrypted: i=1; AL+hErENbtG3jOKnPuOEh2KkFRQhnqR7xSya47FFHKwU4TH3cArnS/MK8malCpME270V8eifkoptv+NK3fiN@vger.kernel.org
X-Gm-Message-State: APuU4Z923koOQjNrmxe6qQQiG+CrWF3km/iX4H3oaWAaFUhpCjovZ8Ak
	tUNk2xI7ezYX4+wThlopAon4wdL4UPCi28ZjnRWNq2bqgELVPf6/NiOV
X-Gm-Gg: AYBFou1ZZ8eJvx2K1qAsr8C1Y5GaOYAE0wXkX8ia0V/Rh3GlPlDxjNrob4WChKsuc7n
	488Uf6kafpXlMFbZCBzJz9E/hF8nWGtp48rY5hJ7xFc4D+/8e/dK+/1hGNZ7IfIBjhRlJXgmbmi
	IIbcWiDVNS0MADdewj4wDtMFrYnuW5DO8T/YaG1kSKJSWq0r9CU9qCOhpSYkR95fzCjXMVLraHi
	ZHoszc+AdDPe22oKi5X60gL/+PQi+JDtcL5TakCXfez1w9Lh2wPYh6q4W4ZBndpbCIBjKdMsu/1
	Ve8CtAD8Jdsc+efEiCWAl7vbhQirUpKQL5PgkdYfSVqMCk47aL50m0KslvJ5Ctk085/9vl5il/K
	MVgbXBEnkZBp3bTbGJ9aboVb2sPVKGbRb64ukLfHlz1mKWc0CaeMFw3x+a3EoIVacSuXPnG5OlM
	dpYlLoVwgZ3dMrSbDfMgi0WPqqhF9ff2duigclvrB6Sm1Spzt5DGwTpDrHtykWFS0ZnepD/KacZ
	awP+xfd1RV2io5+ZZEBki8YSdk+y4snrusNv/Mcad4aXZiP0XSPZ81tpigrwLEZwNfEtfn7fC+u
	t8MtKyufqOsuoy+AZxOq2BKdfWZsTxAOCK6n80jlY0R5sA9nBxIaheD8VtDTpJiDYWzZr5qSMUj
	hZcSg
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr207958615e9.8.1794937325497;
        Tue, 17 Nov 2026 09:42:05 -0800 (PST)
Received: from vitor-21h1cto1ww (dsl-30-199.bl27.telepac.pt. [176.79.30.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm30962552f8f.17.2026.11.17.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:42:04 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add ath12k calibration variant for Silex SX-PCEBE on Aquila AM69
Date: Tue, 17 Nov 2026 17:41:54 +0000
Message-ID: <20261117174154.549590-4-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Vitor Soares <vitor.soares@toradex.com>

The Aquila AM69 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The module
reports the same PCI and QMI IDs as other WCN7850 designs, and its board
data also comes in variants for different regulatory domains. The IDs
alone therefore cannot identify the right board data. Patch 2 describes
the Wi-Fi device and sets qcom,calibration-variant to select it.

The qcom,ath12k binding requires all nine WCN7850 supplies, which only
fits designs with the chip on the board and its PMU described in DT. On
modules like the SX-PCEBE, the PMU is on the module and powered from the
slot, so there are no supplies to describe. Patch 1 makes them optional.

Patch 1 is for ath-next, patch 2 for ti-k3-dts-next. Patch 2 also relies
on commit 75bc725cd92b ("dt-bindings: wireless: ath12k: allow calibration
variant for WCN7850"), already in ath-next. There is no build dependency;
until both binding changes are merged, dtbs_check reports the missing
supplies and qcom,calibration-variant for the AM69 Wi-Fi node.

Based on ath/ath-next.

Vitor Soares (2):
  dt-bindings: wireless: ath12k: Make WCN7850 supplies optional
  arm64: dts: ti: k3-am69-aquila: Add ath12k calibration variant

 .../bindings/net/wireless/qcom,ath12k.yaml    | 33 ++++++++++++++-----
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi    | 15 +++++++++
 2 files changed, 39 insertions(+), 9 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0

