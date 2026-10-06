Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885513B05A1
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279011; cv=none; b=kR9UaNqYhj7O+tyH4S2tBKjkMJ+ykQlly39hDCOkF5YMuz7Rrr3ShbHFQ620okqitLmInk3JgimwZ6zp5YOKklcDshjVQtcEhLpNQxfhCIiFA1lrHArJP6SrgFAt4VefqQ23YNQ/lq89z4edI+rXRXWOAIh2GbnHWOT+t7qtDMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279011; c=relaxed/simple;
	bh=PbO3I5Wzv6Q0HLNgTgjdCNxGPB2wiMT01lvMSgTu2s0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKSX5fkRCPFLive1FM8+z59gytK5OGOBWge/eidiiyjeiGqzHLVjq9uQrkOiOxVnzwQterPfXMPj50qf1O1Vj86UuRHHSkhwp71b4uSt0wiVuuwx7PP1rg3Y4voFh6V38xktfaBNaDQVfKeknVv9ambJfdUxeHuA/bQ4rnWUYAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e706a6ba9so40100285a.2
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 02:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279008; x=1791883808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVTxTfkNs+IvzxUmHzgjnWzXGShomJ5y8a1XbauhqO0=;
        b=P4Ux7aJ/Hbb+oO3XabfjQN99ag10EYEhATALx5f0ns1IWwogpAgjKM9S8POnn3MYYO
         Q5EsDP1zVmHQYvycnlBRpCxbJoYktNEaVeYr/MjFoidBufM/U5MQ8n/PMxvrjcVTtAs4
         LLKH3Erg7XqTNLsSJkWqOzB9qm8+3/oiVfhtNRCwGcnS4gyA/9zE+9ooaIwv7nVl5DRX
         5IZSL2GP6ykCQDwMNo7l+N3PSU5D+6bSx4rxSWT7FvoC4CmIp3O1vMV4dj+2vxBm7DbS
         hwkaZ7dTI4SBocTl8Arhx5zbgJ1DKDq2pczIjGc0OMFPyu8arjdmrTYQdStGfDwxhUtT
         IdsA==
X-Forwarded-Encrypted: i=1; AKwUvBzI9Boy5zLVAkP6Dtyx1vqkN57P7NS86wTN0jg/vJfT203fy+hm3E5hdBmehDDlhMuEKyUTCiAcCOMu@vger.kernel.org
X-Gm-Message-State: AFuF++mPIW9h2yrtvg++ut7HfZUJLKxWH3cSPNL7T6Pn/1fPwcLDyhEF
	2XEHls9o+N3pmnfKnEw9Vd8DZuNYdPLtHmqgyyhdWTns0L8Fdhshmhu2bHC5YFXODJF53g==
X-Gm-Gg: AYBFou0BjQ2Qd5PVpsfn1H9U8GVwA5dVYVExF/8YF6DlvMVQbSLctaRbODyLdtrKQwR
	LvmnFiQQV+Td4sYIXRe2mP5H/sHAX66VpiQYOuvS7+a7IuS3+HYSUxn0gL0RX2ZKHhocQM/V9Yz
	iT6pYhHyY8aEpo48AYA1gO7HscVa/Pn5g7jviVd5LB/momrwz90mSlCv/cxUoPpfQ3fAW4sY4nB
	sjoKyBXc6va10CgkKmHQLjy+C+P2mxsSJo6y5AlF/jL7SIMdCHjsLRLAjXJ3on+3xp36Ip9rdbm
	XsUHXc++1KtbH+Ekl13Eam/SykaBLQ8ETuBa43gRc+fg4K90g+tqqRNYB/GtiU1k5ifUXi4d7iR
	FZyvfPumz0IXfIO+Gj9ZZkJt97q01K8Mg1wkt0rshvtt84iDHmaFUZQZ1pWnpEd/RO8+HfZ917D
	ChGYwiE8ImMa96Xbznjf1bxIGqW1zWaEQgtfKwfAb6xqPFziri0+LoekMkCV8agy8twa8THHAPw
	80zZyMIxmevPHgFEzBjB1K/JF45MK041KP8iVd7641GLo3AvTW3JMbwAil7L9o/mZc=
X-Received: by 2002:a05:620a:290d:b0:939:6de8:43dd with SMTP id af79cd13be357-93e8f52108dmr138398985a.49.1791279007971;
        Tue, 06 Oct 2026 02:30:07 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a63d8sm1088041885a.12.2026.10.06.02.30.07
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 02:30:07 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5350d9ea106so6526801cf.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 02:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBww3tW2c/RlH0hUfVLYKBS3zLYe1adfbAHcZ4v5SKAI4G7+1SEQSn/OHhaNQenWt+e/g5a15dDp3AGj@vger.kernel.org
X-Received: by 2002:a05:690c:7108:b0:8ae:7fb9:8cb8 with SMTP id
 00721157ae682-8b04f3b6667mr2040067b3.17.1791278683947; Tue, 06 Oct 2026
 02:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004144046.391444-1-tanure@linux.com> <20261004144046.391444-3-tanure@linux.com>
 <asN_-5zalENhkdVA@squawk>
