Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B657D2DECDE
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776263573; cv=none; b=Q2mAwNUh5KcrCgzyePSn9QbySJWJ7fj6fKKSGCdXdk8TnzKjXukT60Uk5Zz5ukbeOC0BUpY+Se4yGREFtGK+vcHX+f8+8WEw+ouioBOvBOJS7sPz2Y7HN0eF0CBwaXPwIJk8t7JXlirUPPMG9L3m1bkAGrlRHxDDxo5ZNafjGHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776263573; c=relaxed/simple;
	bh=3HepdRyQzPaOaFk8Iiiaa5QdNKTntj32oiu0bvvizxc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ExXYKonyLrmibILw2/4cvhF57PLcgvcTJaO+ySBORNACOhsiBDkptBxOgycx8OWwQI9as7fd45HMqKttvXxHNqj5dCDShR98RzAR5OAZ2fV0o8O/vzTTONDFpvI6+EL0/bhF5hmPUUErFh/FVbKLQiJFoPHiAP+D72fMsVLDo4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bam28bm+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bam28bm+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso81282515e9.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776263570; x=1776868370; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HepdRyQzPaOaFk8Iiiaa5QdNKTntj32oiu0bvvizxc=;
        b=Bam28bm+ncD9dKmSXk1HY3yKj1vcZTykVVsHCQowM1JvCRS66Y/BEaMJ6OBsdcyPxk
         YKGMP7EK+y8sFAOTPg2QC4eTYq0dMufgbvnmolLd5/muta6S3vmtBpoE20AzcXHhojzc
         LtGAmcu5m7lYSMnvBUwjjwOHI+KH2gdt3swlGifTpq9ZF3L1DY7P1eXyms5IwmbtcCus
         fdIDSO/S4k/qNaYYAF89EPzoVBhGSGAtjhJP4mZh0JsoEpxl8HISVTbZBYrBzrO1dBZy
         5OXTW7NoytYFdTzfprV2k1orF/a6TpBIpR8hJXMlsrHdFd5AgUhbjqtz30c+QHts1zi5
         Zn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776263570; x=1776868370;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3HepdRyQzPaOaFk8Iiiaa5QdNKTntj32oiu0bvvizxc=;
        b=XC2Xr35QV1GZXMMQNzA2cmPXrUfxUTbQsDp/8b9f4S8AKESb88FBrJYWK8F1dU9bGk
         xtst8tGTilBy4H/GA3ESO1K6rgVFDA+Pbg0x2GzzN2POelJhn3LyIhzkibDbcU9pWuCj
         CSnAfLzg9JYW2uo+T8dTVhG3rtQNLyfv61+AZL6cNMUaWwqfAr70OTvEBIdzER0iicaP
         Qi6U+AbvYeeC9RXdd2LMcRGYjT3QFCJe5RisZUaEdad1om5wWOjBPcuj/QKC4bPoeuPp
         5X+Fzqg4DbF9HoZ2Nh+SRAWTy0DG0EjSyoU5Qf2CpGEdemNz9nck0gp3CsTAls6wStGv
         D84g==
X-Forwarded-Encrypted: i=1; AFNElJ+H2m5nMvBEap/fiGJ93XSgsKkajt13qLsXt0HDlVM5n8llo/K9qKcWDUvMZL0y9jJaxbmHIFbiQLWV@vger.kernel.org
X-Gm-Message-State: AOJu0YzRLNORgyRewtxWKPSgmygpKrKwyhW6X+1LPJL3YLOkASj9gl7P
	ECLUU6m7hd7k6nzh3zK+ea926/TdqLOQoy+c4wmWSonOUiigoSSdGCl2kGb9nbVVYEg=
