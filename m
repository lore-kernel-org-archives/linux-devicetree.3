Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CB53563CD
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428637; cv=pass; b=lt3EevdXiSYX7+Ql/7FGChx812UvmK9hKPymkOtu6v9Ex+zILgkDoRCDtjnjTF+JAakNrKK1CYJB4afL3NL4lSTHqMzvxYNvh53BfEU+QjXpv29JM0Kzy4l3VOc1iWk4Hdg/luQzolAom0CQbAtiSLEsa+3i29RI9mAylRkuVuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428637; c=relaxed/simple;
	bh=XpCq8Sf4SUf8hB4URITm6CXymy9bJ7uTQ5Arv6MXawk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzWWULS3SkfHlnU3GMR8sHiXtj9BFWsqHrp7H9VS9YhGnekQO1zdrPBs/H8eXUvKQpuT9D1JIV7oJ+KVeCoDFQBwgh6LXqkXqubaq/6KLEO568wwuT562MhTlWwhhB6cauNisbgUF8mGpvT4yFVSHAqbb+Oz0K7DTJr81dRtr5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/2hXFtf; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/2hXFtf"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6108228a851so191750137.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 05:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776428635; cv=none;
        d=google.com; s=arc-20240605;
        b=UadJ2vyRIXvHjxl+Vra0DJOWzB0Ef+7xI4H9P5uZKp4dwkdD9R7IKdSootS6RnDJRd
         2wajlCvXvzqQvMw/8sEEDt9xWRfLcn1kraT9ZXEcVBeIJCHWMdhppDTGNYXWg2cC4vrO
         p/uNz1Xw4Ebgj/+nAd8gXp0XVVwcAW05CWvzRyMmoI8CtsKSpcw+WD1jwfZP+Dhd4Vu2
         fppZGOaHLKB/fAbfpt9nlGlj8pR9ssHc/CbLIvzkMafETf5gwL06hEhSsRj5XF3FYAjD
         hDSLhcmbcObYVUn2ajk7ltFgCj42QuWkJGR5AuYMMOA+JyPpqONMgufuS0j9HHNHOVxu
         Lxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XpCq8Sf4SUf8hB4URITm6CXymy9bJ7uTQ5Arv6MXawk=;
        fh=/sTVWnr0bPHEFEnkl/dJg6BYPawA4tigZrEQjJWXPc0=;
        b=E44eB/w48cf+pQjeUXoG/2xf20C/5Xom3tj8MNkF8bp7GiWl0rCA2i8TzkmoUuROOn
         wkFeK7cwU0bySyB4bygzFYuUoyTuji4UfbTtwY66BUVZ6UBs0tx8bi6sePtiK20Rabz4
         GGV2oQ9oueHpy1QbOOy+EGTPGvIjz74BNb+xaLQqxOuYHr62Y8PUDWjhCbWsd8Y1nUgA
         i14ciTjcwNJIc1IZFxnvZdo2LU/ZXp/DI1bOAUuoSSG4h9Bay3e89Qbb0xxSk9geL6Qr
         tdj5kJoBqCFFI/5V8fkVxUrkbukCY1uBrD7c94mtyLIY2qUB8usnfoA8US8XDwgzjV03
         j70g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776428635; x=1777033435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpCq8Sf4SUf8hB4URITm6CXymy9bJ7uTQ5Arv6MXawk=;
        b=h/2hXFtfEuO7HmwOj61+/Xbxk6NQ64StW8SU+GSJBeCR9uZL0UFK5ABD1XVqLkCY1L
         BVfh/iRGHkBo8SRKqvFXRgKdM8OxB35cgxU2PTUvIzzfxhkFrcWWCh/2gO3MIap8ppDh
         JGYji+UOdQ5hbSEkFsDnRkmL5XueYQkZ9porKWHCBX1SZ8BFcFhoSVasYUYGpspR3tSy
         r4iq7FyfIpIGueXaqeBmNGxYTn7uhx9KV09lxRhBuGvibpYMfuDeIBSBd+Lu6ijWOoZF
         KcquvbCj7lmv3SrUNq9gJSziaQZCD9ELZTl4ZcY5n1EOwcwx6dcCEoA1nWCypoBF5ZeQ
         DVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776428635; x=1777033435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XpCq8Sf4SUf8hB4URITm6CXymy9bJ7uTQ5Arv6MXawk=;
        b=MVzgd68JMfPFBsaO53wNCahoMn0C53AizMwuOqONQy4DH3fu9QFygisrP3GRG9WL+m
         x9LmDGxGWbkSDNy8UI3JCSl17+JyQ4EsqR01fxUgtGgJ08GcJF6ApXgK8DNwFOcZ1yLX
         RytGxzRi/HTL8T1BT0RQCepMaNGuH3Sj1lCisceU5J/7GcMpyd7osjUamIznrHqLf+vN
         SgS0q0J57HkbKAuQsL8CiU/g8uhe/uKNvdOylg2r5iANMYW51yAmMRK1l98qLpT5JUKQ
         Fs9BCDJxveBFKOizxu1tGdDHKusyManlqHrofbRAzKorJNAq4E8ca3+0NylNfkysdhHW
         GSqg==
