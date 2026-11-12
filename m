Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483524;
	b=2Ji9gq5dTLMXncmTC3lw+9Q87qDO7HR+cX27hsJ+9H5nAf0LTXX0Z6wKIkue2pECTjXh
	 kPxtOXHa7gfU9WJkZknU4V24eKcQDJC9nOSOSa7fY4CfOFapH53IR5J067qF1FSFZOulI
	 C8A8PIf8xQwzFp6z1tyfRf64aYCS4J5yJyQJdOfrDkKY+da78JEIh/QNwhpwPSQa5hnBd
	 CKjkar3TkZChOj3n3tq7w1WkvTKDkG82BLgmv9Gb9xqm5axrxbnKwCFOj8C8t6tE1VUfh
	 jB6LB/S7uarHg8rNEStmVR70m9Ymz9/ECDbM+V+jf9/1xGeGhEvwDcHLCCEcKe4qjoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JrAN4L0V2AAunfW2Nn6egAbHFdktLmN/R6cT5SYYnmw=;
	b=brYPmlqqSiNjUYEqqFTBTtS3c//uQGi7GLSXXkgWbRKKp4pa6tdZavm9k/zS+bvQjhlf
	 vXgdxb43STcCkO6jZSQ3/7QGP7fV/HmGj1YMdJKdEpXccZLX6TPSZ7497fsKTnCTjeiv4
	 FGrlZQmgTmL0bcsTylFZxBlSUCj8HR+dVWiZ2h3BDfbXBoYwL+xhUETxVmbGgY12QtMW+
	 h5hTEenOi1y5cikriEoFK4I8PoerDlQVRY/rXh7M/vU72hlglmsEWcb2jL1ni0RIasUCx
	 Vc+omXyOA802/FmOjF3qJq4O77vqqnYX2LTFZe4XkKKxPRwZtCauT1dL7COGr3l6E3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhhretRk;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA86606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA86606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhhretRk
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8879010eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483523; x=1795088323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JrAN4L0V2AAunfW2Nn6egAbHFdktLmN/R6cT5SYYnmw=;
        b=EhhretRk7oPtkW23vp1w8LW0E5tl4AX4P8bITmTeOn28qxthfwY+WrK6e+caqxJTPm
         x8r+XCRIAt+DhMA8e6DUBhimfaq9nQFHNe298u2ZPTklN+Ao4yy7XismsZmbgEgjsUvv
         7ZaX2SJwbXebmSFabnEJ+CUxwPZuX+8z1RkxtdUHkOcJacDdUroGiOjN2lbJt3CQaWOV
         ylxMXOKBvrkckAqa72fIhTcheA3E9xpCOGjjebjJR/RaxsKnt1IkMvQnOKa+jXZAij9S
         qkvYaIuDpa8yRsVNxSE21k0GGzz39qeyeGaeeD4iBt59yO4Hg4s3XIjRZ77/oKKtRFax
         13pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483523; x=1795088323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrAN4L0V2AAunfW2Nn6egAbHFdktLmN/R6cT5SYYnmw=;
        b=HTo/t0gK2fW//YCeEsF9YE/MC0LlNIwOPA3i/btKM+0O2GGNkgKLWtfV08J6fCU9W2
         aboMr9i4sZI717xfdQYfrnr1zgtiVduKER7KS1CCWKU/CSR0qFU00cOFk8fjZ+2niUlC
         d18Vsdxic/44M+yWIztS11g22qJzlKmjafcMUWaODiHdWM1OfE76SYCgAoEpEDmx0Wti
         QGr1Jtksi5ihzLveml/hi/GMAQSJU8VpNtIMMrsZ07w70n2BNfcf/L5GZRwyx3HR9Fb3
         OaZmsLjPFMKtx+mfDfd4ywyhi90oPRGV+iI5YXUMrQSm5udCjWC2vU2YEdu9F8rx6KaK
         P6DA==
