Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B194F213254
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776396906; cv=pass; b=bJcJgMmynTRkFtinLazMw1bk61l8IsJwDPKGxipgu/Q1A72mK0lMdaMKzYEBgtJki2gG7TKhN2Y6q/uKn1Hj7uXmE5c02iv2nVgzCjU4g70dLPe+ylpXF3KaFLVfxPQOOzbbFeumTBRYSCGEbxwukZG223zAxa+AH1yeSIVKzes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776396906; c=relaxed/simple;
	bh=gF8A8r3ZdauI6VbTKUCHB/m1RT4UMpNofJUQpN4fjuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jM69Hz+F7eP++kwCLh+dxbaWkUibPeFUxmJWmOlPR6y1Aatt7cuKI4FgOL7Jl9OtBHmKJMhJMXIteruqCavKwnAKnEsOlT5s1taNujQRBe5KDJ+J8RUZa2LqhHrrPGNK8PjKzjZrtZGqQi90oCwsvJ0lFDMwWhL3itmzOODPUb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrxflrXU; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrxflrXU"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad9f316d68so695975ad.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 20:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776396905; cv=none;
        d=google.com; s=arc-20240605;
        b=f4v6LCH31YZwCftVKh36zYOvx77VNd51W1FrI5S6Du55Gmw8ozVj47YuqwG/u3xntY
         KAeTvMS2eOlevKz6lXQs8BQREctPhkhFwPTlML2HDrFLqnyAd07j2TFyEsKPuBh8WOjh
         K7Xp1QdNQNi+DU/4niZ0ZQNX16+W91g1UXpHqJ2TtunkjeppxeIRMuNKk/2/5pyvmgUT
         WXsZJjqKgXI6Uexl4e3rq49djuJQ0Ca9m1YGLti+M92U+8sOf2XEFuRADPrnAXDzBI4s
         wyLZwvcZeDrLAtsHvBq0Wp9FBtAzVD9947+gHH4X1De5RjA32EswulaSQ1mLasuDh8yE
         k2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6EtfNHTq6/My2XJcQXOgOY/gmVJF4Mgoc6IRrILkcZ8=;
        fh=jXYPIfrQfuPc8BlmUEZC5903kwGNLOL0BPkSgjLOAh4=;
        b=XHaxUSmhrvXfUpgdqWyOMsmU/fdxupKOqgLmDelwTkXuLFDaZhy0BqggFcXO+mqniK
         MwJyfr3h+VAtHmhHMhsS1YukWQmHuet54moSGXmcyn02PgkHxIE+GNfgo4nKrlMkEfIY
         i7PCVOQ/fHJ5rZYVMgtQgEKlIilJ9uHXpfN3FlyU6Zcp/o9K/cauy8ncoSly1kyik3UH
         8JrUhNAxTEYcBL26+CWUphg/nLiudrz5un+EPUcrL319qmCD+0ATHIjPVUF82dX/XLVf
         ZdQ/Juipudhp6aYrwfkJxaEfk26Tmm/U1toQEICVN1zJYOLquQ6LFLeCfAFHE3c6i0q1
         m3Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776396905; x=1777001705; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6EtfNHTq6/My2XJcQXOgOY/gmVJF4Mgoc6IRrILkcZ8=;
        b=IrxflrXUAoKobTxdIMerywyCrtF15EjcFjGquxT77OG/HFd0ma6x8bS0tjpqL1spyG
         eIuqi+Xsn+9I+TRvzzZIpLoFgRUvRrWnhplSjOQd/rIdIMxTjr5BHriKCiafCdWZSd6V
         DYFxH7M0HXbK8UPiqNFN8stZsdK1sgwlVjcXJ1WxIhchFGA2k+SfgW/G+Jo8GSklFwpO
         EEeHRRqAOqXnvClf0NQzGW90r1pSGXdO454+udFMy244w0aDpOyTFCawBgML4WNoUlkq
         ErkMy+cYTFdDTu6xVDoOohR0uosm7w7W1KO2qZoklcO4AcR5fWq0XaRTnGsmqz6IT1W8
         EBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776396905; x=1777001705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EtfNHTq6/My2XJcQXOgOY/gmVJF4Mgoc6IRrILkcZ8=;
        b=QenHR/1JicUFlcbZUTUwfM5JrgPTggMGvMcyLti2H4oN2FOruQxIyFaMIis1F2bipF
         3rJI3J75D6+LYd2V+SYLDzrk+yyIMY7Q/F1B+Chxx+02m7cZ25GEE2CoY/M2t2NM+Pue
         Mb8w9afL6ma+6lMV4aF5jGP8mXRxzw4hRsIUkgRMWzW9E/mtSC6dyNv2PEu29gmnGHkC
         KC4y3gl3gAwDY3oYqG1bcbT08dIChgWW5gB8+pt4CFj4P5UUJuAUtqoaqUWxbpgMsDg6
         rL3zuBWIE8U90RvGJNCrMAY1MM0sH6yBwlbsemdXKxqe2iP0zMfGdxcoxuW8XOppgXjo
         EdKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9m0CaiTkQhgW6g7whqWnBdSgBi1X8lbOMflR0bxdImHUp6yJeZUAUFN7RmYbvfjtRokcqL9mEYYPRl@vger.kernel.org
