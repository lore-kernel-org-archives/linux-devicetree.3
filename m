Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794538509;
	b=J9axcwXbROrGBxZCa5DLB9IIHDW5LcXNkqYNNslEpSwmUgeY4NrjYfRDQfAXOhJp1gms
	 XCmV6e/ZDEdiDbrHZ+Ml8sY/s/P5e1tMmwSOgeaBKZPyf0RtFQTzpxmq9FauG1//RoH+x
	 x4tfzeYZSSO8/JT034UHEHegFULrS8NmE1Tl5jhhRsNM15p6srK4bx1DjgWfMkfZjuvlf
	 OBcnZOZDlMo4KOKNt9Pg5ADg//HI9RRysVBZmBPGz50owobfX80xVD34GWT1QMeorTAaH
	 57qvD/l+IitvKGV9MjUDmz99WV2WY7Rb74avev93X3QqrGQ5TdF4WbX0fwaFFN2KfCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
	b=SCenMtCAL1FwVDpz6JoTHdGzrkUHK56EloABFpJyKQKr/Bs9SI+9P8K86zQVg3tS9MbE
	 4jgTKbknbtknQy2Xy4/2SNyQnNEB2KxnzFQBAgygDJWqqWLXBrUE74GBWLm2sTJhSOZn8
	 hNxTMyQUytEjINSsQTBQSNPqobKgTjTisWk33ruEsXhxG24ex3ED3x8/qX7gTz6F2S3yo
	 ncsLkrOSBfmARXLHNid9rDlzFo82Vi7y0Jhz9wPxQE5gA2DNktEPs8qEKySch1kIx0EOs
	 lwYOLhptm9uqX85+pOpVGxAVwqD2BaNGvRPBKQbCHnXiYz5CTyD5mYh1pOA6cXkhsyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cfMDacLG;
	arc=fail smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11335606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11335606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cfMDacLG
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6767d92cde6so437793d50.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794538508; cv=none;
        d=google.com; s=arc-20260327;
        b=rfIP1kuGGCfw37H0rQ/6jZXTFO1/kkPX27TnV9Ty35rIliMKwANdv7u+yORRtHwWlf
         vp+y9rNtih+oNXJnQOmHDL27GcxHjcrJ4WoLvN6c4mj9O7ZUvb2QGJf2Hua25793tJDZ
         EQmUvvRQH99CFgrzwGUtqO5K0eV7NK1/BSATa+8skOzJOJjI8ms9ZpRH3BlFoPn53wCN
         zTDtGLhjt5XitkkwUnewNhuK4i+OzWvdji5cOrUSv10XxNeBplzktFLc7wiBiDFWDcYL
         PlGp+rzmj8srtGNR9JmB+qGKcOGYPvcX01pBzkQTAy0G80ss9Igoh7Y87OTVmm+0D2at
         zyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        fh=dxBoxeHXkbXS09y5tIjQb8K4aPT77VZQQQgvRZdEZy4=;
        b=ZBrTeSRVQKNMFIEBKzAnMVVAtTh/RcrOw4pJZWVYM1T3wYYPsL1YNjIAOkHzDh4F9w
         3509gybXLNoZ/v7tvlUqzvrJN82jZRXA5Thn65au+CqM5HTosY55vUiGrt7jvJggkLfQ
         YHhO8f90hKVie51SX7/kIOfcLOtYNM2DcOlxff9eVLBfamElMlcCGm9n+zrkMMsuucsz
         DGx2QAz2vCJ52rbdqu2JgLYigg9OxC/1RFiHCAbxxMfTNKOeJ5l//3Q9R1nabU+/wN/T
         lZnTYbSPyAu3NZkKu+aPFADqkb5sFWDD2LJw6fnfa/PeJpz7iUMJtw9DiQStuN1kqQ1M
         nIGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794538508; x=1795143308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        b=cfMDacLG8z5L1KijJ6WpfqoVtMnSg7D8XZ5tsiDdz2CqKktuXLlbD7h94kpjdl1/7b
         C9aE2Mt+Vmjn0zOJ228wsa6m/1EYkj4AUAvK4/n1l2fZDAxmemJ4JmrlN72c7nlHGDua
         tkc/zZ81gRVblWv/lVLluemgBz6hCHNVaSc1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538508; x=1795143308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        b=vNJ8pXnYRkZjSG6Y88pZeGPQjg9cRvg0natFMrickTrUI9Hj3I5zlHiUWggRsCEyHT
         ORlFSojhZGwrW+lLPC/Z7wy39pbPHfaw/yFqqrDcoydaI0BpiblCgeES9Z0j+daEgQ3U
         r0L0BuBD/JXbFrQJPfKWBPyQ2iNFhNyLIVaPrPN+mFjcNdyRW+NSHV3ctgyC4p3LxZ1A
         GqApR2IzK9kTU3xGLczN969U/rNflNbUeamgln8RJytmDl8fl//i3nzGpTlnB7iXjUSQ
         e06ROqfAgb1eF62QjBscxHYbxuW7de0kcrChEWVafjanXl+cKjJG8pYt5YNE9wH7atYS
         OHqQ==
