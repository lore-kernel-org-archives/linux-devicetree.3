Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30FA477981
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331027; cv=none; b=dxMjkVHNSHM2y4CcZF96xem/Sm0s9Pt+7HXYjh3XLq2n3XSykR1ueXeENbOaTL7wHBpNaRkvYIAN9kO8RhGeU1Zcyf47yfMUH+nhRtWoaSSDV/7g1rZuAv5fj+JAMLRU68hJr8A+E3OFoGBgw/gjRhN12cZeJcQGj3sKpqs/AfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331027; c=relaxed/simple;
	bh=RrTRHpycL8I7Hc4JCwx5WcZIVQ7SjSZeCq5n4o+MG/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoXgiKx0S6yjoRLQDsbVUDrOFlkgDdTSsFswh0Nm1nzH1BN6vTLLHQDbcsEWdUR5VB83hWPia3aV+R8R5z2TYCrfmcgAqzwwzDxeAD9ipOspXuEVjJySOrzYJRHbl5Q+uPeqDG47EtaGwXBTYFjKdcX5otGUpwF4o+w+pUPWubs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-791a9878aa9so206143137.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331025; x=1790935825;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KL/MQSQ2ufa6wux9YuL+tzjixJQA111EVmHyVach6lM=;
        b=xGZpRSIJ1B6j3twpIGgxZTN0QJu1HAnv4x7AGJK0afS9jo03fE6MZKXdcjf5eXviAR
         3kSiH93XRbkQbwCPb7IPCo/eN7TodrJ7TT8A9+Bq8JhadTkyaBnN1ccEXjzn3CsRlDAp
         dfwpVy/cuV+66TNrm5xu+U1dhpIfiuKYwpNAp1082m690FkpZiGPBJRSvw6qC7AwUkXf
         gcXj5x4HRsr7PGZ9SaWGLSkXehSP75XrK/rSmio6ku471GR6RIqQcZ249T2cGZo9oR7V
         LLWoV1FX/VpQn8bIYBZCigG50btOvFst9KaghT/krZTgDVXVj+fhOO4KCjoF2X/RCwVK
         pAhA==
X-Forwarded-Encrypted: i=1; AKwUvBzKuJ9WH+7LMzDf4WXJOb5mGFqEFalkRxYzAASKL3F1lN3QdeN0rKu+nKGcrlz4w61Ra1LnhKBrnMBd@vger.kernel.org
X-Gm-Message-State: AFuF++liPSNlpAGt5eEZ0LMAB3xq1kSf5XQLsckVMM517eG/+N6W38Tu
	y6FoEtWa0kW3pslQqXWKCHpGSZAyr5vY7VXXOcTFWFx2qTFK1uk5BGyxjDWv0O9T
X-Gm-Gg: AYBFou1Kc+UGBXJL4t0QMF7c0dcA03R55mDMkLEvOSRbtVw2cFCvknYe0wutacWrqJz
	hHmHNcT4dSt6ULCOuRZ+a8dD56Q0lBSWhaMOcsNrvqnp8iDf8ZXzKGs769xqHnPbB/R7b4ITsK6
	XTA8puzQzECeAcheKZZiIr6TcW+/y15jjcjpT04FgRmiq0lLMDYepwv9KX3Gb8IT0Uw4DxBDEAZ
	154DHG5PRdW8FAgw8orYPAsUk2ZUYeZK6CIdbSHaW6nE8EJS0yriuLW7HBef2PnGvuxh1PNVked
	kxbfAuJmC2LCXvDNvx+o1s3u+5XpYm1zCod/WlENpCkIGDyDjit8MfvwrXbw/YovmYSCwnQHsOk
	eqtNom5EOLzUXD2RViuE4D6rdt7MbujDCuxYn0F3Oq45fzeJRrMUtbhEhZyjdQAbc6rf1v/djA4
	slMEBniTMMSATDGYy5ALH8eL1ZQ9DL+mDhnHYb5Q+oa1dEvQOFAf8Y/w+pr7CBHy8BYSRmZfF3d
	VuGN1HQdjPPk+u4Z9BS2hQ/fdXqhcc5EWbBtHXEcUm0CXc=
X-Received: by 2002:a05:6102:4b17:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7af1bd77fbcmr2117826137.14.1790331024654;
        Fri, 25 Sep 2026 03:10:24 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861b08f1casm1979036241.12.2026.09.25.03.10.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:10:24 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78a6c77d255so224359137.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxH66EgSjVp0cN24Wp3ivj5V72aPHyHYRSxIY/XcYNK7r23Ld7VlCYjkMDg/GOnBw+kx6b9QWLsAtNJ@vger.kernel.org
X-Received: by 2002:a05:6102:94f:b0:7b2:c201:10d8 with SMTP id
 ada2fe7eead31-7b2c2011359mr193571137.3.1790331023332; Fri, 25 Sep 2026
 03:10:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
 <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
 <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com> <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
In-Reply-To: <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 12:10:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMt95DBV1DeLa5zVkMV4sYj8v_uA1TTJiZFi_QKvMkAA@mail.gmail.com>
X-Gm-Features: AclHuK_GZIBSlb8NwsZCACC-o3m-qOuhGKB_o12zs05PvqCsSGvUGIOw-t14e2o
Message-ID: <CAMuHMdVMt95DBV1DeLa5zVkMV4sYj8v_uA1TTJiZFi_QKvMkAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Fri, 25 Sept 2026 at 11:48, Dan Scally <dan.scally@ideasonboard.com> wrote:
> Huh; not sure why I never followed up on this. I haven't touched the board in some time, so it must
> have slipped my mind. I can pick it back up and address the comments, including adding the other
> interrupts.

Same for "[PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0"?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
