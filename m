Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486DD38C40C
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965826; cv=none; b=g0XwKOQ9ls81BRKVZ+b48KMrm2mC+kkQjGjLdHNzXUyKlrExOajxgV1LkJLeU70tnsnARF88Z663AsDSMbkgWuNbE0in8rE4J0hcPGwuaAx3qVhY7C7dK0cJGsFzjfBbtNKd6qxyyJMC6LKR4srY6ZdNyUse0tT83rTbZNpO2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965826; c=relaxed/simple;
	bh=a9DGLc0NeseciOnf2q1+7VtYJ5eoK8nd7Li3zgPWEig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxLqImJZKnIMEwW0DQqWkCzjrA0itTvFTqdd4sUzzWwXzaTaMC/Jc2D6RCD7iZz31HwOg7xcUbnYweE70w01iD6FmwdQvPkofvkAMUW8uxUZ3WvNXjZgGwPES4Bs1XMLWJPoqaEewbdYAxdsOMGVJRc9auqabrweBqYUKktYopA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WLA8PxGt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uErQbVp1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WLA8PxGt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uErQbVp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790965820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
	b=WLA8PxGt8D2ZjXp6f1i9b3jxPHDcwG6XkNGwfI5u1+k9/2fg3H9GVU3VdP86Ebb1xIbCKc
	F4IamSUugE3kIL9bq6Y9qRuZU62KKPFR8hK2JGf189zKCGwBW1zEE3+B1ufpVze077VnnA
	KezUIeMkFXj6/F0TdLTkp15MxC6IyvA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-WosWYrIaMvKlVJ7mEr1dkg-1; Fri, 02 Oct 2026 14:30:19 -0400
X-MC-Unique: WosWYrIaMvKlVJ7mEr1dkg-1
X-Mimecast-MFC-AGG-ID: WosWYrIaMvKlVJ7mEr1dkg_1790965819
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so485953385a.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 11:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790965819; x=1791570619; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
        b=uErQbVp1JssUAq9Q+sIEpqdtW1JBFlCjMg5tlozJrYd0AyuEkJ3J6oazf1HqriEiei
         kLpgC9UC20LTdd/5WHL5kJ9vey2vr949yX3yNACeojgsj4zGIRY+3qYUBopaz9Sad3Nu
         wH2WPNatg9wEiOwClou2jgTr+OKaCfc0fzMxEs3TwnK7u3iVmPx1dvf3PRxZIyhj/5IL
         B+oy5Ewh7GYL+XrEftTF+RKG+YeqRHMcCSQHd0/Xo9xe3lROG9lZpQlo6W58Wd3nKTdG
         OZXI03KCwDmnXIDQIa2LyjoLfQa8TwyiCMrU7XwJRXQHlpVlFpMFjTa5ba9DgK3vOPzi
         Ukaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965819; x=1791570619;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
        b=BS7mJhariL3qKZ3sDP+b8dw4A7zXXnejcBcL3ojBd5G7IRSJYMjN21lDow2lZrSnlr
         tnksUlEwMISJcFPOLLqUGqi0KTYFhEaLE1pTtlPrxqR3nUXAHW5FWVn0s/viPrK6HWcJ
         EKtFElY5oaTXlJZNuguROtpnbKkBLd7IUvOaq32o5fwvrPxILMlDdgI0cqDO4muF3S/U
         Ewk+9OgfzxOwmW18F7yauMYZA4E7fS8YAPvPU2npAOGlATij8WJgS+H0djR71n2O6pyY
         q/iO12pYpRBk6Bh9sZcDivN0Blk3uKdfOgffxIXcakDinG1bEPIS885XbTBuK9Sdx4m2
         MQIw==
