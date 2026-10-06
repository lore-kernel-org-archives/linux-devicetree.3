Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3873E639B
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285113; cv=pass; b=oPIBI9AyRRdlgJlGLXoWVzzw5+aLdL//CHCkJ2VEYFsjFuTiIW1P65ERBgmjnx+10qPLvauUs+kAoB2LP5eDbPzdx57xjGYHYk2S0IY5TRiRCmzVHPErap8pNz/ZN7z9feesRSXzhFRNQVXlDtn+DYszehv6c7GAe4vocbuLdg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285113; c=relaxed/simple;
	bh=mUNeY0u+Irh6yo+HzKbKNtxDudPGVOMhORN9dinV7FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7q3eQwJkduyH4er/81i2GTSqiOdynD64p7ORe6/YAOBGojKxGdN3qV8QBt1/Kij39YjLVWb4QWwWPdNqhOkl9IXua4xDHrFXqCHUqv3jyVkCJeegtwrilZVJJaiJm7HfgyZ6U4hskPWHn7x/Pz4s/uZuZ+2IH2Za4sKqmve4ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc82NDTs; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc82NDTs"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b03f23305so2421046f8f.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285109; cv=none;
        d=google.com; s=arc-20260327;
        b=P4WVyCAeD11dJIwseFparLfddc2zYlQdp/Mey19kBiFuVJYS6+K2AkPmFzx8yNrQjJ
         MZfeMSs56FeBz2NaJoJb2TKsq3ltqX5e8r7IQhGxFKcwMt7BkIE34qkKIDS+ItAs/Vya
         kptzlpHf1dXu2Khh7eyzc5MBvQc35aYSqtpk3LEtjg3MNh9PJd0JaGQQaBIsrqeMa9Zx
         zZjxwsXzMnrCDBVfE4oAGuhL3CBX0EnNcXel52sVphk5Bo9GCa+MhNqh3L9jJO3Eku1c
         huqguW4LaVo7N+zxATNy0CcacT9amZwcwZytqThLC7cGOKm5HYZ4Ov8Zblmwwm/RoeU6
         veFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hGa1JZEofQkImbdUcr0R+0KXG2WfE9qw2GmFzyG0ca0=;
        fh=xKlVqvoHE8rby8MjjizPkkV3D0ZhCuohGb7glvpupC8=;
        b=Z0YHv8hOITy88WfHaFxisOiyUq9WNwFMZ2NOJY2NlaSeY6/GShzF+qIG7KqqO3aTx2
         tgWGQ5MFJlyvQ1pSGh48FdWn+Kzjdu5mGTLzi2QnXZAR1HWNfSqFBPiYQVVtr5NmHaSE
         UugvNTxMLk5jTjB4VwuIqf7U3NPTzWGv6ewx77rMmv4EOsHo6IPjD85cVsI5Bntl0OFS
         Sk0v+Lxl2ynmt+9pC2Yvj/+Fs/iGEj91ZunC/ylZZywxnnqHzliXDjldagCPd30rhVNs
         CijF6lG87kXqQn9fr8OKAyokx4NDr6yLGtFQxXg6Y1ybOCEhmQUP4Uu2u/yJ1jkn4+Kc
         ZBgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285109; x=1791889909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGa1JZEofQkImbdUcr0R+0KXG2WfE9qw2GmFzyG0ca0=;
        b=Zc82NDTsUNurJDINr8R7WoGBO1Kglvdz4OFjt+dUjGIdn813cYGuiuG00CFAGsjqoh
         wSwv3mSWym9yl24y6vzSfdyHXzr1NKe7CIqqY5FADf2b1v6rYmSdZ7tyd2k5vFTdncKA
         +eWTJAkb8wZyBBrExkd5ITvtFfr4MyuFhQNNqaMUABl/ab+TfU/AbWmu3MCMXYVSuz/2
         fGDbH5FGMDXARijapoefRsbIb7XRQeA/sZ2Mvbme7MVpc/E59tSlsyl76gFdYP0bmpaa
         pYTKTkKhAOY22HC4Ps/fDPLer7YfP2NeNKUaKpiSSGvjHRUqJAkIDvNn4Kav7aPOsTDH
         xcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285109; x=1791889909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGa1JZEofQkImbdUcr0R+0KXG2WfE9qw2GmFzyG0ca0=;
        b=bCrDLKn211BlYVj/AfZaZncq+HfGm3hOIbzJztvEBD3/Ulz8JDr8ryMPPkVkwMqec3
         /eVGg4S26DTgGTCuLW2ggR/Ysiks03/MdNNtgCMzUcbCmv0nJytZcFSBhpedHp77hX7o
         MmyVJlyuskO8j2dXfpZlraSKbhpINnxql++pOQXQMKJrNJbUvkQRKcVVN4ByM/q8pkjH
         JTHYHJXmWa0qZcdgo+lDb6wQhAiiqgc2H02Bkf+sWnU5MZA56exEhfAT29KoLYunUHdy
         tWZOxfACM4Lv1hfGc8Sv5yFBOovKNm7O7WbjrkFaluwWr/Py3Nub1vD8ZHaBlj39Z6rV
         4PGA==
