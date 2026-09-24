Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2320138DC7F
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 05:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227190; cv=pass; b=Tu0yDdJDsP6Y6/5Uva0sOMP4fd3GZwmSADCSIzq7hySpTQDKmAPlJlorAjWuhllDUv1x85+0QV+mIpXVnK/91g1GAnT7cOE/FBMYavDhJeO7Y4K32h5vKS386wXu0a18AQ5/8AOa2fV5N8fXpHlrg3cEaKEk+khHMDfDU6gSQ+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227190; c=relaxed/simple;
	bh=aZi2NFi10YHBsp1z9jKGGzufOnJ7M9wxb7MCM4kAzcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8HTJB52iPJc/ZadCi6Qt7EwOg378mMkq2aALg46QJbbdFkF37ppy9u65oQRV7hi5GA2x7bvgPzWQNBnyUu9AAX7AwWPNvKbUN9qG0Yml+doN95OHF7S6SR7g2MZ0iO3WOtUWGLKWLAuinlZABGD6VJ+Sqfne7WorzXbsQVK4NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDWnx0cC; arc=pass smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDWnx0cC"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c28e3998eb7so121680166b.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 22:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227187; cv=none;
        d=google.com; s=arc-20260327;
        b=C+u5h5GQkWeYbn/oe3wJR9YhYGGQ8gTvcsHnMqhtkAhvsudRsReWyJ5jdSVsPKBtxH
         OcVc2BgZLzvilYVyPV4BYs1bCaai0OQyJjJFowzSMNcUDhLqT8KawM7rWravzyxIY2Ko
         TgoaeKXgcRMfEiew93fTr3MHMf6s1TopX1f/mmK7SvKIM5Qvrz1F7YGceyfSWZw5AT31
         XGofq7+RnAK3JXHDba/kOJJ+uQVYienZuYjYWRt6oFE/6KxB0Q9LX0QDkfTr8yK1Rd0Z
         wt+E7EEKsR1C1ABTlZSUto8s6GQCI/6CU2+MM4wIQiPA7GusNJgQHWEtTCuCrHONPXlH
         sL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aZi2NFi10YHBsp1z9jKGGzufOnJ7M9wxb7MCM4kAzcQ=;
        fh=ZuQ9BQWrxfLeS2332jaw3h8W6glC4WATPppvL6/xe5o=;
        b=LtGE/9QsPGo0uWmra9+M5xaDWEYvhfNfyy4NpLAzGmXLqLwyXmBOsAfriENd7CAR1+
         gjjYL+vDk4iRvhInVlXdhLU2jMOMePte3fueO/30XwaGL9AgG5adEyuJwEw+0FNHAz60
         jVnS7I3srpJP8pDdk6Nwxuq02W2nr8ULQAUuJ4Bi/F976IjThxy5N4dqA5aUL0/8IIx4
         oxTaQRQuxpv/KsBDKJvD0V4BtnZLQF2tY8ylkQRLLPF9SIeoAt7/Y1t11qM1mTQsUBOQ
         nvShdsfa+IgJIeJU87DR+aFSO/t1Zx5U0joti5s6XKxvYkl1DWZWcKJX06em1TjcqNKh
         XIrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790227187; x=1790831987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZi2NFi10YHBsp1z9jKGGzufOnJ7M9wxb7MCM4kAzcQ=;
        b=VDWnx0cCKlVIgp7p4xiA2+jgNNm6Gpq7iu/J61rUqTBo5UtsvKAGKH7KIgwAAfrOeE
         FLf8wOnk6qNdkkqy50eGzs1LslLU4bcMOEecUbIkjvNCqorpbdZvpy9SS+fdfkEjg02w
         7APLZdH4n71+nJE1atMIfmr1YYohTFbnlqrFrpJskxP934k2p9tuCJG1+4VizoOiMKOS
         w+qf0u9hfgWsocfqrSjwQh1MfprZwWT2p7Nxyqxw0Y3c9a3ce7QO5eP7kV9Xce5LBFqu
         tTa7hAOAt0/2kqf3eVCnU1PuYk54E8sxD0nsG3GZdgUHOZSS9bruP3+z+SgNqHlSuhZE
         c5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227187; x=1790831987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZi2NFi10YHBsp1z9jKGGzufOnJ7M9wxb7MCM4kAzcQ=;
        b=Go9Vd0uqg1lRb16YvXI1PScDPHn1LY6RP95KM4oTY4jUsZVu3+suzFlQE6Fr9KfY2N
         IHHCebDVl31peUc5i/AHvBtXC94tnERzDAP5AwWekLPIpsZwWXs+4B47xqVWuiRNKrqE
         t3ojfed97IzD9N3sqnp44yirX0F9axI4umLoApvpHLnp5ybeMald486bLPCVkC/clzlN
         H8VgFYOKj1Vl3DbHFG8WXp18yF2lAn+AENauTZdQyOc+gZJTk2wxTJcwTgmcSAKGijGG
         R7Q6LSYhk1xyQO5dAG9K9JPrTcX/7JPvujEBUep8CpdCJCBKNqYdEwELb6/9BlDufeGl
         ybYA==
