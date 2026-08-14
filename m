Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7D937DAA2
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735081; cv=pass; b=E2ceACNpSVycl97hWlIy++asrCENAxPIeOki/DEg55xWo3V7rcC3G/9mfUOj1D/cQcTCbxZUn9/DQA2fXARHYpRNU7G1e1GjsLdsSOJ66UsG2gkZQLS8YkFv0iOdagCZ9LmuwLNNgOsifgc1q3fGW49oZNgFq2MO77dW5JStdB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735081; c=relaxed/simple;
	bh=gGGqgyM1WQNtb4vbREG86MXa9sEfI8krzxGiO31xHEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9HjbskMuCNvLXa6gwX07mjmbtkDp+c/Ag3D/aV37qfRWVmGcHOdp4hzCYRn+/cpmKrgyZvlQAHZ3J+AFFrKsqnQPmuc1iE1lvLYgiImE+O4YAJX0w4HeeR1wLzMmqmufzCnpOQlaInVEtb3j16UGgIKi41iqxNB9fP5qeL8Tpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+eWTaZF; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+eWTaZF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4798bea72f9so875850f8f.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786735076; cv=none;
        d=google.com; s=arc-20260327;
        b=E65fWzK5KjjdEC2M9oSmf9vRJVX9zQVZxbCceoLt5ze516neS3SovwtWPa9GzEDyG/
         PchfIvNPW4+Refwk6XrMwJpCmGoKEjA+LRxiCQgkw1gZUc6yUYVF6n4MxuCCwrra+oSg
         o6sJFFDZAx1qzsB21BkH3u8Z91lCDU5208MQ9bdZVoqDpQ3ZFvc8XxlB6oWgF6Wxgvlv
         mRB5VucMCCsktyDZ8gucA2yN/gq0+yyVomzdFARvYNzifIdx3eQwW6DdA0EmIub+zgNu
         mWXLzDlEWSeEv1HLt9vZFZ7C9lfrSTMjA/tcqFtwIn4oEKx7OsEGKfjAKIAczW1+wK7s
         RwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gGGqgyM1WQNtb4vbREG86MXa9sEfI8krzxGiO31xHEQ=;
        fh=zm7cDUfFgX83pz4XlwQLQFJo1MiUIvT3+WxuK0EcCd8=;
        b=IRg8ECCwKuLeYZk7RLacQzOgA389ChxA+IVEe7RiDFU9+thPHpwvQDGrkC6OHeVHvt
         BHF1YehyM71fmmGe0kd69aKmqcLhgryYmjnFwbZaMLtI1O3fnJFuAajWlu4DrNGEuJo6
         ho7w5fedDjbTw44Ur6N2H2FKUmYKZO1rkbLd8ZGQ/+kU19KxXp++DVHSM3hJi5vKf6y4
         YGxk3PyZy0bdU4VkGmmZO4NF/M5/BA7wOmgglFBvWvJVGmGpMrRMkyJaeb1X3l0BVwua
         UZzdnUnrWS1fBz+ign86TWrAHi3d303Q/qTOWCbN6I9dxKEaWgI97Mck29UdzsFuvKHp
         xs9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786735076; x=1787339876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGGqgyM1WQNtb4vbREG86MXa9sEfI8krzxGiO31xHEQ=;
        b=b+eWTaZFA7BFexx/TG/Aglvr2O0kTT+XkojjJFp0hnC3Na8a2kg2hcdRuI1hhAxG6f
         +Ydr9izSrds4TaJ1WLajVhkXBI/yD1sT5ay24GJZs1Z22w2f7cYWeeo8O01XUIhhX2cU
         rntyLj7w8ZMTm5JP/Bu4AM6+O/EuE6rA6lcJQjI8MLfxL+AR9L7oDq6Ktpmb6dCWeLNa
         SzUQC0fg8hUK4DjLHBbfEEUfrkuEjCfR53YxSo7NqnsQ/CBPmG9xjxoBk48tNQhJgw9w
         m003zFdmdrnxMkNnzTPO69+A4TfEBkYnknzcjsMXLTDZ5RjVvZTMJfS7c6djuTF/I2V1
         FJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786735076; x=1787339876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGGqgyM1WQNtb4vbREG86MXa9sEfI8krzxGiO31xHEQ=;
        b=oTN2tjGAMdTLCnQf6nzEarS4Cc2V/EUjLtHAwnGZsTl/B7dINvW/sKnUZumzJLvAhX
         L4ibjOCR4G0slZA1oH2f193Mn0SxTZf83Ik1pPOIV9hnoqDjVbDJ3lYyZFjoM3ahd6SV
         HIRguZDxlz4cUigs59jJk/irLDQeDWb/4HMFYXAEXSf0gteMR44pZLHeSKY79787xIHY
         JmXW7UObYN7z0PWylknW39J1vOzOiUw5x8CXKO324avfq4JwT/wxPVibDpAiljI0scXF
         ICnn6gGDCQMyHPjXwCtAX7074MQoF6XHJjvYXrfI+ljQzhr4lbrjLx7Qy/NoIf+fXsYS
         3jcw==
