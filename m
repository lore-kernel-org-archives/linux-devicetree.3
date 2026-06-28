Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B53D274FE8
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782680182; cv=none; b=QrWVVl/cIdGACX/RaVqLgYjuJywI1gsHMiy0OHzUxyZaSavhFPclFUW+5JXrirKNf+/iIM+YgXYP1jphuZzMLJ3c4fgBF9LwyyZDOa7yJ00lE9V39Ey3LsJ1zweuXejnhNj/lMKjnY0HNJhobjgO+idl6njytA1AuPuPczzKYn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782680182; c=relaxed/simple;
	bh=RFmH0IW/4aCKDX1ZwFlUh4PpvBL59snjoL8qYRGhFEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vtl5rGDs7s0Bf6fcpyMydQkwSWjf5Btbce95etlN7pcb+Kka+Cp4FuIYN9RYEIvKkg6lVhCW24ofPmfnOJiL5Me5ARe+Zr21vKncwn5Gn9+0vpa6yGhAaFFVP+FZYqdmogKFK08fvqhGsKsUoRWojR4Wer+X55sY0EsLh4QN64M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjRBIj7r; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjRBIj7r"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4631679f204so1975643f8f.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680178; x=1783284978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zB2RgA4LcSFDTrHCUEiIFGumRAW+eppHEw/DC5yOWko=;
        b=VjRBIj7rttIuWcxYHXJy6KUMquBQYpCGdzE8p26hlt27NIpyasmSRCpajJ7v5MFB5t
         OcAYokHHSxFXThusOBJuNemLhBvZK4aUN2eADyOP4pOuqT6iRVRK8rbhax6FOmIFYWVV
         6zHjpGd2tw1Sir992UpU3KuYf2ciEiX/pyUgM6v80x7RTaotvJTOARLt9I22mUXgfiTj
         +x+/pvu3OruC9WSRjL4LvmofvUxpMeXNDUfER2aLiD+eyt1TT7W3zRAVjrySDdN5Gq+r
         nx+XWjUnvpXVLMy6J4cOpjn6QOPGxzU90OAYUmCALIwtY6llNgzt7jm6Y1NQr2DiP9aL
         AkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680178; x=1783284978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zB2RgA4LcSFDTrHCUEiIFGumRAW+eppHEw/DC5yOWko=;
        b=IlyWQ3hE8FVnKzktzZIeTqPW4754Kn31HqXc332djg8R4MTVLFnudQy9t87YkOTmWH
         /HwJDOiMZcfbN/+PWtuO/7t4NBpQmEiLFw4cjjepl08J9G4Zrw/WQKves5xNK/J6RkpL
         YVf69p4BcA8/8a589otiw8BF37R7gkYYedqo2I66gUPF1qrS5viY/SNX3QeqkGObn+Uh
         QV6Tovf4qeCxgfZhdonaUzK1tZEXnawZ6PMrfbxuJxX/FPAcs3Nxoa0FInvPN0C9Jz75
         Q0MAw+sEEmn0KACxRyGTFbev33MJ8XoJOOpXGyx+WNFXX2SkAqIlh0svrGHtupd+8Kpb
         I3fw==
X-Forwarded-Encrypted: i=1; AHgh+RqyG8JJwEKh7OZOS8tHaNNhnqfUjDv/13U9a2jNWgJ3S4weFHrPMAdBIknMVkshYtkP0cP4S1nI8QRy@vger.kernel.org
X-Gm-Message-State: AOJu0YzI1azjJxkFCHLoHan8CqkSWCMf3s/vbY1hyxcrcXUyJD4jeBNf
	sa7tSL6JoU2yUq8X1esoO/ntGOqsvNaIadg5BqeucaBfqq5HFJpy0DFT
X-Gm-Gg: AfdE7cmAGdXgBrOmAQzFLAoo8d8twl09o/zrJg0rJdWANraboFMJGDvoyiXaxA9THkU
	Sj016cF3UOHc+tbifyyNjOGJVjkeXIc2tZG26TvIpsFoS0+wn33AnYAWFeZmrqbm0K//gyftklA
	HZ+kANjREQLnd01w0TWRnoPPMZeL9tpf1uWvHY8UHgTxKwMcVtW+jDaghfhT9PAd9OB5uMowPXj
	ES3jfczGwggrAJ9A3l+kd6nKul6Q8Ux4cAq0m1b/vRAALaLfZc57jvBTVYlkKSjqozEwRzq1jC3
	TBZfFZyxf7QSmmhsy9d6dS+dAp8qRf9Aw8/CnCRX2SfjS/GF3QFyJB6yuE3fb9sSjPDHqYWTuG0
	ZnbkMVoDU9RAjmnb9ZmjuPTrNJyz9FB1V2KuCFYQVBH3+tIqEet/tT3i4gP+sE3wLvjYOuchG9h
	5xD3Cks6/qn1D3P5C42CuOsGSVL2JVQqVSdSaTHqKGIP4oaKLV6Is1RzdJSy+r9csd4HRk5vkse
	7HnKAzELnA3vifnWOxp0hxk2w==
X-Received: by 2002:a05:6000:4022:b0:473:1e79:87e6 with SMTP id ffacd0b85a97d-4731e798941mr3474546f8f.3.1782680178221;
        Sun, 28 Jun 2026 13:56:18 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f86c34d76sm19448910f8f.3.2026.06.28.13.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:56:17 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 0/4] arm64: dts: am62p5-var-som-symphony: align DTS with hardware revision
Date: Sun, 28 Jun 2026 22:56:04 +0200
Message-ID: <cover.1782680023.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the device tree description for the Variscite
VAR-SOM-AM62P and Symphony carrier board to better reflect the current
board configuration.

It aligns the Ethernet PHY description, updates the audio codec
configuration, and adds the touchscreen and TPM devices together with
their required board-level resources.

v1->v2:
 - Remove unused eth property
 - Remove wrong dmic property
 - Fix commit message

Stefano Radaelli (4):
  arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
  arm64: dts: ti: var-som-am62p: update audio codec configuration
  arm64: dts: am62p5-var-som-symphony: add touchscreen support
  arm64: dts: am62p5-var-som-symphony: add TPM support

 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 43 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 35 +++++++++++++--
 2 files changed, 74 insertions(+), 4 deletions(-)


base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
-- 
2.47.3

