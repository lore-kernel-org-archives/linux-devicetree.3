Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765377;
	b=hSqOkeUoiX5NRvh0hCUh/dUhMKTbPm9mx3MMbmsvSrjUxksaHe2V+PfmQvNGIpfjAaUx
	 bwdv+yjpQowh5+OoJbCJWRLIi4nUuFvpCdszHWBDXziJfVtSEMmgkPq4KDsFx2KjPccAs
	 nQhF0WBBfVDRVvdhYRwlRcf2RSyFdyDYoPIdeNIU59JYSgfm6fHiDhqqz52hcVcCVdkc1
	 4t4c7SEEhr1HxDCjo4jnhzCo4t+HhdQlJMh6Gx4h2bDPXh363M6zIJl9gfUJYUz901GiR
	 71B9i4s1QODr/+50h7AKlAG+K33Vxk47KZC6yky6aV1k3o1XWxqLo4NSfkG9g7VouDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
	b=LxGZeybTFTtFqRKJgoUJORDj/pSO7Z5zfARhVDfHjkyCpcJtpEvmwS4KARmNf0qbhcKZ
	 COQWNDzZ1Tp8uLAaBuEL+g7J08XcO+MdoguNU1JykNiJ7Zm7VEmmcnjM7YdyadWMFiOBG
	 GthI+MSywVJn3AYfMjocQg5DN3gGEj/aMg8Y8b08Cx4y15SZxtLHAzR+292qYqp9+kZ9T
	 BqV5sBZK2ALS8MjMYupVC6AyOwmb5wEUXtzJxZ2uFZg/UVEsjCjq4MuNKDUyZ7GPTskYR
	 pncZwPyxZYY10Ls+UGvxebxtLwGAxHs81IesKxrA3Qoc8d9ANZ6HOVpNjHVoA2jVfGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pas+8ePt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDAA606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDDAA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pas+8ePt
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6767d92cde6so2596735d50.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765376; cv=none;
        d=google.com; s=arc-20260327;
        b=M0pifrHxaEYV/QFLPPrKlJzzcm91I1d/7/dnV6ZHxvQthwZM28k0Fp6NSEOoP1iod8
         QAZlqBiL6CNlf5XE5bR/T5BTQ46UlAZM2GDTzsKZ/dX5VGhy2MSIWf/mjSTA0bMXQ9Q5
         jFe07CAidn6pqD6YSi3W3kDxMbVf93skgHxyW3QvSRG20LqLPpnr9/yUZOmP3nJn02P7
         2te8cME97C27E+eEB2xmbE+oswPGWbkDHmUxdtVvW0vuQ/8oGA8opzqReLR4wSLmC2NJ
         dIzJn0DFqUF258eB0mNk2zV7TpTqLMit3EvBb/3vUT6q+TzohXcP/LisdW8P70W/R056
         Ef0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        fh=Vx+VZlc7t2opdcPVOV4pHRdULodtJts3smrxE5JC87E=;
        b=RxCPxvIOczf/cX5xZ4ZPlxpgs6k7wNjVnRfQx5xGvG9sRUW7dEE9mcwU6lYNpmKw2s
         m7C2fSiYLgQWO4HqMhr4x8x1ZUBXH+H8gCeFq73mNKaePXaVt0nLwaBaSauGf8MK7tzc
         XKV1n0aJWdY7qpuQO6XiaiL6FrPYt/LepkxDUR5WKkRblxUS47aStuRO+AZCtXxPPJt2
         Qe6Zt77hL2Vt6IDYMUFiwxLVSYt1zBaWpdGC7LYug9/jcw2TtoQ7hwXRSVDr5Ks9svm5
         hV4H4WuQGqv/FvaNKajk70Mg2/78/rWIUWRGBmmDlWPMM6VUzbUUb5PUl/xy+lv6vJgd
         hz2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765376; x=1795370176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        b=pas+8ePtrT3q08eC33iGkr56u7NPfuFn8YpxQC393/ikNvaz7ESYVMC+rMU7CbJr0M
         +R8X0eulKHmx/G2309+RC0B+2JSRNqkHfj4tJCBBEFcdhDtMBoknquLrs/b/RUBGV4dm
         1Bw0o9Ch2AjP3P+3QJnA9+93mjfzMg4hoR44F0Q3QQlXSkq+p5DSWZwe83zJUHANf2Sk
         FahErFkpveX+kHbTOQ4tq9i9bFlGcKKtP7iqyv6ANpkMIhgMHxj1Q4OqTTmm6mWlcb5o
         mMkX1fgPByvBYyHkAI0DxttWhyPbpZLcytpFbirxj5ffC3D1ncK1rdgVnw3Et6tCa3a+
         McNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765376; x=1795370176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        b=lsqlkCVzXj0ICUyltocPkXlq9ds1TOqOSeQ8j7dobk2u00/iXzLpifIKIatVzKc3GU
         /vaLC3TfOZj9p5/9axoV7afmfBXVIg/x2HUmogNcU2Tz1TC/5wM+NtjbCa/gGpoRqgdN
         a3TFkALfX2GnavgCsp7ynlPwh1i7NNAW9EjRhIfx8Mry9D+kLNdOEsAJhP1dWdzz24aS
         JpMEyN2qMFhugBHc+YOxPuworn7UeqWHyV1s5WsryzWXIv1+JcrM7sjYn3SuDYBTtHqy
         rvxfO1BEgKEwgkfItfmigDZogOILfvrLwRYKGVleBcYGWitfaqjk42dUAKxHeChaT5vW
         UPpQ==
X-Forwarded-Encrypted: i=1; AL+hErHgoj64CVeL2OuZdX06xMForMfNcMSuFvp6IJR8XwYYwKvfA4gBuKrzs/eB+XE+qSjM7h4ZwXYCCDh1@vger.kernel.org
X-Gm-Message-State: APuU4Z/LymrkvsqdXY+JNI1Z3Q9DIERx8hrRu5qJsbGi90EJHI/IMvMu
	3wnbwPBWTJrwpMmtg5ulixwuwkDihKbAlbOfUvZdtDlHhU+1OdSltvJSqI2TqtI6t4E/JQ5Z0z2
	SkmRMNStz6ufBgEMUYOscVi3sSO527yg=
X-Gm-Gg: AYBFou1ykdWyFOjmYvJ2WqbhY/dm/q1Dx0BROOVoWuTKojlizmmapB/TIWiBVQ/4BMg
	UTqAQH5E/xgoJ8tlCqG974BVS6FdOWt55QWsE1w03nApBEi17Tb+riRrf867qvZslakg62Ui1KE
	0QGkZKWXCRPMEgydhFOj1nvsOJ0tcwu07ZvXWP6KtOvDdwAp1MH5XsYVDMWnVBTfj2/Kjhh7whV
	eMOiJjUlDwt7oHN1EkDKfvDQGA+MC1nCopBqsyKUNoCSUTqGRAq5BsGGcGxAz5M6agaQI0xZ2na
	+QOBCToEoHrxlOe7TBvqiP0PXv+bCTXumx2dLg7APIFC50lWjyyQNB1X8aNjJ1O0IbeIwawQnKY
	E4KkOoLwwXZtFo96dFSCYFNIcCV520i6XoHPq6kt9USSbAgAwIs2uTIMelD9WMHT+qXR5XQ==
X-Received: by 2002:a05:690e:4852:10b0:67b:abb9:3d15 with SMTP id
 956f58d0204a3-67d895d195dmr3505161d50.24.1794765375839; Sun, 15 Nov 2026
 09:56:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-3-tanure@linux.com>
In-Reply-To: <20261113121852.334604-3-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:56:05 +0100
X-Gm-Features: AclHuK_UkljuS9ciZHxa_G9-g5ueKP83ug6GjLSD0viVWSMIsEbzxQPrFL8LXzo
Message-ID: <CAFBinCB+DkFDwXm9L+NYgtsUNR2F01xhJJnHN_8ydcRjcpNU3g@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
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

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The T7 has the same ethernet glue as the G12A but needs two clocks of
> its own. The controller reaches memory through a pipeline stage with
> its own gate; nothing else claims it, so it is switched off as unused
> and transfers never finish. The glue registers share a gate with the
> MDIO multiplexer, which probes after the controller has programmed
> them: the writes are lost and the port keeps the bootloader's delays.
>
> With a newer core, a clock list of its own and delays that follow
> ethernet-controller.yaml, the T7 gets a binding of its own: the PHY
> adds the 2ns, and only the receive delay line offers fine tuning, so
> only rx-internal-delay-ps is valid here.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Looks good to me in general

[...]
> +      - description:
> +          APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
> +          Without it, they read as zero and ignore writes.
Please give Chuan Liu a few days to clarify this clock input: [0]
It would be great if he could provide more details on it. If there's
no reply then I suggest going with Lucas' testing finding though
(which means that clock input is correct)


[0] https://lore.kernel.org/linux-amlogic/CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc=
1gAjr=3DFN1p+aTdumpw@mail.gmail.com/