X-Forwarded-Encrypted: i=1; AHgh+RqepA0P67+Xk6fcLu0S31A1m/K4GVH1gwin+UCx23f2xK9nu59s2e/2xLD1VbF9R2zfSw6qa37xGXJD@vger.kernel.org
X-Gm-Message-State: AOJu0YwFz5158xuEYkIbysK0tJPrU5uLkvKeCKGFW72rftx+XAh+XEoW
	I+EYVxzleeXIEXMKFFgovvr6oLrePCt7RQLSGDnfxC6+f0yRJn+OgDWrvEGIHk8QUnXRAPlyWaT
	sK+PllyWItOyDtJWEfTJfquMrKmDgxKU=
X-Gm-Gg: AR+sD13PTwhlH5RSRsZVl+mzv09cfkAB8N75J7pVUTeLMsUiMXGlvW6xeLgjUlvniPv
	cLJSbwsNNMr8I2h6diPznzJHQqKLDu/GPs8XB2LiQKeeIv4QSERuFEw65mVuBjo8S7aW+nCF3FK
	uvKTW92VSPvXRLIMp0kr4lzRnjmXZd10tCpMgjy0C7YWLPhjNSr8/cLh0ydhZrzVdoi00PfNC68
	d0fLg2fJctWFWAXzjw0kZPpDN//me44boc3M//ZLc3oSJUzJ16Q9UCFEqgeJpAohOPE8mpx6eTF
	3sjmyjueY9UlligXNNuRQbbUlxFr5yKOHz2N6drwDddmFTOhPn44aX7UOhwQ5ZTVLmZIsed2SzX
	M6Hr9mek37G0AuvQjM/kBJ8yeoBJu6jfCFne65L6S82k2sMsqzkbcctY3DqDK7mf2b1CBVFeV6A
	==
X-Received: by 2002:adf:e38a:0:b0:47f:7b75:9dfe with SMTP id
 ffacd0b85a97d-481607a6b59mr10253177f8f.8.1786735075598; Fri, 14 Aug 2026
 12:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260720-fractal-prodigious-spoonbill-86f534@quoll> <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
 <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org> <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
 <CAMuHMdUwPdPwKV++3GBvm_yEY0pqvT-KxBr==g8LQFRvZkBnjw@mail.gmail.com>
In-Reply-To: <CAMuHMdUwPdPwKV++3GBvm_yEY0pqvT-KxBr==g8LQFRvZkBnjw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 14 Aug 2026 20:17:28 +0100
X-Gm-Features: AcwNN1U9V05nG8F5x6qoNhExsv1FilBMcJ6qkSKN_Tj9If7A8je8R5Sw1SnfcC8
Message-ID: <CA+V-a8v=jH3vtUUR-c9AEUJU5+YJrO8H7xC_S9LA3EvHMBEyWA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geer,

On Fri, Aug 7, 2026 at 2:30=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 20 Jul 2026 at 13:14, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Jul 20, 2026 at 11:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > > On 20/07/2026 12:50, Lad, Prabhakar wrote:
> > > > On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > > >> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> > > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >>>
> > > >>> Move the RZ/T2H and RZ/N2H clock controller bindings from the gen=
eric
> > > >>> renesas,cpg-mssr.yaml schema into a dedicated binding.
> > > >>>
> > > >>> Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/=
N2H
> > > >>> system controller integrates additional functionality beyond cloc=
k and
> > > >>> module-stop control, including reset control, clock monitor suppo=
rt,
> > > >>> write-protection registers and other system management features.
> > > >>
> > > >> Nothing of above differences got reflected in the code, so I do no=
t
> > > >> understand this reasoning. Binding is exactly the same as the old =
one.
> > > >>
> > > > A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver=
.
> > > > Since the RZ/T2H clock driver uses this syscon wrapper, a function
> > > > pointer is implemented to handle the RZ/T2H-specific configuration.
> > > >
> > > > Also, as the initial implementation used separate device tree nodes=
,
> > > > Geert suggested splitting this binding schema off into a dedicated
> > > > file [1].
> > > >
> > >
> > > I still miss the difference. Can you point me (can be short diff) to
> > > actual difference in this binding?
> > >
> > Fair enough! You're right that the schema text itself doesn't differ.
> > I'll drop this patch in v4 and leave the bindings in
> > renesas,cpg-mssr.yaml (unless Geert has a different opinion).
>
> Given you no longer add a bunch of RZ/T2H-specific properties
> and subnodes, I no longer see a reason for the split.
>
Ok, I will drop this change in the nxt version.

Cheers,
Prabhakar
