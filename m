Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940934;
	b=ltEQhPBV+bf7OuFSO+zGTfqAYygUMg2BTHzJPXQyRKFi52I00okrQwSS92BuN3vPdfs7
	 UCDxmnH4YUSWYOAemxFjzTqPEnvBhM9DkURocdONuM2H3i491dtIZa8oCDgHZqwFCMGwv
	 2mhAL7uBMnQnhthnbL6G81V5PF8PMQRr2O9Iq+4wRVUedFg1ctfKXmvDtoUUHsmtZ6WaQ
	 /+6mORxejsxQPR4M9f1YPeSJSmjwadJOlDoygCEobJxQ8oxPZ+1m/Tx58tNoq2CidUfm8
	 UhLULbmWmOISiSpLySxsOqrgQCkhf2hMsMb8kxRJb96uSXxOh+Z/qbe5I2CnLr1yQSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940934;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=oMSOkMJ2ZXC9l3P9pMKrtpE95z4l6icde5TxpIpV/go=;
	b=EH78HksgDErTqQ2n1iAOs14tbaJhjQbPmOdP/EhmMerftU87Y4Ic7DDoeRlEYT816UIF
	 YKy/gZn5SJnzjmFUGCnmTq2rRXsfQ7SzPLO9OiDLN7D30G2pXqLsfMV42QrMCffI7b9oQ
	 GbAHKAT7Dl/3HjKdYt6Hm1r26YMleBeWhj3E+xJPswyoL++0+QEMWMUtB4G+Z4u00kys4
	 7QBPVOyiNGj7uKfdo9PeQRFT/aJtlRfRVTGS2Cifz6tc1SAwffaJmvXqxLf6zuy/IAnSs
	 qY8N3sxE2mPtYzgaWgFiBCpkdLgMHRvJoEaD9V+8znswN8E9cdrYOQp8uNZJU5lYNXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLabCSjT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D32606A880
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLabCSjT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017BE1F000C7
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940934;
	bh=oMSOkMJ2ZXC9l3P9pMKrtpE95z4l6icde5TxpIpV/go=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QLabCSjTrO+uhs0qnW3r93hci4IURvPKtytjLJgRdO3FuZuH8iLtZh587EL0H2A5l
	 d8cquwMzlQQw1PJ/WNqipOcypWGGCvLVCD/uHIrQFjl/UW3SpDAvyxdjYGPBspFdeG
	 IskPSU7gVxfAoiYZNeEMwHWzS0BEOphL7y6SBGX3072Ehl2Ab0d7QZ9uZr1ljfE2OV
	 46bPEIlygkcGdGyzzKsDqlteS5rUai1cvqqHgQZw2radHrnuT0y7hmvqA3907IOFRG
	 PZFqbKdQxvjy+M2Lg9HGoIKBWait464+Q8gU4z7YyiJVylT63oqMwlzdCQJUVEeumL
	 CJwVWXyPr3Rjw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso56486e87.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:42:13 -0800 (PST)
X-Gm-Message-State: APuU4Z/dQMWvF4WKJ/9XEQmZI40K4nHFsHRLXZfOBPnNB//faqavnCYj
	/QS6Cug2EzzQG/4kt3NbHw+jAqDRcmmxMb6FyLQBOfc4C4hdqo+aONc3/zeIPqzMHvXB/IM/tau
	Xp1BOOhB0p6HhZyfv+4KUoyi58as/rZk=
X-Received: by 2002:a05:6512:2313:b0:5bf:e643:cb75 with SMTP id
 2adb3069b0e04-5c1a9f266f8mr5018e87.48.1794940932746; Tue, 17 Nov 2026
 10:42:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
 <20261116-ux500-powerdomain-dts-v1-2-e0f4459c3ab1@kernel.org> <sashiko-outbox-216799@kernel.org>
In-Reply-To: <sashiko-outbox-216799@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 19:41:59 +0100
X-Gmail-Original-Message-ID: <CAD++jL=XdOR_C2tcn_JdPejgaKvZCrxenK2-=ZNfBpamq7t=Ow@mail.gmail.com>
X-Gm-Features: Aa3M54oixxB7T_iuZTnK_d9bvHPJ1M2WAn4YxfICmRbWj9MkimT-s4sSgTmvMv4
Message-ID: <CAD++jL=XdOR_C2tcn_JdPejgaKvZCrxenK2-=ZNfBpamq7t=Ow@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: ux500: Add power domains
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:55=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> Do the DT binding schemas for these nodes allow the power-domains
> property?

Yes.

Submitted in parallel.

Yours,
Linus Walleij