X-Forwarded-Encrypted: i=1; AFNElJ8UWPR+h+dBXuH+JV4hKfdG8i5X95cDxUn/mYFVQbH/OgAbcMb824I+9ek1GCKdKEKYlVDmhmBG8nk2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1s60jV6L1LxTQt0qaj+tYMGXtJpO18sS0gipvcetWHoZi9kCw
	aVCA+NOd4kWiHaLWOnM4rlTfTH22QAbRshBNGCLU+UQnPq8o1gDx5u1yIi6id5CFAddb3sAhf6q
	7Aa28JpAtHpjc9XThWHA+gYvdqJn1mk8=
X-Gm-Gg: AeBDieusyYg70AWhVm7z5GbhIu4FG0TyrWxV46pixLb+2jD1lNiDUCSjRL+twZcu/38
	Z1v6KFKMk81TMRnvank3l0d+zfNdgyxAn/pET3uW/w6AXsdscWf5kWBitisk7ajhM21TQHoctys
	r+9XfAWCLAxkjpHph8tPjrrCycaNmJYYGNfJUnMfTjGt9zjXkeKbzOm0DKMQkkrLV7Vv6KKufhl
	F2dtMlMbgONT2JMlzDly0/LWTq/+5vHrSRsbqrh5B1CKMriQVHWa1n+psT5zqhaPIv24iumSws7
	UboBz7Eu3E14I0jsMg==
X-Received: by 2002:a05:6102:3588:b0:5ff:2963:52dc with SMTP id
 ada2fe7eead31-616f474365amr846225137.4.1776428635433; Fri, 17 Apr 2026
 05:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228125431.23098-1-mitltlatltl@gmail.com> <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
In-Reply-To: <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 17 Apr 2026 20:23:11 +0800
X-Gm-Features: AQROBzAgHsr8AIpWiF4vnwp5PfaZ0TeyboP9_vrim6_Gnnej-q0JbDRhTZ3mCIQ
Message-ID: <CAH2e8h7W8Tng4v9Da9c7xg-oczHgNcMvz0OF6A27L9m+Pw7iZA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 9:13=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 28, 2026 at 08:54:30PM +0800, Pengyu Luo wrote:
> > Use it for the DSI controllers, since DSI nodes have been added.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> > This patch depends on the below series:
> > https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatlt=
l@gmail.com/
>
> Why was it not squashed into that series? I'd assume that DSI nodes are
> incomplete and are working "by luck" without the refgen supplies.
>

Today, I did a casual read. I found the register(0x8900000 + 0x80) to
enable refgen is always 0 on windows. The refgen driver may be not
compatible with sc8280xp or the DT configuration is wrong.

Best wishes,
Pengyu
