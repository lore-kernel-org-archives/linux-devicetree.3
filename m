Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793345322;
	b=X7k94Ll99B/GujwQkfge3soeMGMdUnGwAieskGYhQ1fH5SngkgZ/grBYB5zTBTkdpDZc
	 IsW3lq5urr39BAbC+RUSYz0fbcuR1cKxlbnHSEQK6axuA18ohnqyNoQUJ+UoeAl+zl/D7
	 YlMXRnN2UOxBH2GtanCEYG+jreeCAnnGJPr+iE9LGemgrMC6gtYvef8XA6SQTZDmvaBV6
	 kQ8MPIzcrJCvS0tcf5mvdl+h7TLo8bG9vFcUJtHnIkbzF6vCVAA32r0/NbmehKkY/xHwF
	 NGsVcvs67n+4lN1rPRl8Ff78Tk1Pcs5SEBEfMPCfm2bV+UCk4yIKxhgZundmt3o/8Yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
	b=z+cXXdK7tBhzdMplxndfhc0SvhOjIh0P/OClXG2OoNeQZ+9tmmV0etLN5dGKXF0jTvLk
	 jlcSnMNwMHnyGXWO76TOKoGdv3a9EKXLnDXxPl0zjSXs01+U2uASwal1SjhXQyicUnOfL
	 RQzd7YgFdjz46T7elSWH43BNZAX++a+ovduyOjNpPFDbNVikMnSSDvbfvhgotuLQVCv5x
	 5Nn5147S2CNYucXpyOZEDXK+ugoxAwqUDXQ7ynF/Mt+a8S5vZ8zkdH3qjaKZ++grIHjK0
	 Vn+jjPD5c57gkZcoANYdd9B4APNu9yFsPywqGVVDOfIuubf+aiV9iwqqW/85h2++GNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="IKy+T/qh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F9606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 210F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IKy+T/qh
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677bc4704cbso328028d50.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 00:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793345320; cv=none;
        d=google.com; s=arc-20260327;
        b=riorS5WrZX3D/VEPEIH4j2OC3QRO5rrxvSt0IBbX3S6XiRsXD2ohjHLi3WbbPjgoMA
         BgNfdZ6NONZ/QUvYldGWVnmd+AQRRMpkOI+0R6uwNscSSObqViq91CiV1tiSJJU2qaZw
         UMog3USdpb5wfVNCXZnVbcfiUCL5hD2SI0UfQ4e/GcvjdhaIrqJBeLH3V7HEUJSxzlyv
         J5rVe4yVSZQuPVd1UmoWSETRNut0XbUy86FrDL1nGLtB7FRdytJQmlbQazW5Pe9xAWcA
         cK8ANAJqcVGtVfqQS6ZHW0jCqwRtc+5ZXdUCvDVc+ErrWz0vS/srjl/aQi4SXdTG3Z8k
         zSeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        fh=8k6Lt6qzp6dWdJ4NCwlQzbkoi368en2LmpYUFmb9b64=;
        b=fW6W58buhyd1hbr4g2f76u2HTNMaqXRaZU9Vt99L8/N5Y4R+SLIhHoO0FT5eoIxzmZ
         FWOFx57EpIY0OwwaZ0dhPnHAORqvXFLZZgUvEj0FdLlWCKnpPiZQyYgxD3L0vGuGE587
         ZN229uonb/bRXlDG6Mf77P2NvWnasG9iJLN3kpRkN+T9ghHS66fQiuM3BJ8uAQOcTKbJ
         nEidt5ikqWdIzdJKT2ABovE+c10g+KJ3thkRS6Dy4jN6rXllpOrX1MQ1rpiqPshv7Hw8
         1wdfqhcZfL+8KB1X4eCMItfVyT9qX4IaVVg6UHjLGYhEz7rYgSW9O9izCNA3ViGWvw2W
         CQsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793345320; x=1793950120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=IKy+T/qhhIrUOzchV2V4rsBprme/Hu+3Hl6zCa01nFTCsOY9pKmewlMrEn4BQLOwW9
         feJJmNQO23DQ3rGjEzuWcIeZR34xo5NfY4KNRYFVsQwIp9ColIO/GW+PGca/8KtFU+/f
         l1bdJasJc0Tz9mTRQCSooUk0FYHVl951kJDfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345320; x=1793950120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=hJPAgD4uS5qs/oEQOiucnH/YycMYVvdMEDD5PuwxKAZPkr5G7LhZ+h/xg0ntwSkzWU
         ElQjfU3VRN0mwgd46WGoXmy26N7EVoNzXq1XOT81GZMZXwRzmTLHXPG0W18CJbutMBCh
         wgoLxsKbu9mlPWoi2MI4BPoRdIdWG3mZmrf54XwcAZ0bndRb7GOho5mnQmmfOF39jbNd
         y4PLUm+UW1mK+/2bN+NAwFFabFNiPvlQp9+3CiE1efjKpvZCYGJ/2rU7MwvbEt2Bpq40
         VDj9GGkdo2XPuj2uVbONU88stu6ThoV6Dq307X5pY5A4Yk3lCpuMB9p9ReYIwG6CScbV
         OOgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqdCusqSE71goScprNtLXHjPl5yJsHBVloBGzHc52Y5XMmjXYSOBJNaBbJfPlpxE5orAHYUInIP/9n@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4akOr8RWVESQpRmCGkckxX97S12R31+b9C85OmAtWKSk8VXdT
	NH0nkMeL7ZtSS3oWJuFP8PghWRrTRpf+qGYt+5mjZJkBcDJVHJLGzY+VlJvBvipGnYWSA4D2mkX
	Jf+azTgrXvBVB9GdWMF8Wh/HpGrqP4W6MEBFr5qhJ
