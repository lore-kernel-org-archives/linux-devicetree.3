Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656283;
	b=Zka4NBn58CL6rOE9W6vMWIAKUPR+sZjvo6Cf3KwY0MEcIY0mf+Y6iU+TVwHKcAiWjaGD
	 rY76oNPrXWT0KLQ72cY8ybWui9ZCyE4Fzzm8UX991zGzIdFpFmJRO+hMstQzHK+GIR8fP
	 zywQWas2JgCvZn0/qD9F0li5OsCcCX6/r4Wfh0oO5MEUb12LtTztP+greieEBpBW2nm/a
	 I/jHZbKNKZ9UIy+JD7brfnlpLrhbm/Uag8Vm7mSQ1qpbQJsBr8ztGa6LulWHwyOetgllK
	 IHdq+30mOxAnrSRoM1MFWsr9S/QQYgGcF0qsbCQY6EeFO8Afao61Wul7AINk8RsAENA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R0nY1ks3pmMRcLszXh/y7KBDidGoFViijWHtZfB9PJk=;
	b=x+rvyZIlsYIGDowfwV79BX5/5su0rW873UEqZ3AGzVjbZ0kN5UsmKL7jx+u81SEtm5li
	 1LkURAZ1pdcBcWWTfjlyfbG0C5surzHxgAuFal4MmIXrFqptnZ8jIv1T2qPli/jOVGxt1
	 GcOYzwlAm2ayt89fDI66NhRtWUXKmSon+QgFLk08FbzMn6cu5xEa0G9gWErRWxv2Ba2dv
	 S16buDWy1PZbasEWrO9RVIZok1TuXLu652nlpidEPETPnJaw71+SoUsOo47IT2s7pJsRM
	 xepuBbSEKbnPEjrm8cArnLnDKG/GaGJIIVrylaFP1gfGKOgtQHNus8bVEsETdWRu6Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIPSgz9S;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EDB606A32C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 21:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63EDB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yIPSgz9S
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so6633697eec.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656282; x=1794261082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0nY1ks3pmMRcLszXh/y7KBDidGoFViijWHtZfB9PJk=;
        b=yIPSgz9SFEJv+rp6JQbEYIKq+1PnYQTT4rlAaYvSXk6jJdxshzZ1sZrTrYPV+R/RQA
         n+bwivnn7eEmfNZnfcn5ztN1xZWK1sG5xmBEPIl91L52ClHTvFmfUWO1ebGKl8Zj6hzr
         cOE2zX4+78r9Zd0GPPg+gRk4eeUJfytVjb+PuxIo47pb7r77ckvWfj2S7G9ByfTlKPlL
         mjGzmMr29v/2OZPtVBV3L4hYXb/IYPfKs+dz8omiIFYp0tZoHWXRxSU9UI6hj6dLYpdH
         fAiCnsezSH5mF8kujYuK0CbQDiIjK+12anPhBuGoIT6t9huA0iKcF0klvr0bcQ/ZLSw9
         YlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656282; x=1794261082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0nY1ks3pmMRcLszXh/y7KBDidGoFViijWHtZfB9PJk=;
        b=SRnWkNivOxwESHY7QmCfDxaFmR6tawLZqQbzPzlRC45BJeX8jrQEHjVGqwCBDmKXYg
         doqxPZN9Ztw6YcUiLggow8avzYN76ChKQy7jcbfnsLhUXkn9xFlZDy2Vt1/fZCAazluX
         rhKj9hB0k2NqC11u9zkm9Adjhjpf467AEJFBZUVnt8ElzPlQDxTVt00y4gkX/nirwpaX
         68EUzS7zBBzjRubQG/g5yJMAc2JKjwakNlSPgd2LuYpSlv12WGMgq7Vt8UrGuuMOaA/L
         3IySRlvYeTNuVNT5HQ9S+UqnEN3S3G8f7RCfMB/8msyQ5a0EFcKlt4SVYIUGPdxiyauQ
         7wCg==
X-Forwarded-Encrypted: i=1; AKwUvBxpWCdAXp5x4rpu/RTurg3AcTvmPRiNnwM/HbeOm7WX8m66XqlJdccgKedjpDDyeQrIWTJ3MEZbujCE@vger.kernel.org
X-Gm-Message-State: APuU4Z+w7cVVehOLvdo5/PaJYYoeIAhorIWvwy6W+ZiQpJRNdL54MvG4
	u/QjDZx5lfjXQiYA0Q6agbhjTVck6sOQf+yd3ODcRoM5BdLsvS8ll57P
