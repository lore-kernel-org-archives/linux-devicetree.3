Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B593E5ED7
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 21:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755316; cv=none; b=ckieP+dS6d50NQ48EF3FTrszLgubcTlRbPlEQGabjouZJvam8X9HtcrzZWHIr+jAJlBxZKGgrQSoNYnxpfPz0PtTRvsp+NvK991OTOpwCHOsCpbIYVu/t9SKf/gcPqJJF/5Ym9vUmKUIWcmSFaV91RVE1aLpIdhIFqK2Cc4Jw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755316; c=relaxed/simple;
	bh=qL56l/74i7UPnkj0GLxOV/StLiKn6Ktn+Ot7xproics=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JzYNOA/vlPeh3w83iZB7UErv0EZNPEq8xTON+CSrzClZGLyk+vu+NOkgCuNpCaDFjzFkBOHMlmQp+z4fgOvjEonMVDEraS1KoQp6ViiUBAaU4fJLj2pFPXtEPr4Zc6Ekru+a/lCJ9mD7UBPNetuZqTLUEzGX76yYayXP069ezIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=x5bDV2lD; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="x5bDV2lD"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5338c1197easo10462841cf.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 14:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1791755312; x=1792360112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFJLfz+4sRUNEqtKCFfthYjnWFBYCE3On80t62/yc6w=;
        b=x5bDV2lDtBrgXaC5lmeZz/tTzTvLRxaUk9m1Qh5HPjizFera7HiyiVdhHLUcDodM/F
         Ao8tUXFgbGUrsI1OYeKmTpr2JFFFOEz2RE7BCdEGnH11vsMc317Jy2e6iAxeHK5DKgge
         mxmvgpLNL69TvCQ/us3UJvs48BRxuYACVQwLtNBw64o58nFZFZdqGtMB4Q357VWWLHRr
         wgDkgAmpBtGeo4lJQsJXhVUy/R7bhkwt3Bx22evvRy+JrXf6tjjygovfs+BmI59wXvXp
         RoshgizhcOwjBVqFlQSVsPieBLo/z4MNrWnitXu7qFURjPSclYaG1XLVInxNlOURd3Ld
         BqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791755312; x=1792360112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UFJLfz+4sRUNEqtKCFfthYjnWFBYCE3On80t62/yc6w=;
        b=Plzu/IoyRLvfB3Z6MeemD6+XQnxO2xc7jYLY+KRWV0g2x8tcy6gWQFSj6et5mq2yUT
         oCvPtpWE9Ias/yKhdrZ5EPOAZOmnWNblMM1u5hZ/+YpMiJVueKxlIrqsdcTkFOowDa7Q
         mp22UpDDBO+WwrJZwYHxB4wK948V9uq3KF9Pv6lEHaPpGVIU7BEcRXG0CXIOOe7mFcNy
         3VDpJ0jyA20WFenwpERfBzGUQ7dSoqFmyo3swILbWTk9aqfnTNMDwhmpppRcVoncJ5mt
         Hkp8vi/V08ck5KnT0tRy0roVDqG/cakjJpqnxBACoNLcFnxg6Vp0V4UlRk3LUd7OOHxG
         O7fA==
X-Forwarded-Encrypted: i=1; AKwUvBx746P7ueuiK/jatbHteLfagFHRoE48oVktkWUmGBz1o2UfXZ3TXJhrrYEEhSH6A5lXxBRJcUCq/P7X@vger.kernel.org
X-Gm-Message-State: AFq9FYIyvVTmOMqEOyN66JBUoMGGVVunesMkSokx3I3HLCSQc3k4TLu6
	nzcSbFrk013M3NjdbJu47jG8RANVCgNsFzKIhawCDtqwc0vttStgLvaKWZWgPqCktQI=
