Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A5E3E51F9
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285920; cv=pass; b=coBKYWyx1o4n95aBBArGdLKaDGPsgTQ1F10ZD+mCxL+bOnJrzGHL1UQGqlWjoa8jm+3CFTUCIK1NiM7REP686JDfdd9avWVpGrpmDLVE4YB9bJ7EfegIu9k2ZqU+Latsxf3AiBuQSJf6wW5hDth7FosN8ToNAxQ+yDEvvEJ0uks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285920; c=relaxed/simple;
	bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNGDCfzzzjfMrE3v8nY9qRcBddbOSxTqcnPLDL8NEmQT1K7za7z6Q+eEgpuB7j7M9BUQBaENDsQkkgOBvcNn+i4m0Ge2bHJ4cvEeLerEVMG7oamFCbcIixnvfWVLBugo55iHMruqxmWzuQXghMOEvNrqxKBKZqLDcSBLLLwJ4N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VC78Vj3M; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VC78Vj3M"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5351748222cso21719691cf.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285917; cv=none;
        d=google.com; s=arc-20260327;
        b=NbM34ipdUekWmF+/VYig2WcuY/iRtoOrpr4/8HYdaSBkEhIBLXtaoyDl22w+SgrJDt
         daEWg9LyNZvIytWHFteKZD5KxEzZYYzy2gx7ZXHik/gUUPMbyRTTBBYZtMjvfBDvUkgX
         OIjY8WHbXNCxqBqLPR4+B6568vg/4/56OtS2J5r759GC1/05e5zf0fNUlFt3eICTvOyK
         wPswihmXkvG27jdQXq3Di6owUmDxY9hLB0mw0C+g0J+Mojz9q6jeqAZJHzyBSRIJToH8
         DVHdcnsOlCHhOi7MHZG9z75S/8hggsJ6MzU7pnB4p4JaStexZppFhaZXD+RY2S936VCk
         WmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
        fh=Tw9knJu8p6FJuXJiBMFYH8PmMFcIPgLcH27ng9f1QUs=;
        b=f2mmv4IrD+8TyrBANQ1DyJlXOfR19L3esCZ+aXzq71jHFzsk6xuw7Y2s5WHbJBbRtB
         i1qocP9MxRcxIr4CDG959+wa7CbNucdrjwsbosnGGvWSBwna/qI8po5SCOFDcuhMgCop
         eTu8fAXXN9p+7noYTHam7plekrQxaq0xu1xJjBGbF5sR3kXPtX183xGO5+1Zi3yOIAp5
         h7627JbqgpWBaJdaiucWpDE0EXb2Un8v86NRY6/muQlWmN14lLfzHfVkcj0TdGs0hpRS
         E60ZF0cU+Xg3pzG0zlRkGX+cvN0LOqJ0ehY0n3P2enGZbgV0zLdy2Uh8+FAEfKNXrsTM
         rCUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285917; x=1791890717; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
        b=VC78Vj3MX9ERdTnELiHYWiqvhP70XI4U6bVYq3vINkgmiLypT+YWovpFXue83gkXMj
         bWed7Zw2iqjzYpovaOBHBNrIxbGSpZSPjw4YWupK1woXiZYGiuetukUTs9nJO7mlchjw
         TLgs1Sbyty7+5yuu25ViR7yrKZXuL7movKsSkuJW8bVdUVzGZsbsE/0PXoB20K0tWF+S
         b7FhxFt7wlUGFfRN9hYtxB1OwyiMP7j0BOZ1Mni2fpgefMVBKJ4pG/m1W8Zr2S5+c25T
         SW1WwTr9azJxyJFgcnBvwNf4AFOzihKdDp6iB30H/qO8Jn/pGHrH9GAlHy3IUx2onZlG
         my7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285917; x=1791890717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y6sbNbnpwWkCzbLbbS6HdaXNpMuoxJitrtJysJoWmJw=;
        b=mIyXIbEnoxztp3ydjzZyq9IxyGdreDREf1In9GOCnjvnHXjlAJ/5XlRWNEsUWLSQPj
         2CEMQVpZless7JuRaeEeNlb0TMq0JV+VzrSLvcI3xyTjmc2PxmM1fkbdjXvLjKg6xla5
         4oZbS1Pr4PMZKOyItiXpS066UMWQBgvydXRTF/6r7xKj3PizwGIZhcix62SFakF/jHWb
         vJ845sk5mEY9BHij6nA2cSRnSeqS7zdtfrYzUlNWCcE+zQosYGWbF8vYZ97Cyy0XlASA
         +DB+xtf4aigSJG1K6V3LZPV02BvVw/Do2c3UTKxIqQUcObjG04wLholPrP7gf6SibeEB
         FnhA==
