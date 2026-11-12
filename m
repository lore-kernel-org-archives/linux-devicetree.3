Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470408;
	b=DB5TheU4eM7N7tKB80QmzDfjZFoLy50sD2MieihQNkeBoHuqsu1fPfQpi98fl/rsxXXf
	 m//xDhTzQYDZxckuF8uqhbaS1Ae+Bl/sEe2ncvCnVJeHVtMyGtAXhSXFmwK3p+LLDbGMT
	 KIeH4o4HLdylccspBTWl9TK1O8RcvL7tvifs7dMCokU4zj0hFRJUXJ4cyczK5GBv3BHtk
	 7K/d/tnQhPn+cZqn9NU5v+/8CDTwHhATzfN5wWy2xa+Ney8m6ny4iMkb0R4pKkqwASXCW
	 EZwnx3kQWNa/6PAPwNsgVczAsPkSAL7yxL4U8MFG/5Gp3Hf9feMxS73TMRUNWgdZ9jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
	b=jMS9jAGzwcarCjpBOb+8JvfRTPed/Ou4ZoRpm2wpOT4OM3CWG2EtFvabeZYHp1ggHyTz
	 khYhAoR22rYyOzYfgcUJcUxE0gax3wR9nqlg7A92OYpSM0MeIYqF4r+1cjJCV/F3BkA6i
	 eW4z7J3DmhMl/YqVEUTqXHpPzOF3qtlNj2VRwrbjM90LkPB12gW8Gm/WKN8BS5B0ycNNQ
	 aLpiAtZaJMz/6UIpm8IsWuRAKk8d8zg4sob6yXoA6pMVy2lnH9arKD3uT0dSzf4hHasu2
	 Hc5hFkbxG6K4+sdBpVkypEqDX4nv+gqHaQIwthx0DG4D5l/PTUL/YmHY8MDJbg7UfYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIQVWYj8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547B9606A32D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547B9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIQVWYj8
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adf89523d8so2024811fa.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470406; cv=none;
        d=google.com; s=arc-20260327;
        b=lfc81fAm5aA6AnR3+tPMHIYHU1KaCGJGFuJEhQVNWR1e66q/26S55nXDGRynJOuVox
         ceOSlyNdEBDuG0OtrbagmXxxYtuM/YBeMz6RNoOGxt2awlTtb8GMKNoIhFHX6PzvCXzr
         Gzjt9ScgioxgUsqIfecSK9FHOfFrQ1E0SgVjS4rrYcXe+C+kAEMZRmt9qHSLwMb+XCJ6
         T7iv7LOmTy4tiJJTj2JxA/O8b0tfqtdlwLjHV3T5s/ldKP+GFy0C60SxejhrY+SlfQA0
         3P8sJ8VSJryN58uryDeBv5uVDpJnw2t5otVJBTbMPT3nVQ7cml5ya2EnJc0lqjsNbtNJ
         qGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        fh=iRFVhoCa89QDOlqOcBdbVQ88zazFzKP4be/1OWIp4IM=;
        b=qX7J0UBlX6yZnjWsVywSgdFtsC1Zc/gcFShsBemlkV9KRSwEWwJMDAmwPuHqnREcpq
         8lUbcgZpMB3CVGONNrIzYsRuP6UUpFTufhuGCECrjmvzntmUnEaNK2V/NhOFFpshcEhd
         DhO0xOqwaQBwYXgBmqnogV7A/rTkwXv5NrEyocf079If0BANY15HB7ddtlZMirmJhpS8
         lFbKzfVSJhYKxpAAmIxL2KdublyGrVx9veYtDLQL4urRKCvnWsffCWqIV8HkFtZiR8h6
         C3v41CQHfqqf/8IS46LgEJnTPbfmaTvYuNzXTPk/ovtsUb68CkdPhvOiejzTptc3pQu5
         S4vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470406; x=1795075206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        b=GIQVWYj8ZnSahGOCoPVd+jjkA2EUwTBSx8VikobH1zTBEohOrcSWHGBkOfHFsmVLqn
         lL6NTPpr3p5XAMWWnezU8yX+YeaYl2Vy8ylOlqj9Y6r61tntidyK1n1KZTjlCBgkfT0N
         BqLuOCoieu8CjECxn8HCttTDyoyctZ+FqCA958QArwTFRd9gS3+BuW0cr+HV3wDwpoLZ
         OGb2AZcQi2nBlwbOgaV5DQGZsw0+uyMqx1AZs9DUOhZX+Vr+Bj4Tq4m+0TOgabmVRK1v
         pLYBvpSsjNxAASwCn1utxnfQM965iro+s+trIIQv7WFI3v28PbmHbks8VQpVnliK39H/
         nk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470406; x=1795075206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        b=QZXtcGpcSUjNJRTUFC9wpu2JdkZRFAk4J2T1hbVrSEfTMKpFG+d3xeZ2HC7J+IlEhX
         cCBfR3qdNGwIZeNkjDb1TN05JXCpO4LzG8ws0BnU0F/Q/E/dSk1c6qUGQOR7qgXNN7Z0
         FUxYGsLM8+3AcEDab6w9u9/RtWFBl5W0OoqOunF14iK4liMFgK2cRPKAIgq9o2QFt46a
         JLNJDg/QrWp7gl78e/GNaaxb5cxJ1T3lWFEGy11pREhDTFg7xSpeCOdm8V+99xAsyrw+
         WJY4CALx2if3oXV/KZXe9FceEROJnLwGQlizwCbhupHsWa6kZQ5ji8xJMPbnJw/owaSf
         +eEQ==
