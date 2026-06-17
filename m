Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3243BB673
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681154; cv=none; b=Bx8qVtFuA+3Iu9MujHA3zrulv23dhoaoMQLR36dgcD5i8SY+wVGM7JxyhdEmIYF5GxJKhFGzmhjUzZFwN0h++5WUf2W0hZzA4cTzVEkw2yO0ObjgKx6BKvQIa9zct+VFBXXxBbNXV8awf0wQe+JoNG8oMJ8hws9stNyGoDAkV+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681154; c=relaxed/simple;
	bh=5ly7+TzlKvMHDJG+KCFDA2OkEcHM6CaYu71eIzXrHMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1ajdBvMSb+XGIqnAfl7R8hYnzNKjrSnyShdco3kq0M9i71Bxw69wIlTKBB3DdqsPjh+tBI1PywuN/XC6c6YumsAB09yLKFMiXuQ4Kpfb4T1fd1g2YzOVpOc6Qu6ag6a7p8srAPTuZthO+SIpmX2hbnZB8DgmikAxOhdHCbrx4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6e2d54d3dso3116971a34.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681152; x=1782285952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztFXz/owcY4eIy+dbZPgHvU1FccqokXXCpyEUGPoPhk=;
        b=NUATtyTqiZUmiQhXSKDLTn8bne1cIQu2pfys+VTuMdry6QxZyKMLxOUnmJRUTAa7dr
         N9RfUBcgnHeRSl9G/503Qc2e8WVQlh6O+ACdkIOavqydv4P69UGh8376Su303mry0ReE
         8Y80GrD3Xl+Ug7Q0nYryDtbz6bdnzY693AcK7pyJTJEbiFVlCarejSZXiasMCKXOj+W6
         I3HpB/aeVuVlO4XEi9ljn/JOVHcmGozdWZRmBYQlhK7+WjAzgiS4CGF2HnzmNrcQ97Tz
         6+VsIDO3Rm4uycNdqMOL4qKrQ1dXiAniOfJ8oKqBYOEFjPmvM1DijbeDKV5Nbyb05bRn
         nCWw==
X-Forwarded-Encrypted: i=1; AFNElJ+/ff+6s1ReaVEptsL6BSfCIEK6Aob6iaaJTIVlyr40qQGqlxi+MQzUj8Ot0emxTsj6MbVjPWiIdNqv@vger.kernel.org
X-Gm-Message-State: AOJu0YwnoyJuEbxP2j9G5UNRvDed0l179UTIWpWr84TB/8JVAiwt/7Fq
	9/nyuJueR4qobmlk3Y61C7ZVTfFkyWc7lQcYuutkoWedWD9b7aZUinqMwrmfbPLK
X-Gm-Gg: Acq92OFmsl8A31XdBekK2Fobmc9NwBGuQUYgCRhueC+VsnjA2ZP8ICi6mqI6iJX4xjq
	th3NjKfkPinu5RsZ7p3iyFr8TRvMsu9dhU/yNhp8AlhzguPwtPAeXWYqX5VPUfFkwJX4vUwrhPl
	Gm2HYmTg8BeA7ASGnQJLFf3X9lSnbZH1foLlfkpSJX4WWn6ghFvFsUtvCdrjzioPxJKIkhepA0S
	qCYOMF6yQW/+ovF1YobSGOAtNVawedWbCvFQGYf2CVWS38aDCoh8kwfOMwHh34MxZGp8kNy4HDt
	la7nMfW9FhMWKfoH0WWEjckiO6KnObnwwfafW17CvqUjHRT6be7DCxoIX4og+D1D/iQFmIWz965
	rgT3Df44maRPF1PomzjFOo215cqJtC8nwkpaSOU38Bug096AZRVgNg98ggpFclSiy3pqZgtH2Tk
	gQ0aV0jT9mqx+YoaMQ7o0mYZ7l0AFnDayJHNKMmOrSwdClt+0k0A==
X-Received: by 2002:a05:6830:7008:b0:7e6:e385:4c15 with SMTP id 46e09a7af769-7e90b3dfefdmr2772719a34.20.1781681152357;
        Wed, 17 Jun 2026 00:25:52 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f5bb5fcsm9162176a34.9.2026.06.17.00.25.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:25:52 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e6e2d54d3dso3116968a34.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8eEM4kC2AS028YDYeloXvoX/d+eVvkGgkT4nIp+etDGzWWjv6l6nDQwAETSRKNDtk7uLgmkx1sppgq@vger.kernel.org
X-Received: by 2002:a05:6102:3354:b0:607:4fde:1921 with SMTP id
 ada2fe7eead31-7246d33724bmr1269131137.24.1781680803055; Wed, 17 Jun 2026
 00:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615154805.1619693-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615154805.1619693-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:19:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_=9SQA8Vvt_MH+_dj+XjOozZr0ywYvqj_1rz9RdcFfg@mail.gmail.com>
X-Gm-Features: AVVi8CeCaocSZWOROZlkzUCWU99bSigpuNR2Z6uNxB9VqjP7r73Epe3QI4x_0y8
Message-ID: <CAMuHMdU_=9SQA8Vvt_MH+_dj+XjOozZr0ywYvqj_1rz9RdcFfg@mail.gmail.com>
Subject: Re: [PATCH 03/12] rtc: rzn1: Fix malformed MODULE_AUTHOR string
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 17:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
> closing angle bracket on the second author entry creates an invalid format.
> Correct it to the standard "Name <email>" format.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
