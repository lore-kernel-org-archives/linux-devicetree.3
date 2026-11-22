Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386469;
	b=b0AFgkBrxuVFng8rtl0aQhVboqzIrSbjSy540URTxmSxOTo7NmmGh0Q4nAMZ8BWiVTv1
	 NMSwWLhLSeLxwOWPNlHlShJIN99O8QDavAnGxJwjouxXm0suBO8JGnDnJcBoGvkXEd0Ye
	 xBqfDg4pxBMl/kci/o+WorXMPIXevIUhj9v/ngwklqw46FZrMopfSOlfYjYzw3HiDf4IV
	 bmohzFoSteEuTcOVLkFjn+SyW/M9fuXkqWlUutNTFNuvxgZ510ZVWgVIOHr0oXeW8I80G
	 9SzWkgeSwXc7eiFBjg8zgGtTyZNTUu/MJV6SQGFBKd+ipdBcsd+kk4VVCXst+ddLqtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386469;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w5lzEcxKiqL3BlJi55P+ZDsd5CgUkyW/04MW4YNJirg=;
	b=m/g8NYOY5Ft9lGM22VYSbqwt7POE93fL831akCcmLdCApKjX4loWg7eCXtjZ3GgKYBba
	 mr7f38fSuY7cOm+qWPRTWG/KOL0nLuu/1MzqQF+XKgujd1stUjVwM2Tv+iUk17kf+p0TO
	 28xvW7NK3UATLG8xcEYkah2pKMur1aWNsKbHaIFazI2Tgehba0rxBAfEUXXzqs2rz6pLG
	 9MksiLs+rjkEUEovKu3sxCpXzwhsy3CPkmpCc+lklJUcOvtrmq/6Lwz6CCYZjx0ZPcbTF
	 N9e92Hm0YmenVFTBA1UdXldm4+zNZCs8pjtnysPWOcuuUQd97O7Dw4cd5dn+kQxPKQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPvl8hLv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B576A606A31D
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPvl8hLv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361CE1F000C0
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386469;
	bh=w5lzEcxKiqL3BlJi55P+ZDsd5CgUkyW/04MW4YNJirg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OPvl8hLvtrJ9LTOBEzIfEHa7NVs6FlgdJ+UxySXJn2+owzPa+Vt+9mCch0yAryTlK
	 LiKkgt60uDzMuqGl1g+KQ2E7Kef2Z95xFZhXCWSyepJwA5mw5jkHgWBgaL+/ouNCPi
	 5Me0XAMpJtZOkyXWRKDg50hVESo6gA3s14fPpvaML3vODe8cqYANeTW9By5ZqlvQbZ
	 DW+O4gYiXt5DMKWYBwjgNlyOQxL5nEdqGbETlusikGuwdWedfspjl0dhUgXu2GpTS3
	 xA9Te218tcwx8GuRMHtb97FMKihXyRGlEDeWaIPIFF6LvLCr1FLoOJjV/zkYoce/4u
	 RKUCUZuB26tZg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso2111953e87.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 14:27:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGBI6jRQb0NwAx1kIHAEuJa3Jngug+ll8nhLNfdBqTkg3KTnFLRO8cjwpmWZ9YDrbHprcpjOeWeT57R@vger.kernel.org
X-Gm-Message-State: APuU4Z99fiMITlPe1qMQ5btHFdWmYAa5PpxyEFcVuoTba1ADNMfnHXfp
	p/9egsac35ZaUuQAHvux2n5zQKQM0MJlHU+yBxfz4A7MEVW3KUvzueduI1pJYcyHJXUjcaYVxK/
	U6pAzND3GBWahPD/cT0qzb9hR4ZTHdXw=
X-Received: by 2002:a05:6512:3da4:b0:5c1:a828:499d with SMTP id
 2adb3069b0e04-5c1bc8a0f66mr2723779e87.45.1795386467998; Sun, 22 Nov 2026
 14:27:47 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-xg6846b-bcmbca-xrdp-reset-v6-0-bf2104a25095@kernel.org>
 <20261122-xg6846b-bcmbca-xrdp-reset-v6-1-bf2104a25095@kernel.org> <sashiko-outbox-228331@kernel.org>
In-Reply-To: <sashiko-outbox-228331@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 23:27:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLv3BvUY36m+2F+48m8ZQ-uedK1wbGh=AUHNNfB_Vw=Q@mail.gmail.com>
X-Gm-Features: Aa3M54ok4call33uc2w-wg1Lc8Py5tmJgq7aasSbEWB6j45V_SSTm-IdEboSNII
Message-ID: <CAD++jLkLv3BvUY36m+2F+48m8ZQ-uedK1wbGh=AUHNNfB_Vw=Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: mfd: Describe the BCM6846 PMC complex
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 9:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: mfd: bcm6846-pmc: child nodes split PMB by Linux
>   subsystem

Parroting, Sashiko. This has been addressed in earlier iterations.

Yours,
Linus Walleij
