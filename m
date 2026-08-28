Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760C4374190
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933267; cv=pass; b=g6bcvheZyMZf9UdiUgqWM5PtF5+SwKnkHPOBmGB0yGaodoB10fzmVYxKTeIz4oy7h7f57HPQ1P8YbfMpl6cyYckD+QaMJxzKvCfIZ2pEY8bUIazg+0IXBTjudhKpytj5q3kUUQYK8RzKl5MGf9w6yxjGMKlFBUuRnhZ6MbpzJ5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933267; c=relaxed/simple;
	bh=2x+UF8n18sT4+9jyjBtfMLA3LNRKOdoX1PP1AnaWW3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLNCMXw7qxn2BWmk2GnCq9og4GGLDP0kD+cv1rZygWV9mfsM1yIqov7wU9R1Qi5xRfaT5+AqDRuXYed2pJU+TYWBgH4lQWA1JGwYLDpM8/JP8HeGr3+jf4Qpm0cw6TeQIbGZLd9EIpfmdVkXstm7MEzf+nudlihwT5Wtktl798c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so479450866b.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 09:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787933265; cv=none;
        d=google.com; s=arc-20260327;
        b=LU6vVWiaPjsk9yHi8Y8vMlZXRc4pgb1niopB4GHH4j54P/Uzdkut4cMISyFT8upa6H
         zAYa8mp5oAxyPspZ1d6w3z4AYGaUGX/b1JKe9pJvXg1xZKY3EdUp6yhcbxa7rs/iu093
         itIsl1+0Vt0UGTQ7/VECqd7ncUsS0omd4r4ivdu7LI77uHuNvqc2ABSAcHaHJOhjVFzA
         x+zmAaEIN34rNczmyBe32JRnUkGg6GRGLjgArD055g5qdNhTgGuOe9E0lWazbN5Nz1E1
         GMl9ENWuZup7+oUFWf5WQUm352aFWHpznn8d3GoDkGvdK82pE40vvg/60ogU6wi53uU1
         wxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=/sRHrsFM0ReOg77NeIRd8xGTZ74lCBqKLjN6+GHojJo=;
        fh=ajvM1u/9P/dDzhXdqj3mBISc33WkhRz9XItmTae9/Zw=;
        b=fe3axLZs5Qs2D+1320jG8BnRCy5X4Tv/+U4iRbUMJjqcjdSyPhNXd+iAzJ6D1ea8JE
         zy9/kf9nnJWqXt6fiX3xcttVVqbo8qXaXrLmgmPfHAu+O328MGRyEfW4e6vqwuNN4eaU
         ehzOIU91u8t84eWAEGKEHEbIDuGCq0LWa1YzQwBZ5pHoDIypEACTFCS3wVpkUVUjJP+l
         T57arqnA1Vf1vEotHt9YdLD/2KHMEsqV0AxuZOMcXcYAy1spLQvXOuI3kUskwxqdXFGP
         YhDJxifGLM/Vq82Jdfej8XjM7OT0n8LowJyQC0eXCWH9SWmTN4bgCKHbZ15MWmS3wa1u
         0GjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933265; x=1788538065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sRHrsFM0ReOg77NeIRd8xGTZ74lCBqKLjN6+GHojJo=;
        b=dR84SbHDXvweG5xuRhw5etTTH7SoFnjmeY3TgN3aH0Rh4rGw63mzDNAMicss7szFfJ
         Z5H0zP76WJ/ZT0hASAHRJA8OY9EKopktozfm1Gi1b5XF9Rn/fx2dpb0ghIO1b2gNP42w
         E/njAomGPXai3zgXZGo+cpIyoR3fm8uBK3nG7p9SpIIVrJtGa9CTFEXPy9US4d/YY1d4
         CsFMEJK4gvAurXfevwy9AZuurIkHonYiylNyBYpSV4qViszi/pMPbeciDCPF6mi22xt8
         ow2KijMwmY6y0StiowNXcnxoBLh0iHDF/0ZJqrroaJpdWoDzG53YIkRrapvr38lvKLno
         0Oqg==