X-Gm-Gg: AYBFou17YwNuHuVjPP72J7Amd/efieAukQrTFPsfVonWjnbnblvoNYVJ2A+61IsQXPw
	PvqKFRxcTyFEHT9uzPhGnSbw+zP1K/sexE5gSNMFrtJSJo7PKekZVoReLdn+vMgTWgtq0IQoHOY
	MkhQZk661uBM18Lzb4aCRG/XBV0x0vD4P95lJacthv2A6j2fOGCODhB23PFo4yT90zv8oWdapiL
	d8rzZGLr/F/cZgtic2abXXNbMnyYf95IE75Gl0r83HLZK08dXhVJjWQtjDWkrhXKBl1dL5hzev1
	tkkwIEPVeY8TvdptKNVNNyB9VNoyiCwtwzEssHu+xOu1wlvRAdiy2pz6JX+3JQYGMLf5jGqiR1Y
	FYvRMoXtSuIVebtMHwVxW2c95br96FtJkAiZ1h5vEXH21AKK7jeNWvN2l2hTEbyhkIVy1kQGGot
	WAT6Vcy+jNimyf1XULlyPyDWMFGrEOUwg5YJmYvXjy4iwLbYQ=
X-Received: by 2002:a05:622a:144c:b0:533:3bf7:49f0 with SMTP id d75a77b69052e-5359fa8cf25mr138217211cf.25.1791755311784;
        Sun, 11 Oct 2026 14:48:31 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm65857371cf.30.2026.10.11.14.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 14:48:31 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Tobias Heider <tobias.heider@canonical.com>,
	Val Packett <val@packett.cool>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-hardening@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/3] Introduce EC driver for Snapdragon X1E based Dell XPS 13 9345
Date: Sun, 11 Oct 2026 17:35:28 -0400
Message-ID: <20261011213528.13207-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011-dell-xps-9345-ec-v6-0-2a66a364fe70@vinarskis.com>
References: <20261011-dell-xps-9345-ec-v6-0-2a66a364fe70@vinarskis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 11 Oct 2026 19:50:07 +0200, Aleksandrs Vinarskis wrote:
> This series adds Embedded Controller (EC) driver for Dell XPS 13 9345.
> While EC appears to control most of device's peripherals, particular
> driver addresses power and thermal managment issues.

Tested v6 on a second XPS 13 9345 (BIOS 2.14.0), on 7.2.6 with the
PMIC5 Gen3 ADC and ADC_TM drivers and the board thermal zones [1]
backported. The driver probes, gets all seven channels and reports to
the EC without an error. Two observations from this unit:

1. The two GPIO thermistor channels. Here AMUX3_GPIO (0x14c,
   lpddr5_therm) reads the top of the conversion table, ~130 C, from
   boot on, and AMUX4_GPIO (0x14d, usb_charger_left_therm) does not
   move when a charger warms the left port. AMUX2_GPIO (0x14b) does,
   1.6 C in three minutes, and AMUX1_GPIO (0x14a) reads a plausible
   board temperature. Windows' ADC1.bin puts SYS_THERM1/2 on
   0x14a/0x14b, and hamoa-pmics.dtsi in next defines those two. The
   patch configures no PMIC GPIO for AMUX3/4, where mainline sets
   pm8550 gpio3 and gpio4 for AMUX1/2; so either the two thermistors
   sit on 0x14a/0x14b on this board, or AMUX3/4 want the pin
   configuration. As it stands the EC is told the memory is at 130 C.
   The fans did not react to that here, at idle on battery.

2. Resume. With the driver loaded, a key press wakes the machine
   through the PMIC power key: the EC has powered the keyboard off, as
   the comment in the driver says, and the keyboard delivers no event
   for the key that woke the machine; instead pm8941-pwrkey reports a
   KEY_POWER press and release at resume. With logind's default
   HandlePowerKey=poweroff and no desktop holding the power-key
   inhibitor, the machine shuts down right after it wakes. With the
   inhibitor held, the resume is clean and the machine stays up, so
   the resume command does its job. Without the driver the keyboard
   wakes the host as an i2c-hid device and no power-key event appears.
   Reproduced twice; GNOME and KDE take that inhibitor, so they would
   not see it.

[1] https://lore.kernel.org/all/20261006185557.23016-1-lnicoara@thinkoid.org/

Liviu
