Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF55D51C049
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 17:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874202; cv=none; b=QIhDkUpVxNLkYSQPdSoFvSMuUXtGnRiL43ByPMSZIta3Z7drhaq/BgpMtx7Imw3ci6PkU/2PxxrD5kTk0aZkpZ4P9xdfcQA8cgPXL18OGedrs8pvB5ywnr62PzgJkk6hhpRZnurxl7fogtqQepTBvW+AGzUkdL6J/uJPFkm0n/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874202; c=relaxed/simple;
	bh=AATMWNx/td8CMo3aSPUQaxRxKv0aYs/TyeFme5JpK98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJekYs7g412BdU0UXRCtl3puNT0Mt8KEmz8Tu1tMcw4kOGgLKsQeE4zJri6ZTiCl8c/broGL9fvpJ0O/uLui67lurJssN9J5Mp9U8x4ALZzM5u1LD7lIY/lO5jD1BllFDeiD4dfyn5MY1RguiTt9XEgOvhEQXNkx71n3CAkZYp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=I/2f1hek; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="I/2f1hek"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-6756a6320f6so2885447d50.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790874188; x=1791478988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6YmMQO9LMPUNWHq4u3cbpwC28RlhwiegEC8VRXjjLP4=;
        b=I/2f1hekePyFtYnvGMr9IHKlMXMuCJJttYQUcdlFSyZlZB62LXqMzCEBsE19Kk15h6
         Pijl7aYTHgK9TAdXtRLloMPjiLOauS6jziBF+VCDHMNFGlnI/aaFJ1Zcoa9WRkZwGwEh
         XRrJCDp8syfwkiTU1NFCNp6uVP0hXTKHGsw15wPofFCvdyl/jkoe8eT7va8X3BunoybB
         zcYiLl3nND/gAQuERNlBU68u2HDrrEeYhzaFJNXgpnHOxPwrApA/4KfzYFvh1NzPd/5Z
         Ok0X4tB17+YKx4hW8dEIVyReiRf7P5fYjZbRfD/eg5/2GFZUg7e/dxrLQpEQgx4WNCSY
         sEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874188; x=1791478988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YmMQO9LMPUNWHq4u3cbpwC28RlhwiegEC8VRXjjLP4=;
        b=bNCJaiUgAnUfpW6opriVHQZRLI7rWataGG5RX/3CqMWCnJpiZ4hz36cvr/58GtwWWx
         S1ZBSCuuWxvcVLTzQchR3nqaE8YZ7Qu3NHUtLJAc9LjcMdmrcskWq+OXIrQIyraJAjJs
         bjCNxHqXkY4stC2t0EiSQowG+7v3zxQ/myZjIEbbnFjq6mm+Bgb7+dIPsbLMI8w9TM2x
         0zMK6uVeL+luxJ1pS+Mpsl15LHaQeMINocfk64VVoPr79yJAkpXX9uK9+8wQM99N3ZJP
         tv2N9r7yAEEKL6BKdltR3na/62yADz1VuwR65Xn6hL9zaekS4QkQustuBan6pSi06Eqe
         lsnQ==
X-Gm-Message-State: AFq9FYL57h/NKw36l9Nz/1nfVZItWpaNn4+XD4sLevui3daUOC5Jkvkl
	ke1jLWeefCFlsOESRVpxTqvp0l7y7e0rwRM9Pv5cWr208JdiH81fGk5pQO3Qbff5KHU=
X-Gm-Gg: AYBFou0t7lX80sH6Z+klPqBGdL1v53fcGd3Pgd+C2VNaiXp/Z7JRr2bRPj9vb58tnHN
	rdVUUskdUONwcEBMgkQlAxTQV/Qcc8IJdUL1lpxh/oJc8x4UvZHmKqChu2O5Qfn2ZScfm8BkUTf
	8vYq+pgaDMNkSKdrM5rPsS32ndTHiV0IAId7i2eJnTlwXE4P+6Qjb6Vl2fIeY+f+apvFq3tQBc8
	zJlmWyiskMocvWnB4G4B+al2sEe4gJA8ja5/NRWaUom0YFHuSwxGb//RqBT9qaFXMoJPXhgj57f
	TSoHi/hGuqmTu5QP8TmAmNXN0CVSLwLqUH0nyGKajLWCs4xQLz5gUVi0Dj2XgxAQ3iililrrdu/
	dwgRGizcVBvjaTBYbC7ddle4f4AtJg036c//U402I5YQuCE2zFYUZ8v1zS7j99wAdn3nJH9CYIP
	O+IfPgnJ+ZiW4bETdfDPOoOwHNfq/iWVmsA85+/7myMXSJYXmqLzOcV1EyIHYw0s4ksxkuFbs4x
	/26RhRmqiAQA4eG/IKchvFx5+f4Iioq
X-Received: by 2002:a05:690e:480b:b0:675:67be:3251 with SMTP id 956f58d0204a3-6768349058bmr1756658d50.62.1790874187795;
        Thu, 01 Oct 2026 10:03:07 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::ffae])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677abafb2easm26948d50.4.2026.10.01.10.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:03:07 -0700 (PDT)
Date: Thu, 1 Oct 2026 14:03:01 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
Message-ID: <ar6R5Df_uliYg1l6@hiagonb>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com>
 <ar6E4bQAKonCW3st@hiagonb>
 <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>

On Thu, Oct 01, 2026 at 06:57:08PM +0200, Andrei Lalaev wrote:
> Hi Hiago,
> 
> On 01.10.26 18:08, Hiago De Franco wrote:
> > Hi Andrei,
> > 
> > On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
> >> Hi Hiago,
> >>
> >> Please take a look at the patch [1] and the discussion.
> > 
> > Thanks for letting me know, I missed this patch. Do you happen to know
> > if any overlay was sent? I was not able to find one.
> 
> I haven't seen it, so I guess no.

Ok, I will sent this patch as an overlay.

Please, forget about this patch. I will soon send another one.

Thanks.

> 
> > If none was sent, I am happy to send one. Sorry for all the noise here.
> >>>> Thank you!
> >>
> >> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
> >>
> >> Best regards,
> >> Andrei Lalaev
> > 
> > Best regards,
> 
> 
> -- 
> Best regards,
> Andrei Lalaev
-- 
Best regards,
Hiago
