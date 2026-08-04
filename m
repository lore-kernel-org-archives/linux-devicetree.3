Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD843F09F
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848778; cv=none; b=MHpJREl6ApZBjVUhUgpfV6DsRVSG5Awzj9xrytI1wkwNSuJuhZlm3c57KwURcoC09ImAitPiwHrvBV6H3WvhOzlJIp3wJD00uFUzbf70kxB+3Eh4mkrnGez6dBBMJrM20t0aInEcqCB8IlKvdYad6zIrAcNSVbyxsfemeX2K9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848778; c=relaxed/simple;
	bh=/uIECPQCH2XFlQ6ezbfYAxeY7I+FhCtIl7W4x/EZROg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HkUC2lHxMiMuwed+qhLpdvxc/NlUmGze1gWZYyFzUfTnTgCudI5SdQuFTKuQ4a32ZJ69tU+Gjy/wK0tMzP7AaHxwAks0ihKL+Yu7rrDTJof5EMuq6YyRCF5Rm70xd16eQ4gf7n1n2SvzTE3b+q0tc81VhQgG8/FzaSXURWkXjak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=humanlearning.ch; spf=none smtp.mailfrom=humanlearning.ch; dkim=pass (2048-bit key) header.d=humanlearning.ch header.i=@humanlearning.ch header.b=kg3/dBy1; arc=none smtp.client-ip=185.125.25.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=humanlearning.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=humanlearning.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=humanlearning.ch header.i=@humanlearning.ch header.b="kg3/dBy1"
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hDv1Y09BRzbft;
	Tue,  4 Aug 2026 15:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=humanlearning.ch;
	s=20250828; t=1785848768;
	bh=VPOj5ntjouKI0rBQL9uDGN+P7xXno+pPAFoVXe4KbWc=;
	h=From:To:Cc:Subject:Date:From;
	b=kg3/dBy1FPDKhqVDGgl3YJmNDYGRZP3dITCLjaMQXRMV+XqV6sQC3NXqVJF68kWlV
	 a3wevvKHejclxsceWnc5d7xxrjjdSQlrqp2vFLWVQBkWWBP3X6s4YSxv1NSeaVTDk+
	 bs2Tn8M90beq+eySSS3V+lmGg14/x/ULw+oGHWMg3lO5hiknQ3uDbIZbymTCyG6Sxh
	 wFj1rKnAAoDwy7eWn3WOesL5PLvJ2C/Q2pPouHbKWxnc6SIwdGNkdsfSOLdVdSsF3U
	 CO8xOXFyWc1C1Z4vvuzj/ukBrSRMszrPkeDs3tDP7tK8+Wz91FAAejAq84y8I/LVb+
	 TqlatV/yQ6tCg==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hDv1W6Qm8zSHy;
	Tue,  4 Aug 2026 15:06:07 +0200 (CEST)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <info@humanlearning.ch>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Harrison van der Byl <harrison.vanderbyl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fran=C3=A7ois=20Roux?= <info@humanlearning.ch>
Subject: Surface Pro 12in (X1P42100): touchscreen variant, different GPIOs
Date: Tue,  4 Aug 2026 15:05:38 +0200
Message-ID: <20260804130603.86693-1-info@humanlearning.ch>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi,

Reporting a hardware variant rather than sending a patch, because I do
not know how you would want it discriminated and a naive patch would
break the other units.

x1p42100-microsoft-sp12.dts describes the touchscreen as:

	/* ILIT2911 or GTCH1563 */
	touchscreen@16 {
		compatible = "hid-over-i2c";
		reg = <0x16>;
		hid-descr-addr = <0x1>;
		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
		vddl-supply = <&vreg_l15b_1p8>;
		pinctrl-0 = <&ts0_default>;
		pinctrl-names = "default";
	};

	ts0_default: ts0-default-state {
		int-n-pins   { pins = "gpio51"; ... };
		reset-n-pins { pins = "gpio52"; ... };
	};

My unit has neither of those controllers, and different pins.

What is on this machine
=======================

	hid-over-i2c 04F3:4377 Touchscreen

04F3 is ELAN. It sits at the same address (0x16) on the same bus, but
the interrupt and reset lines differ:

	                  upstream DTS      this unit
	interrupt GPIO    51                38
	reset GPIO        52                48

Both descriptions are internally consistent -- the interrupt property
and the pinctrl state agree with each other in each case -- so this is
not a typo in either. It is a genuinely different board wiring.

The vendor DTB shipped with Windows on this unit uses 38/48, and it
works: touchscreen, pen and multitouch all register. Booting the
upstream DTS on this machine would leave the touchscreen dead, since the
driver would be waiting on a pin the controller does not drive.

The unit also has `wakeup-source` on that node in the vendor DTB, which
upstream does not carry. I have not tested whether it matters, so I
mention it only for completeness.

Machine identification
======================

	sys_vendor       Microsoft Corporation
	product_name     Surface Pro 12in 1st Ed with Snapdragon
	product_sku      Surface_Pro_12in_1st_Ed_with_Snapdragon_2110
	product_version  124I:00125T:000M:0000000F:0B:10C:08M:00D:00U:00T:2R:10
	bios_version     9.166.235
	DT compatible    microsoft,surface-pro-12in / qcom,x1p42100

Note the DT compatible above is from the vendor DTB, which predates the
rename to `microsoft,sp12`.

Why I am not sending a patch
============================

Both variants would advertise the same compatible, and the DTB is
selected before Linux runs, so a second DTS would need something the
bootloader can key on. `product_sku` ends in `2110` here and might be
that discriminator, but I have exactly one unit and no way to confirm it
distinguishes anything.

Changing the GPIOs in place would obviously break whichever units the
current values were written for.

So: how would you like this handled? A separate board DTS, a runtime
quirk, or something else entirely? I am happy to write and test whatever
shape you prefer, and to dump any register or property from this
machine.

Environment: linux-next next-20260626 on Arch Linux ARM (aarch64), with
the vendor DTB rather than the upstream one, for exactly this reason.

Thanks,
François Roux
