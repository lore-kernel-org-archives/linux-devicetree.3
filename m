Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A88738F259
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 05:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994091; cv=pass; b=IH5tDsSi9WfON14knMa+6kn4AxtEipcJReq2kCF4E1bGbuZcgmhCdFUHCALY8PPaZ9I+p1edBS+lj7AwW6WdBjSXe36toSK6acI/xfhuMqzjAKbXQrNz0dPun3vOzsaFp1IyJKyFjZERPPtGGYKBgzUxbbKkcgVzrAq6ouMmk48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994091; c=relaxed/simple;
	bh=eQ+aEV/7pu/3GaCoFwag/RdEt/0S2Jc3568qzh4F/UQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUcigu66C14c0ECkn34AxTjJvAIWAcd77hTwtAK3pBiXJFEwLWOw2fH9gfy/mQ1Vws6ACGCXQdJTcDoe2kL31IjjC01Bugre6teuBrmZV9//XBmiUF9SYIabFGAVokoPs2tFMZlKIEG23+X1dFQo+eQL2Iid8mXaXAxbFparcuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFkhIWct; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFkhIWct"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce98cb8165so7151355ad.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 22:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785994086; cv=none;
        d=google.com; s=arc-20260327;
        b=fTvNJP2ClJlZCq9VcUZ6XOC5CfZ6CKSEVNdY7UughGr2JkyZcMqcs7s14T4CNwdego
         JQFSpGQZC/SscTvBMpaKPZqpD8uOQroXW4Y/vfMrzTSBNMaJCkF8MSUbrgyce2juZ1lh
         9AHZafxN+EdEVHrQRakmVGEEoMHFsaC410kbMO360giHpcuB9MfGrSn1juZ9Ofs4ZPs/
         ZvR0S8ZeBrnTjTEYmXhSDjeegqbai7GL0pMjPAgpXKBSSGQOOpL4tccAowNgK7ANdk9F
         jT5WzayV9W7Bx3WuKUsXOJxdTAzhK992kv5bAeqRpHHgnfN3iS9wnONiwugDMMiim6/s
         MOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        fh=chZrBpjX/Z5UGQpOtTlGBU8beZ2wGMv0RAOxV2Wz1hc=;
        b=owYFhKRNpHjk+MlM9Jv61e1xXf9izwgfL+88xCSEe+IpRaLrVWgGs2BzEqbfJpTP2L
         6yL5S45W5cWJkKzVKFDBPRPROuoIn9NlMvU2qVp1JC+Eb8ti19LOt5TxCgzhmitYGA4H
         42ye9VfLg5RK8aoQFkOEQYERSc85ISbM0hquIDHEcLPG/dyjzzeG7jetY4erY/wuDMYr
         WJVfehWFg0xgNwDOLs+r6sDK7WLcMiyUMOU+YwurcPsFtcS5HIiOarcXFQmqLG+Cnwuq
         4Wk4RtKWxd3u5FkgAuGpnfQ8eeywM1/Lizot9HuG91Ebf28AJtDjvIG2OC/npkCyjzX9
         SJBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785994086; x=1786598886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        b=SFkhIWctl6AMl+XMhiyiRjSQiVZuYa6fIc012iOUhcYGp/J8lfkiaC5/8OKU6mNGVg
         FfHrapp7wDvoYnAo3glm3wVqL7VkpH9IfAzwypBatMRjpMiZsoOcvOc/Bvu86xk1EnOg
         KZF3JCQjZrL1VKQf6K1MN/qnFvPIIIUTodctl5+pDFbGT7CjLMJxKqEfhL5CbXmD8P1A
         pmjo3Xs9u20fX+1B4KqoRFtaEXianCzFMERV8sgNUBOTudJCjEPoaFsIJZxoEGgHZTpy
         wvcFr6TJjMtEju9XDiGaP36qe4EUNNe5+OYpAHy0m8HBo4UIU+92KCnrAVqNrJ5o+0jN
         o6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994086; x=1786598886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/chxC2eDdGa6xrgCohNp7hs/WOpE04paX2N4M4f+KM=;
        b=g6zKJ0vCjXYHbhpfdUcypdKJHatixS9nSl8U/mUMIx74JJQoUDiVBPWDiRKItCMRZ1
         Md8kMEm40t/988/2HNy0OcsJdxvb3n+R+28PNDVXgwMid0qKn2nzIGO0eU3MIctsYLq3
         2kJ9osyU6RyvgLb9NkC4WPppOVB4UR65W1I8eYiiaHQpWLXw5A6Lt7drr77gf+TC04qS
         KaRdhH5KATM4ssmcsMJ2fdmXgN3oka/eO3xPWncO4Yk5YaMHwQ0BQBzQwgMny9qswVgB
         jtLvR73nx1Px8S4UYJPK+LHLIeQdcYBL6+dBTr4Ix/thy/KXDZQqN9LnJRqAftgQ/Zmz
         ubeg==
