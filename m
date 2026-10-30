Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346254;
	b=iII4fbnTGfp1hUT20Wg7YlJeLXJ0RZ9Z4mk89E6h6ZxreVSNgjRSuelmhVHO9trcrgnG
	 /cednHV3utyMX0edLOvDNSoTr90Kt3UmqHk+lE81TssvLBZ0v8ncT7NcI5keX0IUD9E2u
	 F9ODq1HqPNrW6woeO48H3G2EE5wIodRD7IFgCBrm1YDOOF2aUYsI6SdArF7fdy/6HHj6o
	 Z07RnX47KS6OqNzKVnU1hV+JYAz/WxVJli4rnfS35bDQZRus33jtPcAwa387SjtdhN4Ij
	 rJvAvEMUtxKbin4FXf0gqp7PVHr8EFLQs3akXbZ7AsMmwFuTjFbezv6ZzZR4zKTBtjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=03qqmHBSW9MXdmI5eo6TZGADNcBJXPTGl20o2AD8AeM=;
	b=lT8TFhI+zhntzy0/YGEd9YVZ43Em3IX1/urMtl95CKfUN81++HbogC7c04JlLV5KE8FV
	 RnAf5HSbbfwC0gICZaZulus+S6Cx53/eJv6qbrcweJLqhsqpCJBYVbddGCAT+g7X/KY6y
	 OgDlQPc1+fWZysPv3DpiK4a/wpZ2hIv3ML2+r6ExB6TtJ1Ajimauh1I8YjDKMvkD7/0X8
	 XkB5ogvYfoJnKcBJXRKqwgpZa0+6xGWj1WD/8Re/I1Z7TUNcH2dEC1V8O1TnkG2uqnh4G
	 QXZICII2MVJYElgFsrsUU7P8Udb/CzBBTs5nmQiF9R3eSWqLhKZ09CM5S5dbkbYRgEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I73D/JIW";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B163606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B163606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I73D/JIW
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so664454c88.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793346254; x=1793951054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=03qqmHBSW9MXdmI5eo6TZGADNcBJXPTGl20o2AD8AeM=;
        b=I73D/JIWeqqMaqnpN2TqvAc4FFoDTlDFdOPfAPRDSQxNojz3M7bdr7pnhe5X7NYMbq
         bgSVBsbpvIMeIV8limp9+keuy7ZIbF9dJQP2PlZ/mtC6c/Qwdp1uZlPXLkLbi06hbTXT
         8ag++qRuiTYIomfEhGtRsOVPQCZsX8jbBnLFXb9yZObTG59HlrGrVs/l7VjKmVj32g2+
         u4OffBLWxV3sLKaX13zTsa3UboHXE0mDwbVlngXoZXYPclNSwo/+EFoFKvb5+GHRSeKn
         fBf0d4TKrihlLG6qNaU4HOw4TN22FkICTjebC0IPL7fQSB/PQyZ4jlP27JUdL3jH4EuI
         Rrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346254; x=1793951054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03qqmHBSW9MXdmI5eo6TZGADNcBJXPTGl20o2AD8AeM=;
        b=XhIV98avx9CmeMCk+Ree2ddEUh5d6TYl4prDrB5TApZrwgRGR8lvr3GSLle0sID1Ca
         DlNhjNRnClju1ceZLG1du3HcVEDMFvhRZxeTDYTfWdcGxMIYW2NpVT+FHe+uKwY3SuG2
         ji6uIZmBpNhqU7J/IxX2YJMI/5U6h3jbA++OiCaWxPPMS3YGr+beDIW9qwv7aMgTjqHB
         Z5FPn73j+2tvqLDFZSr+9YLZdcf8v6ROrmoKgU/iESAmtaRGkCAnMnxv51qUbLnhYhyC
         Qu3/z2czqloFGCsPCDpmPzQrmLdw0J8/hSZAdlHm7vTLHloWry49aXaCQq2MFq+Vk7D0
         f6mA==
X-Forwarded-Encrypted: i=1; AKwUvBy22L6xFXvphpttlanC1Z1ppBp4sAugo2f+5JKOyHN/z/EhDlpzmbNhtQs+izH+KQFJe6xHMGmmmPLb@vger.kernel.org
X-Gm-Message-State: AFq9FYK0lAl5tguax0bwoheEsspPMpAdHdH+E1yzUkXDnwxoIgzuJe2w
	2D7V+5z9zeDvXdcmu37Gyv/pNnkls6gKdyJRE08zEOnDvFTzfi0TyUxaABdtXg==
X-Gm-Gg: AYBFou1Q+Z0bZM20NnYKrhtEtNCMSZtenUZavK8UdWpeBIdlh5P7W5+0lXhlGOXiPyy
	NuKiOWUWIX83Zj6CfNkD20OrrCM8TzHJkN1lbAEBpn0pzsDfpO7fjsSC5oosWc9zOkGoMFJN3Wt
	XiOYoB/80wygR0baBxvInBrYijD4rZ4fW+Mx5XIG7oZsizND/vAEXdLFgdndrfXAlfeoZji03DC
	QksMFH2J38h2JT2U5woVJ7tfSnrjsr0GzRo5s2Z6D+SF6/Aq3u2qCTUHpL2juOcKCaEZkR2oFaP
	sGcgaHTAJcmtnK/Tw1/Afz7ZmHTqVJn0Gs39HBji78GNp6vsl6urG64J5M0ZvcHDE+97N/Vd0pc
	Uy62AHvxv8emvxV9W21ytXiyrdeGPIxOB96ocV932jR04cl6tsjK1HrrP9pJxRvjAvTwwqWue2C
	0zx9US044yfpYLaVlaMyPY5Zue1rcpzYIFMTh+Qkgm9XbUXO0QhSwvMULtJEjC156lsjHbO1311
	EZfe8CbOATUcTphJrAFXR4Vd9X0Qcka2NDLeCWR1JBu9xZjg+K7Rr4+AoMkfXyWu0uDkocMqqLb
	jBidVq/Vlqa9MOFQdWloxVe9FbmQrbBahDrRY/8b6QY4EOdCSSbpzdM=
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr2258198c88.26.1793346253483;
        Fri, 30 Oct 2026 00:44:13 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:fd6e:e797:613b:a5eb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm7466562c88.10.2026.10.30.00.44.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 00:44:12 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Fri, 30 Oct 2026 13:14:02 +0530
Message-ID: <20261030074404.33517-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Add initial devicetree support for the Vicharak Axon Pro SBC, based on
the Qualcomm QCS9075 platform.

The board description includes the debug UART, UFS, USB 2.0 host with
an onboard hub, PCIe1 (NVMe), GPIO LEDs, GPU and DSPs.

Changes in v2:
- Use the "lemans" subject prefix and name the SoC as QCS9075.
- Drop the PMIC gpio-line-names, which did not match this board.
- Drop Ethernet and audio to keep this to initial support. They will be
  sent separately.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20261029133654.6585-1-blfizzyy@gmail.com/

Ajit Singh (2):
  dt-bindings: arm: qcom: Add Vicharak Axon Pro
  arm64: dts: qcom: lemans: Add Vicharak Axon Pro

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 514 ++++++++++++++++++
 3 files changed, 516 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts


base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.50.1 (Apple Git-155)