X-Gm-Gg: AYBFou3/nOzuaRykjqlhVDBlfR4QNkxfJc4Ww2upU0ZxJlmrH0MHXq5EOZiPyrk20aK
	vogeKmPxwPYCy5ou2UiHeUFM1nLigr01UNA/OWA8l3wr7oaSsMxaf4KJ8WwxqVhNppWesaAs4JM
	0qEgb+puWm1j2kT7zZ+OUvq2iYbIbJCdPCPAN9Vv3HYtOQPrK3QJtKfQZM+tbX1iCL7KN8nDTLE
	9MzR2hb/siaQ9/+zLVE/hojXQVjUSjk2ZPXBVoAenrtrBr3ZJd9HOzQfA2GoLfnqLdugMuX2Sn/
	BIJPXNTXD9mUStywVlkvA+9/V5hYzKt5FhOusWszQFKo8DaUcYxmI0orw20gXKCmqwOpXOOYKvt
	mSN67zcZnfPtCu6KQynKY3j9Rb5nwQLYCanZpfYpqia0XKPqxF6Ib1P3jkO+3Yv+pPCo=
X-Received: by 2002:a53:ac8a:0:b0:679:9afd:c0c7 with SMTP id
 956f58d0204a3-67ba508d24fmr864212d50.126.1793345320085; Fri, 30 Oct 2026
 00:28:40 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org> <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
 <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
In-Reply-To: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 15:28:28 +0800
X-Gm-Features: AclHuK87PpF6mvOIXqHCbuY1WKimiNRH2tQGnceMsfo-UR5TI782gxdvYJm286Q
Message-ID: <CAGXv+5GFogx_kS=N1t8-SFTp+HyxLtoHzhnL6t8Zn0GBiqMoKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:44=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> > (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI=
.)
> >
> > On Thu, Oct 15, 2026 at 4:44=E2=80=AFPM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 10/14/26 18:36, Konrad Dybcio wrote:
> >>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
> >>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
> >>>>> On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
> >>>>> <neil.armstrong@linaro.org> wrote:
>
> [...]
>
>
> >> How about the USB4, does it use the USB3.0 port ?
> >
> > I'm not familiar with USB4. A quick search says that it can tunnel
> > USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> >
> > So I'm thinking the USB4 controller would be more like a nexus node
> > or multiplexing node, or perhaps like a USB C connector. It has input
> > ports for all the protocols it can tunnel, connected to their respectiv=
e
> > controllers (XHCI, DP, PCIe). The binding probably would be very messy
> > if one controller supported multiple outgoing ports, as each downstream
> > port has a 3-to-1 relationship with its respective upstream protocol
> > interfaces.
>
> Yeah that is more or less it.
>
> There needs to be a connection between the USB4 router and the native
> (USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
> where the tunneled packets end up at to create a PM devlink between it
> and the USB4 router.
>
> ACPI does that by adding a `usb4-host-interface =3D &reference_to_router`
> property, for DT that's still undecided:
>
> https://github.com/devicetree-org/dt-schema/pull/196
>
> As far as the Qualcomm implementation goes, I was hoping we could
> go forward with base1 numbering as the DWC3 is an XHCI controller:
>
> https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-=
0-63e296346d57@oss.qualcomm.com/

I don't have DWC3 manuals, but assuming its internal numbering follows
that of XHCI, you can't just use "udev->portnum - 1" in patch 4. That
is the logical port number on the root hub.

Instead you need

    raw_port =3D usb_hcd_find_raw_port_number(bus_to_hcd(hub->bus), port1);

to get the 1-based port number for XHCI.


ChenYu