X-Gm-Message-State: AOJu0YyMMPJ/BNmDd7vGS4LsMB94URB10y/ldqvb/4VQ0OseDM9fzxcS
	xynJXjYaqR8KWI9PkTj3nu0TvYN9ltqLGkR5dHvC8JobnhoN4I6Jz7WNOTTmdlohwCkjm1ou1cq
	fHJKY+UmgIFuCIAwuGl0NCyShQ9rHau4=
X-Gm-Gg: AeBDieuZyO4acGuoNp7oufoMDiLiGIkYdEOTFnqXz1B+Gw2RZBYJtSu9w6G6R7z0pnQ
	9aLnFNejgrfs54JGW/+aVcIdchOYTabZuFDYAldxr+2OwA7juKqbLcvhsu/ZU6OfFXx96erybNB
	GB0vKnUdSlRGjgg6kKmcmO0EtXVw8mnWOXUHHVVAXJBfjuujHO2z5GJkRzlEGdu6B4+NEYyvqPq
	5qJVvIc2hd617lo2Od9TFdnFwWfZgWsYqqUGKlwse6t8tFOH/dP8/1u/UQEZW8ZzvrnF7RPmsMj
	D5TmPkzafaN2tlS9uJ8Mi46iFrAaOMmO00455dkGYlN3Sb9UQBoSbWqWE1Y=
X-Received: by 2002:a17:902:cf4a:b0:2b0:4b3a:9b4d with SMTP id
 d9443c01a7336-2b5f9f1c862mr11314295ad.20.1776396905005; Thu, 16 Apr 2026
 20:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
In-Reply-To: <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 10:34:53 +0700
X-Gm-Features: AQROBzCSAz4EcsSDgTBw_xZT_iFIxHM0p5jci8Pn2_CPreeChyeCa29QXqIGGq4
Message-ID: <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

Thanks for your feedback.

> Where does this match the driver?
> Usually the functional clock is called "fck".

Regarding the clock name "own", I used it because of the following
implementation in the current driver:

   clock->own = devm_clk_get(dev, NULL);
   if (IS_ERR(clock->own))
      return -EINVAL;

The driver currently fetches the first clock in the list (index 0) and
stores it in a variable named own.
That is why I named it "own" in the DT bindings to match.

However, I have noticed that other DTS files commonly use "fck" for
the functional clock.
Are you suggesting that I should also rename the variable from "own"
to "fck" in the driver code ??
For example:

    clocks = <&mstp2_clks R8A7740_CLK_SCIFA1>;
    clock-names = "fck";

But from the hardware manual, MSTP refers to a "Module Stop Clock",
not a "functional clock".
So I'm not sure if using "fck" here is appropriate. Could you explain
the reasoning behind calling this clock "fck"?

Regarding the FSI clocks, they can be categorized into two types:
audio clocks and module clocks (which may include bus/bridge clocks).
The driver itself does not explicitly handle the enabling/disabling of
the module clock; it only manages the audio clocks.
From my code tracing:
    At boot: The kernel automatically attaches the PM domain and
prepares the clocks during device initialization.
    During playback (aplay): The FSI driver doesn't enable the module
clock directly. Instead, it is handled via:
    genpd_runtime_resume -> pm_clk_resume -> clk_core_enable ->
cpg_mstp_clock_endisable.
Since this module clock is essential for register access, it must
always be the first entry in the clocks property (index 0) so
devm_clk_get(dev, NULL)
can fetch it correctly, right?
Please let me know if my understanding is incorrect.

Best regards,
Phuc
