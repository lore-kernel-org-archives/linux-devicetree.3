Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553211;
	b=hka6ZEa6uEbdt+mpMJntp6NDYaj461v+1rlHRdXOe/82u0Vi3yvhYAbPyYhsbekX+675
	 Tpz827Tf4wAwSiOQoELSQlo0wOnhl28mNbIYb0++FFi/EWlRpyEoBu08EvVFTe2Q6fTtk
	 ZnWl+tKX2/YnlRWZJXMyYKQezHxfPdeQpNnQnrEI23e+tOllMsBQXFySj4Ag9hQJqH3L1
	 JLyZATwU0eCOfEKAFdyDujrozEBuCs5TdCvlRvvjOuZNX7n7CRzYNFNfQgheAvHx9GVjE
	 tYzX37SzPljzmVjRmwo2cz49z1ju3wBolw/hdRi5uvHtjZczW4ZvW/KBMACwXUnE7lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
	b=S1wmHOs61cWkSVE+c1MzNEfnv+FXxg2+TKh4AVY0RM0kgBYePgrdrD61lOVb7WT22TrF
	 ZSgtxsWmZ4XQVXYPOH+t2Ry7QjkZ1GsPata6pmRAFNHpsE+7ZaSfRpnro1dc8BnNTx+8B
	 9BtdjEPofeFQHpnccP3cJ3pZuAepywxMpcOGFDGPu1/VdYaPbqxOktn5OmqYdkJe+jwYv
	 S5XF5CwWqN4AmTT8QnPC8JQO7Mlpv3LRJ2vuM5bgAQi8P48iOzy0ipEBQlJSO0yG2RuCl
	 xkOLjAag1ioAJysGWh34aYa59QpW/tCAVrLobuSWq9Yse88Dvr2M1pkMGstT2+8OO8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=GLPxPbid;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D200B606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D200B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=GLPxPbid
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4e246acc2so35893017b3.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553210; cv=none;
        d=google.com; s=arc-20260327;
        b=H2f2KYfF2VYPFQqaal/iBUIxhSIOQ6AIT8imzC73VzOzyYDWw6EmvB6si8w0v0mxIH
         Lz1xG5461fpm6Q0KDwnFrLLGOthwD85y0QPmLoDNuDBSqliJluhY3eqwcLahzprfknFK
         WuuJr4wMiqn7kB8qsUQMM5KrMPXUO26r6vnMG3fyxQR/Lnq4uuGyHz63zXQNnE7qD/ND
         xOzKImZiaXqnDYhKiH4N9pS1A2OewPrQ0Z+k1Qg/ORJsErUFalFfVVj0P1Mx4zxJMtnT
         egJ4aVw2GOrKybRyReB9pbya6TAMQmMGStrsUhX35pFMRkaV0joP3Pafh3d6Y7+0CjHr
         3Nqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        fh=mb5PRr441zvvfdP0iCndce9hjm1lwj85XnpH/HI59/8=;
        b=BWLosWZVhrRqUV8SxIJyQyUznPc89pXIeV0i3s/SxsTyhBhUVdEeI0nSgrXaPbIUm1
         Uho1AO363PrHCyHHceGJYk+s+xp6/CbKwj/zxuxlv5TGrG5Wj6HBYJ35nLXMRX4wTHcI
         rCoP9my21X0gY3fbgF3rYnOyOkXCdPZRsYNTpTcYLfhSPlstC8zC06Su5x+VkuhbWQ1c
         pigEKFmPiKsIx5PHkgI8KUI+1WFsbmnjOKXWfcEMqmiGigtwERKgv6S8bUoxrXyXqewG
         c8JzpGGq22WgU6YFvrLaFMe1Qmdx3Sau5YOSJAgSYkrugDo7QTZ1yh6a+c0vVTnxFUtZ
         2qfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553210; x=1796158010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        b=GLPxPbidss3ZjxqoA6dUrBKQsf6QpS4A2gR1m9gojSDw7SVtAKuSRUwYNvCRMEs+jG
         nBN0jqNDCwGYL7QqFGSylE2ayToGE1ORhbUOCm6a8i1C3iIJX8KgTq9pJiskUczU333B
         BU6N40yrS5xt1XSBSBbQLP2l/3m8StLo9HWeN3gqCubW3UnRJk+hNKuOFM0GlakhrQtd
         BD4j7uB1FL2ShtAp4PRnUXM6qL6yU0gIvZi/maIVBzDAymOKR2yU1xEIuuyt+1JS8alU
         nZkm2owPG/I9tRpSND59PntDJO2DqiQtU6o2hnlg6zV5MsaKXB9z3kBxjkJnTz4MdlJU
         r4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553210; x=1796158010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        b=ImIxYJKYlNaUD7JLR+bXM7C5b8sLDNRYnnLD+F/2sjnhaN1t79KfvRz8/x9R6VHSjO
         2H+MyUokFvP8eBWAjKxRz+m5pqUwubfZbdJXslwbaYj2JlFsO11bM48c5PvWQH53TT8D
         QWWh9258my+57qYTWZHe1ecTcXgiREc8jUN/MYuPALSHwWMuPeWaBKscaZFT9vND2GFR
         aESzRpYyfqNkafn/yYtyO+6IwEyBxhUn8/P6uN5BrEkfngysMZSqatzg8ncQJw8nRlTn
         kg1mQV1dpbecjN0jz1+BlRir3sSNKb+H4fhUZJN9Rpa5RI+BpWXQWZJx4/ig3fSMCd+S
         HpeQ==
