Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE9B3D669C;
	Fri,  5 Jun 2026 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694226; cv=none; b=nwobfNQb58QB6XUg+gdovuF9zfDJDpoKEB/muv4fTOXf9mYQ61f0hwficOJk67qCbo1hld/8raZmbFbF39sS49+CrO4O1/s7xpprDX/Fckea9Njp2A7bOzIuzioxIcXX0CSrlm0j658rv+mRE1E7JsnHhzmEkbOpwADmC19buSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694226; c=relaxed/simple;
	bh=2kkbFm+JxmxoNpQPiyhk2VwVKZ/+h1HH8WLe4BS2o5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NytIvGmW23tosaYeLSBYvxYP2tZSiWHlyEy0AwYGklajV8scebFONWIT65n6jf9MVzDU3+RI4W0iYxS9q8b6whzXfEHDSh+xSf0nVKrUAYas0zn2vE37buTP9Z6cqYtgL62UzxgBN02zyIwGtlhllUwfsjwFfCRtbM/CVfFvq6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=fflYfp8T; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="fflYfp8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780694218; x=1781299018;
	i=markus.stockhausen@gmx.de;
	bh=SLM9a9ShE+joMCiCcdG1UH72JT39SJAMtHPqQLXCxvA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fflYfp8T/jmfL1lua/uJjmJ8HV08fYnd9miZHSPkFCY7b4yN9v82RJ/snO0d0C1w
	 tALFyBwKa1LqgQrmd6r7DOb1krK8ZkSEubrgD857Fu9JW8paDzP/+V6JXVXu/8l6R
	 ArzHntR7mC57O0oEeeUmWyOq4K2FkHf23WVcjcpFsr5Dk4ygcUsg7uJTRq9qBwMCt
	 B4faaIBQfNd5Xdhe/7tst10QinG9D5TpK2kYJ2V/u/K+B8ZDvLY26+U6CH/H41UID
	 UBu0vt0ov9+f8sXPrKIu5YirwdsVxacP3VHYBptzgPkwE249EewJlexjPnt8XvepL
	 aalW6tGz4XVdHc68gg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2V4P-1xGFBm45Oh-014Tzg; Fri, 05
 Jun 2026 23:16:58 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	tglx@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH 1/7] dt-bindings: interrupt-controller: realtek,rtl-intc: Allow 2 interrupt cells
Date: Fri,  5 Jun 2026 23:16:40 +0200
Message-ID: <20260605211646.2101652-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605211646.2101652-1-markus.stockhausen@gmx.de>
References: <20260605211646.2101652-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MncPeWVYAatCqFOkDjSs5mNHY1Osg2jk8m8oGVG9jJC79H8xYAc
 rEBe6fUYn6SObQ2KcZthutQe6fwwX1dc64inr31cPZbUCKhvwBmJMjHXvvn1VUDc2UF0Sqr
 Ld3ZKT34e4sXX5XthaIhd2HgfSW4b9ABxXq98BgQ/ZPFwNqC/P5KX8phJwcU2olr7Zdk6uv
 b+8nb69THf0pH8xlADLGg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ALt4HJp+SGc=;phECtW9udPPIJWwryF4JImq2K/g
 VbBCaUgy9QjKXuOemtDkhcSyqyOckw4gAtDqofyLRWgF9vbeQha/8Wd8wsK2TqrfuSyS7YIIU
 hO7mJ1FVziy4dD5sRZkJzBu8XDiRAmDUBz2yrBOuxwc+1wQG01qemtlj6KJr0DelLyS8o/OO0
 Y9a7M5aGximODYJWx/7pAfOjRUhNFaLIcaAxXZ3Fm0jCaWHofUKPAGohNjw4YKLZgaxIsotf9
 d1pn9aZOJQUDU8akT1MMF58UCqFcxxh/dbhKD+r8eVPo+7TggaLd0G2PrN0v0A7kbEWGlDMxL
 TBn1qEuA2ctdruHsry5GjfQc7WlbJCyonHXmBYB6YV1ubfFFb48VIAQJ7aAMYcZ+mHmidt5zV
 B9Z5rIlvHAUtHQrxE8bIwJJIkczhYm657T/0ADiLefWydJjqw2xckIHWxIcNc3DqQfSJjsxKp
 gDoWNg728fAlNSxc0qCd4+iGQgs+WjWI8OuV42tQpYkIE7Mt1Ve18YtI6KrHj4BbNS6hF2zcn
 FYkXMWnJVlEpwbEUZa92Oxxv43zigB2eW9S7YWiFGUT1S92a+4iauP1cWIc+vH71JpI2gro5G
 T/FX7m7J3BBZ+/8ug7RlvO91JwlCWgg/9l+vqxmISM0WRhpHqeL3/FTDn2AmqNcVcRK7a1U3p
 LqPa0bLf3VdiXUqHCUpzxwjUdRrFwcIab+mxRPcswxw42P1aTDueqEjF2iR/o9zXXpE4VuN9E
 JLSwWBT93xFZUKxdETzS1oFmFOCWqKPL9OqiMKQrR4xlMRLipky+zqTirpxtdhEUGoc84srrj
 teG2YKwHiIN3VSiKr1r7BSQYBhT0MXNdI3x103tueHDXoUaVu+QNlH2wkEcWiL4CB8RqIgg+r
 BWbvXW6ONCFg314Yv4DCqcVmdH9O5UXjD8t6fybWHdiOAli9/MpiI+XyPcfc0eHYgndNZ4E0p
 0ttbMdrnByNn33AmpbZiBbAXnh+3qd9QGgIAB+DTx0UWig6X/viHHJZkiFvkwUfDmNVgrfR4G
 jf8kZUyiNfNREkjAyBY2wUcM27Fusw4rc1Qzk4McmAi7qYaN4PuJkZ071TRMtmhg6RYL/cs+3
 vRnxkGBCKKighvcXIQBTnuwdvdaWDiSgN8R2X4TV9fblSK9PwJhGqjwJyPCRYwk9KrDoIF6Yy
 KUs/SoBfNcTqopFTt3zFNEBf0X+0DNlFN/13/AkTNeP8gZH48p4RQFfXr/hNQ/lDtwiagOpn6
 ph70FWCftxiYZO3Jccai1lJ4kJ16kl6gn3UaCKzoe8Ar/fgleJssrwJpyi2A1bMZj0FlnIpsh
 RE9FWexpNF1HCsk/+lhbGNSLXtI1BuL6houW+ZFgFOKktUGHr1mOiiiDsmInX6Y4/72lC5cGe
 BvmSHClyiB5ufBN2PWsI6sNOhOelEXuHZff6hnrei5UHZbEH76Qe8OJuIFyMaGqgQmo2XBK3I
 MWPe7ruc4CbpIKnyXtPXFP053quCiJmQZRnZecxjTie4gwsmzrQLqhOM6b9RLZdNbj85cG37K
 sDdgYqKJ+9RLNSzwlfzhLlEk5E6WbMvKbC+z9yi/v0bw39k1glUChcpTJWsrEpf+kcttWlBnJ
 sp6WtUF1cJ+agP59nLMUBvsa5iA46wmeeeQJ2BuN91n6MrNraPkMC1kNpIcz0Lg7rcaixcja4
 vNOnn6U2vHdk1lQX0BFGZ/x4Lwzed2SHHt7ECS8yU94gK4XNuNShYyVA9edFQX3fiGig44vuc
 E2EDYTYQoNhra1vtDBmTfS3fKBaizvO2yc8dK1HhDAoRFQp7wXpQBGHyv0O2V2/J0LTrX8jG/
 G7QjTzsd5pa0aCRNKUAPaxNdVsen/7tEfPJNGTQ96TOubQNjBx7QjRsJTlEYwyH7yA17CTvSp
 ouxfAz50xNqL8eBl7AMj+6lAYP2D42TUam19wP00WsfHB1UdC5Fk+QQw3nO+NLADATv3qwav3
 /n9x0/bB+StDMnJ3NXrUtg4YRdLbaVzZ1dR/BOVjcCmm9rUGPCJN+b52b2KTKCNYGZIqSZvCh
 Vf3AkncvpuLVJ07vVT7pdQ9RdDG74qF80wCGifC0U/s37nh8GOHimAJVmniuW5dUVu3Tr5dUc
 EcG+/4/SZ3kRZw8+hM2jLxwbE1IzTfLJXHchbM+aB4g2jpp+TAKXtaKQvGT7jmkkI0P7CtLDc
 23fBdR1gzWMSQVaNz7KZ8Z/Vxvu0W+uQ0WRNghXhqUaZ5F64A+PyNJAHO6T4OroztLR81uC/c
 cAhIjvbx5CzH11n6C/pOg18wFe+SUD4nx6UAIBYsuNq/LptUH9MEDMdeB+qxs0sZbVOidyWIW
 czEnI9FbJ7p6I7QhcwjCx+f9wh2V6R44/6MWJkWVZupZi2zfKnj4xQPKu775BYUKLrF2iwD7n
 2xiB/d7zkwd41ZbVYQVlZC5L2giqVEkLU6ga/i40qzcnNOnaWbTdXD0oC7cLScyToSl7+OvLI
 tMu738T9zJWFfIotxboZbJwY3SUrPYcEbfGpJt5HjWL0RSjb/ijoQq43+S3HexMnB99d7Rkz8
 70zegfqXgNSMJRltbM49YMrIclfEgbGZ20QsahTCbWOINj9hma9AufNSfmDNh77Yp2077MPrn
 nEVotCA8qznahJjUjlYyx9ImEGRiVh3UWbMVevAWpQXbWDH6blfjpK3813xLbFHgyTln6fnGy
 k+JupDAb7t/RHXnHDkeAHgVMvQowDJ2ETIVPWUUmwaBayJoZxPXALjIL9CmGudl/yU30+rOn/
 HTwJObUBxhjs5nanMzYhylTTE/H9xCrEo2tAXd5WvYnLjHME1gFay2QsfIvVkRKEk8g4QO/HE
 fXkcLWCiqIfrwdFFeLn+md3R6EhXr+YjcndUMXFhdvaOaukMuyER1VoqX8w6QWcI/0wVDdt0W
 pjC1C/nD4pwZoT4BysuQ6yJp4rLHE2QT7wHUCA3/o0sMVxNx8uw26n5IsfsLgIrOn3DqLEzKr
 2YfBctPzb6bd5ZgWe4FCbvy4syqIh4i9doQP4yYhB3FTnB+orXGDbCDdThKM+rGGA3ezhgFMP
 1CDYrnj9QoTqyMFJts/F19Wzc+aJcH7VDor6euqdpiuwbo5hd7HFkjlhxWstnScj9rn4JliDp
 0sFtSvWXfYNvyRofqEG0MSZQiJ+Owm43MYaE2js3n8OrNhLUhgDZjzNu+7+7wpScPbCM0HCCC
 nT0jJ2c8/cKE09J7+VibjccdMrf+neIs8Xu5RoqdgxMu9E/RpSbPbAi+VQCoXO+52J5iyFWc1
 Fl8Exgecb055M8B16nVGKvcfGF/4nZJFm7HFcDyo8bLQuA48IvPJRq1DlE5+I7YCDzMF2a3yc
 yTF6DX2VsWJmad+XrXs/xlRdCIqI1c8hExXmSgeDJ8AHNta/UWJ2imO39hAdLZmQKr6tI9IR0
 nWwunEqwiX1YHDtTckgyY2Ws1yPSsH8B16nCB8Jit7e6ovGT3rWPxLZbLc5QfnWr5Z4BG7FrP
 D1uK1AltH37/C54Ju+0nrhRKBAqCSdTOyOpyTyoVqLP0nNMrd1JqLeWE6hpAPSKh43PeLBtKm
 ZVpxIyfeIWrL1n60TbgQKsgxBwHq9ypzeo/XV1lte9NtCLpc7x2WfX/wVDHoIOC9IgBY602uG
 faw4oUdK3mnEn9FYykzdojpynD3SZyfFitdlWpk+15pA3MIYbAyBaU4GL7mHC2J9VNaUvMDdB
 7mpmzKVKT4Ss0e9iHhVGzw8vLvXpTqPeUh7RdVrGJmNabNXHdHh/ElzjehNDs46wWbbM9sNxl
 zuOnCr0xVrujCpVxmV35EPDVzUZsxDuG4o8Pz8ZHG5kVQKM+GYQ9ee2USxvawe/0D4br2WYWq
 wkrf3PFy8hHVFclCEER8Tnb8EgYC4UllZl9DqGH7lGd2KoygXhUazHz/TQ4C2VCsWkA+6cyze
 xZQvQi0yQMFJehXM/Wr/lvs1c6XO4lzbCqfTJ72FqCS5bUMNvC3gVUYTlKZRaUnaZU2cJ/7Z5
 4Wnec0ahv6BO5EDiBkPmiWcepfBHfugk0FygqIgWdmB8cKcb630/45/4pZ4YWMeiM8pTZ7sMd
 04+wQu2Yt7Wh7EJnvvS7Xd+9Um+RIypl4859x6S+4f9D7nWWL/2s/DTpFm+aEgMQ2fWCeZ40T
 xGv9ryuEon7bMxPHETQZw0K3lpYvnMhLpLF+U/OZpG99jRfETGvnpirWx6+93YPYoCVqCigOQ
 SKvdlblEP2oppJkkMU6nbjCQek6M5WSu5XufkgZNTK/NqiazXCJlm7McYoJ0dxNiEet+q5eqM
 fnaGSSgeaWWbWl9UJFXy4pGq8j91EpNg5PWbMv+L2cGcK5l4JqhxsWE64YiVSl9/OTgvG7yG4
 3CBwVBLcYHh4S7CgrJ7QdXD8RiDAx4EmlCZcvffTrkpzqjYOHOjTFUVH7JB8+z6rihQbryj74
 nmx24KStOr/umTi9a4FQLOW5k2w+ohC3ZowCp3BEpGrM2vDjATb/SxfbvbC5M8EK9IaN8MJbc
 qLCi5A1GS453sucLnUjnXru5kV8duiHZM8hXQRHs+SwJB2RyhwAy+nX3M/aZ6TzN81+W0GtLZ
 H6OqMrqAWPNzCaePshD2TpKsigmjVjtPTv7UdEI4I8XFDqWuyqBNzezDLGlfPoe67WFmiZPnq
 mt9j4SU4fgfk+te8I8AYGfWWffBl+3CczZZwzHEv7kdh+KbMUR8+6vkcHnNTROlml6Q3/yVE0
 Og9VgorDHfmI9wtc3phOgBthoVFG7/6dICImpqfOAiRn0OjKzvokfEpPK60JTHwgWQvRRlEdE
 iRBFeun33UTsnF2Q3YIyRaLLpwes2Cb/Q8xKlGdbuWugMiarjT7yQiaLU7qd6e66KSymz2aOY
 Wh+xpiP38lSkMqIaiM4ly6l9kYBG3G7/mjA3SvIJ8JrdeTLxDRw+0tiPbOrNUTCvzseSl8zMK
 8YU76yYKOFWERm8TdY/UyAJzgvQl1OXU7+7EcAYOHvYPlSvtXYf3BPfqPkdNi9mW3CsBpQTgl
 VhTEnt7Xar+0y7lWssJw47wQVcoNXL1rrKMLqNX9P+7WLKm+O0xktCTofGW/96ZfldcoNYa4G
 uinXnaRxm1zhDRBcMr6iRp7Qrmsf2uewUqyYMn4on2YwGxEQMPEbKK2Mm2VijivdRWoynWhEi
 sYLPLnmfjCDM2myTK95jomB73Ge2BnKGLzx0hLJ993IvPbGd1dGN7+gipXhuHJtcMX9dgnTOl
 Q2lg4HFayHw4WNdGx5A/jfs+6KA+0dhidHayo4lfYoz5ZfRq/TVHdgkTzLvpFyXDfWScaUJWe
 Bnn7+9ZICpWIRgWra2+yTzp9tOpvGnfY4Y4DF5uULHhd1kCEpBnI57xB+yDmZacygLPtUZiJB
 ZzEqGf8B8F+IEfReWCyl3EGMCbis4QgbIB0RMQDUiAUw4/aePwGpWy+N9yQhcefJmgsr2GThI
 3wqbKy+hBrptaSNrijYqKp+3etqjbd9NOK4i5qhbTP/f1DkNjLzMM+dTVImXLtP0zDtEYotmk
 NcUqGWqkaCQMz/+YfP3PPEG1lw3nNegXtALqsK+WiJwvhqHhpSkjGM8egT+aglSPh/0UQ/vWK
 Ns7I6Z9QOvPGYgOXmBU+p3tJk6kVeIUAu8p+8bp3cG64RA4anmmmiJfE9/u9jn4ShqQQaGNDC
 PE/SJkTz46N5h0sKvU=

The Realtek Otto SoC interrupt controller supports hardware interrupt
routing to multiple parent CPU interrupt lines. To utilize this
multi-domain support, peripheral devices need a way to explicitly
specify their desired parent interrupt line in the device tree.

Update the "#interrupt-cells" property to accept either 1 or 2 cells.
- 1 cell: Specifies the hardware interrupt index, implicitly routing it
  to the first available parent (maintaining backward compatibility).
- 2 cells: The first cell specifies the hardware interrupt index and
  the second cell specifies the targeted parent interrupt index.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 .../bindings/interrupt-controller/realtek,rtl-intc.yaml      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/realte=
k,rtl-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/r=
ealtek,rtl-intc.yaml
index 833a01cdd1b1..5c52e57c6647 100644
=2D-- a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl=
-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-i=
ntc.yaml
@@ -32,8 +32,9 @@ properties:
=20
   "#interrupt-cells":
     description:
-      SoC interrupt line index.
-    const: 1
+      First cell is the SoC interrupt line index. Optional second cell
+      specifies the parent interrupt index to route to.
+    enum: [1, 2]
=20
   reg:
     minItems: 1
=2D-=20
2.54.0

