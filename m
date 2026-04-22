Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF65427EFEE
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 06:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841102; cv=none; b=GFNSpv/fgJ1TM+CtuvNOCwT3Xa72lcDFh6wChDiLKP1AHip1Yh7lkfacsdsatLFzB5pYdoLIMHxNvdDBjjt4tMIl4qbP8R1AR3DiALkTm9ER2hGfvm91yiaEfDg8o9pDsFYsI5ZiUgOd3X9mye+qTMBKf8sX5H18NNdGLhDG7Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841102; c=relaxed/simple;
	bh=wpkRjIorbMJMpqwzpLdjkd4Y24lBbCPn4ze08bDnJqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKIG3PJ51unYJPIArhMGYQJ+zyVlYNUICMm4u58QS4Yx7clm9rww2S4/9WxmQQmCwyF0HvWbQpYtWsjjejQzToeX17d4S2+jZeM/1d/zQrVbMA7vR6I0DLtI3ZjyRyAswDx3QsujnDq0yQqzFdZ6VdxI+QQOAg6yIOYm6YTmVoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7dcc9b506d9so2228465a34.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 23:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841100; x=1777445900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQBlVUrhFqLpmXIMAS6FxW1MbLcWzT++sufCtB36Fh4=;
        b=M23l5ZWwhKhM2hZEYrM1ALY6Vkv+9fIG3WiTawxSkgZbFPS37sj5TEdT4tkoVFTPv3
         6rIsUkPwbCHFYl+jl2xAy5TJFUbqD7Qa5b7hF93zpqdUhiyzhbH4IdRT3pWBKRr+Binm
         G5N4SUe3JE75RSFLoQGb4VnJw+SymA/B7bnDBRQTcBp898ITiD5SbZkYCkNDGZc32POg
         2kpjOFChlhoNJN64IZS3xhcHs7qRhN/ccl1vR8dGcS0SJVNM1TBQyFMXwxMqV5autE8C
         Xzj0MWV8Fj9zy4h+EhR0KxxOhoUWyexK7LaDPjaa6oNwPMvIB1+tsM8iUsenmH1sH7fa
         sTPg==
X-Forwarded-Encrypted: i=1; AFNElJ+/f10ljv2K6tyzczVxHD8JcRhF+KHbmwynRF96gn/aN4D6luxmF19Zy1LGYvSJZkKzUJTXdD/BFErP@vger.kernel.org
X-Gm-Message-State: AOJu0YwWRRJ/gowK2O/ZGo5EPuW79T3eZrcHxHS8k1jhjHcYeIqNTii0
	I6bV9ld9pwN5ozRxYPhF7GZ8x4lYkLKenKvCeuVieCBbgIljHbi4IgaGWDBZwTaDsL0=
X-Gm-Gg: AeBDieun2IYxhVeAWJjR62uyFHEUhnp39XYkZdDtHCNE3mOmW6nX0QU/AzrnMQjn8zz
	f9XyhEVQYbdCQmrXH9/PRgf22rY0fVbp4UbwDPEpUOuc6yoiLT9QmnP1zTBZwtTQoA5rqDSex6D
	B6lTXzf071XKda5VnYd78xujLHsrMl6+is2lBSR2p6e06LQOzrOWiGTyxu37K0Q8AbOrTDEwZXT
	+fgnKlfBUgijIbeaPD6WXmWJCLv/f1Z/NaJ+wNcCoaHlTQW2gzYk5t2yKSp2X+KFt4GQ7juvEif
	Tluf3b8JNVoyuXtEWZf7gP2HENSL6Vk4Fml+2wMlHzlwebvsBk1Ff4QdQbxyDsBvD3NY6GFNLLP
	K1Pe9k52+NyNUMm7GxuFlLlUrSAuvjS2sQcGSiZ4zFYWmfGKVR8Q8RjvcAf583577ZFJC5xihpR
	jieIQ+TRYGTa7+6f11dxZ7rHoPKUmK82kzMHbl/LQGl2Py3dgKLp3obwMM5aKdEuPTtXa5AEg=
X-Received: by 2002:a05:6830:34a4:b0:7d7:e142:2ead with SMTP id 46e09a7af769-7dc9523108bmr13257188a34.20.1776841100574;
        Tue, 21 Apr 2026 23:58:20 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcdbef352bsm3022185a34.10.2026.04.21.23.58.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 23:58:20 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40ee9b945d5so4031576fac.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 23:58:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/k5T4v9uLHgocaeAmh8QnA716o8f2lameix7gAlFDhan3IRu8eLrgShki19V8lrrAfExOopxY0V7B5@vger.kernel.org
X-Received: by 2002:a05:6102:3a0d:b0:60f:f543:232a with SMTP id
 ada2fe7eead31-616f4b50368mr11299488137.2.1776840661908; Tue, 21 Apr 2026
 23:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
In-Reply-To: <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 08:50:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxEsYuOay0+Tf=4ByTAMp0=iXwcS4YSy7UY9_CE0hb5A@mail.gmail.com>
X-Gm-Features: AQROBzBFb_WdSQXK0LqlocZWzf5masVqawoXkZ-ffV8evv9b39yVA9knMtYt5TM
Message-ID: <CAMuHMdXxEsYuOay0+Tf=4ByTAMp0=iXwcS4YSy7UY9_CE0hb5A@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 20:12, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Currently non-SCMI drivers cannot find out what the specific versions of
> each SCMI provider implementation on the running system are.
>
> However, different versions may use different ABIs (e.g. different clock
> IDs), or behave different, requiring remapping or workarounds in other
> drivers.
>
> Add a public function to obtain base protocol information for the
> selected SCMI provider.  This will be used by the R-Car X5H Clock Pulse
> Generator and Module Controller drivers.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -3504,6 +3504,37 @@ int scmi_inflight_count(const struct scmi_handle *handle)
>         }
>  }
>
> +/**
> + * scmi_get_base_info() - Get SCMI base protocol information
> + *
> + * @of_node: pointer to a device node for an SCMI provider
> + * @version: pointer to write base protocol information
> + *
> + * Check if an SCMI device has been instantiated for the passed device node
> + * pointer, and, if found, return its base info.
> +

Missing asterisk, reported by the kernel test robot.

> + * Return: 0 on Success or -ENOENT.
> + */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
