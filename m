Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E86C324B06
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777563452; cv=none; b=SgHHhpl/Ju0Q/WG6qXYNgLw91qvhkEIq0CNuwh4n9W0APpiF+wy2dppL1XMvfGAVv8EOEfeP+vE/ukmUcbyCySrKxs15j0SJXLgle3lx2R50TGVJYhiSgVFRLvhF1sqqPzwVS2mLssk4vrDaLvcr/o6GoSeeMFB/LDOn/VTh4wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777563452; c=relaxed/simple;
	bh=D8ctGVVQEch5tunpDf4+eVEVa+9ZQoaz/XYhpFXnBKk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=UiSQDqCME4elYgP2I+le+CL0ereStdlLyMZ/3gwdB2OrJibhwQfVs3we8NPARFqCO9G23XW2Z6ZljJRH497bBU7mczi9e++No+s22JvooFZERBxiRCh7iOrJ3vr8uhTtC8747QX0vNMWmzvtHffkM45aWGXXBA5kwu76ihA3iHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HipJ19fU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HipJ19fU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so10548385e9.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777563446; x=1778168246; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boh2FGqR0WpDSM6dhSTP3kihWh+3GkokB90DFYaafvo=;
        b=HipJ19fUAEq33OWW/Q5wLCcOkQz4TNsdlYRpHK2OgdU1xSTGX5gYTi5ltEpc9KxlyG
         rWk4XWAYn/0Kh4r96B+/Ml36YkDJ+KoZl6I6CQXXlNMJrozrmbIMTNO+1QiPY/+X/nEF
         lVcw3tXGvvESxcFtQOcWGO/Uy4U4Vrqs6S6WqtnN8VYi5Vj4SurG1M20D+e1RRKxAPKJ
         o3+zdVz3KxLhTRBjslmdaSOT1Lokn2xvSTEQI8JdmfGqehNzrWK9V1RRk4unKtJ1BI6/
         q3E4tQ1FrtQ7z1ZQcR0wYJpaQNHeynZrLDo8uiXFyo3AT6gokrT/inex1mKruQ1e/HkK
         mY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777563446; x=1778168246;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=boh2FGqR0WpDSM6dhSTP3kihWh+3GkokB90DFYaafvo=;
        b=cUULM2cxS1Q9fmTu6LJdJPh0H6ID8xMjGtAqMt5M7fokoFX7qmVPRpSycBAEJ8CGXr
         X9kK6oHrHGBMDqENP89d1llIMOtn0xiThM9gTP12X+ui6Tq8D/m+41wV+4xT/U/T91JI
         08VBfqwesGCGad1ROFzQO4WWdJZCSZQXISmIKg4ihEKCp3SPN63aux1d+gBvgQEo+jn4
         iSuwF3ijFVgfBbWNFLE/Txewi76FAIv2tMhLBrUDRAt7+f2Z7fdi0b2REmpabKa7W+dl
         eN6mv/6iSdcgHKO46UgOdCvr+GWPBVzfUgAZOV0NlrKlEjM/njCgQaLX8b3JMigpNvYL
         HfNA==
X-Forwarded-Encrypted: i=1; AFNElJ+DTlbp0bxL62ZeQSAle9A2I+LqEqkeuSnj+JqJComKEWTveSm7zNDEWs4wMmB6zWl38ellpL9czXxh@vger.kernel.org
X-Gm-Message-State: AOJu0YxpKogBvWDNmYkRWNV7FgVo6nTC3OkjUcvXc7ESZn2FaRhpwtnS
	NUTQjgJvPqN6w+xLwO3VP9vttw4EzT/fAGSkDWjnz14CTdzYqYhEHYXIMN/bpYEqjFs=
