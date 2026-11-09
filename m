Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794192871;
	b=3c+KcJYJ1G9xOXxUYpJTFy9w3qz1htIIAT0iYXF7b9RAyHky8xh9qnqhgLpIkHxMKXpI
	 +Z/lnsmOjNKy4PwNeH9No+hjnUjQnx3ZcxvJgZnGGgNWYRwJc8H63ET3Ng7c8Ar6VZlSQ
	 ixFierOH5y/HhdZsNq3WXhTru2Ph9RyNYTwT/BvVtVNASThohEUGR2RYXBpQiVPNNEUgq
	 2UChmfZ4ZSK22Aylr22EQwyzJcj03r2doG2TkABc8WijL5CZgSnYKG55jCLDSE6vCQAAr
	 gKuS14q9AVLMRQC6gfztDd7O0MajuXytN93rQ/dE82D3itr1hKDjHkKq/A618nPbjxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qz3NR7MGSXJNdrY+IV5qaIakyyfe+n06O6AowRbO9CQ=;
	b=gfIFbfvAf+SfsToDpHo97U0KABpZX3zoVDfgKsiZFhZm2zkaXCwQBHiwWk8jXgw/Tzx5
	 3XItSD8iikRYrK/tASeAst5k/2Rv8mDkx17NlUR7ehZxAw7f3uYT0rIddF0JjDninRo09
	 j+Chj9gNsj4qQwQct8wNGYqFiGYk9XVWxTfcf8MyPFqMiqI+Ssrg9uAbhDJVlCGHtujNq
	 zpW+kmG+xhxlHCLpQPbGcX5p6fXYp7vZ/EbHw7qlOXtJkEXXaKxLw78bH0UGasy2QXhBk
	 E6ymZP6PveM/Jty3XqBFjt+iN4IncF2Y1dkMsIknJNl5FqPIxHW78jE9ZLtE/vk2olg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=spacemachines.com;
	spf=pass smtp.mailfrom=spacemachines.com;
	dkim=pass header.d=spacemachines-com.20260707.gappssmtp.com header.i=@spacemachines-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A+XTWgLg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B36606A320
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 02:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B36606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=spacemachines.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spacemachines.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacemachines-com.20260707.gappssmtp.com header.i=@spacemachines-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A+XTWgLg
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3720addb068so607477eec.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 18:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794192869; cv=none;
        d=google.com; s=arc-20260327;
        b=m7Lc0/lhp4X1s5L0i17bUzu+ISZe0mG26MSQSiURAMaguycb1CJsY7pGvKcwJlV3aZ
         UDptJeAnyWp6Q3tLNTwkGFKnJOvxJ5qL6keeBcAbW4qYo9vmucPil057wNNgmYEtkeOJ
         K10O23ijkhc7oTbDbF+gZ9Z5pwcF4kJIRPfw7Z+8CLcOazCco3EiMxEmdDHyWxvUc3on
         cS+7/8AAtkxUMBP4oHzTRpIRKu8Cr3KO58rncX3SSZ9nDeFZnxuvkcjc8WbAUWU5c81K
         6y1DquaLusUbCCZrBRxRh2+cGoI1G+7n34t8J46aw+gKx2spgzNzlzWJ4rArmDGjJ1bi
         n8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qz3NR7MGSXJNdrY+IV5qaIakyyfe+n06O6AowRbO9CQ=;
        fh=OwWm0eSfxvpOaxSsFK85SbAYGK0xuGi+3oAjVTgwPII=;
        b=Q0nuJI8kVgibDy98I32OgTIVtFakmbBPPmyp4RFeNMQtMymuOkZt5W8GYUKo4V/6qi
         o5RooDjkkrRzFQFqtF858pe7a04sNTb7Hz/iMVlo2xyfrU6gFQqHXk7xZ5ZupCl6RLs+
         IgMryuNbCYyVgsH37xPZxguHtGK/bj9dLLNAi6eHgFNCRsNsQ3i/DEZpMkEgLIsH93ZS
         cfgGgujEi2wW3eZiz4tOvCaoWyjxqz2qKm3nqYlGmotRS9Rx7gj4dCF+tb0i52C1ALj+
         UnMFNsIxBBHwGgjuwTlEnqmhsNPIOrhFCyeZ6+GC951NWxJNJ5/N/qq/dH0L1ttBXff0
         xIpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacemachines-com.20260707.gappssmtp.com; s=20260707; t=1794192869; x=1794797669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qz3NR7MGSXJNdrY+IV5qaIakyyfe+n06O6AowRbO9CQ=;
        b=A+XTWgLgnrqW+PCT7TIAIIkFzWhX5Buzzt2ApyCVF0MOnlG8Gi+M4EE5q0NaLoq1Ev
         xPip4ML5lUHUiyZ5x2ApGnQrswnqqbtWfN2F+BglB0yjDc9W9JAFdOKJ/zYrzqQ6ttTg
         X8qJUTdRDoFWV/PWbsOfYGw5P8h78PMyfkEHIr9suaJUzbKVw6eNzHnjgP3qtWwAxR2w
         45q+B2oG8EoKqIsvtsVYgUDP1lNJve7W4l4p+hUagMNxjJbaE6XNu6ujr1KEzzK/fyr5
         UG2R31p4ny/82LbEIp9YTBUJgH/cqrS5+HMPMK8IEhvuspgz01J7cId5LwMTWfx3w+1Z
         OHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192869; x=1794797669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qz3NR7MGSXJNdrY+IV5qaIakyyfe+n06O6AowRbO9CQ=;
        b=tN9Uu+JzeSSuxnixJezSkBKT6p08dafBYecp3sq0jxyfhg5B8h5rxCY0IELQbw08r9
         LexxwgM9GSCcOJ7SB533rSXNLLDHfTodeDsVLhuofaFJmsmTQ6jjbe5hLrZouSPtuUoT
         8TUcwSRH20RkQuMU0rAzzFD+pnc0tNXQbF+OsYQS+O9s3utRD5Z/WcJPvqULU3uRehBl
         37iN8XBABXeEuZ8MX8C9y5rNNIIvWcCp1zNJVQ3TaIfdlBDiH7Q2ovO7t9J3tLR3M78S
         +35Yn9KQ8XbHPivAo6/joRHTU8Jpa0c6aPGeFiL7D4aCsOb+YB9OSfs0QtRaG+NdhrIb
         Id0Q==
