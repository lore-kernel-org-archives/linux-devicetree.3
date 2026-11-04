Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789944;
	b=GTzr0usQIc5FObKt+43ZbqdlCdzwoelNhyZgCKeYrfOnA6f9axuZIzgbOwHYcg2W199j
	 9vBhEmFQHwgLaQWD8cwNpoFf4YeK/qU3NTeC2MhUAp6J76ao+0ijNnyeGyj14RHlbMA22
	 3McqImyQcooPyPU1CdD2yR+OCD1ZkSOjR3dxwedJ8pKv1JJTlIYzPRzN/uSQQiPR6WBD4
	 TFKxvHQMSIcmroGDGpLsO9EXvZ3gCRQt9ASYx2SGv08WqnGxM3QkqxsfpM0ljAfRYV3tW
	 b4MbIck7PjGWUsvWw3QYn+ig0lGIjYJA+oWpyrkjSn93bVC7Skhryn3419UuWmNXYjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
	b=WiDOsrjP4Zk102fCDfj12FezMogExTe/zoE0mUROLYKiGd5cn4lyGbN+Fz+igMcTP3fF
	 O6X7zG7Qsjyg2dZipuXcWi7B6ZcwfNaL50K0YBd4TxOm5NGbdN8CdfWqhMfMXTbeGuvO6
	 hGXu0B1oW05G8l4bJPzQtnnbdSIovzR/FR7j9TwzXK/3Z19BcPbrseYEds8X1wumiduzE
	 SrkhKW01JFEuOD7j0IR4dbLbMTfcfuN2OtcI0LAOWUVMdV1SJCOMxQDwoh/WycQGWjVTT
	 NpWemff90kcvt+HBkJY/TeCTthJe6fHGb7HZXRplr/InZT1v3dWzDNnBzjVN3VLlCMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veHHt0AT;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB053606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB053606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veHHt0AT
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so664509a12.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 02:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793789943; x=1794394743; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
        b=veHHt0ATjkA8mDlg+Nd4K6AnUtOdd8i+sPNfn9TF2mxGCLRhq6+cTPNd0w0DYO0WwO
         qb5NtaCQGXxgo1Hh4hWWZ0zRArNwHTTyVWnTVeZg1lXMvOLlU+w1r+cPsG5P1we3Cf7w
         JSVbYA6jpjub2xiHwpEOmHOLZBEdzEXtYMe88IqmohHHYfws2Ug0seUFpcBpDz0B446E
         nSlENjNPDjTpw9Gdijhn9gHm3M1+QbVjs4ra/DFYRZqH9dAYEOBfNouTO2sNlU3HBVxB
         jE18ToGHZUWXn1g5b40KCeIxrjNEIiA5oyrGMO4UlX6HLiCc134nMAWMLECdMG5hrUFI
         bGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789943; x=1794394743;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBTgawvztyIZVheW/rAsVHtWBMGpPSBdrEb02iHgYVo=;
        b=SVuq1EwPGHJ+PyardZiJDPLa8rndI3kKET7+sfo/iiVp2O3pQxZTt1mZXoqzww5f9/
         ujGeTvqwpQqvFFfNZnl9YcHSLiFERQ96gtwBGz5dJ/nZO6ufob6JhOJCTzYUbF9BGgWe
         yj4GB4qpGMfWyEZrdbNc88wbmkScCuiY+CRn02esle1grY7rw73lBWPuC7IsQBc7KHP6
         nxUjj7zQTp4Y57UhSBeKeas1ufDs0nKC6eHFqjVLWSxoqOS24skDqE1h254KYm2b0PXG
         7tKv3LsdXzITCIGc/XBn7uGmhzvVmdpe/Ck9QQVELkoiPhrMiQTwtpVWr5koDqAhDpsr
         q5jw==
X-Forwarded-Encrypted: i=1; AKwUvBwzdOMRL4RKu6XaB6SG7x8dFLbm5u9nKI0eqIN151qAMH1LavnMQV4WCoFc70M9fTgsFYrahwaJTj57@vger.kernel.org
X-Gm-Message-State: APuU4Z8oxlrF/PQrYVLh7EtlR+W8gb/btPEHly6XzSjDun9s4cK3eqYc
	dslmgnzOuYQ0vAAOy8hSwX9t3n/STi5HUE48xNgjc+hmHWuVcy/4UOl4
