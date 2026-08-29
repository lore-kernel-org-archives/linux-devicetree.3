Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF0C41A55B
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788037416; cv=pass; b=AIfiFic+MNMSi9Cw8HOUWO9K/kN7hbn68Vj8XARnWXyIYH95saSKtz0FPtZRZf7Hlpjw0Q2Cc8mhKZn+AR5dJ92FpjIuKi7sEm1XmVBvWTwNFoJHsHk31pS/4jhD8Jxh31cxfe7vSTqX9RCM7hxrLvi1rMr1+RxIWaCkB4ngxbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788037416; c=relaxed/simple;
	bh=5zgo2ffRKT32U6AtH9tjQtK2hUKaB+w4fU97hWgGIAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9Dat5kYtZ4fa1Yvef0WAwGif8JAAbu8MJHYHOI3BShLph/uTdN4yMLnqiPNXNTzThNn8eu185yX3qWpL30YNtYzc/cTTYlKuuKlL43FHNqDAhoeGyJMSDHQP28/yoi4APPSlG3Rra1nnUNxfyWTqwJI8pBflqrWbWVv0m4HkHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKKnmrhO; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKKnmrhO"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7564b7a9490so2581397137.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 14:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788037413; cv=none;
        d=google.com; s=arc-20260327;
        b=DhWL5dJmJq+R5q3XfwmUi+EZw6gRCKEanjuTJVpv1ucTmmreRGu0OrWiAMrnPkBs56
         ave7InMlLuPGbPkto5J1h82wOV6dXcGGf7whhIqH6mwIlrMFGc+K1rhxNvwiJkYBUUM/
         Mx28Rb02zCFTTgu3Gfq82lwxruTpSBG2gft+J6A1N6uqAbEvTHpXrp19I3z+1ErFma0q
         5Cro2o7NbA7KoB0HkodDJ15nE458+zXPcEoEBgFHPogCK07BY9wpJnjJ/MjOT8ym4f+v
         hyEIzIYTh2jFKGtwlZIJ8Ey9E9l12paR5f81L6koBK8+rxdpvI0rB6wLSyzTvjWiKrkF
         x8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/XMurdfstMy1OBIHxuK/4vMtORv6ChBcNBL6pfYPlMA=;
        fh=hxGOAqWzzMcgB8zKQVmuQXleZZ5illsGEHLnQjyU6iU=;
        b=Di092iPRSFME1K8NYoqt2aCUP1DYCdNdaP5y7qlOwhob5mz2jIIiE+zTCDP1k6j59t
         o3i4PyZLtZj2FJeRox2JZfqyjsc1U7FnlKzgjDF1gIqsNnuw7SCx99k9lLwTUCbwO8VU
         9GyzcLTKu7CaOvgAinxUqlnq52vSVLQ6ruOWwUrDxVDQ4gZ7/UjLdrGfQLb0I0+7Hm4d
         GURknvamT/QknymXIVLcXNbrqs2aKE6pCgYDBPwWvbEjVACdRCdcxA7uw/aejtJUnBZL
         1DuYE6XJAZFGARVL52UGx+vdM+gVA9ITIA/zmVH2yhzqlcVuPKPusMkkEoZGcgujXgOz
         Nbdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788037413; x=1788642213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XMurdfstMy1OBIHxuK/4vMtORv6ChBcNBL6pfYPlMA=;
        b=RKKnmrhOsVZ5e6FUWfNj/J1hCm3ovoqrIM2ozRQM7ueWnHKhSFfGgceMtSw2SjPh4k
         72Fsy2c9QEZXbFEBKFKeGKYe2AYZO2tYhy+s6fFbClW6LyVXt57/EQwLCD3epn7vvE0W
         2H0vjeht+vKzRJYJBGPpuPCRnz6wff0zf2Hv/z97pQF9m7EYeeYoUAB+xEC1hJWOL7K1
         LNoAJFYueSYyu1VEwXHCrQT0/RdEwUxu1wtgQohBcsJt//4PYI3Q4V4mr8UITEcrlQhK
         ob4vxgoyawKs2dIFmLFRkZCSTorn8BSTDx0HvdnLRTO4syYPPhbItltprhYB8Mgj/g2+
         bz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788037413; x=1788642213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XMurdfstMy1OBIHxuK/4vMtORv6ChBcNBL6pfYPlMA=;
        b=NVPiW1V3nTRIR7CDxLYmOnvGNcuWHewXgB/9PFpz1I9j/JIzAN1WQqg2BDrUFvFXgU
         0TJi1WOZATD+S0TuCeMOPmGx+aQDb0yfxMoW8MfVV39FSjAgK8r+uIZ9LwMoqNBEz+rK
         6wDJ1z2tpadkqe8MxWklIeQw+2SnqY7xxo6ZpKHFHyWgRUQLvQpYM0c3jkrlCnx0BsAV
         Hb13UDHBP3M58qJNSxD9VbGnsW4DKoZyysB1wil/7H3MNyiqApFeQgafeOvoYy9DLZ0K
         UY1Ghl9IcphdSp5zKeMnrhlME3xgdPJPVgqkXLnn6iFfXfCdMZ56SSYglecr/V5JSi3N
         2blg==
