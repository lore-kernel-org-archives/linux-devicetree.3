Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655D03F8243
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546060; cv=pass; b=ZXRJBKRwrn5HN+kbPjJ+BR/fKJS9I9zGZbW0SY0DYnzveVAmWbIxhZ/t5KaFtJ3iLTXBEvwsOjkT0XNpEjelNYxgkg+cHLbUyRMl3gfhgYL34krHhpl4iPrpNaOVPCIKf7KLt0f++qrSkz4c3wg0ost97lL2UAC2Ny2AsegSY/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546060; c=relaxed/simple;
	bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtWfxbzqohwbUtH9+Mxs20gTeRvd9cz3w64jeJ1HQ0hE3HsVpp8bYKalkX6Ykh6uYgBLdiglaoEPPcP9++7b+RYXV+xLnvbxD7KeN2pAkPPbKIPam+GnSZuzY/w6lQWRihkhpPvfzvVoNynt/jW5HYtYlP5vW0BjoGOg8a0W7pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/SxvIXK; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/SxvIXK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47de0093c42so5320198f8f.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784546055; cv=none;
        d=google.com; s=arc-20260327;
        b=agTCHx4hj+DbdkO3cxUXo3TU/+Y/N9gLN3rFRVlOhotyTjG4Owt3M4Uzw5HRrItcRM
         Nkre3GRPwk+z3rCj6dkA11oHXgwEWL3Q2JW1augv4ZZkgNhJOWFJVhXUltIfj2QsDY/A
         LBrp2xXEi+qxpehCxRs5JatZLQVqQP3EiylMiTSMkWsB6WVkTJ9wUyZ9c4i+PPdhzV1E
         ZKRCdbY+q1pw/0NlRfQkQZg4w42cyoY3JtKmhGswNn8cMiud3FdgRIDmKZlIoLiBI7nx
         gf/pm1+96eXsz90cruYhYse0gyezt69MQFogbF9FhmYYES1DhkIQvgP5AmqLGSSNGR4j
         ofcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
        fh=cWNwmZqp2/8xPvI2Qgxnb+8Lm1cxLJqCzLwvfNcUfto=;
        b=Rx+WYjerAEes3igOm88wrCHizoLXedcdwTfgrlgwSa64tEYsn1xDh+ddGqw9EMxG/2
         MC/hX2FdH2rSLpdSAZgEz8xniQb3nASEG9BZFwkdJF3N1mKX//pt3KQD7bDFo2S3j410
         I7Bu3YqUGfPqiFP17GgcuS/nqgOu0gjSeRqPQF//AmlPGf/hm/Ns0ZCwOixixvKcgIss
         BUtx/xC7GCyzmrK0ALWA40puUJy4kwjcOlwz6JZ0SDg62F9SXYysgFjwLfZakzpg1aHw
         vM2lbxpehcDnDWhp+Gi4GBdpYmO7HwHAR2A7Lvb6csepXx+UcGj/M5JOvwqtOo2r/sVl
         cLUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784546055; x=1785150855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
        b=E/SxvIXKg5c8UoFAOev4ivn2y5aMFjX1UTvNBHABgd/ZATRyBfslWYKaqIbhPmvov4
         4NGbLWHAWVVDhxW26j9hE5bSVUdmE7YT1Ax8DQBvKTY58PYXmhwSgaWuxt1SnVbv0/Lz
         TPDHz0r94JdcnEBOh9qmJO++3n5X3uX6q8PTSO1ZAvt7Ib/cqmuDRfAbLeFEIbKbeqbi
         aRDFykKylQNtbOAbCOkjI2CJRu+p5slbh1xjRcdufryZ5vVZb05yW+kr4L866K93jrtz
         Mg/3RamfvagCadlRlXlNzcnffgz+n21/5N44YJMutj8dBZ2segJFX/M34e6sW+BeoZ3e
         qF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546055; x=1785150855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
        b=P5R+vpcunS4XfNStA+bwToxxO5nHmsZbu7AgwIiiksDWIVT2P3maZeLOWgcMnBIKmp
         K+z/dI0Ue7XDBLGUB8ZnFMg5L6YBjiHyoeL7vrDQyByF3VJOXisK0XuBKJ8LUL3dnwpv
         ixN5gzgFRDH8TaBETARftbwKOEMH5JmerulnPLVzgulpaVbKgZmrL8It5sx8Vu/cH80g
         X/xZuyeZ/f+ODgx4lQARN7UCSQKfXSgJL2IKOC9tzuA61JOQz40wG6ZJrQ0OQk5JyM0F
         cb16gbBFYSEvxamb/Sh3/iOi38fMwnqKiUM1YaVH9xeDDG45U1Wy/RDjQfnYJDyFu3oQ
         h4+A==