X-Gm-Gg: AeBDieviWfhkmaqBEprdlulDNibS58wYKU6JqF2yz9YCm5xUMqZHM27X2pWTpFfrF9t
	XPxUKuvulRvRuSpjGHP3a9iEza7ucMIciN18fmVdn2UoyRSd4Sq4X4LclMkpg7ahXf2GnzQrUW/
	iNP12FElQlW+oCXPdmmPvomoJLpaU52QTQsB219tk9e9kfKGvoYVIsEcAudKcBpvqX+03lXWgPV
	G6831p91MjhXlYdRvfDWbjTbW/smn8PMD7q6zt9K8qDtk9Q6u8ON6qpS4bJqTaLvjJXXSZciGch
	x0m41FMD0BAGrsj+MmNrYdnsHHZaiExKzU/94tQ2qzPNJAcDiGD8BIODiLohtb3RLbo3vd2Fc37
	QJWefwgplnUB+fFYHJ2T+vXpX7xi+3RZAeOdlYJsxEmwdV2SJ0CfQ7G9xo+t1sjFD9f1w/AbQkh
	/DuqSp/WDCSwH2jai9iCFk+xvGPS8KmGkolkvlHqIsL6oUp5k4DqpW/YXfA3NunzTPbjjrxoL7L
	fUiXS4EARrUo/CwAOi9Ox5yiQ==
X-Received: by 2002:a05:600c:c058:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-48a83d6a890mr42190595e9.5.1777563445839;
        Thu, 30 Apr 2026 08:37:25 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:b0e1:a8:4337:b2a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b912869sm46165045e9.6.2026.04.30.08.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 16:37:24 +0100
Message-Id: <DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.20.0
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
 <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
 <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
In-Reply-To: <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>

On Tue Apr 14, 2026 at 10:08 AM BST, Krzysztof Kozlowski wrote:
> On 14/04/2026 11:00, Alexey Klimov wrote:
>> On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
>>> On 13/04/2026 16:52, Alexey Klimov wrote:
>>>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>>>> information and configuration data. Add the SRAM node.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/bo=
ot/dts/exynos/exynos850.dtsi
>>>> index cb55015c8dce..cf4a6168846c 100644
>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>>>  			};
>>>>  		};
>>>>  	};
>>>> +
>>>> +	apm_sram: sram@2039000 {
>>>> +		compatible =3D "mmio-sram";
>>>> +		reg =3D <0x0 0x2039000 0x40000>;
>>>> +		#address-cells =3D <1>;
>>>> +		#size-cells =3D <1>;
>>>> +		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>>>
>>> You miss here children.
>>=20
>> Thank you! I guess I should convert it to smth like this:
>>=20
>> apm_sram: sram@2039000 {
>> 		compatible =3D "mmio-sram";
>> 		reg =3D <0x0 0x2039000 0x40000>;
>> 		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>> 		#address-cells =3D <1>;
>> 		#size-cells =3D <1>;
>>=20
>> 		acpm_sram_region: sram-section@0 {
>> 			reg =3D <0x0 0x40000>;
>
> This covers entire block, so feels pointless. Maybe requirement of
> children should be dropped. What's the point of having children? Why
> does the driver need them?

Thinking further about this. I was looking at the schema file and
different commits and it the right approach could be:

- add separate compatible for mmio-sram region for this case. Similar
to scmi and scpi, i'd say it should be "exynos,acpm-sram" or
"samsung,acpm-sram";

- update schema sram.yaml to exclude requirement for having child nodes
and properties like ranges, address and size cells
Similar like in commit, for instance, git show d0fe6491ddd22
(or git show 2d4a22e79a5fd).

- then this addition becomes:

	apm_sram: sram@2039000 {
		compatible =3D "exynos,acpm-sram";
		reg =3D <0x0 0x2039000 0x40000>;
	};

and will be consumed as a whole region (also as Tudor mentioned in the
other email).
And then we should update gs101 dts as well. Thoughts?

I honestly don't know why be default schema requires child nodes unless
it is specifically excluded. Could be a good question to Rob?
Or maybe we should really drop a requirement for having children from
schema.


>> And then later reference shmem =3D &acpm_sram_region from acpm node.
>>=20
>>> Also, 'ranges' should be after 'reg'.
>>=20
>> Thanks, will fix this.
>>=20
>> FWIW this commit is a copy of commit 48e7821b26904
>> https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linar=
o.org
>
>
> Huh, we should fix that one as well.

Best regardss,
Alexey
