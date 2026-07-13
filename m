Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EEF3ADBA4
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931297; cv=none; b=UQhowsw08dEWMBxxljQnDcemDOfiKn/vjiMJDpT5+kcZCOAYs/FAnZdJBTeaXW5gEsZnH+2azGrLbiJpo8qlP1cZkdmcluGsE7Fo8TWL1OR+z0kR2Zifr4LdM2XuELl39U/vAfg3OxeMroLw8crLPz/OvLZ59KWTq3cSqOTl+CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931297; c=relaxed/simple;
	bh=1bdQxZ+KT2IXwA3Ltsi7cQksVnEt6y9F8PnZupL8F5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IG+vUtaDx6el03BW4TLvJ0zgqLkLCTefvI5hlI5SPvtLyDlMG3uNiReZqUhA4q5BstRn2vu1hkm2BWZLRUroTr9neSlGKgDpVIwKxqjG5jc6WJcEmMNodnRxAMQH21QvbBfbC7lApgYb38qi4d50e5eOCDoyUABn9QumOrNW3QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqLWaAts; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqLWaAts"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8484a0b998fso4381516b3a.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783931295; x=1784536095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bdQxZ+KT2IXwA3Ltsi7cQksVnEt6y9F8PnZupL8F5A=;
        b=SqLWaAtsjqjybIBxzEryU00C3b9VOTarSGplovshQTcRxU7LquegJaK0+44qfD+90X
         yncXbWQAbDmzqsHp/TR5c2I1s9wi4WaCPOEIRuLHxoHzrkUv7W/8dRiFopBQBwSYT5tI
         WBog20AvVGYHfg9eZibsLi7BJ7U/xLQQceYiF04VVH1azFuy86TLSDqauzDZ7BwOH50C
         HPj4wmdhIZ2hmOCalmzInfHeJO8cNwUlFIl6tn9nqP40fQA/sDXIXQT+7SSTWvxU9otm
         wbBTvKS821eLgFG7IgDdbvpwaHsNGHlEIPPrhD+2dcjVj0NpJpAoOjOrlCbMSMU9+U7O
         GlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931295; x=1784536095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bdQxZ+KT2IXwA3Ltsi7cQksVnEt6y9F8PnZupL8F5A=;
        b=BPsXQTZ0Dlc8rKy+F5Ig9tor57xFBsB3Xw7osLjK/SqEMXBdFezZxpwdBDRIY2PDSS
         Ogm9xrTBtuANpYxfL6AD5JUV8lhGyKVphEYkNJA8qmCWfr3jJmLMpYsgmsyQFtBmwbX4
         srvNpvFNSC+EiuNX7ItsZOeXEPXgfcio0pKUL68dUtvJkhdrRXpxblT5eK2it5IVjRZv
         CFE8JAjJ9LoK0YV7RmZiuhN9eLh8tQsrH2J1T5xyFmv/i3YX4lvMgvHQEgi98ljR68SH
         K9JVB8JBO9Gv8B5vhIMs7mXyp17tsC6pm/IFxbPbjVocZua0f71kL9klWPugeDVDvDLH
         92eA==
X-Forwarded-Encrypted: i=1; AHgh+RpQ4DRlyt9d2k/gqYuHLmc16R68H1EaBcQckZqqSC33Apg9mrHIM3zow5fTBzbNa/hI6VhShKaaLYJi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3hFD+/gdKPPGDu2BSdznp2r5ow24IYsycFjoZaHPlflpNWUeg
	A7ej8D5LFgVly0+MZBFe2aDM1oeK04zpLWqq/ytTeUe0+bz+jfVFeOfglCVZZNNQ
X-Gm-Gg: AfdE7clwUN3w3Ie6rE2ZWqbXMKijJfK93YFDgldWcMx0sNw/7PTIo/S9dbqW5QiP3Jh
	IZaLCsKg6lvCVYwBGGBkdWu7+TE2fbfab+75ma48Qp04DHzM5IezmU01Nej7ayzNxKRbBHi1lKx
	TfGi28yehhCTKPKGp/4B7WjcPBjrEiyqDGqEPIVyhXW5adEa72Dm/P7j21TYoBdp1PSVmjSJcyl
	y8WYHQndmN+mi/5bo6Mrn4jzUyYoZQc2rKDulYBwDOGlAIaYHnbjZF5w/z2B1Yk1uozdbFuBVpv
	hdzE38ta4bJSYYG56042oYDSqkBY+nSVF/wjrjG4Mhjj6/xjb8sZEvKhQszdE/88cJTQG2McX49
	Uzy9/PsrqLZs4LIFKJ9VOa3FyIbUmRIac8j3sauKg1EEk95fSWa7swFiwE2rhbAP5+h6M3gK50z
	6EpzrouIH5GB0hpsQ+Ww7F5Q==
X-Received: by 2002:a05:6a00:3306:b0:847:8dec:141e with SMTP id d2e1a72fcca58-848897569e9mr7818491b3a.54.1783931295613;
        Mon, 13 Jul 2026 01:28:15 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8494b279e8bsm2691284b3a.33.2026.07.13.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:28:15 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: Re: [PATCH v7 3/4] hwmon: (sht3x) Add devicetree support
Date: Mon, 13 Jul 2026 16:28:09 +0800
Message-Id: <20260713082809.24184-1-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713080129.D8A8E1F00A3D@smtp.kernel.org>
References: <20260713080129.D8A8E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 13 Jul 2026 08:01:29 +0000, sashiko-bot@kernel.org wrote:
> While reviewing this patch, I noticed a few pre-existing regressions
> in this file that might be worth addressing.
>
> [Severity: Critical]
> This is a pre-existing issue, but does this unaligned memory access
> crash strict-alignment architectures?
[...]
> [Severity: High]
> This isn't a bug introduced by this patch, but does this integer
> arithmetic overflow?

Thanks for the report. All five findings are in pre-existing code and
are not touched by this series, so I would prefer to keep them
separate from the devicetree support here.

I checked the first two: the unaligned access in sht3x_update_client()
(buf + 3 is an odd offset into a byte buffer, so it needs
get_unaligned_be16()), and the limit_write() overflow (temperature is
clamped to 130000, and (130000 + 45000) * 24543 = 4295025000 just
exceeds U32_MAX, so writing the maximum limit wraps the raw
temperature field to 0). Both look real.

I plan to go through all five and send fixes as a separate series
after this one.

Thanks,
Zaixiang
