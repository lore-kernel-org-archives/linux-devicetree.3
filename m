Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1539F40DB45
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384913; cv=pass; b=Cc0+vQNO+WfzhRmCAtP38DDg+1PiKYKqzneBr+6g5763KZNSpPKr/gdTQka5J1YZ7bpRdeG1FSWEUbxtT+DB4vffvkR9iwo3ReENL8MK5NefpKeH2mWNJqbER1T2+8NFOhiYZIvr56iaWU+SNIF3OwYoEBAE2m2ff0FM/0SpMvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384913; c=relaxed/simple;
	bh=/3pcgbsRpKvkjeE4xYl4+01L2pgs/y1sJR7qtHiJdnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0KTQfwO1FC+r0hR/aKxhBRIwfTFBf7fX5nY1Gjj9MOoE8LVI8+SyPSTkWQ3Kso8K3cx5mBzxJuTPTxFdL6IFp2wevlP/dphYnG+wCSHhS5mh6fMBhzmyKt9t9xCIYzs3BbjGcyegyNHn6pilmWpN0/4faeZIgTulMNMTl/FUpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+AuOdSi; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+AuOdSi"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso2603693a12.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788384907; cv=none;
        d=google.com; s=arc-20260327;
        b=aTSCRbAt5sQblmwAXiMujIv9zKqpB6wH2hmqtmo59htcHqj7t6sDAAwz1xNK8mK/9u
         fCUx28cJDhiqplZmHCPzyfAayEW5VCvxHws8ttH5pe1noCh+zvKk49y/OX87ObXaaZmW
         1WqFtQtWBtxtfAD8084VbHyB30kvTTCyi4WxUrGegp6/1WmVH/yp4l3tp8ZHksqQMarI
         LEhsHNk/7GNPKfDwGUkW036FIA0jM09enJEG6nqJfPyseXHBQcSIGr93/YMREQMV7zah
         s3JNl6qW4LrE0dGmh6NNn8CUgYuGLciNo2E7rfBG5orezvCDV6L0u+gijuhkAfaEWIK1
         znog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A3AAbrMEFHcqDNT5olp4jYzEjeN8ZcYhbUy/GnjuDWU=;
        fh=HRwUBcyTsE9qoHCENhO0RySUYyUZezIAS8B49Hnqpf4=;
        b=NSvuKKONa8tXscj7rMO3R2RmANXYXdM4SBmlZAOgMPErRNcW/ZIpom3799YWJtQPUX
         nx+nZ5j9XqCSt6h/m8WpvW4bjEe0I2X5xkACasBlzuKDQohZip/uGfrebbRdeTVUK1jb
         Z+LVmYvZH7mJHSsBVTKcSBzegMFckW5QEhMQ2arf6EzYo/STwMvs+ehLRzJ9vr3Y2vSS
         vrrHNr0KARaQdB2fNrsFo7TPo1+TIJVCxNAzTpeaqwWG9Rw39iWLdRb7mvJPkpgn20ct
         q3LonuW4+spTwraq6Ras9DaY2JZ2z97f2u5KF+rixc7JQtNGQxjlK1O3rdhpr5A6HX91
         ipBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788384907; x=1788989707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3AAbrMEFHcqDNT5olp4jYzEjeN8ZcYhbUy/GnjuDWU=;
        b=R+AuOdSiXtKqWskLsD5Bw5He5p5Kzkl36kaBnjYu6VyynddTv4RCuS4BUK8mZIPMBE
         eEMU6kxN+HwO2sowytw2IeEmaLVoKcg1LBDiFDpDl6uqlbjrIz/w5dGlK3lOxkL88PGw
         iT1VpEYXMsmGPoQkXuWKfiThN12TvzCKakqAoypcy1sHU1UJOmaD4jFQ7KPzuTDFxvST
         jYSSjQjVVsPAX949Cpv76lFsrt84QXHjM8S/kuMu2PKzzVRLmPB31A3x3PavufEV0W5V
         IXmyppD6jNRzj8Vx7W6PRTAifm6kqJ4UQFbKsIzY5QP/Z+HxzVXiLcOwnSuSHSR5OqHz
         h4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384907; x=1788989707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3AAbrMEFHcqDNT5olp4jYzEjeN8ZcYhbUy/GnjuDWU=;
        b=dKhmf8iDc3EEBm4Xl+h4ml/Leg3TzxTiDvCNe7UEHotyOcYWKLUBxuxDyLOusTLmEt
         yEa/Mru+KPIbvgbvnpH7p4BuWleIjm1Ks5kmsETH/WhZCVQSuhPqxwCrBRY/bENCc0Zy
         pR6FFCmAf0DUAAMgeYca6HjXYWXvW5DXLHr4gyRid8A/2ljfg83iHUijEJVSKKybp/wX
         1tGfdMjRh2jgReeZioZ6VDKlw7dyKEtqsMaRKgmgYm/wxBWWdlhFO94k4BiEW7RTBNLr
         CUS7BlHCyAmWVPqcqwkUzf87BnXOhTFbcAsKQtdYr+cIIShRQ0cqFAH3kGhXttLRGk2D
         4/Cw==
