Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2F0481675
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328090; cv=pass; b=evNVWXbu7SAGGlWsjByJyoA/oeRc3aj6uh1X70VZlxi55ajxGh4CBmWzpwtFT/+V69pMYvSwc7J+HLtEnFpxOnQ5n4P84bU6IJcQtVW0c93sr6iYHHNYFUNdeLotp71UMeWK1LrucoS9knmCQhsNfCFhwDCpFpt4XQm8E650HKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328090; c=relaxed/simple;
	bh=NCueJ4dcU3NpqgGF7u84YtQGIxF+FQ97Y+VznPDBXYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=STLEoptCwpvz28PQR4jhDdVKlmRBHSf8sLtAovtnWnZLC72oEQFXwuLGidQvJsSbijbzdec2GsfTuefxybGuVjLdLvvhnGQQnIr1fTr+rVUXR24ehOfAzgnqYwsOHNClf7BcoZD2K9scch/fuI70pej8IJswQFIPnPOEI0LIEdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFnL5Uni; arc=pass smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFnL5Uni"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-482f6351832so357732f8f.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790328083; cv=none;
        d=google.com; s=arc-20260327;
        b=fLO1cLMlD/yAVyf682IszDFLB0eZV4k/TKMSvJlli8JBszgWaEAZNjGNR4OZrsStPD
         xY8rrPIcP99FqjFiLqEgtQeGlWWkZCVlOjvztcyJ0ZdFCBo0DgwA24zenjJYVEou0ojp
         TQjB8zxVPRgnl97Qeo4uRrfBBd8lElKKekhh0XKlnWiul01Vl6cT4wj3/NMbejThzESS
         kFodDYn2l7sjWU0jtgGEuZ0DxGELkFo63M79adfMxRAC2UczmenMkdGjhOxuLkiziQky
         jVO2mWrbfzLLCmqxfpg/McXQ/PrVMl8zW1bWLLEIECvm54+14rvwhk7yOw0njicRVsCH
         aiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZlooN9kx6gRrXmg2e0W2xusZ6bAGGvgElZ4hCzz0Zhs=;
        fh=X4d71o+Fi3wRcyh6DaHS2N1HO1uOF2hs72gxfEAdSuA=;
        b=VQxcXU+BiDDknhZ34aLeVzMXe3QVr/Q53uJOmucGmYvvR1jEMUoIDtHapFaJAt03+G
         mEbxyNrYhenW3yZCtFa2VDbZUnbjHErMaAFH08oYL8IsAXTupF/4OzUfujET2OxPvLc1
         9VtAVJjuFx3CLv0otovrQHkjaWYW8GTT2+j34BLSMEZuu+vP6ytA+c9mJA65q8ALPO3O
         YBVeBcUZDpp8eC4xbpY8B/76C32T3IB62ckppZSlSv8Wcmqd//2DcciExUOmwFS7Q+Bv
         c+F1xgb80U7VRK6O7fzg/NHXnBY9S45X8pfLyAPH14GgYk0G32c+HARAmYL4vQlTq6sk
         wovA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790328083; x=1790932883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZlooN9kx6gRrXmg2e0W2xusZ6bAGGvgElZ4hCzz0Zhs=;
        b=BFnL5UniNGwXofIkCcNfbm68Zfk73lgHVuQq3Q1AZcFbNpcVVz5p0spJ2rmKrc9dt4
         Cj3OO7PsFnuKItjfAzUjRANDGpn/OJZa8BhBX3e2l2Nbnucz9Su7KsrGOFk19654nCbA
         DlvIKmpG20HysfCq0FUnbD+6HTwsQjWwjjKaUgX+NTGCFTQmEjYTMG+IJZLtaZbL1+Jz
         T6D2sPTxFFXvKauUOjZhyK48/ouoGTNntwzl1WbulGHyoTyWdfQoTMlSdMoQcElVSWmz
         8jZwqifkZiwEGu1Vpm5PvcC0tymaZNOjxMWENS+Ggu4UdSbkaX6tJUQ0Q0ty5JufvMsr
         qTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328083; x=1790932883;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlooN9kx6gRrXmg2e0W2xusZ6bAGGvgElZ4hCzz0Zhs=;
        b=SBCc39koNhylwlHEqsNUbANo5EZhgxEOvpkqRdnOBt/YQKWbAmglprnr8Df6lvGrOZ
         hxkBndFRMV2YhHzToHgCNLHhuIuDhordzBwoUhZHmy76J0/GyGb+LOtEQD5gPD71GDom
         JvhDP0hN4ktJCWl1h98PQaYrW33L8P2LUMgDWhlYE58Ojn8J3f1KVJ4vbuziriPxmuN7
         /M5frqEeOQ6rekd/fieRzqkKh0PwUbc21XwBspymVvwwm8YgqR0QqnA/Ch5hrP2enLfF
         ceS8KvTDT94y9bmQdwYkZ4PH84w6lceigbDep+xvnJ0yclQKZrAzWNa7wMgypeJ+fMb5
         wAcA==
