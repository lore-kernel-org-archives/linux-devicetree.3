Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806E532470E
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782625505; cv=pass; b=pGt9vYh/+RM2SM78FBi5t9NW538qx72wh+yWHwQ5ak664aW5Sz8fqOI89TPKivFrluojuPQiYBHlnwFJVGvKCd4mhdOGUgYkrMNkHDd1ZpRLSzaH4ZiCejL8LBLTADF28oO6SkEgF58Co+gONPkhh9TVm5IDkREJhScEH5wMFZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782625505; c=relaxed/simple;
	bh=CsDlGDJgdQwZg4iSP3PqY+AnJT9xfkmZeW218TPXTxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrCZu4IGoCfp/8KmbbDdEeFLiC4WjTBo4K7siWB6RxMezV6o+Qi2XeudjdbKFdtJRvsleCM9RsSR0K8uu7/vrICJ9Yv1pd+ZA87ib05hvlBGWW+GJ5a9yWC6XVa/JebvFOgaUA9QEgdH4hIKnREVjnI9FuouWO2MD54nkfFfkRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=KRPI3ToS; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="KRPI3ToS"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-139f1dfc9faso1043180c88.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 22:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782625502; cv=none;
        d=google.com; s=arc-20260327;
        b=X6gyDKa6CEta8NVqKQIG3uerhpqx5cjUrV9UUAhctAACvwZVWvT+Gv+otWQAcz5HDx
         2vC5UU1iFdqhruq1m/AEac+TW4tJX0YhSa4VpJB/Jkg91JkkKP28jyU1mkDixFZDQr3l
         CRJbVMBxCp2rR67hahGesWDQnaMVzJCGuqOmoJsUu1OQsc4nVdyML00VPkdF1XwSv4fo
         WSQmUfYkz3L7ofypkjMbUL1Ok6tBs2oSp9u5EBftXspcDYJ3i8AnKGmNLcNz7auZTJpa
         sjC0OV26ATLiMx2LPIi9LneJtfcqn/UEYCGJnP5z5RQx4R1dDBdkJfPV81+/acJP0AaG
         4c/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CsDlGDJgdQwZg4iSP3PqY+AnJT9xfkmZeW218TPXTxI=;
        fh=1MrTf7L7R0msRRR6eaO3hdmMOv9OfzjcUDAEr2VmJck=;
        b=MDc3ATj6OJURmwXvqQTrmEulNMGBwrMVy911gqvVJgoMZYWNr8J/XI8ePH9oDOyG02
         KXe0pIF7EO2v+HAdIj8Rhu45H8oywibyzMQm3klBxjkRP/kvSNXKvDnsuxBLFzHRBTfX
         JfCbiUuv8B2SCN3w6WISawgwUdOFyxhKGMc8cnKbUzYN9IUCSh02eBjySBOEHeUwwtI7
         I2tZNaGB27SNYTs4AAqezGrhyPVYTNzAhzBK7XiMfeUrftkkJRebXYAeyRSAEdMB2IxH
         uAqT+O7U6wqxJA7pV/atuQgphGjCyELUmq1Q0mzFE17bpkjgXAB1mekWjm3cYGNN09ih
         42Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1782625502; x=1783230302; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CsDlGDJgdQwZg4iSP3PqY+AnJT9xfkmZeW218TPXTxI=;
        b=KRPI3ToSY9J/75pVPke1p0Vbe/jQtAAXKBIa1B0htu18b0SMCo/EI29SbX6IzqUHDh
         zCqRbLBIe9VjQl80cm2pi+D1xElMASDiCjKxpBcq3OExoqGyGikBPriUU02BVzki6aJH
         NCvhS7284QDnRTxvjaJDkufOqzekLwpfJxgi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782625502; x=1783230302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsDlGDJgdQwZg4iSP3PqY+AnJT9xfkmZeW218TPXTxI=;
        b=ZDl0wKHXL7XQ4gP3cuJIuUpn3T+2ctF2cg7Yl3z1727AQ5+MzM3Ijrvu1asNAKKnRC
         CzOPcpYU/BJCf7Te4DzXuJ7Sy8pqkzY+0powtgT19X4QAad0gvTssa+kA+YCKk9KscT3
         LC6eIuTWEb51sFPBsnO+9rwDxyNPYuzwQmmYRUCk2bn34Gy3ihYGLwvcBLZjQkN4mIWR
         nfYK5vYfuxvTyLH5dBr2JhlZyksasMCYyKev3ifd72n/4GuMoOKBp8OLt0YcnatHQBol
         doSh+xfzKCbNTT+MDv9JnYScextj8fznqO2qiYqbHNmSLIvWl+OzPjG40e2zWdftA84n
         KZnw==
