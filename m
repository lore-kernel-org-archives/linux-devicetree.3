Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28D6257827
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 18:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573083; cv=none; b=lGPuZoRooZi8SQN/5n8z1wiviRhKzaTbv3umFGxTE15EUcYlhBkuvvwgFEh0zHsY71G8ur8mYsDB7vE1ofooBgg18kJxWkHQEqeZ0vfQ2hUVyddwtLPiAOnPV6jO6zsIqXpUD7xNpVUjCzpECgj2pZnjev7AOcoxg9c5ndcmJaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573083; c=relaxed/simple;
	bh=EvDjr7QOEivWg0MJ80G0BfUhnPuWN2VrxZ3OPHfOdng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6VDEQd1e9czPsrWSoj5TDpdM5F0s5XElRxB0IgWktKPaSvrWLp9riDVGP39JcIlFfYvEzip9A6hpfP+hVWldZYvDvvxU3PRtA5QJjJzxAoEYKmd/6Vkgba7ACDbMnQbxzaVNhcEys2VY8kvv0PzhX0sUgimdcT9MIBIeZvuFeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Py1+0xk5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py1+0xk5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b2503753efso12600625ad.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777573082; x=1778177882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNrseZwM9UnOfbU9abnm0ZEe80KdvydEgw0ah+e0N5g=;
        b=Py1+0xk5ttpH19od0x68cXjHvzFZzrw73bApEB+sQgPXeK2ru3TPxuoS9ZUSxx/Lyi
         gIUUcMFSaFUTBwgvkbGJQ2EL9qrDyfFNUAAEJ/XBJR1oLLG0fPU9l7ULeb7jIRn6BDxP
         4P1nAyfttHi0qmK1cnwqTMBaRg7HEq3wB9gXJ4YAe5JRmJdMxBWyetP4vHdaDQYBtq+K
         K0V+ymbdV5x60Z3QVl4Xzjv+Lcvx7XNXun83F8ESUuyQQ9ClwkoR/r38fO4ABB3hNAf3
         /hvziNvnLqu7z6jwyqPqHxivhcsQPRBk4PEwSrutT5ENGXKnsA+qyyQ2Pnby5oCSMByY
         Cxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777573082; x=1778177882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lNrseZwM9UnOfbU9abnm0ZEe80KdvydEgw0ah+e0N5g=;
        b=H7MP7GCC/vRs0+x07CBDcnieQftAot3eOF54Edaz2HjukxR0lPr+pxaoOSD0jkQyqb
         /ey1SgfoJmXQ4eF3CVAfnitMAtitKeGV0agcNVBlzYrsc5JC5GdXKRw04z6iz456JnRC
         x4lnAdGlw8Pu9OnzAr5N517Y8A57odKZB3L1FBOLzfh13EC6EpVqQLUHjdmmIp2ESBMX
         1c0ECtXyV+UvQ64HcLMp91rqLO09gLAuIhXEfRNea7OAMa7BtQU7YMp2fhWHdw6QKuHo
         uRcTY3GL4gEgwDmHoeIadY92hKsUGir7PqwTDiCSxLzt6vmlIMHiBt3Rg+GRWc6IsW0t
         rJgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mUzNXem7o4isTEEk0tEJu4dLiXq0UREYxjjIpe20NhEUu940zWrOo/xd2NmPc4pyTpySjnDhI00gg@vger.kernel.org
X-Gm-Message-State: AOJu0YxZz9qdolfld0gaUvMtCzKiMTWS8rZCO1N36DS6ex3/KriBokQ1
	RIYyJIdBQv+l/dnP6rawL4O6ndJwR27ruw5z0nkxWVwZIjSob249eFLj
X-Gm-Gg: AeBDietGKZKopHC34QjYWSs5wv6MZGNmqirGzaf+vwusiT1l0GigCHfQemCQIvUqeTB
	lAsE26sLbWdGIq4EjY38oq417vu9mGR3tR9B93lJ7CulUAtIvsXyQLZCFgzhmWjyiw6dsbL0D2A
	tLQ8aLFpUb9qI9aPJ4nsMl2rWYLLuJEyjgFhxFtFo915g/2oemQPl/NWojwEfTFFSBgt6BJBauH
	+NagD2osR6ekXBJ4b2/Lzv3XOK8ZU8r+o8ldJFGPThuF3QgCY1wBdxStHtbO06q+RVtoUSEJzrT
	cCBYF2lJ9DA5ebXRlCYhnRX840uYwV5YMapxFFlB9KsNlyGqJ4Rk3xPlehl34GJzvZpwGYECsOF
	wNLpR56ASxEVKmrNLaawr0+CHGUU5HlqkOJtJJitF2erI9kDmFMICTNaz+3RxsGG/2l/M+x0YCk
	H99/Z8oOEtZwpEnCrb6wWNNqpSEB4j9+05eXLJNfsQSgwG0H0=
X-Received: by 2002:a17:902:f20d:b0:2b2:81aa:f6c3 with SMTP id d9443c01a7336-2b9a24e293dmr34311575ad.29.1777573081946;
        Thu, 30 Apr 2026 11:18:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadf8dsm3114255ad.23.2026.04.30.11.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:18:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 11:18:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Chiang <chiang.brian@inventec.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial: Add LX1308 support
Message-ID: <fb8cbe2d-3ab2-43f0-a51a-3ffeb0d8de2d@roeck-us.net>
References: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
 <20260428-add-support-lx1308-v2-1-90f115954143@inventec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-add-support-lx1308-v2-1-90f115954143@inventec.com>

On Tue, Apr 28, 2026 at 12:19:28PM +0000, Brian Chiang wrote:
> Add device tree bindings for the Luxshare LX1308, a high-efficiency
> 12V 860W DC/DC power module with PMBus interface.
> 
> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
