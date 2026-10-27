Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088502;
	b=3CIn3ucl8AbIoq37OsfX1oK6O0318t7pdH8zpiOsp9pMdKq9+7/hW0DeuM7IjaDS7iJV
	 MwQIS3HaDN5jl7OW+xikVnsXCYCjPjzJkelW4vOfMr1cEvbWpjVFQ9/zn8fZmr1HWX/w4
	 xpbJYsprJy8eTvDs1b/7kMFyEHkOn8cQ277M1drSUUIZZyYEMhyyBf0fltV4svljCifdg
	 xXO60xeXrrOfEyIZWJsm+cBADdX+X3BGvQ+vzyuzO0/zOY+LR1BE+aLWG+nuc5jRHErm4
	 jb4VB80BFbZiwOBUd4HSVNGCDHrsUcbL0NLxyY2tnY/yLewagMKcsFAwW0bdct+cfBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oH3t2Rln9lAG8QVTX7NHWxknnMos7I8hROhH39XVhKQ=;
	b=UnVCPCjVfB4Tos3eUQynyGV59WnrdC40hqCMfDkq+69+7vxFIwqr1I6FrOX7DG4kc5ZO
	 GdikwZHOK8h/ZRxVSYeUHDwPsLhJW7vjquxH0FshV3PHEX+Fs9qOwhToxwZo2J9gFpJkz
	 ibKli8vcsNnvkL5IYJ1CdBRMO+/PSH06E3pkGdIW60dnSKRoCKgG+2X92gftNXkVwH+Rr
	 rD0tq016PiWhxAtcwbqX5ZUPKozQ+eVixlWOvzRO3WbIdz6WgRM7GZIxuCJOgVPKO/UAN
	 Wot5wuDTCxYc/rF1UpIOGLy2FckdRElrXfqqjCyc6LXWe50mSOMVTLVlfI6we/n1mqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Js2LINKy;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8D606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F8D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Js2LINKy
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1824594a91.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088501; x=1793693301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oH3t2Rln9lAG8QVTX7NHWxknnMos7I8hROhH39XVhKQ=;
        b=Js2LINKyeLEHge29xodbyTUySolxzK+A33g8sNVIAhUROllTEdGB+KyrFR0ytFC0Ep
         2K2lRKGeLe3gjnFWdpswAXBkYz3kv7SH4j0flK2JDIgr3iUw7R4cFUN5r5VQQ/8gyVZU
         EAeCEIHa6GA7hRcyQ3trFXVDKxzYW1+O6t40K6kxYb3VlsV3owdiHaRraC6csdrTD6FO
         KgacCCDT9izfVnRAMJtdlo3pNkuK5yroN2js0qAHjQbju6lM4Y1mjo2WE+HYgCw8s+0L
         RQQDiYfPxsNcjpUH6G+x4+SjiLtjJGB2CKSvKQsr9OYJK7GWrIPogr3Ehav0by7vng/d
         DYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088501; x=1793693301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oH3t2Rln9lAG8QVTX7NHWxknnMos7I8hROhH39XVhKQ=;
        b=FEcfGQU4yuwSBHTzUPunNITEPLCsHgdh//QYhHPAAi/fMhhXwZCqMvvKHYjUloRU5V
         fnyD0pmoxpPc/yai1S2Tm8AsuSTOpU9ff+LJ28+wPiuMkxg/pZ6NOOf8VcPYc5gxaIVe
         azQ41Q6OM87S+OC1hVelgGPC263TgrTr7zr4GZHD9pXzfeYDpW8yL8OeZOFfv+RaLuqm
         F5uR+E8qROGSvwAHB5/1pYuZ7EnHGDHYaujtjAu72OUV/twCOX7k4fr3p8p+dzfWtt79
         II404QCtFOVBYav3E/RJdYQf2L/QWSbnYciWOCjROrZ6wgqwj6GzuTfJlwIyC54S+aho
         ND4Q==
X-Forwarded-Encrypted: i=1; AKwUvBy9iMWfxaVMfgmGAq5b0roFWAXuS9MjB+bSWbn8EUoHWYBhfEvyKcuXrTk3G1yjzwOC8RLphuYo+C7U@vger.kernel.org
X-Gm-Message-State: AFq9FYIS98vf2x9t+pAN1QxSCRoIUyGKodPbhuAaquyG0Et2bKM8twmv
	LqqKSVPx732xhI6nDmyJxjI6gFn4WEmAMC7+yWmkorCV84nQIHNUIQ5B
X-Gm-Gg: AYBFou3aff2jtfPQqsg/wSc+Siag/KqkGAglwElG2MOPAQ/mFA8b1eevyO5rVodJZ8+
	QuJzcx0p8hFPl5Zxhpt5yOjTRJ/XrlL8HgamygwkHdZxig/OJwS4oCGcf7RnbUju80mV2aEWxwu
	9QUhJCw/o371euP2Lb6gAbKrMmWz4EnJO9J5qBvbPYiKmttlpREWj3oaMr5ey55hRItsJkhiY65
	CkyNVem9HJp3gVNP2/C51X02fMnZG1hYURSlw0kt67ZcZu050EVUCV1SedAqrdZJlmBicTodhQS
	/PF5jrcIAja8NWyB6Bykc0YWB6cqBRBvpOEXzXI0kk0q+jHHfogN9zD9Qwoiu7FPpPlsoLbZVQA
	cyzGHOYpcqaM6H1SI6IllHAtUWdxvmBTlFFMVcqUIykt9VsahYiXyuj/0FCE2AF165HTWRBtcK5
	a05pL0WmqPcaRE+T+zX9bMStUA6UjK9bCDPGP1R7zJ4chLuPS5+91Bi0I4x126tO+4MarTghFtk
	bsBUreBQXUZnN+JOUEn8ib83heE2/dUZmdMgZCbUnuG0ZRyIg6/UJpr0v7V2cKds6zwTpiYVQ==
X-Received: by 2002:a17:90a:e7c7:b0:3a8:86b7:ad95 with SMTP id 98e67ed59e1d1-3adeb1064d5mr7698392a91.60.1793088501007;
        Tue, 27 Oct 2026 01:08:21 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:08:20 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH v2 0/6] arm64: dts: qcom: sm8250-hdk: Enable additional peripherals
Date: Tue, 27 Oct 2026 16:07:52 +0800
Message-ID: <20261027080758.3990418-1-dc_redstone@outlook.com>
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

This series enables additional peripherals on the Qualcomm SM8250 HDK.

It wires up the SDHC2 controller, the LT9611UXC HDMI bridge, the FSA4480
USB-C protocol chip, the PCIe ports, QCA6390 Wi-Fi/BT support, and the
PM8150B LEDs in the SM8250 HDK device tree.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
Changes in v2:
- Add a cover letter to the patch series.
- Reordered nodes alphabetically
- Drop `output-low` and `output-high` properties of the LT9611UXC pinctrl node.
- Move the `status` properties to the end of the nodes.

Link to v1: https://lore.kernel.org/all/20261023072832.2642647-6-dc_redstone@outlook.com/
---

ShiTou Hong (6):
  arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
  arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
  arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
  arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
  arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
  arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs

 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 456 +++++++++++++++++++++++-
 1 file changed, 440 insertions(+), 16 deletions(-)

-- 
2.47.3

