Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD627363C55
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208147; cv=none; b=sLcbpCKbXX0Ds6R2huvJGIZY77ghpA8AZoK9a3IeuEwF+vY37XjR6rBz/CTI3U84LsX/s+/yjE7xLoRmfGlhTXSMzU755/A74ZVk4Vh3gmrYVGTcaK2Ah9ih6qpX5AJM4ER/4UKLLWTAA9bvAVJKUK9hTyurF7bw59S/qtodh3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208147; c=relaxed/simple;
	bh=qMViffoztCTMqn48QLb9zX/hHyoMuIjIFeYSehCl+Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJvAKiOGrvvwnIbOeoM918EgpRNCfmivGf9SR6JYnIDHNcNKaksiOZPuc+ZJXIMJ5ixIUOjrIerJJdf8472Uyh00HBqD8EL8SNKr6sdn0J5idRO026I//ENiFVtme6rPXEbR41Fw73KERxCHD170zmBkGjSf0h/y5gvqs0IlMS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56d857af2a3so633934e0c.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208144; x=1775812944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqTHZkYXx3XaUYuf56o3EDTX420ivEQjaKKZt4Gr+jk=;
        b=YqgqHAq9/9eVMiLB1Gu6dKQ+QoJP9RugkXPONAZ2M4IaDcf/WwJfPVdmIYi+LuSBLe
         Zh6mryqpT3Gv229wyvQhZoVrKGjRZSkpDkBlH1RwJ/WJfp6mxelDCLHlzyf0LQvAW7z+
         aIZnintQKRebY3Iv3t2T6td/8rEaOa6qJdkeHx0hKJQrPuIwMgqKDc+x/lWryT17rMuz
         gSlf+rzUe0TCu78MW0uLWSSkfRlw+BK2q8uxxLe2jJgWNnsC63PGBfki4mbYcB7YqA2e
         7fSBM9hy3eSKUL0Vv+scrKxkM11ciiUcFi3fCb/6jwRuHXWReSDRCfkgeNw3HEqTukfP
         sVcA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Hr1QjVp68kkDCVIvRpsv7MEBpnawwB0ylGc6JxOj655sIBzHKaHp1NZoGCGTzYXwXNSUz2QGa+3f@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7O2Y781AM05QDwrvB9g8mBSiO4PJ7SLg/mBw7HCVJ7PJzEgy1
	dv41K67qiRjlSbUVXLOXG4m0ffSQrPL9NlLrsdKxR+vpIPHRD3UssKfpNiSztnAd
X-Gm-Gg: AeBDietZQY3S78zdAEH07+aRkj/tpniIVLrrAEBGLZDV/iZOdYnEqL3fpDQYvgC0xUO
	5st2k55U6o2LSb2P8Gxiu8bw8774YqMxw0zpb2fwJ9U4uCNw7VihGm9Y/k48k0Sl/SNL0A9OqjH
	ou/CbQUJWnrzu+D/Ggm30bYZz2XZbav6NsxKtUOyLInda7TycgalInkKFOQgfpFD84abCL88NGh
	6UAzxhTeh8VRwCDb4njCEwMCnkNaq7nzIJYuo5mjUrU/40fiPHXumBCScwhM2Z7pAmd73AnsfjL
	W6w1afM7GWKGS+R8t2d0yeOdaqdirPaIG9lewR69KAvKKFz9AAGrYYsdmJZCLg/02k12kCJQlLJ
	1aiHTBIwWhVM5ji5kOA9XaK8+dV7BNOSi9Pc73ni9fC8Md/REWO8VpnNQQQPIHDljAea6BEz3+V
	+U1TTNFa4uc87ifmbvJdRiRFxBoJJZj23uRCuRz4AhpIbNTpKeI2skW3u3NbRONAXE
X-Received: by 2002:a05:6122:7c8:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-56dab8e9fd0mr643856e0c.6.1775208144343;
        Fri, 03 Apr 2026 02:22:24 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bd0a8a3sm6721102e0c.17.2026.04.03.02.22.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:22:23 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56d8d479149so618492e0c.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:22:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXD4a9JS6bmlOFlP8mrVJfJBWHpFolzWrjQKdXwgJUp/cZjt0I8slTQjJXZg+uInm1eesp9LBRXJI7i@vger.kernel.org
X-Received: by 2002:a05:6122:698d:b0:56c:d623:896e with SMTP id
 71dfb90a1353d-56daba305a0mr682606e0c.14.1775208143755; Fri, 03 Apr 2026
 02:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:22:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaXqvoyzFOMMtCuMchAJamOGD4WKG5_16sy7NAUvKVzA@mail.gmail.com>
X-Gm-Features: AQROBzCnb6VpPRGvatHwhBVrCjOQ7-o3JrWeLFgYVGZIXfX3Imq6Fsi--Hd35Yg
Message-ID: <CAMuHMdWaXqvoyzFOMMtCuMchAJamOGD4WKG5_16sy7NAUvKVzA@mail.gmail.com>
Subject: Re: [PATCH 2/6] ARM: dts: renesas: r8a7779: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r8a7779.dtsi:707.12-712.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
