Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30643A1D07
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347515; cv=none; b=Z1AvD+OWnfKzU6d03S63DtUmJwsnn8TfPN1zL/yLHYHhcTmgPu+DhO0ByCcAq1CXA3B4aIYoEBt+cZYPBh3PMQ/r686a0OpItS7THqFcNJXpnlG+Ip8gur/fP6WfOZ3oN6Mv2PUn0nMk3Mad7imQZCquqCGs/Qfs4iC5iqPDJ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347515; c=relaxed/simple;
	bh=OwQFHyb47/nCjdT+rp8oVYzWmWK/4kjtNN6SjuE2VqY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syFskoDF9K4Ns9320MpYf7jyC2IdXLujfYDWKNY2sIyRiihKFw+g9MGoUJujTe3A0rwlO1fivUjmqDGJYMOZYPLoy18TxNW9TKcq1NmsPPJKcxKBNX0Ld2q816sj9E9Mp4FNspaoJe38Rfa3q3D0AO1cOdbERGQBSyWsAfvDFsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=j3y7A7OI; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="j3y7A7OI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=bdbrvf4m5fhfffknshqtzcbnve.protonmail; t=1785347496; x=1785606696;
	bh=Nvabop0zm4uonzH0zzDptm+Kpsf6ujwvdHILYs5XWCY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=j3y7A7OIV58ZSQvK9RNzYnMMOrH9H5g3fVumitLIXxRBNi3uqPYKl+7pkhZaU+2pC
	 YkbRDMmB4XIMzYhxirZlj3xs6+sPez45sE/V/KVwYKmH5EAF0k758sc2nu4vhd7P5q
	 a37oPqBr75CgWZtnCNwdkq46J30nHktpYQJ+uWwrBfgTZsLK06gSxYEt//lGrcCClt
	 SJoN332C2geB1MYjLx2b8BY2Eae+jD/Aw6fBKH3jE18bJqJGxQL1AGwSEC9aEk1raP
	 nhCBVjfGgCvnSyKdmOfExTVyao4E1N9aKOfFjqKghdGNoyXJdbYBGju2EWx6PV7BG9
	 Z43O0nyKro3+w==
Date: Wed, 29 Jul 2026 17:51:31 +0000
To: Ferass El Hafidi <funderscore@postmarketos.org>
From: Robazza Alberto <robazza.alberto@proton.me>
Cc: linux-amlogic@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Orbbec
Message-ID: <XEr1g-aJeRsEJnbiy88DnzHi1_SQcZ0yL50jp2uYuQsQDw-eqyTfYI3xxoeVAWw7rVTwTTNPFGzA5FZBXguG5DAay2isJHh_RktUE_LWSn4=@proton.me>
In-Reply-To: <tiy37g.1ypi45yn8qibx@postmarketos.org>
References: <20260729141234.65037-1-robazzalberto@gmail.com> <20260729141234.65037-2-robazzalberto@gmail.com> <tiy37g.1ypi45yn8qibx@postmarketos.org>
Feedback-ID: 89419976:user:proton
X-Pm-Message-ID: 54e220e002fbf84dc033cd47950f2f0f59679da4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you for the feedback. I didn't ignored, indeed the suggestion was imp=
lemented in v4. My bad!

Regards,
Alberto

On Wednesday, July 29th, 2026 at 18:31, Ferass El Hafidi <funderscore@postm=
arketos.org> wrote:

> Hi Alberto,
>=20
> On Wed, 29 Jul 2026 14:12, Alberto Robazza <robazzalberto@gmail.com> wrot=
e:
> >Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
> >3D depth cameras and embedded vision boards.
> >
> >Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> >---
> > Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > 1 file changed, 2 insertions(+)
> >
>=20
> You seem to have missed Krzysztof's Acked-by tag in this patch:
> https://lore.kernel.org/all/20260729-unbreakable-observant-clam-ca4f6d@qu=
oll/
>=20
> Reviewers will typically give out Acked-by or Reviewed-by tags to your
> patch to signal that the patch looks good to them (typically the former t=
ag)
> or that they have reviewed it in great detail and approve it (typically t=
he
> latter tag). These tags need to be picked up and added to your patch.
>=20
> If you use b4 to send the patches, you can run `b4 trailers -u` each
> time before sending a new patchset revision to the mailing list to get
> all Acked-by and Reviewed-by tags reviewers will give to your patch.
> If you don't use b4, you should be able to add them manually still with
> git commands.
>=20
> If you don't have them added to your patch, it may sound like you
> ignored their review. Reviewing takes effort and is time-consuming,
> so always make sure you have all of them added.
>=20
> Also see: https://docs.kernel.org/process/submitting-patches.html
>=20
> Best regards,
> Ferass
>=20
> >diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Do=
cumentation/devicetree/bindings/vendor-prefixes.yaml
> >index 396044f36..a42899bd2 100644
> >--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >@@ -1251,6 +1251,8 @@ patternProperties:
> >     description: Option NV
> >   "^oranth,.*":
> >     description: Shenzhen Oranth Technology Co., Ltd.
> >+  "^orbbec,.*":
> >+    description: Orbbec Inc.
> >   "^ORCL,.*":
> >     description: Oracle Corporation
> >   "^orisetech,.*":
> >--
> >2.55.0
> >
> >
> >_______________________________________________
> >linux-amlogic mailing list
> >linux-amlogic@lists.infradead.org
> >http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
