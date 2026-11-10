Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794278146;
	b=FGOs0JFzG24wvzA/t/07D/IR8po1Pr88d4LkN7DreeVXFXhQT2GlF9lTyCr7vy968t79
	 5Inkt/l753GCs3Ur7NvAb3ozSB0I20xsKBsTIknyXDmVjhwOYoXk9zEnw5kTtbeZzb+Qa
	 nN8NylPybUeSEstps8ltbUDMBObVwkqcnHDE1XZZwjRbI8bxJPZ7TFgSY5bojk+mFN+o+
	 mKNVW5oJTjlGR8wYz4gSSRgBjs1jtpx45Tp8ncW4eKG+GIQzoxhPUfcZ2AmF5VSUlD7WE
	 zbhsxG6E2IRjxWSVZOdcfAOH0rNxQhM1rUq0OOh/szcj5aCYp8Dv4iOei7nKcGHpGlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
	b=gTV4lgHqtIg+lbNt/r5GnfunqwYVTaoRhAY5nwvdW+TtChODYppPHsTeFBKoJ9IsvLCt
	 xzAEI8FDvm6rFpj/5JSaliVow9Np+t2k5/TEpoPJ85/5UwPnowLFIuggTocxG6uG1u3q8
	 GZuUDBZ0PwJ/MtUzseurci65iPP5sFCJwHZwe+up3YscWL4iDXXB5aq240t/58Dxi9odg
	 j0cczeyO3fkLDeVEOV7OTjutWzgIIHIODYLiCNMQqje9OAGafbYEGJ6XShiyiMRyju6IQ
	 5eBGxSQ5JraSW2iPMHvC7oskdrLnL8g/aPHEv+/LV0r/amh5nXRsJJpBTZqTZgyB2aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWeSr5r5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B23606A335
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B23606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWeSr5r5
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso1681904a12.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 18:35:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794278144; cv=none;
        d=google.com; s=arc-20260327;
        b=UTd3/ZQO5PhkxOOXl2kcN5Tt4EoPEnCvW8JhF7Oj6Jcj7mlwe0KayEQvIXgmD1XcBw
         9mEhv79ommoapAt4Tot9WX3WmqB35+e+3jHH8B/pe7GhH2EALPNkt0tyOoEph6pxl5jQ
         ZrCFcnU/SzBok3A+gAt8/o5zmKf5H8v6cgD5HzrwOzwwxrEXV/OwT5fWjV2fCcCd9wQF
         AzXBZHgHko4fCYar/wtzcwe58oaPimCWWvLnT5mlcKIq6p+88Soaiaz3UCNMpYNNOIDg
         V6Eptiy7v8GN+uCqvG0TLNP5OWcR2A16kV01J8xOAMdiZT8S09zmw0CIk3myMYw00gt2
         R5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        fh=HCuqcT7aPjihTWA9yTQ4o8kK4ERz4cPAIGL2mplnYyQ=;
        b=bgYYgI1oJRCUvt9mP26uBMXgW14eeeud7CJbWQlZnVZU0vbrMnz6QAbOexaDV/JTVf
         +sWXy33jSXyWFzCC/ZdiaFYc3Chm2nHwFVf0XZ0Ciu6OR7zcljaAg7oDRoPtAIfl9PdS
         nvw8PWHcsxW4sfYGZuuSgrf0rxob8THKL514nqc9QvlPuds/m6WrPahL/kvqK7L3czFS
         JpDijpr6dPtqmEvEKyfel8a5XJGWB5jUD+gYgLMlWLmj8sCG//9zk77VCWE3vbWzme0F
         G8DTmGkv/UYG3cokV0hTgruGN2eD7UGd3F6BNyqyW45RGGOZf1QVV1ZZbPIu+6CqPEEa
         rGjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278144; x=1794882944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        b=eWeSr5r5o4b1bkqYgjtJbC3rvhYpbz3xWgu0aFWS22hceYif1O3IQXjrS3egH1On7Y
         KX2rRkHlzyj9L1BWTMksqurfYziKbAMiQ/sLsnW2woDzPSHgBnaBJkAHN9eMGje7En8F
         hmedJE2eyTyBa0d220Zu2/+RfZYbFaZSycyh9uhIuIfnwXcRYUnaPlgIB04++iJw4rMZ
         zlt+wbkvaTn9Su/9+0JxBb+QzhIuCezceOZaJHA7ngx38wdX5AXaFTH3QQ6G3bMIDWo7
         a57FxHRfYEDzvyHNNLpvVnxr/9YhRNWLNU4jxDGHiMM8iGpaZNV+iJoblOzKcHB10bum
         VEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278144; x=1794882944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        b=SjE0nvU/+nen/N9Y4Pel0GFyceiSJX+p2UAwCAgpGGzRHDjLOhK2XFBTQQIrwM40On
         2pZcRPLBaQSAyVmQuc+1t/qAKcIQzH9fr3W1Lajy7vJVHVWkAosVhaA8YmFXUzkfwGW/
         idLuoi+/ieuLGCCLkic8lQiwN/XahZ4jiEZejYgFua9ugjgtLw0k+eytWlpDT+AM0DmI
         sydoP27Pn+TONwhxXCvAufS5NlgCY0Z5zIcdPtoPel39FQeXPvmNH/vG9+SXn7G7+JNp
         tH/p+XatKaIG0VJKfs5aJTVW7LF5XPRtE2tgdfQfAScyvp0pLfj2eUfYVvnz8GL5hHgn
         1Ggw==
