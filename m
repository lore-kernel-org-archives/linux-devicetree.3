Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A23033E347
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648527; cv=none; b=hmTAV7a2MEAIGygkNYR5T6eGdQYIV6w7hXm41Y5FvXOE1Pvyc+InDAqQSVpfUfjgq2NqlpIkuUo4D/1mDtkSEPBmoQktNrgQMZWfdQPTZF5n7aJMQ/Qs0iZAUui0JdbHamLhRLb2+VgPko/jOvmbJy9rYkRbqYxhjsTJx7igHOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648527; c=relaxed/simple;
	bh=XTeaCcEc2SN8BtA8kLHMieDCplCMiP8uY0kYtrEqg4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITnk8AVSUJkMIh8bjwU9Qv8P8VZsEWIDqPOh2K0zZZMTtWbRE/irWxFOsOON9furVQTkj9WOdarSD669+WoWBZyrFa3KTNzE7WvATZxL5W1t8gaH5urFXjEgTGRbvVUWW4c/vlcWj7zZAOykGFqo6d5AOnQSfLhkRZRnF7RYZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd6VlOmS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd6VlOmS"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fecbb7000so97087f8f.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648524; x=1787253324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTeaCcEc2SN8BtA8kLHMieDCplCMiP8uY0kYtrEqg4s=;
        b=hd6VlOmSAvR0YDn+QvjfNmSJ/F+fazdODr53SiezZOvzeZG8V0sV37xIyN5bNuAq3C
         pTBHlNwZEpuiTcRLrhg5ZX7Ey7jOMODQQuYXcHar3rM7kzsIA52EM+46Iho15rHqQmRY
         UuwTsRdcYcLtTfgUfNCwbHFhizsSEOfOcsxqH2YXhZxCuqP66MF6lEjW4GssHEEc/mid
         g0RZcCc9ZAwE1qSTYVMV1Y/VbjFyZdBgA9Lk/R8yNODDQ5ZyTL7RPKl2wydzsuG7z14C
         9JdGWVN/ywz4A7Kg+EKkApgOKKyYBfjnZ9OaQoks3Fw1tHG58+Rzbtpq0G4QTCzIeIdG
         xOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648524; x=1787253324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTeaCcEc2SN8BtA8kLHMieDCplCMiP8uY0kYtrEqg4s=;
        b=NnocClV33MIOgZzRv39BXeUqEFNbP4UmbhSvTKBo9Wul7Sv1e6qjfy+eHU7Q+ZL5UA
         xWIV4uL7fJzuEdBG645Y2u+rAQn4Jo2ijW53UzwtYNTnqRWksMAq8Vz5LHpgLgNlH4Bu
         gxwAm38FwwnudUwK9LiuG9dKovz3JulIyKWiUojSgXqoFz10EMUAsg+YD016lTtqLbl/
         z/hZtPAM9uD7XKBDrMjYlEZc8OOZWzg1XAv/+OjAo5XgjUhe//orVOoJkrtqrGpRcxSM
         fCOkdvLKJz1+DxJxGy35jyZpb0aBLpzB1ShnT4Nn6N4NJ0zalaMRbOiVTvehhkcQFg0l
         9eDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDk9Er50hDMIm0Vb4tJGCCxGCyg4KO7k+TAPeaYvHqHNuTuUsq0TNBp+XqNLfBFPm/wl1moOtutCGR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3RYLXKPjc1pSrQlSnhRVj7XL3fuOexhqeoD/e9stPdHFi8BWJ
	sWaLPANBWrb+odMgdfLTh0/qbWVQJD5H6At8WvYlYu+acu2jel94csLg
X-Gm-Gg: AR+sD13benYN1BsnsQuzodqA94kT2qrT7niPVoItew8jq+8tRDTOaKwxIpTj2akMujG
	jrerfPkQ69z4vcozwwwSDNoXUGZehig1OmHwf1jXS7AlqIP7gW2Z+eO+xKA2cAjOq3TQko4/vj9
	LtjC1SgyNy8A2h6i2QU5Kxt8/fQOWoyNMF83UDHk7We3mZ0JGtfRkLf0IWOu1VNVZLPulX2tuhS
	Huow1G3Z7xye8f/HPry13wmDPwG3gwLMOBcg6scQBSVXM3GRi2AoNlW3afI9UB7IZ1rql6H9dUO
	VIuY9BsXfxnLSwUr0fZS+VYrTE3tfZKowIqev7cSNi8Sl7eMXN1szQFO+xcMh951txy/pYxVREO
	nSiceLSv/+JN3DY45ACjQ9AQNhhGRtsrtx9JXAQFM9WGBm/Ea/ay/JpxU/xuTfw/p4Fq74lRbO0
	q1acvZEA8+7Tca8ZC3+IW98VXKbEyB3A4GMgmhAD+tINiSM/3UUCucXEywDuLR3mp3Tw==
X-Received: by 2002:a05:6000:38a:b0:481:5276:e4e3 with SMTP id ffacd0b85a97d-48160748b69mr654934f8f.19.1786648524165;
        Thu, 13 Aug 2026 12:15:24 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f200752sm1618261f8f.1.2026.08.13.12.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:15:23 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 21:15:22 +0200
Message-ID: <20260813191522.2334974-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
References: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Fabio,

> What about the latest mainline kernel, 7.2-rc7?

The series is based on it, the base-commit in the cover letter
(3d6d817622b0) is 7.2-rc7; the 6.18 mentioned there is the LTS our
reference image runs.

To make sure, I have now also boot tested exactly this combination on
the hardware: 7.2-rc7 (multi_v7_defconfig) plus this series on the
Colibri VF50 on an Iris boots to login, with Ethernet up, both PWM
chips registering, the microSD slot, all three UARTs, the carrier RTC
probing, the SODIMM gpio names in place, the EXT_IO pin group applied
and both transceiver hogs holding their pins.

One thing unrelated to this series showed up on the way: gpio-vf610
has no get_direction callback, and the gpiolib in 7.2-rc7 now WARNs on
every gpiod_get_direction() call because of that, so the boot log
carries a number of identical gpiolib.c:431 backtraces on any Vybrid
board. I will send a small gpio-vf610 patch for it separately.

Thanks,
Mehmet
