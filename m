Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE1937E5F6
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272410; cv=pass; b=uVQ2libCH9yfPDu3k3rrcfNxXjvNCPnYvKdj+TylciUt2afs9IOKFWJuVNilluAYFsOrLm1fR9gUQSlQ2DhqBsxjRXk02oOwaVkxxhAiL3Xi2fcFaBEeiw/y4z7Wmo3L9gNqIMW3TwwlWNXVHfFSLqoN/bHucnpQIRFybnxqUxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272410; c=relaxed/simple;
	bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHM7VzVAs76VqgwyBTHRvU77m+rELUyfhmK3NXR19u148mU95m8lj5V9D1kNqJ00ua+c4Er/S7POcccdSh7/zLeH4Kyu3J0VICWRAgoJLnCy6YhCOOV3AN79EBKSCFBXgZwHwm7g4qv2XXFz8pekooiKTgewEA7yJpiKOVBfpdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6wBtMIy; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6wBtMIy"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c0c68aa31so42712511cf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784272408; cv=none;
        d=google.com; s=arc-20260327;
        b=bm7hz5n+nnzUgx2giRpYWGf1883jw6+NneOQrisDeZ4myBetWLV2aMvdXLzlP6Ke8d
         AWXHJkwSgo2YhJsYLeFNaBYnzDnSpsPQD5jca91uoNi9lbDlr0niPvDLOAv/U9ON3Xe1
         NIhgQFod6GJFP6SVRQAK1olLPuLnplnQuEWhmQGBUqxTpWOOnZTk6whd9UxIdWBVFANh
         iBV1/oehgKCvkcdXjK8eHwHtik43dlUerVitsDfoW+41mTG9Pfopwm5uo4P53pIkKwUV
         WQvMZV2L4p0iY5OUSadgXx+jKzUvjfjrauaB7LNQ4I5D3t5Apa0L4EgO10hF3N1bj2iz
         fZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=;
        fh=YWcELr9tnG+6lO7K/GzJCpOcBWKo/D7ZYSsvbrZZHhM=;
        b=ro8S02wfH2x0e+TQNG1rEbyrclduKuehxyTjsDG5+c2fioybxbtyRSTpQn9u99xp6Q
         GoycZVPXqMESOgJ2wqoKVXauwxxUEgWiQUt/eIT7qXr9J24i2GM34t2k6M8dtztVHtw9
         LU/zNuDko6cilnWHbewO3fz7AP1EnfjWjvrtlGsZGPHxTpn8aIyKUb6zuYvY23W2uwLW
         pastjnaBYwdPidUFZuDWeBUUW1Be+YgwDEA+CRb6tw/Do2BYgjNTarWJLy22TpqR1jTw
         1MnfjEMDaFin+Os2Lith5IOPL0Aw9YAuXrV+anPddOhHb97uFHLx9jfAxvKiCqxQcJhN
         4hGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784272408; x=1784877208; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=;
        b=C6wBtMIyGruEmyuNmGbdWg+pH3Tqc1j2HgxF3s/f3hGmjR4+0WTwu2QK/5T5NMWe82
         UIyoLG4QLQGj7/S/SovPj8rrdrGhLPc8U2HL3KlsNQttztRz3giHHLxNx9K3OkshVuUI
         ++7gIBpX+WADbaRcbvv0jy/GruOw6SOo7OnhKvuGO5QYbysVp1O8N3PNIBC5VU8BL5ie
         J4h9Pi61p8O2gxG+cq17SlUmqbZ6xgiq5BGqwGC+plLBt9lobXHuOKb5vhdYltQIBX7O
         qp9z79UfqFe0J51HWETq086sPgfFu2mFok3oQ1fTJPcgkGtAjZ+MbvQfEUFOqO7rSmgm
         gJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784272408; x=1784877208;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g9+oyG6jqj4Pqj8nJndEWPVlC24dF09myG8cBJZ5TrA=;
        b=WMF1iEDWd04qVSNK1KBOdMAciNZKuiAWN9XDWASdbIlrrvVcoG4Rcl9LY5OIRHHH9R
         Rjz34s4PzspiZxjLD/wg+UFG6j2MX7Zty5aav3RkOZ3GD3TGB8fBX6eLSDo6JBWKtxQl
         uiNQvcve9jo0eGQI1RVlnhStZFUbEYfze4crkvpwCP9I15SMeCzXvnMKsCqOU5ZQwoAX
         P7PJWfPVDiPpMO1BbH9LSrQqsBIgME3kdhwaF8kx61iGMs2lONlFg2Xpd8vvB6Ny3KGY
         Q9CBu2sFyRKsxGXqi3yKvVHxlwQn9KVaphlasXqvI9PbemJgdXihE4VB8RmZugoZff3N
         QXtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZpav16Hm7gCOupiHzj1l4qfETcl/annX+mzihguDxR0UImhTLMt9Qnas63yyiWDP/56tVpH+FhVRU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjky8GBTCkW+tah2j+fDFgIDXxEv9fECIksOehoeAoomv3McFL
	d6UwKGNnWMP/UF+mHa3ukQPDLdnVL8jDQ/MhkH7uFP4S7HSJpr7xWxvf/TXDSheQ+HlSgSVOKsK
	Z+PzKKL9gP08EtXAnQW5IMSbTEO7dS7A=
X-Gm-Gg: AfdE7cmJeAcgS3fTQN6NueqWb8bmHrFRVGKzi0DMrXus0RXfmiYTuq6tTOA5mMCP1QE
	rpIx/v+hQ/uh9382QInxeZYlkiq9bSrWaLo8Y4r2tGQ7TtfHI/K7U4HHbDNtcy881cXRQgxknDu
	b2V1yXkhb9BVFilTl0uWmdGyVmGbrEwIAGqWf9JpeKO1JLkLTz3PUahS5+MqMwtqIodlVsrcyBs
	GyMaF7kn+jxLHm5C/PFRnT8HVnaco1pej5p7PCm/bYakrDJIiYWGd+FS8PhiCWL
X-Received: by 2002:a05:622a:551:b0:51c:135a:5b53 with SMTP id
 d75a77b69052e-5213aa6e46fmr10419721cf.11.1784272407938; Fri, 17 Jul 2026
 00:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716161923.266315-1-akkun11.open@gmail.com>
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 17 Jul 2026 16:13:16 +0900
X-Gm-Features: AUfX_myw0V2Aiz3FUrMgQlgFVz4GkSaEohB1xo8heVTI4ZdFmSeFalXVsz80Rxc
Message-ID: <CAKr_iV7_k1cAMxOeE_SmR4ydTnhs9oDAaHYp=DsZ-YAPHpqk_A@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add reset support to MT6589 wdt and remove fallback compatibles
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Content-Type: text/plain; charset="UTF-8"

sashiko-bot said this patch series makes a regression.
Should I add another MT6589 compatible string such as
"mediatek,mt6589-resets-wdt", insted of changing "mediatek,mt6589-wdt" ?
