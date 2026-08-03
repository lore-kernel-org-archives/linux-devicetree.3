Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AFC3403F9
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772650; cv=pass; b=erMJUSbHQa3qQaOuV56OHf3YDl8i6kGKxBqsOcZlZhmk+BbpDnvbSWQZL9gL2Kwu4vregsbEFFwJFMlsxEaqWdcBLZOPQ1YMhBQcmAE66/zhF30q6wbUKddDp9qoKBt/x1ulJ7kc5IgtSzIO4V6auG9Tn8+maQ+aOQYSLjJpYCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772650; c=relaxed/simple;
	bh=fZ8BuOv3ILCmNDbfVHwiSe/Itiuz/HLNsG0RZrH9AfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ilcOsyNJ6l9UEd6Uiqt5PZfdIGioT54I7qcFSgcnz3cN2snsDqj2x21Nciq1faDbiPVUiq4v0+H4zOw6NRFVr5EPvYAdYU6GTM2VqY9Q0loSqZ+6Mh315DfvStWxgniSwn+KdW65yyRmNmRSrYxnXTCZCCES3cvjFGSZp52+AWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj9Qjsg6; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj9Qjsg6"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-963f63fe025so694997241.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 08:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785772647; cv=none;
        d=google.com; s=arc-20260327;
        b=YMeqxLekVa9IFNKxeeGlG2p8dP1VP6ZyPdSf7kQ/cWJli6DkHVPUEJC7Tw5OOBCijZ
         pyjVFsH79vXsKWfCzgubAnHVndGHQCCY08AGZ8lxdih3qlxm5G/oH3rKUQzIAB2UZbJu
         X4SbLl7Jf6+De3XHJMfpJKfT4GsjefU+itJgrjrBzt5BYN+lTTahYi02rhvNkiqfaRFF
         D6bAwpYaNlfzBRWEMweCsj3VlFypUkjz/ouNSS+mPf951tmIo6DUZaql/t4wXQCIJ8v/
         FKx/9XBE1MXMDOAZeHkHuGJuDGshpqxNS53gWH4d4NFf2OwXkdI/CATT9BKQbCTz7BwS
         vDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        fh=60vGaG1SeSI/Ugy3NkEyJokCg+Gx4FZyRxEf6emnmmA=;
        b=U6iK36cWK15mT9kyBLoH6m5fE96q8uHXV2B9e1dfFNFwtdmGRTphDt1Czr8OfnLfaM
         rn9ZS8lGwwhKFvp7AelrxU3QzYzsTyvskNXhMjZa1gScvkRgmraQA7kdD4wiZjaIAlsf
         Fw7Rw0bU2/AOEqCHs91rD1SONZVmAw6wkZiG6O4HY9QUt1dcZisqDNouBvQAD4QZdpzC
         CPQBz3LuIrWNHY3TCf8SUQw+ffTK3N8EF3Fe4bmojRIpadHhiv5XpVUN9mC4xFHE+tc4
         TYuGjNzxEF41CYvQetL/EAICCbFO/M9ufgqzxJ9rYo+BpHv9Kchu97p+4r/xu+B9t5zt
         ox8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785772647; x=1786377447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        b=Hj9Qjsg6KW1MSz/SX+6kLkXVUgEoGCC/TK3P8TC676mNuOGkpgnHnQSDLqLq14TuXD
         btpWKdByixT/6wnmsGSILoRUi0F7dWjaaTt15PCCBd6+OqzJQWPYIFTE79x5wD+Eu5x1
         IOarCfnRr8a9DqvJ+YpOAXNJTvSVtKAKZQXYw8Rb9S3m8w0CAp0/vV+NO/z4isXVAATV
         CdIe3DgetUYN+XzybdHWFys3Hk7WRw0W0WkdeWvf2oolEbndkvSHS2bN/2uuFTiuLy3c
         tpxEdQ4ecvFjDZ0VnvJkccJhuKm3odKwBXhG6FHKJrZXPkn6MNrkCIixixMfm89MVWF1
         fndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772647; x=1786377447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        b=Sh+HlEO62vlOmmzCr5fUCmVO6kuiNsBN3hpxBqFALhLvu+vFT6jR4J/NOmJiWEUp8O
         TjPbxM+2Z6YI7BlT4gXXq/jqjnKHfeKlinjF7aQ1LVPjfffPboRqDqMHlD1z1HjJA46x
         b3TyCWANJAMpRh8mWC44dCJwAz1O6ShF+aiitnhquDL19CGoChlmoUija75mfRc/k2F8
         ve3weXR1JPVGh0uy2tiFvUn6vDGNJJe/Km84Z6MBb15gu28YALDlQCGB4xWbXG6ZGpwH
         YOsODn5pb5o5wQ0c3Q24Y2OATkdwmvXcQs+PIsbIqbd9+Mhg4LrcR+cK4Qgcrvqw1CJm
         2Q9g==
X-Forwarded-Encrypted: i=1; AHgh+RrGKMDKYGg5Kqcn1CebPscAjst+6Pzdwp9sdNONbHRZE/RLUhdtu83Tmli4mxbbFTgxel1+hltCPxO6@vger.kernel.org
X-Gm-Message-State: AOJu0YwB9Lpb/ZMSZEES0OmBJ58GeF88GTynnIXUsXPwTF0O5xRX3/YD
	+TRvF3SRmbK85aJTzyPrQa7DWm11Y8yl5zzCdKdc9WfaZ3vezfwpULZdmYqoI/S0RyQaZFqHgK6
	9J/Vd7+lfxN5fgrga92iGxFeVB62ILiQ=
