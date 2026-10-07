Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A5348FF74
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372979; cv=none; b=i05qLauTvSWAlewKHB/HIS9FcqQQAaRAM4jX/OEepigWd1U/KSyCh+Eo3EjhE4QL/gRf2aR30X7FFdmi/twwEHO6DQYXjm1v1CmypLb02Ef979rsD2+WllvV1Q5cnLpFxLjq4d74bf4FjUC4ueyDp3m+d9EnwIGTpBaNVc/sDeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372979; c=relaxed/simple;
	bh=6ccFrIMNi8thTcS7ezaWwGEgxkFr3q3PBiPerXaosRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kez1gb/gQKVEoIyjJoX35Fw05bWo4sNXsVmguOhHtNApJDu7+E6OwOJDrJCPnmzXhMGvS+/f+NnF5WzvAXbmEtCKKN7u0QUkTMsHCt5MZxSEvCkF/JkKGisFntYP/Tk8DnRyBzsXZUruGZ8bVWypNNNnKlCCQfWZqS+mM43KIYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O13lfC7f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O13lfC7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2073F1F0089E
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372951;
	bh=6ccFrIMNi8thTcS7ezaWwGEgxkFr3q3PBiPerXaosRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O13lfC7fZI9543LnfkOM+QX7j9+aaHndmCvTCIC6h91hpGup8MzTEpnynKjXdoZxh
	 Usa68LauI/yxnM5kMkcteBMqM+dXJyfmA5iNFArfOTIGaxktgx+JDT07pZ4cyp5WCp
	 RJVU3xKj+9JPMuxHQCCgPctfFqtgJdyYPfgycRKoUPiNWsNlh4uQ3IXOrzsSr2RUuK
	 3HI5zD73WDuBep40/gojfCA+imj5MFVoCsI2sh8WGdTWCWUOHO7pb5TtDN+zHaZNQR
	 /dGFUvq1H0erUXpjM0bBkQy5vww9kWFZVltHMqqlncqPB2xX3EiQG9TBiebx1FKkWH
	 b+HOoRLWRCDGg==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4932b13c4ccso1925502fac.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 04:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByYUDHQrsrRsUf7rfxH9/OKSg/IGiZq/P0xaHotqSWiMR2QQ3ncPMWVlS5UCXUdBRQxK/7qNBccUyFi@vger.kernel.org
X-Gm-Message-State: AFuF++krtu6jKL94+X3YHm2n1QAztfhE+qx/9diE3gJkS2w9oMh6nQvf
	6htPmCJ/FXBfU3GQHIzP6KLFZN2tmc++pEXtfzea1Qjo5MGSrbVJxshAnMJvBNPOBmSSJUk9nRI
	UInWDN9y1zKXSFnr2OTqkXI4TpyTJruA=
X-Received: by 2002:a05:6870:d406:b0:49d:999d:c25a with SMTP id
 586e51a60fabf-4a25915bdc1mr1996175fac.6.1791372950531; Wed, 07 Oct 2026
 04:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-6-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-6-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:35:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkupRELX-nA=ZWjCaE4=gzipE_njzxHtVXEo+7O3AUtag@mail.gmail.com>
X-Gm-Features: AclHuK8iblHRTpngvxt6CuhsOQoecYGccKQlKm7R1bCu_zgHyfj-gKel07yiWEg
Message-ID: <CAD++jLkupRELX-nA=ZWjCaE4=gzipE_njzxHtVXEo+7O3AUtag@mail.gmail.com>
Subject: Re: [PATCH v10 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
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

On Fri, Sep 25, 2026 at 8:54=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Patch applied!

Yours,
Linus Walleij