X-Forwarded-Encrypted: i=1; AHgh+Rr6gy8GbLIaG/w82LDJMBJwStC0Cc4TFNfZmUDETGqGRAnlGoHhBg8jNGOAhyi6D1HXeMpoJmVHQjZQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrb4VDT7se1Ra+FZxabv1AHnX6pqNCHXS9FuFap++wOtpvEy6+
	KV6X3l19NNUjdn5GCY9v10bUroGCTRgFHscGiEKkDzDQjmPopamOqPqY9T4VpSqOR3N7b/itelH
	WpY15HxX+/SDdrERkg9cb6U/EziBvqUc=
X-Gm-Gg: AR+sD11lIVo6AGG8332G98dBFf3CUjIgJgNp9GPFab2TATVP/7TS+gzK/Hy9IIagFIG
	HqEtn7CeLPVSftOQTQ7gO4PXgp+L7T9VY3Ykl4cWJOXR633wenWArrDE0xGO31o5ajLKamK9Pz6
	Nu4R3FktvgLSbwdty4RWUPjiC7tREs1+brWA7rEp0+8BPpTckkLJ5C+5zmTfIdEJFxeznjTt0OH
	2rSKfDFM0NFZ+tJ55W3ZFJQdRBvaz1W1nqNWTUzhbbB4fD7+3N9md3zyOk/3W/vRZsBHR7JSDoY
	lORwuT4fnx/WEO1KsEhx1L78/uayq7SRIT1kGS/w2kAkhOA=
X-Received: by 2002:a05:6000:4912:b0:473:1ccc:15c9 with SMTP id
 ffacd0b85a97d-47f6232249fmr14608346f8f.40.1784546055157; Mon, 20 Jul 2026
 04:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260720-fractal-prodigious-spoonbill-86f534@quoll> <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
 <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org>
In-Reply-To: <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Jul 2026 12:13:48 +0100
X-Gm-Features: AUfX_my8cjMqflKYyG4hZniXQBlddlP-o7E0L6c407-AbtgLj1LdUoaSU0sykN0
Message-ID: <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
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

Hi Krzysztof,

On Mon, Jul 20, 2026 at 11:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 20/07/2026 12:50, Lad, Prabhakar wrote:
> > Hi Krzysztof,
> >
> > On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Move the RZ/T2H and RZ/N2H clock controller bindings from the generic
> >>> renesas,cpg-mssr.yaml schema into a dedicated binding.
> >>>
> >>> Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/N2H
> >>> system controller integrates additional functionality beyond clock an=
d
> >>> module-stop control, including reset control, clock monitor support,
> >>> write-protection registers and other system management features.
> >>
> >> Nothing of above differences got reflected in the code, so I do not
> >> understand this reasoning. Binding is exactly the same as the old one.
> >>
> > A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver.
> > Since the RZ/T2H clock driver uses this syscon wrapper, a function
> > pointer is implemented to handle the RZ/T2H-specific configuration.
> >
> > Also, as the initial implementation used separate device tree nodes,
> > Geert suggested splitting this binding schema off into a dedicated
> > file [1].
> >
>
> I still miss the difference. Can you point me (can be short diff) to
> actual difference in this binding?
>
Fair enough! You're right that the schema text itself doesn't differ.
I'll drop this patch in v4 and leave the bindings in
renesas,cpg-mssr.yaml (unless Geert has a different opinion).

Cheers,
Prabhakar
