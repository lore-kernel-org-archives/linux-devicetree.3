Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6821346E72
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208196; cv=none; b=VMbQRziLqQPsq9MIwpaQNCZVvGJrxKZMCAQGFNEvhrt8YpUvubeExx6CvIRXoUAY/ZjEHPckFouczZac2XXKDkDujYNrxa7YFTPayAJc0NkJaqGgFwQ1CRjcRdp6w7Gd80eqsW27ngMS/pHGcpCHIUzs5WVbkerllDyYjStLu/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208196; c=relaxed/simple;
	bh=PteNZaH/pu2Rgr0Gs9WjcGnkXZwRRHo3rSjOHEa/flM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjrtvfxcbMoMq5UqGEGc/AAQSMoY45oicqWN85VxFHvd7AUBm0vHg1XKz1Xe7bsHTrMbeNCS6bvR4k92+vPtVVPWiV8V6Axurv8CE5UvcQnsHGAaGVYJ6Bnd/W7JWBiu0iJdqP1/4tMXoXEgTzv8zNvM4KnhJXnW5GQx6PRYhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso1996256e0c.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208190; x=1775812990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I33x8hNGNTQHLqp8m/P6sxkK71TBmOtYKAjfqJkvDog=;
        b=GIWuBkWyuakBj15rchDaBtnOoN8iyg5WUV+oBtjhk82zdK5YejdzOUxeGx6jTsDZAK
         Anp7hsBiiHbEuNa7af+2WD7wdxogn+XoBmYH3U58HeGgZySiSrOsTUspWR8iiLipJRKL
         rdiJF4jIJ+upgz65rDi3xn/zJPUYPHjmwN36S9Zgk/FZgiFokgp6SovZ9k3Rpwq4gJTU
         GhW4aFNMxMRh2gqOJEbJlhgP2RaSuAipPCwb+uwdq228Nttm3036DCoQ0C29NEX/FtsE
         T7m3dGtJfPiqhXYrRVge+GAFEUT3yeKNuHUDpJkZGcYB0hG+GvjrCn4uprae1i2awNTS
         ruyw==
X-Forwarded-Encrypted: i=1; AJvYcCWSjKK8ZeirjZJx+n2m1i7c6GBWQuzvXjArGqJ9cM/Qhu6YQ3BeYbfnvFeXy3hRb+0W4ppa6VL64Mro@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7yMxQ4ML4Jujl+LXbKO+fEju3yS0+TUwT+jX5oa0ggx45Cy7q
	omgi/B5B+iNWo9eJ1SVkL/zaPeKmUBKhIzQoCShanAGMIs0j7e57rh7RwKwXoXwb
X-Gm-Gg: AeBDieupKIqZpIerL8jBbXC5w0UACgEUDD/Ucm6wPfdFt8aT0jW5MzM0RTVsdGZS2V1
	9PJTkOAbB3TyVqzt/1d8Qd6TOl0GCHWdVDtbAr6Jk0CFmeXYySr8ZUHopsZz8Bjh2YFIQSDAla9
	neRgHGlwn5aBVtjO8fjh2COBLasswgmqvgg3wTyYgdwlhNqezCQWbAqUrLfKTOwINWbqTDMHCVy
	f6GtkzWUTwbHMk2eO0BE4QqAuUdebUxc5wqDw++SiS/mkWFm0XDxxjduBtNDggplCtPW/VWAlOf
	cALSBJ4f7yeEtR/TvIaXTz5qDdtr/Uh0PQORaRyWw6xlVGA/bQj2LjC7V8yTzPZ/VmNhTGLCWcf
	1ApqM6AfCiCIsVz0gXwmxg4ezopVur2QUzRQuOzpTCK2T33vt7Ilh2gaHhi87HuiM/vcXPmwybu
	V8qIfoeBQcuyLit432QuT4KIm6FMY2P9ZlS4/j2lpFietBLju1fI27XUvm6ckiV88T
X-Received: by 2002:a05:6122:3117:b0:56c:d862:37dd with SMTP id 71dfb90a1353d-56daba00310mr820233e0c.14.1775208190306;
        Fri, 03 Apr 2026 02:23:10 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bd0a8a3sm6722449e0c.17.2026.04.03.02.23.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:23:10 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso1996244e0c.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:23:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVws50pkUgMTUJahhneKIxwGv4lqLZ0uqo5JwkRQmke67nHASOIpV2ReqiKTDQXE8ELIWGrqnVWpE/l@vger.kernel.org
X-Received: by 2002:a05:6102:390a:b0:5ff:1d91:a4bc with SMTP id
 ada2fe7eead31-605a4fcd40emr771373137.18.1775208189971; Fri, 03 Apr 2026
 02:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:22:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvMorMi+wXaY0Lyh6V7UAHfWmLi-L4q8UbuY7oe=UC+w@mail.gmail.com>
X-Gm-Features: AQROBzCQwZaYRUu7vhbxTj26YE3Owx_k7G6dQI1gQ3uOUpCmwWAEjJ6d9e-9qTc
Message-ID: <CAMuHMdUvMorMi+wXaY0Lyh6V7UAHfWmLi-L4q8UbuY7oe=UC+w@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: renesas: r7s72100: Add missing unit to bus node
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
> arch/arm/boot/dts/renesas/r7s72100.dtsi:40.11-46.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
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