X-Forwarded-Encrypted: i=1; AKwUvBxSKsl6EClWJUCEuLnzGGQdwW3WmdqJGvcD4Y0oaiF3zaV6i/FFOFJXHaH3mVai8H/c57Q5qytD1EJu@vger.kernel.org
X-Gm-Message-State: AFq9FYKnZy+Ykm1p6LokiTw97GEigfqkDwYZ4mWfn6DN9NX3idDXb189
	0j+cw93Ar+PcUXV6SIA+utmfEu7Cfg/UqGkmZ/XCBSkRJzKkXZ8GxWYfgv69FbMOrOtg3v14Ei4
	plKZxsWdBfgnAUpyV/9/oVB+3ZkvM3sE=
X-Gm-Gg: AYBFou1cTNwkNzz34ilEz4cYDnAlqAg+RBbD1jocI1UWYMuTEOFu9DJZOd2LKExHFx8
	YbZ1fS1BGDlE4y295DmqiUFfKbw5VR6dChXLrN4IuE2e9zTMGXhgTyq4bLJtHvAQyIGCMI1Dsag
	plyKmXM/CBDefRrtpRsgUngG8dFLtlYolu+rwKOlmyZ1oR0dkxYIixq7Fg8yjoy01b/Pfd0ljbT
	FIkvdTvnAEbnhCbkOZYf1kpHZGi2CVaPfnG7dyQC0quK1PxvDgoTiXB6ljVB8minembPeh+rfdD
	uEpQ8esEm+8nE0ZaP/iPrFa5t+oOXSOYQVzMWV967l9IJAgeEs2sGpLpUHqoFHQTWpt7u9xkYkq
	42UjEp1SlFQshBqWT+sChVNrk/+j0CrFbRCHrS0mbwq2Iqp2Wowt5E2k+gifSSFv3Y0r89URBEa
	iKmFNGnCQ=
X-Received: by 2002:a05:6000:4a04:b0:48c:4707:1b6f with SMTP id
 ffacd0b85a97d-48c480272dcmr16516413f8f.53.1791285108694; Tue, 06 Oct 2026
 04:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-2-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:11:21 +0100
X-Gm-Features: AclHuK8IOd_scDCDMasik1_SzcAsKOlMt2yLWcF2qQVhREPX9v8HScGEMDKtzlU
Message-ID: <CA+V-a8t5NaVRnh60eTD50rbnHGmYpZ_O-bQJtwF9=yU2jo_5jA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: media: arm,mali-c55: Describe DMA
 line-tick interrupts
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the patch.

On Mon, Sep 28, 2026 at 1:42=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Mali-C55 exposes separate full-resolution and UV DMA writer line-tick
> interrupts in addition to its combined core interrupt.
>
> Describe these optional interrupts, keeping the core interrupt first and
> requiring only that entry to preserve support for existing device trees.
> Extend the example to show all three interrupts using mock interrupt
> numbers.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 11 +++++++++=
--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/=
Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> index fc4fcd19922a..8fcc46660b75 100644
> --- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -18,7 +18,11 @@ properties:
>      maxItems: 1
>
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Combined ISP core interrupt
> +      - description: Full-resolution DMA writer line-tick interrupt
> +      - description: Full-resolution UV DMA writer line-tick interrupt
>
>    clocks:
>      items:
> @@ -75,7 +79,10 @@ examples:
>        clock-names =3D "vclk", "aclk", "hclk";
>        resets =3D <&resets 0>, <&resets 1>, <&resets 2>;
>        reset-names =3D "vresetn", "aresetn", "hresetn";
> -      interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +      /* Example interrupt numbers. */
> +      interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 101 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
>
Same comment as patch 1/4.

Rest LGTM,
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>        port {
>          isp_in: endpoint {
>
> --
> 2.55.0
>
>
