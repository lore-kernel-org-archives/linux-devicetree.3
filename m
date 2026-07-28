Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B321413788
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273950; cv=none; b=ABW+EXQlCeXNRwq3bfbtKct1t97OMA9N/Q2OVtUGO9CsCdrwq6Rg/s915lQVA9Uhc7Fb4FghVjkwJv8E/R1VBFFwcFDUkjQu94JqwmzSTgwUgJ0K4dsmticRibvkVx4ByApi/F+lCSUS0NkGGTWvMXQ3XUFUhS4G2lP0xHVHBn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273950; c=relaxed/simple;
	bh=APWk0uOj8/6LVjgqEtJk1b6uSGlDci9M7cPzBIGfdF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c18S4rNYd28qPdgtiArhq9YZnU5adIA/PIS9FPlhr8ND+1uoaL7JTERa11UINzlMqX8/BAPphgV+rGICqnHKYmwHYYW5MSQEj3SZnxBpX11joIt7JegwiYjz9/HZH+wYxhlG/lSbY0etv670VIseepyTfjvXbOHTer28B9tnvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arhJvCiW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arhJvCiW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b966dd74so1653235e9.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273947; x=1785878747; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dUKZYq5xkF+c+j8L2UCzb9nPYl48cxNMgRgY7fYgmE=;
        b=arhJvCiWsnMDShQuKi1qEpuiBNzclxRrA8COReiRG7NMiZgP02HqV4F5qmeeLr+Ivm
         STSv0UwU1RrxnHzaheLqxL0OR1C35VXJ2TqtmoDxjXls0jj6SXwFj0jyWzHPe1t99kKj
         WVYizW/FAREUzRqBgixpM5w1P9sK6TwjxEDFRMKDvbj2AKCrNmhU6gtpnLUmSr9N6ugV
         caRWujc6G4+6C//2ZTPtny8liIRtUtMEKxrGuIUfAJl+2jEstOvhD5yClHdqG25+9CLW
         aODyveF0zAqsvwzHi01LHUukSin1FbG8R8EHOZlPxhxmTQpiT5+rFEILKUJEPg7wGWGF
         sB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273947; x=1785878747;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1dUKZYq5xkF+c+j8L2UCzb9nPYl48cxNMgRgY7fYgmE=;
        b=GvWVt1SiaBna5dk1L9pciyB8S/HuFwfNb349Fv4FWk9+Cfrk5x0DTSXOB9doswv3FJ
         CeJCEL1gi4epJ16TBQKGgnxpianoDPD7BcUX/DIHoWdmwGz3EdpkbIkZJmXA41QJ2Vni
         9gIFIomBtnnGvnmw1WunFfQVO2+EWlmpn2LthdPsBG8otyYttxHkSSIBDEsbfajzdHvw
         uHGrykkp4mwI6jKxGuU74ms6lTIf/FXGrmaxHRq69fEyDYyAc37sRY2ijCCQ/XqeUk3B
         RarT3+2xLxkZclo1gfFgyEJRHQ+wBrNVEi6WMzHPy7Htye8PQE6M0+ugi8Cf8oChOAO1
         ispA==
X-Forwarded-Encrypted: i=1; AHgh+RrqxeJXqMWMXjmRjUM+ggRixjoCJLl8p5JIMLixktXgyl3JA2fty7JLZ5AqvxqBpJtJmZZI+LYzfbD+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg0imv9sNwgKTqOWOqnmKyRDnRdACoTz4tl0rA72X2xp+WB/cn
	ZtsWBWAw4Guu41Wst+5UE8ef9n/Xg60hjEi6sZzpe4MPfDw7iH7NWLL3
X-Gm-Gg: AR+sD12GcNxX7a2ROFmmuMfSBQLdWK0+NftRPWuuiRjsqkuw9oji5Df6eOhUfyVr5i1
	T1RkvGQK9qgirJbR66EdYVgkbCAdSDwegPSrIwvrJIG7sezvl1M+1ioRAuY9LS+P5ohIXiITpfu
	ndrwd3EB8KXMLsQavQZNKu8gLSWvI+8eJkO+cM6t1n5vKA2DS8Lxwzc+Bzu7I7TIvyp2eVzuaA/
	8NwVKoqJFDyHYXCN7OQILt4aQwEJEUZZP2pN3xeulUVEezy1fc0x6q9vw/GFsajqBc7BttE6oca
	A3b5fiwoPOTh4DmfeV7DVqV8t3i0XhT3C5RuU5iCTtaP5M0O7SRXWC68XbPObowBbaEhZsrrFra
	ULFMlETrV+HyMUxYIe8uOTYhoET8wGJ9kfbT42ZkYrepSZP3TtrgOdVaoY2X0z+vg0gI3Jldri8
	tbf4vKdGGbeQ64JGPB19XYz7TkiL0b+ZWeV8Jufa2qgPCegPhpqXthriBuctmO+/NplfzM5xc=
