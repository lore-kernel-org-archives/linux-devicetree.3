Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717144;
	b=Jxdddfl15WZd18XshDLD54L1VS1lj3IhOPftkYWGVV6dnsn928WAj63Wt7D61CtxB7oW
	 il79AIZlkwJJzKqJeDprb4VW17cUkoNBcNnWGjRvMK3fanVNcd926RWktmu11YKuRAUoI
	 BLRezGYVCBYRDcbuqZzde7Vm5VLI1AhXw91HP0B8NopuKvzYT7OUjQX8Pdsftf59pzC/2
	 FIxjp82ZrkocEwuvI1Z9hAoybxSuaxljlmAK8QpSoxO3iGP+2LOs3w9/xbM+ssYYHlrPg
	 LZvnmZU1sxwDnXwghZ+cwmUyi56tp2yBD8+b5Me8IePhNP4UJpSg6KE3txYviqaczQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
	b=Rln2yaA8no57i0lcUK7YGHE8SawZdsuvx0Xzm0LCAA/dvTvTPzS80p049fQAaBZV5DNn
	 486Zqfc7JNIPHpQBouYRCGHLgpH/rPzvSCZ+hVD4f2NcBpDIz5j/Fy0erBprmLQdOU2HI
	 hscDfibStLHjC3TssKv86MOqECCA4fkb27QdL/Q8SxN54b9lBaDgcECXXCw1UxTszv9Fs
	 +JOgyLRVhY+rKQDnGIAP7Uv3L/i+UGUtK7+Rinr82xyKxGeE+lQcUsKZcSA29vUK6HfJp
	 Kj9a9Pt1MQh1Fx9Bujlh6iX5frS2wbRjKGqre1YXV/bgvuUVb53rVlCkhUvao2R4izQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kizgfJ4A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48EE606A33D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 14:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A48EE606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kizgfJ4A
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67be1e468a8so309279d50.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 06:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717142; cv=none;
        d=google.com; s=arc-20260327;
        b=RNByBCdAtozWO2q8qki/+5WxGmC+V5TuTcZYyjwyqVI+R4VyPB199fFG1UkntL+kGt
         Uz07Bk/YIoVSo4EOY/5wqyGh4yJTfIHueAW/vXggSRimDArmV1AJVF0qdJVFsYgMYCGO
         dM6shHVGSAW6bT8j84GVyT6+0Qyebp5FA9413zfDcdBtf3RABZw4HCRDZZS09LbDjZMK
         A0MlDWIOq6BUBdt29CPI4pbEyqL+IGtBNLOseIuy17UVofIdKmfmb7gelTYqQFfZ/rkA
         w78ElNRhHCWfGZoTsxIKDcebdtyR9Ax7NTWAdHRPC/Dgs/3XWA0MaNKLkFCZrFTc25zv
         Su4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        fh=TCOxQC/N38E+lHQAE6K/M5sLhf+jGRQZWM5Tsgb4Zog=;
        b=CRTM3OSYXHi0bVyE/0yWb3iWOwt4FrNz4VqnODyv+t/lOAZ54MyfCyp8NtiAvS4gF4
         bzOdIopb1HfcskRRal+Ua4vMJiaRGw3uVW5HRghVFTkSqixbFTB/jNaGmbacK71EYLOv
         uQwPvvck1U8WZ+Ip7wp8hscwTE95n1RohqadXGb7+GR0mLAr0dzUHbXXeVSIWNgt662y
         nYJ/XHC0GeP50xNKNMrHgiFqYLI3l60Rnj1a4DSywUcpanDlJqpV+a4DzuoavCTfmzpu
         82N23Bue4nyeP+GQxjPhdWz9/8xHzBv4GeNuQ7rgMgXe4rf4kBzjH1lrRWNJlo8qQj7g
         LvtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717142; x=1794321942; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        b=kizgfJ4Am7zPK5oTi1VjOREORBnLvfmMgkKMNVn5x7UU75Ox5QNhSkoxnWI1jtGpBQ
         0F/eshb2ZOoin6xvAfW25WS+8kDNNbcWNJI5P3lYSiq3b/9+U63w0Gd92LfCKl76afuG
         tJuSl7fGh0GzHU+PPvbzXEoPB5PyQfIAWCL1D0joNqPteZPb4w0frDM1jw2X8pF87iXv
         S75R7L0alOKvLZg3Shld63p46s52oektnO9r15+xj1iv/As4aj5Q+66IJwlMZvI1/L9S
         LvU1MgJW+QGUV1V5y8f+ecrthUI656REDGKCgsKY0EvwMjcJoVBpqb3zoBmBOK3Kv/2n
         Qm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717142; x=1794321942;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S4qcarRIzyPxsuQpd7GLOf5aNbdhnpO7LL1PTtmVaHY=;
        b=RlXmhsP8rEfs5FWevO2ssgMWfFLAMuXogQ3M7r/Fee2HhSMR8JebU8w2bE93qclMcL
         4EsMemEhu93xOSH/woyWylenY9vm4HmPSjyUo95jk42Az1OF3qwnrs5PB3Ju07Jm1u+j
         U0G9Peb3hxuSSYfetLiJAHBZQ9GsJ46X1ETfj4/tkO2leOS71N6q3A3MpeJJqdPag/tH
         eZUxSAT+vqYTsub1S6AbozYJMiKVNvihSoJ8aSF4yOM3GpR12O2WhHT4LhIiRKwQKU9a
         0o/FNsqeoRqpwoFCsY8FZn+AeVczk3ZOqG2qt1VA7YX5aUZb4+hph5QFRQ2OwbVc2DQ0
         sgXA==
