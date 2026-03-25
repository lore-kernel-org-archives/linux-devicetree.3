Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88163DB652
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444398; cv=none; b=X3UxWhoIaj6wEKdLcZ5h5w3/uRIjAwZ3Uii1bxjOxx/vunPdjUILB/+OjUl5RQB7F89lKFDcQ1QwFykQ4a17RddWgda+C9KrvgcGAK5n45KN+veF7zv6h4p8bmAemHUzUGZVvG57zrUinC2AWBzm3Gh0iEgK5htnQscWOxD54yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444398; c=relaxed/simple;
	bh=p1CgH2aPFFSSIU0nL8Z5QCpMo08bn0aEmyIzHWVtXmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FK5oP0USfRw+UQ+++Bh/SASMBsDS5XUpY7Sj0c89/7scF7kX+ZqhpXcOdUYSej/sI15mKJ5Fa+/+sgiA7lh6OLdhVfepofI57MsXLfL08q9DAQAiE4o09gJQCAgZoDB3/U4gyeBSKqWFjTdGYfdHNWRgyYL04xWjHr/Qd2lxA3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S073oI7S; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S073oI7S"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b0586d5bb8so47259455ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774444397; x=1775049197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXlIM/W5QtMeF1TTKLDLvCNleh8kdupGPpwsdQWbjac=;
        b=S073oI7ScH7/nc3zKWmse8udWnKtrGdCsWrr8dgh9LYJJ74D8lufB3vCnmkc6tPk2M
         AOdcwVsIIzbiJPz22C+YHPEw9+Gu09/daKM3dTg8j+QNFxh4DmCFEkP/noHxC7JZTMP5
         nV0O8aivE8zffMIW6avzwckbPgJjBEglWLiy5sxcgbKU7oz09Aa7DHp7tBFzFDMfG246
         1y0i4VaUmypb5AZj0pk0tixkRr/b4xy3JYgFafdlKJ3fDcrfUJG9eBIryKoNYVbxidD7
         fMHa+5PoWvAG1sF3Fml9TbDlcQSD3kn+rHYbV2Ib5Y3AnT+jdjvpb1xHy2CUaqhTfPr3
         nTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444397; x=1775049197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXlIM/W5QtMeF1TTKLDLvCNleh8kdupGPpwsdQWbjac=;
        b=Uef35UyX1BKKW32TR8plvfHKkl6bRw6LnzImwZdoy81LBM/vvi33oN/cCdg01787/t
         rTAwEXZWEsHI6fuhpyJFK6kzqBFQ8CKIAi/56CrePGSWKKAClw049VATaX4pEmLTe12b
         PTW68sOVKYNmIdEVs9fDRX3Op5rIv/1eSkR6x0TfP2FIap90/6P/2rtDiCR76QNhv8yA
         uCpAMFApObP1FzyBvfm3paVv2C0Ggh7IUKInF62he/5+NLe/wNzipX+vgUzc4CUPhOUq
         9voAnLfV7SzCwgDk69HlecDtJOqyT2rhlyyF+D726zgmtncvQ9OUcJ/Aphe9WoJJYRi6
         aOCg==
X-Forwarded-Encrypted: i=1; AJvYcCXjeeKLJdu2M5QNoqiKzeXhfuGtgAvyR1+Yq7oKkRPdOhtKy+Pi0N0hX0BZz3CBW3fPhfyH4A08IMs0@vger.kernel.org
X-Gm-Message-State: AOJu0YzCFHg+Tph7f5yz3UAQ3YtDEnUl3AWP0HsqjtVw+sDeahv59v+8
	f9TlfU4QQGKbg1OPpTsvrMfSU7OVh1h2lo1Y2K89Uwa0LWWZkytZ4yoA
X-Gm-Gg: ATEYQzxqLlATjfJyqzN9ocFN34p4RkQ3ep7ExzfSPoEIfM0zcZ6xE8zVYC6NhnTjTZz
	ckIHhIVkV8/OczWvT3+C6cqXfjSrDMPkZiVKqwDeNvyzIfCGh/GWLDQD28QCICYF80delNfbV+d
	6/aOnWVQabONzknXgXPvftsaD+uhF02SzQbsugo6HfF0EhD2Nu+czSCJMOZ/EAtpRqjhS8v8T26
	pp+4cps2dTQkejZp5U51gzqK7Ao19KTAVS8OYGpZ5eqxzIa0iMgT0pki2RdbyHV2wfNUiHBKdV0
	tF2d8QqWdlB3mBhBio/nglSzLuuOteG0ti4e/2aKgV6cQ9egVTvNE538obSkaQB1wmON1IxyoAf
	V9ui1q9ho/motsfPnB3iUl2ZvZQW5UG3ueLNrHa6O69fiCH0LZf1f4c/NEFPpldwNpZ1AjC1I+T
	5HwTgCGsM16jXlQBUqNlNf+o5o1Rxbp6srhnJTDYC9DLzzCbbPD4/S5vYIu6M=
X-Received: by 2002:a17:902:f550:b0:2ab:230d:2d96 with SMTP id d9443c01a7336-2b0b0a0f86cmr37207665ad.11.1774444396928;
        Wed, 25 Mar 2026 06:13:16 -0700 (PDT)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836ace98sm182577905ad.80.2026.03.25.06.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:13:16 -0700 (PDT)
Date: Wed, 25 Mar 2026 18:43:11 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, lee@kernel.org, 
	conor+dt@kernel.org, daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, 
	m-chawdhry@ti.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: reset: st: convert to dtschema
Message-ID: <acPebHSUdu16bzw-@toolbx>
References: <20260324155935.183952-1-krishnagopi487@gmail.com>
 <20260325-speedy-amethyst-beaver-08a3a4@quoll>
 <acPMx9NZBehAzkBp@toolbx>
 <57e3e846-d679-4201-921c-69cdd4040d13@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57e3e846-d679-4201-921c-69cdd4040d13@kernel.org>

On Wed, Mar 25, 2026 at 01:36:15PM +0100, Krzysztof Kozlowski wrote:

> On 25/03/2026 13:04, Gopi Krishna Menon wrote:
> > On Wed, Mar 25, 2026 at 12:39:36PM +0100, Krzysztof Kozlowski wrote:
> > 
> >> On Tue, Mar 24, 2026 at 09:29:30PM +0530, Gopi Krishna Menon wrote:
> >>> Convert the STiH4xx reset controller bindings to DT schema.
> >>>
> >>> Suggested-by: Daniel Baluta <daniel.baluta@nxp.com>
> >>> Suggested-by: Dhruva Gole <d-gole@ti.com>
> >>
> >> Both suggested you to write this patch?
> >>
> > Hi Krzysztof,
> > 
> > Thanks for the review, They helped me to improve the PATCH,
> > 
> > - Dhruva suggested me to change the subject from dt-bindings: power:
> >   reset: st: convert to dtschema to dt-bindings: reset: st: convert to
> >   dtschema as that was the general trend followed with similar files.
> > - Daniel suggested me to use the word 'reset' instead of 'restart' in
> >   the patch (whereever possible) as that is more accurate here.
> > 
> > That's why I added those Suggested-by tags.
> 
> This is not the meaning of Suggested-by. Drop the tags.
> 
Understood. Will remove it and send the v2.
> I gave you now review, so you will add "Suggested-by: Krzysztof ..."?
> 
Earlier I would have. Didnt understand the use and meaning of this tag properly.
But will take care not to let this happen in future.
> Best regards,
> Krzysztof
