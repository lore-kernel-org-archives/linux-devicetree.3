Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00B3264C8
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973826; cv=none; b=u7IrdFMMfhNE4PoL9PZTzrnP6joGgjCKCBBT5Q5VmCyIBVPw5p6dX12EpbTA655F9ZFU3XugXZnKbuTJQffy8/WsbZ3EtSkO6qj36j4tdQSf4cWsHd/TJLrOlzJcRBoP8pH+BbwzdYNhkS2jyajlwNjLYQmsc+OdGC3s2VBH0Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973826; c=relaxed/simple;
	bh=byZsLH1qJnr5XUYqbpWssvf4t8TS4Pv9mhclLh+CHIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t28RYrqidW/nwucb6onvo9HvJ/gYhuoOpmWPGAT0ngTn/3YO1E26xdOt5rVAVlooaoiY39b/+dY8Lu22CdNwvbaWgWqft3n+fcfrxxWJ/L4Yj1xTjQ/WvV3H82rPW61nryHOAvWky2wF213xYwWSzpDOJyAqBXxDYJDc2MWu6LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VpJ7aJv+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpJ7aJv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9514C2BCC7
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973825;
	bh=byZsLH1qJnr5XUYqbpWssvf4t8TS4Pv9mhclLh+CHIA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VpJ7aJv+FYkJSmFmvhnwPPXv7pTTxYrV3Hu69+ZwvR1PP+1x/gVahlERL4p4WUWxK
	 pTW3b/4Koy2may53/so0/iCadMQkEHjnsjsfnns1tnqr+dvpJVBI2MVw0RlazIRsPf
	 PN+p2PpApn6KS/JvpotTuilvlB5crf2P5mHw4X+2U8g/DhDSVIri7JbMQdDLfsbGd4
	 Rgo/iPVw27OFFkFPcjG6bRhSnM63WhDrimYUDCYVCHpl0FO5tCR7jg2jyX9tLJIItq
	 GgJSB06zAcbdhcpboUtxMsO6OMiVNtk5RCY1ZeCH1c39N/2sWplzn+2s5I/FalG0XY
	 FHQRUzfwXoLtQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-393a44854d2so14022841fa.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 02:37:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9EIgtpmfQIot+RMQ22M+PISTdJOZDXOMV41byPzLIQSWPCWs5VLzY12QqORa8yimDVMAdUNP9RuK2K@vger.kernel.org
X-Gm-Message-State: AOJu0YynMq9/ifKIzAUwa48BumxXVD/xtKz1ybcQqD9XNwg6anRyJwAH
	abtJgVW7DdEfTwNAKE5ASaQX2alGlQ+16OGTEdssJ4SyaF9F1MLk6oD7cdcD1lCQM5M3EtAG3yr
	EP6geoexdeOrdxPpY3/Mnn7P+c5OOnxM=
X-Received: by 2002:a05:651c:41dc:b0:38c:45f1:1eb7 with SMTP id
 38308e7fff4ca-393783ec7ecmr39396271fa.8.1777973824642; Tue, 05 May 2026
 02:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428191029.809462-1-mohamedaymanworkspace@gmail.com>
In-Reply-To: <20260428191029.809462-1-mohamedaymanworkspace@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:36:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLnVncsU3xmzRE2Qd2N-PvbwN2085zQ_rYtirJJHaxpHFQ@mail.gmail.com>
X-Gm-Features: AVHnY4KfHUdwiDmzBqLhufIE_2SrMZmBj7Ow-JJKquMo7HXRoyl_eHpQhojBhXg
Message-ID: <CAD++jLnVncsU3xmzRE2Qd2N-PvbwN2085zQ_rYtirJJHaxpHFQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Imre Kaloz <kaloz@openwrt.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 9:10=E2=80=AFPM Mohamed Ayman
<mohamedaymanworkspace@gmail.com> wrote:

> Convert remaining legacy integer GPIO specifiers to phandle-based
> descriptors in intel-ixp42x-actiontec-mi424wr.dtsi.
>
> All other GPIOs in this file already use &gpio0/&gpio1. These are the
> last remaining legacy users in the IXP4xx DTS files.
>
> Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>

I signed this off and sent to the SoC maintainers for application.

Yours,
Linus Walleij