X-Forwarded-Encrypted: i=1; AKwUvByGmM9F4Dg8LpuurvdgVQiFMd7miL5kIeC+bdC4ejGENwIhLa0juUP/8XVi6BvsymEcuh/TKJsXcV8H@vger.kernel.org
X-Gm-Message-State: AFuF++m1AV7QRuMhYHVC/kesX2rJGdjJzxku4m6SJ99FR+veJCewLdIx
	6MXFC0v0T5h2q53bsuck76qETTnK+QtmEJ4QDBswU2h1//anozV4yeDlHHitlBDOFvhP1v9FlLB
	IzkZxzJyyBJI39kiHKpKpCEyqgLT1mT4=
X-Gm-Gg: AYBFou0VkYOWNWj5T0Mso9IXrjmZSQe/FlCdMXySZ1yQOplg46yEKSaZXC9s8wdVfm9
	AzNZBXk1bTIK8+hBeKBheRl+rVH0hoxkCOqznzAnY2LbwLL6fXFNDJcbOlphu9Xqki6Z1hJIESp
	BNM8pxpyWXgd54jHrc5idWimFCL4yDHf77+5F2BrVCDPVKMeup12wG9D4U706hnH/+jRVkzb7pZ
	VE/TwlcytT1o/noCnxkyCIl/CAlJI5IYA/kqC4sYkwMDgkJA+zlRoT1s5Kmug8ThcD+yqbaUbIX
	+Mbfp7Br/RyQPza41DyWfc3Pw3VVBgeW00GY95B0ngYRiBWo78rJ6kaQ5WqahaOH1DhQUlc2r/D
	pWLYN5YE4CloRkAVpPLNqLbUzshksw2aiBLE6NDzH51w4E2v1LviioQnkB23dMs6UAOb/opQV
X-Received: by 2002:a05:6000:460f:b0:487:a46:a9cf with SMTP id
 ffacd0b85a97d-4887174c0famr8766945f8f.29.1790328083300; Fri, 25 Sep 2026
 02:21:23 -0700 (PDT)
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
 <CA+V-a8t3HKQ6D8jb_y-XM64BHkWm3vRw6JiTydSp3rqVr9nhdg@mail.gmail.com> <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com>
In-Reply-To: <CAMuHMdXZwnRtp=f0iOiDqoLVjBTGVYNbbLeP9E3qjTn3RUEkUg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Sep 2026 10:20:56 +0100
X-Gm-Features: AclHuK--x_qeFFnhJWfBmO_fp3zwDw0cPGYw1M7_Cyl9HfxYZY4jYF_Kzh6z3Zs
Message-ID: <CA+V-a8tzLEScwpJ1Va-vpEHdJeOjo4v6K8_xTH=aAGZoxFHHbA@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Guenter Roeck <linux@roeck-us.net>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, "robh@kernel.org" <robh@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Sep 25, 2026 at 10:09=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 25 Sept 2026 at 11:06, Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Sep 25, 2026 at 6:11=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > > > On Fri, Sep 25, 2026 at 04:13:24AM +0000, Biju Das wrote:
> > > > > Just a question,
> > > > > For automatic software upgrade, if the reboot using PSCI fails, w=
hat
> > > > > is the fallback for reboot, reset the board?
> > > >
> > > > That seems to be a bit theoretic. The reason for having the ability=
 to register multiple restart handlers
> > > > is not to have failure fallbacks, but to have fallbacks if preferre=
d restart handlers are not available.
> > > > If the PSCI restart handler is present, it is expected to work.
> > > > That is why it has higher priority. The idea is to use the highest =
priority restart handler, not to try
> > > > one after another.
> > > >
> > > > Sure, the failure fallback works as well, but that doesn't mean tha=
t fallbacks should be provided just to
> > > > provide fallbacks.
> > > >
> > > > If you claim that the PSCI restart handler does not work on this sy=
stem, provide evicence, and we can
> > > > discuss this further.
> > >
> > > I agree normal cases there won't be any failures
> > >
> > > I never heard about PSCI restart fails. But have seen a case due to a=
 bug in
>
> Oh yes, if PSCI is not really implemented ;-)
>
> > > serial driver that made the PSCI restart to fail as it hangs the syst=
ems.
> > >
> > > So, if this is the case, a memory corruption can cause the same.
> > >
> > > Long back I worked on femto based product(single core), where we have=
 normal restart
> > > and a fallback watchdog restart. But it does not have PSCI system han=
dlers.
> > > On some cases, we have seen automatic upgrade failed because of failu=
re in
> > > normal restart.
> > >
> > If you think the PSCI might fail and not restart the machine the other
> > alternative would be to export functions to configure WDTDCR using
> > readl/writel.
>
> Well, if PSCI resets fails: that's exactly why you have a watchdog
> (or two) in the system, right?
>
Agreed, To avoid taking the syscon lock from restart context, how
about exporting helpers from the CPG/MSSR driver to start/stop the
WDTDCR count using plain readl/writel? Each WDTDCR register belongs to
a single watchdog instance, so no locking is needed.

  /* include/linux/soc/renesas/renesas.h */
  int rzt2h_cpg_wdtdcr_count_start(unsigned int wdt_index);
  int rzt2h_cpg_wdtdcr_count_stop(unsigned int wdt_index);

Cheers,
Prabhakar
