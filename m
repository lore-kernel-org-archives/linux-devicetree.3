Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A337438AC71
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023024; cv=none; b=Y+AlgnHTlmCrMmBtmC509QO5xA1eHoka6wGCZfAcAhgCZBtttE4z7CdeKQ+NIfINBaIPQCFMsohK8PCW0v11oXXbpd0zmPMh8TZC50rzcI0PGTHFE+4e14fytHKA15U6ozHMmCAXwYdGi1AIgz+qOhu2d656vCbnbaZdesLMl2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023024; c=relaxed/simple;
	bh=OsNPHX4jeofbnoke8t+ygRvQX/qpdNEBz1MsGO83J8c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qjUg6Rr+3QAWPuJuWHPWtdRTRG48BEVqLJpYi0fk/K5j/LAYHoTpXuJWd0+MzWBgbKE6/qIQfdAIJ+mscYWXcHN0ugQDZQDB2EOZSUuhm5FwjgODv7ZCXqUZ/ohp3xTa8Q4ovvdTGSVmdhqhQF/An8NS9UsUk6bqo82qIA9P/Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s1k1Ml26; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1k1Ml26"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c79467f128cso2882413a12.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777023022; x=1777627822; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WRwTAJEdshpMeygRgfdm3dyxt0e0Cc0hy7FOZ+1cEoo=;
        b=s1k1Ml26wfIiltftOP8cvXabfdisJT2uX+OgYHNfFfVCtYQygc5DFyWam0azf4YTjm
         YtHSnGCTXmXA1vyZH8B2PWieI382AynW3bUAnrxbW/D3+ZC0WJfMMTLgOr+tuyL78jQT
         /xCSxpr5EQiUe51BLSaDO8kWsJp5afmQqzlkjh3HEO/gMGpv3F/yObyYrYeNSCd3P8e+
         4gMGIV8/+6ykGx+T07tsgPP1d+ZNUxOLllzXuip8ZcB+Uuc2gygv4AVDj2g+nDZEmol8
         R5FTyKxgnI+QIHuehdW4KAXC2mcMIluX5S60QeFFlfz3pf8NMUV+1hCn/UdbhOTMQ9d8
         sm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023022; x=1777627822;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRwTAJEdshpMeygRgfdm3dyxt0e0Cc0hy7FOZ+1cEoo=;
        b=Vrs5NQSQiS9Z8w4EbM/fQnSF9qv1ovoq+bUByEpyA+/MWuEnqpyTb0LWdNSZ3i8CbN
         nKClBQp+NtPowAKkP6+HXKVKhWrPVUqZUp45kxlHgRLhswErHanbSifmAJok9/n9NIb7
         gR/knA1lhWr3so7n+xPCZ8A0JaWfNA8yuxoPUJCGjHFJpzF/L2bt6lZYullE24aKEJUX
         3NRQjb1ix6mgvZIocWvblQc6fWX51AUAJJG1rgOv65TMrIx/SaKHSOMCLjefn2qCQP71
         9A74ohismWhHd/KuPIaG4iTJsQG5HvL10v0P/wV9ihxLs9RJ1VhtartOPRXG7rzQVskL
         IsFg==
X-Gm-Message-State: AOJu0YwoRCPplCpM1gwiAeIszXEtN5G64CwAOcBYjdZDFhMQrci8T1eM
	GGjvKJg9cv8q6pIQFNAHagGxZAMybHjGy46AWgrIOAuoLh2Uj1n1WgILDHIfXw==
