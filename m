Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBDE496D3E
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372882; cv=none; b=L3/o1RclBP1E+Iry7qMzeyXwA7vQRIqK0GIV6wRv4KqAycoTQNd2hsA6atvKmJ1xxdDjKF+npANonvG36wOR6wUh6F6pyeJPJiF4NeWvn12IEa5QjbctBJMhDlGMnw1ohNeb0ugXZ82li6g3oPCipEI4GJGInT83bEyZO+g5AN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372882; c=relaxed/simple;
	bh=JhAC6vwrbP7VGLTK/9G9G2MtlzV6M2abfE82QUXAgPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsLFd4UKM0SGNKtj/PaY3ZBV4rWRjOJOSIqG6fgIWF2NIEXuxcjbW5AEgc4O8/PfKG1vdTHfHlP1lQ6VHpW5fACwKcsG2EYTT8OjiYP1h5zt0ynwRc9G7zD1RiXfjOtluheFkR2kcFFeSqxZ5+p+XzDcBIcLYlboTjhl8NMKQjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Co4LiB0Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Co4LiB0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3377E1F0089C
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372852;
	bh=JhAC6vwrbP7VGLTK/9G9G2MtlzV6M2abfE82QUXAgPw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Co4LiB0Qo545jXjZZYzYeuApMCYtVHJRvoXNDSd/X54JCkcQeT+VZDRNE1N80ETUT
	 EyUiklwwkvhN8U87NzfNIJSm4eI5SRkEGQQMIFFvzY5g1XbBSkT9sZ01nr6PWLi/v6
	 DrGSIkjjufKdXaumhknA4po+MeRpibZOT7FillaCPCOdmLw5jovpK9OEkq0T+qlds3
	 Oe1E6WyEE5+k+G3t7s5+oiByMF8cjc3t6BNNWxSpQXStIBKC5qUPGagPVvExVww8rU
	 RNlvjQQ9zzaQfOrhoTYKEzw70YFSOSWwkWO3eyGS9Qj7uCyC19Nif4/8o1RahiW1Vr
	 qlFDQMUdoKNDg==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6d00d120b28so988877eaf.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 04:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxEa65WWxmDr44MA2FfGlEL6Bh0FtNJNKi0L8Yjq+u4EPLdW5N8svim3xHvMaCMCdJI5odRDlWcff0F@vger.kernel.org
X-Gm-Message-State: AFuF++n47aFrh+MGC5qorJpbm2yp4sscNdjHKOa5BxjH5NqRT4x8C44g
	cz5gmh1GSVXofdPbMtzeNE2XZWZc0oBGfH9Tq2nEYvJAWd3AtUsrSeMVfqKJ0J38AeDC3370N/n
	u8tZIjtfhnUtB86zIEgGzcUngXAExwa0=
X-Received: by 2002:a05:6870:1425:b0:49e:691c:1bdb with SMTP id
 586e51a60fabf-4a259412f13mr2063730fac.32.1791372850535; Wed, 07 Oct 2026
 04:34:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-4-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-4-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:33:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLkqvPxNSx6jsVjXLAvMnpPDPTeUKn4hRK7KUi=PtEysZA@mail.gmail.com>
X-Gm-Features: AclHuK8XHQwc9XkY5CTAgsRDVLTJbfqcvgGYIDV5p-RXsb_N5_WlBlXLH17W7OE
Message-ID: <CAD++jLkqvPxNSx6jsVjXLAvMnpPDPTeUKn4hRK7KUi=PtEysZA@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6765 pin controller
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:53=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> The MT6765 pin controller has had a driver for a while, but DT
> bindings were never documented for it.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Patch applied!

Yours,
Linus Walleij