X-Gm-Gg: AYBFou0KTX8DQuHrfBlsE3xcHxlf0ZB/py+N99xc9rdBoTtiMYLbp9Ojd0p/ffxh7I0
	bhebw6ZuzTzVlJPXpsj7hyUoDOSgLstEauSvnQSzrsRxrd/MwjWESAk2B47ZnWPyFmg7WfR/3o+
	tsZSqH4lqjg11/XOxbwwq0oIpH3XbvvdwboTugnJaF4vhSWK/V97ugHv8ktGW3Z1ZEAE3BQu2VG
	FrihpIf4yrXRhXBCeq9SKOCYoDfjWmAcL+C08KgENWxDR2S5an0+Rr3P8nsLFHfbp1TLJQePLzF
	MBp0mVzyPEbnpyoj461erE1DgIdxXL4uoEvBxwgc0DzZ4CYbte6c5ONz169GiNkF3CsKwvWUuCj
	5B1Fp6StH7TR48ojz8N16RdUi9t7b+CJqYKXUxbK8DmrGdWci2VNLuHpN60aNCFe7r+zYUogKQY
	95X3l5H2CIQZN7Bz/XUa9/7AtWzvKAXxEw4H3lMG4mQ/5LlJXDwh99V6LI2xVKy7YdkRa3e2JUc
	QnHsO3HxfwZamZQ5QjfjFzCKJ0OzA3+XYERZUf/hk3yS3o3DRyWTHKuZc3QZrwHcIu2VmfPYQrZ
	BDgvMF0Ef50q2u9pIzvu6532SsD1i/uXWDsE8tYOxAFiJQ==
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr16471850eec.13.1793656282280;
        Mon, 02 Nov 2026 13:51:22 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:21 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Tue,  3 Nov 2026 06:51:17 +0900
Message-ID: <20261102215121.738-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
PCS powered down. The USB 2.0 pair still works, and such monitors often
have a USB 2.0 hub behind them, but the dwc3 controller keeps depending on
the USB3 PIPE clock: on Kaanapali the next xHCI reset in this state
times out ("Host halt failed, -110") and USB is gone until the cable is
replugged. Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk
on/off to common") keeps the pipe clock branch enabled, which is not
enough here.

This series lets the controller be a Type-C mode switch next to the PHY
and moves it to the UTMI clock, the way "qcom,select-utmi-as-pipe-clk"
does statically, before the PHY switches to DP-only mode.

On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
DisplayPort series [1]; patch 3 is the controller side for the same
SoC. Other SoCs whose PHY is already a mode switch (e.g. SM8650,
SM8750) may need the same property on their controller node (not
tested).

Related fixes sent separately: "phy: qcom: qmp-combo: Leave the USB PCS
alone in DP-only mode" (suspend in DP-only mode) [2] and "usb: typec:
mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes" (boards with
an FSA4480 on the USB 2.0 pair) [3].

Patch 2 conflicts with Vladyslav Tymoshchuk's "usb: dwc3: qcom: Defer
VBUS override update during system suspend" [4] in struct dwc3_qcom and
dwc3_qcom_set_role_notifier(). On top of [4], the
dwc3_qcom_update_pipe_clk() call goes after its pm_suspended check, as
it also writes QSCRATCH.

Patches 1-2 are for the USB tree. Patch 3 must not be applied before
patch 2: with "mode-switch" on the controller and no mux registered by
dwc3-qcom, pmic_glink_altmode defers its probe indefinitely.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C
monitor over 4-lane HBR3: the monitor's USB 2.0 hub works at boot,
after replugs and across s2idle (tested on v7.3 with these patches,
[2] and [3]).

[1] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/
[3] https://lore.kernel.org/all/20261022165143.1327-1-26rote@gmail.com/
[4] https://lore.kernel.org/all/20261018143126.3978-1-tvlad744@gmail.com/

Joonhoe Kim (3):
  dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
  usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
    modes
  arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode
    switch

 .../bindings/usb/qcom,snps-dwc3.yaml          |  7 ++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  1 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 94 +++++++++++++++++--
 3 files changed, 94 insertions(+), 8 deletions(-)


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

