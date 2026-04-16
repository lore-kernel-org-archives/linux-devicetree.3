Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE947396587
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335605; cv=pass; b=qGxnFRtCXRkvbDVekJ42OKBw/X3/XH6QUFigy2+r+iDiek1ufCjcjOBFhTJFTySUGmm8N1h2U/pVoxX7VnTxB3VhOTSWijPY4klcO9BMbrybQIJEdgS1PoYHWUxo4F7cP7Wfxx8IxfQTjAe8AGcmNnkUEMqlzJ5o3g6HoNNhI78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335605; c=relaxed/simple;
	bh=ys6SjAbwkwwOSNiMZKz7D7xfWBNhXXjI7CffrOihqRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH81enFN4A/OfJf8BbOAvqkBTqUQV7HD58mN6A0HAoRBYa8LkkEw/ohjZ10KySFV+NOp2t6Ed3kaNRsvuV6DpJV+Sgcxu7xkyVPL7KaScYxufxcK9fgStXQ02EXf7NmqmzKNZfE3vl6lmHBuKyXXEhq85XfAgEBsnolTX8yS/s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=B9BM1rtF; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="B9BM1rtF"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6806d92de66so302559eaf.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 03:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776335603; cv=none;
        d=google.com; s=arc-20240605;
        b=eqFf6babcJilpjO9FkxtyUqZXoKwxBZXP8tKxrA6Y0cBag6WjVaX3WtB79OMyfmf0r
         8g0tN8JYcjosQlvroQqkwrtpobp1HI4quHY3MfU6j/7Pgay+ZgMh8nIxMvNYQQl34hMr
         SFzY57SPLPf5cluXrRAVK+hZ4+UjdWpAr4pxSoHI7xm2Lvs4pcvEg3TlSZPheJc9fQzc
         f15W8TjQJC2YJZ1dCVLFDqWOpSZTi09YwtiPD0pj0sfJZ20SvTpNey/ZjLmUXurWwRDQ
         xZ2jG5mDoeTt+cyhIavDYsnnddBU+QRviKoRRRHn1Nz1lFr98qzI38kRm4LEN0hw38gQ
         2Cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ys6SjAbwkwwOSNiMZKz7D7xfWBNhXXjI7CffrOihqRE=;
        fh=kdkQqaUKotb8rA9GUKniNI/udof4d1XLJRecYzF8Wmg=;
        b=XjgfCXNJbMSO4RM6VGIt2brbTneAG/ntno7LnN3f3kc/049LUELggJaruPrBx7LoI9
         0E17n8+nDnqzhktKYaAcbMmDX9iSEU2N4qDSNqyaX5iBHdhLS+qxtKb3MmwfK8GR8x6D
         iwFs0+0mRNtQS6XB3kEF4mAj1tt/vw8tQIaiPskS5kRgXuV+S3R9SY8h4q/NBUuLqY75
         dqyyMnIu1Fhk3AVitsetyWNfFxHHkNyW/7ewC9tmhiRzxZiR3TW9sFGRkDqOgtMBfAE+
         fQTu7YKrxr4B5OoWDvn+YjRNqPq0jb9XGCH7nk4wZBZfV0Nj/fc/DE8QRYdN31QaUsX3
         S2eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776335603; x=1776940403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ys6SjAbwkwwOSNiMZKz7D7xfWBNhXXjI7CffrOihqRE=;
        b=B9BM1rtF2c2V2dZx0YIK7ZBfI86RCFTH3w9ZB56U6T16m2baMyVOShnQaFAAKJnlrV
         dbhSYONpoL6zdFXTL/sXkRXaBdUdOK/xw0d3y9CFP6m5M1RgQI3eDiBTcsDLYZApGgEk
         yUicuaavLrrsQIdPMWQ0SSRy9kvo9+h9zMg8Bbuwqr39kPUWHqDYgpZxuwuFwjaL5kRL
         L775Buz3czvUJ0qv4JCr9Xp4xZyG2EU3WrdTIuXX0xHsutmKcvQtnCc/jflTptbCMNvE
         ngGBOR8N54ymJTM4XnrqlsMLDTj9/OfK9qYvmqTSXM3eRMYRvhfMFb0D0l1HXbzHaZhq
         SXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335603; x=1776940403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ys6SjAbwkwwOSNiMZKz7D7xfWBNhXXjI7CffrOihqRE=;
        b=SSvaxMd6Wyy2cEMkERU/CyTFXtE1I1N+Veat4XXllgQEcRSnIjrsyCgEnGUchHGDl4
         x8B2mniOW4x9xn13FSu/GqoMg8PGpI7RRZYLo6GAmvHxSizyLwylhxrm4a4nDv7/X28f
         FisTRbSox6XpCrwfXnDiYrru7mcoOZA0V7LS1iL2Yuzgro0IKZ/l9P1vjh/aRAzuVPfY
         IYG30M4cfpF4t3AbAMyqBcQTJoiHD1oGgIYN+ZM0os0X+g286+Fn9gxbJ5F5EhoX9wSo
         hHBHa9O0eNUhiV0Q+5EnMRuNBz+phOk3kpkmIEq5uXLioxev4Cm13zuvXR7FFLJKTJcE
         ggew==
