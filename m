Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530301;
	b=SQ5cdwEGghA7IXUF96xPMxZsbsg8mvROpqWKZa6HZR4tbtOFFN3bobcHYKyNWBYX7XSk
	 jUlMkXpUR2kTUZDoWNj19NmKXVqQMD/nlHcrEWa7nG9fs0KMahDr4skbK7kA6jR82PV+b
	 GyR/chFOADS4lCKT2C+hywaQxtnWdsFNFIFr1A/BO2AFc7M/mB15XN4nFwubF+qG0W7TE
	 E7lSO62l5WLA8j27+CokHDS0vigmz0lZEoPV/tS9NADGDunL0ILKVke3T6hg/awOmZe09
	 YqZFsswga+BQNvLclde0Q1iFlgUAgKX5Qu/r183X9xOZu11ZJHUE6FZM/+I8CXjC79g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=buBIF7EmYxWS5c3FiosEHjgky31TJ24TLg+DvfDgPio=;
	b=BkJblTMoP5YasfT3LC4iHrIl4OgYwhfonAWS5CAzaTgzxPX2wa4nspDX/KpL/otfAT2Z
	 GP6WV68anzWqlS8q0Kz8pelqD163WlyUnvi44dtphgaDxj5bBCbXip8zIcqfACF8xQbR1
	 vP/XuEWmRsACqveGhMl3123qKr4Jq6VM+bozVuRP0AhSpeNOMwnT6E9CGnwqDRZ7BC0IG
	 7zZvj5GxDnP4H3ttugqG4VsbZqCodTvDQ7vrtpwKsD/aCj3DOYvLl5rvfJBn1uiGJp9WU
	 tcZGaOC64IQXbyGwmsJwxOlZWUVcrGyt3mFZvz5FgVJRn5XQqxedocPg7RjNbJhSeQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDGXDBRR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D760A6F65
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95D760A6F65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDGXDBRR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so1895545e9.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530299; x=1795135099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buBIF7EmYxWS5c3FiosEHjgky31TJ24TLg+DvfDgPio=;
        b=YDGXDBRRbrBY3/jw06IHnr98GwZR3dBiDYUJHlucuMTz7U9T6TLseIn73NufOH40Ve
         03Sr13NhVAgL7Qi/Be6fKmXIQhxywTv0rlFd2+rIBmaLX1/L8TKR33TmlRGVPwLOk+Yl
         4W3r5fRLFvVaPV7qQho1gSVp0D1ZUItYQgJPBLj8/kgg64oV8x+Cnv3yjXH3/kZ5eXox
         mT6SBZURS3FngCXwUoj01VsQ+7IJOuSokeC59khOoDTV+hLQtPu9fvZhv2uBWPXd40B9
         LByomnCNZBbbU5+AIdi3hmlQSL9IL4WKfmTmAat6Rts3DYyr4mat+h6xe8+7OK6Q+dwz
         bygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530299; x=1795135099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buBIF7EmYxWS5c3FiosEHjgky31TJ24TLg+DvfDgPio=;
        b=lWjkdaahhZA0y1VCxPz4XRSJeYRVRmvPcjQ55WxCqbJ40Qs6Mz048PxeK8pxivEoqn
         RnW3gn3U3wD+ua0YLMNgABUPmwx4nyAn3XEqbQfeevnipR4JOjPb/5FgcIDDEDPkZMMl
         WlG+u/JID0/PcuvNUrp3NqcAJYfwHXZXMAD2G0eGjcBG6skjNXprcgZuoHvykvGJgCKt
         /l3ue+ObhFCWxkN/WXvGbzyOielm/RGEQCh9t95REyKRdAH7pSmvm5egqpLcvBSQyOw3
         0A2iTQM2NKjlmKv2c6oTsNaJAddyaqTSXP2sSXC4GC15poTF91YwZCSulhn0ZZy3LB2Z
         pTBA==
X-Forwarded-Encrypted: i=1; AL+hErGJjQBKK4Zr8hSvsT7hvVj6Ovrkc+jdowz7606Q+oLby9zcJSiuQGiegGvLIsNfaHu4+pxV1k1LPuzw@vger.kernel.org
X-Gm-Message-State: APuU4Z8rtmnUi3hmXf62KklFMtzdmDoj22Axjp97HY3AuTAGtOkk8nCO
	ce5ONs5ksENegt2/vU9nG4pLyPB9wjNd5+xMFeRch/xTxu5IIAbxW3a9eLdZVflcDlg=
X-Gm-Gg: AYBFou0VSeAxgG/fnEV6/lXwtH45f2Ucfurp/fQAzW3l3In/gOOXPa0Q56EYwj3yt04
	eHeZmI0j5xUg7WLLmwuHgE8kxcZeCBgE4//UtqmJUSJ/a0E6cP3KI/g+vXEhXWe6jXk4Ks9/KMd
	OL1S/e2RYM1bENUlP+kCv1yJRy4MzPRDa+ed+n4hjYrqWmhRR9nauj1vKCrYORgGYj3mUCbrpxD
	LE3Mxy7kYyzGaoJPMMUGjDwHRxsCGpUK5Fjtkkb5K1UxHDZ9CknUOvDzeHL6x7acyRz+0YeBY22
	8Xd4QzGom0pZiIlV1VXKnyfgq/jQ/WanueNan9P4FAPs8Oha+1ipv9ZZrZNhFaKnIskpAEelOnM
	cqLKpxPGE4GD8bN6czIcy7nim5pJjzKus+YZbt2FRtHBGNj5LJNCjXRTTJkB6DCExdLuMoQGquj
	KbU3C1Dc1ZuSVu8DHg1yDiWHzrrVwxxhnw/oJoefxWvfMXDZCu0TBPOnZgIl0foH0mbhDr/Q+06
	S6gy8kdt5q0HKbgq4tdigHnpJwRmLkcqcUWbnvTbiYbtW0YmegNGl0FEcnmAK6SIjJrdNk6EenW
	SnbZjdq8R+kZ3fjwYkdQ6fONYB+WCbpK0z1XcEgqP36l+uTXGLYbWGfCTTl/5M2b8L3wzRSAQS8
	weVOTS76W//92OD9Vo+J6lxYiDfwj47JUdbmg3QzmCi/FWNH86R29oTnpkl9wibiHurzOX1QA6U
	ToqydlbD7OJBrdfoMo
X-Received: by 2002:a05:600c:4686:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4bb55a68395mr18872785e9.16.1794530299437;
        Thu, 12 Nov 2026 16:38:19 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm17084015e9.4.2026.11.12.16.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:18 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	robh@kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 13 Nov 2026 00:38:18 +0000
Message-ID: <20261113003818.3670423-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com> <20261010130024.177503-10-ghahramani.navid@gmail.com> <aV_PM_GzRW6aLmK6NF7ttw@gmail.com> <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
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

Hi Linus,

Linus Walleij wrote:
> I think it's easy for an LLM to port over the IRQ support from the
> old driver to this new one, given the code is already there and
> this way keep the best of both worlds?

Stefan's board has no GPIO IRQs, and I have not tested them on mine
yet. I will check whether the IRQ registers of the old zx driver work
on the zx279128s. If they do I will port the IRQ support into the
GPIO_GENERIC based driver like you suggest, and if not I will say so
here.

Best regards,
Navid
