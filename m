Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112A3BD657
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082039; cv=pass; b=Ld1gTmeTS8kBsOgNAdJKGj9l50uxZxXtYBtC286QfNiX8E6JNI6nJXxKXXtrRtatH9atQsIoUv1iw0shCZ9fqxylbukuT01y6wrPHBAhATbA+RXEoosG0wwsfNepjgTuRoc2sAGCMkuOr4eyqdXyezod7u5LwVdsKre4Q5XvfZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082039; c=relaxed/simple;
	bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8SIXHwsWQ0yX2GZlW3obm0T1QCGwexqvzoVVYMFzAu5k5jf6bKMm3Zlr1cfrd5Rc/kAHePXEIGAEaYWtnlo0QABr1UqoOX0m4Shrb65yUoIcXqgUb1ROixx3X6cpC4MyQZTrEDXOLz4jMZzma+Q4W7eKUp3lbaoS+1KvHi2/ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JM47VE+p; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JM47VE+p"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7e1c3f47d78so68716777b3.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781082036; cv=none;
        d=google.com; s=arc-20240605;
        b=S17hGzcS+f+WiooDeNpvs89CBOES16akhJociuHvSCQLl/gNTTAZYdclZmsZ+CUGWD
         DfNm1iD1A/JiCIVs7J9tV7NkGttAtxyfFvqQ5jXhNBGo85k6DV+0jMHHrXy3ZjBB1ke/
         64KB+K73XxGkI4kThpjLV1PJsZbplfd0kPr5c6pEDURMcVsRvD+cOADqJkAoqPOihua1
         3XscpypsOgDagKCcfksSHW90bQS7FxGjhe89c26Svv9oOJzfR4Dgh8lSDPTlz/a9JHFT
         Imoa22XZ7mJZ8HYobhcAwFtLTORC7CyfQD/5fADBfA6FokoJWPqKGrXp2ApiDgp46dHV
         Re+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        fh=M6qDKLvzd1Gl6oiVqLoOVQgFom4PcsPxaX3ep8KbOAs=;
        b=QjfmBn0qUEl/y+FMyqH5DuZdmDSyMjQYb5C+c6x0hhuHUP0H/q7XdBPw5C0bTBF8Z1
         r2SEV6ApHGKln2HxLIXNozlj1Buq05OyVXTUCIy88PU/K2rnUGtGvvOeKgqNZ7ZBGxr/
         2fgHsByNinu6hwVP7QNKPeIsFIvjngvJtfOUIyJqcEenJCm2etnc2HioRfKR7oPcTwdj
         BmRoYKl1gy2X5ouQgyKQowcQa1suDek63VkWPrfQoaUBmr5cfZhkuZgyFMne6vQLi/qO
         hA98EomVEe4ks+kOWvGYzpXtVMqYktZUQspWNrViJPaEiyHWF1Kh2amtbJf5zAJOYL5x
         wRmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781082036; x=1781686836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        b=JM47VE+pTX3gw4C4IqeUOn4nmEfUkqj3BhcRsWStNB9h52+gjMyxIOyNf+XNwWLpDQ
         xnNwnQd1g/rPNmVO3tuZgcCTJynAXUyqk9C8DfRAiAp7lNy1zplysRts1mKBSDBlynrZ
         a/E0E2SfUIldDcKVi275zb6qjrMEdjHrbWEac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082036; x=1781686836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        b=m/TYM/Vhyh59rUVwAUTRLR0kIFWYasQaKQXm5Nw1UoBK1YwCNHCm5D8M8i79pT4Ext
         tX+RfOuZHeEi5SDAFj9RhQS1As0JTSQrW3IrgvJ0m2A/psXQIl3ED2Ba1VZeoJC4vtW+
         dRuGDFXVxLrduVBiNh9mzKnMTxrkJbeiKCLd37BE+OzOxu2zdyvet9XpzLn70XZXq/l4
         6N++KKoekdZmCUA6RkyPvp7h0MB8w3ndDHuLRAgIvn1o4+8RoOjgVwE6hDReUEwInCsh
         3UwbbJdsVE1bjrRIrQu7naQ/MXEd7rmwli1HmIzb+jDE4Xeq3+4LMZcretZ6CyhedZX5
         Kglw==
X-Forwarded-Encrypted: i=1; AFNElJ8N7MauIrEJcUx/7TC1d8iHLtCJpzCsiFmtiGvag79gocdUdVIljVvrtQ67cqLkrTpuW+/d2EOelmE9@vger.kernel.org
X-Gm-Message-State: AOJu0YyGJWb3ojv7jXb72LSvKVn5I9XrRZeodr2KZGnVAbX0R8GorBB1
	f1deuCt6iRFFV1C7EsAtVH1ihYOOrFNEmypOIBpoHxqtm8KaINl5usZNUkE1g661MmN8V9MzIHc
	4t0eYmmZZUFKpc6rCeVCTCKf4tLsvHKhY2ihPlHYq
X-Gm-Gg: Acq92OFjsBMlKSSbj1MSDkzgrU/JuyTYmxQLbOCCDzO5Goyd1o+D4LRnubEcgbi8tIr
	jibnGhZt/x0frxxmlACVBdLzcN/tlehPZib/Q5Vq2mhH+1xBwyYqc5eIwRuJ4iPYThrLl310cLK
	BbZlb5wvG9mzc+i8LSzK5sityENXwb4o5MUI0LwwjdodGlTWa9y0uzwcCLUpp0eNTeMSbX5e+Lu
	k5gDg8FU5k/uaJhFcq+BJxGNAYnqo9j0rDvISA6+9zsfv0QykV/N0Yi+qEXXqhbYjuNjoqy4Mwf
	5SKUWg3QSZaT5vLFTm7lwCCiTuyT/w==
X-Received: by 2002:a05:690c:6c08:b0:7bd:8d1e:39fb with SMTP id
 00721157ae682-7ed0a4ed459mr225795957b3.7.1781082036496; Wed, 10 Jun 2026
 02:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-4-wenst@chromium.org>
In-Reply-To: <20260610084053.2059858-4-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 Jun 2026 18:00:24 +0900
X-Gm-Features: AVVi8CflqNzYUTj7jVe9ENVhBouReNOK4zYnRNLDpQhNXfjJp66LGpOOH45Xjpg
Message-ID: <CAGXv+5ENxq3B63M-HnW95we+2r+WLfCLm5TZ820zWiC8FSakSg@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] power: sequencing: Change CONFIG_POWER_SEQUENCING
 to bool
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 5:41=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> USB support, including the core and hub driver, is bool, no modules. To
> be able to use the power sequencing API in the USB core, the former must
> also be bool to avoid the latter being built as a module.
>
> Change CONFIG_POWER_SEQUENCING to bool.

As Sashiko pointed out, CONFIG_USB is tristate. I was looking at the
wrong symbol. Please ignore this patch.


ChenYu
