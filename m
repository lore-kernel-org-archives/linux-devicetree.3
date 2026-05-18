Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B2333D6EE
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101012; cv=pass; b=QSTe+y3qjGACxNWkkYxhMMqrBykFelPr/Ou7xvSJUlaaraMpZyIX8bpYFV+RuUtoveFwD1v2V71qDGWJ8PPpWUqDdusNxVdcvGGSEkD+4MzcTTUopw9k+ishCYKDVV3uk//xbMszeanyCqQoCzWxuX52rJ3aik1jwbGncE0vR2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101012; c=relaxed/simple;
	bh=GUDiqMKxUkyql+ieSQMchvY7+PNscZUs2YYfGrsSLkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cH7u9qkg08XuoXXhnxLbjB94bCJNWRVZjwWgdq7DeJtc0rM6YTk02O+SKihKhCM7Kzj3j1W5dstZ8DkuAbx+welHmCNMoqMZ5qOhQssAlj2jEXULrdNzVBu/gfWfetkJtbsztBRBvDjKuyqnlzYVMVcScjx4PuYwxAUpY1FkSWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DF90+RKb; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DF90+RKb"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-63127c440ccso1609579137.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779101005; cv=none;
        d=google.com; s=arc-20240605;
        b=WDdLN76L/D5qP0WgN4W6Ay++Nir5QKF63+9c5KhO+GHeBxu31X3AVcd/KH0HJG/iFh
         cKLyzIJzviKSI/75KhJ0DCkRPtURMv51AM0tuKQMqUdCyV4Yi1+50bRiyhnrUPIdSZye
         zsYLBfs5LHQAcTX2ZZIHKIRAgNs1fqZOeodVDcWsG2rKjhLXAiT4blcNq+ob+TUOSHjX
         IkowJT5dFo0C/1k2GgiHU5rj1/y6+Jzyys3T4SP8O0AaAU/qrSbxJDozd7sCu25qHbcL
         Kr+5fnBW1lMfkrKkj+VvY9yE8X4TuA8mh7EME8dRjrQVQepNJ0BXrWGis1CpNtxB8Ilh
         X4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xTs49byiOKMbFqwJ3wm4pcmStKZPG6RE7CVuUJdE960=;
        fh=0G4cHlQ8kvJ5D2I/fZ3zI32ViK5mSq6XfoUQov4OjMU=;
        b=MurW3JbJ+dzEZAYmmsaQNBaDosAWPfW/jZ9yLryFCfZVr75WBTtKIxCMWs0DaKp2eG
         rneBQ4ZHZdFobUERW0xnPVu14UyYg7eiKRjVmGbuXTKkgHIFj1FtyJYZ9og+fvvthtNZ
         BfawRsOsIiMbuBfMuYGbj0lprGOiXiogdBUTksJYs+vbFbCWoD0+0k/6QwHO5l1Wr4ZO
         X4VN154OSP3fl0clbxvu0/eQB4MdNpaq+rB5HxAafa5oS7dnFQSqc9unoPirKCgUOM11
         LhzRo+3irhQdSlRXVul08zTIorzhMsOosC0EijLjgLF41Ow7NiXtUee3Twi5pijS59mz
         3O7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101005; x=1779705805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTs49byiOKMbFqwJ3wm4pcmStKZPG6RE7CVuUJdE960=;
        b=DF90+RKb7+5+oizjogyt84iJwL1/McHLDVETzhWQcgganrz9AOPQZ/atFrBfgH+GEx
         NqrLqLObw7V5jZb5Md7wCGFJRDjvULI/5QmZmMALthdfTpHcuX68va0gboVwMvrEpbDY
         pHL483Z9J0G5MF9QTIGSf62UoNLYaV+UEo41ASCd2FI8F8a66AACfviAySQyb6GLbLm0
         rzy9CvRwCTdOzQPWLGVLMp52DKE1my9X1Ekuc9CvLIeVXwqcBbnwn8bhsgOi6e8X+DR+
         j/jb8N3zrg1uzEwaq5+4FG475QPCKu8wc06JoD16zy0IZFOxo3ehTdmnezVyVynX9mGn
         wPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101005; x=1779705805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xTs49byiOKMbFqwJ3wm4pcmStKZPG6RE7CVuUJdE960=;
        b=A44mKctpucge5SBJhUKC2/ydNsYzgGdWREgLhdDIWPl+C8yeum0X14oCCK9mhSX6Ax
         5Vn2kCUHCe757snDzjpcbgGD0kHYeTsWdgvnHIXUspk0zOmJc1cyMyd5t9dGTRIek8g/
         d5ttI5gcWxygKxozeXdRIpkI7/04wiMHSYtabpNRvNOLOhLIWrHskPT9Mw3JdIE+95UZ
         CNQ9fUf/F0R7Nkd1FnZMwW9QKjq4TmfS5TipkGKGL7tvx8+wORXMMEghXLlpwAmaDsXD
         tiNyMRv7WlV6o3GD5LVxs0piUqq9yApPZvSDx+ys9WXkirNw0CQnm3/j+pZMqyndFX+J
         1uew==