X-Forwarded-Encrypted: i=1; AKwUvBzKiKPEs5w2wpAmimoBCm+KTogS5Sjdo79H14xtrLe8jgyxMht1xMuAgCtgwN6O54KaM8kudpO/2y/k@vger.kernel.org
X-Gm-Message-State: AFuF++mNWU/LlHKCNflOKceGOUC7Q61B9EAJ88Zh3l6G/WByn9WDigXV
	et+J07G6LdpXOrZ7OW9mhizxXAM2LY84WsvfCK3usUdWOhlJJ4keC5eWJsYIK0QxmT6m+HfRF01
	y7AQV2hB59rE+zP4ZemLgHQRJk47k/RI=
X-Gm-Gg: AYBFou0chU13MH3SpqUftkogGpk7+8il0mkUnZZMxekhPUUWBJaQhJiYZ1Ksfqc8yP4
	tizrIVF36MojIIDaFiEyVLV6Qfl7375t1n7qSp4JnNm6OeEv5UJEphIW72hx4IO3yzYsUkCMHtM
	zmoQc1MQBthKhmOPrv+eHwNGzUlQZx+camt8hvX0Qq7/sqxivuMhewOp9UpSCkVoIww6EMUwf8G
	q407dBF3ZttCh2mw7EUFs5lPQapJhcFffo7qvmAAY7+EFTPpujIJYvXWLkUhgsc9zRUzOUKBw6n
	LvfsvRUzw1692mnIo+fH5zLv/xKNsIjo6eYSyQxqSZ5qwaiQ8Fl45nl512bIdHE0kpIrhWwmudM
	IVwyhGXgqpDhvKm0xOPgf/Y1S7zovsmEDycesb84EolypV4fsCq3PwbLqll3yhjpL4i/5OjhDyi
	1sHP3cr1U771DACG6DW2vYNSDrAaxOP7zNQMjtsrqiUkKVHnq8+eX/ygW9GY1FJeUsYQ==
X-Received: by 2002:a05:6402:2381:b0:6a6:1076:8152 with SMTP id
 4fb4d7f45d1cf-6a68313f895mr5049013a12.7.1788384906985; Wed, 02 Sep 2026
 14:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901004203.49686-1-rosenp@gmail.com> <20260901-corrode-unvented-4cf271941722@spud>
In-Reply-To: <20260901-corrode-unvented-4cf271941722@spud>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 2 Sep 2026 14:34:55 -0700
X-Gm-Features: AcwNN1VBhItwhJb21bPHSs3C2UiMxziNU0BPB5MkKs7BmaQD66JnJpLxPrmmKk8
Message-ID: <CAKxU2N9X=fvr-a5h5o5XaRLuRuSUq7wR85xmSduK9vff4z4CQA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: 8250: add marvell,armada-38x-uart compatible
To: Conor Dooley <conor@kernel.org>
Cc: linux-serial@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, in file <devicetree@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:51=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Aug 31, 2026 at 05:42:03PM -0700, Rosen Penev wrote:
> > The Armada 38x and 98DX3236 SoCs use this compatible, either paired
> > with "ns16550a" (armada-38x.dtsi) or on its own
> > (armada-xp-98dx3236.dtsi). Neither form is covered by the 8250
> > binding, so dtbs_check reports:
> >
> >   serial@12000: failed to match any schema with compatible:
> >   ['marvell,armada-38x-uart', 'ns16550a']
> >
> > Add a standalone const entry and a two-string variant paired with
> > "ns16550a".
>
> Only one of these is correct, add one and fix the users.
> Given there's match data, it's probably the standalone one.
Commit 62480772263a adds the second one to support earlycon.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> >
> > Validated with make dt_binding_check (8250.yaml) and dt-validate on
> > armada-38x and armada-xp 98DX3236 boards: the UART schema errors are
> > gone.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/serial/8250.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Docum=
entation/devicetree/bindings/serial/8250.yaml
> > index 8c2c177faf89..f71c6afe02f2 100644
> > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > @@ -109,6 +109,7 @@ properties:
> >        - const: aspeed,ast2500-vuart
> >        - const: intel,xscale-uart
> >        - const: mrvl,pxa-uart
> > +      - const: marvell,armada-38x-uart
> >        - const: nuvoton,wpcm450-uart
> >        - const: nuvoton,npcm750-uart
> >        - const: nvidia,tegra20-uart
> > @@ -119,6 +120,9 @@ properties:
> >                - exar,xr16l2551
> >                - exar,xr16l2550
> >            - const: ns8250
> > +      - items:
> > +          - const: marvell,armada-38x-uart
> > +          - const: ns16550a
> >        - items:
> >            - enum:
> >                - altr,16550-FIFO32
> > --
> > 2.55.0
> >