X-Forwarded-Encrypted: i=1; AL+hErE/Qa+2g4cWJLeBy5Ce4R+iNIZyHPAqyyAeoC4N0BxtvS4QhQAZ0UsQP1wjC6M9Lgvyn3isxSEBwn6f@vger.kernel.org
X-Gm-Message-State: APuU4Z8M/qOxlexRfdoj5plWZWd97XG2njfmklg/Re40VmntU8jlMZhc
	ovc/2L/V1iN1w1yOmhtxwXGKbze0z0apZ69Jfyz/Wd2PXWQ6NOUEkb48
X-Gm-Gg: AYBFou3rwXcD5hLCsjEoQ02ziX1SVLsP8lthc2ruDsNTsj/h4XfnHMW/Xww/1v/BoNA
	XT1z/EGWAACcWO1uAhuwcjhHh6PJqgCXXUXLMCQgwOMMfDpTY4dJX3JtVn+dneB3T6IrxBnQpH5
	UlvEIxHAsVrb5PIbPtk9OlevL9jKbypCiupGCYCbBmvK2ZQv/HpuuCcl3eNUkvyAGsXzQXcKNTl
	vXBTxOsC1Y1RuyX4lwA+pcDUAc/1vM1eNc2L1kvukswp+aogvrlmx50o2ft294QcChR2aW8Lohr
	u9iG2ydar3uVvGmXfG8NNn0LBRTN7J+jK/vOVlxYQyXe7tvfcmhRX9hIM6PjqWfCPN3NrTrLw8z
	JdgXJ7BODCzszRSsMCiJ9SKV0lPAzZM52pO4wSCFiG0MlYm2r7Eb5Ba3+O9mQANsHKXvguDEzPb
	n7s4idQsO7NQp3JIRJMMrE3t+p8v9TS1sBwouZDREKbln+1aY8pJPOVXkF4KQjYh9AKAw0uQyys
	7uOSnhyl6hKFG/+PA/SGU/z3JFU38lUfJDcnEupALAdz+o7/fY4D+b9Kk1rgScw5qZhKto7a+13
	sPKpBwLVNX3z0Dlh3tXIKte4YUHWTCn1r6hK0dDdJA==
X-Received: by 2002:a05:7300:7f27:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37685c7a324mr5685022eec.23.1794483522522;
        Thu, 12 Nov 2026 03:38:42 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm27149036eec.20.2026.11.12.03.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:38:41 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 12 Nov 2026 20:38:36 +0900
Message-ID: <20261112113838.506-1-26rote@gmail.com>
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
PCS powered down. The USB 2.0 pair still works, and such monitors
often have a USB 2.0 hub, but the dwc3 controller still runs from the
USB3 PIPE clock. On Kaanapali the next xHCI reset in this state times
out ("Host halt failed, -110"). USB stays lost until the cable is
replugged.
Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
common") keeps the pipe clock branch enabled. That is not enough here.

This series registers the dwc3 glue as a Type-C mode switch next to the
PHY, so that it gets the mode (it does not route any signals). In
DP-only modes it moves the controller to the UTMI clock, as
"qcom,select-utmi-as-pipe-clk" does statically, before the PHY
switches.

On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
DisplayPort series [1]. The controller side for that SoC is a DTS
patch sent separately to the Qualcomm tree. Other SoCs whose PHY is
already a mode switch (e.g. SM8650, SM8750) may need the same property
on their controller node (not tested).

