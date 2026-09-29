Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D801831F9AC
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673515; cv=none; b=Dsy2mjvLD/GtImxUJyTXRSoZdtBaveURD/89bcrvG/luTaXwP3kb6ZUpO4h9TTvcpqPYqzVW0s4NFmiAtKtHpReGocOj/WzBIfWiGMW+8vALdCYyU9QlnFhtwg2GzWasKMpko7uQ5eAeItevC3IR36H5jeh5mDUkOUyIJbtjP7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673515; c=relaxed/simple;
	bh=xl+6SGpN5r+JlU8uWnKJTgqgf7MWKOx0cJnxdrgT1hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gy+Dhn397FUl4mhwg4fm2PmxjoXHAYa1q8WgZgX9luRkCd1s6FQWAK3cTdVGOUz03orZC9XfReIiudewxJOwOPdIFGr/f4LpyiacQ+6jmkYMeqDNbt60N8+RZfgLb5Alxk1jtbtUlw/UPuBPn5t4x5Mf1hGsqAK9+ujySkmoqc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=IeplYyC5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="IeplYyC5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so37243325e9.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790673501; x=1791278301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=;
        b=IeplYyC56oEeUKXl1y3lXYw2poDIC+REl+l1Xw/6uedfnlZ4ikxBJd5rcFZqHI2acN
         7nWWetVydgVEx5ZR83i05hfVPYBiEUD7eSVy2wIYvmDKZulE0shXCsRgTpReowNiVr6i
         vMjGL3NidmuogfSA1xDUYS6ABt3qQPKFiO8dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673501; x=1791278301;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=;
        b=WYo4dQ9n5p7NWLvbLhUkO8wjbsgvhbM6S4Zrobcc0B++tx5dsHepJkr35pr0Fn0Mrn
         j9muv2Q4KXFt79wn/u5wyvlFjNe13vqDA7sl21R67emeCRIdFGaJchj2pdbkliRrI/Cu
         Kd4pq8/zBdhS2FPq+T81rkLRuqJI61cJJp+Wuh6Q/qdkDNLt16yUtZ/3OeIBM4cu1X3x
         b0Ih7MrYX1PZcG0fxPNiCRlwo8ZObnW1nJo9ZZ59j/JhTq9mSFLgycuC9gyncQm9xpiq
         PWRNmhvh3bfeuAD/5kP9KVIfYGGQ0DAPmHoGBpktbF7ca38CsmbkGN+Pou2wK68g7ULG
         Zoog==
X-Gm-Message-State: AFuF++lkL4k3B3+WNfRhXa8clpNmRO2/N3a1roM24mhK1Lny9fBE9uoF
	l7oOaRrWdwbNMapxaOkL3x1rWYhDHG7IKKmaiL87CC9lOZl53myM43zBRejK0UjzPDI=
X-Gm-Gg: AYBFou3+/4oIGxSONnGVCfNlw7OGJZZ89PbjUEkLC4yhh6SQeW/+GUP0Z6zXTYlEtqa
	J+f97UW2zYT6bl8EplYotJ3kae0bpv/Tai4w5TDt6QqiQyODWmHc3Zdjwv0csO6K/aPiWIgKGB8
	lslM4t5FkZccVA96Xs9JT+hRRHLDNXlmG28cofEPkV4GMdO04otB3YcDU0qOCLtCFiFzmnOo+V9
	aAzVLNvI5F7liNW57wZ+RlXMNzJMsum6XP/XV0KjVmiJCf+a7RzKbUFLuzHR15aiNl32rYdcPRU
	epUPiN252qTWslTJ6B0SjzkvBBlPatkhUh4Uu0ojtS9tUgI4ETM5WbQsfUo6SJqtFqCPSFj9EIU
	qDFdLOvr7iwuwAptOcI/hvwddwi8SYR2wVOmph/xEhwVDooF1L1oMZsc1hJqhoNErw9iz2J2pDm
	eihS/IRNrj6y/k//qOsm/Jj0Jgat0B8+Y/lbZuEUKQCfWTO+fGK2Q+SMEX+GTKfLqZVge0uyAsC
	2/NfuvRetajggQ=
X-Received: by 2002:a05:600c:8b71:b0:4a0:328:43df with SMTP id 5b1f17b1804b1-4a0032847fcmr81130085e9.21.1790673501052;
        Tue, 29 Sep 2026 02:18:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b150sm59178575e9.7.2026.09.29.02.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:20 -0700 (PDT)
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
Subject: [PATCH v2 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Tue, 29 Sep 2026 12:18:08 +0300
Message-ID: <20260929091811.3735201-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v2:

  - add the tag from Conor Dooley <conor.dooley@microchip.com>;

  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
 6 files changed, 497 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

-- 
2.47.3

