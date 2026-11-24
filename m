Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795556258;
	b=Ka41bop2Xq8T/mTfRatJUyzwRiqdNwDVGeoYV+qljVNLvvjUIdiKvWAklPj/S/zMxTr1
	 brwHHRYzTSaC2nEPoKDtc1wDRkVrnEwNZiv8ybUDYjtKqi+23280BFn5FNtiPCw8A6YDR
	 pGghlr/pQ649/v8gYuadUC+EHLGIclFN57lc43eQkbRqQ/yjgMotFTZchVBpbohoVO8+v
	 igCE7Sh6YgZ9RE9tQbCM80TN+bg1eN3W4qIuQKOkI714RACpKGnnW07ZgJzj0bl1Ak+YF
	 hjQJvdZlgKgRkn4o88/Z7S/s8A/edFB/tZ5Y07OlE4VM8VKKMUtZPuHe9VBsZXxrlaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
	b=LnVYc3A2PbC6CLoKy1eM1ILaZitCy0WxUEwN68fY7xysnzjUWi5Q0ZZP4oTkBUJMoGN8
	 fpco49NmqO2y5YUwnDj9IYHiUZF7okfIH0rPdlWjX9FSoQkw12lAVfXfdyu4BzcgcBiqu
	 ZlvnW4dBhCWnV1DkPUNFicXcdXEMpk/IKTlhSFMzPdsibPPWaUvUFi51h5H5vAZwEbS0M
	 gODA2+q3NWZYD3SoiwTSnHNE+0Vk/gA7LKWOPAri2vBv403stcFikm8KNLoStMs36bl94
	 7bZhGzNWyW+3J3F14oDUVCbUa/jI6yfzBn+s7ERAv7N2rw10Tn7VHDlj0rOULzb5wTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="sYJc/seu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F5A606A331
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F5A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=sYJc/seu
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b503e2a87bso53929477b3.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:37:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556257; cv=none;
        d=google.com; s=arc-20260327;
        b=iIQ7cVUGcDHf/NYxKNYT4hNUFJIpQViDlVIsyglTWcyCOV3284F9hZbSFOms+EZ0XY
         sv6UDP+Y1TJ1xPqIXJMMwRWo8h4UaaehIoePtMmsSEPHsGCYhPIqwQVL20puO/lFaPA9
         zXwJyKSbxG2DRFyapVZiU9lfgD0UtU+LFqq2hcHAZo2J47CEKDbfP0vxYWEXLcGQ6aVu
         4gr7SVlCOZe/qFy9Qy0IYDdpRo7FEWYNCMveauB9LEry4so2t1+7pe7RZjN1CJV4qaa1
         wVwRE78YVWIPvQtYDpGkwkBtRSgySXseSrdcb5EOGOhzmiVDUEgIfPn4EJF+Z7Vad3ey
         GJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        fh=aR7mvcNVwi2b4f5L1AMfXSsjj4JW0guShgAu3WvHiJo=;
        b=XqwYmmmbgiC688T6xjdkrHcvPLy/XjAZj8wFcYzq7D45VqGHk4eNiTMpbNu7Eb2SiA
         AagwvX6dRy/bCgmgoLj7uR10LS8LQ72w5qjFoSmrLD+fiwsUKq2lWazpdj38RIcx2xWp
         9m0kS1TQ1VkgcqnHX6RRc3CI493RIewxb7ZMgq/rL2jfZU7XsVfx264RzaPd36Ip4rxo
         FJ1QdteC/8GLjOxVaAb+iqlkEC1TzLKUfmRhqDZR8cSAWVCKYhNY9sbt1im+0MFp9x9q
         PA0dtGrsVQhStSWF7UuQYI5MrKk7jhwMI0XEnCDWM1W/keua3hpAgrJQHvnAf9rT5xz6
         cQ7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556257; x=1796161057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        b=sYJc/seuZAL5BO9cN9PEaJyyxuoxlHALCrc+VVOvetQXWeFw4ODR8D2TQ74t6c6+xD
         svNpcZ+X0cW0uHsPShiHJTaHRNuYtgUD1tBB+seV9uBUvkSE3sDkBF5eOIlEXUdDXM6f
         8zzcMRcWlNRWnzLJJpQYYRmqekd+YjguL8ZwQQQyDAPZZvF8yEMgKxuLVvocW1sUoE6Y
         UFFUI3ywaLLPmjOHdnIir+mUH+F7ShRNJ2QYb5HGE21mdde+5G8Y+nZS9oFOU7gRk9Yk
         qlz6rq4tOrhJeI3WQTkV2SAJJVkKbHGTTEnnWRv1YJlsTqee5TbYJNG/kPp/1nEKjAKu
         kWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556257; x=1796161057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        b=Qo6Exp2TttgxYBXGq3GnogsqdqOiEL/n+ZP4hbMXyoWkBLhsVQtfxga0SNCoS3Gk3z
         EXj2mUrgvvlgmuzhISTYuABw/Ep09d5UJkd2b88xDphcZiWV6GmDx/4BBND063swyAkd
         nv/RmMZpCk3dpMd/ZUXiTVCUxof6VJ6NDayRG3Aq8WZZUEv+ZpL99T4MdIremI+mHpya
         WwTvCgrQc+QGCoCmSBdRc7zAzkBolOTSahe+OBOppV2XkvbUZFRID1c1IlVH9Nhzy4GI
         pIxbFbxQ6KTXGS/63ZZ+qVjYOOPySRI1YMznSv12eTQgOMlWj14dPbhE/brle+3GxEAq
         nAoA==