X-Forwarded-Encrypted: i=1; AHgh+RoOrk1mv+Cpt/kj7TJbWJJvVFJ7R0XUBaAETVrirUmeqPKd07m9A4tU7cn3t2O2gIbFaAM+87XxYGUC@vger.kernel.org
X-Gm-Message-State: AFuF++kCqhutvCbd1XcuNmSGmjYLg4HEHUe+AP2LH2RD5UMJS7MQNnd6
	o18LQW7X4H7hniMNstsEiR/MAQ67mDd6nSOhAYw71/iRaXs1G+H6ePD30uL2dr/RRi2CalKvjrx
	eNnxooaL408w/7od02Uy8L8t/KZ3G85c=
X-Gm-Gg: AR+sD13FRSN4mHrYbTKVmZMEddO+8QsB2l10XkQBadDWb7Jn4YYNiNg9XJUr5ZOhqwb
	OQVuFE75D7A8cGdAGgxwmt2xgfceoFV1uKJzT26M1JE32svB/nf6FVpjseDeWMoxkbycCWctBsA
	ST7Sgo+KQ4pVTnEwpl00sEKJfRR9yUiH1Y2sfKzt4rXstdCwq0nk72HDQGLYXzygSWNgLyfVX91
	WZmBjxq2ce+IJq19V4LxcfPoPcj2yDSabd3KZnTGNSpUNIiWTEONoL157ooXpavk4vTxUwM+JWm
	zhyHeS85riyLzWmuGdb/2aJqKNgnXtiTC27rpvtLwLMOZQESwDMoqQa6Q0p6zENr8Rp+J8weRuF
	SDDs=
X-Received: by 2002:a05:6102:a16:b0:738:f27:43fc with SMTP id
 ada2fe7eead31-7841cb3c625mr4577793137.2.1788037413073; Sat, 29 Aug 2026
 14:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com> <60faed5e-8a19-4eea-8272-145aca3db2d9@oss.qualcomm.com>
In-Reply-To: <60faed5e-8a19-4eea-8272-145aca3db2d9@oss.qualcomm.com>
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Date: Sun, 30 Aug 2026 00:03:21 +0300
X-Gm-Features: AcwNN1VMWjJRjHRJtM0CbB9UeZyAxS43Ej93bGRg7cCVnlgW4IUM-2HfGBqUOus
Message-ID: <CAGHQT46f3wexEQHpcp_aoa4MHpi6vrtAd8Pbmt0KANdn9rANLg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>, 
	Frederic Laing <dev@fredfunk.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 29/08/2026, Konrad Dybcio wrote:
> If I'm reading that thread right, this IC is on the battery itself (?)
> and it seems to differ across different units / suppliers, would that
> be a good interpretation?

That matches what I found while looking into this. Both the bq27411-G1
and bq27541-G1 datasheets describe them as pack-side fuel gauges meant
for integration into the battery pack itself, alongside the protection
IC, rather than being placed on the phone's mainboard. So it's
plausible that different battery packs (different suppliers or
production batches) could carry a different chip variant, and DT
can't detect that at boot time - the bq27xxx driver picks its register
map purely from the compatible string, with no runtime DeviceType
probing.

I want to be upfront: I only tested this on my own OnePlus 6T
(fajita), by reading DeviceType directly over I2C on that one unit. I
haven't verified whether other fajita/enchilada units report the same
value, so I can't rule out that some devices out there actually do
have a bq27411 and would regress with this patch.

I'm not sure what the right way to handle this is and would appreciate
guidance. A few options I can think of, roughly in order of effort:

- Ask other sdm845-mainline users to report their DeviceType (a quick
  i2cget on 0x55) to get a sense of how common each variant is.
- Leave the fix as-is for now, since it's still strictly correct for
  the tested unit and the previous binding was wrong for it, but note
  the pack-side/per-battery caveat explicitly in the commit message.
- Longer term, add DeviceType autodetection to bq27xxx_battery.c
  itself so the driver picks the right register map at probe time
  instead of relying on a static DT compatible - though that's a
  separate, larger change to the driver, not this DT patch.

Happy to go whichever direction you and the other reviewers think is
right; just didn't want to claim more certainty than I actually have.

Rinat


=D0=BF=D1=82, 28 =D0=B0=D0=B2=D0=B3. 2026=E2=80=AF=D0=B3. =D0=B2 13:05, Kon=
rad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 8/27/26 1:38 AM, Rinat Muhamedgaliev wrote:
> > The fuel gauge at I2C address 0x55 on OnePlus 6T (fajita) reports
> > DeviceType 0x0541, identifying it as a TI bq27541 rather than bq27411.
> >
> > Binding it as bq27411 selects the wrong register map and produces
> > invalid voltage, state-of-charge, and temperature readings. Use the
> > bq27541 compatible and rename the shared label along with its fajita
> > and enchilada consumers.
> >
> > Tested on OnePlus 6T (fajita): queried DeviceType directly over I2C,
> > built the DTB, booted it once with fastboot boot, then installed a
> > locally built postmarketOS kernel package. Before the change, readings
> > included about 65 V, over 10000% SOC, and -273.1 C. Afterward, the
> > bq27xxx driver bound as ti,bq27541 and reported 3.835 V, 42% SOC, and
> > 33.3 C.
> >
> > Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gaug=
e")
> > Closes: https://gitlab.com/sdm845-mainline/linux/-/issues/36
> > Link: https://gitlab.com/sdm845-mainline/linux/-/merge_requests/148
>
> If I'm reading that thread right, this IC is on the battery itself (?)
> and it seems to differ across different units / suppliers, would that
> be a good interpretation?
>
> Konrad
