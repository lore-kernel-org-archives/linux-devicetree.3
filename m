Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8505C391510;
	Tue, 24 Mar 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341823; cv=none; b=sR18dzvb99UHbHJj+hNBiKZEd/aFT6EiEsl5Ty8I7DUanoqSKTcwp74r0VUd1rSWnBsOb6hhpQYWi8nyGroWlK6n0WX//Acg0CIPVYEb2zL0GjG9I9aVvwmzs5mRj5urzAt+n/S8bUzudPKhte8uepPK+O7LX8cOSp1jyt4nZck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341823; c=relaxed/simple;
	bh=Ms3RGmo9BXjWfapShY57qDrtGqMLyG3DfhKTMFqIWls=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SH2JqOVw9nMFXD8vc0IXd7BLDqc8XomOaIhL2Uo1L4lNieDiufs002QZg88mQHMKi2KVtsntmPDqyPdM16TtwfI5PBseDJ44adzQsQNHGEcapnhAFhY3XLZweSSrGHUjDfTOSurMes2+bqaKlnAu1RdMKeMX/3GAb0+cSahuCbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=AaWNx0wi; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="AaWNx0wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774341811;
	bh=0YvANwo0IIKUqL+qEoGQdaKoDGB4cYehMUWEEPhPQKA=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=AaWNx0wio2aqQgjQMcS+vwckLZVqyTu4W2OoV2sKgnb4IyOTCkpSYghZ/A9gK3cpI
	 HFizC4MH3s8bGnro5DKi7eNZgyc/N++tP6qBoMzcbpCHzhazJy5q+vBVcCE08M/gZj
	 FykU2dRDaz/+cGJlfTQMxnqmrNEDU95YVAOHYGjE=
X-QQ-mid: esmtpgz10t1774341810te82cbcf8
X-QQ-Originating-IP: Tkqsk5ZBeYEfXLsi7Obys+UNNLFSDV+KwfMkR4d5z8M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Mar 2026 16:43:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3668339084073543840
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 16:43:28 +0800
Message-Id: <DHAVODVZL2KG.1NVQFF3B99WV8@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: spacemit: Add PDMA controller node for K3
 SoC
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com>
 <20260320091936-GKB525649@kernel.org>
In-Reply-To: <20260320091936-GKB525649@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Np+AlqyfvJHVpc7hVvY43qwyJpdWHfvirnCACHbn/nW0jNjvw0EEpFPZ
	x/Oe9asEpkd3nE62FhG8StuUYyTbbv67UV0E92swEoYNY1FkWKyr6srPYMNfjM/jVplo4f4
	vSV7SeX6Xckmb+GYiGHsk/HRJIhHv4iRSZuygdKN2AwMLTKbiW5L2bf7N1PHEFbcbCfhHTl
	E65cDL42OiwC6iuLgIcl6a1FS0QWOQYcJOrse6Na7NnXyVVhXmcvTIE/DQ7sF78lWl3etmN
	v5DR3n4ZSYqk9vK5/3st+m23ib/mKzk2e2qdXAJVaXemnYcekZJWvgj5uE4M8DRf447A27K
	+/8vs/gzLgYZexeFzqkN3c+xzksiYYaIKhfJNCi49MCjuK6u0mR5TTBznMmKaNbtbMNDy4X
	6w13x2KHte79FO9SPIHsHwC8C0iHLdLFO/YDzfIK60W0wsM0f8oUz1u4Eab4GUf7rTvxad7
	/8X53ZJ0CWzOabQwBExc4Dr3kit+lOL5GYFTeGFFrfMavNQiXjTOQKdgieCywV7uScu/j5Y
	VyFRvuf7/W4oJUa0AA1Y5zr1cXTclalp0TZL4h3HRBPT1BaCqtmB2XSzcAPiI+DVoqLLVBi
	as/5dT9jWxvxPH4RRYuA0EvrxHfz40ZzN9D2y/oPxkAEQk+sQ30HJgtafk0PHWFVHzBsm+o
	LGlGq53euobI/2MvRcYeAIh+I9ABzdUw4oa0MEF5Itofpz239BSZpkd2kvZ03sC8rV+vCK4
	CppKb9i/w7lCW+mLnXhHk64D16yUZGLtdSthCAiOQZiv+2qUUnqweqcU092zf+9uN9Jyvb2
	/xRophKYnEoWUraEn+EEglV1pNOxDpt7I5RKVIVomc8JfVTJj/tvitrd94ROhOOwxVQ78dd
	NxNk3RE4vHW82xPOR2v5LOgcqX4vUow/peTmzJ5+BuIOBj2516t4AO+8VYdlx2glcH6olCf
	FXzD39CSb/Il9Dk79PoGDPdyk+2tZYMdSZ7d1OOuO9dKDW5GyD/0ZrCEvRkQVXCB0/0FEPp
	/2LOAoVAW1zx1R9XnhA14hini+Z6umoho4sjmPV9cSBqP1RlQj
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On Fri Mar 20, 2026 at 5:19 PM CST, Yixun Lan wrote:
> Hi Troy,
>
> On 15:55 Tue 17 Mar     , Troy Mitchell wrote:
>> Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
>> The PDMA controller provides general-purpose DMA capabilities for variou=
s
>> peripheral devices across the system to offload CPU data transfers.
>>=20
>> Unlike the previous K1 SoC, where some DMA masters had memory addressing
>> limitations (e.g. restricted to the 0-4GB space) requiring a dedicated d=
ma-bus
>> with dma-ranges to restrict memory allocations, the K3 DMA masters have
>> full memory addressing capabilities. Therefore, the PDMA node is now
>> instantiated directly under the main soc bus.
>>=20
> ..
>> This configuration defines the essential hardware properties:
>> - Register base address and size
>> - High-level triggered interrupt
>> - Associated APMU clock and reset controls
>> - 16 hardware DMA channels
>>=20
>> The node is disabled by default and should be enabled by specific
>> board device trees as needed.
> I would suggest to drop above, as they are quite obvious, and easy for=20
> people to grab from the code..
I'll remove them in the next version.
>>=20
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  arch/riscv/boot/dts/spacemit/k3.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>=20
>> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/=
spacemit/k3.dtsi
>> index a3a8ceddabec..f90d34a81be0 100644
>> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
>> @@ -438,6 +438,17 @@ soc: soc {
>>  		dma-noncoherent;
>>  		ranges;
>> =20
>> +		pdma: dma-controller@d4000000 {
>> +			compatible =3D "spacemit,k1-pdma";
> I think here we should introduce a new compatible for K3 SoC,
> it would avoid ABI breakage if something different with K1?
> cases exist even same PDMA IP integrated into different SoC..
>
> The commit message tells some difference, although no code changes
> introduced so far..
Nice point.

                            - Troy
>
>> +			reg =3D <0x0 0xd4000000 0x0 0x4000>;
>> +			clocks =3D <&syscon_apmu CLK_APMU_DMA>;
>> +			resets =3D <&syscon_apmu RESET_APMU_DMA>;
>> +			interrupts =3D <72 IRQ_TYPE_LEVEL_HIGH>;
>> +			dma-channels =3D <16>;
>> +			#dma-cells =3D <1>;
>> +			status =3D "disabled";
>> +		};
>> +
>>  		syscon_apbc: system-controller@d4015000 {
>>  			compatible =3D "spacemit,k3-syscon-apbc";
>>  			reg =3D <0x0 0xd4015000 0x0 0x1000>;
>>=20
>> ---
>> base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
>> change-id: 20260317-k3-pdma-7c1734431436
>>=20
>> Best regards,
>> --=20
>> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>>=20

