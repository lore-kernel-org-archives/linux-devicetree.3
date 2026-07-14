Received: from mail-ed2-f7.google.com (mail-ed2-f7.google.com [74.125.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DA3244667
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784070342; cv=pass; b=UtKG+RejluaylP8m1O32chQ3wpp1addloRkDMTJkJgZxIu/X96FDO/OiRjAZTo/KlnNtl1/5YnfqKn7JiTCf91ynT35LIHKt/QrjdbvIWig+Nrr7d4crxXu3TX2fY8qael5r2piDsEvIIU9xPnizOp/ILaxSyDxOHjETXE0RDDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784070342; c=relaxed/simple;
	bh=5yS0n4m24nQ7cS0uAO0etHXioBeE2HNrxAIlQrrccBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1YofGsAqWnCAd9CTvHrh85dU6P9hxW9oOCGeN1k4mYfiOYRpjWgVDf5dHUQJl+8ffBJ1p9jvctYwYofZwsZnkuCdcoNiXAj6eapvHlu09S2L2PAK6HuMx9SPu9zHCf2eKToE8TuhIsN195c0X5Nw7OkYl5ck2qWg6UtwYjqQ8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giNXFjhk; arc=pass smtp.client-ip=74.125.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giNXFjhk"
Received: by mail-ed2-f7.google.com with SMTP id 4fb4d7f45d1cf-69c42e7735eso3102522a12.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 16:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784070335; cv=none;
        d=google.com; s=arc-20260327;
        b=nxVDjYwCHI1mbbYTrgnek3rXKb36vmBk3av/vvhXjMvfhSRExBof/UKHs5yoi7aMy2
         T8rjrqAidDS/lDQiMUVnz7wHH27f4QQcbq/1KzmK30VYR++OWJQCPwLUck4Vz3H4B0o8
         5jyILvuM7QYz/v86aG8DARGxwDFHvgh+J6O+vdTXuQhmPkzXKG4QhOl/DtvAJAgrmpcc
         aRH+De6jU1c35eX2zXmwI7qst8fCvXqaZt7jJWiDbs6Wf7NJEa7WrN/a72nfEytd/ZN5
         S50DWHMm4NmiIX7p+xxQvWbxpQ/26Z+pxP4+aTtWIVhRVsyXBpjmM83VirAvcoXWbjPP
         q74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5yS0n4m24nQ7cS0uAO0etHXioBeE2HNrxAIlQrrccBM=;
        fh=nQrJugWuvUZtpWGOLISL/yjY5nOh79rma+u4O+9mZVA=;
        b=ihcjbOzx++QgGx0sy7jpyVTmRnvFMQBb/r8n8tlC4dHaWcZ8UYJ+guWPkLr/Ii2hNy
         h4zEagQkbkxey0thOq+/DQUnA0PVvSugNBjGXhkHZ0x6uzGbcFBfJEC5TAHfHrkw4oO+
         P+NetJhpVb18hMGDVEvH6+ds44S9MJmkv2unAu14raAolicjzdfahUQ5c2zeBLFkRbB2
         G4u4vrwYsoVobv83A9t9O45OEPwEgLEg+Etn9SgsxK6l/JSfzNgSKTWmtm+7c/6FsDsk
         ruROyfwsPEXvouUkNxlJJzih/s5O6BaNQzg8nrBFpEZJX9uELGkiMpSiywAikt5U1sYS
         te4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784070335; x=1784675135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yS0n4m24nQ7cS0uAO0etHXioBeE2HNrxAIlQrrccBM=;
        b=giNXFjhkOYFjP/Borbg7g1Di2AB1wYPs5C0L/U6XAXhYfljCu9W18TUM/GlVFOVhVf
         em/N1+e6IsrCyk8dBRtS6WzTI3XZNskM8ShwO1ftHoyHZRFk46tdmLDrs5yc/77LIG5S
         jm0Y6OlZv2tHnts1gU/kYjuKdoacFH3Jl048PxRCqS5y/O+WeOVeV3MyvbFR1omlsQQx
         n5FhmLSnUbAu5C7O7q0J/1aZEYTyNBmtKeBzFp1w0h4fJ/TaC08bikjhYMXvWABA1LjV
         sdk4VGsORzgaoIdSHuUpvmOI/mv2RE9t/4RYtF1S/3VqPRrR8YxpqfwnbGiVFhXQC3VI
         xnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784070335; x=1784675135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yS0n4m24nQ7cS0uAO0etHXioBeE2HNrxAIlQrrccBM=;
        b=ZqfG/kZH77GODVwYWpybjvrKESOB/BIUJQtddpVbukJt6qO4VnDVMTc4f033x0EDil
         pS3MxSqAoPBzn2z7DMZy0ca21hRK1z/5teeiWKEggGCkPHFjziJ9FJGCscLRFl8zFA9V
         hpbhqIoj4+bV7xOTAs9Z7LhYEtr4rGAIZEDEydVejNj6RkgPz4e+m0BOyOpkHFc8zbjs
         rBdj5O7MPK4cy3PgISFBmSpHMweZXQThMD4/IDPm6jm3MV50jGxT6Zrn0DrM9c88GCMR
         z5yDttzhhgu0qLHk6rkXKMprPwGfhIPCGPW++/P3gmTotcl6ct6KbzMXRIEBxhBqB3oe
         gmpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXnysqhSN/o9STtfOEylhUsUmPB/+1k1VUUmdzztYp5Gq1iDvo75CjjgC5DDnJTgoh5Bnk4EZAcPMk@vger.kernel.org
X-Gm-Message-State: AOJu0YyRRkz48vZtVDjb4ogMn1Vcp/E9Psm2qGxBOJWfLQy184YHFnEx
	S44t1An4ZTpGZCQThEMooeYhXgD6W/Z3XQoCTPXlRP5q409O6jbKKxjAtEUFzliKH2ohCCuBhR7
	awTXDZbgro5LuiMJ9pUUpNhe8dT0uYFI=
X-Gm-Gg: AfdE7ckLh8cpotLkFlHPbj2/rwqhM9kJE54jRGrdg3R9D+QPr4vnQPi5b3Eg4EpL7nS
	IFD4Clu701fQ/F64/Oy9uOaPIXX8EM8jHjirdZ5GRsZqvez4w7snpYP92CUzNRPPNx+Dw0K3YyY
	TtNI2jM7VYsarH9Jufpnvza9OHBF4A9kL5X/f2eUZZRsIOB9av3sksRAhh63Wiz7Aht3wT9uDFy
	1A9vn4ShpTdxNm5Q805DCLkygCpySeeblafEuczrTT0ZXqnlzMZpV3iRKix3FlZxpjujpq3eQWo
	atGvyx/q2A==
X-Received: by 2002:a17:907:3d55:b0:c15:efb1:9ff7 with SMTP id
 a640c23a62f3a-c16616ad29bmr332320166b.28.1784070334544; Tue, 14 Jul 2026
 16:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-7-coiaprant@gmail.com>
 <464cbdf3-2e9e-43ea-b30a-75b3d1b8a188@lunn.ch>
In-Reply-To: <464cbdf3-2e9e-43ea-b30a-75b3d1b8a188@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 15 Jul 2026 07:05:23 +0800
X-Gm-Features: AUfX_mw_zrKoDsMO8kJR8iRpLq9HGKaiImf5TsHlB4TM3nCjyfFFksGlOJoy3Z8
Message-ID: <CALj3r0jdkDEjpO+7NOTGs+wgukKvD=fzFn4ewpurxxPswCE5GA@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state handling
 for Rockchip RK3568
To: Andrew Lunn <andrew@lunn.ch>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, robh@kernel.org, krzk+dt@kernel.org, 
	heiko@sntech.de, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B47=E6=9C=8815=E6=97=A5=E5=
=91=A8=E4=B8=89 06:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jul 15, 2026 at 03:08:34AM +0800, Coia Prant wrote:
> > Commit 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII mode=
")
>
> You do not appear to Cc: the Wangxun NIC people. It would be good to
> have there comments on this change.

I apologize; the output from get_maintainer.pl is very long. I=E2=80=99ve
heard that having too many recipients can cause the PATCH to be
rejected by the LKML mail server.

I have added Wangxun maintainer (Jiawen Wu <jiawenwu@trustnetic.com>
and Mengyuan Lou <mengyuanlou@net-swift.com>) to the CC list.

> > Fixes: 2a22b7ae2fa3 ("net: pcs: xpcs: adapt Wangxun NICs for SGMII mode=
")
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
>
> Please don't mix fixed and new code. Is this a real fix? Should it be
> back ported to stable?

I am not sure if this is a specific characteristic of Wangxun NICs, as
I do not have any available for testing.

The behavior of the Rockchip DW XPCS IP core matches what is described
in the commit message (even though phylink brings the link to down
based on the phydev link status).

This appears to be a bug (at least on Rockchip platforms) or Wangxun
NICs features.

However, I cannot confirm whether Wangxun NICs behave the same way.
Therefore, I have kept their code as is for now.

Could a Wangxun NICs maintainer provide some feedback based on testing?

If we can confirm that this is indeed a bug, I can submit a separate fix.

I would greatly appreciate it.

Thanks.
