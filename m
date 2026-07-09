Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C211BC2A
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602949; cv=none; b=IXvaGa9QAQvEPG8VX7NReij/8bVelS1E2aJodIzvZYWRu34Y3DHYMteAOoQN6s1TTTnMFoSlv8f8mLXd+L/okCVPBBGoXMlzpm03Jf4aafzXWLPJa8I950kjlM9kEhG30tzaGOwmfUaWr4gxZO77D5PMmm/WVL22dNWUQ3G83/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602949; c=relaxed/simple;
	bh=91Kjy1zeybXRCeeGvh59yf06osK/tzkAkgdwJW/cTYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnoUPEwy742YjjGwg+KsoCNQcZYkf1DJpfrXy235wDSEu2ICQWPKJfKYJaXrf8/I+0YL+rbDGjPtFKH+/6O47BE3DFkln6Avz/Fwkm9Go0vSvhcx+v0MLxbKxL7sPFAGVI6rp62aWIXgijsd/nronXFdHysi2gnf+fs2GefCYhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSCxJZbI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSCxJZbI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FEE1F00AC4
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783602948;
	bh=91Kjy1zeybXRCeeGvh59yf06osK/tzkAkgdwJW/cTYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gSCxJZbIl24MhP0Zhqb0oxb1lCopKMBME/78SbkshPDxvaWHwYvJdrs1qT+wSxl0R
	 e99/UJcY9v5ZXGmTNgoszPIWkY3J2z3PvVgyj+AAVN556CQRQqwputqNYVQq91YXUG
	 AoV27x1xs79DoCZVWWyuNaVIimWLixuHtaf/su653g+rVRqLvIe74J+0FjDGD84YYH
	 uXMtvW1pDNoCpLrFQlVWu/tRIlpX38kIbAB30q3uKbIXA4JaUc7iKcf5zxboO+d2KM
	 8jVb36sm6Q4Kt+nljTkpXjfwqeGhudYv42gd5SyJ++sbXHz0VYPPMLFbPQeivlzs35
	 bNvqZyk3Wy6RA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b00d083818so856942e87.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq8PGOvo+s2Hrv94aowJ4GR6zXkn2yR3O46RGyrB+4vmFoxK2I6vLsLpQtcVTN76P/gGeuzeAZzg4hd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QlhyH7do4x3XGQA7IPVeg/qH4WuPJ+Lu+9SLnR+QniBeAY6c
	XVB+hgPjCjFjE5qYWDa2/LDLYLXLxmBoFLpmyJaNA+vrEDPcqwtG883HFvUCWYE9EEPW9soUjcd
	f/bGmCevA80fT/46YNrNhUMI9pFCC8bo=
X-Received: by 2002:a05:6512:1092:b0:5ae:badc:47d3 with SMTP id
 2adb3069b0e04-5b016d615f0mr660965e87.28.1783602947523; Thu, 09 Jul 2026
 06:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 15:15:35 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Xy_gdJ0GRtKJJRgjwWgpK6wjvQNqemyvbcZfuJZLNyg@mail.gmail.com>
X-Gm-Features: AUfX_mwUf2c-_Y4UekW3PrE8vLF_7BJ35RTcEyy-SktxQFNLjW19tbLMp0sEH2A
Message-ID: <CAD++jL=Xy_gdJ0GRtKJJRgjwWgpK6wjvQNqemyvbcZfuJZLNyg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: arm: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 12:19=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
