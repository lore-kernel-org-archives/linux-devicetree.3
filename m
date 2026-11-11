Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397977;
	b=wCbhPIkMiWz2k1jX0pcpbdhmeak1QUp8JzPbI422o5AosuERMrOcK0FiuaPy41g3Mocx
	 5rxQe69F8VGbA3SmQlKpJSlplGzK1H947eR+aR6mggyMIdgE9N4q72vMBvMUJGKHhP2n1
	 1bfgSF8pVzR/mJzKk7m8lyBoBr7WVnmDv/DTn6de4ebDhP9NubK9VHvfeo3HAPDhC7blh
	 3bXIZ/odFYo6aHO+Jpn1xgrMyHCat+ZWg82RaViP2gSGOT91lCfsIvykcsYus24xtoFY8
	 ppor2Dmj+By6sIzw/z8KJgn0+3c5Hzk5EN8jP6DFoPx+eOaGafBp4DalzCIGdZAvMRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397977;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MpHh2GYNJRtOhiRbv+gl4MVWrtLcyIbDIAcJ3i7bHZo=;
	b=n+wsbEtPKNxGvirVZQou18fAP4hgulKILYNnD4cSvNqRZb6FDq9idtdLhOBkB+TLv8xE
	 YpBvXElA3WixloSeyqVeJk1RLpVDF4igG2FMGFTA7awSSUAaCqfPtKLsXT2iBFskuC8Dc
	 zkFcuevPnB8sQ0HS4SyA+xSt+fEEG82ONgnqGyM2+qy1rm3JoMhwA3mXCn4rU91wdj5NQ
	 lRNTbCnN1ro56LCa8omfb8y3CMn5IjnSZdjwFjXi7Mf4bZbGqa95xFWOKEshY6SmuQ6ni
	 4YxZfTb8PpIDEczv5XPd3F1OVM4SG7ITVa33/MKT0GbLRTIhQM42numLTlA1mugKOPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nEO/Sns4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD9606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEO/Sns4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611801F00A05
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794397977;
	bh=MpHh2GYNJRtOhiRbv+gl4MVWrtLcyIbDIAcJ3i7bHZo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nEO/Sns4SgkX25DJRlGI4E7B61nZ+38OvpTIjlYgqCAzSEtzxMfTToh4zV/TvfOuP
	 7dsDlsKRAdcPNKg4jd0cF3HXsnai+5EiujODNzc2dBWQ0f7vzT2n5F9ejZsg0NxUnn
	 Ef1S4W/FVDaciFpTmvqKOsRgPFf45/jQru8+wr+YcEkI1GranxNVbBNpx0qKaoeuIK
	 JuLgV2iPhhYfRhlwTJlC6awPCByHfJlofyKile4lFdlM7OERj9QGoXtKDq+Fy94/Tq
	 OlZ3gqACcY4TKf/WgF9k1AKKK2jToOWgQyrl+JCHvMxIntRRdzftVuD0ltTZ/Jw3kQ
	 F00jsHD2BHVjg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab46699a09so27330841fa.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:52:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFHGXNht6nsmuD6+Y47ydWLRD6zOEmSQrvdgRZ0rX5iqu4GAAROjLid/I1M2H0QAGKZDu6Tm7GbP4LX@vger.kernel.org
X-Gm-Message-State: APuU4Z9m/vzZicpLtSR88jAH2dK4utN7YQFgiD7Oxt5wyXnvQ9iB4GNj
	GzV7PueBKMiKy2SAC4slv6L0LQsO5p2sdocKZDz+ldonXOMmUPMxn4dfS91KezWy/x1K9QVQRhY
	2ljPpudP0/rZbBfNqC8QYh+YlLEtEx00=
X-Received: by 2002:a05:651c:41c6:b0:3ab:43ca:1daa with SMTP id
 38308e7fff4ca-3ae125cd671mr4824141fa.3.1794397976185; Wed, 11 Nov 2026
 03:52:56 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-1-17035a5e8ad2@kernel.org> <sashiko-outbox-208856@kernel.org>
In-Reply-To: <sashiko-outbox-208856@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Nov 2026 12:52:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLkZXwXhHhvjQvbc4AT6Zt8mBVL0yujKoZOU+MsLvFFOng@mail.gmail.com>
X-Gm-Features: AclHuK8sYNT8b4r7s3hjp4u_srEnhvmeaQbZaxImLpGAFvZ6UoeInuaEUc5FNMg
Message-ID: <CAD++jLkZXwXhHhvjQvbc4AT6Zt8mBVL0yujKoZOU+MsLvFFOng@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: soc: Describe the BCM6846 Power
 Management Bus
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Medium]
> As reported by Philipp Zabel on RFC [1], should #clock-cells,
> #power-domain-cells, #reset-cells, #thermal-sensor-cells, and the
> reference clock be placed directly on the brcm,bcm6846-pmb node instead
> of requiring four address-less child nodes?

As was pointed out at device tree review these are different discrete devic=
es
and it does not properly model the hardware to bring them all into one node=
,
they also use resoures from each other so this will look super-messy if the
same node is requesting a host of resources from itsef.

IOW look at the later submissions and it's clear that this doesn't work.

Yours,
Linus Walleij
