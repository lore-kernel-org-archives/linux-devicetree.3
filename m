Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A63859C3
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789889030; cv=none; b=PJbktfRSpkP7zhufqaD6pvY9Y/GZAjr6VJhntVDLby4+0Q48PZM3tgByGpK/SBkxWgM1IUBdpv28nGspYYJfE5+6tPkWBnLW4eiOKElqKdFb20szxyxv55Q11lTiAGGV0YDjGgZ8SBoKj4hsYFGbhAUxosm1Uw0TtHy+IC1WQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789889030; c=relaxed/simple;
	bh=AeWelz4k6J1dGXylFFs/k7Dk9LRIhfrxmpYuVJoufpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ycbl8Jp09zifOuuIo9ds/yZML9VTIMS6w321oo3je9jkDpU+5KJARdnsGIIIUOxxbITKKE+Ao06w1c2SCtkgdaPOSWUX+5sAIK+TiVcUX/3Mm0BaYgWRiGknSD0oiVnITghP8XIUZOOLu96jIT6S2pMNdCEe6M4fZqPgZN05Hio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=XIMEAXaX; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="XIMEAXaX"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso3280519a12.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 00:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789889027; x=1790493827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vdzTW+oAwMVEMniCDRRZb+1jeXG9GB5BYAHNipWBAgo=;
        b=XIMEAXaX6LGPDLGp/+ydMMOD1DSOvs8MZbkwJfzdcDXNhdUhJ8j9zUht0RqF9Ohd9q
         Zei/riCWNqepIeo/UgGPBRELiy4AxizPcsybjDyjXjTbV23uSAg/rxQB/JNA98cXUB2P
         N6ymT+y7xEVZzhNzfr5IzUj1p67O3W1fh0n1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789889027; x=1790493827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdzTW+oAwMVEMniCDRRZb+1jeXG9GB5BYAHNipWBAgo=;
        b=yxW8F7zTHY+oJGHPOHve3fLoFw69Mfi0WlQGhJ2lKgg/ujY0mPYuvMEaT3hzgLfFZz
         TYh5pHugmAr+X5YLFHbic7k4RwnQrS4jsc84p9UcX5ub0vxqewgl7HkYV5yB6+TrBcS+
         g9n3v9MtTMhnjbFwOnFcMI1aSc2+9WGdxlsMI0xwMRhZCBU8cpbVg0EkwV96zeIS6GkS
         0y9Akim9vppqenTnrqgyVxtAbln9aFjhaDyID1SG0lnPgxd0zLMWFBVjQfk4srUHdspu
         2ToMdjDHxuH8Su52bNa8KEL7I4CqU4gA8b5wOnpa9kkVRsBDqMofsbAhVgKhea8IEgrB
         xH9w==
X-Forwarded-Encrypted: i=1; AKwUvBzW22CIl/PiMaSDMrDpjWc1/M9SxUTpTtdZkHP7LZOGf6nndOhDcxcwUyBl7SYwUAV97dx2VhFTzbXQ@vger.kernel.org
X-Gm-Message-State: AFuF++nTw+Y7h3Crqqlm8iRpW0MC4NVZKCu+gpi02B2xp/ekSIBGLsdu
	XpF86xWI5BxDf6OuYS+FteWSrpAw8e9Aj8vsDy2VGlFFThyOMoH9BHNRXSZ4eiB3uis=
X-Gm-Gg: AYBFou1Vzc+qlmYKiO9oRsFTJsVQiGp18U6pFjf1LCWlbo0e0hhr9OJZWnzdoNto2w6
	whB90HnMlD3c6z8Mx3mSVJySdt0ghAKn9zGE2CeW2GQUB6iJi2ZeVZc6LYXzuqJnI7mvF7J5pSH
	vow3jpcsb9CKFQ4rB4Avgi9qA+SYYv3Tty1RHEYZ3+OETGXd+PVJ94vKUuroef0IhL+4v2SkNLZ
	ibPxBZ8zd+O32xRI3oE5MpM5QcWGYsm10yfbVeMZ3n4c71q7wwXx+E+usaDVCj9B3OWWOoyLqQM
	pbENFOYtjdV8O/FjLksmUiWQyv1utL84jlai/NWMsQS9BHhuaKliRdPDnrcXpsV7U766LFDJUeQ
	e+z55m23q7Lc5YxnWLBtp7h0NdC1eRvnw/ecIYN1aneD++7eZWW3rh1vfJn46yjofpn8vgggtp1
	U9ZDHkmKchGvScbz+xYi3sve1B2nWxGmkOkAtu77ozeK++onqhanTpJ8wTm8GiMkm3PiE860vfV
	yY1/YDW97Y+lscx
X-Received: by 2002:a05:6402:a0d5:b0:6a7:ee54:f897 with SMTP id 4fb4d7f45d1cf-6aa5319e9a4mr5445508a12.27.1789889026803;
        Sun, 20 Sep 2026 00:23:46 -0700 (PDT)
Received: from cabron.k.g ([5.203.112.129])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e3051esm2287839a12.29.2026.09.20.00.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:23:45 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:23:43 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260920072343.GB7878@cabron.k.g>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-3-petko.manolov@konsulko.com>
 <20260918-robust-spotted-orangutan-4b669c@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-robust-spotted-orangutan-4b669c@quoll>

On 26-09-18 13:55:58, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 07:31:55PM +0300, Petko Manolov wrote:
> > Add DT compatible string for Draeger's M48 CPU Module that is also based on
> > Altera SoCFPGA.
> 
> CPU modules almost never can be alone, thus this is incomplete. You need the
> final board compatible. SoM could be a fallback. See NXP bindings how it is
> doing for example.

Module is perhaps not the best of choice for this board, but to avoid duplicity
please read my next reply.


		Petko