X-Forwarded-Encrypted: i=1; AFNElJ+4ZJJO6ta+T428mDBii2e7x6KlyvM+N4rrMQUBDd9yJG2wFvA3K2Q0mZfjPTnN0sxFh8OF5LWlQT0/@vger.kernel.org
X-Gm-Message-State: AOJu0YzTdrYYFgIPsvIRUlRzv8nR7ojLt2PkFg35PqbTLXvoAMTjhiiT
	ru9KKfzlk1XHp3ZX25kWdOi1NM17DHe4fHOEGAK6AIG+v3fkXkFnCICgzlmUX3jSW58NrrwjODT
	ZmF4a+18DM2FyVW/7n5TUnHwECfEQsjGbfg==
X-Gm-Gg: Acq92OEwc6zDJCEv0gW6gndqF3jB8+293YwQIVphq1kHlGXLmcMj2qBL1Mnn6y8XFb1
	qZMl8lnepQHMFATIUF1Cnuh5W/a8EjodMz97mMcOE92Hj0ZC24MeYAJ73ccEKwW8i2k2STxyNYf
	ht5nur5UbqJgYWNyz2D+fIjxVSDRrjC8W6TOmo8GoTAiTlFJw8C7ONVptKETou6/MXxJh1UTW81
	9LF5ToRHo1Ahc1xJyCu1FWL4TZO/VWDDi+VdUKhep2tSJigbw0HQoiL1zm79ReSWj3snv+8ouXN
	nBW/SQ==
X-Received: by 2002:a05:6102:3048:b0:604:f029:224c with SMTP id
 ada2fe7eead31-63a3d3257b8mr7204165137.8.1779101005079; Mon, 18 May 2026
 03:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
 <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
 <20260409-foster-stability-f77b38c6f7a0@spud> <CAPBH0A_K39218+=QHJuEY+SbFk-nCnM=Z8RQMdHBK7SkCj2QtQ@mail.gmail.com>
 <20260420-garnet-goal-4a284a8818fc@spud>
In-Reply-To: <20260420-garnet-goal-4a284a8818fc@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 18 May 2026 18:43:14 +0800
X-Gm-Features: AVHnY4KBv_ZQdvkIGsbW-uxlaqMRSavFFGW3n1uyRZHosIHDc_Hzt105zf4NdjI
Message-ID: <CAPBH0A-nVtt_KynVyThZUVD2CShoeOuMniwpOxs4+nPHcri7MQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 board
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=8820=E6=97=
=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Apr 20, 2026 at 01:41:30PM +0800, Colin Huang wrote:
> > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=889=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Apr 09, 2026 at 07:40:26PM +0800, Colin Huang wrote:
> > > > Document Anacapa BMC EVT1 and EVT2 compatibles.
> > > >
> > > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > >
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > pw-bot: not-applicable
> >
> > Hi
> >   Could anyone let me know, what is my next step which I need to do?
> >   I can't find the changed in for-next branch of
> > https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git .
> >   Thanks.
>
> You wait for the merge window to end and the maintainer to apply your
> patches.
Hi
soft-remind for these patches merge.
