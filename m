Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6133E45FFBE
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850015; cv=none; b=D7yTG55OA9U/6qUQ1EXTUSURY/CxQcX73eW3GapT2C28izzYX3E7L0qUopRFdmk36f9lD+6jHJgfRb1Nwj9Jv2B9DCf+IFv7VINNku1qTxKPf7Idnib7/6zljfemxQeyCkrE5FdKJ/4eLtwWR68fQzKG+gblGkuFNKWrJgtQH5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850015; c=relaxed/simple;
	bh=8785ODvlGI+w88nkKpZGop7jNiOSORDnJDRn/cyEcGE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=B0Jk4TJ4w0RvaPZf5zMFRN4iEYm8nc3zuvqmqnGvOhDQPeM90ZhtvAdgfJs5TT7NN9j/e8y9kE1l3ld4XvNuzlDdWVEp7ff1WvyHodZP12DMKB7E+IWGqz4IwjCulDdmDPHX+ulsbP44nSzijC7RFroEe3Qz8Hu7//LlOZ0nQdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BqAODNlt; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BqAODNlt"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so719008466b.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1785850013; x=1786454813; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=duKCsGugrWDv5g2IiTe0pk9T5MutZ42wqjHedhx9GgE=;
        b=BqAODNltkFtc5BfrZSYsRw5ajvhzbtPK6AqJ2HEvwd3o5ajXy8gg+eN9kKNe4jy81B
         kj0jiBw8ybvu/4OOyKVYT+93XnWtEKsLDMv2rLf2wrfOopTIKjTxQSyiJUOZG9Ye9kRw
         Ha1ufOAMXhRcWw0zp+zPCIFy7OwqDQEFQ2vPZo17f3JAYyXOnQmVN4jRE//1/XnwCL5R
         UjOqRwRolhlQzf1dE0nWDA6O1cHa4u5a9qcmyjGn8pXh9X933JIlJEhrO4fcoeYEooZP
         gGA6ovFP/n49e9/tDOLDguSOtKbUKJZVySLn+P/V7MWC81E3DW4/iiCIHAPrRdMDeK67
         RsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850013; x=1786454813;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duKCsGugrWDv5g2IiTe0pk9T5MutZ42wqjHedhx9GgE=;
        b=R4rRV5dxOnbnZG8bqzupdQIjF28gS2GHbb05zL3I+rU2Vh4UmVFiHqPqiop4FIVz8R
         DntFXhQwY0BfUXTeEuBFkgu4thW4S+BDhhzf3jVERVXrsa8JMd3hMLOa9heJgL5hU06D
         Y4SiqIlpwQg6viu5zMRToyQsleroFkx8jtbQ+Ehdu6a2e2Ho8dgPOhgPUTL+wuSj7L5m
         GjpBB/DuPGVsEm75+g22GDfr7EIeNUeKUH38SHJyNL6yyd8F4NHfOXhsvo+ZR+RGCSbx
         clEpIJb/uylGSrysAnRJQcuXotNQASAWQuTRevE1B7kzuX55xPIy4eV7s61TEvkP7k+F
         Sguw==
X-Forwarded-Encrypted: i=1; AHgh+RpZb1BMRZ0Ze33m96lIOL2zDs5YDbkyOvCBavlvhPoPJ7HWyssNNMoCUdmdy03GsoKOd8ibGEQxXqlK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy+nvOmS0o6dx0h9ru6mCp88K2Wqukidd1uHNZuKcr+FX2j4ng
	3ji82Cc+oCq5cJ+hPj+mh2FEO4CTNgiRUK0IxgJM9LsrlvVHDRRnUQ7Ic6llK/Egka0=
X-Gm-Gg: AR+sD10vVJsO18x2hA+EPn7dQjKrLZpSjF7S7wz7U3+jEAKjtO6M93G2CTWauef763e
	X9P0otFjMMXoT7CkBQrkXhKuu1RS1/JMXuaBx9ruQW+vLEuvwDffVU0qFJ+IUJCaYDNuOZAI+C4
	gYn0gm7XqHS4o9vl/IoqVKeOQ/FcGzJS8q95n9Cle9Grj6DnVciGt/8QA+hLzePh9Ydprg2gwvU
	xxG8qX9M+P+hZaG8w2NG02yt9LQfoDMjLjtTJyPg0fgQi816wek52W4QJK/pXsL6nABimZcbJxM
	BN6EUp5xb2sFBoPTRb/NLn/IbbHiREqQmtsRW+6tvGPS+SZ+yLA+tV2C/Cx8uffgl5jWxWDfUXu
	Dg8hY3K6JR7hO1VjI+1fLh2bSQFL8XOyMmGE0rT17nSJ6OLx7T6qpX6WKsCH1nWFEIy2h2sjUA/
	fIMJfzRwuN0l77N01q2jXeG2hGBAGrP443V8sC+GBvvNhqksgw9MNPk0Sz0BQOsHvMBhLeJk67B
	P1BTkgknUQX6o91JegIdYQs/UTxMDsOctOAHGQQ71K3
X-Received: by 2002:a17:906:fe43:b0:c1c:2c32:1163 with SMTP id a640c23a62f3a-c1fe7f4b006mr1435330266b.25.1785850006304;
        Tue, 04 Aug 2026 06:26:46 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c203644c62fsm9811266b.53.2026.08.04.06.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 15:26:44 +0200
Message-Id: <DKG6ZQDKN7L0.3A4YY34C315FN@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>
Subject: Re: [PATCH 14/28] arm64: dts: qcom: sm7225-fairphone-fp4: Fix
 swapped USB QMP PHY vdda-phy/vdda-pll supplies
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <manivannan.sadhasivam@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-14-5880630cde3e@oss.qualcomm.com>
In-Reply-To: <20260803-phy-supply-fix-v1-14-5880630cde3e@oss.qualcomm.com>

On Mon Aug 3, 2026 at 8:34 AM CEST, Manivannan Sadhasivam via B4 Relay wrot=
e:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> The QMP PHY expects the vdda-phy supply to be around 0.88V and the
> vdda-pll supply to be 1.2V. But these two supplies are swapped for the
> USB QMP PHY on this board, feeding 1.2V to vdda-phy and 0.9V to
> vdda-pll.
>
> Fix it by swapping the two supplies back.
>
> Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fairp=
hone 4")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: Claude:opus-4-8
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 23f950067a08..bea82cbc2c88 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -1247,8 +1247,8 @@ &usb_1_hsphy {
>  };
> =20
>  &usb_1_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l22a>;
> -	vdda-pll-supply =3D <&vreg_l16a>;
> +	vdda-phy-supply =3D <&vreg_l16a>;
> +	vdda-pll-supply =3D <&vreg_l22a>;

Schematics confirm:
* VREG_L16A_0P88 <-> VDD_A_USBSSDP_0P9
* VREG_L22A_1P2 <-> VDD_A_USBSSDP_1P2

So this also matches.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> =20
>  	status =3D "okay";
>  };