X-Gm-Gg: AeBDievUMh9OPupX0nD9YbafRaWVZaQ4fgqb2++SH53nw0OZh5rhVYJeeqJymQv7BGT
	WV1D9RmkpvrtTllUv1jWOKYz/2VEgrpJlrREDEb/Ylrl5TtZ4NPNOcvdqKqM4ybqYYpEFtNwXBC
	mazbea+WJANEGpjXJBQrukg8/BAtvypj4C3rEH9liA7Lr63mbpWHxgFRx/EIFUnDapUhEcFW+Ao
	C3LDrsLVXn6mUlrlpv2/9VQNo5NvquD/bBORo+7noUfEt2ZfmwR4q2+xjblRlbTGv76vdcCh1MQ
	6eCaOQCNElEkMKEswmVzLwT7pcfuCxTXwLjmn4B7IBwg5Wjv+vZ2HMzGhAC2vFGtV//5GSMHgT1
	JN5CqlwFCtuCAlQxwUsqNuTx97PVM0bmUUx8jxxPvEQ295WHoWZpJw4g2VBj18OJ+sFVQUmfgd8
	YQpeu0S7FdgHiAqpH9Nj+8aXw7uXQU9RmKNcnM5ETiVln5zcOWQhA5y2G0uJF+3E0ORieYDkSkM
	g==
X-Received: by 2002:a05:6a20:3d85:b0:398:a659:eb0 with SMTP id adf61e73a8af0-3a08d8a6695mr36356423637.34.1777023021700;
        Fri, 24 Apr 2026 02:30:21 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe92desm22658143b3a.44.2026.04.24.02.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:30:21 -0700 (PDT)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v4 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Fri, 24 Apr 2026 17:30:48 +0800
Message-Id: <20260424-ventura2_initial_dts-v4-0-806b00ea4314@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEg462kC/4XN3wqCMBTH8VeJXbfYznTLrnqPCJlu6gH/xGajE
 N+9KQRCSJffH5zPmYi3Dq0nl8NEnA3ocehjJMcDKRvd15aiiU2AQcoBgAbbj0+nIcceR9RtbkZ
 PM5YVApQyUqYknj6crfC1srd77Ab9OLj3+iXwZf0DBk4Z5RWTXMpSnbW41p3G9lQOHVnAAFsk2
 UEgIhXPRKFTkzD1g4gvIhnnYgcREQFTVEZLnRaJ2iLzPH8AXyb320IBAAA=
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=OsNPHX4jeofbnoke8t+ygRvQX/qpdNEBz1MsGO83J8c=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBp6zhMtNInLf1W8Lk5DvyqGuC2M/I8frqBBvEe/
 b8/gD36idKJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaes4TAAKCRClg0K3CVbE
 gdc3CACqDuZpjAuJQGDt4CwXYmls3MIocoPuyLH5gxIO7xr5zKFYT36q71wL9C2iVRF0xs2xiFM
 RQFU3Z2bvxNhZ/7Scm17U5hEvK6cl4+xSUil/dTnX1YToXrvhuXKkUgFB/KShUr0sxqJM1goh96
 vxqLOder7vKskzFo4axbeEpgLShGAgtU2SDkSJh7WUJzsaJ+alUK49AGFqLL6TAFTV/l3rgj1K3
 cu29OVgwMmtsuC1Df74d6ZQtzsAi9FU8Ltqg6mUVLNLdc/0UC0TbZ0JJa8Bmx20bS7JKnUhNbYr
 xrI0bWR7U29BXya2NaNhE4fimtycS1nGWEeObDa9gOo4Umzw
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v4:
- Fixed capitalization: "ventura2" -> "Ventura2".
- Reordered I2C child nodes in ascending order of unit addresses.
- Enable PECI, LPC control, and KCS3 interfaces for host communication.
- Configure MCTP controller on I2C4 and enable MCTP support for specific mux channels.
- Add Infineon TDA38640 and TI INA230 power monitor nodes.
- GPIO and Pinmux cleanup for PVT:
    - Aligned gpio-line-names as requested.
    - Remove unused or non-existent GPIO line names to align with Ventura2 PVT.
    - Update specific GPIO pins to empty strings where signals were removed or consolidated.
- Adjust SGPIOM frequency to 200kHz and update signal line names.
- Enable UART3 and add serial2 alias.
- Link to v3: https://lore.kernel.org/r/20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com

Changes in v3:
- Add annotation for marvel 88e6393x
- Modify the gpio-line-name
- Modify the node order alphabetically
- Modify dt-bindings document for rmc instead of bmc
- Move the gpio-line-names to original node
- Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com

Changes in v2:
- Remove unused mdio
- Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2925 ++++++++++++++++++++
 3 files changed, 2927 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>