Related: "phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode"
(suspend in DP-only mode, sent separately) [2] and commit 89aaaa26f698
("usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in DP-only
modes") for boards with an FSA4480 on the USB 2.0 pair.

Patch 2 is on top of Filippo Falezza's "usb: dwc3: qcom: Restore UTMI
PIPE clock on resume" [3]. On SM7250 QSCRATCH loses its contents in
system suspend, so patch 2 reads the selected clock back from QSCRATCH
instead of caching it. On Kaanapali QSCRATCH keeps its contents. [3]
is still under review and may change; patch 2 will be rebased if it
does.

Vladyslav Tymoshchuk's VBUS override fix [4] also changed
dwc3_qcom_pm_suspend() and dwc3_qcom_pm_resume(). Its next version
moves the change to the dwc3 core, as Thinh suggested, so it should no
longer conflict with patch 2.

Both patches are for the USB tree. The Kaanapali DTS patch, sent
separately, must not be applied before patch 2: once the controller
node has "mode-switch", pmic_glink_altmode defers its probe until
dwc3-qcom registers the mux, which never happens without patch 2.

Patch 2 makes USB_DWC3_QCOM depend on TYPEC, so with the arm64
defconfig (TYPEC=m) dwc3-qcom is built as a module. With "mode-switch"
on the controller, pmic_glink_altmode then probes later, and its first
HPD event can arrive before the DisplayPort driver has enabled HPD on
the aux-hpd bridge. aux-hpd drops that event, so a monitor attached at
boot is not detected. Yongxing Mou's "drm/bridge: aux-hpd-bridge:
replay last HPD status on hpd_enable" [5] addresses this; it was seen
on X1E as well.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series and
[3] backported to v7.3, plus [2] and the fsa4480 commit; the boot test
also had a variant of [5]. On each DisplayPort entry the controller
switched to the UTMI clock before the PHY switched, and back to the PIPE
clock on the next USB state. The monitor's USB 2.0 hub enumerated after
each of 5 DisplayPort entries, 3 of them on a replug less than 2 s
after the unplug, and after each of 3 s2idle cycles with the monitor
attached. Two other plugs stopped in USB PD negotiation, before
DisplayPort was entered. With the monitor attached, rebooting worked
(2 times) and DisplayPort came up at boot (2 boots). In these tests
the mux state came after resume or needed no clock change, so the
recorded change was not applied on resume.

Changes in v3:
- Patch 1: drop the mode-switch line and disallow orientation-switch
  and retimer-switch (Krzysztof)
- Patch 1: say that the controller only needs the mode and does not
  route any signals (Krzysztof)
- Patch 2: rebase on [3]; compare with the clock selected in QSCRATCH
  instead of a cached value
- Drop the Kaanapali DTS patch from the series. It is sent on its own
  for the Qualcomm tree (Krzysztof)
- Patch 2: check the safe state before the altmode, as the safe and
  USB states can come with the DisplayPort altmode (Sashiko)
- Patch 2: always select the UTMI clock for pin assignment C or E
  (Sashiko)
- Patch 2: do not resume the glue from the mux callback. From the start
  of a runtime or system suspend until the core has resumed, only
  record the state, and apply it on resume (Sashiko)
- Patch 2: leave the clock select alone on nodes without a mux
- Patch 2: only record the state once remove has started
- Link to v2: https://lore.kernel.org/all/20261103135057.1682-1-26rote@gmail.com/

Changes in v2:
- Patch 1: use the common usb-switch schema
- Patch 2: switch back to the PIPE clock in the mux callback, when a
  USB state follows the safe state. v1 waited for the next role change,
  which can come before the mux state (Sashiko)
- Patch 2: keep the UTMI clock on a change of pin assignment while
  DisplayPort is active, as the PHY keeps its mode then
- Patch 2: while the glue is suspended for system sleep, only record
  the mux state and select the clock on resume
- Patch 2: depend on TYPEC || TYPEC=n. Skip the mux without
  CONFIG_TYPEC. The arm64 defconfig has USB_DWC3_QCOM=y and TYPEC=m,
  which failed to link (Sashiko). It now builds the glue as a module
- Patch 2: no change to the role notifier
- Patch 3: note the dependency on [1] for the PHY's "mode-switch"
- Patch 3: add Reviewed-by from Abel
- Link to v1: https://lore.kernel.org/all/20261102215121.738-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261103135051.1668-1-26rote@gmail.com/
[3] https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/
[4] https://lore.kernel.org/all/20261022224220.480-1-tvlad744@gmail.com/
[5] https://lore.kernel.org/all/20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com/

Joonhoe Kim (2):
  dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
  usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
    modes

 .../bindings/usb/qcom,snps-dwc3.yaml          |   5 +
 drivers/usb/dwc3/Kconfig                      |   1 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 154 ++++++++++++++++--
 3 files changed, 142 insertions(+), 18 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
prerequisite-patch-id: a793fca7329dac964c21459f8d7a8b003d36d84d
--
2.43.0
