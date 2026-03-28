Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0593E2D7DC4
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 09:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691250; cv=none; b=UHWW5tAW6DWxicRgYUoboQfu0w3pshoa7892h5KYyPZF3heMW0zS2qRNhe16bvfGgvZw5SkUAa34/U7LgcJDqBgpsB7N9jfJgWkjqotUf7qnvW6ee7KyahfiKlkdCCv6yw/l8/kUQySa9Hh8WsLy+HgMgW0pkWzYKWXgv0fhBnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691250; c=relaxed/simple;
	bh=Jxt6Vb/LL+6x0BLPYxR+WMTw7Py82v9S57v6w1ZdW6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HK5HoLTKe7GW9OV3RruqWC1KIpABOwuO+YNwRNVbWQOjg5WDEbXe1exsprE5LS6YrB/627cCiiL3j8S1BLrh7UQwd7N3xuA8ISNT/z7B46T1H7FIaWuYlkNjd7hd/j7pTCAjsAmkLQcYorXejh6nEBzVUHbet8H/aQSLN2QhLck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XW8/ExsC; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XW8/ExsC"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so1132250a12.3
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 02:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691248; x=1775296048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2KVjx+zR6dP4AMcDHfWZnjTLG5qrt1ahEeg2hEXDck=;
        b=XW8/ExsCEmLvyvg0eY4nkTgPFNRWuyswV6wt+nFxXr4YPIyXnlT37d3HYBiejeihRJ
         d2uH6ImyJE1f6kxEJmzsFQY/baoF30Ngr02bgtqF8pQP5wAXTcEL209xtzK5WQKFTGYQ
         UrSW6VRWOD8sKosHoAWBbCsADZIcUpzp1S+FofRTXTqN5+aJ74NCX82/Vh652nt2O9eV
         8Dq2Zjv+8CRjykUuT1xUYhe+FMcWSirhDdbej+efkVbFPB+9GFiXeYzojpVdXdj7mx50
         B9h4thPSfbmp/+m0aw0B3EKQUhYb90UGydZ7x6Pde7UL3PBI5XCPJ0E9p2zpH5DUQX9/
         Irjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691248; x=1775296048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2KVjx+zR6dP4AMcDHfWZnjTLG5qrt1ahEeg2hEXDck=;
        b=ZRdIGGecY6W08m+qqPuTWfnp9r6WzwGa8uL2DciY7Znct0mMND6rPh90apW9BoFx2g
         2MsiRZfXUN3R9h5+289ko3paDLongFh8E1PQ8TBfGas2EKPcgzLeiILhS+j8pHG/1im/
         V9OnoZm4OoCnIgQYUuqWvudcArk7ytMKuwcAXOJlxGcN2JIggXYiEeLgVNMntxenlVZU
         N98N9LZ3oJiFCav7iU6CcD+xY2vihvrqg0s66w5deJmfb3QsIt3eBEgnkLlt3NObVkPX
         oDhx4sPdsd5T2kNrv6Jh+yyfrl9SJnUPMsVgnSFfIPSEegC0B24BCwJlPIl7zmjj3x1r
         Bo3A==
X-Forwarded-Encrypted: i=1; AJvYcCXooi3Qcrarqc6nZDoZFREauCCdovwg8cJc4ozS9sfW4+YdceLB3BXJO7HRpOFiZcEMZJPj3W3lQZuQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj339vTkH8iM++n7O7L+SPjUmRr9jpqCvoUluCtDw9xmm8G5N2
	2NZ62G8ZYdXY7nwkKok5XjZOCoj5IgVrRhTR6A+lFqup0zXV3eCZb5z6
X-Gm-Gg: ATEYQzz+T63asIWsAexyigDtCDsCCEGT9Im+tuKBjxYYyKEM9ROL16DXELnKg0RpwUg
	jobYA7wYkRLlQTb8RnnPcS6HQ0Kr0mMpF47Wd1KNNtR6cCRTU6XMX9uW+nzjsuNmwxploq5R0o+
	D6I0A+QZJxJ1al4LLhncZ0B+fpoF+pZkT9LPcunXVZTxrAH2ZvkAUqlSkGO/ejyCOShFl+DCSD6
	ce9ZAXlmcl7Wz7tpOHmgS0jNINh7OLYEqS69P3ii0rLKtOXfRfIPJPNeFAXCVB9Dq+a/sS011Nn
	oTA3klSKn2XSpvSJ02RCjoM+wi1849DO48Rb3/K/Vxh+hIa0caC+hPpobgrPLaF43iU8sEzYLJR
	MqxhIJDIpnpc/GU4SsD1JcYhgQdlBr3gx5AdfD+eMjzmcWV9OXEY5R48YAifpZaizVT214jHuHl
	WRki+WJ2toUMnZqCqfmyc=
X-Received: by 2002:a17:902:ea08:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b0cdd9260amr63454695ad.44.1774691248291;
        Sat, 28 Mar 2026 02:47:28 -0700 (PDT)
Received: from fedora ([122.173.26.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242787bc7sm18789745ad.59.2026.03.28.02.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:47:28 -0700 (PDT)
Date: Sat, 28 Mar 2026 15:16:49 +0530
From: ShiHao <i.shihao.999@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andi.shyti@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: Re: [PATCH] dt-bindings: i2c: intel,ixp4xx-i2c: Convert to Dt schema
Message-ID: <acejiSOOcHmqcouI@fedora>
References: <20260324135010.17730-1-i.shihao.999@gmail.com>
 <20260325-bulky-mushroom-of-science-8c95c4@quoll>
 <acP69aM-euL7wl87@fedora>
 <c9b68d56-48f1-4ade-8711-fedd8acf0666@kernel.org>
 <acQqE-iW51fOJnTJ@fedora>
 <1bda00e6-a3bf-4890-8982-4d61a4b4845e@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1bda00e6-a3bf-4890-8982-4d61a4b4845e@kernel.org>

On Thu, Mar 26, 2026 at 08:08:06AM +0100, Krzysztof Kozlowski wrote:
 
> By running, I assume actually read its output and fix it, so please
> share why each one of your patches has the same mistake reported by
> checkpatch?
> 
> > I will send the next version in the coming days after properly running the
> > checkpatch.pl script. Also, you mentioned some guidelines regarding GSoC
> > could you please let me know where I can read them?
> 
> I gave them to GSoC folks, so they should be in the GSoC DT
> guidelines/description. It was also posted for more than a year on
> @krzk@social.kernel.org and some days ago I updated it as well.
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

      I hope you are doing good. I checked this binding it has 3 warnings
      one of them was  from the license text and the rest two are this" 
      WARNING: DT binding docs and includes should be a separate patch.
      See: Documentation/devicetree/bindings/submitting-patches.rst". I fixed
      the license warning but not these two "DT binding doc warnings". I wonder
      what warning you want me to fix please let me know if i need to solve 
      this remaining two  warnings because they are in my every conversion patches.

Thanks
Shihao

