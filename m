Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7893B385D86
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311620; cv=pass; b=ldBKA/1g6coeNVOCm0Ks6+ywXGuM8PS0YCEs3e/y3aguDLBaL18RR3zXo8Vrm5OkePDypR49gYXWovxPW3AF5rmC99mRmyWiT6mgDPacqdPkwZn+CbLtUpuA3AEdlEhgNni/Y0a2tEv9NR9cWWox3Xbr16G3lKUBQhDasIm0l+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311620; c=relaxed/simple;
	bh=97oUKsO0e5chpZ77/TXNGzc+ViH4yet7xP4s2/riIOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iniWez4Ay9r2yCtnx9t97g+FhmYFE0nNmeVo4gUlCJB/2Yz4R+945Lzlun9Y+WBm9V0QYtKSWZtL5nH9dzIC3YQ1+A+kXSIrt6LKkNCZmYNPBE7J+4zPZXAkHGvOI4LE2FwPEVAMlJ4gZx5fr8wdYIX1zx6ECzE7lwFK5Izjaj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYNyzuGb; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYNyzuGb"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3304591f8f.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 11:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791311617; cv=none;
        d=google.com; s=arc-20260327;
        b=ei+Gf3WkihX9WKo9lTL12P7l13hl2AXIeX3Fw/Kpg2WkOGbl+P8a2B/MKELK30CSZq
         6dfros99Zgl7cv8kIXRIohMfCJIjNQhOdp8omugUOlY7wqKvc+h9gCLAUtVTgkAQZLkl
         9+tjqxwGj1VAIEMeZH2rqQNt6vo9zPElyilLYvzorfQwW4+VteNQV/EHUWke6wu4osdF
         Ea7f+ZkxgT7dUpbWqBe+XY5UO67bvAYrYOtkC7xQ4tM9kTX0mvktAal/nEHhGeMIktO1
         TNpT1/B9btA+BqPAWnA2644HCBkLk/RTOsTmP2puFLXXdWYFHKLlKxclL0J7zcOPDQdH
         REGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1I/Bjkthev9xcVUp93lwFAJuDTou6l7HQTsHKxmqsYg=;
        fh=bNrgY0oLYg+wtOzQjGKpMPIcOG8tQgvhecaqRBTULYQ=;
        b=JbY5NXtLV83EHijc5FTYwFB5k9ezbvyJAzUYycJug3/9KYLs7rEkNf30Rs0UdQZSSC
         MkWbyD6J4vo4dMtXJlJatCyAro1yyZcb8wIrdQbbbOJIn1lzQ2COFEWJnRiabzzjWa6A
         5OlVcJQDViDeC+SAuYGihMPet1a4TzqLCccNN3GIa9YYdayVTwpk27r5JnD8KMFzpQNS
         Aoo4yC6LQA6EV+dx/AYK7hUelCe/TTQSDEydzTRuj0z0P4XeQtkM0SX1imvtEFKrDgwF
         FelP7f/jYDkQkwo5kPrY5MR16Pe9AUexyVoayPmkxijvqJRfvh1DN7JCSB7yJ+uVfdp9
         hg8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791311617; x=1791916417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1I/Bjkthev9xcVUp93lwFAJuDTou6l7HQTsHKxmqsYg=;
        b=gYNyzuGbEw8W4W3thlPUfhzcRnGusY6lf3EsyUAc/nJ8UnMCTdXApXgRl1ks+flh/R
         3nuifYo9GCF1zUtCvxZZbn/ndZY3BmFFEmzp5x/9O8pnunYO/T/DkyC4GO/qbjrUMm6u
         c1eZRWsydrqSm70+EmlkERII7S02TvFh5QEX7fuNcvIGNeFtjruIG7pr9d4WWeP2NVTM
         iyZp5F/3YskowHayAhhd0xicqdv6zQxv6HMYk4qVL0bi6lPgR31v8xShbf0XMpTkdH6y
         BC/4NEb76i122EwS/3DyjXwI3ghwDzL27WXpirH3bOjllOCnjF5lNPqAI0qhKmyxJj8W
         M3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791311617; x=1791916417;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1I/Bjkthev9xcVUp93lwFAJuDTou6l7HQTsHKxmqsYg=;
        b=IL13ZaaYOoWy6KmJ1vHJsXfd6tpSBSw5ztnx6nrqVsk4BwnRuxMqQE2S29826a0Xfl
         3hjxbq/AUQpfVitHHMODoCRoOCBprv/VpzST+8msgm9XNN1xRR7VrOQrUp49YLYtd0eV
         hMQYYKJM1PmesM1kQrZGSfxrav4KWhm4fNMMMNZOP3sTnAmteZesHEVfANGenRIvkX8/
         vrqpWXS1Iefsn40FQs9NtMKsWYtYMOiehRN4vfew/efvoVzBm3Bpi7HBjt0cFdk8rLxJ
         qJVwPDE3WO5YIRPP8/HLZduEHoax7PxpNEVwqrkC4Liq3WHWCPA13gx8r2y1FPCDhYsW
         cmUw==