X-Gm-Gg: AeBDieviJtk/qCfyCi6WfqTMgGAOFDkQwHH4hzLvIu+80uCRiYkQ7ifpxPB22LAowYb
	CCwZhyUDjPCBlpebSttLSce014MtrG44FRhNGnNoR4/aBFr4sAB6rJKAM4uK7eAq7YE4pqf0giX
	AaEUW06PWRMEjBLOsLoZOKCqbFXo1RKwkjLwYXf5PI9RK1U/FmiHE6dkj0Kpx+/NG03vlBZunQW
	9vpd4o4LlnlItzDVE+PzBmzqwlw7gK0/JMw+9xWDo1LIV88PJrPk0+q1yyLWQeWLqYBtB7z4jh1
	igXzGJ10uSYyRkZJ8FqL2Em/KxA3vz3kC1IqPu7Ub4EMfNAilF2dZiGUmtpmjYr4j+JHBJaePrL
	KypJ8W/eZoM/jBQ9G+GDHx78H0kUPwItxs5G4qELXErk6SX7Af4Gy4wa0qA17Tb5dtGm0jr5p8g
	sTdV8d7u+EHZzGwX1kb93GW6ME7toWzNSHKm5fg5qoR5IhHA7fDW+fMQri82Q7v9qE3arF22KtC
	g5xhAEiVM12eFYeDQ==
X-Received: by 2002:a05:600c:3149:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-488d68432f2mr298691635e9.15.1776263570072;
        Wed, 15 Apr 2026 07:32:50 -0700 (PDT)
Received: from localhost ([212.187.182.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f4352900sm2651745e9.1.2026.04.15.07.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 07:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 15:32:48 +0100
Message-Id: <DHTSVU4ZU568.2BCATHBGQMAWV@linaro.org>
Cc: "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/5] Exynos850 APM-to-AP mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
 <20260321-beautiful-garnet-magpie-de4fbd@quoll>
 <DHIB5E66SP7A.110YA5R1OOQHS@linaro.org>
 <5d645bb0-22cd-4e96-b8b6-15c4bb83d87d@kernel.org>
In-Reply-To: <5d645bb0-22cd-4e96-b8b6-15c4bb83d87d@kernel.org>

On Thu Apr 2, 2026 at 7:43 AM BST, Krzysztof Kozlowski wrote:
> On 02/04/2026 04:19, Alexey Klimov wrote:
>> On Sat Mar 21, 2026 at 10:44 AM GMT, Krzysztof Kozlowski wrote:
>>> On Fri, Mar 20, 2026 at 09:15:12PM +0000, Alexey Klimov wrote:
>>>> Hi all,
>>>>
>>>> This patch series introduces support for the APM-to-AP mailbox on the=
=20
>>>> Exynos850 SoC. This mailbox is required for communicating with the APM=
=20
>>>> co-processor using ACPM.
>>>>
>>>> The Exynos850 mailbox operates similarly to the existing gs101=20
>>>> implementation, but the register offsets and IRQ mask bits differ.=20
>>>> This series abstracts these differences into platform-specific data=20
>>>> structures matched via the device tree.
>>>>
>>>> Also, it requires APM-to-AP mailbox clock in CMU_APM block.
>>>>
>>>> In theory this can be split into two series with correct dependecies:
>>>> device tree node requires clock changes to be merged. The suggestion
>>>> is to let this go through Samsung SoC tree with corresponding acks
>>>> if it is okay.
>>>
>>> I don't understand why this cannot be split into two seris
>>> *practically*. What is exactly the dependency between mailbox and DTS,
>>> that it had to be combined here?
>>=20
>> Do you suggest to send 3 single patches with proper dependencies
>> description? DT bindings change first, then mailbox change that specific=
ally
>> depends on dt-bindings change and then dts update (which will depend on =
both)?
>>=20
>> I thought that mbox driver change depends implicitly on bindings update?
>
> Please don't answer to a question with a question. Actually three
> questions. If you cannot give argument why there is a dependency, feels
> to me like you send something you do not understand.

Sorry. You're right on the first part. Couldn't say anything about last par=
t.

So I saw series where DTS enablement changes are included in the series
after changes in drivers were introduced. I guess it is more preferred
to split out DTS changes (also considering that kernel without these
changes should be able to boot with new DTS and vice versa). I can split
out DTS change(s), yes. There should/must be no dependency. Thanks.

Best regards,
Alexey