X-Forwarded-Encrypted: i=1; AKwUvBwFo7bDUtxUnfhJeV0n2s7hiesiFJSz0wMyLy5JHwyuVP16NPTW/UEa8AJjZPUNhWwP19TNmR71cFUx@vger.kernel.org
X-Gm-Message-State: AFuF++l/1KrNCQzbB+m1iJjyABREFkE9/qd7inubIbRGqBP2vdl3X9BH
	Mc6HX4K7Q6OhKNcvHOso5vmv+ZM2eU35iTQ7VxVxKSSwxL9ZdZjPWx3dnysF+jWb8pZVv31gZxm
	XWxKYeYn/oTfC5lGNuzRHkeplnAhyNYI=
X-Gm-Gg: AYBFou2jW0LR4EHqoy3LUrWVEXXXKDokMNi34RwsikyyVDuWOelfZ5qacWmuP0vDaF6
	K76pYS0kvzPatrJ9/lIoA/73pRoAfGidTCTfLvYY5odOE+ZSzYTq0cdL8nRg10OowKZxzOkVIYi
	P3U5ehlWEdMeOe/UHiypgDJbF9y4hWp2Y5o+hZDPMeXICLLNuPCasX+VyWe6KQvIyhgYv4dBDqd
	V49yEwLDzZ/xd/ycRCCwZcGVwiUNjQFxfbzQXQS+CBJzibjxdFdXNS5eu8u7dIpBUlkmVAoxmYF
	TKO8+NQ8XZZ2flhjMd8fwcW5fd8CfKIazQfaw+uL0CHQNC+3aS2JuurahT+3J/S9iLgD8tj9hDF
	dehtiVkmw
X-Received: by 2002:ac8:5707:0:b0:532:f0a2:ef4 with SMTP id
 d75a77b69052e-53511e431b0mr182844541cf.26.1791285917373; Tue, 06 Oct 2026
 04:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
 <asTVqsqOLb29LY08@parshuram> <CA+_ehUxra53C2N8a0t73nLpS4DkaNSzE3STfhU7j3ZoQ9becyg@mail.gmail.com>
 <asTYlWdkrlci37FB@parshuram>
In-Reply-To: <asTYlWdkrlci37FB@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 13:25:04 +0200
X-Gm-Features: AclHuK-2iwD9Pk70twNlp_Yt_RVNdVYY6IjBqwJqtLPrbBVE4V3UaEW-eP-1_m0
Message-ID: <CA+_ehUyGgaodxKH_RddpaUXS44w=eFpediyQqEYhvJZ8LBKRRw@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 6 ott 2026 alle ore 13:16 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 06-10-26, 13:07, Christian Marangi (Ansuel) wrote:
> > Il giorno mar 6 ott 2026 alle ore 13:04 Vinod Koul <vkoul@kernel.org>
>
> > > Okay so we have a cross tree dependency. I would like my tree to be
> > > buildable and not depend on next.
> > >
> > > I can
> > > a) get a signed tag for this from clk tree with the required patch,
> > > merge and then apply this series
> > > b) postpone to rc1
> > >
> > > Either works for me
> > >
> >
> > Maybe "a" is better for other phy driver? The pcie move patch is blocking
> > other airoha drivers currently.
> >
> > What is the procedure? In theory just the dt patch is needed, nothing else.
>
> Please send me Pull Request with a signed tag from clk tree. This is
> typical workflow. Is it soc clock on common clk tree? Stephan or someone
> can generate this and I can pull into phy/next and then apply this
> series
>

Just asked Brian since he merged the 2 patch series for the clk.
I added you to the relevant mail.
