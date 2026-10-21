Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574510;
	b=QTEAifLXa5mcR39pVvLLCvdBEtsxQ6btkXcZfGQHPRa2xM+zbG5cE/mj/iUy0Vqy/SUU
	 HKLdDac//G1L6Q2rOIRJIVqrs1x7EKem8GkiOlVaZD9Wj6BNrN3s+nxjau5s0p3de6NDf
	 Zlq4Jdl7XaIWmkfG71znvkqvmHs7CePcl0FjLCFndEQ21+yjyhf8423Q/cdFc9ALPbs2x
	 GCE3ZP+fqainl5UHolAajikpx+XdHgetnBfzGA5bxmu+K1QBd5NIP7f8d7jdDdzJ1z0qc
	 fyQFIcxhPi3GKdarU54LCCMigRqTPWEBD/MRrDWMzd4zKyJz7d+f1NFCnRmWoUIbNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
	b=UDeS/27MOMqc8z4YvNpG38zE9a9j943OCTFAjc8MFgC498/JCpPQsloiB0bsRz+lGzBT
	 G1iWTUgy7c6B8Z+hqo8U66aN7qpIM/Os0NRi4Jk0vsEsOYT10Z1fe+6yP1CseUClyC35a
	 nNwG0dLepZ+aYry9T6rj0F8g0XwZXThF2yJqUUSl2aZJ0JYsqIGld69tSzO8hjceI6mim
	 vPfmJEQ22X2Y2M5ZLWeirKXN6ti+8D+zX6mBMr3M7ujAN2vDHDBb7ZT3gBkFbg2q2OU+9
	 fVLxfNa8FGEvm9VTHQeTCWsEf1WLq6+FJRaD7p6RqY7XMISh6tvpdmWBN3z8+ccULqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=kzvtdimN;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BDC606A320
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67BDC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=kzvtdimN
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so5592995e9.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792574509; x=1793179309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
        b=kzvtdimNAqgbflgW5BiYDW7Pv/+2vU1dQTV37raHag0TMN449JVVNq68hw4gsRwn/N
         ENcZg5nUNfcpLUh4mxEn6gGNItHUaihQw9DDx2v088kVIxB1oWTrSeZyyVU2CS0RsCWg
         sj8dg4zjbNxds+O4IU+IL1TClns1qjeYEnjWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574509; x=1793179309;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
        b=eQYPcV8dU4RdeklCYmJLwDIxZuS29ZDngy7qY1hac+LHM3I8X66MPVJz5aKspoSJAp
         wB7dfEcdal7ioYUXjvRaaK8i1DICp8OuZhlGZEKhqe3IzIJG/hu+Y1X2m/d7kFEexGMm
         4EDPYIHt9DGxBNSNzfySm8+9VhqquLGZWID9wDlROdWgy6+1OLUCTS5Y6c+fNJPqfWPb
         jIwUlzHgbcdp9RQGPbZtNZPlwF3+hIu0sACqfvLkofeqgtxgVffOI/6T4Y5h/d+fK/px
         UALV7gwjzjJ3RBV3qDgam54q+dacQNSkFIKsnAc1knisMCGTJraBxh8Fb3lMuk6SdV5N
         oMDA==
X-Gm-Message-State: AFq9FYIEcChq9tVe4VaT2lh+NCWFDd4IW2xA8ijb13nx1FZll6pW53DU
	m5mq1omKWGSwlYC1kLktg2U/qgqOm85ARZ0ZCldbHiRlRfmJBN065W8td5TYaLLIdbQ=
X-Gm-Gg: AYBFou0HIGUNVwvC3TjK1yMbDkvBCW6QLPRsFnQmxOPnTBjNjlPxgygt5Z3cF1MVmVI
	Zeq1R3lfQrrAONnWUY8Kra2qsT+4Gf1SPZGO+8B++lYgeSN8d0dNX795E1+DtXvvDb/Hc3thkMI
	uHoYjsWrGo1LAp3L/GYQjD/bDdAnaZW5XuHY0+NJ5yBQf3rkF6lnXO/VcamNTyPpTjyfamwLa90
	VoI+ThsIQ0IRjLBeFflk0iqI5IGCFROTG/IT5iGuT5TUWzFwhxOFAhVhHE8FDeP9yfoGgfxAkeb
	nG6/l6cm+U2U0z6l4rk+SJGekB1vG+2YeYBWvLd/XfFAbmbkqGycM/7VBV7P766uKJwcFqJ0sn0
	2G/J0nAdDVeAD3eZ//Uw/e90pSk/swyB/fgvWu/WbAL5hL/r0ZZBm7to0NKS+2/5Dnb9PpbC9Jr
	RvN9maoTkCd1U0emS2bofeIaADVWfBfbOGx98l9aevcxaeh9kBlRuCnsNBHI2iUI+sOK8tUGx7y
	yBAT++HTJcTkZ3Jkbi1xKhoh/v8xWg9l7LsFn+JMwqhdh1gy0e1wrOs6QbYx8hp1uVaT7qpOKQb
	dFVUxw+DrjmYUwRcqg==
X-Received: by 2002:a05:600c:6385:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a1fdb0d18amr28979085e9.21.1792574506584;
        Wed, 21 Oct 2026 02:21:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm16130845e9.11.2026.10.21.02.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:46 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed, 21 Oct 2026 12:21:36 +0300
Message-ID: <20261021092140.4142493-1-petko.manolov@konsulko.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v3:

  - used LLM to cleanup most of the errors and warnings;

  - proper use of dt-schema this time around;

new in v2:

  - add the tag from Conor Dooley <conor.dooley@microchip.com>;

  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3

