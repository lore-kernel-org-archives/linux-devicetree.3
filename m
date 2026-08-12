Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D92943802F
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786536764; cv=pass; b=B8TWQb0oD4WWftDrw6tKxXoO40NZLSqhd4XxV6VR9BwB13r+Nsa4nhMKriyaiDkyWzwX5EatFcW/29fztlTN3gh5GZE6dZyQExps8TptavzN/h6WW49X7nTqql3PwbQBQS5IaKTagP+rddSsVjmNYEZj5BchHbx7ilIvNpphdfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786536764; c=relaxed/simple;
	bh=iuG8ZAS+9aPT26tPIJ0DU5HMUWFYLsvkm5izzc1uSKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUKRe478PD1BZSmewiWkU9ZHwy8XJmdYYQwmxn7qtTTv5zy41+CS1iD/kCHslCPRbAVz2KGShM4oLjdQp60A2UARI/WPespElCvbvAJHZt6nQlktmBmagsyjdTf+Q45YK23N0bm1X8J8CfJS+msg2GHe/szzXJ2Z2ZkM0iIWMPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9Mc7vEs; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9Mc7vEs"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso1508429a12.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786536761; cv=none;
        d=google.com; s=arc-20260327;
        b=nnQPuQvK4WOxKm91Kqe7xp/+c6WygE4Fp4k4wnZlOLLQB4uXHWsPOru8Ra18O40xNQ
         6qAD0vVDdYDY+LXpF5rrwS9onfkubOiEcPP9BFQNKfCeXanqTOxce0q/ky2/hr2PynVD
         kTqaDQ5OKk8qf3mvc059EnHoZ5YfkcLvPI5mGfVV28Pivf3aCP8+Of8nolNb3UVGg6+5
         VAwikMRcb0Z9yjmI2jI/GcRLjJC8Y0AYloarJk3502EoEYIhUFac2hAg8hBuMjRWsAyy
         OKVz/ZQFuQ7NmcXX2OD23r+6yLprLNmcVDWySAR1r3mcuxvZnk+gO6uXo19c/HsdsdcB
         2Nrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C25d7u206gAS9PBJlhUuN2Ycn3eHUVpUH80KlaH6guw=;
        fh=39ssieKQpPYGZiQocm5phTEfuJzJ9hYiEfeFoh+7apE=;
        b=BjgvJFdxe2gcXU3IQpbMRlPgCFBrDjYdD58IwrUI2NozDZD/9Z2TXQr4jOWAy0bk4X
         tokECo9iXovAQ0TS69sgdUevAhgaPfU0ultlIjjpUqu2pSCQciUTlL8qujdDpF/H/J1V
         PAuH+I1sYUAlinBquV4vGsZ7C7Mbnt2eaMBEhF4tSnUHmxTM3T+44Q3EyH3vgz7po27Z
         3DHMVJJDaVV8uwD2oXUnDvt3wPPWNtOKY8eXZAEdZuCdEAGXTwcrxMZfdJK/8b1AQtyP
         gw49XhGewkC55qAW6G4qh/DZ6r/FojC54UioGnOCtCbJ95YeNF7XxQCMta31MFJoErJ3
         0SKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786536761; x=1787141561; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C25d7u206gAS9PBJlhUuN2Ycn3eHUVpUH80KlaH6guw=;
        b=S9Mc7vEskHwTbbvRYtnVtzwFkpTMe/MPFaxjCauqXezKHvMz1Z0fz2i4+ebrws/MRv
         Bgv1AdsMfKFrmhi3DHbUeseoxS0x/NvK+lSVyclH5ZyDQfTUYxy7TJmXJ2F5LdjkqjJq
         xSi9nG7pRjAPu6+K9ym6oU+VUZ0MzhEK0sVNH0QbQiPrYbmF6BiaYGjmKkI93oVKLqcf
         22dvQh5Q6wut62hyM7Lh/PzwG68LbmIcQ6LJK8q5AHeY+2dp9C9rwfbedmzA9jftlNhx
         znZDox3IDL8i+H82YcvjGjBc3GdGEQUNSrmUSBvcjpH4b3xLIsfKQvT8GljgS6hkJGhg
         iNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786536761; x=1787141561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C25d7u206gAS9PBJlhUuN2Ycn3eHUVpUH80KlaH6guw=;
        b=OwQ78+qv+Reb6gitCLazIKPa/eMlKEDS0oe7rVdgE8qQbw/GFalxJnMTn2cji0zNoL
         2gX/PHIi4MUU2FO6cFbcyqNLAkXNpfC57WPhGJR9x0JgIm/H/yuCieodNQnOe99ESmrQ
         NUEz6r4R/9KLCbkuoT4XUQ9WfEKw7BZMVrIuTIhtcrU9JDDOhbr0A0EHAgSuntxmxTsU
         0I6mIKN3WtnYaDBrU/uafiL+5yjptgWa0/1Nwssyie1BuRf+wvr6R9Vsg1OLS1lUtcT3
         I3lPS0U8qBFcZ52dKR+PJr9ZnMKZndmHAELlKPrybPKgRVtrUl2b1TMDM2IiV1CqjuDa
         umuw==
