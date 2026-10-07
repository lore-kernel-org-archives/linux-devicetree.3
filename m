Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A482A1F192E
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362955; cv=pass; b=b2wmIjrldEpPlDWEQ5Vap1FSmMCPI5oUJc2UH7IANw+drWAIru5NSoQWB9857jr9qBFGFVJWoSKQzgW2cW3nyoNRxzpNL1/eeefSjMKzs7FByNah9VS+DmS4OUGCDJBPzdqQ9186/KXySJIQXsQjaBBoh+1z8lTGEUmVmnanVWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362955; c=relaxed/simple;
	bh=PN6EPY1yryWW+YLFcjEUwHC1lGp1pOZRRH3avkGam3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFkx/jgz7XBRxpYlOe7WO0ZoELBtCAB7gXj1Dfxkr4GeKvmO632fmIzjaj9K091U/0ByRqgl8P/0hLrYICCl2UrNgm3bX7qAbcvvXRQOf1m3+YqFDltoR6wA5h/OOheiUTqf/D0453k23rsBUUXfgy00yfR0XByTWQ7e3JYke6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=tXr3ugRo; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="tXr3ugRo"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e2e0f3dd40so24947475ad.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791362952; cv=none;
        d=google.com; s=arc-20260327;
        b=klJO/TcCLK+NbwbsQgUcXzllRxEsYH6eukbpHA/FGeogtsXVisCfZ3CJ6VFcgygH61
         ZhfaODKg3t0wLdrxvUK/vmZ8xuqkNoQTs+2ZH4u1diCRomfh4ClhBZB6aFsW0LGU6xGF
         LKYRRHYDUpvkbZf+Y7N4X/Gloq44Y9AsNP/pwCvjykA9Ny/2zsFVYcw+wzEfdCBquAdt
         +xNdprJrRJmfcfomGYakN4vPUDs9nV3mxeLonhOBSCdxYvks3hdE9ngAlfV1BwemY/yP
         UB4+SSG2qlRtRDVAIw7ij5uyx+UesHgNc72F9QVahj2FL6Y5h8a0Qb6G72linH5BWvgV
         +igw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7mWXlw8htwSt3nqOewVTDtCFW9iqaV8AEvbO4v+RrdY=;
        fh=nLAMjtFFcEDzjtoHbjVIkiS3Zrc5FAdeG78dq1AxycI=;
        b=YXcovTAVXnZUTxkTSbVD/ngx1Ku75SJ+/6JEIzcR+DXRpFT5PKl9nJCCM0+jnP3PMu
         fBOYrDMF8p8dKvvBCozLn3CZvFjoG73lIAB+OWLDcs3/lrG068xpixPBTcFMOXugSEkf
         hHPD+bHip7MOTBejPenK6/zMbqOMlW+mJ2gOI7rXuq1xMoVQgXGKXZLt8Vj/waeDmuno
         rf10w62z0OT18NneioNuRdTImSoP2MHvyVMB1YvDE9dXsH9CSl96crBmJ685I/gFW0N9
         8WmGcFwvv3Wbw3MQGSdrLQ9dPw2zbEzrDWNs01GuZS2AH8WKHhXZseojK64kd6GpXEwE
         QU3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791362952; x=1791967752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7mWXlw8htwSt3nqOewVTDtCFW9iqaV8AEvbO4v+RrdY=;
        b=tXr3ugRoKe0hWT7LoaR2jZI9AFLFM8Ywg/XZtlv5uoGFG0/X5kVrerfFtPFhrztc9Y
         zXfZT1at1usZPohxymMMcmCWZrPioA0jzhtvI1Crs7WHaJnGN51lzo+n+r2OwSmH3crM
         KLpUN40rXDWUqYg2498yA5PhCbMBYiUZGeKnS0nnembaYf609Ug64r/OFN9G1hanDYfF
         2b75T4pUHs9kPBZKJl5XdT2k02epCtfvXg00a3NOSA3RlxzyPMgvAerdwygXVXYS2A3t
         C4AjsXtMH6K/bfW0Xg7utkV2l26mAhGI/cRRFPnDa9WhWIrkQ01CN2AAdBS1WCku+vjr
         qc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362952; x=1791967752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7mWXlw8htwSt3nqOewVTDtCFW9iqaV8AEvbO4v+RrdY=;
        b=HYM4OD71UTpl4grDFi84B2sxkeRwBzxzItDEnlqTTIa9oxUySE5uuaQi5x8H7BSxbf
         GKuWPAkm9MGq+WyoKAUiq6LN5YMHfwrF/i0a+W15uwqQO6m5/2qJao+1YJnJKjWASDm+
         tfGojXZPvIHGsLi+w883j6fgGR1pnaZgEh9jpHmz54cq0Tt4Ln15kMMGibIbMDiNQMSt
         kguxC2OH3f0m9DfYMS34gOQAe6kl8k0V+DvzhYfPYaf1T04oe8df48Ick+qmDIM8w7N3
         1OqfZh5A584/acT1SlYe3CTRiLRmbXYk41Udqje/odytw2buSTd+R7kJz2vTBUZBRRYs
         a1iw==
