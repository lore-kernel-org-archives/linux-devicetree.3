Received: from mail-yx2-f23.google.com (mail-yx2-f23.google.com [74.125.224.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9E75519B0
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083605; cv=pass; b=TcuAfF9wWA2D5sYRbNNJeQZc1/h5AqYaP3yn5AuJOKcekXl4cWkFLvj5svIBKu9k3mSs4AwSbPGUpTPHNrOnWqAAwEkKzUttL7lo/YWkAE/GGU4938/kZMn/AeKNNt8k2MG9BxTQsiYSF6am1RT0twlhofcM4o0NJTuM0m0RUl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083605; c=relaxed/simple;
	bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTzNiN/FMkrYvezfmDIYbI3K2I5muRmLsAi3EbQVU1iezwBp5EzyjcKvRjLmyyABmmvzdGUdgfxuZWASi4IeHI383oKiOnUD0OM6HigENDhxZFNrhvWohUqsmm2PSLxBMNz+Z7Q5uz+2JqF9yFNAZX5RtpxbFVe+H4J+S5U4/WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g75hIR5U; arc=pass smtp.client-ip=74.125.224.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g75hIR5U"
Received: by mail-yx2-f23.google.com with SMTP id 956f58d0204a3-66e4aa8e6bdso2221207d50.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790083603; cv=none;
        d=google.com; s=arc-20260327;
        b=rQmXcs/6+aAS7VOO5529YTCfZjMpGhSeggmIYNvmGdP4sVyLeI4gczvoXz0tzCdlDy
         zBcDCDjfty0eC1MXqNVtOYKPlaY4Bfjba+rYLv+2NtFrxJh4jogcLZEhLStsyqN9uCWP
         4AURsVHAHtnESnuppdHjQ4qdb7vZs21SrY4mTuk1L6Q9a0sV2yEvIbCHPjh0gbIV3SpG
         vRhrp3JcHrc0IVOsOM+RvhXLeYWVXrEcF+S7eD26j2X/CCdjlOm+OWfdBO2xV9arJdtg
         LZrP1KmtwnZMrHCqIu1tv5EzYWLL1Ky80nnHXpWSqkCe9N/vDBeKS86lTd+C07o+WHzj
         kMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
        fh=kdHgTvX9LFFMyeFv/GMtZ25ZtfCvBgUOfEE4Nig+kVA=;
        b=F6nZY4G2EiCFMpGhtTNNDKNDyDMTYj+jvBB1O6DcvEWjiAdIKrdD5fplGy0nO0Uw3C
         herVOpH5t8Bf2qEBUFsmKUkTH/gE87nsi+xP1GmN5wJR7MKjSgQoD5z/rt5lxNCpJYwO
         Pc+4NFa7gVtvNvClr41rdCROMMvqUi0qDjFSaSGdn1HFhTwfj4Gqu8FfmG6rZiXY6OkN
         fJS5aN03ZM8sw8e4hWLwIsffB85ZniqAXx+0J82xa5pVCPM7Ctkc5moS1o4r24oCwBzq
         uX+40mbKg4KrcXwAwNHZjsmN3zPCCpbu/pAMEluARUiFbixl37YIYDCIfqcttfQNQ3gG
         M/Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083603; x=1790688403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
        b=g75hIR5UuVknX1OcK23E9JT+2EGsFu06ipzx3XkK288iChAS54pYGNDgOLyGLGMlpT
         GAcczYCGRR6ckNGXcWBSk8+QEruijUthVehhwdCAxskMPD07aWshTQiVhcpXSMnIm3qG
         BZXdU9Pm2KOQj6mmoQv6bSkm7FjL/8WU7MCARH/TpAt8nbOdbeJRkVvBVyDV5flcYKPp
         zZjcReauhKT8/GYlpu8/F0GZjkD25cBMl5Xj1e1qaUIWWMgJawk4TeZqsNWJCq7r1W/Q
         jgjyxzQ4WUBFUQz+K7nJDPf2YZMCq6MSH7ikEvJS7jWOBwcjAR3zd2/HvsFEsRuRw9q2
         WQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083603; x=1790688403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZk3ftFgsljw+yHRBP7QV66dcAilUaP73F6UAmO5w1Y=;
        b=xQ7L3LIFaNH5mC+7jrK3ev07Q0Ll2wnKQ5KBuSXvoo+0zSTnGK8yFR+jYrcEmugrYs
         yaYhuNFUXxXNRtHeIX/m/KMc7h8U2ICJur7usSX1GL4TxNagcGCLHx+irzpAJWGBOIQC
         EVKexWfESeTb8yippjHgC3kz/y2WMWl68n7j8DEKncFbbMHen72TuHtgBKQianwM9yvW
         RZPB5ROBqpKksqx/SJt01Qt5hKQdXJVtZabikmfd+eje8HW9Z0aEvRPJiR5jZEacXVIy
         XiieLOshjZOHGE2pSglJC6QFpdmyX5j4ed9TZguL1waDf49VuXNRe6Ln5kN8l7hEs3tk
         aemw==
X-Forwarded-Encrypted: i=1; AKwUvBxbB9nwvtDd6sGjwr38zX1eRN5xw8yGXPCbO6JLIghaGlYae8/k6kxDwxlJ6nqkyXRYqjsAm/vQZfR+@vger.kernel.org
X-Gm-Message-State: AFuF++n9aQmPlK1KpjyBk2SPmz7F6rRl4QKHUQ6RerYyaIEzQGnQEKsS
	kkJqol/y8y740zuLtOYatPA0R5rkJlGqkMk0S4wCrRd9YcZfncYgi7JyKgJedYA8VRp8YsQoQEp
	ogz/vzIk4HfS7q/gbrZkTm2PNAQ46rQ7w6TcG
X-Gm-Gg: AYBFou2m3aAaanJNLJuLkiXszUnT21xXV4gx+QSONMtr4hAUm637dcY4IqAjzZPZFx/
	0JRryc6y1h7mF//xVm0DXBP0nJDYVfHLe6hJhLPBWtXwFrxceFqglHiU5XEfHFsJcpCT8DZ9gd4
	LoGsp1UTOU68DMUkH+ZQdhgIPp7PjJwFetcwZlVIcjnMyj3az4QtXkPedvgDmIgbkBIg3tbVV1n
	Ie9gGVvpWiq06uv/+FYIZqCtymAWjfVT9LWSkviD6FV7YgYYP9d1ioGEsJ840T2cvKm4pcKgmz8
	6plo+BcIcCLTWwgHV9TBA19hQFbBFSb576I8fiyLIf7Lol5Whou/w0JRFPTEtzCyBJBeCA==
X-Received: by 2002:a05:690e:144e:b0:671:4e37:a832 with SMTP id
 956f58d0204a3-672c2a1492amr1424683d50.22.1790083602711; Tue, 22 Sep 2026
 06:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com> <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
In-Reply-To: <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 22 Sep 2026 18:56:31 +0530
X-Gm-Features: AcwNN1XaRXA3PPjiOAu8sy9beqIj3WvHMknSJQK0T_ZOITGdCWmSpx7UdDH1Lq4
Message-ID: <CAMFFDGjJcmpaQYHe=F+jpstbdk9-uXPKkBxLkJqAJRiyyTkBvg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC support
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, andrew@lunn.ch, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thank you for catching these issues.

You're correct about the defconfig. I used `aspeed_g5_defconfig` for
the DTB build and incorrectly reported it as validation for the
AST2600. I'll rebuild using the appropriate AST2600 configuration and
correct the statement in the next revision.

I'll also carry forward Andrew's Reviewed-by trailer for the unchanged
MAC0 and MDIO nodes, preserving the scope of his review.

Thanks,
Prasanth

On Tue, Sep 22, 2026 at 6:51=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> On 9/22/26 2:34 PM, Prasanth Kumar Padarthi wrote:
> > Add support for the ASRock Rack B650D4U BMC, based on the ASPEED AST260=
0 SoC.
> >
> > The series adds the board compatible string and describes the BMC memor=
y, SPI NOR flash layout, UART console, GPIO line names, graphics reserved m=
emory, I2C EEPROM, and MAC0 connected to an RTL8211F Ethernet PHY.
> >
> > MAC0 obtains its MAC address from the EEPROM on I2C7 and uses RGMII-ID =
mode.
> >
> > Changes in v7:
> >
> > * Correct the GPIOP bank line names for the reset, power and NMI button=
/control signals according to the confirmed board mapping.
> > * Remove the obsolete GPIOF5 reset-button line name.
> > * Leave the binding patch unchanged.
> >
> > The B650D4U DTB builds successfully using aspeed_g5_defconfig.
>
> What? The B650D4U has an AST2600, so using `aspeed_g5_defconfig` means
> you're using a config set for the AST2*5*00...
>
> Also, please preserve the trailers from previous serieses (i.e. Andrew's
> Reviewed-by trailer) if you don't change anything significantly for the
> parts that got reviewed.
>
> Tan
