Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7519D3515EA
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 20:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564868; cv=pass; b=jyebC2vTtY/2YUMN0sNaWC+UmII0BixVMFLhf2zXFHCwtGaCjvDjihhx258mMXbhYSx2NtYqA6Ui73UJWzMB6B2KrIksVRjKD5l97rmX/BuSLVKS8EZ81ALyWaAPsKoJUiUOGaWK5Uj7Z2icBs0rjd3AlIH7KV5MHlHWubGftvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564868; c=relaxed/simple;
	bh=VaHALOUSG2g6G7WyQkiHkXR0si2CeSLue94vqPiIyjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7EbYEzZaavK1kw3RDs9r29CyiJfh4emLa1DpcQpp6xjEZK1X86PpyKd2fdItXL6YDyWvVjl4AzMc+xNfvjAPZ8XcwtG15ZDeByWoBWTvAdp4yquo9Yl4tWlpstXhnHkutnnXRo418U6W3a1sNoLsUe7LPjYhveSxmvYxRyu0/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IphyRB4s; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IphyRB4s"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1fbe461f59so227444566b.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786564865; cv=none;
        d=google.com; s=arc-20260327;
        b=PXiyYOSaup8+06CG2X5qoZK+E++zcEmyudQ6jehdXrQh7CJVDSnMp3shHew2d7x/FG
         qhCTXFnTg/sJNW6t83f/MGnUtJgYSQNIGC+dqwa0WCuWn567ySUFymDWGEQccuRDlGK1
         J6fLx+KcdZ30a7TBHQ1t+rCnnvaVxwCab6gIDZsSHj6dcR4/XUvZQYL9dRztcYs4zu57
         h767JY2rGtzihYUd0CRZyp21mhPe8Lf1/Zcv2wo4PU9LH79VHwL0jkzISoECwsMDDLmu
         wxdU1Vj39Hm58goRVSD04J9zCrrJIrW2KQiprFM+Fqkex+X8dek5hohR1tkhzQWQGw67
         EJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b1mkxMAVLNmutCK/Iz5uJqbRh9hbAkmdvbl6ODqSfCs=;
        fh=vNmTo8aSPcvZ+tgGqwBItGPAonsc5A31Y96WOPFrBco=;
        b=Q2+lp7rbPrPF/xg0s3tyeZsNzYuWEX76RjgCZwe23wiXVk0erKeDYkQRwIsieA24Sn
         k09Wornrafr1VWNGDd8ubeM/MphuNRvnp6gjz7INCap15zzBlwyOlXd3KAypoKKZvNi1
         LcFcnU/PeHGTeXqIGGf68ACp6oq9tvfXgjcAsK3G5Qh4R9vZt1tNjyGKCd5AC2fFECar
         adlW/z491P2rBHFsrODzDc0BPrsxcjHqu3bUCg6kwHknNF1OXqnFZNkx+sK6QK69NKCn
         R8/Jpfe13PHRWLcmrrK8KhxLo1X7kY71yaOsDkMB10EeWIRkYip0IN3dRDe/CR7iNukc
         2WHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786564865; x=1787169665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b1mkxMAVLNmutCK/Iz5uJqbRh9hbAkmdvbl6ODqSfCs=;
        b=IphyRB4ssQ9jJwquQ4/pvIerb4aCM/JCp0AUOi9nSRy3QXrhKJwTuAaOe1UQXNoao+
         t847nmOzlEBLXHYExjiU/4ojNKlhXC3vY8R0F8Im9jn5hLO3cgiApJ/QeVh6ZpDa3dLq
         LgmubhFiaVR39lVs2dq1897WUh8YoIV8OMDU0fE94zZASFY1EQM+4Rh1L/K61P/DPgAI
         mc1j0d4plUsS93o3ism1ciy0rQlQiyjMpFvJLSmnguMon+ozuaMRoJtmoa23z/m9g0nY
         Ry2IcF4XIQIEHD7iblh6l0hAA+NaFi6jgyKKYtHS7rXc2vNHyIp7JMxK1WUsA8g1IT3+
         0cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786564865; x=1787169665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1mkxMAVLNmutCK/Iz5uJqbRh9hbAkmdvbl6ODqSfCs=;
        b=pOr9fNXJjttW4N98GfSERqkuLp/VytaZ6vHyL5lCjLGIZdLhDSk6FLjh7GvIFiBDvD
         r7qsxYkuCAXz/Je90gvVXKxGBZ/Nv815GMpqses86X8/KYP3CkzOFtzul24YUifNX9jg
         1thvrz5XAu8nQlvji4uW2xWJCzcSxUVTJ9xjtaBtFKQa4Y0bGJdXkz+fmq42VyJ0vIcV
         uBiljuZ1B/5Iuq1I8bWm4UP6xeH/QlTsoKl58d1UIQe5xCPeL13nwkP8Nm/d4YC13jLN
         HZo9NRl+T102tH1tw4VeRRY0VSJeOQH7IyhJs91lVkzJ7ID47kAUd7NWSpP/e9amFIvn
         a7cg==
