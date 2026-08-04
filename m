Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A745448BB4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876192; cv=none; b=KAf/lqCDCsrecjeIsaO2ekRfltPYuaWgrvxgLvlSkXbXt0TjlLyFglXuIwoGgOkA+jHk5wdXKcEXNGsnK8xFB5BU8XPZGyLInkMXbIa70I1KoDs/8y5s+YJsFRu8UppmJiP/URs/zszBH54UASaBwxKTB5Qcz1c7qPpQO/cSn9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876192; c=relaxed/simple;
	bh=1lXSScpdCh2doOtCmnBe8+bMbl0qr9639f0hca4r+Xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtFNNiIu+fHYWGtDfeov7CIvlO6gXszHn6UNNLrSVC6wXLojOrzoiclIzkCGwQ/YuDzGBBa3On93WMa/832lbbCSj0r1X3ETtpmLPsZT+3HElnQl6PXOOe6f/SjHCBpOZCU91uU6rO9xR1ZisC6PVHoAWoQY1EurJ2hJadqBo+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TYoFeYWj; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TYoFeYWj"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-96944741eaeso105190241.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785876190; x=1786480990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1lXSScpdCh2doOtCmnBe8+bMbl0qr9639f0hca4r+Xw=;
        b=TYoFeYWjPq2EknGD2nC5PAFw0Mu+cyG96xzpXiq23gMTBOQyUkDIPNkx7Byrpw4HaI
         wJPiZ7Ls3qZRJYOxWIWgcZd2hmPRtpCagJHIgCn+P8e3x/U8EQvU+BuhfoS9f5y+Ai9P
         JEzJVY4qq1mZkqc3LFqVvR+pIW5mmhDjBTjI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785876190; x=1786480990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lXSScpdCh2doOtCmnBe8+bMbl0qr9639f0hca4r+Xw=;
        b=LVgu2BJTLTdM6nlTgLwHwDfvmfBZZtEvb8V5k/oTchUDmWEQLbP6Djx9X+PIcm5Efp
         AZDiTZks5JbiqSSC29e9ZO1SKcfiek/pYvnWMvyDrW0iCWXaSOex207nuKmwYSr92C0y
         963i8tQMbbIe/naLxo6V0VHrivXE/yID3c++pV4xhF8rE6P31HX30kkaqi/Qmc9WBQ/E
         6dUM06/P627PPnYscRj1XLU+IG/e85tVJJfPHz5o2o8tLGUHMci6NVKT3qM7SA+/R6uB
         kIAu8CH2SDArhVOEbi6VSUjMII25IpUaPZzlP+Lg+YscczFepEU2Hsr55eaNAxfXcIai
         34gw==
X-Forwarded-Encrypted: i=1; AHgh+Rrg+CHks1AAtTTzUhIGiB3HR2/xkmvfE3zGeca8DU2qtA9dmDeG7yzqqR8Wn/4OR9VatfgeJDrG4/Lo@vger.kernel.org
X-Gm-Message-State: AOJu0YwTEuAuyRAmgO+Ab0rTZuRG9h93kOQ3a6KRuqsfVZEWnAmZzqcU
	/2GYcEFnJjPFmINxe0W+DrL1FjIIoQ+AssnKVhC5k6XUDOinxG0hPq0eDajQEqXFSt36ybPtrRn
	Fi0U=
X-Gm-Gg: AR+sD13ffi20ygYNtrc/eaSKZ61W29OQ2LHNUwiP+oSv3OWKymPUHW539W1Bh2D+XXD
	2xfUe/Z2mx43EL39BLaWiwR2JTno/V7DjUkPGgTSTBKZHrBQXoOlein688U5/2kuyZHVJHtPSLU
	vJhCCLpuDTdCJovCYVyBZSql5UpKVoi+4W0iDpyzqPUwPD6ye6LgwBMqnp+ZxVwXVHyFu3iMHJJ
	XySB0wF5chWd/Qg8dE6kmpKwHPamY5x/2D0OL3goG2N0ZTugM3bOLXbsNhituAnQ7Yz8O7O/DVG
	889gJWfJP2wI47I+F1htkTh+ogr8ciQuxAkiNplhpHhuBLFBQ7KA9HXmsl6KANv+5oDF1HSoWJV
	BcLbVriXdn6W7bBQpClPZOwdIqae590gNrJM6W+TVrq6aJgqFRHRjt6LFNedDOW03nS3XC1Y1Wt
	XsoBzsMbieFEqTyIhJtLo2IeEXxe6lMpGN0AETbT6oanlqVmAquPYnVUwk0nINU3wNpvZEUele6
	1+Cv5o1vZZyv9HFAcCzbtjBbbM=
X-Received: by 2002:a05:6102:4bc2:b0:740:22ba:8a4e with SMTP id ada2fe7eead31-760e8c34ff5mr379030137.6.1785876189663;
        Tue, 04 Aug 2026 13:43:09 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76048763c81sm1008505137.9.2026.08.04.13.43.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 13:43:08 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-96944741eaeso105182241.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqWsK6oZxA5kWRNU3FwOPE1YkWaryNZoIMs8cCTrtwityvGnTaU5OhL7jlw3/yX+j1i9TzerXoCcei5@vger.kernel.org
X-Received: by 2002:a05:6102:4487:b0:6cb:d562:b96a with SMTP id
 ada2fe7eead31-760ea94f62cmr396591137.14.1785876187213; Tue, 04 Aug 2026
 13:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.1.I814d768336e8de933580d467140ce340f3d4f55d@changeid> <20260722140214.GA548057-robh@kernel.org>
In-Reply-To: <20260722140214.GA548057-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Aug 2026 13:42:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XN0=C2G+6UHpR5_60hLq7xA69w-gffTd2Rx2im8owBWA@mail.gmail.com>
X-Gm-Features: AUfX_myGdVfz2qs-Flx3VihVPagrAttZI606YpODeyM2N6LtO42qgj3u1MHJjLI
Message-ID: <CAD=FV=XN0=C2G+6UHpR5_60hLq7xA69w-gffTd2Rx2im8owBWA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: mailbox: Don't require #mbox-cells to be 1
To: Rob Herring <robh@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 22, 2026 at 7:02=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Jul 14, 2026 at 03:21:40PM -0700, Douglas Anderson wrote:
> > Existing mailboxes have #mbox-cells and this makes sense if a mailbox
> > only exposes one channel. Update the bindings to match.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I assume this is worth doing (?). As noted [1], mailbox bindings are
> > already in the core schema, so what's here just provides extra context
> > and descriptions.
>
> We should update mbox-consumer.yaml and remove this file instead.
> There's only a couple of references to it.
>
> We should either just add missing descriptions to mbox-consumer.yaml or
> change it to mbox.yaml and add #mbox-cells. The latter would only
> provide some completeness as we don't have any constraints
> on #mbox-cells (there's a global max of 8 already).

FWIW, I've posted up both a pull request in git hub to add missing
descriptions into dt-schema [1] and a patch against the kernel
repository to delete the old .txt file [2].

I'm still waiting for responses to other patches in this series before
sending a v2. When I send v2 I'll drop this patch from the series so
we can track it separately. :-)

[1] https://github.com/devicetree-org/dt-schema/pull/202
[2] http://lore.kernel.org/r/20260804133801.1.I8b3ff71c528133e7d6f81fe926fa=
39e6451d63fd@changeid
