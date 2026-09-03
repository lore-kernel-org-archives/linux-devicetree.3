Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5939E50C2AC
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 20:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468966; cv=pass; b=ieHOxpY0N5vGaX+dTCrEGY4vNin6fOjCyvQ+zmu2j5kY1VoTeFucu6SaVwXKE2NxuPXdUOLTCoIhGYXFNQ10AVgfyi8COJatnWHqwXoQwpmYgCBIy/da+OroPCq4lKnFjEzyi+zR6eu6ZFYyMRUB9qciz41SAUMHv2fa1SxMcOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468966; c=relaxed/simple;
	bh=KdbrHirEdoDp8WgDk5EfvwNPc6WGUjPzLEhodgnevJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODC4O5BXFM6YsmkBhDGZ/Hi8KarP8DligzkRjmWIyjo3TEBprFrPUB0f7RFWAOdC95L+2tH+4viFFfJLVnQmx5NJnZHHvZ7yCb0usP0gArkC2tHZIO9aC0BE1t9jbvqUvATa7pbBt5V0QKgVX06o1SXQfPJuzM7VNzWcdCkj8js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1dFrvN/; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1dFrvN/"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90e95a18c92so5294686d6.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788468944; cv=none;
        d=google.com; s=arc-20260327;
        b=R3w9Nj4ngKLjQhZrhRhpLauyvLs9teCQA3IExh/Iux0kTypzcV/KWNMdzYws0qu8G3
         4VmkmVbqytPhE2K6WR0DTsVpFsrPAKhzLivbHYbGagdTi2iTu6ZhMFAWZyVjTlhrM0Sn
         2yy0sFKsyw3IGdMNIUYjVgY3GlcPR7b6BHf1DpA446vSoxQXNwLv/+31DdSP6OhU/cML
         RaL0ija+ZB9YPsF7PSWRIpFOFAWxhNDmd29XRAqwdjslCNqq3kqxqKwRFJ8nfBNfBq1r
         DEayxuDjYYA7PA9jn1IWm2Cn51cu3SLEYPvdSSMFUxf3UbrDi5ItCk/xr0XdNvnnQiaB
         iFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qTIAyjLXIBFP+xJnGkEM5b8xcOLywbtqieoSzaYak6M=;
        fh=+K+/Kh5y4fjDb5IiO1t+i0bONxh3q/gJOS0HERILzRk=;
        b=oOHJqZ4yQy5dP/xectDlZAdzj1acOB7zTFfyjHC63yXTujDPMXMXvK2eDCdRSe7F7S
         RHdMiczILO/+zuhv4qfmV2HV7+H4A0z+Oea1Maf94LMxxp/u6m0g9ZfY6MvzqwHO7sCJ
         3i5OwLULA1I+ZmtytH+ZNFr4d7XT3QI2iU+zOMbYWSIJX6vN8UQcxIbHxO9uEtfZmTcG
         gNuX/DRqXVk/NDpINyeif0VJ84qQlO3YheOsZ1itdzzIt5ZpKaeH6FERGBxUxKRA8KfQ
         he9ay7GVvZr9S0VObSVbreYBLy4nZGghHse28Pik6jy3Mcyyx3oRVHMs88AX3M9veA5E
         1keQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788468944; x=1789073744; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qTIAyjLXIBFP+xJnGkEM5b8xcOLywbtqieoSzaYak6M=;
        b=D1dFrvN/lbwyv03t+vxZARSQrtw+8SUTYqUoOJ4EiwsODLH4KBbsIsvnMm6B9ACyLM
         mV6YhVhJpi+y6mWQUsKNH+8i3yRVvlmvcCtG3Muxm23AOtwT3/91JGG9Qppu2zhIj4fO
         Z2+Rd7JY5b5XI2E/9TiF/esUULFPioyG4IKitkAaKicto6cK1YHociTgpkccoszhQlRh
         lV1+eJYY8rjWfLTanxAuIDglroxHvmi7tTYdguQSzV+80Rr6pgJk7buoa9V/FbCLX+iH
         2w3RHoav+0IcJVonz6h5XMZLux1H8uQ5RUrTFiC9H6m3Jkn0CVkP8DQX+eNjAPbdXhTY
         SAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788468944; x=1789073744;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qTIAyjLXIBFP+xJnGkEM5b8xcOLywbtqieoSzaYak6M=;
        b=gF+H9IipVrgO1NaRZwH9RUNWbYlPVB+jVjbtDalJ+tYyZPRB081cOjc+QgWZ1cmINb
         5DyGdkVCcm1A+zp1Y9y0T5oa/BXbkZpBVttaahR5OOnRky11+D72KOxVvyoJhSbqNPix
         IROulEph98s77FedoBVJ16/+aPmmFoTtphkj7UBppXKT35E5ZRguRR7nnXA+uemPB42X
         TUutDCXjnqyzPW3MVSwNekYsLaC7ClbNfFucyUoALorXMbj9k0KcAjobTk31o141lqSz
         y0i13O47NK6fpWXyTICsgIAjVZrnoszqDZpzp+z69+pGl3tw85RdceoLrXnLIwk9oWMg
         QIwg==