X-Forwarded-Encrypted: i=1; AHgh+RrgHenPGoauR2x3B22e9cwcF8Nb9LKrxpKuMXjSmHBE6HylL2wqu/d2Bmx+8T+pU/dTl1jLS7kJ7LNh@vger.kernel.org
X-Gm-Message-State: AOJu0YzxEO18sEje+TWKQHOH4svgRw+f6Uq+uS9bU40egZkgH/7uSgJg
	4Np4wIxvflNUua9UwcWE2U2KhnBBb8YK1fx7tOCscj20P4+LtpdxtOTowWKTO1VDfRhyhRHrnMP
	KfQ522t+0hTzF/D+deGqkcr4IR67o/zbHr1IH
X-Gm-Gg: AR+sD11csJLg64QxkFFjTTAY0LnB17tYwEAb2Fz+JrmH0B+t+/U73nlFPi8IJoXT+32
	Hw5hAzjg2bSWdPXkMxDqC5erAHR7f5g4Q8y6Ig/4FGZlV+GjI/VjnWdyHoBHox9Yzjaf9see6+t
	KEbc+ZND0UA9ONTCdQq53TkXIJqJZ8uNtffCL24FQ58YGn37+/lQzvazhkyJtmqDaRYGgX9KKmI
	e4fHpxmnlJDerMmPLM0784KtyC9XZna0iwZMkzgeCt7Fctmhmm6dCKGgs2zA2s1HZTtbUZBHBz5
	BDWx5Ir9n0OWOaKsodqc16YULrNJ+FBpXV3LxYLMERdV
X-Received: by 2002:a17:903:228b:b0:2ca:eff:ff58 with SMTP id
 d9443c01a7336-2d0f710991amr9793645ad.15.1785994085793; Wed, 05 Aug 2026
 22:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <anH5i7y3JkB1moee@SMW015318>
 <CAA+D8ANCoc5qOUvTQPRNkvrfqAY3n6x_fbfUveP8Sfv+SL1NVw@mail.gmail.com> <anNtgkZYhoWsSRr6@SMW015318>
In-Reply-To: <anNtgkZYhoWsSRr6@SMW015318>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 Aug 2026 13:27:51 +0800
X-Gm-Features: AUfX_myhLzhOuWWyjCG9X66ATeLQftPHIJVdiIW_bTxwa_fBiVstKxt6vFHm5B8
Message-ID: <CAA+D8APMT2eSgrc37n_YZ4PsDZ-_8h4gHsyhADGGYDpTob_g+Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Frank Li <Frank.li@oss.nxp.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 1:06=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> On Wed, Aug 05, 2026 at 02:57:59PM +0800, Shengjiu Wang wrote:
> > On Tue, Aug 4, 2026 at 10:39=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com>=
 wrote:
> > >
> > > On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com w=
rote:
> > > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > >
> > > > The i.MX ASRC hardware supports up to three conversion pairs (A, B,=
 C).
> > > > The existing binding exposed only a single generic audio-graph port=
,
> > > > which cannot represent independent conversion paths when multiple p=
airs
> > > > are in use simultaneously.
> > > >
> > > > Add a ports container that enumerates up to three sub-ports, each
> > > > representing an independent conversion path:
> > > >   port@0 -- conversion path 0
> > > >   port@1 -- conversion path 1
> > > >   port@2 -- conversion path 2
> > > >
> > > > Each sub-port references audio-graph-port.yaml as before. Hardware =
pairs
> > > > are allocated dynamically at stream open time; each active stream
> > > > direction (playback or capture) on a port consumes one hardware pai=
r.
> > > >
> > > > For backwards compatibility, keep the old single port property but =
mark
> > > > it deprecated. A schema constraint (not: required: [port, ports]) e=
nsures
> > > > that both forms cannot be used at the same time. The binding exampl=
e is
> > > > updated to show the preferred ports form.
> > > >
> > > > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > > > documented single 'port' node, so this change does not break any
> > > > in-tree device tree.
> > >
> > > if no existing upstream DTS file use it, you can direct replace with =
ports
> >
> > That is to avoid any downstream use of the 'port', so not directly repl=
ace it.
>
> Does downstream strictly run DTB_CHECK ?

I don't know if anyone downstream uses the 'port' or not.  so keep it
in this file but
mark it is as deprecated to avoid any impact of this change (add 'ports')

Best regards
Shengjiu Wang
