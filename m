Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553022C2374;
	Mon, 23 Mar 2026 21:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774300561; cv=none; b=d1AL6v3Yn3Ryte4lW59oHAlUuGGlXplHOApTvfRlkMr9afMhJkuwmwQjaw4YJLo3l8QcdyGZj46L53QrrWRmpo4X4xnx26cLQSAlqG2Df2ir6/W/Cl/9Kpk4UugU1XCS4fQYueXNPSXRO8uyMc25m2am3YLVZqEzTniJWrXueyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774300561; c=relaxed/simple;
	bh=mxBUimSBCNpUreyoXRAv4n0wUm0qpSEw4i9qshEoaR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bhFfY+d++LKaaIn08EUWfa6eFdVi4/dPhu5H5Z0wBa1CjiQ8ofR+CJblnq/jR28u9v+M1mMKgtyDP95lqsw4HSC3/t5p5lzLyRBKQgmpvYaQIzYbbIWOT2wiq3YZ1mGf/UCkUSs7ddKaF7aAIH+U07NQ9FMWx4R11FF22s4jmwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFUi0Y/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFUi0Y/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EFEC4CEF7;
	Mon, 23 Mar 2026 21:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774300560;
	bh=mxBUimSBCNpUreyoXRAv4n0wUm0qpSEw4i9qshEoaR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UFUi0Y/ULHPfgpb69BNGJ2jJaopV1WMq1YcTJ/hmxIJfSsPgPJjLQI1WICOljXRJv
	 G/LXDFv7ek86VE4pbm6SnH+eR8JJ1P20m2jpWnLw+b/wH5Cg9fx1jEtr7BJyw5cVsG
	 vLofdaAeLP4sKP53WisuMOXbSQvDOqfrLc/syDBolKYuGKHHeJ82AJqgAo9kl29JGR
	 KxeTYhnM2pwrr7DPbzesCUaBCZLuOEV+m7Wlenssza2CHpdo9PqqmI3WaTb6L+XjJ9
	 A04dWBUsIUvsDR0KOhe0Vy63tJGvygbgHSLmHn0QiaztLQCd7uL4oks343kJV2E0Wa
	 mUjB6NZ4QmM9A==
From: Thomas Gleixner <tglx@kernel.org>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Eckert.Florian@googlemail.com, ms@dev.tdt.de,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [PATCH 2/2] irqchip: Add Lightning Mountain irqchip support
In-Reply-To: <6b059429a3db61dffd53a280dc2d6278@dev.tdt.de>
References: <20260318-irq-intel-soc-msi-v1-0-0e8cdf844fa8@dev.tdt.de>
 <20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8@dev.tdt.de>
 <87v7eqk8pv.ffs@tglx> <6b059429a3db61dffd53a280dc2d6278@dev.tdt.de>
Date: Mon, 23 Mar 2026 22:15:57 +0100
Message-ID: <87341qi6wi.ffs@tglx>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23 2026 at 13:14, Florian Eckert wrote:
>>> +	domain =3D irq_domain_create_hierarchy(x86_vector_domain, 0,
>>=20
>> So this is hardwired to the vector domain and does not allow the
>> interrupts to be remapped? Those SoCs have VT-x which implies interrupt
>> remapping support. But what do I know about the infinite wisdom of
>> hardware designers.
>>=20
>> TBH, if they decided to hardwire it to the vector domain, then they are
>> begging for a cluebat treatment.
>
> Unfortunately, I don=E2=80=99t have a detailed hardware description for t=
his
> IP block. All I have from the Maxlinear is this driver [1] from
> their SDK.

Sigh.

>> #2 NMI routing
>>=20
>>    There has been attempts to implement that before in a clean way. The
>>    patch set dried out, but the underlying changes for NMI support are
>>    still valid and Ricardo (CC'ed) is working on them again, IIRC. See:
>>=20
>> https://lore.kernel.org/lkml/20230301234753.28582-1-ricardo.neri-caldero=
n@linux.intel.com/
>
> The v7 is already about two years old =E2=80=93 let=E2=80=99s see if ther=
e=E2=80=99s anything
> else coming.
>
> All in all, thank you for taking the time to look at this. I=E2=80=99ll g=
o back
> to the drawing board and have another closer look at it.

I'd start with the non-NMI part and by that time you got that going,
Ricardo might have an updated version ready.

Thanks,

        tglx
