Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662324;
	b=KGpf29uKvlHJkAXdkmGqRuAC9dFE9Kzc7y4ydno99wP+HoFZsbB2yoXxnKAYBvyeIm07
	 1kCtU7bjmMRonEh6dpVoBZo7cUsD0iDA2wflrn/SZU2rIvlaFhwjSTYN4UkhsighbFDR9
	 YhlDdhtk2aEPrx7H5pqtxoZuubKLiyq3213A4wrr9NBYVh388kREL9LbfIbho3UMvPi+y
	 LgEf3kxfJ325FV2kgFZ1DGKbLyXEQVIDWEejUgIHGcMq43wa/6tE62+C+k/rFd2Mww4PH
	 wQXv9NtIO0VgoakaP21O2O1KiG5+rR0wL6aZn2wNjdjHxoJtBTWlfINZ675JsJ5B3Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
	b=ipCD08g9gfrgTp9kQCinOG1wBzZ9aNVYEZ4Mhw60fk3igSKLdc+xPPwyUwCItwwtLwUZ
	 d6mQlP4OOGXLirPcNnSsDbjK3NXvgQ0TyyK874cnE4fZPG0PdhfaIey8Uz63MmZGp/1gE
	 EqyBVK8Q/N8aLqZt3bwngqG2/1MMyakznFv9c5tuc5Rey70wRwKzpufzTaOPAl/cq39Uy
	 Qse9NeighmE1+khaHFsuh1Cv6N0G5lJq284Qg6dBRG8xgtCdGwI3hCrEylhwU6f5qivvv
	 39X8aLkTdlxIIVLqPrbDulO701YRgl4Dro5crjYWxXsvkG7sSXi1Aa++fReWyBw5DgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxb2Q1PP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2601606A335
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2601606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxb2Q1PP
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40f29667e6so385728566b.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:18:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662322; cv=none;
        d=google.com; s=arc-20260327;
        b=CHL4nmCptoLHB8D7COUPgQFeqBx0aNcrw6tVAcdJ3pkhYSwJwOKTv34gDw8GmyMTco
         GjOzpf++fZ3SsI1bEvAIORYrF2+WhgPcjl0lJqmXGIDTx9XWofaKFgBM1sMfgu4Za2EM
         +NIir9UeIBXIBRb/mfxvQOWKAA9STXOPq1EM2c2TY7gjBMUpbUTY10JLs34M49cOrw7H
         YNRik0E+7uAfVK3c4Fu4F3pZYreSOmqPOX/jEfwyZGm2i2HXHnOw2dRsso49J4Lb1Ll/
         dI+HfKcxoLBFTQsX/usird+GrXLyS2lPw2lGOswiG/fX6dTMPBPdz1NnnqdCzMDMX7L2
         Ujiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
        fh=+1h7SXQ5DHmI21+Yvraf6m2PAXvkxbyN0ishmZ3r4eo=;
        b=D1hMnJhkSOp0/fyfPpUHX8JADrPLzBwo272i+QhiDx4OsFhfSI+cunuI37P/cyHnG2
         w/DWKs2hr2f+7iW6kRuJsrEoqxi+Mra/4v3c16qdlA9vEEB7UR+2ZtxkN8ssYp+Fl+PC
         9OSJxWXV5VoQ2gw+6SYJEd4o/sAm1SoqBdodKn61zwDTdfS86J7dDQRoUtoD64KF3Udj
         R9UiVaJ52p22GzFDVbENeulKeVWkLkkR9inHwhJaLn5qoa5CuAS+tDVDFx1oNEmdAfcC
         lKdbCaN6KZY+cZ9jd/1ccU0+6OVNqU6TEz/YIVEypx1IPuQB9IGbUrjhq0oSPVQ2pwx0
         7eOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662322; x=1795267122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
        b=hxb2Q1PPH8JwA5KxJAt4R/8e9pXZaorE4T4mDzztW2iHtFLSPq06sGBd49/7Diz2bR
         7uMe8lGq51rNPP9uySOwpEcN4a2fAA9GIKwsmmoLlzkWnV3hDkxNzdSdFFpv75kVQpwa
         SkUeZ0W0ll0907zajhC/gyKcMzztZI6AWRywpBVK+hJes2fu6TNkdwbN3yfbEUiYlhGi
         QMs/FtRJ/RnY80cPlCHxYZ+xB7YcA2kqXUM+wpY6pEyaItbPt7RnusmjC225prR5lsUu
         2MbIyRABq3fPaNEc7KNuD6nHnFHW4ci6poFVUEek9lbc75/gnF6cvrMeddgA/DZfO1vv
         fDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662322; x=1795267122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
        b=cWHTBY/qQsYvurF8E98Yi0xjTNeIQAMTqP9I6wDuFvIDC45jgLLap28ngAwmxGrjZ/
         X6+nQGrFd2nIWW6D1HpkkUJxyFDpPAtyFtKgs7URR7irc+aRxb4wdKovRKeaUcr/Hgs3
         IttuobBO8gL1L0C89M2mZReiE8LQmQgdslhUD/l3PioGZ1NGGInnX2wdTdTkHwVkD7uX
         seal3QMyNDliywFGJ89sRQ3340oYpoaPRgYbitLXD6NBgLt1fjLhjNd8MJcVdnA4T65a
         4MuKJpRh1RecX5VRrRYSEIbX+DrZJFuAHOosDTZkPjgrWB23jHOZbPiRZ1xu2hCe8swa
         gzRg==
