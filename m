Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511BE4749F0
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946777; cv=none; b=StJrlwuBZPJWSNbjVnXG0Ohpu5qwmNRoGR6Mi1WLuzerQavNbPzUiCgPopwLertc8OvYHAmi/IWoBI2hQ//Kh7zXQm9Spv1SgG85shrbVO4Jx47ZPLKOL21b8siV0KADUO6aF0GZyvJAOxh4t644JH1fnFmHrMwq+N80I/o0ze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946777; c=relaxed/simple;
	bh=hFefkoPNJM5kRJ3jprUA2cLjjRE90ecDm60fBFyuR1o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iegJRBWXgFSKrarWBSMuZA/V8wPw4zCFQrqhg8skVXjaheIHioMIdm28LI6we4OCjPjn4Cuziv0TEGG6MqlgGJhHlVMC3PFtA9kvRh6k13LH+ZtH96GOowyojw/4WUajKn4bxq24SJqnUYugwEwQf++jDEYa+70ommkCHqlt2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvvdssQs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvvdssQs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276631F00ADF;
	Wed,  9 Sep 2026 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946768;
	bh=jKJWUlaaSGRmMnXY8ALHNMM1ax7eruaM9ttYwSs5p9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZvvdssQs/0Uovz0JvqqEOFlu761H05fxUYsKEbiGI8mp0Ul9WCUtKXcpOCsIUqTPx
	 3YbpxAMQVsVhlIZHqjCi0lqKj/Ly/kFeDZ8EYEx7sPpZo8KbOdfWYy12x+6gGYWy0J
	 iZiqtyAgQJOjhLjMz3uRFOAC3Zbh71GPqeN+Big/2ICaJRJsmbqp/xv+RxZwaGAY9/
	 pdk7xQJNMFMHL/erAkiLlru6H4TH4Tz8wiR2GPFz6BwhXCKsUa7VEA6H+ZTctdQnT5
	 DtSJ/72MLxfHLTCAE50+Y0BZCKL45XHqnEu4YpQszHc5tn6GGzGwgwLVr0v3BHdjOY
	 IUmyCntv/mQSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 2/4] net: dsa: tag_ks8995: Add the KS8995
 tag handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260908-ks8995-to-ksz8-v10-2-7379239eb65f@kernel.org>
References: <20260908-ks8995-to-ksz8-v10-0-7379239eb65f@kernel.org>
 <20260908-ks8995-to-ksz8-v10-2-7379239eb65f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:39:27 +0000
Message-Id: <20260909093928.276631F00ADF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Calling ilog2() with a zero value due to unvalidated portmask.
--

commit b59d7eee087d6b0879bef4bef35dc8e9d27f74bd
Author: Linus Walleij <linusw@kernel.org>

net: dsa: tag_ks8995: Add the KS8995 tag handling

This commit adds DSA tagging support for the Micrel KS8995 switch. It pushes
a special modified VLAN tag on transmit and processes it on receive to route
the frame to the appropriate user port.

> diff --git a/net/dsa/tag_ks8995.c b/net/dsa/tag_ks8995.c
> new file mode 100644
> index 0000000000000..9f6fdc1a9a076
> --- /dev/null
> +++ b/net/dsa/tag_ks8995.c
[ ... ]
> +static struct sk_buff *ks8995_rcv(struct sk_buff *skb, struct net_device=
 *dev)
> +{
> +	int portmask;
> +	u16 etype;
[ ... ]
> +	etype =3D ntohs(*(__be16 *)dsa_etype_header_pos_rx(skb));
> +	if ((etype & KS8995M_STPID_STD) !=3D ETH_P_8021Q) {
> +		netdev_dbg(dev, "%s: dropped ethertype 0x%04x\n",
> +			   __func__, etype);
> +		kfree_skb(skb);
> +		return NULL;
> +	}
[ ... ]
> +	portmask =3D FIELD_GET(KS8995M_STPID_PORTMASK, etype);
> +	netdev_dbg(dev, "%s: etype %04x portmask %04x (%d)\n",
> +		   __func__, etype, portmask, ilog2(portmask));
> +	skb->dev =3D dsa_conduit_find_user(dev, 0, ilog2(portmask));

[Severity: Medium]
Could this result in calling ilog2() with a zero value if a standard
802.1Q packet is received?

If the conduit interface receives a standard 802.1Q packet with ethertype
0x8100, the check (etype & KS8995M_STPID_STD) !=3D ETH_P_8021Q passes becau=
se
0x8100 & 0xFFF0 is 0x8100.

The code then extracts portmask as 0x8100 & 0x000F, which is 0, and
unconditionally passes it to ilog2() in both netdev_dbg() and
dsa_conduit_find_user().

The ilog2() macro is explicitly documented as having undefined behavior when
passed 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-ks8995-to-=
ksz8-v10-0-7379239eb65f@kernel.org?part=3D2
