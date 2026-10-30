Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323922;
	b=lQrzBwS3CQ/c4PzZCHMj2gUsUi7dKZE5QyhC26e/GlDIUst9NBY4Z9EfhDXtT+cdqfAZ
	 hsIL6HDj09jTfSmcfa3SwI2DNbJjtzXRtBR2O15zbn66Cerkplg8hIKAHic62RRqRQGRJ
	 /Z05kp+nnY3CQPoPQjb3NSedGEhLYBHisFXrjOKTpy8GYa2A57dojyAItFYWDJdWOuxST
	 we3yXGUdS946Guf4Vfm8D7kDlo8gseITM+vjomS+FrZF7bR8Jy5o89DFZ1pPM869hbTKm
	 mxi23OCj90o4WtS4/6n9KZFOGu6qhApNHUlyNYjsigDpOJl43YIu0/cC4wXOPOESi5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QkGJO+kgqaCulrnXtUJH9iL49QSQWCoACVPD9LkI2pI=;
	b=5JNkopOFzgaUqiR1jWVW2cWlusLMW7CGQylM6l2v+wE43IDq4VOD40v8JZjXg/y1emDN
	 zcqAZPVBoUtGW67xN6XqPTqPhiwscLs77/SMLtqqb4soWd1ng7bDHP6LtwCkfsjcYaaYD
	 Cx5yS0YuLWlkD2oLa5pKPIhhsMue9h0vFbR62xfViZzRcrYdyDQSKKPzoF0/CIbUugFsd
	 TF21m53tp7/utBqn/7tnejAeB8e4LuYSUtZ91wxh4ELF8fPOXozK3xW0+UJcI8FIyeHZY
	 d+Awtl79BkskbqqIiOQy0HDYRNKwBoKety9NgTgDmZWk4+eIzWu2M+cYosU2UuEOxpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIC0P2E9;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B68606A31F
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B68606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIC0P2E9
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e812e2b31bso1033555ad.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323921; x=1793928721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkGJO+kgqaCulrnXtUJH9iL49QSQWCoACVPD9LkI2pI=;
        b=WIC0P2E9KkJ1uxcE5cLksyz39hhtiUmsnSNL+ZzvDtS+6nQCBPM3FA4iQ0mH2kv/i3
         3Him82UzE+pgSUNQT76hLQElesMffpDb18NLv1x2PJ1v3HtGDsYLR6fxKy2lSbdTlQh2
         vpglfKEZdQcjJDFVdvPbOfBeWsqT0SZyvETGb/nlPIA9LGVMsL4FIhi/kwnkoSf/4s3D
         B0v/rZY21OnvfhSNoZ9HM859eaHuy68xVE1gGMquwZ9HHqAz7bhOU17bN4FD1eoLL2if
         1cUWnR+W700jDDvZ9D/DajYxTRYBqi5r70QrqTkkTP+YhQIKAK7V8kLaIOPy5wlA0ywJ
         nIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323921; x=1793928721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkGJO+kgqaCulrnXtUJH9iL49QSQWCoACVPD9LkI2pI=;
        b=FClxdPcDYoIHoAajlyvq/mEcPb8f/ABoYNfpUWPjx3Dkq/JwNC7wqHW5VxYVOULtpB
         SbuihmuOwC5BG7100TTh9pY0Snw6JWlqekl3KSw7WbR82091TFoxYFPmom3FQNHioeHP
         enZbUq9fORu49jeXpPiITIqIDezWNXiBpMAfeYMCrd1roOdyuY0ibB4QWtioi9mXvCdl
         ekSQSIIRdTR0hiXoJhzWb/mX/F3HrdLqCIqDeM6t/LEH7eJVXceb/ixaLqtdqVgUw2bM
         4hzUWFywFKkIBFhpYDnqWWDRXxLHmqARF2/bSI7t/l4HdpJXn+82LsLhF4ByivyWKM/f
         utLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPD0AUadge1QnBdCtMUU9+9S+npoTQBMqe5utUnfUQ3cvPFJzNoSOkQ6Xo8tLt7sJopzk3rp54JezH@vger.kernel.org
X-Gm-Message-State: AFq9FYJd7wgh5dhfBoBowYFt3A2HKXpeDkPouDYupnL7cPqKlADFNoma
	o1xDa3rM3uziTxUWL2Ovf8DHcFBfRrp124V2soaGnbUXSsYTiieeicud
X-Gm-Gg: AYBFou38TRJ1n6WJppHN4sWVGnrMtGmIFtIzNWkc1AxgOYxXCoPAEpi4Pkd9oAruIl4
	+Y0Td0ModrSqiFw6m/NyHGfO7PsPSMX5fNR/Q8uFTSW06JsbSdn0s6DhxDSANtlS5cROHFL/Zdb
	1SUXutaIPO0uvY/q87xr3sPVIhpsBu0YczS38/FeOTqIgivXvhTmMl422DlKvSdAXGkODuJzoFP
	Z59Zlo9E4kepJzBz1O5kzqgiNV13zZW50kUg+8IeAtTV/lHdzMdXRxL40zuqVBsmJuuJT7n+M17
	J8P+6X64fKXKMMUtzM+fXqi53P//2qr6M2v0P5gKRReQ0vX79ahz38OXQW3sFLM859ddlwqC8Tq
	sXhzc8rS/TRsmTru/XlmxVyU75dZP4BxAGnwg4oJkcv3R7j/1qNWXDpY5ASyHez9HDejz4ikvKZ
	ZWY06zXH0Hw1223vH8HmhSJlUl3DtfafaZEQvvaqMxeOH+3UbIegS76w2WVSkDIvSVhM1hZNrvf
	BGwgqHTUnYDVqiqGWQ4xgVLk94kF0PJRXYA0HNnXdmK14/7QlzknNbsrT0aphgmg1+e2g+0xfqn
	P51f9pG7OJLkl1+mk/IrgW5EcZbz7UhK5ObDB9qmXVg=
X-Received: by 2002:a17:902:c405:b0:2eb:1e07:adb6 with SMTP id d9443c01a7336-2eb364b8b76mr10600705ad.26.1793323921214;
        Thu, 29 Oct 2026 18:32:01 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:00 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH v3 0/6] arm64: dts: qcom: sm8250-hdk: Enable additional peripherals
Date: Fri, 30 Oct 2026 09:31:29 +0800
Message-ID: <20261030013135.158157-1-dc_redstone@outlook.com>
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
Changes in v3:
- Move the omitted `status` properties to the end of the nodes
- Reordered the root nodes alphabetically which were also omitted in v2.

Link to v2: https://lore.kernel.org/all/20261027080758.3990418-7-dc_redstone@outlook.com/

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

 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 460 +++++++++++++++++++++++-
 1 file changed, 444 insertions(+), 16 deletions(-)

-- 
2.47.3

