Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B4528F5
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791418062; cv=none; b=qsQtvY4hW4gC6Vmrm0PhyJHyHgfnyObm2jRuwqK/Q40ZuCMN3gSMfDklcmleoPRy3Rw/lYnlhaxyvsTDKjiQBEdscKgKnSysVtxq12DUC+aAPuIkwQZrDyPNcPB6eBQeWbibF3SSWPotJAxYuop3oWIPOfplBKe/1FFKXvrDGCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791418062; c=relaxed/simple;
	bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lsf7naCs9ahNzgC2zNaxNzh/Aeg2j8mM/2VNsRKEFX0EgorHhEk95cKyqJaNOle89lp6OcwEtgUKGlPYdMiaX8VB4ySaDq07Ukw7QWgIGt4iEOldBV7r7dDfvzubAF1L4JF8bo5CpnM7nmtYRpj1zHYCpLvVUAuHWSUgFe4zDDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG57klW+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG57klW+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2731723f8f.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 17:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791418059; x=1792022859; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=;
        b=iG57klW+wzwbJiwL9z7I3Vw0Gb4EvVA84WWSsEKl51G/4OL5Ia4iOj2mF18kKc7baJ
         O9O8d3fTKBxnm4duBRTdAIsxowZnA6lMNGRiFG5RpKITA5k7iPb+YaGkV6QRwZw74Ael
         yL/3hWfWMjnMVVRyPRTz7jOEN34pEvl7OFRBBcRzOM+lr+GYKaz2Qx9Ul8rjaD5aSOZR
         9Q4qFrnTBW4mcU6KOvM1gEvLuEvhpaO/beq+PIHhYvuC1ptPJTcHPY5TTbB0CRQkNQeL
         zzs0qGWHVlYC7jq2o7qxrA0dx2flDaKHfFy51Qbs0HxrWWjFGHr04LBN3DoFtYzzt7gg
         JVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791418059; x=1792022859;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=;
        b=xSvGeizmPNwr247tVZFPQ6qkylKgmdnOTNkEot1BtNFBpdm3EtT7EUKW8cVL2dhRcu
         0iyV6YSNHcOC3fscGolBZq9PmzYbb5kvO5R6b6LaAz2lljMrOQUAO16Hs/Akg8X7RpOJ
         AVrQoBL9RTDJbp1hLb+CnzT1qHpb2FxCzhhy75Tn/GyUlpPzN8m5pA5+OSf8qIK2Ntjk
         V2B4qlU8IFopp4y2wo2f9rjLI7kIWY8HBnZJWydvcjOjQ8vPPJTxIst0Ht1Liu1j+iUL
         2DNqIRmPKG6xawW6iDqpFq7ouTnj3AruPTInHkmKSD3xohAnWRvvDBn/VH0q9NpNqK9E
         FRxg==
X-Forwarded-Encrypted: i=1; AKwUvBzfwI+AR5obnTbeZSalbH2f1Tww2+68fAUZpyUgQyz52OOjKIJp67CScSbCG7E47ICACR3/lhm+G3IN@vger.kernel.org
X-Gm-Message-State: AFq9FYLviV4XaJu0ETfb0zqX+cfqOIH8QFVEN2Odyo05Zx9PMmdJPtB9
	mXYSYErOr/neI9R9boZ/8URQZ85NwQmXnetewtu+5tG6C2+x7wt5p0wC
X-Gm-Gg: AYBFou2tf6AP6I/pcziEkDwhEgjXPPPrOaE1gb9LZa1oxHoXQqAMiI1ODO5/VHNCqUt
	3mD7yCYzAME6s/VNDjzLi1uXL7poWrbG3i9ZRYJ41myXAfFUBqqV0U728Quhw6do4ev9qcuW/e0
	zV+SQC/TV0ymocO3NoisntPIEuRwPf32REHpX1RJUaTtAZrv3LZV8IpNwTrbVXPyVOMy0Fp5xty
	0DmU0WKRzdAoNb+3c19UkbDxIOpjRA0SJXgKHadjuDFfZt67aEnmM1pxVGcHSwEafP5lKOKzcYD
	LZ2OOyYHoG6JZyTSA9IOKt5dLI8q4mu3wRLThJzSOsgUAw0bF9AJYmXS345QhZI0GjEspDFMC8u
	EFUTjp7BF/fuvFzue9GaTyEZGvFZhgakiG5A7SbBnaq1p4Db/tjhjnDxCDuLvrvEK+47iLdx7Oc
	9Kh11jD+zCr4YTup7pWVzKwfbCQXTWcBw7s8pfUUOSRAIJpUWGS5mhhFhWT3ZM1KC505krnn+ul
	7/imfblMu1EZCdX4gedS1ekF+Kp
X-Received: by 2002:a05:6000:4818:b0:488:8751:e78e with SMTP id ffacd0b85a97d-48c72788373mr6736354f8f.16.1791418058790;
        Wed, 07 Oct 2026 17:07:38 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7fb9eda1sm1040996f8f.7.2026.10.07.17.07.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 17:07:38 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card be
 powered down
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <179140715034.293470.4459182430175564610@iav.lv>
Date: Thu, 8 Oct 2026 04:07:23 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dongjin Kim <tobetter@gmail.com>,
 Eric Neulight <Eric.Neulight@linuxdev.slmail.me>,
 linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD1E9AE8-8FA9-4CC2-AED8-AB2F455FA8E2@gmail.com>
References: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
 <179100548183.3372253.2014593916926884551@iav.lv>
 <179140715034.293470.4459182430175564610@iav.lv>
To: Igor Velkov <iav@iav.lv>
X-Mailer: Apple Mail (2.3864.700.51.1.3)

> On 8 Oct 2026, at 1:05=E2=80=AFam, Igor Velkov <iav@iav.lv> wrote:
>=20
> Follow-up to the dropped patch.
>=20
> An out-of-tree restart handler [1] power-cycles the card: it drives
> TFLASH_VDD and both tf_io lines low for 100 ms, then releases them and
> the card is powered again. With the SPI flash erased, ODROID-HC4 boots
> from SD after a warm reboot 5/5 on 6.18, 7.2 and 7.3-rc5. Without the
> handler the boot stalls in the ROM or in U-Boot.
>=20
> Where should this live upstream: the mmc core on restart, =
meson-gx-mmc,
> or a board driver like this one?
>=20
> [1] =
https://github.com/armbian/build/blob/main/patch/kernel/archive/meson64-7.=
3/meson64-reboot-02-port-to-gpiod.patch

I=E2=80=99ve been doing some bring-up work on S4 support with a VIM1S =
board
and Claude initially suggested a u-boot variant of the same patch [1]
which improved but did not fully resolve the situation. I was also not
able to explain why applying the same change via the Linux device-tree
that u-boot consumes didn=E2=80=99t have the same effect as essentially =
the
same change in the u-boot dtsi file.

Claude subsequently added a second patch [2] which resulted in 100%
reliable boot. However that allowed me to move forwards with kernel
work and I haven=E2=80=99t yet circled back to u-boot to run an =
experiment
without the first patch.

[1] =
https://github.com/chewitt/u-boot/commit/0a3f5693a4ff192eb044fc4c5a434770d=
e053835
[2] =
https://github.com/chewitt/u-boot/commit/8e663632bc500ee6a83a846bcd3242231=
c33aa43

As usual both of Claude=E2=80=99s authoritatively worded descriptions =
sound
convincingly or conveniently good :)

Christian

