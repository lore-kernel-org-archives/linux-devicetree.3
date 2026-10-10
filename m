Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71111394498
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 22:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791672055; cv=pass; b=fIsA7c/xPAxIJ95HOpLmuCDUEYw4s/NcZAXy3bA++xHvQvqGMKIpUvAcuazUiEPoUgEMMUc/ZuOaLqOeD97+vsq4i9sJDQPj+TQFQxNt53C2QIQUNkK//rDaC0qrdG/W86LZ4yRToUnO6HYSUwvn0y8wLNfMjAiB/EBEdpcC0aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791672055; c=relaxed/simple;
	bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVT8Wt+CleTf0vwWupfKJD5Nbo4TovFnB99LTyP+a+0tWmAtFv+jN+UkWR7Uv+sxwrSSERUTakH28f8tPhf2ds5kjqS4X7gK8E1iFmIA4H9v4Lr33YpAOY3yPZliCoNXrAx9WQDSnf1n/9O/+sik1+f/QmOF2cDmYIZo9lMRv+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=hTbDXvB+; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hTbDXvB+"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-677dbe051d4so657327d50.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 15:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791672053; cv=none;
        d=google.com; s=arc-20260327;
        b=HQN8yMghQGfYED4U9zTtbY9/fBDThmYUxmsslzu4vFktr40hQL06pZjzjBJj/MnaNv
         wQIyXP0sFxzo3OHfFcV87hoYV19SwdVtUnPNlsbcPNE68KsgsTwOWO5gVtsRY2CUvmGX
         eDQ/JeI3R8ku866VSCLbiy1IhOEiHR3liRbSVV2j9xUlkCOP6DVTG1rW6YQQAoVRQgOc
         mRFPA3JvfiEmHXcmNDGHeHMs5TWUw6++lkqNi5MXxSymzIHDoEtQo5vTORKVT8FeUzIt
         aq0xdO2zsXveKhEiZyzp3rwr+ERZ3Q6efYm1tIPj28ZWVOe8RD8ECqWr391luG/j2chD
         XI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        fh=WDuMdrPyzGmlgIHbgLRDaLAOkcnrDhnsHRtxOtH4y0E=;
        b=ba7GTcCI9eGN3Y675OVmuJcOwPiLyET65nE8xYTnwIB/0MdqheZKT1TPDgb0AW7es+
         0iLZcQG5JB99w8jyiSaY9saa3JSmvPtWfho9Qg2VUXST6pTIxix1vXQ2x9+44mrPV08c
         YQKtBPG9NdjX9titFNoGKrez3aUImV9Y0vXJGRO+gDcPR1cYEHOWvIb88+hV6to4m4AC
         PZqlnFQtkfLbbHHmHsgcuP9s2SmsYZWdiazGJtDKnMZZ9gV3XucB17e36f7TlIFldu0d
         iy1HtAEbUjui/3OhRCoY0NAi/TV3Pep44/OcvHrAQeXJ4oY7ghGXu9nIV+wRf0swJT6N
         rziw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791672053; x=1792276853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        b=hTbDXvB+EroO1FpSn6zCPJhCbP3gFD8tCYQk6spnV04sD8P4ZB7CnAeyHnUWZY0brJ
         CCNyb+U8INcbxlctmvPP1Fbl6QShI5MLkUeZ7ilq1+Jm4jcXWXweJogVeYRJSMVH9vWA
         6dswFz9Har+uvJBV1NG4SDnf1ChzqAbMIrT01MvyOVt9oHrK+a8hpJrwsTYwlyT7kJ0Z
         lnUnFgGmqCa2VjrIWZtdwTu1iBtDOlq8hs6gQKKLJvIZwGEadEyALFWyPsZLUHEkVy/S
         9g2uf/C6Gaz288AxUS6rajoAcKVRYGRoFwC2bcKY+B90XfYhiOR+R7KRCrnNubF6KV6Y
         pqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791672053; x=1792276853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mEGm2u4SySep02ssBb6cSOg0RdAq/up2Jup45p2V48=;
        b=jUPHWlMJnGvnMQb84UXsnIBGTjIshI30pZk70ctXd1UF3ceecFIyPcNqqmi4kjWi6a
         vGQ0/l4PXDI4YoP4IrfJhHAh5vOsz8zyfRiJVaTiEfT24xDMzxu37HWtqbvFSQqfHi3g
         olxYCE0H74pQrIhuqJnWp9uHgmxpVoVhXdMRCRc5iTBKhb+q1pCMflutihUXurC7hPSv
         v1BMzPPRkJPYgyyO4L1LEOLNJ7vIeFrFfXaq7iNYHEbruy40ucq8gp+cqPjLFxUd1gBg
         wmzP1tYEwbgiHfe7qqnvIFZDyw7CFOK17BIUO6gamNfz79He0apmGaWWn3vQcifmKOIR
         0wvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbOTh08TgVaB9Z3xZrSZbBe9+qwQLiQqKQ6t1WHfk14N9Ga9HEoDJCdD3dbeOw1IHAOfxKiXCihc5n@vger.kernel.org
X-Gm-Message-State: AFq9FYLNlAwU/eqMo/GOvU5JGug1d5r7j2ZQawBEifciTiYrUcsGIZwp
	sEba5sW8TObgkMJBoX/qgrUI39hwJHVbZx+ol9kdOE3UvrVu6EIl9Qr8yITlVq82CzuDTqp9STF
	FlWMagfFSj3GiPWagmTM/7J32pnKbom4=
X-Gm-Gg: AYBFou0uaKz5/bcxWuKsnUS8rzVawOfzGnuJTshBJ0Q5NnksNnPX3EngOdicih/kyrI
	+ITe4QakIVFJyD8j8OyRT4GPl7pJMfEv41Gwhu1jdzTMc3gjXG8JOoEMVcPFx8mtHSjj5pNdE36
	v06XI0HrINbc5vhOj1Zn58OjXc3At0crbsaj5Meula2UMNowIGxP4KSDjL0EZEGTUIt8YrPpnMw
	wUreO7dISMB7Nzj10hkjwNYKH7WbbzNoQz9mU/8eLSnrPtNbwonUdlxUgBV1WE0nZNIDChbaxWD
	Zei7lF5sHewmEqDWh8mnN8nWbnPuMdlWoJYCbvKkZPhIdEEIrkWBbA0YL+SDrzah3eHnP3vtd/1
	5/V5Fq+UJNXnE
X-Received: by 2002:a05:690e:12cf:b0:667:e855:ecdb with SMTP id
 956f58d0204a3-67935edbdd4mr1914994d50.3.1791672053242; Sat, 10 Oct 2026
 15:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-4-tanure@linux.com>
In-Reply-To: <20261010105900.247342-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:40:42 +0200
X-Gm-Features: AclHuK8sus9eXHW8D0kCsjiICdQbyK-pql4xQRfUyDiKVkCN64EjzyryJR6PDrA
Message-ID: <CAFBinCCaAT8+YjSwg0=aFF8mbN=j-MQ=oWvfwUakVE8O-eu93Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The glue registers on the T7 are laid out exactly as the G12A ones, RX
> delay field included, so the T7 can reuse the G12A settings.
>
> What it does not share is how the controller reaches memory. That path
> runs through a pipeline stage with a gate of its own, and no other
> device has any use for that gate. Nothing claims it, so it is switched
> off as unused and a transfer that has started can never finish.
>
> Without that gate the controller cannot do DMA at all, so it is
> required rather than optional: a clear probe failure beats an
> undiagnosable hang later.
>
> Assisted-by: LLM
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