X-Forwarded-Encrypted: i=1; AKwUvBw+kpWqxL5bGEdnPOqSMCsoiI71KILH4az5KvgFaBpNyjlqE6o52rDZ4PegB2cNxOSAFBeZrBPrA060@vger.kernel.org
X-Gm-Message-State: AFuF++n8OkZWQC3wzRi79iNNvvTq36dmoyA1EgE5vDDuAe9tNNrULB48
	DJV2NlFRLlY3FrTz311pT9gBczUomW5+efI6fQTB/Y7d1kphd5gIJjPqk0e+FKeXEbvL9J1GBfA
	5VmFTDCHMD2AS6IEJr56s45xOF9XwrzE=
X-Gm-Gg: AYBFou0YinH/7eDr1CYrpx11N/jIeLsKPPxkgzPtIxsBOkOvMld8uTFQTAoShSwc3dc
	nqVSnhpkSvbs9/wcKDeSKR8sA7W5hi5ID+1ziFeJ4KCY/dz5HW5zbj5pud4IA3pJ3y/h+1Vx37e
	c9OD/GGGvdrCZxZrR0LR/Py8i3cA1vb0/IWYiM+1HO6Zxls8XwX4eVmPykh2bAKI1p2Bk9cYaBr
	8bP0y7pvSOzYmsqQVKRroCN1cr6lTzfgmeZ2IPvm7QYeGuqHExKOUrHusm0ZqPtUob9+jLwFLzO
	JLwmCUwiHyhsppA/wMKEvNOS7tsKzqy+z7265yRqoi0Ftk+Hh3K5/mBYoYVfZqNlqX2PcjTaTv8
	WVoDUDELntBHiir0rNCGYBJTl23yEvW2ffAkNBT1pZCQ2zgUqUWSXznBDU1/b5ZZUDgyryC10D8
	Q99Oi/9NJKLIBxa1Phjoiki+fXNHTfolyiMwZB2Hs=
X-Received: by 2002:a05:6214:4705:b0:910:34bb:6987 with SMTP id
 6a1803df08f44-9103ef75ef1mr25697406d6.12.1788468944023; Thu, 03 Sep 2026
 13:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802145109.728793-1-pbrobinson@gmail.com> <20260802145109.728793-3-pbrobinson@gmail.com>
 <apl6RddLcPz8Q2-O@apocalypse> <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
 <8f948621-fbeb-4807-a4c2-0214ce5d3bc3@gmx.net> <4c67126b-798d-40d9-9ab6-8fc876fc5630@broadcom.com>
In-Reply-To: <4c67126b-798d-40d9-9ab6-8fc876fc5630@broadcom.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 3 Sep 2026 21:55:30 +0100
X-Gm-Features: AcwNN1XzO9ovKsqnviFFSdy3uvNj50qpUfsiMt9Bc_wJqbWlqfgoRFykn56TcNk
Message-ID: <CALeDE9Mr4asKmQaQ3yRfnf5B4cvVkZuDTB+8BesPUy6djpkmVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Andrea della Porta <andrea.porta@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Phil Elwell <phil@raspberrypi.com>, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 19:55, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/3/26 11:47, Stefan Wahren wrote:
> [snip]
> >>> Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?
> >> It should apply cleanly against Florian's next branch here:
> >> https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next
> > this branch based on 7.2-rc1, not sure this is intended.
>
> It is intended to be based upon the last -rc1 that was released.
> v7.3-rc1 is not cut yet, but when it is, I will rebase all of the /next
> branch on top.

But  v7.3-rc1 was cut on Sunday 30th Aug IE 4 days ago ;-)

[1] https://lwn.net/Articles/1091420/
