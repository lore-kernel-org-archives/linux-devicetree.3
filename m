Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4303942F6FA
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362015; cv=none; b=gkh4Jgnow3s5K7uU4PmueMS01eYhUoOTbxWWkiIuLE6ZXLnSQcAkMvCoLvfhV4DhAartaxlFLd95P5H6DwsKZHOTw8fzNcl9aGgCY7wcBVRjK1ckDgbs6sxSjxflusGR0eMpcEmw9ZQVQMryfyOl59qqFYPidDjP61GftgITGLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362015; c=relaxed/simple;
	bh=nAWvF0NRtn6Rb1Gw9Fb5LrsP6FPPefqqvmqVqbv1Jcc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AuKbs8SDIO+gBR5KhUNvjvGAgCCQNaLR3NkxQiSrR9h9NHE9Jy5q2DC8tLVLObeZSsrh6wWbfQcBVAMjI4qlial8u2TDIR6E1BT3rKK72Ph0EuTwV8cqfuDHwZHQPfwP5Ofs1iQDrPM++u/LGY4zdhXnYQAtSfPZahFaJPG0mHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Uc+ziwdi; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Uc+ziwdi"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso1063966f8f.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362009; x=1791966809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxcGgnejISp1+VB6bpLIgoBBJ18yCkjKzQQ5g+qkFis=;
        b=Uc+ziwdigLmst40jpcmnLxoqS5kSV96Gij+bUQp5966AsPvlGDKPHuyuP4oDPk60ni
         HeuFc+wYmYHXjd7XpSuILbMigBPukwb50CL5PcfD14MhiRgTp1qm4kmymF1stsQEo2Qp
         nEiePSGFwhwsTrBmjvzeDLZPhrvLXAjJV/scj7gQAAgszLtwTD452q1+7KseJbN2c9ZB
         bAG91W7M+iTECzIy5rWw7aPYBuGGUPqfUZMfBMvBjCDQPpzJ24eV8V1WmqXkYm9nl1vu
         WyGST2A+k3O+AxJDzdozWw6XWWfPphdHDe7bbUaRoTStlcME0NG3gJODcFwgwkbkD/XB
         Ye1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362009; x=1791966809;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxcGgnejISp1+VB6bpLIgoBBJ18yCkjKzQQ5g+qkFis=;
        b=jjD1fojOsT6THM6Y7Wz2BfOVj995Djj792JHPbdkcMqbzWAinM0TxxJjJeWDpVpL9Z
         2nn/jg1WTwdVZ2I76No02/vp8xKi+7d1VYgn5fzDGjcbPLflMLPsohll1UNt7rEXXKm9
         kE4+is60ro6EkKiiZxISxc+X7XrCvR5UKK9Fs9FABaoJWa2NKfwC/I5IQ+O36CpCCKzV
         EaB47FH06r84S7w9Bsu11i3rc3EUvUvfOS4V4vHIArw7yT/Og0bQcAkJ6vXOJdEwy9ai
         D7hkqb/EjeIctbWMBuiKQjFXKcWRgtB7Dw3vdgCvX5HTPDGIMWXqK2fc8x8CoNfLX50B
         rCSQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9LuOfA3N0yizUVuoX0DujqOOfcuK3dc3/snLRob6+4Wi4Jz8HrL9vn2iDb+GO7flCoEXBbkZQbovd@vger.kernel.org
X-Gm-Message-State: AFq9FYJByaNHzTTnR/KZfeeykcGiDQLjcBV1o5KDwXAOIZOvyRZoSrO8
	dNonvJS1PmdguA7voK3TsZ/6hrfa6jTomR1klFwz6PHBTMXsMphEIto+qAgs6CD/5SVfPRDWpLu
	J/yaBrO0=
X-Gm-Gg: AYBFou18gCV6t0kaBfZHKWjumfaZt3WL3AEHJJ+2NKE1OD54UmUpEulJGvGRcFs4AAd
	2rEhX4Y9a9okLND0N4yVZfDp6q9Cc7dCHKDK8NJiL6LztF334StbHxrJ9b8Qpb59qlMACW3mfZn
	a4qdZGzdw45131w7ZUyR0BYWkf2LAW4ey7JYIgCAe8gyy4GzK+g4HUz6wQXv//EDuFCTMKX3MsZ
	lCsBWzuVKNTcbHPeB74XgmlTysyPGuFSP+CauHAZHAva65csgVMUZPCMYi9w0hHbwflp8iZQYa/
	iR1JqB33a3iN4qmrQRubzgpCmueEjdeJg7d48tmtqxxIw+K4t11J9T/Hc6N+Q21dqj+LgEiS+x8
	1L0esJcq6vrU87msXi+xtfJWTR9CitnqLILU+3uQhBgjx3M3Mj5gxZKNjtLmA3Ha5uLE7OqOruw
	7siafQEge6ihjs7YXuSiA6A9lQQnjBUcafdD47kNVO1pWdyueM/gpyBzqhSWfyy3AacW+QatqTJ
	jNopnsq9HaZqBs=
X-Received: by 2002:a05:6000:3cd:b0:48c:69b3:6114 with SMTP id ffacd0b85a97d-48c69b362fdmr9482875f8f.3.1791362009297;
        Wed, 07 Oct 2026 01:33:29 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4290158f8f.52.2026.10.07.01.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:33:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev, Valerio Setti <vsetti@baylibre.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/7] ASoC: meson: add AUDIN driver
In-Reply-To: <20261001162313.4333D1F000FF@smtp.kernel.org>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-4-2476646118b5@baylibre.com>
 <20261001162313.4333D1F000FF@smtp.kernel.org>
Date: Wed, 07 Oct 2026 10:33:27 +0200
Message-ID: <1jbj95zz8o.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu 01 Oct 2026 at 16:23, sashiko-bot@kernel.org wrote:


>> diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
>> new file mode 100644
>> index 0000000000000..808e7d4fd31a2
>> --- /dev/null
>> +++ b/sound/soc/meson/audin.c
> [ ... ]
>> +static const struct regmap_config audin_regmap_cfg =3D {
>> +	.reg_bits	=3D 32,
>> +	.val_bits	=3D 32,
>> +	.reg_stride	=3D 4,
>> +	.max_register	=3D 0x148,
>> +};
>
> [Severity: Medium]
> Will hardware state like the channel mask and endianness be lost across
> system suspend and resume cycles?

It is a good question but I'd consider this a pre-existing issue, if it
is one.

Amlogic audio drivers have seen very little testing, if any, when it
comes to suspend/resume, because the suspend support from the platforms
them self was very limited too. I have no idea if the situation has
improved lately but the subject is definitely not limited to this driver.

IOW, the issue might exist (or not) but I do not think it should be a
blocking point ATM.

>
> ALSA calls the driver's prepare() callback to recover a suspended stream,
> but not hw_params(). Because this regmap lacks a cache configuration, it
> cannot automatically restore the register state configured during hw_para=
ms()
> when the system resumes.
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-audin-v4=
-0-2476646118b5@baylibre.com?part=3D4
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome
