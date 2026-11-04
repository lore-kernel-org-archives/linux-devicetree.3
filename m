Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779821;
	b=xu2+AFfBPH+HPZ6FIZsUnc1YQCqUEjxr0IX6VUjxGfrTTSn42vXEpDN2fDGbA64wVySv
	 L7WYz/8a+DN+/BfRcI7fDhi9MsqlvIS5VX3Vsp1JSofxPjTAY8RcIe9juwYaRn4l8mjkl
	 RMYuBAOgPSGbsRgOAlMWX1WtshXK88v3k4tpOhIJccaC2Aj5qLoYGrx/u6baXL/IUzBYQ
	 SdIhLhqmNqLxBnGV4fZh/DuRXwH9fHiKTuZFEZPaZZVIzAud6Kx5GzQlkzrFV8tdilnvh
	 AgruqfRPOZ1armI6ZwJ2wnDYg9PHJmPtjDcXKonI8nezN2Z9Dy63OtIR/rUK9sSv8rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779821;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IOB/DMG8E0H1LG/g/S6WJ7zKwN49Fb8gn4W1dEispPc=;
	b=mtU7r2c5nBhFbdZHhhXnpe8EWT4IOQj8fKTCXbbN7iqSsk9riwcmdqviAmwMGZ+IY2mw
	 +5TLtH8JQK+TBmwrHAMb+B7HsRpzWnE0IdIJH94RfRvPUxBUI1w5QJ6+4uSoUH0jpPcjh
	 dBHeoefR2SS1qFepEZoGe7aeLUunPzjg3YYHk39ObPXy30+2kjFcmn1eWUE0M6zYCvIBF
	 B5CMW0FGoWoJ5bicW84j2+vL49tB2L2/0+oDI0S7RuIX3K/4RT7HgF3Sy5sjWH71rTf8/
	 4LiOAvZf4mJfbBUim8WOymyU2ZC5eCtZeeR9mqkjhLLE55xiZ4A9ImSk4YYev7MYXEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0B606A330
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC0B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eafb65e163so281918e0c.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779819; x=1794384619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOB/DMG8E0H1LG/g/S6WJ7zKwN49Fb8gn4W1dEispPc=;
        b=PPhL1Z5an0FkGyr5fshGuOrTzKNOSJqNDjSbZmX50Y285FfKweBKT7t7NixIxzfgoP
         9wAy4avAmMzBcTebJwKVvFVzJckl2dt15vcqEE2GLYSEde6tbgb9ZalGotuWu2Te3UQg
         99aAUMIdUkTKFOSYuRsEcEy9u15xSSDI7xaMEezVQ6DDybDDj9mjtHglZY15VCwVqbJb
         6r/g718mdYuqUHTLsFwqgjglrSnXyfCrTVr/e6C7Jjd0f0G0FPMlb66LwK7aKSP0eUXV
         IoOl3TCRTad8P5fXCwwU/KELLYT96+AsY4D0AAJu3insQmXfrEDnq7HNuNXZSvCkDyTR
         jeUw==
X-Forwarded-Encrypted: i=1; AKwUvByf+bADSAzdcqoBZM2yFSE/5Sf732yq+HE9zjpJ2ddy6QLOQgzl+aYnX9QKIGsqaBQ2vmI3TtN2Cu6C@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vv5dciuPUKc1YNVO/njPHV4R5EFuD6GhAu4v5jipnSCiYFxdl
	BqZCDwL4o/jVop3vcc+STQBdE+cDNlfw7aVPd7oSqzS8NfGXEw31mHnRL4rS5ODsf2M=
X-Gm-Gg: AYBFou0F+cUYnMjuZXHIBDZdfJQiRmmunOciYxBROJKDzh2bifwJaePGLnMiB89IVe/
	9PahJbst+fs8p8sv8ueWmTNKRStlGrQ/hOk77RerA3GrpbtrhipBEn9fG9mFDtmFHbEiqrsP8ae
	Q4UU2/aehtcooysqK0NiP/JD0eoseUtOr5gzIqjraKXlxrbZmkalE9FbXyFPyU5EML9fsOMK7tX
	4XGXVmLNybVo6uzu6Zt5g8leXhIC5JXfRaimmQW992Hu6/jHtMxubLbgTfxfqtGOHABcXei7lsO
	wIncnvSxNe0132Y9NfrERXke6xqfPqFqjFWJF4GJEij8kyz/QXZbbeUNMa6/hph3JVPHOrUA73/
	EvIAyDFGlpwt1sEFhVc8lWH67hCw2RKed0W4QNRkocntUQauHWMxRwpt7VbeSjQ/9XCPV/hNGTh
	iOHbJGaQpBFHALr1JQr37OBN+H6l7yeivdhhu2vXqIVBVCfOjryLIG8rEPh4gpYhthBF8OfVdOD
	j0BmNvDZurPs60CLVlRXWj/QXLKhdGKs+wbkvVsY15dW6kDqSa3tslxWLU85u+oSAWrrMPJja4h
	6y9m4Mny2UZ75n8RjTHmB8b4X5EFFtzhH/wawCjgEvkpRi+rcnXFO/edhJg1Fe9EKH1XO/9OBW9
	7H6wj35XyMcfWeOC2JV4wcCUW1UixQKCXEy+6TnFIzh6p
X-Received: by 2002:a05:6122:398b:b0:5ea:e052:2ef0 with SMTP id 71dfb90a1353d-5ec68976f9emr6996772e0c.9.1793779819446;
        Wed, 04 Nov 2026 00:10:19 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca889381asm1155756e0c.0.2026.11.04.00.10.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:10:18 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so288770e0c.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx4JUFiEKt9Ei+X2MqLqAU6utvBBACGiRdsBml0pwCpuUfEk3s76Nl7ZDdJEJq7RxmnHOXickSf3Qep@vger.kernel.org
X-Received: by 2002:a05:693c:42d3:b0:369:faa2:1fb2 with SMTP id
 5a478bee46e88-36a4236a650mr23219527eec.8.1793779365508; Wed, 04 Nov 2026
 00:02:45 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev> <963ddb89-fada-4340-b767-285ce9362d1e@bootlin.com>
In-Reply-To: <963ddb89-fada-4340-b767-285ce9362d1e@bootlin.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:02:34 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4Y3Zgq7OV00LedV=wty-pqR=4t70XgWYTbdfzCeaH-Cg@mail.gmail.com>
X-Gm-Features: AclHuK8VH8JEq69kYaCOOBuUsCrdovmtS3uWzk_R-GaR7GJ1IVUq8iGvFERmNvs
Message-ID: <CAPY4CJ4Y3Zgq7OV00LedV=wty-pqR=4t70XgWYTbdfzCeaH-Cg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: Add the Siflower SF19A2890 glue
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 11/4/26 08:53, Maxime Chevallier wrote:
>> The MAINTAINERS entry that covers these files comes with the MIPS series
>> "MIPS: Add support for the Siflower SF19A2890"; this series applies on
>> its own. That entry is also why checkpatch's question about updating
>> MAINTAINERS for the new files is left unanswered here.
>
> hmm not sure this is the common practice, usually you update MAINTAINERS
> along with the driver introduction. This should be part of this series.

Makes sense, v2 will add a MAINTAINERS entry for the glue and its
binding.

>> - the MAC address from the factory partition, and ethtool reporting the
>>   link with no PCS workaround.
>
> no PCS workaround ? what's that about ?

The OpenWrt driver this is based on set STMMAC_FLAG_HAS_INTEGRATED_PCS,
because the core reports a PCS whose link status doesn't work in RGMII
mode. stmmac now only uses the integrated PCS for SGMII and the flag is
gone, so the glue needs nothing for it. That line was only meant to say
the link is reported correctly without it; I'll word it better in v2.

On Wed, Nov 4, 2026 at 2:59=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi Joseph,
>
> On 11/4/26 08:22, Joseph Telaak via B4 Relay wrote:
> > The Siflower SF19A2890, a MIPS SoC for home routers, has a DesignWare
> > GMAC 3.73a. Its interface type and RGMII clock delays are set in a
> > small configuration block next to its clock and reset manager. This
> > series adds a binding and the glue.
> >
> > The glue is based on Chuanhong Guo's driver, which read the RGMII delay=
s
> > from a factory flash cell in the delay line's own units and always
> > applied them. Here the delays come from rx-internal-delay-ps and
> > tx-internal-delay-ps and are applied only when those are present. The
> > interface type is set through set_phy_intf_sel.
> >
> > The delay line's step is not documented, so I measured it: sweeping
> > each delay register over 0-255 with the link at 1000 Mb/s, the working
> > windows repeat every 145 steps (TX) and 144.5 steps (RX), which is one
> > 8 ns period of the 125 MHz RGMII clock. So a step is about 55 ps. The
> > TX eye is about 3.1 ns wide and the RX eye about 1.75 ns; the delays th=
e
> > bootloader programs, 17 and 10 steps (935 and 550 ps), sit inside both.
> >
> > On the GL.iNet GL-SFT1200 the GMAC is the CPU port of a MaxLinear GSW15=
0
> > switch over RGMII with no delays on the board; the GMAC adds both.
> >
> > The MAINTAINERS entry that covers these files comes with the MIPS serie=
s
> > "MIPS: Add support for the Siflower SF19A2890"; this series applies on
> > its own. That entry is also why checkpatch's question about updating
> > MAINTAINERS for the new files is left unanswered here.
>
> hmm not sure this is the common practice, usually you update MAINTAINERS
> along with the driver introduction. This should be part of this series.
>
> >
> > Tested on a GL-SFT1200 with the GSW150 driver:
> > - each of WAN, LAN 1 and LAN 2 links at 1000 Mb/s full duplex and
> >   passes iperf3 both ways (160-205 Mb/s out, 262-273 Mb/s in, well
> >   under line rate; I have not looked into where the limit is);
> > - 10 GB each way through LAN 1, after which every CRC, alignment,
> >   error, drop, overflow and underflow counter on eth0 and lan1 is 0;
> > - 50 link down/up cycles, after which the link and traffic recover;
> > - the MAC address from the factory partition, and ethtool reporting the
> >   link with no PCS workaround.
>
> no PCS workaround ? what's that about ?
>
> Besides that, nice and simple glue, thanks ! :)
>
> Maxime
>
> >
> > ---
> > Joseph Telaak (2):
> >       dt-bindings: net: Add Siflower SF19A2890 GMAC
> >       net: stmmac: Add Siflower SF19A2890 glue
> >
> >  .../bindings/net/siflower,sf19a2890-gmac.yaml      | 110 +++++++++++++=
+
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
> >  .../net/ethernet/stmicro/stmmac/dwmac-sf19a2890.c  | 158 +++++++++++++=
++++++++
> >  5 files changed, 281 insertions(+)
> > ---
> > base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
> > change-id: 20261102-sf19a2890-gmac-4fb4808f869c
> >
> > Best regards,
> > --
> > Joseph Telaak <joseph@telaak.dev>
>
>