X-Gm-Message-State: APuU4Z/cgOaslgY3NMa8DdMjr7G+sq3zHjSJFn84VyERrHI391GW6+aZ
	FLpfi9dzPArN/rKA1Yj3/JXGopmRplN7SNdis6Rls0mDvmxdjRxz/sgBbdAI53vdaIRDegiy/9d
	UX/5bmzV7ThDZpsM57DLizyzPQdOKan4ErA==
X-Gm-Gg: AYBFou1yjgomC0zHCYfD2iD00PvYT+hOCOVFy22nCsTifz2fyxfqV1pJblMYGERDpM2
	DNUo0yVDt9cdAvbTD7jNjUKG/rAS2oxpgaw3XyuhpU5g+J7CubMXLhFVsOjC5ohl/wr8oM3KC3N
	9q/FG/I4eM30ouIM1pbDHlkhGBZf5eNQwPPx5sjTRGzT/GAbgLcT/Ej3bNG7Q6HAcZnZ9DzZsFS
	Y9VM+LDV75aV69zwXzjXsN+mYZPAI8BEuXgw6LztpcZSSN27Glf8G3C+OHIz4pbZGmLqcAjtvQH
	Rk1UOaX6F/eDcIY//frxwDGxZMoA3wGH7VVzNgNh10j+X4x+NGvQVVEo6enFoQ71OZcTAg4qZoF
	P5m3FFtns5l2ZvMzoNqTiYTp3vc1X/1HRq0VBeg==
X-Received: by 2002:a17:907:60d3:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c50968355eemr493838166b.48.1794662321796; Sat, 14 Nov 2026
 05:18:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-2-a.shimko.dev@gmail.com> <sashiko-outbox-214381@kernel.org>
In-Reply-To: <sashiko-outbox-214381@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:18:30 +0300
X-Gm-Features: AclHuK8H_C_3YSuNOFdtrgvuWk2DTznaljzjLDq-5of7gWhmdigWJCNEeRSV-sc
Message-ID: <CAOPX746fNHakC7O-scwkWTTvgovmbqvMLxbBszQr3vQyqn-8jA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Medium]
> Does this leds schema pass dt_binding_check or enforce the 0..2 LED index
> limit?
>
> The leds object omits additionalProperties: false (as well as
> #address-cells and #size-cells), and ^led@[0-2]$ sets
> additionalProperties: true without a compatible property, both of which
> fail DT meta-schema validation.
>
> Because ethernet-phy.yaml# is included in allOf and already defines leds
> with ^led@[a-f0-9]+$, leaving additionalProperties unset on leds allows
> child nodes outside ^led@[0-2]$ (such as led@3) to pass validation via
> ethernet-phy.yaml#, while reg under ^led@[0-2]$ only specifies maxItems: =
1
> without restricting the value to 0..2.
>
> Either drop the leds property block to inherit the definition from
> ethernet-phy.yaml#, or define #address-cells, #size-cells, and
> additionalProperties: false on leds and reference
> /schemas/leds/common.yaml# with unevaluatedProperties: false and
> maximum: 2 on reg under ^led@[0-2]$.

Will fix it.