X-Forwarded-Encrypted: i=1; AL+hErFuZxU0tjkkloOKIZLE6pBgR6QrxOvv2zSJdAblZxFszaa/tqyxfIJ2aaIddAnp6cUMHiG/xh6v+6SI@vger.kernel.org
X-Gm-Message-State: APuU4Z/tN1DW2uU1mjxffq73wTJMkMwbzjQkSo051J8WSS5bnU7CAlJT
	ZbxpYwtyCWDTCh7lBo6rupomblmcb9uDl2zJ7KkQ6zn0277I4uVxut+82MkoxK9C5RGq9lttUW3
	8QB76iEedY7Nu1U5jzHNuOhl4E2169c6X3NKGpOK/
X-Gm-Gg: AYBFou3orPwHbWH/RX/X4jMvmD5KjNCMl0BCOlxcpfjepAuVhCoBAucsmBXP3vjZ+1m
	TyebUZqMcTIQuCCWSWq6nobQt5JPFTWePKITroeJGcvYaU+93CpHSll+Ack6uVtgtH53pvDea7p
	8R5C1w53I7AuRwDAl7h71KLgOuffG0u3GzrEMV7kCgar9qTGvmw3hbVmng6gTY2NMn2K2Qginu6
	DIWUEStV2jNBvhJsk+hgS4m8nTHOQbljDb6SBLTWGIvZnSnfXPkLL8WC1kBRfE0Rkb/O3hsIZL0
	ZlrpdaMHREXbZwHaEAasXmIGqh1qnfiCycaOkyM7qJqRqBFEr674UqE8Pysg6OwA/2Z2177linz
	mkEKy3XybWMQ21gwW8r4xUSxoKzNGIyyLwJ0kwQ==
X-Received: by 2002:a53:d5c2:0:b0:67c:7317:de93 with SMTP id
 956f58d0204a3-67d8976bb2cmr676238d50.91.1794538508154; Thu, 12 Nov 2026
 18:55:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll> <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org> <avZkfg6WMlMzOxpn@google.com>
In-Reply-To: <avZkfg6WMlMzOxpn@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 Nov 2026 11:54:56 +0900
X-Gm-Features: AclHuK-84j9IBFkhrVUuvk8buFltZEjB8ro1aPwuBHaC_xvB0gZrSc9m2OIxmfE
Message-ID: <CAGXv+5G5z75HGP8nv_i_nwEeSd3qkvyL_h_MYzV_XPT9BpR4jg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM binding
To: Brian Norris <briannorris@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 11:48=E2=80=AFAM Brian Norris <briannorris@chromium=
.org> wrote:

[...]

> If I do keep these as literal firmware IDs: does that mean you'd prefer
> these not be in dt-bindings/? Many of them (especially the IRQ IDs
> you're pointing at) are not needed at all in the kernel side; they serve
> more as naming documentation than anything else. I can just inline them
> into the DTS. But I'd prefer having macro names for LPCM IDs and
> similar, as it vastly helps DTS readability.

I think Krzysztof said as much when we added macros for MediaTek pinctrl
numbers. They are just symbolic names for easier reference. OTOH a binding
is a contract between the device tree and the software implementation.
And if it's not a binding, then it doesn't belong in the bindings directory=
.

What MediaTek did was put the header files together with the .dts files.

Hope that helps.


ChenYu
