Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E03839B2
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999360; cv=none; b=LdoCwgTxPShbfdcjjRbZs3TFcaoJIGLfOVtGU6fYlNoE6TplrHL9xYREj5jTwZXkDnHJA3vaSiQ3chtp3N4DBAD+CDYabtuOfoiaJ5EpBVcFhkWm4TrdB8CoHbaQS6LbvZSO2/ZqxyrRnR+WhFMHcVGB25NU5VEpQHPgSbhS4NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999360; c=relaxed/simple;
	bh=gdAUuZofKnrle2BTgBTbnsod5CATJdUinz3qgrlBraY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUSygga9ZGrha9dHjnEB0RWTbL9k/m3B7AtN75aId2r2LDIBHCFQ0CeVsW7vzm2UEjdfeQRBl8frKKPnG97gByTRoPStr3vuVQ+uu9+62CH7W2XYjQ+Om0H29+bxU10KGbFZg38Vl9WPMsJgeWrTr7E82JiMsj25m9+KUnoW/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwoSlbi6; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwoSlbi6"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68d233bf083so7499116a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 03:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780999357; x=1781604157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6z/t2eDlRmRAKpgcgdbz/fpbtWYE2knoiu/ZUm5WZLo=;
        b=cwoSlbi6O1TAQue0nVfqqpsulcyQFaoA2Z9nHkkiDFG222n9xTangDpOsGtOEOKdQk
         0TrZT8uB++lWdeFw3AVxpimAVcXxtbSgjGdAo3eLcrIVr7cSkV0ArFFmUD4CC9YVRuhQ
         ocMtpDgHg1GsVpK9V3nCuhOo8J7pSrbRgtLfHJ3ai4a9fMpX2a/CESNz2CQ578jYFoen
         l1GToe3gvNycu/aD1ykqYgP118xiiqCzN7zK95Nj8lL8m963b863mRrlqcplY++2+Rek
         Amjyiij3PT1/QoKJXKzEIuQupWDORuNAdbeULZ0K0rpbcM4I5zxe4bWWjlEf4yk1IQi6
         gNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999357; x=1781604157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6z/t2eDlRmRAKpgcgdbz/fpbtWYE2knoiu/ZUm5WZLo=;
        b=qrFXGJ44cDS4qi5gv9TpBhN7k9zRp2HbxPCHeqJ+k++roAMQ2VX0VzecB4Q+Qhn02f
         /6A4rlPXRZ6nPIleAyDLFYKBJbPteu2lr+8hDJMvJtHAYujGU6Kj73if2q/YdJaFmD7u
         aBGorMkmkJ3Xoq4NdZ4fueMznSIYnfTa1iJSOs5owUGHInetI1p12mdUYewOxpR9Ifkv
         FrIkMqh9m56E/rsi1IqtO/mPdPkrJwUkhpisinWWc4oEt/VzEnS5RXI35fBSqkNUoMvX
         C7jXdn0OMeaIwF9SEFOgCfQnjct/BLiVndcv0q+yyci6umlJ+ak+9XAAnbXdi0B+ULbm
         wlSw==
X-Forwarded-Encrypted: i=1; AFNElJ9L0kIJ1rMv7sq8ouvLrzS4I9IBus68BKNJ2H3PUgDW4Advp25ZZThml6jipc8vb4rXapQoj8MWSBkI@vger.kernel.org
X-Gm-Message-State: AOJu0Yypy92n8wwgjcNKWrSjqLyahIvxg3vtPLsv6B06KG3L0ArY7kM2
	MD8GU5pqoSIth/2yP+H5lQF0ro9DgfytbGjSnvtzWda39ec0m+DFRaxPs4vLfD0o6M4=
