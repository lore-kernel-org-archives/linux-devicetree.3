Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B89C47126F
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327198; cv=pass; b=Xz2zLO34iOYXNHytvqiYKm7j745PkzU36KkUsab2UAzmucrFCO7MvXjFNthaCTZK+Y5GrWE39p/heK/LvijKHuw3CiOdx6tG99xP5dfWCApaOxUF5zcWzk9IE3L8w7sKRAzF7w2O+X1dxMOZZaWU/ZH1txdUQ+Dy8ylQJjqi14Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327198; c=relaxed/simple;
	bh=vNfrt1r00h69iVK9kwlxNnrlpJK7TpbbLBmXJ3dGSlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4y1FoPclkZF0zKxX/D/IRfdmtYXwxgkAjUDv+goh4kgDiYei8Kx8BLcCLVrF9C7oAwbN91HYPkht6QC+SihS98pcGxa6ihTTce8tXvlEpkLdjIlB6LZdO7ge7FgswbW075TEyZhZ4CvFk6I6FxTPQ9N4GHieMQryhueL/eM5qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8aGv9GC; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8aGv9GC"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so271858f8f.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790327194; cv=none;
        d=google.com; s=arc-20260327;
        b=Qknhfj/aGUpYP+cwKEFhtvsVNEaZayC9VzK8g/48A+LX4iC1GQg5YoCmHJEYERbcW5
         tHKa93WSRZTI3vJcXJygvPehoQj+Q+4BXWruwJyVdEZ04KcYryNYCxiXIB5s7IpUsgTZ
         hDNizrNYbEWAmCImD1BZI5mKR2+3lDl6aqNP2QZ/QQvLUfzbrixn9HHXPEXsibpEC3vs
         U+Sr/Sr2JhYTSCAMqR9ODzx6vFNVfZF5Q0rKWJclnAafNvJ9qXDEYLXc9qBXDZKcOZW4
         b/QOde/P+3SW5qy1D+MQ+WsuV5Gc7HYk/SwF2zByB8DH/55k1p7+DC9TCv/TrpldQkXz
         3oAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vNfrt1r00h69iVK9kwlxNnrlpJK7TpbbLBmXJ3dGSlU=;
        fh=yZ0JGP5SsHUE9KkdIpWF1AfqZGcBe57DqtjGnkEzXxg=;
        b=dj+aSvxhvNdyDWw0QAsv74I1j1pIQrGaRDxjbcFkS1u4BQB5ZRHp/uuSdLbnkVRou+
         cDp+6u/FKceQ/+LNOpkozZKac17e742XUjcx8Z4Rsi9EHOxRdbkJt+FUwDPEnsK/XrxL
         CdovhSu22cltvfQaDaC/rUEQBH5d44aoypL/PWAdVf50GvIK7OH0Zar1th3zhDAEuqvi
         F0ZPiqVlbZZUVgmSBCEJ7ZxgSTFPJAjRwvRs0yija5L6TMwOx5957yK+EFBwmMqmgtOS
         0lfeKOF3AjCybqzcKCmhFK6QoOYR4+7i+cB+lK5oabua9NA/CI4gbWwCkg3HfP/mvKAe
         9lNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790327194; x=1790931994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vNfrt1r00h69iVK9kwlxNnrlpJK7TpbbLBmXJ3dGSlU=;
        b=R8aGv9GCEXuCBoR5uWOBG6O0DMiO9/8OiajQluEPoHpwUx9vcMS24D5M9+sk/imAXX
         8nPq32hQlxhmrLOWD48KB9/a3WlS6w6Yi9z9jVinJPUOkHhau8C+dpunY8exj9m4cjyL
         s3UrGSPz5O3K9IKq6NVTGiLNMkidX0JwgVuZwHEBDLsxw1N/Xj9e14iURX7uzSz6s4sj
         Nre5u7UlA5ITlaLCr7H57BJjGvkGVoGhjOfXmGMQAeho8DCSxIbg4TDo8sxr0TkhwOnd
         BAFrlWRMOfuTfHIRR0az6h55Fus/wsnzNUpa2zoemv+tUNH30LOX6i3FDx5sz+92WBKb
         LYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327194; x=1790931994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNfrt1r00h69iVK9kwlxNnrlpJK7TpbbLBmXJ3dGSlU=;
        b=0J4M01Dc+zR9gceHvyPmkkscGZbgoxedsBFs0Lp2tmgN+VKxYQqE9pM44B+3707ALx
         XQYtvVB4NjHt4ICHibXDEQbzvSTU0jMY42zT8YNoRSJxgUNmeunpKB9QGDPlpmpDoovT
         ewVLeJgRBvjf4v7Gs9H0W3ecKLUDOh3+XnmdqQFyJPOcuSQ6J17gsTDfiRZK1SCSZh1m
         sde7BVsHpZLqsNR1rbCJUPdpI3dAPEgCQL+t2iE11kqRmsyqF2Hj/ZEp2HcpRj4ubojd
         0pm2nIWgoWW1wPnwp5ZmhMm1Hz75JUbxKF7WA2y3y0HqPiBgtjz2WFzh9j3NMyWD+2l4
         CBTA==