X-Forwarded-Encrypted: i=1; AKwUvBw0eE0opVCRDW97BoAjVH84tx43j4QEIPWGJeLC4xX83E+S+/ZZcjy5hvO9BM7R4AOh5QlDPtNmJ3a7@vger.kernel.org
X-Gm-Message-State: AFq9FYJAYhaRJ6mApHzMFPTB7eEqpV8ZmURe18I8cBLnuLkGkyEKVlv5
	c8e/hH2m/4CnEYYu7y0aMFkY/Zm7WnGoQpNHTn6tKcYaA6aXr5mRZhbqdAdknH8QgCfX2DPE0XY
	70CSrxEuDIqxit8yDZAiTEg3FDWypapwIcYePQbtIfA==
X-Gm-Gg: AYBFou1xQMUY+pJ39JkM3HIgVluH12ceWxGcRfuKpa2FWUa++l6SDGl77ayO7JxIjts
	CV2dhr3nprWbG1YqESWYb/atqWH1jjNxWxLRztY+IYBhRo18AcN+/zsR4eDeGrNNKXuDJa7T5E+
	wdjliM1L3rOt7spz3fAUSPOV69IbxNAwgpwR9QxZc5+9gBmpu71p/gKjAXKk1YP98tzLtqhmtZG
	u+remQNWNCAe1pi3pTBL4llZuX+MAQZHvgKtx7eNEX1S6lmgV9LRG3qYdmz3hwN6ONjIqorYU/a
	dlI3zC6MbZzyqQBvvvWxa03nVBGzhS+YGazYT9POAO1OlQlmDz5Rj7EQ8xQQPOYtaP0ewtD6UMq
	kzHyqmUK9D0jwi1DIDDyvU+TqvQdBuU1GGJg=
X-Received: by 2002:a17:903:2a8f:b0:2e2:cbf9:c250 with SMTP id
 d9443c01a7336-2e5ffaf23cemr14312045ad.5.1791362951863; Wed, 07 Oct 2026
 01:49:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930122305.293686-1-robert.marko@sartura.hr>
 <20260930122305.293686-4-robert.marko@sartura.hr> <20261001-splendid-athletic-coot-1bbbb6@quoll>
 <CA+HBbNEOiAw+_zzQco13nNzUPdGUgo+kjcRzLFEA4LmnzF8_=A@mail.gmail.com> <a2bcd146-0462-4ab1-b7be-93d6b4e05056@lunn.ch>
In-Reply-To: <a2bcd146-0462-4ab1-b7be-93d6b4e05056@lunn.ch>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 7 Oct 2026 10:49:01 +0200
X-Gm-Features: AclHuK9tvJ8qSGCNxCy6EHx93K-on75TQ8ncLTFdBZaNwxDWm7pb3b5jo-_JQ6A
Message-ID: <CA+HBbNGUbR3KeZMaWoBqEqMLMkELMLxuL4taCcOG7V03VsuUEw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: net: maxlinear: add MxL86211C lane
 mapping support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, hkallweit1@gmail.com, 
	lxu@maxlinear.com, michael@walle.cc, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:33=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > > +++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
> > > > @@ -22,6 +22,21 @@ allOf:
> > > >
> > > >      then:
> > > >        properties:
> > > > +        maxlinear,lane-asp-map:
> > > > +          description: |
> > > > +            Mapping of the physical TPI lanes A through D to the P=
HY's
> > > > +            analog signal processing lanes (ASPs). The array index=
 identifies
> > >
> > > Are there other lanes as well? Not ASP? What sort? data-lanes does no=
t
> > > fit here?
> >
> > Hi,
> > I tried to keep it similar to the datasheet, but looking back, a more
> > appropriate
> > name would be ASP instances instead of lanes.
> >
> > I am not sure if data-lanes describe what it is fully but I am open to =
ideas.
>
> Analogue front end ports? Or even just analogue from ends?
>
> I do get what you mean with your current description, but i have more
> domain knowledge than your average DT writer.

If analog front ends are fine with you I would like to use that in
next revision.
Mybe keep the "(ASP)" so that anybody looking at datasheet knows immediatel=
y?

Anyway, I am flexible.

Regards,
Robert
>
>         Andrew



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
