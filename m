Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch [109.224.244.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B41A378833
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347226; cv=none; b=rRVpy/TclsSYMqBKxWMiD5E3OAs/UouwrwaUCWgJey+IsP8phIfOTqpCiPIYVBm0Pc4NR7JvWbq7EGue+nBKkbnln22ItzgeQGtcTmWkk7jkG27spedN/q9gp6GzkmgV0BACy/czp1saM4KXXasxJ0+9Q85a+zLKALVNIszP3BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347226; c=relaxed/simple;
	bh=rg3Z+pRakkzbf30JB14rO0FWuTatMEjtnrWu4Ub/HTE=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=nV/BjAPGZ8Oj1Mgkj2TE7zGymyBdhQMcKTM4qOHSYGYZfTpoeTD1uSzTEg8bugyiYHipTvpP+nEnQw69KQLqN+Af3Ck+UGHW80HXn95INBssa5v2VKJhM6LcTyYa/GS1PxD4W0LPaNFeSVK9WcPHULUv7axWJFeLPwtz3iVsFC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gGEGkS5i; arc=none smtp.client-ip=109.224.244.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gGEGkS5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783347214; x=1783606414;
	bh=uE4IWleZqdvv7KCr9CrJRzZ5cr0T6rRxWZKKOvrK1Ws=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gGEGkS5izSCVrJStEsw/vK3WRXGpkUCg6G0Ke60Ph4BilLhEbxUTLJnAJy37on5JL
	 BqfFTCwiOXp1Mak9l7PMheax17Ppqd8KqnJjTNGcdRJ6x89iTNB396Muv/j8ijnn5y
	 rFtPgG1tqTCXWepRmRadWa7VFV7on4BMdNJ8N/9CW99qYEoxt9SauoBxsNXUkQPksF
	 6pXHR1+0DTDrXP6y6MlloWV0sNMSwFdLSgGOvDUKHkvpdj5zLR6ZRkVqiRJ5vg2EJ0
	 AyaDx3B6VF5Q29/BOtaQl2idzffiMYnYRpd5j3z39YATxXkmKEtsXGHlBkvyL0HzJY
	 Gb3j6ANh+4pkA==
Date: Mon, 06 Jul 2026 14:13:27 +0000
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Ivan T. Ivanov" <iivanov@suse.de>, Stefan Wahren <wahrenst@gmx.net>, Andrea della Porta <andrea.porta@suse.com>, Peter Robinson <pbrobinson@gmail.com>, Stanimir Varbanov <svarbanov@suse.de>, =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Gregor Herburger <gregor.herburger@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>
From: John <therealgraysky@proton.me>
Subject: [REGRESSION] Raspberry Pi 5 (BCM2712) hangs at boot since d87773de9efe  (arm_arch_timer: default to EL2 virtual timer under VHE)
Message-ID: <oTZ1wsFlcf4l8zMuD8DYCCvff35nVbFn7gTb5_vrUPSJtjVBSTmGti8S3KnbVdVWJEzP1QRbWma6UYYXyi6v2J0fl61khniPROEhsdxMIz8=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 350a441ca159c5210a100d3d20d946c897da99d8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Since commit d87773de9efe ("clocksource/drivers/arm_arch_timer: Default to =
EL2 virtual timer when running VHE"), the Raspberry Pi 5 (BCM2712, arm64) h=
angs during boot on v7.2-rc1 and later. Reverting that commit on top of v7.=
2-rc2 boots reliably. Found by bisection.

Environment: - Raspberry Pi 5 Model B, arm64, device-tree boot (no ACPI) - =
CPUs start at EL2 with VHE - Mainline v7.2-rc1 and v7.2-rc2

Symptom: - Silent hang early in driver probe; no panic or oops. Boot banner=
 shows
  "arch_timer: cp15 timer running at 54.00MHz (hyp-virt)". The first blocki=
ng, timer-backed wait during probe never returns because the EL2 virtual ti=
mer's interrupt is not delivered on this SoC, so clockevents are dead. The =
softlockup/hung-task detectors can't fire either, since they depend on the =
same dead timer.

Cause: - BCM2712's timer node lists five interrupts including the EL2 virtu=
al
  timer (GIC PPI 12). The new default trusts that entry and switches to the=
 EL2 virtual timer, whose interrupt is non-functional on this board.  Befor=
e the commit, VHE systems used the EL2 physical timer, which works.

Possible fix / workaround: - Removing the EL2 virtual-timer interrupt (GIC =
PPI 12) from the BCM2712
  timer node makes the driver fall back to the EL2 physical timer (the pre-=
commit behavior) and boots. Whether the correct fix is in the DT or in hard=
ening the driver's PPI selection, I'll leave to you.

#regzbot introduced: d87773de9efe1df6fe2ba379926f9df92f1a5913
