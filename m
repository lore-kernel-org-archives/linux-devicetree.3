Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395754;
	b=40EYL36DAMhd10F4hyIXOieqVhcD+drHd9McuDRrA8mJXvvhTUUwcxYop5g685Xgr7SO
	 fpsTrBBKsEldL6K4ljAVrXZW08YBjJmNKYhtHyxEq6tg1JeXBSKk4hv0YgCG4dR8SzpGU
	 OkCl3epADNYY9FxrAOVWntXLyilTOTk8C8g4GE3YQIssmtPToVG7s4SGDUuepBC/FB9Hx
	 VOZA1ZIhkjjCIPzkk+XI/Qopy9EP6fc5KtRnPaMu0RtcmLDiVldp52vCLXTTLJ5bLGp2n
	 GER+bK0nJp07VT7WtNaA1CQxRDIF2bSxURYqw0KAN6x3jJmEwMjeqNwSVkJ7V200KFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395754;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yn5y2q3JJulnHdFFu2RjD/z39f48yWR7C6Zxb/M775M=;
	b=bSEbNfJ+wlZX5iHurnjYgHeLor45cqCga80/Mub2G333r5ORpyvhWlMLlW2cHiLC2Cc/
	 tAbHux9/iaT+sXUrNYadiOlP81B5HAchmWTRzxmSFOzwSak+BmXKcxFiy+sE25EXjSZdK
	 laOXOW4rxE9CcrQfc0fbDIt9edSXdi1tSRO+0r84gZ2a75Kkskqg8DsH3wdRsSo6jhnJ9
	 8gUNyKLpUDyFTO6UKu3r/9qmW84Y51e3QFwQ19Sr/Gka1pRPDaUaKhm86sXVvO/MjeVns
	 QacnRKkSuLjNnZLkvFY3+GPMOlpAeN9UQzCuyDNo+syU+tkfHlnL7BhqbPRvnylG8qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25C606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F25C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-567cb8f983bso1479505b6e.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395753; x=1795000553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yn5y2q3JJulnHdFFu2RjD/z39f48yWR7C6Zxb/M775M=;
        b=X6VaDZmI2eP//4RxdIxrz2JjEYvwB9sDpbxuHxFjUYcScMNRhfGbF/fXZoVw7FUVNB
         y513nM0WMCVDrW6ANaxSK6bj41jCzUZnr+E2VHrnyDA2Gr0A9L0PP5kUJaJe0b8mVsdo
         /V0I1c7I1qYmdZNFYKchm4RrVgfvmPDA/3vnHzWm5YwDP95kf+TKcKiLsX6uOxZjFvIt
         +8/4L6/+hHn/PRpKeEzSdp/VSmNyZz73zyFsqReD2Gqt9TW4AcFw+WtpCz1Bk13/r841
         7UjYo2Yzx5hS0KjXnB1Bk7JUBLRUPVj9Awddr9CgS3Flep4Xrfm4s8ckBL3EIWiidAxa
         h9Sg==
X-Forwarded-Encrypted: i=1; AL+hErFnEi7gLeUw1W7EOr2Ew+0V9LD0MWkF0CrMdmVBf8a2rff8pFOnp5V6GqPxvCE4ksfuKUZbXQMK04dO@vger.kernel.org
X-Gm-Message-State: APuU4Z9M6vODN1UiLl3HzRbJ4DVrC9zmEsh0/l8PXt2Z9ADhShehdzTT
	2HV+c48zwwZAszNq5mKjUCF2TSKJTBNNu8TJ+353mkW6hAdiLXWxiOa76sa+F3K7fuU=
X-Gm-Gg: AYBFou3xkJo9urPWYwBxMSHd04xgrUttdAElIqL8LcUBfCgfeqf/dXJOoRcQ7muBdoF
	Bi1BRNO5scb63F3qe0JidgMGSaHcrV3yEErbiCx/iVVcFADq+bAz5RD2i9kUo0eIB6GTxLdxkcz
	iBfFO5nE6vQ/191xgp/kUMTVG22BM18tfv2QWOyV1bxeK3tmrUJSFrmw7NuLa5svgOhkLciQ6+D
	YF9lJ7fcBvGAsMOIplA/J7JFZWqqKxddg0BrsBPOvnmfVbJwCkVgErPwnmqjD3yLP4Js0TntD7C
	Fy/7uCuzhot+Dewd5XbCTQPZDbYuLW7+5ISd/ludap1Jn/uFijd9tUf7j2ev/UK6rSfqHE8Yh74
	s6/hlAH8zz3gCiQsPLdJ9P/uXUFS44dlCBgGmDsEXXEDgMKF298imHh4/q50HjIslHWtZTMyKL+
	CH9ngvr3mdlgua5iDaPgmBKLmdGGcdEha/RY7V6vDEG+3M5ZZkj+t1Xs/+xZCa+uDwSCNEENFWy
	xpu9uDHDZHIofrTw18swjLgOPSU+dtqkY4HqkJ/vNsUyJd/ykbdClO319j8p79SWFlTEGPvvg4m
	Fycaw7NLnF5yjpdGdSdBRkqFJ76qeiBtuqJyxa7RLNEKDb58SJZOxWeq0MFuuAABIwNSADs=