X-Gm-Gg: AYBFou1rtapjlBQ15gNo72N29tBNGmd6fDC94BB49mXOeu1EFQ1mYPniwupiiNQup3y
	r9kdmxGUouL4yblx3C6g/y4bYC9A7e4oUHo3Xnqe9/r+Mp0hZCitZcKjzCXD21FTY1xwSY2MhZ8
	Ovzx9lVOYblWI4l8bmumdArTbMprI++wXCNEpkjC5AEgZ/ZOVAXnFeZVdDYtEA6NkPkBGMrOqR8
	2sI8HNG6oD/1hz3EvRUh8p7+TZvSAPD64+GlHsjk7TetrffyrDqHK0zmQTaQZfTi2yOw3q8W0WW
	KMhdUJEpCGNszMEKH0Tfjyb3T3WxMuBfBHnWMtOtcdo+hm1F036a1F0a3nKnz3Kx0YAHcnHGGE0
	lALOyHr9s1+LDlL/m/IAi7z+fCg4xBI0mUHDZRdlxFbrpnTbO7zIlvItgm6x2yTohmzRGfhNrLq
	9tjreBYWQ9mAXiuv9eK5NN8SVLrfnJqNVNa9Nhq244MPgwOdNb0rStGg19ghh09FYupnqxXOfzr
	rgNQW8YLAYvu9huT18FimUT0FsMS/b/ZDQ3g+dsyW3WNEM9lYwgQWQXU3QDyLoPpwYeu1csXwuX
	1vPZmLNp1nugArI4SvyQrSo5JleGH9zqXiBHP6w1zOqC4xYsAHd8eJEaSPyf06HzYEKTis+P5u+
	NEPxHmIbmTHPsMsDDtTMiJRDioMnn1Ac505kf5Ac4YucWUTqQZq1+qG1shVPr/mfhNR8l1WHu7y
	fRYMs8
X-Received: by 2002:a17:90b:1cc5:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae8917bf84mr9431934a91.0.1793789942970;
        Wed, 04 Nov 2026 02:59:02 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm3304868a91.15.2026.11.04.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:59:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:58:53 +1000
Message-ID: <dD3cbQkjQr2lqk83ChC6wQ@gmail.com>
In-Reply-To: <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
References:
 <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261104-strict-precise-mouflon-85cbad@quoll>
 <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 4 November 2026 8:52:38=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On 04/11/2026 11:49, Krzysztof Kozlowski wrote:
> > On Tue, Nov 03, 2026 at 05:39:50PM +1000, James Calligeros wrote:
> >> We may need to define both #sound-dai-cells and sound-name-prefix on s=
ome
> >> machines where this codec is part of a simple DAI. Allow this by
> >> refrencing
> >> dai-common.yaml and allowing its properties to be used.
> >>=20
> >> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> >> ---
> >>=20
> >>  Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.ya=
ml
> >> b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml index
> >> ab4c7d22dc0e..4ac0af34c464 100644
> >> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> >> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
> >>=20
> >>  maintainers:
> >>    - patches@opensource.cirrus.com
> >>=20
> >> +allOf:
> >> +  - $ref: dai-common.yaml#
> >> +
> >>=20
> >>  description:
> >>    The CS42L42 is a low-power audio codec designed for portable
> >>    applications.
> >>    It provides a high-dynamic range, stereo DAC for audio playback and=
 a
> >>    mono
> >>=20
> >> @@ -193,7 +196,7 @@ required:
> >>    - VL-supply
> >>    - VA-supply
> >=20
> > Missing dai-cells constraint
>=20
> Heh, I already asked for this two weeks ago.
>=20
> I do not see how you responded to my comment, dropping everything from
> DT patchwork.
>=20
> Best regards,
> Krzysztof

Given that the binding did not have a constraint for this originally, it
was my impression that adding one would best go in another patch unrelated
to this series. If you think it's fine to add here then I can simply fix th=
is
for v5.


