Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792878282;
	b=J3nMZunPGgb1AnMD2KJ+v2w57k5A7OOk6bgc6Wjr8UNRlQA3nhgbcdoqAWfO1oLB7OgH
	 2kqfhI8BJ07+BYuxhfQ437DzJvc0rlHKIiH2P/a0S2MjmMDW7UyEAtR/wcdCSEk5z8MvP
	 fBJMLOFemsnPAnrqIlx6KoGD+3AFU02KqtWnqYpL1+SvJxgctRKTMOXYMpgl1aQdAdHV1
	 +ebk2H9qNK1GwOYq5cdcVq6WabeV8WneMQAGVrM3ds/FJrnbuW9tbX9JOKYEJvdlQeQFg
	 Gj2vCDupzF+JZCQDK7ljgA7AwnFQlCsnFky7VYuTTpY2bkEcAsqeXwJVBkCEXcKTRLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792878282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+1qrwGO4vUyqJglxRfagf9rA3ylSrmZ6wtpakT3V5ZA=;
	b=eIIA8mcrzYZ+6yHfkvx7jxoRzdNiaQX4LtGWW1HURFKB9uhi8rRRseI0NfgAAiyAi2OC
	 F/xwKHDylMysfEu2/vrbktQJybO4ew1eHRkWn2UkfpelnIMjhoQbQEjjgO5rnF7LpWiGt
	 6WhAIwDmJQsArkDylWULOjFVZ5d5ODLmNA1fD2L7eTx7ZyOa+dxvDXEJbN2EEsCYByhWa
	 jkVG/tIeAz6Kp2eEbQRwt8UAS1iVwj3QITEzYE9vsglMO3KCJakKUN9imQvFtYsIVDosK
	 gra98DFjKbUO33RDCJdTekbuH7dfZ2lG8L/azXMPmy6e8qC9hk1vpgYs3/JAkH7BeyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kg6wz1St;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2753606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 21:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2753606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kg6wz1St
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so249255e9.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792878280; x=1793483080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1qrwGO4vUyqJglxRfagf9rA3ylSrmZ6wtpakT3V5ZA=;
        b=kg6wz1StvZeFIZRvDNOu3iwpYO76N+zpDAAteho38xZvyhz5w6MXvb7zNdhj0z/11w
         xyPfY6wkx4vKHDbuiYSPSyuzAPNkaHMP2qhe81rw5Ln6fS3jzBmC5GeNPf3xFyu9gfMn
         Di49GIpvUgeajEW309DN7g1NOgm30kYyX6mBWdG/GiS2XzsaOTHQqYTkS5z2rTd8kk7W
         JEW08VSARkuBEhU0usof+UI8/++JARTisdBCmFLy76Zb1PhzPtA7KbK2m1HcfT6vJTW9
         zdmJG9jSbVhE2Zv0zHFKSqzg3CAgn1mFpHc9YgPODgjmlmG8DMTzX4WH4ybyffYWc7xz
         iZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792878280; x=1793483080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1qrwGO4vUyqJglxRfagf9rA3ylSrmZ6wtpakT3V5ZA=;
        b=fSpXlgKu3CKL8M/e9d+HNXrfVTKZsX+D1mTKENMb6P/loUzZRFwUUPrQ0DDeoo3GPf
         f1rYBjScCIILh/BhIEmSF8IIE5kYKer/hYWTrNX+fABI3/Q9hDTxwCR3jFbp0iNI0Wz4
         AKcQCO7mNCkt6R/sg7ORg1WJBPW/GaiZaRNzEkXsC+EY3u/u+/WTAK8QQLsb56wMiq5D
         CSERcmqccGHPvKVS4bisqCLR2px8321AKp35f3mNJP8d3LEZu95Y16xiCEToY0HKnJSW
         hiUzPuMM8NTp9C2OOOPqLQ+YJBEEn70l99UUPyACB3BW4vaLik/YdJfWm68LrzEGsH3v
         1Ncw==