X-Forwarded-Encrypted: i=1; AHgh+Rpso4NdDqyWxaA+Zc6vy/3YPfAVAqrCBOp5DOaPwv4tLW/Z5B6hoDFBb0fLQ4o9qZ1VGnBY+c6RvSVN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36sgT8eLGhRht6PS7udnFWxN6uB680dWkQ4avyhwBZRBKGJ1e
	MG0MJgjGdz+Okmob1vHCNx1FkggWQ0yPYjAlGuDLxoMR09knVoXj3WitItVUi21VpPKSH8AWwf/
	M0sXEaIWDdtmZ63bgbclyvU3MQw53PqE=
X-Gm-Gg: AR+sD13J9QGro3G7tCisqTkWAnLkTwoqSUM7DG9C89HwqzyevBP/VpXwTXImd66RP0s
	SeoZNZgV7IFAzTMPktnNXhBnA0krz5EZT9tKySYCv0To+kml3neEPOxp/mg0kXKQQrZc/+VdXB4
	x1EqGwBCIkrRAcJFd8GMHx/zQWSy9ay0RceJj9uoAhBZN9giSxh5R4ITzci/vT397o09TEEh/Ha
	0Bgrl7Czp/gASh5F484NV2oLyrnjxzrBCBo9NVgY1BdgTl6vM549HdPac+nW3/1ZEsXyInT5VGD
	fUn8sF/W2Kd0GwUF7Snqr48kJx3yQiaiPnZXUBnxB3glOw==
X-Received: by 2002:a17:907:608f:b0:c16:4e5:944a with SMTP id
 a640c23a62f3a-c2108fdac65mr34618766b.21.1786564864596; Wed, 12 Aug 2026
 13:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811113901.3114169-1-o.rempel@pengutronix.de>
 <20260811113901.3114169-3-o.rempel@pengutronix.de> <CAD++jL=p3Y7-CmDqwB1-K6HGXg6AM=vkzP=9u-8FSG7t4AUFug@mail.gmail.com>
In-Reply-To: <CAD++jL=p3Y7-CmDqwB1-K6HGXg6AM=vkzP=9u-8FSG7t4AUFug@mail.gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 12 Aug 2026 17:00:51 -0300
X-Gm-Features: AUfX_mxAHT_MlkAfu1c4BZ9pzu3H2y1aVflMqpkdyIJinD0i_NQC-53KQ2MAm-A
Message-ID: <CAJq09z4cOBUJK_2trDW+sg_Fs0nJ_Hsf8hsBnkv83o3gT+pWHA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: dsa: realtek: rtl83xx: add support
 for enabling supplies
To: Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Tue, Aug 11, 2026 at 1:39=E2=80=AFPM Oleksij Rempel <o.rempel@pengutro=
nix.de> wrote:
>
> > From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >
> > The power supplies powering the IC may not necessarily be enabled by th=
e
> > time the driver probes.  The binding describes the power rails, so enab=
le
> > them at probe with devm_regulator_bulk_get_enable(), before the reset l=
ine
> > is requested and driven, so the chip is powered before its pins are dri=
ven.
> >
> > Boards that do not describe these supplies fall back to dummy regulator=
s
> > (with a "supply not found" warning) and keep working as before.
> >
> > A board that describes supplies but no reset line still needs to wait f=
or
> > the chip to boot before the first register access, so apply the existin=
g
> > start delay in that case too.
> >
> > Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> > Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>
> Kudos for all the detailed explanations!
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij

Nice work. Thanks.

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