X-Forwarded-Encrypted: i=1; AL+hErHuxm7IWjkwHbGnijGqNWDFMn2yt8+JPA2Nel9RrQ/vU1QmheIEfFAUTSYY0+Skrx5Lvwns+gkjXB4O@vger.kernel.org
X-Gm-Message-State: APuU4Z9fXHIHXwuEEqtBwGlrKxOF500I4XUmhxpCejlFYTa+vn9BJzxW
	V/zoZI3GGgHF/L0ScGoRDQxH++qOgHnUG68+MOvOz7uFmznX4SQKPyUfL3ZEtuLB/iX98LIsp0I
	bRWjJJpRWwyEPqWtYNbD1Cz86FPa5Uwo=
X-Gm-Gg: AYBFou1Kly3jIYdp2T73848yvnV1nGwkuzjwfZe+QltxCe4u0FNUFRRaruEXQH2PMQa
	GICgbhCC8d2qq93yvDrRBsJqZTvBY3p657Ng4SuhRUqxnZNO/QLhwPNyYCd/vcVAyuOcvWOxpvO
	j+UglSF++YKp7RFBK21njSensqrW9nSNiT+Q3IcBTL4LQHijTYlnax9biyGvKS+g+v+J6ic612N
	xriX0WzaO+HRxdCF57zhMtneG6mTJ4GWMOCz7Y02IYa72hj/NHwOVx6nH3jtPATJeSObjiZBmHu
	2wBYG91bTS6GQkm0VXDJ55idKwSvhsFlm5I/izCddbpg+7sa8En+xSgu5sQR2lawfEJbBgUeeI6
	HrGOspyyZrghZlzkzamRO0C3AHjDa8kgpSwDy16bWePHOO/0rUTTc3N3uwhwzB5cjA8UCSGbUTq
	+5n/6GbF5QpxqLb/YIJ/Uf1bwkQTiv7T12JDud3ozp5LAcDhPAR+lkhAuclEDe9MfqrlnzWrh5W
	jCsU2TzP/H6zwnoYT/jgGosvSPLTPc376Caxh/MQIWC0N4lLQ==
X-Received: by 2002:a05:6402:1ed3:b0:6b5:6116:e333 with SMTP id
 4fb4d7f45d1cf-6b756ae9459mr1091731a12.31.1794278144068; Mon, 09 Nov 2026
 18:35:44 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110013646.1582970-1-rosenp@gmail.com> <avKAhjtbi85dpGoV@x1g10>
In-Reply-To: <avKAhjtbi85dpGoV@x1g10>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Nov 2026 18:35:32 -0800
X-Gm-Features: AclHuK_Jcl2NU-HrOo7MbkFV6enMWs315CdjsGGJBAubQkYibDnJglGFx-rUHxk
Message-ID: <CAKxU2N9Rdw1vWtfxEzaiFgyzWZufWxKNQvWmW=QeCtGFa=813w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] clk: add a driver for the ath79 PLL controller
To: Brian Masney <masneyb@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Alban Bedel <albeu@free.fr>, Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:25=E2=80=AFPM Brian Masney <masneyb@kernel.org> wr=
ote:
>
> Hi Rosen,
>
> On Mon, Nov 09, 2026 at 05:36:40PM -0800, Rosen Penev wrote:
> > The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
> > arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
> > clock before the driver core is up. This series replaces it with a new
> > driver in drivers/clk.
> >
> > Only the reference and CPU clocks are registered early, with
> > CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
> > plat_time_init(). A platform driver bound to the same node registers th=
e
> > DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provide=
r
> > returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.
> >
> > Patches 1 and 2 move the two remaining non-clock duties out of the arch
> > clock code, so that it only uses its own registers and the clk API: the
> > QCA956x timer interrupt workaround, and the reference clock that is
> > read from the bootstrap pins when the device tree has no rate. Patches =
3
> > and 4 add the UART1 and PCIe PLL clock IDs. Patch 5 adds the new driver=
,
> > and patch 6 removes the old code.
> >
> > Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
> > DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
> > of the old code. The serial console, both GMACs, the PCIe PLL with a
> > QCA9880 behind it, and the WMAC all work, and no devices are left
> > deferred. The other SoCs are not tested on hardware. For each SoC the
> > rate calculation was compiled in userspace together with the old code
> > and fed 2 million random register sets. The results are identical,
> > except where the old code overflowed 32 bits with register values that
> > no real setup uses.
> >
> > Changes in v2:
> > - Post the new driver as one patch, instead of moving
> >   arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
> >   patches (review feedback).
> > - Register only the reference and CPU clocks with CLK_OF_DECLARE, and
> >   the others from a platform driver (review feedback).
> > - Describe the SoCs with match data, and read the CPU, DDR and AHB
> >   selection of AR934x and later with one function.
> > - Keep mapping the AR934x SRIF block from its fixed address. It lies
> >   inside the wireless MAC registers, which ath9k claims, so it can't be
> >   a reg entry of the PLL node.
> > - Drop the clkdev registrations, which have no users.
> >
> > Claude Code (Claude Opus 5.5) was used while preparing this series. It
> > wrote most of the new driver from the old one, together with the
> > userspace test of the rate calculation. I reviewed and tested every
> > change and take responsibility for it.
>
> 40 minutes elapsed from when I asked for changes to when a fully formed
> new driver was posted with major changes. Your cover letter says this
> v2 was tested on real hardware, however I am honestly a bit skeptical
> given the short time frame. On top of that, that's not enough time to
> also go through what all Claude did for you. Please slow down!!
This was tested with a linux-next kernel on an Archer C7 v2 hooked up
through serial and two ethernet cables (LAN and WAN). There's no
difference that I can see between the old and new driver.

That being said, I only have two pieces of hardware on which testing
can be done. Both are rather new relatively speaking. Older version of
this series is currently live on OpenWrt with seemingly no ill
consequences.
>
> I'm going to pass on reviewing this version. I want you to take some
> time to test this on real hardware, and understand the code. If after
> that you truly have no additional changes, then I'll reconsider
> reviewing this version.
Sashiko had two complaints. I'll fix those in v3.
>
> Also, if you want to help, then consider helping with reviews on patches
> from other people, in particular with the large series for the new SoC
> vendors. It's a lot of work reviewing the flood of patches from
> everyone. You can see the backlog for the clk core on the kernel.org
> patchwork server.
I agree. It's quite unfortunate and have no solution to it.
>
> Brian