X-Forwarded-Encrypted: i=1; AL+hErEoSMB6eQ4g12LtPFMM8tRwy9Q6+q/dKBLWKEwOq0AppAn9xsBJ0pyikbfopVWzWGiV1a6Vcklq5deN@vger.kernel.org
X-Gm-Message-State: APuU4Z/z+b4QOiWxy9fDZ/cqlPLZadh4xYdaN1wbamMiNaaHUvvogIVl
	LsDXlldbRVzCFnjqVJ+Db8i3GEbcOj5f9zyHfjq11OnQqXlRhvTWFx+lWuV6nCbkG9gxHc1/88H
	TPyxDYZOaShsKbk0w1Hy6TDeG+nEcTsHNjxZOFIX/LA==
X-Gm-Gg: AYBFou0wW2mBqcvFXmx8nU75H2jt41UyPB7HocElTczuafZ1pqxmpDM5w9v0ix9m1K0
	7C/qlRMitrHC7+O/Jsq7o6AiRUv3XtLxthtSaRtRNM5ACdm0ffaNAOju1HDP/aKWDdLHMJKERvy
	sEuEBL/g2dtOEgE0h5cQLILoOyxUJu16YR2lta0UBmBZ+e+7GzZzTw8UZoSv5AqF4DJQlz0FWYc
	V7QF0git1IutGI5LxBBUHCOtHqg7GfQbkp5GLDZJ5eJ/+4AQFt9VylfFe8Zssnlrr9/0DnkJZBy
	A2KfVCiSgmdkVyVB4a55N89PnROYO9DgPWlLS5X0jLi7PI05d/DSMFHBlhZySFz5ydUvHDCT/Ve
	5/cPIVdCiGDxc5rltQYr4kugVuiy4QmNrj5KfSA==
X-Received: by 2002:a05:7301:4601:b0:369:f9da:a70f with SMTP id
 5a478bee46e88-372579ada0cmr5004293eec.17.1794192868908; Sun, 08 Nov 2026
 18:54:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-core16550-rs485-v1-0-6d15ebe1e5b9@spacemachines.com>
 <20261103-core16550-rs485-v1-1-6d15ebe1e5b9@spacemachines.com> <20261104-zen-aloha-35da49a7e72c@spud>
In-Reply-To: <20261104-zen-aloha-35da49a7e72c@spud>
From: Kohei Otsuka <kohei@spacemachines.com>
Date: Mon, 9 Nov 2026 13:54:17 +1100
X-Gm-Features: AclHuK-Q4F2OkjltIrYE04Gknko9UUPJ0_lJdkzGPXUFMua3_w-rpVx6FPuUaIQ
Message-ID: <CADMKYUAc3QPCdpH8JL9VHk4d0iETsUL2ao2i4OhoHYoZGoAnnQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: 8250: add Microchip Core16550
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, conor.dooley@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:20=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Tue, Nov 03, 2026 at 11:11:31AM +1100, Kohei Otsuka wrote:
> > Core16550 is a 16550-compatible UART soft IP core for Microchip FPGAs,
> > including the fabric of PolarFire SoC. Its registers follow the 16550A,
> > so ns16550a stays the fallback, but
>
> > it raises no interrupt on TEMT,
> > which the driver has to know about to support RS-485 on it.
>
> Doesn't this exclude using the fallback to ns16550a, since it requires
> specific interrupt handling?
>
Everything a plain ns16550a driver does works on
Core16550 including transmit, receive, FIFOs, modem control and the baud ra=
te
divisor. The only thing that needs the specific compatible string is
software RS-485
(em485), which waits for a TEMT interrupt the core doesn=E2=80=99t raise.
Without the patch, RS-485 direction control is missing, but the UART
otherwise works. If you=E2=80=99d rather
not have the fallback, I can match the compatible in 8250_of directly.


> >
> > Add microchip,core16550 with ns16550a as the fallback.
> >
> > Link: https://github.com/linux4microchip/meta-mchp/issues/5
> > Signed-off-by: Kohei Otsuka <kohei@spacemachines.com>
> > ---
> >  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Docum=
entation/devicetree/bindings/serial/8250.yaml
> > index 50d5c977afa3..33a5929bdaa6 100644
> > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > @@ -137,6 +137,7 @@ properties:
> >                - ti,da830-uart
> >                - loongson,ls2k0500-uart
> >                - loongson,ls2k1500-uart
> > +              - microchip,core16550
>
> This needs a -rtl-vX suffix on the end, as is used for other fabric
> cores - see microchip,corei2c.yaml for an example.
>

v2 will use microchip,core16550-rtl-v3, thanks.

> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> >            - const: ns16550a
> >        - items:
> >            - enum:
> >
> > --
> > 2.53.0
> >



--=20


Kohei Otsuka
Satellite Flight Software Team Lead

  koheio@spacemachines.com   spacemachines.com

 UTS Tech Lab, 36-38 Lord Street, Botany NSW 2019
