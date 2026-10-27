Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095358;
	b=NvDcgpofGqrS8zTMmJcEku4G5b7lG+/Bua3CczB7EaUSbYLfDBHgawPn8PemRxMQhhqj
	 qMi+qCim4w3YdEpUZ2nJyZeCSykXp9TbVwBEkpXVrb9toJcSuOwIK9K2svYbnxzJc7P5M
	 3BLz1xSOYSCoLvQqnPbij/NMA49xzegwSBi3mJHxBptQHtLgu5m5wN8yTb75NhlFKT16r
	 KB4wAXyTy7LNngHPYoTcrjOiIbpPpMTVxew5zdgn/fv1dhZRV01Wsb+DMApQo2nwlcwG2
	 FYO8iqTwLRhQkRiv3I7tx74z1ubSWEdGV5eyhoYBBgt3OnzcgQo/9BUs6rUvAEh/Biw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095358;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VbkC5PiXkuQEdYLYK/YUR9pdO4ULkJikWXO9Pu6awtg=;
	b=gA7H7okcUPUpH+e/oN1WFf/JrdDM7CU/YXtUeBMfIafb3+F/TPY/Sj+kgus1OHXhz8RQ
	 f3Nsw+vFz5g5bX9VLBoRjAt5W4+3RytcqRRSR+QViITSSWY4JicXGfUMegVurchSVBC4q
	 oE6OcewKv6ApzNTzgq36jC2DvpYcbVnoWGQXX/B4r1rEgvfas21m1VcOTWHDiVLnHCC+5
	 3QKqJWBCvLvlgkKIEGmNPWkAn0k/wl8MX3rQogIaQHJp3gjOILhlvq3SzGomMHz/uDyx4
	 OTEon1ZsxU7ZrTApOuRhiBF566P7gm//Q2uDYiycPcNnrE2zauk+HuyaCXa8dQ5MXkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iD962t4O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DBA606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iD962t4O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3577A1F031E2
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793095358;
	bh=VbkC5PiXkuQEdYLYK/YUR9pdO4ULkJikWXO9Pu6awtg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=iD962t4OeYl8fq9bTKX9Iflx2I8f4Vh717mX7u9d7sgpo3vSQSuZKwQe07yLRktiO
	 gFdNC4bR0scWTeYeG9TlkR7+3xN4DJoKt17dRAPIvmpfuk9X3NLIT+RijO1qwXbOh1
	 mR5OHKL7wb/iz9+5aMbhW+2FAfECvIlTyr5QtUWw5O926DvgT+4ibSkwaFOcbxHQkP
	 W5Io98xLEQYQN5altOp6mwTly7u+9RMwt5X1lVQLP5ehGoFuIWthAYn+3X7P52B4qp
	 /mgz5VjRAGHHSfDNtJam+ZWFb7e1U5bYIQaVa8VphujDC4wpURh4MQSpqcHAzm6Non
	 0VXVfNNsi8ZsQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab27e45e7cso29712261fa.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:02:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwIPG9x7CoSmnDl67QqjYwOgGgue8oOYE9SVwMgAUrMEchJ4pw4Aa7ZhqPfeJOqCNhsOIGVxaI+i4kH@vger.kernel.org
X-Gm-Message-State: AFq9FYLdaXcdRwARjJm/S8jgM6VHTgJTiBSYkSGylasU8UcXpywkIVw1
	nTsCQ9EZUD6QZ/wCkkWiQs+4jHbi9pngCAIbX3mh7G6ltt5oc6EMtHmp/qjalxokvx8AkSF5ZVQ
	EbM9woIVfzX6RHZ2w8uRtIZ1FtIIek+s=
X-Received: by 2002:a2e:a99d:0:b0:3ab:48e6:6785 with SMTP id
 38308e7fff4ca-3ac6fde8009mr25044611fa.27.1793095356530; Tue, 27 Oct 2026
 03:02:36 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
 <20261027-nifty-reliable-octopus-6cbac5@quoll> <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
 <3287a7db-fbab-4b23-9ee0-d40c52fe855a@kernel.org>
In-Reply-To: <3287a7db-fbab-4b23-9ee0-d40c52fe855a@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 27 Oct 2026 18:02:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Qr-XCRdgi+RNS2XkKUn=F8zW+8WUKaauM2PjzL2XgWg@mail.gmail.com>
X-Gm-Features: AclHuK-r-0qVcGxijtfK3XLHMgbsvhgpkiCG_8sJWoMVAePUb1PQB2bHv8-O4VU
Message-ID: <CAGb2v64Qr-XCRdgi+RNS2XkKUn=F8zW+8WUKaauM2PjzL2XgWg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2026 10:39, James Hilliard wrote:
> > On Tue, Oct 27, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Sat, Oct 24, 2026 at 02:22:24PM -0600, James Hilliard wrote:
> >>> The H616 UART has 256-byte transmit and receive FIFOs, but its Design=
Ware
> >>> component parameter register does not report the FIFO depth. Its opti=
onal
> >>> register layout also differs from the generic DesignWare integration.
> >>>
> >>> Add a specific compatible for the integration and allow the standard
> >>> fifo-size property to describe the capacity. Require the documented
> >>> 256-byte size for H616, retaining snps,dw-apb-uart as a fallback.
> >>>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>>  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++=
++++++++++
> >>>  1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uar=
t.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> >>> index e2ca126d58ba..0f8fd0485879 100644
> >>> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> >>> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> >>> @@ -13,6 +13,18 @@ allOf:
> >>>    - $ref: serial.yaml#
> >>>    - $ref: rs485.yaml#
> >>>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: allwinner,sun50i-h616-uart
> >>> +    then:
> >>> +      properties:
> >>> +        fifo-size:
> >>> +          const: 256
> >>> +      required:
> >>> +        - fifo-size
> >>
> >> Why do you require fifo-size if is const? It is implied by the
> >> compatible.
> >
> > H616 has a fixed depth, but other sunxi integrations have different
> > depths between UART instances. For example, D1 has 64-byte FIFOs on
> > UART0 and 256-byte FIFOs on UART1=E2=80=935.
> >
> > Should I keep this explicit for consistency for all sunxi uarts?
>
> I am confused, there are no other instances here.

I think the point is that it is going to be needed in the future when
we add the compatibles for the SoCs that do have UARTs with different
FIFO sizes.
