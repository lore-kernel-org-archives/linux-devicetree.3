Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F637E2EC
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972957; cv=none; b=eSEKvy8ffIpQqFRXdxY8ojdifenuB2OmQNFskV+kABy2D+2f/iv2mBeJinnygQXzKIz+ZzteOJMI2KFXyt8IL59jnAblyUHjVMNHg9gPPxDirSkgpSIl0joVEIch6YKgGtM+Jw48yCUG3PPpuT4/8meGY+jTDcnElb/VYQJOqy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972957; c=relaxed/simple;
	bh=eUMZ87NV33PuB9LUaUM/naiOBmn+tD9ZFBu2hpBLxYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nF4vHdDrU0FowAhu6ebtEaVhpEXMkeOlCzbAI8PQMyNaegtK7c8rg77EWvZZTubKQgsu9Ik43SrqomPgUXVqhs/dhqRxQCKXLpV2JHSMx17BbtaPJDddTRfm1aNNjslC4TMdcEG3peE0cPKUFSUTEGUwRYwAK+fDzKLO+aZG8m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFrYv/wF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFrYv/wF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caa57a41cdso2932665ad.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 23:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782972956; x=1783577756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqx48+kqpZ0s/hT5sa4Ozdd9lXIMEabBEF53/1LSHnc=;
        b=CFrYv/wFHlthB3DGI5x9q6lN2XR23hDbhj2eDqngbUofdyxuWv8pPi/F/S8tDDbXIa
         tTcefJ/1GF+uJLPAFAiANRC7vy8pYXR77kB0Qb7sH1Wn3S9GedxVokRqrzoK2og3nYs9
         66PfPK4l5vnYM4Q4f1beCwAMkRle09xIm3d+nMzYLX+Sa8cf7v8M18lYAz2u5HeBBBG9
         1iAWAxv+arXkRkhEdDkm2CLhnOScUOwRLE2aIRWcv6dOlRS893NzH/jewXnglBAxnDko
         +c3sk5VjILiARgGVw7Ky5RCA3uzlgRMS2i1tkpGTHwv2XOB9mfzeM1Gttwh8KYMmIwLL
         rS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972956; x=1783577756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqx48+kqpZ0s/hT5sa4Ozdd9lXIMEabBEF53/1LSHnc=;
        b=fpPc6BQwmR4WTzCeL1fl2/TOKB64vNkbwXSt7j/hf2qdwmL4PE04lStGbwxTZp0Dzv
         rC0nt0bjxxM8+bfvhcsTVr8Dr34TcJHDh1bwg7H0EiPafYk87tlWszwYVvlsfgCcLTgB
         6CpJ4XQICFN6fWlN1aZc0M3cMBSWKG3ywQqUmVpGsjBkwz5y12jKMjpBQDoJfum5Lt7C
         fFTgpQposlVVE4hEf5QZAMxDGGf9iMorrUUMUeNmc+Szqtg0JZv6HvH1vcIJUfK7mTvf
         ldrseHsPW6udYWLL5eRJ7iICg+BKV2GTc50+a5LKn7lS3rLA4OE6HDowvbBnHKAnXYEC
         yAJA==
X-Gm-Message-State: AOJu0YzgvH3EaQQgIFy2BP+jGgKfFUhg1DtC2hb0W3EX8ag6qX4pv4yQ
	wTpdk5LVY5neC8A9CoLFRrNFSNkss3vxYyIe6F5vXquZKa76oyOoGB3PL/4h+1y6ZMI=