X-Forwarded-Encrypted: i=1; AKwUvBw9R/kWLhEY5WGT5eQOKfze6EiNDDvzY9KqfdsKnDOTAmrv5KcqM9rSveIjkPpsnxDihoVgwMVLteWj@vger.kernel.org
X-Gm-Message-State: AFq9FYK9/zZm4NoH2igy7NUCNCvsvwQapZsQWElrmE0BdMB0O858K0vG
	M1HMlzygbgDxMsmnhL/7dmTsRsJhXWedGXiPLwjkWFg0+rDnlMSRtlhtnJYtXYxbmCFAM652XvH
	+533J3ITZBLImhk5K5vwXjTnqjN/rPpA=
X-Gm-Gg: AYBFou2jI02XqlltxeeU3nwWSGApl2H6xe3kwrCYvQVZjEkCpVojyLk9DIXQ314k4dr
	figClc5PFQqukr0h/PhmsKV1R7B2lhzXsiPdBFaQYZ2q9BDRzCk9/Bz71hOPm6an3N4LuKHi0PU
	LLg1Ycxdz2oB7VmOYUKBvwgV45L3ROuCQ0frZSr+n/Bo4z2LHqrjMAKZxwaUHlFo9HZvBGp/lsE
	njJtZvXSwuM2YVTSWZHCL0x6nZURwvfgVo+DmY34zUMuukxxMo5xpxU92LyXTiLGN1zrKTLzW1L
	MCg5Fm1uYNJl4dDA0gNjHoqf6LI6p7i5Siagn7aTIrVMZuTTnAQfWfLeudgRzCm8N9550bDxY0X
	NBjdrqqDDsF6zL/sPxaFQx7T3OP+Qf475t74NTtsJxu4=
X-Received: by 2002:a05:6000:208a:b0:487:1ac0:32af with SMTP id
 ffacd0b85a97d-48c728a7f51mr452023f8f.51.1791311616531; Tue, 06 Oct 2026
 11:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-5-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-5-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 19:33:09 +0100
X-Gm-Features: AclHuK-lHOnsjkuXOpvnCyKRYV7OYbDYDNgNdkGPQxNTBgQh6bjjlMS_ndycwy4
Message-ID: <CA+V-a8uam6zpuFoJURO+YuiYLeckAYvEAOpF5cZsH2buBsfLBg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Sep 28, 2026 at 1:33=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
>
> [Rebase onto v7.3-rc1 and sort the board overrides by label.
>  - Linus Walleij]
>
> Assisted-by: LLM
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 637fc92dcc26..74b75be599ae 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -305,6 +305,14 @@ versa3: clock-generator@69 {
>         };
>  };
>
> +&isp {
> +       status =3D "okay";
> +};
> +
> +&ivc {
> +       status =3D "okay";
> +};
> +
I was trying this on 20261006 as soon as I start camshark I get the
output below. Im using IMX708 sensor on the RZ/V2H EVK. Are there any
additional patches required for this to work (any sepcific version of
v4l-utils/libcamera) ?

192 login: [  196.846011] rcu: INFO: rcu_preempt detected stalls on CPUs/ta=
sks:
[  196.852193] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D1048
[  196.861489] rcu:     (detected by 2, t=3D5253 jiffies, g=3D5753, q=3D6 n=
cpus=3D4)
[  206.875392] rcu: rcu_preempt kthread timer wakeup didn't happen for
1254 jiffies! g5753 f0x0 RCU_GP_WAIT_FQS(5) ->state=3DI
[  206.886411] rcu:     Possible timer handling issue on cpu=3D2
timer-softirq=3D2740
[  206.893406] rcu: rcu_preempt kthread starved for 1255 jiffies!
g5753 f0x0 RCU_GP_WAIT_FQS(5) ->state=3DI ->cpu=3D2
[  206.903455] rcu:     Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
[  206.912616] rcu: RCU grace-period kthread stack dump:
[  206.918235] rcu: Stack dump where RCU GP kthread last ran:
[  178.982667] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  178.988821] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D3946
[  178.998117] rcu:     (detected by 2, t=3D22262 jiffies, g=3D5753, q=3D6 =
ncpus=3D4)
[  199.056986] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  199.063092] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D6596
[  199.072322] rcu:     (detected by 2, t=3D38018 jiffies, g=3D5753, q=3D69=
 ncpus=3D4)
[  176.177639] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  176.183749] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D9246
[  176.192984] rcu:     (detected by 2, t=3D53773 jiffies, g=3D5753, q=3D70=
 ncpus=3D4)


Cheers,
Prabhakar

>  &mdio0 {
>         phy0: ethernet-phy@0 {
>                 compatible =3D "ethernet-phy-id0022.1640";
>
> --
> 2.55.0
>
>
