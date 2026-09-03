Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5283546AA96
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429923; cv=none; b=h3ktuWeLf8o0WcO7UgXbpHmPsUjkjpDA05Tp0Jkbw4gSPDtFtexLUDfHkQi23j5FdSzAU2aMcniFBHO4iB11R+T3zP+plxjnw/XIQHzJs/IVFzZihHyTHBBIqygjheirYbqb6x0FH6dva7OcqJ24ZjJW4u/DFvTi4agg4Rx1QN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429923; c=relaxed/simple;
	bh=wKv0G5pklL2Tau4nv5A69Up1Qi1EQE0aYPmrDPjRxmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5BroLOL5iGQBMIbnKDAC/UnakqeA3hkrKNb9L4fmtv2CWsYLQUgwyBHSvBLKfbqYfNdkDNuTLATJOJpe/+48/lvrwFyCHHSVR89FXI9IhLSKsEnnfHOIqtn10z6bbw6UE0iSPNUVqcPBTIwTLaHoojPUjrQlzkB8hQaPIoHL2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-86d43cdee51so19582907b3.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429915; x=1789034715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sB2LZifEeupjsxCHsRGx0RoKXBpeYPjdfUIFuUgunMM=;
        b=oo9dBH1ei7h0eBAdvllCzn9zvMXFWnzoOUWaiLKEG51w/JyMyzW+0cMqNgyueYkBd+
         gKegr45VAUlvAtwhxpE3twYyoh8nyv+Wjvmf5JVZYdJCtUmCNYOLe4H7hAHsj6zP7oC4
         nq8dR1ID7BTC0QY1GKbD6RHkwnft1cZlpW1s5X9Lrzj613p7PkvRQmZCroNfdfrVV49H
         OjxLCQXCBIZ0IiFVzvRF3LRQRjVh+kHxlni8kkv2jdKxCQGwuRmnO3nI61ZBem+qMutJ
         cdXY+erzFcLYbsGpLKSFbiSYOy7C/sBPOrbOet6IRotYjWK1LpUR0+7fsiPy4QRaDkDM
         c7lg==
X-Forwarded-Encrypted: i=1; AKwUvBxGzhc+ikRTEnVUNrSDV/ad5VRXUleQIxciYh8Fu6QuYS2RaFMBeADKx8pFnYb1IC0yvluFzdlzj4Ut@vger.kernel.org
X-Gm-Message-State: AFuF++kWwq68xXrQ1XvwkiyI70MMH5XSbaIzEaFqpZF2EmI8Fl360gV1
	ItKN0a5RhCz1LsSLJ5k8vF13i0s6oshrt+l28sRtLTpzLu01J3v2FbCjZ+VUfziMgTQ=
X-Gm-Gg: AYBFou3WLYWYfg7a9NYZQqNq0TpTkXTWvmFKUZwOZBn02aTJfRt7VaGB0B+rHi8gn2z
	TL1cA9ORhlFHO5/jYbDWgsFasD+VCInZt4gHoIiHSbru4ri/dGvAuTHZWL7E3T0jufp1av+zWRV
	nBJi4zL+WPtZ8vmfQc4w1pY3oN2i8LmtUJcYyTvudyspboJA9SWT/wMc3FyzibkrNLLluF4J81e
	19kmaYNMoRmrbV9PefMekeCIskrWIGy/tTQrngYk3S5PlVljC5lFSJCNdQHSaO7flp+VUH++CW3
	A8Z5M77P+jhRc7Pzvg3dIEH7CHcWlqiNbhSC/C5egJmgfboG48Yns6YD1sX8/3sTcleojDolEj5
	YWonmzecFLIBQCUa09A5qz2jbMKQHeyRXlpKWaZzynlCV3eC6UAT6Aouy4G5LXcnZeah6JE0sWj
	rtCU375SMrLmbfzZ78Ecg3OuLQ92CYwQV4ebYh1amSsVgdHRqnTUCGxPLmlEuXiQn+Lrg1WqzLc
	EByu7jgyaJcXZTsIntLiADvysmajdu9fLfqCCunZNmHlbJcjCABiBGNOXfPYvlBCg==
X-Received: by 2002:a05:690e:2501:20b0:66e:51c5:f728 with SMTP id 956f58d0204a3-66f9bbf276emr3380017d50.28.1788429914682;
        Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com. [74.125.224.41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66faa50d633sm1331449d50.1.2026.09.03.03.05.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66f96418909so1270115d50.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzOwBgoMsTyI5dNZnb7KmPiao457uqdhzXYWE9DF49gb5YvIkVmIcFB4uD3oLMcPGGT7w2RLHhPhva3@vger.kernel.org
X-Received: by 2002:a05:690e:4890:20b0:66f:afdc:b49b with SMTP id
 956f58d0204a3-66fafdcb54bmr290871d50.0.1788429913913; Thu, 03 Sep 2026
 03:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829094758.23248-1-tanure@linux.com> <178818026093.2318126.3676223463693214854.b4-ty@b4>
In-Reply-To: <178818026093.2318126.3676223463693214854.b4-ty@b4>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 3 Sep 2026 11:05:02 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
X-Gm-Features: AcwNN1VRB2D0FTXRpcvHAcbTlWB5xZQpxaG0zutz7J3nfFbo_PpnG2ATadEMYz8
Message-ID: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>, 
	Ronald Claveau <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>, 
	Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 1:44=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Sat, 29 Aug 2026 10:47:54 +0100, Lucas Tanure wrote:
> > The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without =
it
> > the board hangs at random, loses storage and corrupts memory, and the
> > failures move around from boot to boot.
> >
> > Six of the SoC's PWM outputs drive the board's voltage regulators: the
> > always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. Non=
e
> > of them were described, so Linux saw the outputs as unused and switched
> > them off about a second into boot. The regulators then drifted away fro=
m
> > the levels the bootloader had set, which is where the corruption and th=
e
> > random hangs came from.
> > Thanks to Chuan Liu from Amlogic for helping me indetify which clocks a=
re
> > critical.
> >
> > [...]
>
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogi=
c/linux.git (v7.3/fixes)
>
> [2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
>       https://git.kernel.org/amlogic/c/ae7be5c58a819259e5eb98a3abfa608424=
78f2ae
> [3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
>       https://git.kernel.org/amlogic/c/1e5a53bd16ac501e68463e84023d1bff54=
3cc696
> [4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
>       https://git.kernel.org/amlogic/c/406292fd75f95aa3010fec95b5beb5a8b7=
e3ba3a
>
> These changes has been applied on the intermediate git tree [1].
>
> The v7.3/fixes branch will then be sent via a formal Pull Request to the =
Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to L=
inus during
> the next merge window, or sooner if it's a set of fixes.
>
> In the cases of fixes, those will be merged in the current release candid=
ate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
>
> The intermediate git branches are merged daily in the linux-next tree [3]=
,
> people are encouraged testing these pre-release kernels and report issues=
 on the
> relevant mailing-lists.
>
> If problems are discovered on those changes, please submit a signed-off-b=
y revert
> patch followed by a corrective changeset.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>
> --
> Neil
>
Hi,
Please don't take this. I will submit a better version.
sys_ampipe_nand should not be critical.

Thanks,
Lucas