X-Forwarded-Encrypted: i=1; AL+hErEVdD/2U8K76gVSd6R2Udp1sbB0JskY6HPFG9oX6pHXQEPxEq91Xtvn2HKd1bAVZIOJFgNo27M9+D1b@vger.kernel.org
X-Gm-Message-State: APuU4Z+aw7d/vJIpp7ZALpJzqdv/NwTfxc2TpKkvqoZPovWLWsq0e84W
	7zkilJkOACRJH0KbrvOql8hTdu2Mf17DxQgWGd/zmCl9zCHHvg7OaIcSzsnIq5dssRdDMfdtdS7
	vqqdwgcc6pUWcAfjPtovrEyy+wCwnd2Q=
X-Gm-Gg: AZFdTZe8d7RxldXYDVsn01U4bZ1UJ11QX731CHzqXL8TuSoHOqt2I3bEu6KeLQFEC0/
	Zr2ejmHJ0CFKz5GFS1+01aiKXfVVFARa4I7SwGskmKHHGCVD3KvubvYJvyaKEDMzdm2VmoksgV/
	QuBCzaoCuqSEb30qKbFjS+cxTFxVawUUq9AkdQms350kLqfskSXloI4UFrSjuYDdoah4CzoDll1
	GMg6ig8WIq1UgoVkSTwaFKdmkjigZRlJApXnEG1DHA9/HXQq2XlN+B56f1IgphEMPKlqdZCXooe
	e+BUH0hPF+QhgofJnhrGJDyjFlY73afXInbhOwlR/asKG62HapJmo1cGZzyeV0IHMb2c7J7gnkq
	GpLgh0hhyZlKCRYA+XDrI0I5L5v0u71bYsAAVCOSMKyaQN0VP6NZNOz5vBv3+4XqXScmY/w==
X-Received: by 2002:a05:690c:4a02:b0:8b4:c1ef:7a62 with SMTP id
 00721157ae682-8b5204e0b7cmr63699017b3.49.1795553209755; Tue, 24 Nov 2026
 12:46:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:46:39 +0100
X-Gm-Features: Aa3M54p-q6D_8aoLALfJ3nd02LBvNVydTGTGPe-SwdQ6NHwkSXTzPSzZ9Fj7tMI
Message-ID: <CAFBinCAB+CdP7ypZ3kZKKqFTqoAA5bdA9nUKkWX3fVit5LBNGw@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The SoC has a Synopsys gigabit MAC, glue registers for the interface
> type and clock timing, and a multiplexer that points the management bus
> at the on-chip 100M PHY or the external pins. None of it was described.
>
> The controller reaches memory through a pipeline stage with a gate
> nothing else claims, so it is switched off as unused. The
> glue registers share a clock with the multiplexer, which probes after
> the controller has programmed them: unless the controller holds that
> clock, the writes are lost and the port keeps the
> bootloader's delays.
>
> The multiplexer and the on-chip PHY bus start disabled: a board enables
> the multiplexer with the controller, and the on-chip bus only when it
> uses that PHY.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Also I checked sashiko's comments: those seem to show up because it
didn't see the patches in net-next (not sure if/how it should know)
