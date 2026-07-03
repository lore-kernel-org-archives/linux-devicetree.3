Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20182F39AB
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783152071; cv=none; b=n55HPfYgxz3Pb5bhCvwd9dlMEDbbeC5zmkYMRM2yqL6fppgSrlPUdieDxFKTdDGJkBk/B9ujDFZuhhJuv1lnw41hatOcH2V5NVIKf3ceerYe9BEhKZDzMgrASWDJcDaJEBQNBAABXWi3CP1zgA9GbaxTRIZMXn14HTvJQ9gqu9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783152071; c=relaxed/simple;
	bh=Pt0KvgzaLOtI/52syeBWo/uhuDDfxiNq5+gR6yEj3NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hcPqZbxvbvWACdPPQ+q3FisAy3Cg5SXGhEoM818YHgNpYKXSeHzGsPkKAC8rWFUJ5PM9j82+lvd3gYDpq0KLtALTaLiqGslBXDjB5e501blaKd8ugwKc/II53s6OQaJXQ8MucDQt5LMcU+wYzXm7TUP/ppmIsNBt1mMYsnRIYZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NB3qv7Y/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NB3qv7Y/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1406185f8f.3
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 01:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783152063; x=1783756863; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bncZdAxiyDhHVEptV1GKmJZO/emo/e4qlZdeehgb6v0=;
        b=NB3qv7Y/q/XHEt7Vzze1PThMp87fc1r4WINGaUbvLgsg599F0vjRkRn+zBdpklQYRs
         0P4WSuO0KPesRIelpFNOwIkNd6OHNM4NHdA8NH3gS16CF/8G1PCQSaf4ryJdErDnzS5J
         h12wvISBXnkD/5j8oZDdqBLrtOPyRasy97NoV0YplQKmK+h3GAYr7WnN+xiJGjU/MmyL
         WImVtdvWSvv/AlyPyoJtJntLLkwRowWcoMZMLbUJOq3DIdW3vSrp2FHYGCYQhy9iz+U0
         BmriAYVAcN/SWWRXZqi/GvGMKuIoAU1P0ctipcpCI48ZSRPwfYmrNtChKBywR5d7gle1
         7M6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783152063; x=1783756863;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bncZdAxiyDhHVEptV1GKmJZO/emo/e4qlZdeehgb6v0=;
        b=QlxuFTe33Jpn7EBhr88ymXyxiSQh4pUU7yKLSO0ojUkbhgrHCAuMjNwpsFNBS+Rt7h
         KgXVCYoa7JNew8RCjVf7qYLHet1lZ8Jszmsy3WeG2OYx81cg+ytaxDxSGXsji2z2P9vE
         3RjQEco2gvbkP25zrWrjWeRNqugzJj6KElhxMg25zpJJ4YQcY/23wtdRaU/wK+Q+To4K
         NrYqujmmfFEITkxbwsrP8sODv2MvUR5YvvqgIRLgaXhBvjmUFKkrznnSMQj+4Eq8Dj38
         gqgVBVAN4PN4/pH+tk9PAOMvB0/olenaL4eH9As3dxz9+cxRDghPy/vY+CJ/3y9X9ib+
         sWiw==
X-Forwarded-Encrypted: i=1; AHgh+RpsknqpBgk6ULamdmNZrhUmJ3S5gz9QideLoSrd4kTZsZArJw+D1wfViLuqZSUq6T1OpOcmIF5hSLIq@vger.kernel.org
X-Gm-Message-State: AOJu0YzPtclDv6ztVP8RibgHVHXVSVKzpa2QDwkJ5RG9JOONs3c9lb2r
	RnucevrhXnGZiww9B+XTY8LRc6aQNTLdzoZKD5Jz7cSp9PLrcZ7i4VB7dM58/f3NEfk=
X-Gm-Gg: AfdE7cntsbI2wgsSPOvrpz8tNES1c34P0gEddOvF8vXaYeoXyI2GA4E39a5MnwtzMqW
	JJJp27LJVLiRAlltbS5KSGdVTe21yVW/wM/qiEMDdWEf+qEhuPitBDgV72+HSeGOBfApvmNmfpC
	SveRZPgK+MDc0OElew2QFm84i8cXtLBsULoALuaEoxaoDUvjbW7C5JG52cxhKu6WTotZh67m804
	NocOTh/ZNp4XWUgRtLhFoooU8LVOxzsuZfrBzOWMQYIQdXJm1o1yoOw5tHH/rHeeQ3RoKzrAuiy
	lIv41dEGO8Wnki6XYUamSMJDHBJI95PFNZrxEpIXubkQaNJAq9J6XN2Ca0cQcQTNxt3afWVwW3f
	ojultC2pM0mEmlCBimNFgsSQhD35/9h3OVF/zIimGtDWkA9ch9rvU0MtgOHJqrdXnq/rECjr7CD
	DfS4hKD+n4pjOWGBMLPeOHkHCZ
X-Received: by 2002:a05:6000:2086:b0:472:f8b5:aaca with SMTP id ffacd0b85a97d-47aaa60d3cemr2987044f8f.15.1783152062911;
        Sat, 04 Jul 2026 01:01:02 -0700 (PDT)
Received: from strix.localnet ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm5967457f8f.20.2026.07.04.01.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:01:01 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v6 01/12] dt-bindings: soc: zte: Add zx297520v3 top clock and
 reset bindings
Date: Fri, 03 Jul 2026 20:20:58 +0300
Message-ID: <az-AzRTTT8qfUWysHYig6Q@gmail.com>
In-Reply-To: <387ff0d7-256e-4b18-b864-37a0ec3c9d9d@kernel.org>
References:
 <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
 <20260702-zx29clk-v6-1-377b704f80c4@gmail.com>
 <387ff0d7-256e-4b18-b864-37a0ec3c9d9d@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartQJbA9XBiSfGFnWS6QAvhhA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartQJbA9XBiSfGFnWS6QAvhhA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Fri, 03 Jul 2026 20:20:58 +0300
Message-ID: <az-AzRTTT8qfUWysHYig6Q@gmail.com>
In-Reply-To: <387ff0d7-256e-4b18-b864-37a0ec3c9d9d@kernel.org>
MIME-Version: 1.0

Am Freitag, 3. Juli 2026, 09:26:43 Ostafrikanische Zeit schrieb Krzysztof 
Kozlowski:

> Also, this cannot be placed in soc. Clock and reset controllers DO NOT
> go to the soc directory. Place in it clocks.

Even when they contain other functionality like hwlock, usb phy and reboot? 
Here is the previous discussion that made me move it to soc:

https://lore.kernel.org/linux-arm-kernel/20260621-plywood-straddle-b01f0c45f27c@spud/

Likewise, what about the node name: syscon@ or clock-controller@ ? Conor 
advised me to go with syscon@

Cheers,
Stefan

--- Quoting the relevant parts from the above link:

> At what point does it make sense to move the bindings from bindings/clock to 
> bindings/mfd? The controllers are still very clock-heavy. allwinner,*-
> prcm.yaml look like clock, reset, misc controllers in mfd/ whereas 
> ingenic,cgu.yaml, sprd,sc9863a-clk.yaml and da8xx-cfgchip.txt are clock + 
misc 
> drivers in clock/.

Yeah, to bindings/mfd or bindings/soc/<vendor>. Which I think is mostly
a judgement call. Two of your devices have at least three functions,
which I think is enough to make the claim that it's not just a clock
controller.

> Likewise for the node names: syscon@ or clock-controller@?

If you have syscon in the compatible, then I think it should be syscon
in the node name as it's more general and makes it clear the device
isn't just a clock controller.

--nextPartQJbA9XBiSfGFnWS6QAvhhA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpH73obFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiNJIP/juwHA8X9RyBoj+10iQ7
1g4HaZ2WplDlaXdAXFSUIIPLnRJ1FaxeR/c67EHaFB1UhOCsxGydBunolYNm0ywm
WcWWVIwLVVEYJK1F4y7klFT+WXmxpxKy+cvUqPE8PTJVSElYKWDIeMlTEpqRsqmM
rHT8kD85FcYJOKC7LWqwsyc/SvOuG6090G8ST6Says/wbMRgOcndTSWcAOaRy7GA
hTajEqu9SWKZj9FQhh77k7y52eQO1DQroEJZHANSuy5CFX82VZdJYjIzMEBf395v
nNCDWMemXUX6Nwn6XoE8BfLcQIoqiReuwtcpqCnndeJsOnNEh7cUQ18B2h+JbBpH
Ri0Y06+3/aJxcWviyC4R1WuZxs4+8mjHRrRiXmz5oFYoO/I1ySh+ndujzDdF/lQG
63RgX+idYIgZUNq4fgVq/IpnrVC8fbWvj2XeyRA+mXUx58xWgFLeEcv2iOLux1Bi
uXgsWzLAjccxDBOKeu1589RFQAC4rnVjlZ0KTmKdhw3IkuNspUEeocm0QBHZZJD8
/R1aRtSYtfaibMbhn1Cb9lUzYmGwJoNSmrXQ0GIidNtfSjsE7CxbWm074UpAl8qG
B79r7ULixFkF5pnFr5ExarCVWt93lKOKoOTcUgtFyuBLTVduNR47qfGY2fJd1WiB
iZ8IMly+LgRwX1l76oyj/IHD
=s2ps
-----END PGP SIGNATURE-----

--nextPartQJbA9XBiSfGFnWS6QAvhhA--