X-Gm-Gg: Acq92OElmtzbYHLiiELCPz//omtpUq92/jqU0SYi7XCvIeVkW7+4h9/dyyIIq0Wdmpj
	rqtsliE3nx23ZAap/aCqz4qYQUtX3zfBQCfH9FU2WXabBo1/HyaXyDmYGJ7xyG9OaqW9janVAWE
	szL1D3jx323nzhxoZtvCDMU4wU8kLaddVWBfbZmkjWMzxBFZARUgyABTPBPAZRXqzwebLhcEfKz
	wkzvwfcEnKPZzwp9neCZxkmTsUvlDaLQZlu9pwrJs/S3wuAzKQrzAxXX1SZT9+o0ZBSHHWjIqME
	fupPCPRyN/ynmiBYVeQBd+9lT9imznJuUNcFDPcefkVU/Tv4Rvmpfcg7yymg1reNGl1xwQcTpEb
	0jI7HKWBPQdigijcVOZqt8SbKKXy/+iCWmvPkciWfKdFnbozfenOBghCA3Cmp9Lg/hWB8urtF5C
	tTCUXz0qoXDMca7WaDEVfXOLiFdqKjY8OGypNY8jQsv//Vjw==
X-Received: by 2002:a05:6402:1914:b0:68f:c62d:b36e with SMTP id 4fb4d7f45d1cf-68fc62db44emr8021823a12.28.1780999356589;
        Tue, 09 Jun 2026 03:02:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:919a:5e38:ea48:32e9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8461678a12.27.2026.06.09.03.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:02:36 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:02:30 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <aifktn_s2qmg7MzI@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
 <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
 <aifX80IHM8TLQiV7@linaro.org>
 <87o6hk9i29.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6hk9i29.fsf@bootlin.com>

On Tue, Jun 09, 2026 at 11:30:54AM +0200, Miquel Raynal wrote:
> On 09/06/2026 at 11:08:03 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> 
> > On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
> >> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
> >> > On 6/9/26 10:10 AM, Stephan Gerhold wrote:
> >> >> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
> >> >>>>> On MDM9607, there is only a single controllable clock for the NAND
> >> >>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> >> >>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> >> >>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> >> >>>>> clock ("aon") that is required by the dt-bindings. This is not really
> >> >>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
> >> >>>>> clock entry in the dt-bindings.
> >> >>>>
> >> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >> >>>
> >> >>> What is the problem in giving twice the same clock? If this is what is
> >> >>> done in the hardware routing, I do not see the reason for more
> >> >>> complexity in the binding?
> >> >>>
> >> >>
> >> >> I had that in my first draft for this series, but this would be wrong
> >> >> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
> >> >> this platform at all. I'm not sure about MDM9607 in particular (maybe
> >> >> someone from Qualcomm can confirm), but a similar platform I was looking
> >> >> into at some point actually had *3* separate clocks for QPIC in the
> >> >> hardware and none of them were called "aon" ...
> >> > 
> >> > gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
> >> > gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
> >> > from GPLLs)
> >> > gcc_qpic_system_clk (32 KHz)
> >> > 
> >> > No clock containing the substring 'aon' in its name on this platform
> >> 
> >> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
> >> The NAND documentation says
> >> 
> >> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
> >> 
> >
> > Thanks for looking this up.
> >
> > IMO, if we want to describe the actual hardware routing, we should
> > describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
> > MDM9607).
> 
> Sounds more accurate to me.
> 
> > The resulting diff would be basically the same as this patch just
> > inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
> 
> Diff would not be simpler but more accurate. So if we go for a
> modification of the bindings, I would prefer that path.
> 

IMO the result wouldn't be much more accurate from the perspective of
the kernel. If we assign RPM_SMD_QPIC_CLK to all 3 clocks we would be
effectively saying "there is a single clock with a single rate that is
sourcing 'core', 'ahb' and 'system'(/'aon')". But in reality, these are
3 separate clock domains with separate rates, as shown by Konrad above.

We could try defining dummy clocks like the &nand_clk_dummy in
qcom-sdx55.dtsi, but this isn't very accurate either. Presumably, all of
these clocks are toggled by RPM_SMD_QPIC_CLK. So if we define a dummy
clock for 'ahb', then enabling that clock without also enabling the
non-dummy 'core' (RPM_SMD_QPIC_CLK) will do nothing.

At the end, the truth for the OS/kernel running on this hardware is that
it can only see the 'core' clock (with the option to change its rate).
All others are invisible, with no way to influence or check the status,
so pretending that we have separate resources for them doesn't really
make things more accurate in my opinion.

But yeah, let's leave the decision up to Krzysztof. I'm happy to change
this patch as needed as long it works at the end. :-)

Thanks,
Stephan