X-Forwarded-Encrypted: i=1; AKwUvBwV0CP6iBKni4He8AdopztW/3DYocAgbKNkIlGxGsR2QLIxmoiPTzwDJFkXLr5SMStc/nscdQmgVo6A@vger.kernel.org
X-Gm-Message-State: AFq9FYJtqmhXX1wVV9tHbEMOH2WqFxI0zT7+LFcEJS1PL7hkJ1CNOijS
	aYOPLnZ1E7vMHwUSI1DAwHvR/FKLfS+l2VHKE68LgoSbvyTr8qd+hHN0/T0QearWL/E=
X-Gm-Gg: AYBFou1lDZMmNhXnwctfKj7a2+03qqOH5FyG+yedF5mBrQNMo3SPboDxFLuUFFljhCS
	EW++Y6/SmlewBkPLPD5zUT70biU0dcU1TWmLAwAWPnSVKI//KWyaf4tthbS+BsHRq0A04fnEJhF
	Udo5F6ylzOYzEy74EpKhi1oEjlfohwBNn5ye7IOtHYpjiD5+q/A1pRgV5KMiVs4Bp8sLrH3ytKU
	5aJEHE9cbwbpYARtk428VMG21BDDoSdVAa85ZjvUJ77SFkReJrWGuEc/ZoaLfzbTle8dkbzyBOP
	AmQBJEMR0Pia1VrjlBSZSfT2S1Ynw9XXlUy9jWzXRFwv9rpK+Ztg7GS6yQLts+I0MdD5Wgs7B9p
	DdCR0nXVvqexlyFezycQAot/eTSe3t5TDKJytgmM+uhWpQR2p2sPUro3flFI2VDpuy/QwhI6Knh
	i4WnGmUb0omUbZMj8/7gVPDmUgCYFL+pp560McnuIYaQZM8jy23WmI0OqNtggB9CqMqIBmNkDFl
	nf2zJzuQDUi/iJnAnWcm1IWm7q5LjCznh/Rp5BNj4fD1L63f4Q24kWCsTcRqpv9fTbByUMRE1DG
	koDXY0h9ivRyTWp/5BoAL/Kgz3T8gllZjN6NNeFba6A+hf03VUsfCbVQJxb0wp4b4JV6GoGp4g=
	=
X-Received: by 2002:a05:600c:c490:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a35aeb0eedmr49803455e9.17.1792878280151;
        Sat, 24 Oct 2026 14:44:40 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm80447905e9.15.2026.10.24.14.44.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:44:39 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 0/2] ASoC: jz4740-i2s: Add the X1600
Date: Sat, 24 Oct 2026 23:44:36 +0200
Message-ID: <20261024214438.33342-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's AIC differs from the X1000's in its bit clock divider (the
divider itself, even values only) and in how it plays mono (a channel
count in AICCR, no MONO_TO_STEREO). Tested on a HiBy R1.

Changes since v2:
- The channel field is bits 26:24, not 27:24 (bit 27 is reserved), as
  Nikolaus pointed out from the X1600 programming manual.
- Don't set MONO_TO_STEREO on the X1600: bit 11 is reserved there.
  Listened to on the R1, a mono stream sounds the same with it set or
  clear, held clear from before the stream starts included.
- Commit messages say what the manual says, and the X1000 is left as
  it is.
- Rebased on broonie/for-next.

v2: https://lore.kernel.org/all/20261023152011.85407-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  ASoC: dt-bindings: ingenic,aic: Add the X1600
  ASoC: jz4740-i2s: Add support for the X1600

 .../bindings/sound/ingenic,aic.yaml           |  1 +
 sound/soc/jz4740/jz4740-i2s.c                 | 48 +++++++++++++++----
 2 files changed, 40 insertions(+), 9 deletions(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
--
2.39.5

