Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536615;
	b=5lDFaWEp/lyxVI9KxGG62jMqP6NxkdR/6aUqKMWuODHADTc9wmIEMnvlvyepPTcfnHke
	 c0SsSEY53bMwUfCKtd0YYAEzPFZaBoklQ6kE1DwC5dSaXDxDMTpAcYPTgHLr+kMPDM2+d
	 COIQAgiw5qcwEDnJX6uZK9Fcx8JWEytFYQpGBNxidozmwozCmMzJ+c6lT1NWqE5OPsGVs
	 n4D2z97DLMQ6krUc+hcZuNtyuMKuSlSM093cNNQkaFPa92anjWwuz0ypchLxuiAYtdLc8
	 SBBT3Oy7h7IORDtwdJNnwRKta49cKxBCwJTJh1ZDBGem1DD074p2Y3BAVbYewN/s6sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
	b=xm5qs+si60lKXlqmWqUc/25rLJChwMhcYVoRqGVftK+4zRKW5fajYRNLJbXWrunr2NiM
	 QOd1E/ufgzgayMmat9YgCGHa3C36/w6i74Bj7Sq9Q1ietFY0KgFnbzuvjbfwahM7VFH76
	 m5OGQEA5gb3QeO1hmPGSqDWqk7hvclHPQ80ThIwLseiN4MQPkxDn+LXGFy3M5nVhdpaQC
	 iVEUU7IQ3dMq7j3aUZ1l/ZNFIJq4r3U7QeaQNSv0xeWWwJujjhm/Te7tW4y1SwCy9z3m+
	 QF6qgBgEfQhDbVeEEAf8peQwte4koszsIJ7Ik00R1nYaf0wLN55K2+qTZkJdL7mGsgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ngk54pFO;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAF360A261A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAF360A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ngk54pFO
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso1063785e9.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536614; x=1793141414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
        b=ngk54pFOLWmfm72DmBQbR5ZFvu/68E0HsE/I5p7qjLhDU68EtREzXUUkOe1KdJtoJF
         CO8uj2ApOXtd4ggTGsgelwDkrse81BoWG6/B8j7zHrKz29Y2YVJtiMU8XsQ1V0rAN5ED
         74xyNd7xAR5wHmIF/hEm+j2q+/US/PxSOYg26nizg/eq0n0Qf+hcc88A4bVej//jOAhU
         JIN+3z8//MTou4wGoqrqTvmO519jPRA4rOt6hJlK3RntWR9pJpMGmWggWPbEV0Prwgh9
         KdomzFgOtRvIUay295YGeWpwSdA91x8jdDi30+Wild3BZCh6AF/DiaeZ2Opb6ZO5IZd4
         mehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536614; x=1793141414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0vC8nTatz/VfjL47eh+tNgjT4mJh4syjFrv8ctbkr8=;
        b=tRdWHmElK7D7IBt73x9Clkfx9lF8FEEEGaClovjszDltxHLuAIbihDCGEVOBnenSUb
         ree1QWfoSQUTeQ4F9Pft+Bg+IcFZqxA1Bu8iOz2NlEnYxUvWP0JyDFjt77Wr+5zOImAa
         Q51MUgeWQIw5Wp/hDDHNUUOwZRixa/MZy5Yg68hf5QfvgJQ2okiy8DhYKmeqcxs7M1rJ
         mVmloj1qmpvqaFf6optRzf7x0nJ6a0PSaQ8PdzqmAQFPtSVtOWoETyH5aFk235JmZVkf
         tZYxoToDIQJqw3RgvREszqYyheg3SNKE9xC+91icPeNY+DC4Nc+Ctj24g6Hf758+Aj6W
         d+fg==
X-Forwarded-Encrypted: i=1; AKwUvBzQjWna4X1zqkLiW9JSYyfNFYX0KW8z/tvjcQIH/6T+yhMpW+DtfZM+Dl9AquweBKEl9rZh8RR0nh7d@vger.kernel.org
X-Gm-Message-State: AFq9FYLxPxlSU8Q/hDOvFAJdf1gAULNv6jEkSWnH5csvNG6L4Zu+NhQA
	ZAs7x7oKsogwgKK0k1aMuEeppohcWHXSroy4YmS9gHVCwA0HtR7n/1Qf
X-Gm-Gg: AYBFou1xNfyZtN90OfPGMAr1hrSbWa4mgCrTUOF5hma6c4FrqpUrfBNpzu/COtIyP+/
	rAs9RkW81+hvLAzRcv2mlOu/zcHFWIVMo7W8Hy2YQd4ekeB5T3PXNQqCv2fDbll21BNBp0lLpfX
	unK0VxHJHKxZPX3XULBc+K1KNJIuhn7073O22fXhwWIO37sGK4ERbQtq+Zp1bfPRUjtC50dAkSN
	/CHWXizMR6SX3sUB0AqqdfZmFwS11g6ECNAFXv8K9hpPp6A5wAEUFRPF+smGJ5mWaHC0Olldpfx
	VA2aA/Mze4IjMYcDIk/mbxieml42Yuzu+UUSWUrLfcu2RoVxKgL+wc70ar4x+Q4xWTEzufwE3GJ
	nwOyrecSyRxsxckyTTvjLEqWbcAK+BmpWfQxFZl0k61vtqivpob5H96DdnAFW7Nlcbd2xhfjdzF
	PZSrEiVcweHhiEvyD0t14BCzogZmdnox2nKzOTeBaI+PXNHzlSCZTjUr5VvSqK4WYJICibVJ6m0
	UedTdmJIbTXdmFS5Ie1YRA3Zg==
X-Received: by 2002:a05:600c:a0b:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1fdd245bcmr2271955e9.9.1792536613728;
        Tue, 20 Oct 2026 15:50:13 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:13 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 06/13] dt-bindings: display: add a boot logo node under /chosen
Date: Wed, 21 Oct 2026 02:50:02 +0200
Message-Id: <20261021005006.2341200-3-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261020164651.GA4017884-robh@kernel.org>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-7-maximpedraza@gmail.com> <20261020164651.GA4017884-robh@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rob,

On Tue, Oct 20, 2026 at 11:46:51AM -0500, Rob Herring wrote:
>> +  image:
> A bit too generic for me. How about logo-image for consistency.

Sure, logo-image it is, in line with logo-position and logo-offset.

> This property is already defined in panel-common.yaml, so you need a ref
> to it. You probably don't want everything from there, so just 'rotation:
> true' here. Though keeping the description here is probably worthwhile.

OK, v6 will reference panel-common.yaml and list 'rotation: true',
keeping the description, as it turns the image rather than describe
how a panel is mounted.

Thanks,
Màxim
