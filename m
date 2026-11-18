Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991400;
	b=jKfixhyfJpxBo6nVtjiHOcNGzDfdPUlUDFr+yorkCt+GGUONerKQCt8qznqRFSduSky3
	 T3zCPVMpMNfVH+Go7wCl4yJpW3tKVyCrNYIEeJ5+ka+2UjDmo8maP1K6REGlxhRIZ42Xm
	 CS+YZWxl9WLwyh+YBkWLGVsTdGaKDGY1lAoqTr45AFCKKSArxVGOdQNAiKETeizVA8JeB
	 Ebegzke82CO/Birj0oOWrEECrpi+YkelTnE815rCI4riZ9l3VvVv17Pbdghf/FiBa2K7o
	 q3uXLQ3S4Jb42GGJd7WhYBpB4Ci1lN8XsjNHOqL7PfLDz2Wcn7/SaKswD93vbsCg9rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Uiee6y3a30eEadPyAu7iAt3Emmqc3Q1dcfvnGm6ZnP8=;
	b=eYa2xTTaLmp1N19pDL2TGWtokD/6CGIcUajJxJ7YV1aObAF9yEeIawCyFg3LrrOGCLi7
	 wxLVpsZHz37QXOZf+Q4ftNJw7bjhSti3UFBdmuTJc4nVBubq5u5UPgPA2uJ2WA8tfFR99
	 ZZRQKNuj11L2obvTK0l9ZEd96Un3uUzmyyEMLkGo381ghL0zP+r6U1OPKF8UGBq1dJbjL
	 y78lYqVdAkZxUB9/xi7NJ4+XZxK3SHr6d6pEU9u8UMNBU9HFdFrouHHFAubLVSE4PJkd3
	 tl6R/Ag6TDscAVJi+k0pGMKiAz+X1uWYEIipzszyYRTGqf8hU0SupYbuRZSuLVsZ8AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMQWgfg9;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A04D606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A04D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMQWgfg9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-382c3c9671fso686790eec.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991399; x=1795596199; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uiee6y3a30eEadPyAu7iAt3Emmqc3Q1dcfvnGm6ZnP8=;
        b=FMQWgfg9Ufza5MksSVOXREguuk7fmboJ/mw1rb0xeAfGk8JHucrbWpuPRdq23IoQNR
         4tQ4xLhMxoi3jWFiVvnxlOw8SrNIWr69OkE2BM8yC5bqik145XrhAZVOO3Hj+grM3llR
         yOZpnt0dLgRkHpq8U6fqmjuC97zrVZEkFT15gLDtieJXxeO1tcrwc5m5iWf691g39ZV6
         muUgqgVaDkUE3yDtm55RdRKQImQ2j0hB3krwOU8bQhfUNPRl+9KmMISkAMPPUyXikOU9
         JW+PA/cIo8J5AW4MxU5HiT+hxG3H9ARpG0oOh6aSuoEdHRVPrk0lANMbG/9O/EATsve1
         fEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991399; x=1795596199;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uiee6y3a30eEadPyAu7iAt3Emmqc3Q1dcfvnGm6ZnP8=;
        b=Sg3ofEW4hV1HsuaNyrk2g2CK/XC0Twiz6SWBj+8Dlksvzk3kESooiA1mh6358W/zso
         u6N+AKcnEeEHb6cEI5sJY113CPHsz6p9DWZDPl1y0kz796+Cje/FL84flGSqK2es9C4v
         mrFkXnn5pZH+lBVOvOKjENdGQ6DL1okLBI1M1vvWWP/StUcL17XVlP5KAMLnwdSUp2md
         SAgTQdsdsGjZIhZ67oUmSWUYLGRG19YclgN2enuz8Sp5O/QTnhk4dhnsuFptkyT0TmTi
         2v8dnyzqPl7EAHrjT/UMb7fwiAfV+5Sy+3znyUm61RuGU28brWHpHN+Km1ryNMAz2c1c
         89tw==
X-Forwarded-Encrypted: i=1; AL+hErFSoXNl1GdcDp/vbRbxjX5penTN56n+I3VtyxJtkgtn3Oh3zxYenNHAsoDTcdNQfKDCPO4ep567wpva@vger.kernel.org
X-Gm-Message-State: APuU4Z//Jr9VS3KhDugskMBdGqJAaQhFsWCvM9j1zuMHhzxSxEitxU7h
	rFXYwZ3obny5ibw3Vd1unxpjyExkVA3KiFLTfX/fqpgptkEtTaQqeeJ2