X-Forwarded-Encrypted: i=1; AKwUvByPxV+qmmrEOlXO7qgofz+j85R0p9iN9g9sw2VxCqoBIT0HKf55BgjY8B8DxfBbCOFbigP6PLqB4XSr@vger.kernel.org
X-Gm-Message-State: AFuF++ka+c2mL6JlZQeeoSGmazG70Xunv8wrAcBgitSsM8RC6Z5hLl7D
	z2GSE3tDaI8ym64vQnuQMU7V/9XdgbOK8LW68L2PJLxmW11t6siDr3s2qjVLVuKuZaEwaIvGUVR
	J6t6oABlb1xsGLT6oBkJUrbep21iJI1ijHIwYk2OQArvyMb6j9H9LsN+gT1erUSw=
X-Gm-Gg: AYBFou2PAOp8LD/KsS0TbCY02ta16vq3anTJt2Ur3sBUxH23WbO/8nldfXsOxBuXrCe
	g+CpoI2PmLKIlMugiJ1afcEVDaI1rUkOeSv8KB+y2VmYz8xmLZT1alj0V1uUehosjwzqCrwX+6c
	PYiIZrHFV4s1u1j+G9bRJyuf8/ACuG1usHz3lEgu+4An7OqqNpFPUeF9DJyFQmjlz3eHmMPTGTj
	hfC65hjVVggmDz+5Z6gTX44IIoYhKR3ZhhscwHaf1g63nVroimDnegKXhmnt8M7eqNE/sT6szB5
	+eXU7ZHWSYoydVJBrNkl5laOtjimxG20WiLKK/YNH+Zi7udUllhQcDd0GePc7c+XiS54Acfq7Q=
	=
X-Received: by 2002:a05:620a:31a3:b0:930:9091:f0ce with SMTP id af79cd13be357-93cf16b3b8bmr674434485a.22.1790965818236;
        Fri, 02 Oct 2026 11:30:18 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:930:9091:f0ce with SMTP id af79cd13be357-93cf16b3b8bmr674421085a.22.1790965817184;
        Fri, 02 Oct 2026 11:30:17 -0700 (PDT)
Received: from redhat.com ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca0395dbsm285252285a.5.2026.10.02.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:30:15 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:30:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 00/23] Add basic clocks and resets for JHB100 SoC
Message-ID: <ar_4NBLHrq2W7_vc@redhat.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930-grafting-undertake-ff3e01060284@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-grafting-undertake-ff3e01060284@spud>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Conor,

On Wed, Sep 30, 2026 at 11:43:22PM +0100, Conor Dooley wrote:
> FYI clock folks,
> 
> On Wed, Sep 30, 2026 at 05:42:54AM -0700, Changhuang Liang wrote:
> > The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> > subsystems:
> > 
> > The JHB100 SoC is divided into multiple subsystems, and basically
> > each subsystem includes a CRG(Clock and Reset Generator):
> >  - sys0crg/sys1crg/sys2crg/
> >  - per0crg/per1crg/per2crg/per3crg/
> >  - voutcrg
> >  - vcecrg
> >  - gpu0crg/gpu1crg
> >  - cpucrg
> >  - usbcrg
> >  - host0crg/host1crg
> >  - pcierpcrg
> >  - husb0crg/husb1crg
> >  - husbcmncrg
> >  - husbd0crg/husbd1crg
> >  - npucrg
> > 
> > In the current series, we will only add the following CRG:
> >  - sys0crg/sys1crg/sys2crg/
> >  - per0crg/per1crg/per2crg/per3crg/
> > 
> > The remaining CRG will be implemented in future series.
> > 
> > This series depends on the series:
> > https://lore.kernel.org/all/20260806122553.182449-1-changhuang.liang@starfivetech.com/
> > and it has been tested on the StarFive JHB100 EVB-1.
> 
> If this revision of the series is acceptable, I'd (although I'm not a
> listed driver maintainer) like to send you a PR as I've done in the past
> for Starfive stuff so that I can get some of these binding patches that
> contain headers as part of a shared tag to be able to unblock a bunch of
> the soc tree stuff. With conferences next week I understand that, with it
> being -rc5, it's probably this doesn't make v7.4 but I figured it was
> worth getting my intentions out there!

I am going through this series now, and I have a few minor changes to
the clk drivers themselves.

Feel free to send a pull for the bindings and headers though.

Brian

