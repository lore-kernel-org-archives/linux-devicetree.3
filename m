Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA43DDDBE
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138838; cv=none; b=ALoQPb6b17vLOREvONukipASyB46mB+VlFanVN3HVv4yv8EAsFKOhiouw/hZL3pFI1ZMJcl7lQOKeQQSCscBZlWSFP/bW99H4d2NZHi6MsMSZkqkwD2xYwu//GhtQLPsXBOW6N2/0co79Q8MjR0QmxsJki4l4Y75VAKd2bDBReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138838; c=relaxed/simple;
	bh=jZc5EfIVdHQBId5RYiFeAw8/NeXVTNysM3ugtxQA/EM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=KtPOtIdcuCwhpUjf8/bNogmVu0aYJqpsc2QlpopJ+mW3BXl0uM4E5qy5cM85VOqwvwQDi8jbRIrLJuMBhsXQLAb2oxcqG9xqAQXvHgpjiMh0Z9N7F7CXE1iFwe96xykeWdDHjcdEeXyb511e4GW2b+L6fXq0X3RzrB52YXnH5nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XD0p1Q0R; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XD0p1Q0R"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49553515a8bso28298935e9.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785138834; x=1785743634; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jZc5EfIVdHQBId5RYiFeAw8/NeXVTNysM3ugtxQA/EM=;
        b=XD0p1Q0Rn4Puw3YlKY5zHVf6S9q9SbCFFbwPiA43oq3IX89HrqYeETbeDpt0MdZxaa
         DFuMU8upg+vDakbjslLBia7FKLV4QijeoPSTSzJAS7Kfx+BK1QS3qlPXSTJZb4NJTdAw
         CK3l9miUqW46vSxzddcX92TVCs7+4/V4jukh8W+xLl9BK+g4sBGafSZ8CDew6kQ5W4/Y
         uSEZHaZyPOckSWAUU2H125UtP8mjpcxtDR+1DW9JbbqjqZ+7VpDagFi+oN0TvyG9jdAB
         onsQBR1mmiZmYBaIb+/tLiRve1JqNWH1Xv8fNAITwJAnboOwfHuh0PK8/o2k4O64jn9R
         dcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138834; x=1785743634;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZc5EfIVdHQBId5RYiFeAw8/NeXVTNysM3ugtxQA/EM=;
        b=lkYG+7LA7Uui52NwTjNcXa23fBesn1++5FLKg5hy1STDccnb6ks5m0FLua/M/o6gh4
         dxhtE+zPdDUg2d3kg4KpluMOpNjBVkKcNMvFO2haVN7AA8JySyADD46lZqzciSIkGIQp
         n1AAIUIIqxxotjUEzaEdoKkAvnBIEHy49g+QeV1nhV218YptkZderY2ypklKEbaS6PO2
         24buxgmVp0dPNodB9lkCmcwQFkKZd00yQ+u6N8JuSUK/DtOYsOQCyyBEwGSEavnRGjWP
         HoJl6HAG3r0Tgn8bDVR6wKzjY5HsfoUAHZ4ESZLPz2pPigRM03enlfDU7G6ZYeK+3cvd
         Ic8g==
X-Gm-Message-State: AOJu0Yxg4RF8kBG0DYiOtBOvksqlzbRXtob4stn1SoXGyLWxX+65w0YE
	sADfgO+Ql7CHZP1CT8Wby7XTUpyDf3Saq1b8/riIYFzk09kEPFEE7ykRWNJnFQI4cf8=
X-Gm-Gg: AR+sD12MVF2wYEJRV5Gbku7N/rjvkre8RTC+P0Xo7Q1dsDcaqzPjMmV7O72E4mkYiax
	qTNEYF3FZeryrzukI8qkKgEWUHhFTaBaKgO2ZghLL/+wxBu3XhaXv9QDPYC5ypw9jjSl9zrLa64
	VjVlus49UcfwsM+MCw1h1HcoDXaIvlLkPhoOUg+p+QGpn5KGgQRjpk4dlrjVk/rxoJalPkKf3Td
	qwYeRvXepQrq7GtI8z3e1Ew42M7zRKns1QMSPN/CWC7L0F5vGXRlxxvnCDfRU4M0WQSygmiCRo0
	APtzIzLoceOlJJDSVTMdOGYEvYpDbk1+U+q3Vfwz5mgGDQ4J1/XS0Hw4opqpN49qqVpHmRm9Llg
	NYBqQFUOB90LUtA4/RLyw6nqtkfU8lQxWGDQ/70UqPOsF+c19WSQ1zV4MjGOrmChD4g9KrLRUm8
	H5KGW5Ay0wrrLCgd2Peqd4RphyNbfYvBXm3tmo4P11kmy36zIfJQ0A1ZrU
X-Received: by 2002:a05:600c:a086:b0:495:7a04:b006 with SMTP id 5b1f17b1804b1-496b56e6e44mr97968375e9.8.1785138834002;
        Mon, 27 Jul 2026 00:53:54 -0700 (PDT)
Received: from localhost (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm229193555e9.11.2026.07.27.00.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 00:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 09:53:52 +0200
Message-Id: <DK96WIHYRFSG.1E1TNF8OW6SU0@baylibre.com>
Subject: Re: [PATCH v2 2/2] serial: 8250_mtk: honor DT serial aliases
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Carlo Caione" <ccaione@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com> <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com> <20260727075153.4F9111F000E9@smtp.kernel.org>
In-Reply-To: <20260727075153.4F9111F000E9@smtp.kernel.org>

On Mon Jul 27, 2026 at 9:51 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The driver registers the 8250 port before enabling runtime PM, v=
iolating TTY subsystem guidelines and causing circular dependencies during =
probe.
> - [High] An integer overflow in baud rate calculation can cause a divide-=
by-zero kernel panic and incorrect fractional divisor calculations.

[...]
> [Severity: High]
> This is a pre-existing issue, but while looking at mtk8250_probe(), I not=
iced

[...]
> [Severity: High]
> This is another pre-existing issue, but I noticed a potential integer ove=
rflow

This is annoying. I'm NOT fixing pre-existing issue. There will always
be pre-existing issue.

--
Carlo Caione
