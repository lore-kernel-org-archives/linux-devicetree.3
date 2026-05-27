Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925833E2ACA
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876066; cv=none; b=qpIL1O5gFyGxLu4LZlIUfWhr1z6wuv7PiDu9l1C0HcQrUGLVSuvoZHC5BKQswLIznDD2KSzAPNQbAeoprYyyICUP5g02AJTFIpMBCX8Z5n+tGnGCtYjkFRsx4HJYGWQ6f+2lqZ7qR/H1uOP9gfdf2IYpquJG4ZKPo2+4vktT2w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876066; c=relaxed/simple;
	bh=l8H4k73O2pOjYutLyeYJycSAhLBBzMhi9Qswbw/Ph40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnLv/ABqSZjJsw3jSuk16n+9euEawTCoTaAaezPrPJXc0e8RLuIWqatjCtkfYH1cGKTZDYc0Kp1342RUFVaR733DSAQt6EUhap4xLFp0mbf92r72/CLcufGH7GFJiDJhPCFv2Eo9NDxYNbCiFtPnzTnygyKtNvODNXdMNzkGssA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so1495863e0c.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876063; x=1780480863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9feKelBTkp+QS+4izy3Tl0/MY1ZR80J8OJvA2byIoJU=;
        b=K+kg5HiEVaBVKYDaRxOkXLVa3W2RNGNNwH6/xZPyNFj2KNx/MdqXhDvLTRPOGTErI7
         Hb1igz+YdNIoNixviz4fMkCJG6kb/EyyCcRfPoTAC8uJfJoj8moKiWpnxO8NSL2gGwc6
         LL34u/xi7I4PgSq5s/S4bLYgDeb/jqu5ch5wYVLluTLidKZdBo0lXARg3V4xj8gl3r1+
         Z6K/7Q5taprm+BbFdxG40OLb7p/7gSCShZwoH9tOqrPjojcaHeIBwzOPNmaVY3sug9H+
         O9PPzu1F89SWlrwztgK31d16WGqL0VvQ4jJKxMa+Krxy+rTfR7nmDVm40jwHS59DgZdD
         3G5w==
X-Forwarded-Encrypted: i=1; AFNElJ9AShal5CcjnC7MIePjaq/n9M9cbxUw6cw5vEDxWUB3Ju9Hggiq7WITewSoaqIrhw5EYyma16Iz4StK@vger.kernel.org
X-Gm-Message-State: AOJu0YxGqx1X029cyzR+JLzQQVaiQxO8ponufVbdCD9U1Bxk18EN7+6p
	sJaJxzTV4CAfj0x5mmueORyi585b31zic+EVkHdfpV8JSB8ss42hJ+BrIaoCUUmiLFQ=
X-Gm-Gg: Acq92OEQJLoXUugTbGclSSt0EsVcnTWbpeHn7BqrL2LazumelxazxMr32b61bBuRmUK
	ybX6F8EwaZ0Y7fv2ZZjyCAQ70hwiKvmC3kwM1m8lZuOiKUl9xHeR7SyQFoV4wMdgBoLN4jeEFmG
	VLDKqkEuPZ/CAQjvkUlNVwoilA5oYjZTlTWeQpAAfo2GhPt2cWiLQIFDdHSQELF7xYhEKxuLgRA
	lH5OQsXUhD8YOhy75FB9rbMhVuyEtERLkX62tsmgzkrUAbAh/H+CtRmGNqbvNeDr8SVa+zB5P0V
	a14BNKh786mY6us0ocFlcy6Ey8/Ws1vfBA4qgwnkPYGeDdg9yWQ9HNi0XgAzIyKj0P9S2s8U/fo
	LU0CEyPJnU04iZ/bVJVH8Bd3d3hqZ4UPByMDMC0GABMCHSnXxhrJEObb7u1qgVRE+HMa4FJkvuA
	lAe7G1J2FjXXH7kaxMR0rIaJYyITnkDy9E6GatJK2j1p36RJNAwGqfRzYBtGiW
X-Received: by 2002:a05:6122:f07:b0:575:38d3:7c8a with SMTP id 71dfb90a1353d-5865d70cb74mr12764708e0c.2.1779876063310;
        Wed, 27 May 2026 03:01:03 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791f719sm19341114e0c.11.2026.05.27.03.01.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 03:01:03 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95fbe2d4d9aso3150609241.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:01:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ThqYkRRCTUQPd3JtZfybuXPO/IbiDzcDR0yjHlJUv1Pp2ampRaEamXp8PVm03oDfkHuZQbCVrqxi0@vger.kernel.org
X-Received: by 2002:a05:6102:424a:b0:631:28c1:154c with SMTP id
 ada2fe7eead31-67c72e1e92bmr10995566137.9.1779876060754; Wed, 27 May 2026
 03:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 12:00:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmHEBS5QJdLu04JK5V4M-MqqUU-8t0Fdnfd=ePamen9g@mail.gmail.com>
X-Gm-Features: AVHnY4JkqSxhC5YyoKkd_ndz5pmy6SIDfrMDg3YX8RAadkBcYP0uacSHOyYNwBs
Message-ID: <CAMuHMdVmHEBS5QJdLu04JK5V4M-MqqUU-8t0Fdnfd=ePamen9g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2026 at 23:02, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The HW user manual for the Renesas RZ/T2H and the RZ/N2H states
> that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> interface pins have to be configured as specified below:
> * SDn_CLK pin - drive strength: Ultra High, slew rate: Fast
> * Other SDn_* pins: drive strength: High, slew rate: Fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> HS DDR and DDR50 are currently not supported, and for every
> other bus mode the eMMC/SDHI interface pins should be configured
> as specified below:
> * SDn_CLK pin - drive strength: High, slew rate: Fast
> * Other SDn_* pins: drive strength: Middle, slew rate: Fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> Adjust the pin definitions accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v1->v2:
> * Take into account the settings for lower speed modes

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