X-Forwarded-Encrypted: i=1; AL+hErExtiByOpGMXHRE8Vd9g7uHSX/S3WlCJ4WqYdkwEp4zVJVu0Q5k1VTPQV1d8OZnt3ULojZgDp+zXWGs@vger.kernel.org
X-Gm-Message-State: APuU4Z/x9e9x5uL4wEsu/ghAAf5Nc7RHEfoDBBK/OTLdScX3zn9qukYd
	UeCOwRYahohBKwRCUhhi3x8BgxT9s7eVunuFs+/OpUkT6jHZ52ifpB7vRV9QJ01ogcmmVJmazEP
	pxhK5g2DdaIbplYTlQENorw/UrQeDQGY=
X-Gm-Gg: AZFdTZeU99nbUNms0f8ZQ0l7Ngh7GGqhw+AXXeMufeoDDLcoK3SydLNgMwKqLlOjETo
	+a48GmNoBMU5VSnyfVuq6TaTrsK4LZsLIUMs9LlOVClUNiW2EIebZwPOBHw+xyu3HJgnQc9Ecai
	NTSmAGDuw07oRvSeg+8f1L1Ap8Sw/Pp+UELhXrBT4b4bAuuwaaaKDWOhDKbwWy57wGhMw6vgiNa
	W/4tqIgQI+3kkx6IKs2Gf8MaP68cB8ph0q85wSxmt/Y4chEu2oqABwfheGsBwaAaGZJnkRZxgVW
	cyCnZ0U/FNgC9THYSdUFyfvnwbKNN9WpXP1+nartSFj7dILFu7a15/9SP/6IKEjQ1Bw72dybx8u
	L1QNW5dDy7zH9mS/kqtz3DUacP9RkJFCsCE/a0K+6h/IegGf5knhbWjZNFNIXlhETczfTcQ==
X-Received: by 2002:a05:690c:3749:b0:8b4:d6de:975a with SMTP id
 00721157ae682-8b520442f78mr75631547b3.17.1795556257259; Tue, 24 Nov 2026
 13:37:37 -0800 (PST)
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
Date: Tue, 24 Nov 2026 22:37:26 +0100
X-Gm-Features: Aa3M54raaw5cpHc_7i460xpAtUuQL2U6TjCh0nslZW-bSHKd5TU4q_42SX4Pzaw
Message-ID: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
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
[...]
> +                               int_mdio: mdio@1 {
> +                                       reg =3D <1>;
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       status =3D "disabled";
Lucas, Igor (+Cc) has taken a closer look at the MDIO mux, see [0]
What he's saying is that (in my own words):
- status =3D "disabled" is unnecessary
- if you had problems without status =3D "disabled": Igor's patch should
fix it, can you please test it?


[0] https://lore.kernel.org/linux-amlogic/20261124-re-martin-g12a-mux-t7@ia=
v.lv/T/#m240f885979c7c3a84af26ee8b60d38f3092f0c0a