X-Received: by 2002:a05:6808:f14:b0:4ec:4c7e:37b5 with SMTP id 5614622812f47-56b96bd3b6amr1557366b6e.29.1794395752970;
        Wed, 11 Nov 2026 03:15:52 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504e7dasm4600477b6e.5.2026.11.11.03.15.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:15:52 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b28d7c729fso1901836b6e.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:15:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEWhUJP4UKqtAZzmSaw6Tp9yTCNoxIIwtyiEPeQNkAtBEtnBeBw6TgcsjEMeiPLWGYsZC5S/XtBrOXe@vger.kernel.org
X-Received: by 2002:a05:6102:d8e:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d4fb291ba2mr478980137.14.1794395373576; Wed, 11 Nov 2026
 03:09:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-1-1b2072e8c37e@ideasonboard.com>
 <20261110-steady-kangaroo-of-mastery-5fcd7f@quoll> <179438844820.272237.18262716067322018404@neptunite.rasen.tech>
 <e179b228-3f18-4b99-9c54-93699d13e63b@kernel.org>
In-Reply-To: <e179b228-3f18-4b99-9c54-93699d13e63b@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Nov 2026 12:09:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQOMX2GXnBpH=onofFp1w+TyZPNc3RWjM1pDbpLTG1fA@mail.gmail.com>
X-Gm-Features: AclHuK-p812fgpXzcAZTo074hP5s29t5onlgPposQZBLZQWezlnyhodp5CVCArI
Message-ID: <CAMuHMdXQOMX2GXnBpH=onofFp1w+TyZPNc3RWjM1pDbpLTG1fA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: clock: renesas,r8a78000-cpg: Add CPG_SGDn_VIO_DP_{TX,OTHER}
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Elder <paul.elder@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2026 at 10:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 11/11/2026 10:14, Paul Elder wrote:
> > Quoting Krzysztof Kozlowski (2026-11-10 18:30:50)
> >> On Mon, Nov 09, 2026 at 10:34:22PM +0900, Paul Elder wrote:
> >>> Add the CPG_SGDn_VIO_DP_TX and CPG_SGDn_VIO_DP_OTHER clocks that are
> >>> used by FCPV, VSP, VCON, and DPTX cores.
> >>>
> >>> It should be noted that there is likely a discrepancy regarding the
> >>> clocks. In practice it ought not to be an issue as all the clocks der=
ive
> >>> from the same SGD1_VIO_MAIN clock and none of them are programmable o=
r
> >>> gateable.
> >>>
> >>> According to the datasheet, the FCPV[BID] and VSPD cores use
> >>> SGD*_VIO_DP_TX=CF=86 while the VSP[BI] cores use SGD*_VIO_DP_OTHER=CF=
=86.
> >>> However, educated guessing suggests that IP cores in the same pipelin=
e
> >>> should be using the same clocks:
> >>> - FCPV[BI] -> VSP[BI]:                  SGD*_VIO_DP_OTHER=CF=86
> >>> - FCPVD -> VSPD -> VCON -> DPTX:        SGD*_VIO_DP_TX=CF=86
> >>>
> >>> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> >>>
> >>> ---
> >>> Changes in v4:
> >>> - Add all the clocks
> >>> - remove DNI
> >>
> >> What is DNI?
> >
> > Do not integrate. Most of the patches here were DNI in previous version=
s
> > because they depended on a lot of downstream things, but now those depe=
ndencies
> > are in the process of upstreaming so these can graduate from DNI status=
.
>
> Upstream clock indices ABI does not depend on downstream at all, so
> seeing this unmergeable is just confusing.

In case of the clock indices, "work in progress" would be a better
wording than "downstream": multiple patch series are adding indices
in parallel, so some of them may need to be renumbered. Just like when
adding syscalls.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
