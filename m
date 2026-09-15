Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544D947AF63
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465992; cv=pass; b=hZ1PrXZ2s9kL39r1IV2GsmsmSuaFOd+k+tzcrjX9HW185m2MhPcIhWgKR/AdcDHUBCtOt5JeX3uN1svoiuF+dkJZ8clClIb2z9ioBI07/aXzQaX9NYlKBscD4XQu/gLgSFJ1yS+ymk1P61pfnoA7TWmMT/aervFIJW+kSsUFNuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465992; c=relaxed/simple;
	bh=TpVMNylx/LfnqzH4fiOUwjVx51QOsqnFyGwrmo6p0gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gV+4w2bsf5KkZy/wEYS+wgNI4C2WW+0UDHBxcR5M8HjlKth5POflTSpCQ8Z8fITfr1jrgMELXyKdI0VLV9/4USj6txOHqxfd2VutRt8qzN1nWPhvhmE1PQ1rTw5iUxeIfwLblp1kpz6rIe4c8kCTxH7zFdMUtXW4Q8qSYZutVII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzSAh5z4; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzSAh5z4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so12026885e9.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465986; cv=none;
        d=google.com; s=arc-20260327;
        b=iZy2X6S9SMJdOxbpe+7vBvdCR+0OhihVKj+oYjkyMknVRkdzqeLszLbHbcva1gz2S3
         13dV2o6Gj4vFOw3GOy15fFF4cISx7mj/IJUMJSkyje8oddrx88szXYJFWDBjIp7iFF4c
         nWmaXWY42E/OepZG6U9rzzVJmufGr5TZvBkReocyWoFcRfCZU7eonwoEsmEKOKzc8ScI
         ceZYpBlM7xqVmNNsNzllOUBAJ9CqnYJG33INdVwwqFMhioYujae0XZWsuTdm9xSbhNg1
         L/H3P8sX0NYV/eMKWonr2nFz10K4AQ4BEnKXmHrm4/Lhsp1jq1ZuOHH/gKlCdfWWcx3A
         IFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VRIRT8lVdgTRcvAyHF4oWWO/J36h42SC/PtuITyg0U8=;
        fh=WQ5/jA21nFnCd2hhkFQHUGDlc7OWmY+gkBGCz4rZ4R4=;
        b=RzV5Qm5SjhEtvVpXXEiJhD3fMn5MZ0UXdCHYRBIdIGUeVPOsoBPLwmm2xhkgjdIRPm
         QOicuIlPIaUWDMOKxGSdgK2RCH91mux42sfzVRSzrBHRys4kqDHlVpk2ssATf3cUwiYT
         UhcXQs5XWvoadCWpk6qmr6ouhH+wUXKO6xFyloFz1mCVyO8kMJFGnm8pX109sUcDMZ+9
         ek+yG1ZzlR4AkbxAvj8btXr8of7We1vn4zcV4mjiUlHgD0KnzHslJ3/APKjz5T975yoc
         fG0/rw3I61WvEqLLP/7p2FMObeFDDiwODUWDMklW7p9+Iwfww53IQbynjKEnKcpjJfDw
         7/Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465986; x=1790070786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VRIRT8lVdgTRcvAyHF4oWWO/J36h42SC/PtuITyg0U8=;
        b=FzSAh5z4Por1PRchL88s4zfB59l7JqqjNyY9lKi2FQmSUIkn3wTdZQhx1RN38gfqhf
         PTc+hcts0izlxHDMsF40O0z9+XoI6ur2ISGtCsC24FfpIqm+Ps2MTCTqadxX5fNWQM3l
         iq2L9oI4ljCOolrewfhUMhlbnn1DAD5ZsYvnahJrA6Taa2vOv1xiNWKUi3KhIAweF1gg
         Du2NxVZXDiM32MvU1ps7uAt6BVAORUE5JfH+65fpL315bxbmTWdhE5oIPe1wYSy0esMM
         Cy98sWMXxPILdXY1t3HTGohI2Gv0lsjsjSkCVcjcr4y0dJ9DdzxlP/2ljdtWp2DnpmIM
         x56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465986; x=1790070786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRIRT8lVdgTRcvAyHF4oWWO/J36h42SC/PtuITyg0U8=;
        b=bKz040L3w6hI8c25CJZorAevjGBEDnNfLqo0sX4QjeF/66Wi+hU90CcOPop66utgqe
         /1burYJxlvZP1KIIZnxvbUCDZz/weExFq6T4JdmdTFVeQqTBICdnrSv+hm3d8AKEMOsz
         ayoItFypEjXoKRlI3U2XRgbkgcyASl3P6g+UwFrNOu2PGHqmR1wMTjkITOBmk+QMmjIH
         kh1v/EUAyiGWzvybZeiDBup/jvKyz1BhiSKREQbfnmsQOWcegC+31ZRh0I5JYfeG+9oy
         zSSJnqtwvmeCzURtGReL4P4VVNs8/Mhw04/40N6+8v8Sm4Mmwa7Dlu/1+i8ygo87ctFT
         lxsw==