X-Gm-Message-State: AOJu0YzlMs41SOhPBn6lirqSYngk5ejTHHciP8HD7V3N2Ah1/pVzmGsm
	4Iq6+9hMyG2yiBhecM9rPQNJZui9CLixGbyh1L2fbxzBBUs0YcN5LoYQ4RsY4VowldfyFNC3HTa
	44KOEE+0aYiHs3Dn9JA+/+ir8QDqLl/zAIA/iQMtpCg==
X-Gm-Gg: AfdE7ckbSGkVmUQgslUks19t86TWefTJ1yVplpsERACptCtHSDNKmltZe3TggPl7Uvh
	7x+qdwIJ6KQOkS6vKoMCYOr34bg/7seyiEc5sAuP0LiHBFE6pVWGSXBESUBFAKWYRzV8w1OLd+M
	8VjZmUPoavwnNutsFU237XnVpgAFivUZRANiF4H0DvjlxXxOtedMsPhioZqicTps7+FRVSHFn1X
	7XA6g1omw7AFAxDC3UDbn1sOCp3UqO3P/ZAiRfpdJtSmOkJuLlhuwu+WSREgRojw1hjekis
X-Received: by 2002:a05:7022:f10e:b0:137:ed3b:e543 with SMTP id
 a92af1059eb24-139dba0a6e0mr9857693c88.9.1782625502400; Sat, 27 Jun 2026
 22:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626171906.476688-1-daniel@thingy.jp>
In-Reply-To: <20260626171906.476688-1-daniel@thingy.jp>
From: Daniel Palmer <daniel@thingy.jp>
Date: Sun, 28 Jun 2026 14:44:51 +0900
X-Gm-Features: AVVi8Cf9VZiPipBvaLrFiXp_JfX9GcL7q5z7yoikT1xWvcXXLK7nKbMp5RnrY_E
Message-ID: <CAFr9PXmAtnLSzA3GLb4qKvrs1X6aD+DNPSoEBXhSzkL7oPHBig@mail.gmail.com>
Subject: Re: [PATCH] of/address: Drop ISA parts when !CONFIG_ISA
To: robh@kernel.org, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel, (Replying to myself..)

On Sat, 27 Jun 2026 at 02:19, Daniel Palmer <daniel@thingy.jp> wrote:
>
> The PCI parts are already wrapped in #ifdef CONFIG_PCI
> so it seems sensible to add #ifdef CONFIG_ISA around the ISA
> parts.
>
> This reduces the code/data size a bit on configs with !CONFIG_ISA.
>
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>
> Sorry for the spam, somehow I botched sending a patch..
>
> I thought about making this RFC as I'm a bit unsure if machines
> that need this ISA stuff actually select CONFIG_ISA or not.

So sashiko worked out what is going on here. A few machines have
things connected via an LPC bus that is derived from ISA and needs the
code to parse those nodes but those machines don't select CONFIG_ISA.
There seem to be ~15 devicetrees in total that actually need it (1 in
x86, 1 in arm64, a few in mips/loongson for loongson machines, and
then a few in ppc).

I made a series that adds CONFIG_OF_ISA to enable this code, selects
it in the places that needs it, and then does the original part of
disabling the code if not needed. I will wait a bit before sending.
The reason to do this is I am using devicetree to boot a machine with
4MB of RAM and a 7MHz CPU. Removing dead code/data like this helps.

Cheers!