X-Forwarded-Encrypted: i=1; AKwUvBwuyA7RnNsPPhypAHse6u46Ba4ZNBuq7asPXSaXhIYrjsICS9CnyNwkgwLIdAF7KumqNwbf0LpQS0LP@vger.kernel.org
X-Gm-Message-State: AFuF++mjIf2R5QlTMcys7a8btWZTnl4lQUhYyA9dMGZnSgcGnGhjsC9k
	augkjFflfLXqozwfBJ8tRdRpLyLHgolN4MP/FNl06hU8XDQCMzg6T/ikFvOskZrh5Go0qddAYsY
	UKYLIupWDz7jm+X68IGAPu+wKFaghd9M=
X-Gm-Gg: AYBFou1jfWnIgdeuL8x7rVfQuLs1TlqbT/3HmrolsrGLpCZqZkGzok8NikRWiTPNzYK
	pIMfoTJgiGUbog/DAxsd/zBNby37ax9dapt/ePruQ9IvkMdyI5iUUhIAPesA4FT7T0TAdJPqgqE
	gTM7XQBPo06YzXNbKnP2BzMfc1OjWkGBQjXN/DIbp71iHoGJROttlXRXhMr/Qn/zjFINbMk+uOi
	N4JbfwRkgC/+FX+tJQ4HjK1iGp/mXSLRF2d+5ytuoG+8rrwKSEX2gmzHGgNONvzNXGOwtKIrDmz
	Gspf+MUzBZiu7EeHV+Ei7iNQ8ISBjpX5rf/f/geq40s93DnCmsqp0e4D8A==
X-Received: by 2002:a17:907:d0e:b0:c26:19de:9ad2 with SMTP id
 a640c23a62f3a-c2ac2350b4bmr97952466b.42.1790227187226; Wed, 23 Sep 2026
 22:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-6-coiaprant@gmail.com>
 <20260923200523.283221F00893@smtp.kernel.org>
In-Reply-To: <20260923200523.283221F00893@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 24 Sep 2026 13:19:35 +0800
X-Gm-Features: AclHuK_aBAIYVt_FhqySgCnrHx4QX15E0Szwa3KdjFmkTLDcEfRg1C4TlGocFf8
Message-ID: <CALj3r0ienmi95CNDDxqyiRsJAEe2w6vOzV2Gs=r6kpGvqab2rA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 05/11] arm64: dts: rockchip: rk3568: add XPCS
 and fixed-clock nodes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, olteanv@gmail.com, 
	linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, 
	robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8824=E6=97=A5=E5=91=
=A8=E5=9B=9B 04:05=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] arm64: dts: missing required phys and phy-names in xpcs node
> - [Low] arm64: dts: invalid status property in ethernet-pcs-mii subnodes

For the first point: dtbs_check skips required property validation for
disabled nodes, as confirmed by Rob Herring here:

https://lore.kernel.org/all/CAL_JsqJnOa_9Poz86vOWBCQigvv-Ab4Tt1hrwTxSa5zNra=
VxXQ@mail.gmail.com/

The xpcs node is disabled in the SoC dtsi, so phys and phy-names are
not required there. No change needed.

For the second point: status is a standard property that dt-validate
allows on all nodes, regardless of additionalProperties. Listing it in
properties are not required and not customary.

No changes needed.

Coia
