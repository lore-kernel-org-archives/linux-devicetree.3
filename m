Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EEF42640C
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660549; cv=none; b=AfKvQNoUplmnRot0ZY0JJq2ve+pZ2wpW1s5N2KirZJ3VcY8Dyzslhd6NCw0IfhIs8yw8pH6s9Dhc8euVlV2MKS32mJ/ohe3+9w+InwEJ16vbO2oRP/fyCnY+pHK5rjYaZUezZolyt2y1LESXRsUIY0z99ZUZnI5nfVDvnWFHKV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660549; c=relaxed/simple;
	bh=19jg2lnbTri69zQgVhr/NQjVFCslnOuGljfwHwp3p9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKZXzWdHZ7eC2GiVB7oT8uLO9laktgO0GA2ESxg6/9wxccoylyHwbL6oPn7gJp0IWTvsXTQ+Cif8ipBVz8/kOLKgAJg/s6FtROPcwtMo+zLraYAdTmMS9rWGB7/aWJPccaA5O/TvqXxpzSg7Gmqx0YEpDw873PgkvqjFOOkqyqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c375a9e76cso3318965e0c.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660546; x=1788265346;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+rIzCWZwWUvnN7ZoJhz2SVkMSZPN9hcBjEcwV+nLhNU=;
        b=i3By7EKXxuOXTm5obk6c44shv9/wH3vhphxk7gGxUMwcN4jM2nBQ4EoX2UZTyN+r4F
         xXQZqvI3bg5GQrfu6gF00v4823k8Fj0nRIsrR7ssFNYEWjneFPJi7Jv0M/SR1fw9chCO
         kqcu9/Zu0hOoto+0fAfQ8AaWSHJezzesrSiXubLD9pd2kv5wHJusvknBCWTNrGjvdtPZ
         qAQJqKoaYCxHSMx+8HFguBmTu3gbZGAKno080JrcnmXONxIQdGP8gsJSXHLLveVzwPw2
         bEkbRpjwtrcjTYyqZ0MrUATmzYlqNoaLdgdrFpuYyLC4oRxeCG+f7CsBkya9INa7xB5Z
         v30g==
X-Forwarded-Encrypted: i=1; AHgh+Rrv+ab6uEUEAgfU6obYYcZDhRuNAkbdq5y+t242rLIC+Z/mTorBboU85BB2Int/5S5U/MMXt7V+ukJH@vger.kernel.org
X-Gm-Message-State: AFuF++natZkyLg0ZBM82S94YmNrZnxdzrVVJPp6rdRur8/K3I6yfLTAX
	1gqKmS4nYC23cC5djgqk0126oAyCS5fLJttZF9GTNwAI/mITxtWa4e1B5X1RRrWKIrU=
X-Gm-Gg: AR+sD12cDnrU6tIO8yATBcYiKlZItnygakL75/HfBYd4JeaYX/xB2KfKgJMGja1XFD3
	y10xKfhbdap/NhZDDIuWMwfeICvCn9RE5M/fUbA/udXzVeMLfb6+82ayjooeo4ELxm+r+0Ohma7
	KmGV6+anDg+0gnejO7upWpTdDPrexQo2esyzMsevjN8pBxuqfQDC+IWJ/9OWAU3jHSNl7hyZV84
	DZS+pw/oMqtqQhNjuZYu+etMSh1SZgQ0CrANR9N5dr8DxrvlAC+JTaJOx9OF9RRjqTXNSGvm1yy
	PgSI5ANXhS+zCSvS0vkRnw9wbr6BqZg9JkuK9HlGfSNBZrQ/JqF5SFaM4jrOWk5gea8E/kUztgv
	Y2Skfjfc/FAE8fwy/2BquplyuIwzU84+aY8DqQdANYgU3JdqzLgJ/nDIW0oRXQZsm0vYHulV+S8
	bw080PRnrHZ5OEu/iWMUMHLkdxmgseNf9kVqLY1FZw7FpRvqlspejeiH3h1wG0VHGtHNPYOqzRg
	kHhZbt48vOrNXhXa1z7OzktqQ==
X-Received: by 2002:a05:6122:50f:b0:5c3:2f5c:55b3 with SMTP id 71dfb90a1353d-5c642dd3b59mr2145683e0c.3.1787660545702;
        Tue, 25 Aug 2026 05:22:25 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623d2fab6sm5899593e0c.5.2026.08.25.05.22.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:22:25 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97bf8f10ebfso2431219241.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:22:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq/W3pQ4d3BAnt1p799aJxqngPPddXty2QrURE+yaQudRzPziPaO2q/qU0zu064+DQkaqiQrgkDNrYL@vger.kernel.org
X-Received: by 2002:a05:6102:e14:b0:77d:a23d:ae70 with SMTP id
 ada2fe7eead31-77fe9814c27mr2227510137.14.1787660544918; Tue, 25 Aug 2026
 05:22:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260824075936.2904336-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260824075936.2904336-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:22:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVie-98BHsSg5M0yAnZsVWgSr-DForifCwiPcJyz1G-jQ@mail.gmail.com>
X-Gm-Features: AcwNN1VHo_Iwbco2G78SH4gvsKQGahjhs_UdUCHEWSkKQyljk6c_fOwgu5bpYwM
Message-ID: <CAMuHMdVie-98BHsSg5M0yAnZsVWgSr-DForifCwiPcJyz1G-jQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a09g077: Add RTC node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 09:59, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Real Time Clock (RTC) node to SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
