Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CFB1E505
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 01:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787188736; cv=none; b=cHXSZSryET285XuarYf23kg2drPNknThCq5+whiSH2bhVzn2mhr/ncUs6gIDy7V/pZZvWOkm6PoR/qsruz6Jzvd4g+/FuIpZWF0VKbNPZSBitQ9L16O2pEj6OfTqbZVnNxxVQiRhypVNBNc3IgmHwm+AwwwnGOEiuwsdROxv4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787188736; c=relaxed/simple;
	bh=B0iwVfsliOt7PZkpYyDuxSx5CKYQp73DEnZxyRmPmys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvrFcdy+qafRi6AhqNSf6wJep1W+nkM9qms0h0Yo7grUQ+Uz9SW/upky2uF407qfSWWWnpdBzUweYROFt9LPMiEVPLPCMZOlqHahrBIe4bP0EkzIpoY+icz2PrAhX5zFJyU1b3jvlVzAEXv4ntrUNbm/Udr5rbMaVNS10lzBRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMxc9IhA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMxc9IhA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC751F00A3D
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 01:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787188734;
	bh=hXa7VE7lclLEE/NWNePufkX5LdNS07IQNxNNO1FQq04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NMxc9IhATD+jGIAtrmjEhS5gpDZpdHuO4WlsBOwEDg6RqAZeb1Ae8tMdVLH5DXWWJ
	 PTn6GefF1VwE8pjv/048qAir7d8+ELSOO9ArcVuL5gw3qJHviGyCducFkMg60fmeeU
	 vF42csWC347qcRS883SQg2nrUXaDtclbl4kZXz4LMHWGqKME3oc6W4bl7HdtAHqpa0
	 1zNlq1VwaOYeUsjBOBsd3R/Ttu7BYuXU8gzRKdfdP745Y2/kQefvcjIsC3g4o5yzw7
	 iYaTFpnRxVGOZ/nXVNOcGU8uspCUIpH0gzwt7pDiGsUAyMizUlvE8JLofbic7QfgDm
	 4wW4b2YM4cDPA==
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1711512f8f.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 18:18:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrzOz2Os2Ouh+VFsoKpfL3+vZqWtf0J8/91GeQ12EjHwrpoCoJNK+XOByFmTh3uS7nr8lVyvSlFge/r@vger.kernel.org
X-Gm-Message-State: AFuF++nKDvdfh5cpvRi45TqrVH0UPOeHVYY7GQBcTcHYVgeSfeENi+na
	lkgnl0vWBAr8pRmhQ6GWPs21OFgPE84TTGW1nRHm676x/OS8kXr9D5qjxfj4vyya8AJ2VowSjlQ
	w2QRTvjOeJLUAH2uJPLIrRAwNQ/VpOCM=
X-Received: by 2002:a05:6000:25f9:b0:47f:9266:9bde with SMTP id
 ffacd0b85a97d-482b1e84ce1mr17004800f8f.4.1787188733340; Wed, 19 Aug 2026
 18:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-xt_vendor_v2-v2-1-8d4eed65a533@kernel.org> <20260819-invincible-skua-of-defiance-bbb3b6@quoll>
In-Reply-To: <20260819-invincible-skua-of-defiance-bbb3b6@quoll>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Aug 2026 09:18:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRhPVQyy1XxF_aYBMrKbzOvtHMHo2TRDtLOHG7rL0m_KQ@mail.gmail.com>
X-Gm-Features: AcwNN1V_-YiWqPmUlMst4FcHoygKVgpGk_s4bmw7MSoGZ_CI2JzyU0NsLIM_1tk
Message-ID: <CAJF2gTRhPVQyy1XxF_aYBMrKbzOvtHMHo2TRDtLOHG7rL0m_KQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: vendor-prefixes: Add Xuantie Semiconductor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 5:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Aug 17, 2026 at 09:46:39AM +0000, GUO Ren (XuanTie) wrote:
> > Add the xuantie vendor prefix for Shanghai Xuantie Semiconductor
> > Technology Co., Ltd., which provides the XuanTie processor IP.
> >
> > Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> > ---
> > Add xuantie as the vendor prefix for Shanghai Xuantie Semiconductor
> > Technology Co., Ltd.
> >
> > The vendor information is available from the Xuantie declaration
> > page [1].
> >
> > [1] https://www.xrvm.com/declaration
> >
> > Changelog
> > V2:
> >  - Remove "Add Xuantie C906/C908/C910/C920 compatibles"
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> There was v2 of this and I already replied to it.
>
> Anyway, this without user makes no sense. Post your bindings WITH users.

Okay, Thx for your review.

--=20
Best Regards
 Guo Ren