X-Received: by 2002:a05:600d:844e:20b0:495:5375:2510 with SMTP id 5b1f17b1804b1-496c6568a37mr33118015e9.24.1785273946598;
        Tue, 28 Jul 2026 14:25:46 -0700 (PDT)
Received: from grey.localnet ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45c297dsm103054375e9.7.2026.07.28.14.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:25:45 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Date: Wed, 29 Jul 2026 00:25:34 +0300
Message-ID: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
In-Reply-To: <ami0TaY84IslWZyo@redhat.com>
References:
 <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com> <amiw7mfPfSPjLHLH@redhat.com>
 <ami0TaY84IslWZyo@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartYxrm5NhARqO7C27MMFWz9g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartYxrm5NhARqO7C27MMFWz9g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Date: Wed, 29 Jul 2026 00:25:34 +0300
Message-ID: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
In-Reply-To: <ami0TaY84IslWZyo@redhat.com>
MIME-Version: 1.0

Hi Brian,

Thanks for the review!

Am Dienstag, 28. Juli 2026, 16:53:17 Ostafrikanische Zeit schrieben Sie:
> Looking into the other patches. There's more mixing of the clk provider
> calling the clk consumer APIs here. It looks like this just takes a
> reference and holds them. Would moving to parent_data address this?

I think so. parent_data::fw_name is indeed something I have been looking for 
and didn't stumble across myself. And I suspect when you say "use 
parent_data", you don't mean "use parent_data.name everywhere".

But it raises the question of how to handle internal clocks, e.g. foo_gate-
>foo_div->foo_mux->clock-26m. Only "clock-26m" is passed through the DT and 
found via fw_name, and only foo_gate is exported.

For the other clocks I currently rely on the string matching to resolve the 
parent named in the static init data to an actual registered clk_hw. The 
alternative I see is storing the struct clk_hw * in a table by index and pass 
it in parent_data.hw, but that'd require managing the extra indices. Or build 
a clock-local name->clk_hw lookup, but then I am just reinventing the old name 
matching.

Am I missing something obvious? Is there a canonical implementation somewhere 
that implements modern best practices? I learned that looking at existing 
drivers isn't always a reliable guide.

Cheers,
Stefan
--nextPartYxrm5NhARqO7C27MMFWz9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmppHk4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoirHYQAJP3CdwusoH3pkXKfPo4
IsHXR5HpSkcfs8UCWKbXUiLjzTOXi23M6YRSjmwFG3d1x7/tF3zuRiRB7UoTbPxi
Dpcjy4P38mBhhj5ViTMPZEDb1+yGlH/55A3Q13yyGUZAYrWBvjlF1+CeyejwGj3i
MVs7cQGfnjS5eKxnSlMeu6YES3/GMT1FEr87RSiK1tIR7l5Ly+ZlVUeFL6j/QR5c
0fRWrLVaRuf40Z+Br0mTqVYameqPi3Y2txNe/WB5/6G3h+Pwgr8fa18n7kss1CR4
PLy4xOCkdwBhFr3V1XAwmLR903mrts0OzyiU2WEgelU4aIvO0g+IY/QpVCb4Tc28
sIFnx1o9RB82nrHOGyZ+tE3Td9Z8jdagf7NCcynDF9OBNO8d2p2VHrytuTO05BU0
6WTcRZf3HNTRavdGicG0D+UZLTrVSeATG7Gn84xOtEcqnNQgqGw+7FFrbYL3uvnB
zJpQ0g3TxhaSjw9l5WYghaypuxgBUI3vsXsNBCFUi9/LHutvv7c2UFoB9pGMO+0F
agh+s3+qnrEIuyCa6gMNO0ARQMjjfVWPCMn+QO0W6LDHLm9V862PI8/fSAHIJtBw
8YniFVm03EcJNgSelHRlZO20sDNBbjjcJdMzKez23UwFsD+debYrdpQOo4Z1MVqr
o4X7ofieFY9lg1CnhuLk+OK+
=e+iT
-----END PGP SIGNATURE-----

--nextPartYxrm5NhARqO7C27MMFWz9g--