X-Forwarded-Encrypted: i=1; AFNElJ+MXfJV+K07uua7vwAutX41fOfQGp2VXHPDvF76XrMRgqYbPzlKBdlx+1Pb/oZpSyYKnjK+4Jl7cDTK@vger.kernel.org
X-Gm-Message-State: AOJu0YzPFgdO59jd+xBAKez4TLn5cJPdhGakx4ur/1DEYeb0rm8L2T3p
	CfSUDODiRuSwkC/C+o+WPwalQn7lecjs7pDC9e0ZqL4NasO+5f6pRllLylkvQ+VI7VIJEWKocg4
	aSNjx17TjrBDe58xyJcEO1C1Qm5sorN56u+dj0m0T
X-Gm-Gg: AeBDietncUHw7DisGY4iSJ82smAt5HdReP52g7KG+QDTOaREvJjoA3pFgjBgJM5pplU
	6iXZRZtHfjvZwuliA7A6q4d256rYcBHHbC4/6Q67FjNmlX5GuGXrOZIfoSMs6jeiIC9OUe6WWi0
	auHwq584r627QExG1RsMcKHtrRZTfLsxtB+cYHQRKwWKqy1En+XOimwRF4n3W9dLiSXfFKrlFgV
	IB2lvhlRKBHXy3Xev2xSulwi1P/7LP/cz8QGTDDeUuoYMmT+jQvehszTLVmT1xuUZGntol9FgY7
	xZtrCqxPpOMh9t8DjAqm5cET8MQwnlyEGvrr0iIqmNb3zDG9fp/5
X-Received: by 2002:a05:6870:c69e:b0:423:92b9:5ce1 with SMTP id
 586e51a60fabf-42612e3aca4mr2210815fac.7.1776335602563; Thu, 16 Apr 2026
 03:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416092414.3210383-1-adriana@arista.com> <20260416095706.3212158-1-adriana@arista.com>
 <20260416095706.3212158-2-adriana@arista.com> <20260416100354ac85cb48@mail.local>
In-Reply-To: <20260416100354ac85cb48@mail.local>
From: Adriana Nicolae <adriana@arista.com>
Date: Thu, 16 Apr 2026 13:33:11 +0300
X-Gm-Features: AQROBzAX-RAhjw4JwkHHyO2XcSkeiIxM2zy7fbiV7Qac4LnF7Shh7IHBsR9v2qo
Message-ID: <CAERbo5x1zV2m=rT4ETQzajMw=-XT-p5xF2xaZC26Xr6kSD+S5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 1:03=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 16/04/2026 02:57:05-0700, Adriana Stancu wrote:
> > Add a configurable "ti,read-settle-us" property to resolve a limitation
> > where aggressive I2C polling prevents the BQ32000's internal register t=
o
> > update. This ensures the hardware has sufficient idle time to update it=
s
> > buffer, preventing stale data reads on systems where the "interrupts" a=
re
> > not configured.
> >
>
> Why does it need to be configured?
>
In my testing on a 100kHz bus, 2ms was the stable value that resolved
the issue with the hwclock version I tested.
But it might be a delay too long for other systems becuase the
required "settle" time may vary depending on the I2C bus speed and how
fast the userspace is polling.
I chose to make it configurable to avoid forcing an empirical value on
all systems, especially those where a shorter delay might work, or
where the interrupt line is properly connected and no polling is
needed.

If you prefer, I can change this to a fixed specific delay in the
driver instead of a device tree property, but I thought a configurable
value was more flexible for different board designs.
