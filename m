Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D90406297
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569463; cv=none; b=hwqhhp6FPMFDgr2WwtVysQsPGOiWzU4+QTuBKkSX5N8pZBlYBBoOXEW/Nin+xEYqK4HmFlnwD7CNpePBR3W3bglxmZDp6L2d7mspwZ9xtnnW3z3SZPgLqWUTqpZwN9UUoFGjlFcxneP83Dr2TjdNIO9RBahimEsX7m+SzzlWDPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569463; c=relaxed/simple;
	bh=CdGifpXTjb+spzLE+zLsBL2Sw5L7SU7MRgG9SEVCaSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N36xYQZvR3SNaSisLkgBgQ+EqYKmfThBddoudgr14fcPYEs42ChA/54D5zDTDpfDdSNNb6fomtAhtyYjS9ppUZdFYQKVNCsZ7i5hh2vI9eQnEdHHn+uuOodUB5lXTxH9pFT7gPp5fu0oM0jkUQqCsryIQAJYQMMyVv2PeUKXVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTrZJCsU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTrZJCsU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b299b3c739so5704825ad.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777569461; x=1778174261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxTEotuK8mpwbrGLCcn25pmcSWTLgELt4EA9ZD/huhU=;
        b=CTrZJCsUQxXR8ZwX0xfPVU5Rz3CYTlqHlin7fOL9I5UmPflRaVPlsYRFqhctZYeUv7
         1xjM0R56h9wBPxcIJlI6JYBKitsOqNP+mMp6th7ZVJ+YHAN5Co9utnTkvr6aSaenYo8/
         F4h6qSlwUtIH6N4SMCN2ank9eI0nifLrA68fE+G2bS5FiViTG+mVDl6rOklul7uNuk2s
         RZN8a0e2wl2fuC2IZD9hyKN2DCuJn/EeDMsQdlVpeR7bwyQTI/JokEHD2YScXSWDWwSN
         NmjghzxJOrJ0ll800/Hl3RYq8UwJMIzISW4KFO/wzO5bLIbUMGDItHIrLbSVJlLB4uGv
         C7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569461; x=1778174261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RxTEotuK8mpwbrGLCcn25pmcSWTLgELt4EA9ZD/huhU=;
        b=tKEm8UsxYeAnJhl15xNqNdz6KOtFrA8e3kdJmB9txoQ9HfqQft2QcNxjw5PwPeUG1r
         DhPi7dGadLW91XFxB0GeRJ0fkrYTKOkJdHAovih08CBMXWcD7IP6NHx8izEY4vZbHbFw
         ms8nIG+8GKl9x10hHS8EEHQid06O7GeG1vz7zehjbTHJ6PmFQTi44V6p7Jj+oQcXUlA3
         PX8dFGKhVlZQ6+us6TBaL+YvZ96eoIm2h4zd9/ZbeKlhqhC5Tm/XgUOa8pSAL3AEoInx
         m5NQIsSmdcYGAvmdnZGTMbfAuYIGXoQUveQfzW6BPaqRxYAUP69RYdrdIsnbUItz+vpW
         7JCg==
X-Forwarded-Encrypted: i=1; AFNElJ+U7D8687VWefr3eLhuan6fZlqC+2mVTxDbHok90r52tXTsM96gzKDMtbRtZJTqkNZ616apdYRl8Kpr@vger.kernel.org
X-Gm-Message-State: AOJu0YwO41xnHZ0V1Ifj0U7zUAj3J43r/0h1PIxh2Yii363AVzVfVXpE
	MC+yhVPLQshM6mraaVV9WVSgGpSBWor0R6LuolgQ+y3juw5KuY+bIICX
X-Gm-Gg: AeBDietz7B/mflodIWegBdFChYQWej3Lxzs43MHoXdOwDtWjZkHjvQZLrCRfCiP+SkJ
	dlW2g2bxFgIVwJMiVQwyIgTrC6TmzjiOTl2ysgkbx4WcR+XSi9rpR59uzKp4HmN5rJu84YMX/e7
	rUGMB0d9OhlTldUGKzXUc+PuxNsQopbNeWn7NhYe/1iygrav5XdUB40LImqqvytdfAqdAgm3fbm
	aIoMQwuTfUV+3fC2NPa1GBpX3cWVq7em3VdQtSEW1SmT3Nnk1JyIGsPvZgV1RCv6TyR+Dl0TA2P
	OHlk+bYOQ1Z260VpnxbajLdqU6Ys0xh8GawCMj3IwFGL4LtxibScM2Ui8/EKDdB/lo3YDrG3p7C
	Up5pU2r+KHblzndC+0mEdOsYC7EljutCk5Gf2k0lBXG0baNI7FNEHuaWnnUEFyWeQhU3wmrDFZt
	r1QzxbaMA15Tb6+ZYp+Q7WVTXDoW+C86Zl6d1MDoCcVqC7kxY=
X-Received: by 2002:a17:902:ea0a:b0:2b2:53f5:463c with SMTP id d9443c01a7336-2b9a23199edmr42138745ad.4.1777569461529;
        Thu, 30 Apr 2026 10:17:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caac6e7asm1903835ad.30.2026.04.30.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:17:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:17:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add MPS mp2985
Message-ID: <0967f7dc-f65d-4a02-8816-65b97847f406@roeck-us.net>
References: <20260414092801.1067470-1-wenswang@yeah.net>
 <20260414092921.1067735-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414092921.1067735-1-wenswang@yeah.net>

On Tue, Apr 14, 2026 at 05:29:20PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2985 controller.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter
