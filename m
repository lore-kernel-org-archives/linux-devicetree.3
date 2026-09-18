Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A0A4B048D
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744869; cv=none; b=Pq0MiHGzxzYyGVeHcGQAFiLEiCHNzB0O9l8BTG1orHxQyJjlwg3yx7esmXyQtCtfEsQtMhC2Cp+1TItQIp7lM0TIOwUAoQuX9+Fv/krlwbyc58yztUmsnNLJY3JxaiJ0qSpmsyOQPLi2hcesrZK4tXrBHAN8gb9cIcRvcd5WrRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744869; c=relaxed/simple;
	bh=UCOgywt/StEI+8ah0k8GYm8/I/C2yp8RVTAAhQ4Hwyo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MRWlAN4fIfTvKCDtIeFlS9gnpr0vM1UGryW7UqytbxuF3fQBXBR4YL9cgOioWeovqUSpY8k+jOQ5y8PcZowxC09OT5tREBnP+vZMijEehqGoKgeOEGeul14DOSvAEa2uBySVSpXaF7oAnKz4pEosok/JHpbEsvHNUmDUJQfXp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmrOxgiP; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmrOxgiP"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff16febfso7123391fa.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789744864; x=1790349664; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UCOgywt/StEI+8ah0k8GYm8/I/C2yp8RVTAAhQ4Hwyo=;
        b=mmrOxgiPFnEtt5N55QEkzwkEvhtWWFhlSh1OSE1NAchmYA7b1JdQtey0zb1zFaJz33
         JK9r/rbyDChNepptOi4qRoViCtT5hvDCUSUUTqe8kPtCJYklUtxeIapuOXOO3NLPESFI
         Axjedh0QUEyeO0qOppFFAtKFHTizzav2qkcWaY/gi++H1hYTY9xJRAxd5+/qPffl4Kib
         fTFqL00+InPvGYc80NxvPCKlYV3wKCic53LSU7CSGaLC9dwv5KX8XjaqVtpNm7eGvOHi
         Tqk1xDGXxG5/hdxkE/Jnvtf/1a4M8ozGk9GspMIiXtSOIcmpLPbHC6sQ7PQtEMKANOd5
         ipfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744864; x=1790349664;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCOgywt/StEI+8ah0k8GYm8/I/C2yp8RVTAAhQ4Hwyo=;
        b=UX7cCFhGYuTwPRdvlYgYf+nqfqD482tqQ4pUkhXEZERUfgf4+HZ+T3qEbOqRkL94J1
         h6/v2zHC8KfP4hn/ecDM6rgUrblXsZJE3bnoWbFMBfrRJgMwhOIvVswJdrnJ0RCwDhZa
         9WlyVsLPtBeVJQI4z6vm/U667MawN78+b72RlUHnxpdNqzNRbtIbA/NikGld4dBQXPMK
         cwyUfMp6iBqtiEyIaJB+GXdt+TWRu93HdVvY+raz3hvs9LobBPlMOnkgnbwoumeUioSb
         yBc3MIVBs1zWwTHPpwHd7tDAI7Y8PylJI2qvYMt9cDzM3rXqu/gab9yYJD7pmQd1U5ck
         MPgw==
X-Forwarded-Encrypted: i=1; AKwUvByZwjJC+Nf7fhRyVRtfJKYqwqxFflD00LYTBKE6AFcpueX8sDgc8omRAxU9JlawubCcYCXcVxGJuEsi@vger.kernel.org
X-Gm-Message-State: AFuF++l26hbEk+FyLrp/z7/TkJ822MU0y2mIdcdneNIoH8op7Kd59dOl
	DtvxCri5/R8GGxIz0lUDAF6sFfXuZ1kzatF1WOOjFIa9NHicOhuwasUf
X-Gm-Gg: AYBFou3Bc6v0sczsCkbT3Sb1U2Z6SKnSP1GT1owF2LjVz0T1BkRfz5Hsxy/mWfrMIc+
	0TH4TuHQ3ZynEgca6CMLKo4MfnLMMKNO657dJFqbMF4VSTHkKbQAvA+BvpEtf9ivS9TVfhGTALA
	zQpBJzRL83+G2yYI7gxnbveS4xQ0anwB2f5eFD3BF6JgeCIvVKdKRV9Q7h/7CSskhOjkjXN6tzC
	vSHdtCd/8PBXCKcL5u9v5xOlEfTPthugFbUtFpyJ/aTm6arFLV9oMsIV3yoRD0RkKdwnJNEnMi9
	L999End9SEk5kKFuYI+pacvObHR4CtgKkdP5bqTdGZGpWXehARawtEbOsji4toEoUFnLnY3+ORi
	4H9b/99r1KLbE8eksOemJqQfC0o1yajQHNHx7vv/mOhvCfvZud8EuNq/aVGNPvya9bQ5lwMHutK
	Sl4Vuot0zX+Ig3viTnc+5ZitTYKK1ACbDDz8uaHswE72K69RK9ushtiWATWRfYNlyeK7mITUZAD
	H25psUgoeztC53lZFWzqL2AiXBW/ABwvqElaNmryswk9KfYbBwuavs9G/YDo35djz9B5Qsyv/Lr
	pogPdA==
X-Received: by 2002:a05:6512:1329:b0:5b6:1a7c:59d7 with SMTP id 2adb3069b0e04-5b8c184c9aemr844940e87.49.1789744863829;
        Fri, 18 Sep 2026 08:21:03 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea2bsm547830e87.8.2026.09.18.08.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:21:03 -0700 (PDT)
Message-ID: <5cd6b31da1f8cbd5b004888cb0df22061fe86a2b.camel@gmail.com>
Subject: Re: [PATCH 0/5] iio: dac: ad5758: fix DMA alignment, raw range,
 offset and 4-20 mA
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Arka Mondal <arka@arkamondal.net>, Jonathan Cameron <jic23@kernel.org>, 
 Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko
 <andy@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arkamondalofficial@gmail.com
Date: Fri, 18 Sep 2026 16:22:27 +0100
In-Reply-To: <20260918122032.134947-1-arka@arkamondal.net>
References: <20260918122032.134947-1-arka@arkamondal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-18 at 21:20 +0900, Arka Mondal wrote:
> The first attempt to send this series on 2026-09-18 was rejected by
> the kernel.org mail servers, so it did not reach the lists. The patches
> are unchanged.
>=20
> This series fixes four bugs in the AD5758 driver, all present since
> commit 28d1a7ac2a0d ("iio: dac: Add AD5758 support"). The last bug
> takes two patches, one for the binding and one for the driver.
>=20
> Patch 1 marks the SPI receive buffer __aligned(IIO_DMA_MINALIGN), so
> it no longer shares a cacheline with other driver state. The 2022
> conversion of IIO drivers to IIO_DMA_MINALIGN only changed existing
> ____cacheline_aligned markings, and this driver had none.
>=20
> Patch 2 rejects raw values outside 0 to U16_MAX. Writing -1 currently
> gives full-scale output.
>=20
> Patch 3 fixes the offset for every range that does not start at 0.
> The +-20 mA range reports -32 instead of -32768.
>=20
> Patches 4 and 5 fix the 4 mA to 20 mA range. The binding and the
> driver give it as <4 24000>, which is 4 uA to 24 mA. The data sheet
> (Rev. B, Table 32) and the original text binding say range code 1010
> is 4 mA to 20 mA. The old value is still accepted: the binding marks
> it deprecated and the driver maps it to the corrected range, so
> existing device trees keep working.
>=20
> Compile tested only; no relevant hardware available. The binding was
> checked with make dt_binding_check and with test device trees:
> <4000 20000> and <4 24000> are accepted; <4 20000> is rejected.
>=20
> Arka Mondal (5):
> =C2=A0 iio: dac: ad5758: Fix alignment for DMA safety
> =C2=A0 iio: dac: ad5758: Reject out-of-range raw values
> =C2=A0 iio: dac: ad5758: Fix the offset calculation
> =C2=A0 dt-bindings: iio: dac: adi,ad5758: Fix the 4 mA to 20 mA current r=
ange
> =C2=A0 iio: dac: ad5758: Fix the 4 mA to 20 mA current range
>=20
> =C2=A0.../bindings/iio/dac/adi,ad5758.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> =C2=A0drivers/iio/dac/ad5758.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 18 ++++++++++++++----
> =C2=A02 files changed, 18 insertions(+), 4 deletions(-)
>=20
>=20
> base-commit: 08df884136f1c1197bab2a27814404fd329d9aac

LGTM,

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