X-Forwarded-Encrypted: i=1; AKwUvBwX7tSKxZb3qVnZAX7QhFKcIYNh6L80KuC3vNEQpkJhrf58I9HMJ3FM0JdsxyGMdWtIKSrCNAfqG35L@vger.kernel.org
X-Gm-Message-State: AFuF++mEha8eVLCul2AEMuqktFGzPr4W6V8Mj8ENu5tu32H5uEA9Zgrb
	7mb9UotMuWcAijYptd5gpcJotkay/GMpMwUpBN3vvT8ArbKmHJ5LR7PFA/ve30J/ObODLTOw1ja
	fsxrFvG+Ln+boAieVqQ7RVSc24bl3lz4=
X-Gm-Gg: AYBFou1FP7IRFVoEMXhZq6Vx5FheMRAPXCgaCZ1hX8jLIwZRh812UHyOjCx7nHQXQLJ
	V5Nj+Txxqz5l1tvYupgNfEE+SAz2V6O7DfIz/6pWS9Z/4D30K86oswBY5obxxNR0k6odlHe6SXL
	81aC9+X698Nj05WzuveRdIKC8ijHjhvjtAYIV+QS39/tNW+QCXqq3pZTxOu1G2UKaRS/fFsZywB
	yIzDDFjVgrf6rpyG036saCKPvV4toQTQSIfMFw7yB0JomqMKK0h/o+IkDjUaRtd7DYM8pYkwp39
	F/mZBsnun6sY2Qw/F/hQ+AH0o9K1FbJkTbBEDWNFXNNAwuk+QBTLF6Gjrq7Rwrp5ZHW85+Wdnzo
	X513tD4iVjso5CJAuKtotNA6XgUIM2ii+Ern4znDj
X-Received: by 2002:a05:600c:3d92:b0:49e:6777:da79 with SMTP id
 5b1f17b1804b1-49e7a678649mr84046735e9.26.1789465985857; Tue, 15 Sep 2026
 02:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914211826.73727-8-wsa+renesas@sang-engineering.com> <20260914211826.73727-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260914211826.73727-10-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Sep 2026 10:52:40 +0100
X-Gm-Features: AcwNN1Udue3OHWdECCoWcwp7qk6bAA1DwRbc1YPBqEjPdz7MomEMSfQm-K8-eUQ
Message-ID: <CA+V-a8sq0s8x+Wrk71ncNER_MS=FtLTsxf3AK2UxrTDRqB+msA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: rtc: rzn1: add SoC names next to their IDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:19=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This helps maintaining because the numbers are easy to confuse.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../devicetree/bindings/rtc/renesas,rzn1-rtc.yaml      | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> index e96007981c34..7ea77cd0bee1 100644
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -14,14 +14,14 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> -              - renesas,r9a06g032-rtc
> -          - const: renesas,rzn1-rtc
> +              - renesas,r9a06g032-rtc # RZ/N1D
> +          - const: renesas,rzn1-rtc   # RZ/N1
>
> -      - const: renesas,r9a09g077-rtc
> +      - const: renesas,r9a09g077-rtc  # RZ/T2H
>
>        - items:
> -          - const: renesas,r9a09g087-rtc
> -          - const: renesas,r9a09g077-rtc
> +          - const: renesas,r9a09g087-rtc  # RZ/N2H
> +          - const: renesas,r9a09g077-rtc  # RZ/T2H
>
>    reg:
>      maxItems: 1
> --
> 2.53.0
>
>
