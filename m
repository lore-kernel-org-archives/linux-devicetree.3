Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211722C15A5
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601326; cv=none; b=N7D44+RjlmsI4O6Xt5fFKXQspciP/LLkgldM3lLMb+2jlwnV4m7018wOLlLnXnx5ICEZI8X6MdsW3IF3Ml2anv1iBXShnpms+2uKuHka+whQkBwY3ywmniDxS58huxyYVzDmaKV78+tJP1Wg0ujLi3PendVnZimVvA0HUqVjX6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601326; c=relaxed/simple;
	bh=67pfgw1RUjPhy++gF5wYhOfFilOFp0yV2un6UjmCyfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgsWl3s2fFitt+tS4uU504weOKw/e1fK14lekjcVck9yyUra59Bh5neWGa/F14VKI18VHyuUk/RJEhb5nKP8x7BoLZnIk38Zku7OO71GUDiwQlhdDSOOKjTxC2M1DiTp6YeWHPPi9tlchTGjHavydJDQ1Bbz0XM3sFmgE6VpPpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKYpojUt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKYpojUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1901F0089B
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790601324;
	bh=m5JXdVXHFH+9vAnED0PElQH0JF3TnHdGUEaHPQQDO9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EKYpojUt++NDw3l/XLWx5s/ffuUNzeTcxkDjsB+MEPxktq0diDOKGIzXep7Vfytey
	 ngQ1wP1+i3SZD7V0eqXr48pVbXENy52iRqSpkLzKY52Nj0wBPsOYU/3pda2M00Ajly
	 x5F1KYScERv0NL44KfOJ5dn1dgDIuESTsvjMpEhgCfRND+mjXoWTlGijKqdjEw5mlX
	 UvJT1rinCdCeA0iDiwnvY6ixnBYXoVZnwsP7mBcay/LJ6CV8HjBwiBVMhSGi8HN7zd
	 kTSWLaOFs29/Uv+SdlZxeyNxdj0cfslv3f2HQFHchsQeyBHnyJqveHi9CGZKWkTlIY
	 7pZLa1HtcJbTw==
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dc50c6eccso170120866b.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:15:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydqNVHoD8JD/rs4liPtBcv5U/Cjmwi9FLJFWetGIy5a4I9Kh1Ua+uk9lJLCYqwBX2plFqtbAnIk2vL@vger.kernel.org
X-Gm-Message-State: AFuF++nmQwNkgCoNiyAoaKryaKFWz8Lv6uyCn3F+Ijcxq4JdIJJnrx+E
	k8fC4MfFftdUZ/1qbOvT21WOCQtJ/rWw3DPRYsGZ20MPAnJWZoZE0qqxRNe+am92xxTpy2pqOYk
	rnb5VchIT206/Ji1BDv0rMh1HxloPKA==
X-Received: by 2002:a17:907:e107:b0:c2d:d702:364f with SMTP id
 a640c23a62f3a-c2dd7027971mr178948166b.3.1790601323321; Mon, 28 Sep 2026
 06:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928105951.2187076-1-matthias.goergens@gmail.com>
In-Reply-To: <20260928105951.2187076-1-matthias.goergens@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Sep 2026 08:15:11 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+k8GsoSgmSmVRMdOEj1fJMUZDvE02o7MsZhO9uWE0OcQ@mail.gmail.com>
X-Gm-Features: AclHuK97fQsqohUbAuSArkF3phLTBWgdSNNEFKv5ru8KaCj1LRv-Q4VZdBT0QxA
Message-ID: <CAL_Jsq+k8GsoSgmSmVRMdOEj1fJMUZDvE02o7MsZhO9uWE0OcQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: name the robh/linux for-next branch
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:59=E2=80=AFAM Matthias Goergens
<matthias.goergens@gmail.com> wrote:
>
> The T: entries for OPEN FIRMWARE AND FLATTENED DEVICE TREE and OPEN
> FIRMWARE AND FLATTENED DEVICE TREE BINDINGS name robh/linux without a
> branch.  The repository's HEAD points to branch master, which mainline
> already contains.  linux-next merges the for-next branch of this
> repository (Next/Trees).  Name that branch in both entries.
>
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> This is part of a cleanup of all T: entries whose repository HEAD is
> not where development happens: one patch per repository, sent in small
> batches.  The plan is at [1], and why it goes out in batches at [2].

Is doing this preferred over changing what HEAD points to? Happy to do eith=
er.

Rob