X-Forwarded-Encrypted: i=1; AKwUvBzfE6dNPUwhOsdVHXq4i+nioWP+izk7v1fFZwaHEDmdC0UULv18q1sIg4JxwBDhxomKtxq9a5wQ8hvZ@vger.kernel.org
X-Gm-Message-State: AFuF++l6cjSDF89528Rc8g2IJlyaf5dsgY1NYBcAuw1zOf4ms1R4uTmx
	LzYOClv8rAYIFilk/BPPfdhFtHh3kBn/v/IgcHzOuBe8t11M9ORgVjcKtPFf7htBKaDDN3miKvy
	gJqH8sElxtoG/uUdFgeAzDfumY1YD1y6lBaytYvs=
X-Gm-Gg: AYBFou2jizQ8CNYGPM7GzNTI/9AWcl9o8qw4IiNtcA8n8vmiygNS23Bt6M5dmdN5SXq
	vlW/IqtXeZhGiQhGtEu2UrAOscKazhYdeTKtX2SihOwPFPI7GG0y1POzu3uIAHFRbp7jVYK3OMF
	nEBETigdLbxuguK83LJRhDLU0L7C+zdLyPsAHnBSJHoBu8vk/epiGpc0So17PbXUnumD2yZseyV
	5Xkavvd3c73lE3xM0GbbvH5Np6r+lIcLBfDRKDbDPXPSZb9FOHCnzME0v6pqvUe+GOWu0rIz5Us
	lDBwEVYcr524yJbcQiCKAlXrT09oiSOy5x0FgWO0HlVXYe+ksyBMKcLvhusnogixlMEgZCH35RQ
	DwlRCoRmrUcIpd1BcsjWxTmccTY8ZxIzcEZG9//7xUsU1I1YbssbPXhNusfI4/EzlC2cVl7Y/
X-Received: by 2002:a05:6000:40e1:b0:487:62d:37d9 with SMTP id
 ffacd0b85a97d-488716a5e3amr8597568f8f.27.1790327194104; Fri, 25 Sep 2026
 02:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923105237.7B87D1F00893@smtp.kernel.org> <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
 <4f5aadf0-8f23-4871-918f-430a0c99900d@roeck-us.net> <TY3PR01MB11346CC8B3C7374C293E0F3EB86802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2d32d7f1-f87b-45b3-9ccd-95e9773ca658@roeck-us.net> <TY3PR01MB113461EFFC2B9B39A53ED1D3386802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113461EFFC2B9B39A53ED1D3386802@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Sep 2026 10:06:07 +0100
X-Gm-Features: AclHuK_cnyrPiFUC-mGji0jHGuw7oeqC1g44QAFCgRUUpyFQSgbBoQ_H6jT1WEc
Message-ID: <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, "robh@kernel.org" <robh@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Sep 25, 2026 at 6:11=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Guenter,
>
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: 25 September 2026 05:51
> > Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDT=
DCR
> >
> > On Fri, Sep 25, 2026 at 04:13:24AM +0000, Biju Das wrote:
> > > Hi Geunter/Prabhakar,
> > >
> > ...
> > > Just a question,
> > > For automatic software upgrade, if the reboot using PSCI fails, what
> > > is the fallback for reboot, reset the board?
> >
> > That seems to be a bit theoretic. The reason for having the ability to =
register multiple restart handlers
> > is not to have failure fallbacks, but to have fallbacks if preferred re=
start handlers are not available.
> > If the PSCI restart handler is present, it is expected to work.
> > That is why it has higher priority. The idea is to use the highest prio=
rity restart handler, not to try
> > one after another.
> >
> > Sure, the failure fallback works as well, but that doesn't mean that fa=
llbacks should be provided just to
> > provide fallbacks.
> >
> > If you claim that the PSCI restart handler does not work on this system=
, provide evicence, and we can
> > discuss this further.
>
> I agree normal cases there won't be any failures
>
> I never heard about PSCI restart fails. But have seen a case due to a bug=
 in
> serial driver that made the PSCI restart to fail as it hangs the systems.
>
> So, if this is the case, a memory corruption can cause the same.
>
> Long back I worked on femto based product(single core), where we have nor=
mal restart
> and a fallback watchdog restart. But it does not have PSCI system handler=
s.
> On some cases, we have seen automatic upgrade failed because of failure i=
n
> normal restart.
>
If you think the PSCI might fail and not restart the machine the other
alternative would be to export functions to configure WDTDCR using
readl/writel.

Geert/Guenter - are you OK with the above approach.

Cheers,
Prabhakar
