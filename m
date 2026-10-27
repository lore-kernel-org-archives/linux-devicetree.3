Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102444;
	b=zNNatmGUetJAvkiprxCWm5Iw+m7YF35MfO9w4Wbqx3KGwogGvSVcw1d+5zJ8dC9VF7BM
	 z9PvLlF25b9azCNzB32VZcnQUUeobpnptMheE/T1YVhfWb0ThCfSj7QWpkZndjGKNXjvv
	 oNSOeEx8O9/otrUoCbhpkDU8dxpt74OeopGAwGPBPJULmFNIMT4+5XpdL1Dgf1tcIrhwW
	 0bfNyn6wRyBlC1x+zpez1W+s8FJIxe+0tvXDlUgKwU/3FgrXpurv6Cz8KlhoFugthvhud
	 Y8tkCnai/rgN9S61pMSSe0B6qe3KxUQbR2Kv+1HOnk5u7/lWSR3kkKYc0urf/yLk4KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
	b=whuerRZR3PD3A2p4Y/GPgJQlzBAs72K/DRPitceQMEnv8WeffJDc2+p/EyhxSDqIAP7b
	 T+pL2/fgIopDtaQ5ihAJu7J2awoXJhHFfy9KAD69LXLs5jFqOI6s9qguPV4QiM+VL5NBJ
	 XYXdD26kyGlifi5r7SDM0SNuucFQlWJPXh+z+InYiiOHtQcIeRVmnRo2YPfRSlMkrRUm+
	 T0VqwMf8cy2QJ9uVVwpJ9GsWVIEQv1bGey0TFpy++/PNbyMqY92sZuvhAo2Uvt1HoCPI9
	 mQyZ4hGZBXa/6vWzM7HrxbNZn8W3YaiDVXo09+zypvZfBfOsSN5hv9b8VFEC1APzqDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBMmomfb;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23995606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23995606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBMmomfb
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so6176884a12.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102442; x=1793707242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
        b=UBMmomfbj2Z/DjSKvnujnL23eqaP+gUcQIKIHuZb2TRimkcNNzFUtX4uedUvg7v/UD
         XE/n06vqJED+aa4VxKMc9zLcxSqlgFmpYhl7WWHaarYZpQIYo55qJ5WpZP4vRXubHNn6
         +VIA1vOgufoGjryjPWh2UHMWrCMPZNgMOY6T9Q9b6QJ2LbBSdC0yHPAa36W9QD4MUFsF
         fcjj++1d1mBqdo4lLIQVHrdb9YrVjJP6rjtRmydlhgaD4n4h6Itk3zBVtUjzBfGIWlRs
         Uel4I0aabouVD9+O6DmFg8uWJW71hea87Y9SuQQvToogunsgIs0+POC08uZOoJDciL3p
         PEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102442; x=1793707242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
        b=dZWXOBx4j2dJOg1FJFbEH39zjbVuVRtl36GANzbn/RJO+jNai7yd9tksQQSBoC2fvS
         HcXX6OgFcbQGzRdRFw480tpAL4P9x0Z2bwD8K8yG7zM9KGn4E073T8WnRtKroME4iTEp
         0cILejPpyaljbvfT5LsTpfATGkBlh7Qs3LUE9ZuNGuQMa31jeWLkHFfafOoYh7Yi1qXx
         8Zlqp5HgRthe3plhDJueAh/m50SUikZbTZ976AIakPTGEmsN7AyMBG9fhNMqPfoefqEr
         +FJCIKNuFv9RkMqk7CX9TIIHyPxRv02GZa5Jdn/m8PVzQX3le4WSEtEk42LGs7iTL+X8
         3pfg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ4KfyKFae/QUOrlB9koBtFmqWR8AWe3TxVuk56yY4A3gJhR7r18wBhb8e9H99D3WSTes6cNFB5tsF@vger.kernel.org
X-Gm-Message-State: AFq9FYLrxknI8mqF/p362hd4urJNdWZg80R9qOO02lDVRJWYkdwHsOou
	kqmbN/9bF+4RLjnyoD17OPoqUhbSn3bFcvIWIzXS7TwcltN54+ebzAEN
X-Gm-Gg: AYBFou3+7q1ueigN2T39bRFUH+yQ6AbQraAu+ai3P3+XjalFWqI3mzwVeWlMAIvD3A2
	KiDEX0MpYF1HKucm1iqMY5CMfzouaeQoUnupGhQmFyhkD6PCmWO5Wf2HPibN3CX0z1l13u19u0z
	KF9dU10szc6LBjQJppK+pUKB17Y1sJEWWGdSc4upbS/rnhZwGAbX9e+n92qP86dnNfXXu0djqs9
	JLbPJiSVttv6FV2G2GK2qK4Qet1xnDuKFmNnvcgb9NZkFZPbLfE446EHa5dglDBRNzjJFySzfKK
	f4yRuQ7rPLyB2WW2vS0MP8FAm05SfTlVGUPsWdDv3We7jSccm5SVq68KtxG6n9HEPEFY1bg504C
	98tqkMInXPiAlCjGxUyPFt97dpGn7tRFpidXmN12gJtBuqiB8XnflsgWLs9ygUftEm4I9Ud2Kvh
	3IHDJw/0zGWa+8R2t1HI9Ur6WzBelLSlmmOkyMDz7gu8yyPdHfRhh+4MgYZVYTB/of+T/5BkpGx
	IK6VctBQ32fh+WM2EzG7FuRiL/B0gBgzSeeiDqSFiYyJVhWOA1RPWDNtACmVF1hLKq0XDLnzqE9
	W0HWW4e+fmOL8CYCdASEmg==
X-Received: by 2002:a05:6402:c14b:b0:6b4:2d6:cbea with SMTP id 4fb4d7f45d1cf-6b442fcab59mr6665292a12.9.1793102442085;
        Tue, 27 Oct 2026 05:00:42 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/7] ASoC: dt-bindings: Add/Update #sound-dai-cells to Tegra related codecs
Date: Tue, 27 Oct 2026 14:00:12 +0200
Message-ID: <20261027120019.93611-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add/Update #sound-dai-cells to some codecs often used by Tegra devices.
Document #sound-dai-cells property for i2s and ac97 nodes of Tegra20
and Tegra30 devices since they all provide a single dai cell. Add these
properties to SoC level Tegra audio-related nodes. This is required for
creating more complex audio paths.

Svyatoslav Ryhel (7):
  ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
  ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells
    property
  ARM: tegra: Add '#sound-dai-cells' property for audio-related nodes

 .../devicetree/bindings/sound/maxim,max98088.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-ac97.yaml |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra30-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/realtek,alc5632.yaml     |  8 +++++++-
 .../devicetree/bindings/sound/realtek,rt5631.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8903.yaml          |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8994.yaml          |  2 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra20.dtsi                  |  7 +++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi                  | 10 ++++++++++
 12 files changed, 87 insertions(+), 8 deletions(-)

-- 
2.53.0

