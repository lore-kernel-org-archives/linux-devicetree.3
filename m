Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703DD441022
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548316; cv=none; b=mrfjuf78BtqwpLuZ23RE6TkTB/ZiC29litjGrlgsqUdol4NuHoPmF9wQs7LAsP/9M67J5t1s8uYe9pUHhFDxXf5LQoCkLA78uj1E4vR6hHYSxWv6OlC2rGx+vPkvRWu6edPKswnAX9cb8+DLGrt0X3k/A0YrK3Q6MbW2+R0WwfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548316; c=relaxed/simple;
	bh=wBc/mEpxPWYG6kKYKrzng8yxGAJWiheWEr/si2zaq10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMV+vVUqXPfMLx3ZeJC9kmn/WjlDq1RVgjtLJOoLJbeSYFzd9cFLCvEZDmz6AqEbDbH5uFuSo8lrldRdFhtzDCXmIo9YKfzWrhgEpQiRf8mxIIe7oAJiNh/I3QGxHLQSXIueqbwfNBs6paYFfyuDNss3L/1ElxrCUHXerEMlkQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso614432241.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548313; x=1787153113;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L7MNCSv1Z1lagRcn5uepDfo8EwiNqq40oRyB9RhTSh8=;
        b=TALGDyYbVRRcVU+1rP1/QBaasMOp5yoSiIXJ2WfUoFSoFfhgcT6RFMYnl6KQeRyYEX
         PnldPjCB76OQcd37dC5iKk2je79vYpDVnTJaveYdoSQUqXbgqQ4GggJtXjOx63rea2Ye
         FwrVn+at66zUSroV+GFOXcEo3uMR+J6IpUNAo2SE2kWS9NCvYyr0DO4YDGLfoBoA6j30
         orRp7Y4yuR6x9VIx/H0qfzuc9Fq0uLj1+3+ZFB055es4deh6sWemSW+cTVg7Z1IIRuvO
         rhXwuZEQm3xylBBJOLpMejrx5Z4sydgZ/MZDOvZlIcZTpp1m4Vwyg8ASmJt7i0Wi9/TJ
         cSUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaHLSsdUTpXla5JED7eCq47pup6dhYDKMnR6cGpKUwEbybfC7DlNr6KDfcoTIjmJlfwABxnIY2paR/@vger.kernel.org
X-Gm-Message-State: AOJu0YxQWs/ALiHqWPoSuU4fhD8JUblmFIIee7VJ3o/aVc2orsRscUS1
	UXHEky3wxr6OzKGTGzYZEhyOJls7OO1hDuVGwqejBTxUVNQ8cnkf8MekRFk7tZN4
X-Gm-Gg: AR+sD12UFjAO1e9ccF6+tiy6caqbc35Bihy+EcqHMEBOoSUxWnRSwZnym+82j6q9v6o
	Xa6qRSqmyLLTRD0C0gPSAFvpFQIzB2M1GIUH+jphIfFHAZBKM6z1CENgz227TEJyjkAc4NUJt5I
	kuy6ALjO3tMDtaG4CwD2wJtTuD8Ts2837d6TC7Nj2mbVKa+pdWN5O9YZ44oPOIAthxEnEBlIx4X
	b0Pw7MXwvCymBsa4je74O+h6YzJR02lBYhdKTHn/8qdE/JB01q4ix7ki/Jy2JUEWwuy5vRuCwT5
	wQh1tYzuqCDYDIKWUjhnK42L7NgSvZwvXqxEJab0bgVUBhUaKEPsY6+XIhHqmDzt95uFF17Sk+w
	WqMACFK3WF5/gvWRClINenZRuhTN9qBPJ4MKKxYuDdDcxgjFODF8guORr1aNFlbqr8y0Pkj+Pfu
	7Pypz2rTRV20oSWyoiy+x7DX3pAiviYhDo6TOWJtP+IYXQIwHgP42/Eh8MH+VLbFL7lzoBfyHRD
	QY1cjbC8tTc6aNPuzm8Og1qxQ==
X-Received: by 2002:a05:6102:8020:b0:74c:7fd8:73eb with SMTP id ada2fe7eead31-76c87d7044amr1726539137.1.1786548312772;
        Wed, 12 Aug 2026 08:25:12 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76caf5b6c49sm862726137.5.2026.08.12.08.25.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:25:12 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-969524c1a63so720050241.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:25:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoLKprHFI7pe5TRouyTaqJCRaC6kfj4r4eTFI3Mudurh3kfRiKg/n7nSx+81Zrt7XHgSqwzsDdNmWPs@vger.kernel.org
X-Received: by 2002:a05:6102:4bc3:b0:744:d1a6:b11d with SMTP id
 ada2fe7eead31-76c87d7047bmr1726050137.3.1786548312284; Wed, 12 Aug 2026
 08:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com> <20260722085353.136986-6-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-6-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:25:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNEGGcuSVmz9-fBkOWp0UJm0raJQXFDMvC0QqTMGUQNg@mail.gmail.com>
X-Gm-Features: AUfX_mz589fDdhEdLZrgWxwyCDpICS4I5MWqxVROEDzOMJyl2oP-WDthInu7QVw
Message-ID: <CAMuHMdVNEGGcuSVmz9-fBkOWp0UJm0raJQXFDMvC0QqTMGUQNg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a09g078: Switch GBETH TX queue
 scheduling to WRR
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

Thanks for your patch!

s/078/087/

On Wed, 22 Jul 2026 at 10:55, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The GBETH ethernet nodes don't specify a TX scheduling policy, so stmmac
> falls back to Strict Priority. In this configuration the queue with the
> highest priority gets all the traffic, starving the others under load.
>
> Under sustained UDP TX load with multiple data streams, this starvation
> triggers spurious adapter resets due to TX queue timeouts:
>
>   iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
>   end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
>   end0: Reset adapter.
>
> Investigation shows that only the highest priority queue is advancing
> while the others stall for more than 5 seconds, causing a netdev watchdog
> reset.
>
> Switch the TX scheduling policy to Weighted-Round-Robin (WRR) so that
> traffic is processed across all queues, eliminating the stalls.
>
> Fixes: c4698a34993b ("arm64: dts: renesas: r9a09g087: Add GMAC nodes")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the SoC part number fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