X-Forwarded-Encrypted: i=1; AL+hErHdTLI68M3LMIdpRg3vcrVX1iySMO3yWetqd8UDovjwYsz+IyiIKbRCmgrtKohDnUt1jSFQh8PWgX5P@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ita7cyTJ19jJM+O1Y58RRMX4SQLSco+H6NdDAuKyBJJorOxye
	0mOF+PE4Bsyj2shBJfzqPbC2Sr2piJwV/DUn8sXpsrhxzmXN92axonjcNjOjQZpCPtGq7XKJeg+
	Lt6NjWD3MAj9AJaM4XgLpkUnN3N+icCM=
X-Gm-Gg: AYBFou1rRGpwKkzN3+B/VnDf4IB4qdNQ0LC2pchcgGAzWzkbO69CzTk1PHSPPnA8zyO
	K+hcFBb0AJVKhVs8AYamF5chFnimgcam8/RwMoS3AP48VxdgWauRCZguBWixFKhwd9ZHlt4cFBw
	mHNN4GgC9ym/Gfoy1IijKH/y8Vtl1BV4PdVvNxVhNgcROEiVjIPqjMFI7POoQ73nZB2ZJX/MXvO
	p6y+VxnSA3V4imwbbgUM57RMzPE7yyi/cWmqcD567HdzaUiULGlGtE3ZmvZMOUYmeMJWSkpHVZX
	LozAinGmMwgECx+Wxr/+zj/Y4rQZuYbpMCKCgsQdXqWH80OXZPMFbiaQ1/FJ88MuAluHPyO3/kD
	XXig5FQgAaUXkrXckwhXjzBUV6XwBCcBU/ef6T1NF471MBdOmN5HAudEKyxiflAGx01N5MgQ=
X-Received: by 2002:a05:6512:32ce:b0:5bf:d00a:b6c0 with SMTP id
 2adb3069b0e04-5c15d61a7d2mr1922231e87.3.1794470406245; Thu, 12 Nov 2026
 00:00:06 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com> <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
In-Reply-To: <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Wed, 11 Nov 2026 23:59:55 -0800
X-Gm-Features: AclHuK-RZu7t5oXW3B0hgGonN3UAbxzfPc39DI6ekhiu8UyR_6arhmtUrw5yX_k
Message-ID: <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: wens@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Wed, Nov 11, 2026 at 02:35 UTC, Chen-Yu Tsai wrote:
> Would this patch covering all HCDs be better?
>
> https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/
>
> Also see Rob's comment about covering the port numbers.

Yes, yours is better: it covers every host controller, and
generic-ehci.yaml gets it through usb-hcd.yaml. Rob's point about the
port numbers applies to my patch too.

v2 drops this patch and builds on your patch 1 instead. Only the
Orange Pi 5/5B DT patch, which now goes to the Rockchip tree on its
own, needs it; that DT passes dtbs_check with your patch applied, and
also with 'reg' limited to 1 and up as Rob suggested.

The v2 cover has one question for you: patch 1 there looks the graph
ports up by root hub port number, while you have said root hub graph
ports should use the raw xHCI port number. Which one do you want?

Thanks,
Arun

On Tue, Nov 10, 2026 at 6:35=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Nov 10, 2026 at 4:20=E2=80=AFPM Arun Iyengar via B4 Relay
> <devnull+aiyengar1990.gmail.com@kernel.org> wrote:
> >
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
> > always reach the same host controller. On the Rockchip RK3588, the
> > SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
> > of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
> > which EHCI root hub port shares a connector with which SuperSpeed port.
> >
> > The USB core already reads a hub's OF graph, with one graph port per
> > downstream port, and uses it for the port connect type. Allow the same
> > "ports" node on EHCI controllers, so that a root hub port can be linked
> > to its usb-connector node.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 13 +++++++++=
++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/=
Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > index 908b02d9175e..9dcba539d60d 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > @@ -160,6 +160,19 @@ properties:
> >        - host
> >        - otg
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description:
> > +      The root hub's downstream facing ports, linked to the connectors=
 they
> > +      are wired to. Needed when a connector's SuperSpeed lanes go to a
> > +      different host controller, which then pairs with the root hub po=
rt
> > +      through the connector.
> > +
> > +    patternProperties:
> > +      "^port@[1-9a-f][0-9a-f]*$":
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Root hub port, numbered from 1.
> > +
>
> Would this patch covering all HCDs be better?
>
> https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/
>
> Also see Rob's comment about covering the port numbers.
>
> ChenYu
>
> >  required:
> >    - compatible
> >    - reg
> >
> > --
> > 2.55.0
> >
> >
> >