X-Forwarded-Encrypted: i=1; AHgh+RqEp2lJ/9vNr6wvUEdwZz5nqbBcRhSboXYiezaPyCeXQRwLtK7e3QoAxK6yaKtNuBPQYHq5hK49cXS4@vger.kernel.org
X-Gm-Message-State: AFuF++mCUNLp8P76sB3p8duOLeldSrGvIPboKb3KJgf2uBUCVfRGhvsQ
	v6JFS4Dtansis8/dbRO6j9LbpJ1CzXVHs8/MZxz0/wr6xCH913yeipgMMNFGVJCkAO3db+WWbXg
	YvIJMO6qwHdUfI132/x0C+TJh1WnJLL810SPIVsK6
X-Gm-Gg: AR+sD13UO9oFUwhwGDX4VgT95hHgyM8/6BpFqDQj3AKCTRa5IQ4C3624pttVC/V2unE
	9kH1W+YBklxJBR3cCFAZbuQw4kNwn78mHZzx8c/MOSVRkRfhYkPocftK+JObqFeycqdcKvNfrau
	2aJyCOjJ5jLyPuoxrgYPOwJCZq0XKMxgv8Oym5Ut7uDRBCCdvVGty4rzCMjoY4btMrQPaPOzUkF
	d00CRGMTe6saua5AEKQYHyB61f35prdI7p9ezjRqVKd0+Hr5iBEDQH+Po4H7WxRpDShrSzw5Ld/
	9071JZH9uvkJmDiwDwmSyjMtZnz1Keu/2PnTeP11eWEoqnDcIz0IvGZf3yc860WmwUF8/ltwWh3
	qD94=
X-Received: by 2002:a17:907:3d44:b0:c25:5faf:b216 with SMTP id
 a640c23a62f3a-c256dbc488dmr75904866b.4.1787933264392; Fri, 28 Aug 2026
 09:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
 <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com>
 <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org> <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
 <14fd70cb-d07a-456f-9800-d3ece4039529@kernel.org>
In-Reply-To: <14fd70cb-d07a-456f-9800-d3ece4039529@kernel.org>
From: Matt Eaton <linux@divinehawk.com>
Date: Fri, 28 Aug 2026 18:07:32 +0200
X-Gm-Features: AcwNN1X_eUImfA2GusjfdVKVq99gGElh74I2ER8bxKyHTDCnL8d6gf7e81RmkvY
Message-ID: <CABUBpLfH+bi3Q5hD+WWG0QnyCfmQMRt9TkUN+zC1pvH44ez90w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:53=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/08/2026 15:18, Matt Eaton wrote:
> > On Fri, Aug 28, 2026 at 2:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 28/08/2026 14:37, Matt Eaton via B4 Relay wrote:
> >>> From: Matt Eaton <linux@divinehawk.com>
> >>>
> >>> Document the xhci-no-soft-retry-quirk property, added in the
> >>> following patch.
> >>>
> >>> snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
> >>> peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
> >>> accepts it there.
> >>
> >> I do not understand how this sentence is relevant. Please describe the
> >> hardware needing this.
> >
> > I came across this while porting the UniFi Travel Router (IPQ4018),
> > the stock Qualcomm kernel is 4.4.60 which predates the soft retry
> > code. The command ring hangs if you disconnect the device while it's
> > transmitting. Reproducible consistently when using USB to tether to a
> > phone.
> >
> >>>
> >>> Signed-off-by: Matt Eaton <linux@divinehawk.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Do=
cumentation/devicetree/bindings/usb/usb-xhci.yaml
> >>> index 4238ae896ef6..5d67a41658f7 100644
> >>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> >>> @@ -25,6 +25,10 @@ properties:
> >>>      description: Set if the controller has broken port disable mecha=
nism
> >>>      type: boolean
> >>>
> >>> +  xhci-no-soft-retry-quirk:
> >>> +    description: Set if the controller cannot perform xHCI Soft Retr=
y correctly
> >>
> >> Why isn't this implied by compatible? Looks like controller's property=
.
> >
> > The xhci device is created by dwc3 core as a child device, and so
> > xhci_plat_probe() is used. I think a DT property is the right
> > approach, similar to quirk-broken-port-ped, but to set
> > XHCI_NO_SOFT_RETRY.
>
> Linux driver behavior should not matter here. DT property for telling
> Linux what to do is not the right approach. As I said, it's implied by
> compatible unless you bring hardware reasons why it is not. Driver
> reasons don't matter.

Will rework without DT property. Appreciate the feedback!

Best,
Matt