X-Forwarded-Encrypted: i=1; AKwUvBxAo9PfJ8BETOXOhYKk/xp04FKvwAEEMbnp8sTYNDtMt+M0C3JvTVcuwIq00loDLY7BClD+Xru4nwGn@vger.kernel.org
X-Gm-Message-State: APuU4Z/6r6/53mIct35289GaweRDTDUzOPuwmONyYG0iECkLrCgtxwlz
	nEOCeQQ8RCSNzsv4AEsfDZgJCVugNXIjo9waa4Od1XZNNKLgbA752uq2nocBzinmNBK/c7B+suq
	PYGkuEUIeO0+hIhjFI5COhpf9/lZ1yw==
X-Gm-Gg: AYBFou0eRWzw74Kuii9wKwuWPCL1sEqfWri5Amn6USD6WQ92aBaF1a8HGHktfjtjDkc
	94jsLiMiUxEtFSejceCYU4nMRSCp3kU26ydmT6dupYUJ5OizcsAwlSdqqL5bOC4FLr8A2dO06IF
	j0qFuaLqY1UKu8jnCWMbIVy8MjwT/usu8lR71dbd8lIoUsPh3yyMPz1qWW2LxnOAHcsiDwJXiRS
	15CbrHKOET44YMDL9nLT64QaXUKjgKu27SOPzuVF3cBzILf+aAQkYDrDpXC61R/FADVxoQUm5Mc
	OX3Bf1XCHNcUxzVCNpFmmYuq/ob0x0To2uOBOtff7mphzWiR+AUWghOJl3Xb2T3vfS8w4XjyjrH
	fBALeZbh3bWSFAz7wvBtAfjsw7w0+K+Cb7cvQRMaGrA2/pJx92gGCkzCcDGZ5QCLB+zOO8xIVwg
	g3PyX9wmS4+EZgmhs=
X-Received: by 2002:a05:690e:1699:b0:67b:e91f:1eb4 with SMTP id
 956f58d0204a3-67be91f204dmr59967d50.105.1793717142405; Tue, 03 Nov 2026
 06:45:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com> <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
In-Reply-To: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 08:45:31 -0600
X-Gm-Features: AclHuK8t5ej_tgD9GJGBIoXXh4hckeei19bttMW9q0EtGop8alsm0H9-n1doCqE
Message-ID: <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/3/26 11:49, Andre Przywara wrote:
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks for the review, Andre.

> P.S. Since you have a device and have been looking at this: can you
> check the CPU speed bin selection? I think it's quite wrong for the
> A133.
[...]
> I would be grateful if you could dig into this and come up with OPP
> updates. Many thanks!

Yes, I will look into the speed bins and the A133 OPPs. I'll compare the
BSP's bin detection with what is in mainline, test on the K5C, and send
the result as a separate series.

Thanks,
Rajan