In-Reply-To: <asN_-5zalENhkdVA@squawk>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 6 Oct 2026 10:24:32 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2hD_LTcimHAVhyzgTnp9jYxKKFD2TK5cv9-wLjDh8+wQ@mail.gmail.com>
X-Gm-Features: AclHuK-bVUCezgDuqipnwl794qiJm9NtCr-yWp4gG5KzmPFjPQMebZJ1Y2LQr9E
Message-ID: <CAJX_Q+2hD_LTcimHAVhyzgTnp9jYxKKFD2TK5cv9-wLjDh8+wQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 11:46=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sun, Oct 04, 2026 at 03:40:42PM +0100, Lucas Tanure wrote:
> > The T7 has the same ethernet glue as the G12A, but the controller
> > reaches DRAM through a pipeline stage that the hardware design inserts
> > in the bus path. That stage has a gate of its own, which no other membe=
r
> > of the family has. Nothing else in Linux claims the gate, so it is
> > switched off as unused and the port can then no longer complete a
> > transfer.
> >
> > Describing it means a fourth clock, and the fourth clock of the existin=
g
> > list is the one driving the timing adjustment logic. The T7 applies the
> > RGMII RX delay through PRG_ETH1 and never enables that logic, so it has
> > no use for that clock. Give the T7 a list of its own with the pipeline
> > gate as the fourth entry, under the same name the SD/eMMC controllers o=
f
> > this SoC already use for the equivalent stage on their own bus path. Al=
l
> > four entries are required, since the port cannot move data without any
> > of them.
> >
> > The RX delay range is the one the G12A has, since it is the same
> > register field.
> >
> > The compatible pairs the T7 name with the 5.10a Synopsys core the MAC
> > reports, and with the generic fallback.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index 90ef79161ab1..96118b4d1560 100644
> > --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > @@ -23,6 +23,7 @@ select:
> >            - amlogic,meson-gxbb-dwmac
> >            - amlogic,meson-axg-dwmac
> >            - amlogic,meson-g12a-dwmac
> > +          - amlogic,t7-dwmac
> >    required:
> >      - compatible
> >
> > @@ -57,6 +58,47 @@ allOf:
> >              - const: clkin1
> >              - const: timing-adjustment
> >
> > +  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enabl=
es the
> > +  # timing adjustment logic, so it has no timing-adjustment clock. Wha=
t it does
> > +  # need is the gate of the pipeline stage the controller reaches DRAM=
 through.
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: amlogic,t7-dwmac
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: GMAC main clock
> > +            - description: First parent clock of the internal mux
> > +            - description: Second parent clock of the internal mux
> > +            - description:
> > +                clock of the pipeline stage inserted in the bus path b=
etween
> > +                the controller and the DRAM. Without it, the controlle=
r cannot
> > +                complete DMA transfers.
>
> Have you checked that this actually works as a limiter to only 4 clocks?
I have now, and it does limit to four. Adding
a fifth clock to the board gets rejected:

  ethernet@fdc00000 (amlogic,t7-dwmac): clock-names:
    ['stmmaceth', 'clkin0', 'clkin1', 'pipeline', 'bogus'] is too long


> There's an additionalItems: true in the snps,dwmac.yaml that I don't
> know if will permit random additional items here.
There are two checks on clocks and both have to pass: snps,dwmac.yaml
allows 1 to 10 items, the t7 branch allows exactly 4. The
additionalItems: true only relaxes the first one, so the second still
rejects a fifth clock. The "exactly 4" is not something I wrote -
dt-schema's _fixup_items_size() sets minItems and maxItems from the
length of the items list.

>
> Cheers,
> Conor.
>
> > +
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: clkin0
> > +            - const: clkin1
> > +            - const: pipeline
> > +
> > +  # Delay definitions for Meson8b and newer (including T7)
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson8m2-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> > +    then:
> > +      properties:
> >          amlogic,tx-delay-ns:
> >            enum: [0, 2, 4, 6]
> >            default: 2
> > @@ -106,6 +148,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -143,6 +186,10 @@ properties:
> >                - amlogic,meson6-dwmac
> >                - amlogic,meson8m2-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
> >
> >    reg:
> >      items:
> > --
> > 2.56.0
> >