X-Gm-Gg: AR+sD12CMazO1NX30oaDc44BPYJH0XMPXsOSQUhulmTkMY4hJQKzoEWTQ94ZXHav4q1
	Uvk8bZoRNz0CfcIIlsOBzEB3AcozovQl2/ZqilwJ6HpGwIty8vO1iBjgJeSe65NMFEcqoVeODCh
	k5ge1s7N16LWNLhh1OlE6bhncB447OtDoeHNTKGzxvZ8y4o8DN74mnlwvay2+bZ5UHp5Rq5AvBK
	F3pGtsaYV8yX677omY4zPJFOb67xrAppRNdrEtB8CYZBdIuxULf5D1ZI6O2Ycx550lUuG/wBT//
	QLIf/RNDj7leD/H+LAq5pprR2VDmEZTNSX85cSA9BAmlzWk6cslibeW9L0930nl3gcCgbbKJxpU
	G9ocoZm8EBaQshb9AnJzNTT4TSIWu9sO9+sZwWXz9nvlrtUI/bdZ2lk0YzqQkwMMyu3zALYcNyH
	M5K1WG2PRdqfVZjo+mVEWFha8FiB3Ms7iw6Dlv
X-Received: by 2002:a05:6102:3ec1:b0:740:177:f357 with SMTP id
 ada2fe7eead31-75b21b5cddamr7901767137.6.1785772647108; Mon, 03 Aug 2026
 08:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com> <aaec8809-8218-4412-a60d-931406dbf287@arm.com>
In-Reply-To: <aaec8809-8218-4412-a60d-931406dbf287@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 09:57:15 -0600
X-Gm-Features: AUfX_myOaFTmy1w_XsU_xICVSFiXSt1enMYBuh0WDNCP9gRZxCQ8cKkbteQKJ94
Message-ID: <CADvTj4qCYjQHOQn1jRTHNNL=xeX6z3Dgc-PLwOBUvX34AU6cuA@mail.gmail.com>
Subject: Re: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:26=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> Hi James,
>
> thanks for sending this to the list, but as Andrew already mentioned:
> this is quite a beast, and would need to be broken down.
> Jernej and I created some patches just for the AC200 PHY on the H6,
> which Jernej recently revived, and IIUC, wanted to send to the list.
> This would probably be a more workable route: start easy, then add
> support for more SoCs (H616 depends on the WIP PWM driver) and more
> variants (AC300) later.

Well, I wanted to validate that the overall driver design is suitable for
the H616 which has to support both PHY variants at runtime effectively
since that is the most complex use case, I also don't have a H6 board
to test with myself at the moment. I think being able to see a more
complete implementation like this is helpful as it can better inform how
we can tie the different control interfaces to the link PHY in a way that
works for the more complex H616 case.

> Which also brings me to some attribution questions: If I understand
> correctly, this has been written mostly by some LLM? I think you would
> need at least to disclose that, if not even add an official tag?

Some patches were, sure, my understanding is that it's not required to
explicitly call that out but I can add more info if that helps, this was
tested/validated using a heavily automated hardware in the loop
testbench setup on an AC200 and AC300 variant H616 board.

> Also I wonder how this relates to the patches floating around for a
> while already: https://github.com/jernejsk/linux-1/commits/ac200-v4.
> This branch is relatively new, but the ac200-v3 branch for instance is
> much older.

Yeah, parts of this are loosely based off of some existing patches that
were floating around like those, although it has diverged quite a bit as
well since this series is designed to handle both phy variants.

I guess I should link to some of the earlier work in the cover letter?

> On 8/3/26 07:14, James Hilliard wrote:
> > The Allwinner H616/H618 secondary EMAC is commonly connected to a Fast
> > Ethernet PHY in an X-Powers AC200 or AC300 companion package.  The two
> > packages expose the same link PHY ID and largely compatible link-side
> > registers, but require different control paths before those registers c=
an
> > be accessed: AC200 is initialized through its I2C MFD, while AC300 uses=
 a
> > non-PHY Clause 22 control endpoint.
> >
> > Some H616-family products were shipped with either package under the sa=
me
> > board identity.  For those systems, this series uses a SID NVMEM field =
to
> > select the control provider at run time.  With CONFIG_OF_DYNAMIC, the l=
ink
> > PHY enables only the selected fail-needs-probe provider, so an AC300 bo=
ard
>
> Just to bring that shallow discussion we had on IRC to the list: I
> wonder if this is the right solution? Alternatively I was wondering if
> just patching the DT in U-Boot would simplify things, and also help
> other DT users like *BSD or U-Boot (proper) itself, to not boil the
> ocean, but just allowing them to follow a standard DT description.

This can be used either way, CONFIG_OF_DYNAMIC isn't a hard
dependency with this design, aside from adding CONFIG_OF_DYNAMIC
support for mdio the dynamic enablement of the correct phy control
drivers is relatively simple with this architecture.