X-Gm-Gg: AfdE7ckZx4NPEmi98WXoBObrh2r/bXZ0On+h7Xewe/UM9W5yjveW3W6CnxwYPzCbx8x
	yZGKonbGfgDiTnO1OVhf5PnTg0IeMzcedGXdbsQqWcxlT7T8ZjoXRJ9Ck6+/C+DaLXJbfmw46tN
	QY0SRo7LuRjR1YjgGQ/on0hmSMV9jZLm6Mst5viLpYqH00EfoFh0gCnPgBSS23Xoi9YbEj2Cj7g
	NaFXgVbaDlCf2KMoPlbbZ3GALOxaPevVhMf1REMntBh+I0djc2SuP4s5lbX6ctJhdkdjRxGcpHy
	CdQZgQWQhNc79NLPoBbrB90rDUfyqR5qnrkSb+/ds91kJctwvqkj5/kIWP47Pa5ugqBTZs2I23w
	oMSqg1j1veFg/Fg8X/hqxGHzU9dpaXokfPeWWBPIsja+Gf2DqdgOgpov0vko1px1lTrKGvCjmwA
	x6xw==
X-Received: by 2002:a17:902:d4cd:b0:2c9:bd64:8c81 with SMTP id d9443c01a7336-2ca7e6d9f27mr47085905ad.18.1782972955650;
        Wed, 01 Jul 2026 23:15:55 -0700 (PDT)
Received: from ada ([223.119.20.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa052d5sm8316025ad.78.2026.07.01.23.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:15:55 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Thu,  2 Jul 2026 14:31:54 +0800
Message-ID: <20260702063156.35169-1-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.

The work started with x1-crd.dtsi as initial template.
HDMI refers to ThinkPad T14s.
Bluetooth refers to x1-crd.dtsi from the ubuntu-concept kernel [1].
PWM brightness control refers to Ratizux's GitHub repository [2].

Tested on linux-next / Ubuntu 26.04 LTS
       
Tested and working devices:

 - NVMe
 - Keyboard & Touchpad
 - USB Type-A, Type-C
 - Battery & charging status
 - Internal display & Backlight brightness control
 - HDMI & Type-C display
 - Bluetooth & Wi-Fi
 - Webcam (usb_2)
 - GPU

The following are some known issues:

Battery:
Battery status works only when the following kernel configs are enabled:
CONFIG_BATTERY_QCOM_BATTMGR=y
CONFIG_QCOM_CPUCP_MBOX=y
Or the battery percentage and charging status disappear randomly.

Audio:
Neither the internal speakers nor headphone jack are detected by GNOME,
and both fail to output sound.
The sound card seems functional since audio playback via Bluetooth works
correctly.
Also, when manually enabling speakers via alsamixer and then running
speaker-test, speakers can only emit some electrical noise.

Fingerprint:
The fingerprint reader can be probed. Running lsusb shows:
Bus 002 Device 003: ID 3274:9003 Generic Realtek USB2.0 Finger Print Bridge.
However, currently, the libfprint in Ubuntu 26.04 desktop does not support
this device, so I cannot verify if the device actually works.

Corrupted Display after suspend:
Internal monitor, Type-C and HDMI displays would break when the laptop
resumes from suspend or after logging out, displaying corrupted graphics.

The following are some reference details:

Bluetooth (uart14):
I referred to x1-crd.dtsi from the ubuntu-concept kernel [1].

HDMI (hdmi-bridge, hdmi-connector):
I referred to x1e78100-lenovo-thinkpad-t14s.dtsi.

Backlight brightness control (pm8550_pwm, pm8550_gpios):
The configuration of pm8550_gpios refers to Ratizux's GitHub repository [2].
Although I could not find any hardware information to confirm this, the
backlight brightness control works, but it is inverted.
Since the pm8550_pwm does not support "PWM_POLARITY_INVERTED", I used a
descending order array for the brightness-level.
With this workaround, the backlight brightness control works as expected.

This is my first time trying to upstream something,
not sure if I am doing everything correctly.
Any reviews, comments or suggestions would be greatly appreciated!
Thanks a lot!

[1] https://git.launchpad.net/~ubuntu-concept/ubuntu/+source/linux/+git/resolute/log/?h=qcom-x1e-7.0
[2] https://github.com/Ratizux/linux-device-acer-sfa14-11.git

Kaipeng Zeng (2):
  dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
  arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1711 +++++++++++++++++
 3 files changed, 1713 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts


base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
-- 
2.53.0