X-Forwarded-Encrypted: i=1; AHgh+RpAPiSy8yUlS2aJLPoiIect9Xbqso8+mnKuYlfbYu9qd5DMM+frfBUe3k/zruWuUyKdzHO47z6mx/qN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz1hgJuNdHw5Hu0R8m7plLCws/MxnxrHSx0bmodFj2+0ZEymL9
	zF/HekvTuBVpSGiuB+3D3Dy1frKbKY4TJlptP/iB6EWuT4jWj1PCj8OLjg2Pp+3JwUht/iDumpT
	slQyiTG4aKbKq66bXoHbVX6CYtPxDdnKqrNrKkN+USw==
X-Gm-Gg: AR+sD11wxju6bhshwfZCWXYuVFTuv2FAR0BQeYAIXe6DfI+UNJiPjlBBg3OIgDbGeCV
	7cJlV+wdLFlJZukGOMwbP9BF8Nst5wQbIAD402ToZ9Rumgh8sRSUjkN9B4m/70EZSuFivMXyWIw
	8NeHsrCOz+CdeTgPgNXrxHciR+JmE2QQpq77Z+d7jc4RGecqyYp9ipHBMUMqw+ayH6rgCKhm0zi
	L135F4CSyyJnLwFBFufJam4VNgSoHr8e1334whXAK3ynAY6g0S3BC80XDWhCWx5S+01Wp7toSp9
	te57xzrivs/smvpv1QjQ2sPr5SZxJ/EwR07lf8SinUVU+JXt+0xp8kOOvn4TB4PBac98u78FenA
	WOA==
X-Received: by 2002:a05:6402:5415:b0:6a1:df2c:cfa3 with SMTP id
 4fb4d7f45d1cf-6a375eaed7dmr1884024a12.4.1786536760363; Wed, 12 Aug 2026
 05:12:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
 <amOpSPmc36+YXgCQ@nvidia.com> <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>
 <20260810141553.GP200537@ziepe.ca> <048c8d59-d47d-4f64-b93d-3b041636e230@arm.com>
In-Reply-To: <048c8d59-d47d-4f64-b93d-3b041636e230@arm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Aug 2026 13:12:28 +0100
X-Gm-Features: AUfX_mwXOifN2coQLoTdXQNBH4WeSdADhQh1-gynQzc7tMiJ7JxOqAB8IwzRDWc
Message-ID: <CADrjBPpPqLaq75G4Rzxmf2VEwyZ_gwchf1f-jjzr3EXLkXaWsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attribute
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	jyescas@google.com
Content-Type: text/plain; charset="UTF-8"

Hi folks,

On Mon, 10 Aug 2026 at 15:43, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 10/08/2026 3:15 pm, Jason Gunthorpe wrote:
> > On Fri, Aug 07, 2026 at 03:37:37PM +0100, Peter Griffin wrote:
> >
> >>>> @@ -1222,7 +1224,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> >>>>        if (cfg & BIT(1)) {
> >>>>                used_bits[1] |=
> >>>>                        cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
> >>>> -                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
> >>>> +                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
> >>>> +                                 STRTAB_STE_1_INSTCFG);
> >>>>                used_bits[2] |=
> >>>>                        cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
> >>>>                                    STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
> >>>
> >>> This adds for "stage-1" and "stage-2", while missing "bypass"?
> >>
> >> I need to follow up again on this point, but I don't believe currently
> >> we require the override for Laguna when it's in bypass.
> >
> > Oh? Why not?
> >
> > Is the issue the IOPTEs are set to no-exec or something like that?
>
> In general, there isn't expected to be anything in the memory system
> downstream of the SMMU that makes use of the Privileged or
> Instruction/Data attributes, so I would assume that is the case on this
> SoC. FWIW, hardware folks would be quite keen on relaxing the
> architecture to say that an SMMU isn't even required to propagate those
> attributes at all.

As Robin mentioned above, there is nothing downstream of the SMMU that
cares about the AxPROT[2] Instruction/Data attribute. So it could be
added I guess for consistency reasons, but it seemed better not to add
any code we don't strictly require. Maybe a comment should be added to
_bypass to explain the inconsistency?

Thanks,

Peter