X-Gm-Gg: AYBFou0DRd10fRa43so3HNFulZXP02UU3ss7+T8DTxGtRcmes5nI84x9zfIZc4A2Uyo
	RDiihtOEoeFKNF7FdM2PgdlXfXd5bSMAO877ikbw5qdvaQywfPYMdR00wmJtVxsY7v9YyH1G8lC
	CDkneEKwLIQ2B4dbq2qC99WCE7TEgk0n4qM9OLy/lnknKv0KgpgEdLw7kEO/qScdyEMuOROgaOp
	ZX/1aBoFWpD5YaZnA4B+jzR45fnL5s+gsssGIleG0GufiK9Ks9JPAy9Rm/QX4cxRB+c6+6RAaku
	KAGBsfwvY3RJS0jFblB/oB0iDb21O8BLAVv3pBF7uPNvBpcUsnqyj219pmZnKRrArqzQryb16Om
	aPTbsvx8rRvaL44+sMg7LY9QtzEKAaZSlDr8liJsStSA8zwts37xZ6+/npo9GsRC5A+cnOVVNkX
	4L0msr29zSR3Ti50Gditku92iSvDyW46/LwiBQIVMG/BT+VgH66MAw770+0BolnRpYX/DqsyYOH
	16ePRQZTuqWP3I0VZ6Gn19B268zpkFvZbUq8i98DVGav5vbnUkyqQjPpW62thVzYrqNZ6csdJyY
	LzclXTW0OB+pxSCmYpeXY82nP+aRZiyyCNqiHMv4OOgd3TCAWhvc/82Bjm+8METTyIq5yY2MYPU
	3Q1HGhA==
X-Received: by 2002:a05:7300:df0c:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-38280d307f2mr2424732eec.25.1794991399408;
        Wed, 18 Nov 2026 00:43:19 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm5508771eec.21.2026.11.18.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:43:18 -0800 (PST)
From: =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Subject: [PATCH v2 0/2] Add support for Samsung Galaxy Note8 (SM-N950N)
Date: Wed, 18 Nov 2026 15:42:58 +0700
Message-Id: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABJl/WoC/4WNTQqDMBCFryKz7hQT2mi68h7FRTSjTvGPJEqLe
 PdGe4BuHnzw3vs28OSYPDySDRyt7HkaI8hLAnVnxpaQbWSQqVRCCIXL7IMjM2AbM/SB0AaPjdS
 ZllaoXBuI29lRw+/z91n+2C/Vi+pwnB2Njn2Y3OcUr+Lo/XOsAlPMVG5vuqkym9+LdjDcX+tpg
 HLf9y9bSRolzAAAAA==
X-Change-ID: 20261116-upstream-greatlte-dts-f29792d1689a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Hi,

This series adds initial support for the Samsung Galaxy Note8
(SM-N950N), codenamed greatlte. It uses the same Exynos 8895 SoC as the
Galaxy S8 (dreamlte), which is already supported.

The device tree enables:
 * simple-framebuffer
 * 6GB RAM
 * pstore/ramoops
 * gpio-keys

This is enough to boot to a shell in an initramfs. More support will
follow.

The keys, framebuffer and ramoops region match dreamlte, but the board
gets its own file instead of a dtsi shared with it. I only have this
device, so I can't fully check how the bootloader lays out memory on
the other 8895 phones.

Like dreamlte, it boots through uniLoader [1], which sets the DECON
trigger control so that the framebuffer keeps refreshing.

dt_binding_check, dtbs_check W=1 and dt-check-style in strict and
stricter mode report nothing. On the device I booted next/dt64 with the
arm64 defconfig, plus ramoops, simpledrm and fbcon built in. All eight
CPUs come up and the kernel sees all 6GB. The console runs on the
framebuffer and all four keys report events. A panic triggered through
sysrq was still in pstore after the reboot.

The test image was flashed to the RECOVERY partition and booted from
there, with this kernel command line:

  console=tty0 fbcon=font:TER16x32 clk_ignore_unused pd_ignore_unused panic=15 rdinit=/init

[1] https://github.com/ivoszbg/uniLoader

---
Changes in v2:
- Sign off with my real name instead of a nickname.
- Link to v1: https://patch.msgid.link/20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com

---
Trần Trung Nhân (2):
      dt-bindings: arm: samsung: Document greatlte board binding
      arm64: dts: exynos: Add initial support for Samsung Galaxy Note8

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts | 124 +++++++++++++++++++++
 3 files changed, 126 insertions(+)
---
base-commit: 65ffdae53a6d522519fbd66d3cabbb4622e3e5bc
change-id: 20261116-upstream-greatlte-dts-f29792d1689a

Best regards,
--  
Trần Trung Nhân <nhan.094.vn@gmail.com>

