Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61D535FB3
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072614; cv=none; b=kL4V0Ugl3kJJvoUahJcCRLcT9ZRN6RYAGrffEu00fuB3HpOet89lAP4TEEkSJqqaePF07MuARq2ti6rakaBSQQGeZOghyvt21gk0fUuedp+kLqTWNMiLF2XvZSY5OAfORnz0ImX45toi+5+BKoJxGVdDQAALJ4UkpKXAXBuqPKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072614; c=relaxed/simple;
	bh=pkRjLax3zzL81fegkKWM65x9n1sdWMbtEO8ZJd4dpd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHCQsgxrGH67GLpyTICB0ClspMiFQoZ/tFf9sPLiz+oxQYvymWvS6JB0sWtRC2NUDp+PckRepuuVzVUQWfY067DYttYEBPiKx7fqLwVV23dCxtngcWL5pdaHA2UcHhgiMgjmgHPdaTOpfyWuYiyPHY28mP7rjaxQzfLJjCOmaQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fm2+vrCk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OOLKst/s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fm2+vrCk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OOLKst/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790072612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N1CYMfDy8oUHGmL4D9db0zZo1jNjyFLIMfncfNhVlyk=;
	b=Fm2+vrCkIP24IR+mik5jWCD4vk7Ov3WtfwWMFPadEaJ2SRtSS/y6z7X72XWRaDh76HBiyb
	fUUQhqW0q2KzoNhoV8zF7kHT5ykgLfSRbNvsuhi0sa5DPlqydMggsdulYOBqTwwSzdVVrO
	05N8Yzg5JgvlaMRjU4KjFNkOX6s2oqU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-aP9EF4FBOHyaKhDPY_payw-1; Tue, 22 Sep 2026 06:23:30 -0400
X-MC-Unique: aP9EF4FBOHyaKhDPY_payw-1
X-Mimecast-MFC-AGG-ID: aP9EF4FBOHyaKhDPY_payw_1790072609
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e82768ac2so4505915e9.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790072609; x=1790677409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1CYMfDy8oUHGmL4D9db0zZo1jNjyFLIMfncfNhVlyk=;
        b=OOLKst/sKdTUgUSr1BL+2Mr91fjyITqW7fi4BuoMLngFw80M5yHtuKK4gsKIzAFs9S
         bi7HmsTLRxx3S25DkqjYy8U3zPfa5vGQRrfYlcdsE+2a5BLKpvQSiIVysqTACWGKG6on
         t7eMlT8ke49aEaM/5IRAOuhpGbYY0OucqzxBYghOzohZHBIDH9vgXgKGvxI9j1Az9Mel
         SzvqW/7c05Dq8iaJAu15SmVGkC0jlmqBetJB2gUpE5zK8xu/u2hb840BmFCZbdsqzKNb
         wcslhjHz5b+XFm/6iy5Dt9tV6LgvCmPzAcWNLomXgxVcXNoVMdneNssKw7MZBu2fi+iO
         5/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072609; x=1790677409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1CYMfDy8oUHGmL4D9db0zZo1jNjyFLIMfncfNhVlyk=;
        b=LWK4Oae+VINpfUbSRqLpX0f0YSOrzX0jiNV2TOwq8klKL4NGHzHnuAeLwVD46xXzZF
         D8kFuvAYLmBC3kZMcTb1xVem1pkXB/HCDFo+474bxZI2CLGpgUl+SXfykv0OEx/sAo0G
         +Y3qVQemIeyK7btlhUJrFBTiOis3FA9m9mQAdwagitmG+5hrmraMDExTXncVs97XnIee
         pgLZmlq8ARyKiRu/BRETCoxJXLmgX4AJLz+S7FM/UOnbR0D4AiqmGDUOWiTwnyMhvJMb
         y1wV3dMqfSuv3y+dBflEn1zxTppwC2N87EJmNF1ZjWQnMGM0NnXJm+u1Ixaa0UyXaIig
         fsNA==
X-Forwarded-Encrypted: i=1; AKwUvBxpfioKspj+iosuivkAIlbO7sFMq5/YxX6iGd+pU/PF8HKFFYs1XbVcJ5a4W+x/6ScptIlcuyxybjDi@vger.kernel.org
X-Gm-Message-State: AFuF++m09vxJXNaaZkZc8YMZP4wpAolJ6L2cyb4LxMIq68BdE0WvoqKy
	h9Zn33AeL4+qD2BsVMtvoQSeHLkOK9kYkxVYfD9OCxNuigm30nVlj4hc1pEVtqeUBJyPYBTzk30
	KMXjY8w73cZrGW0OifQQTFi2aEXBRGZreSVg9gdfje6YqYiabNpk553B/ZgtGEZ0=
X-Gm-Gg: AYBFou2h6QVx3e+XR2TkPdq9bJwP/Ye28wKf86yPbVVZTundMuLOqCdM/V1WWN0On/N
	qoiTYtVoNgSTm0q0UY41R7lk1XMfqHcp5XuaMXqPwzNpHqcUjqQbgGrHtzHiQYET57SveaJyzLy
	b0j1O78aBt9lf0+F8jYhNpqGnbOw3S+NVEnlBDKHZ3af36g7yufCdmbO3Ok/R/aVALNIKii9R2c
	YyLp15ruRGPMUHCK1vDdMR0Nu1UC5iim1XrQIhd2Lsv9zI3z7CeVT2p/AORtcCVEEJ9qr8oKdmw
	nJX5UWRUJjPTtL8Tn6wZemm7B1GBU2grRBdwNUlW8jCaA+q1s8dTGsIlHqzhk0g7b0OpVNWCwKj
	QkmngRdiFOZ+j0fnmRkt6f3gaPqUkxIw0G9MFe/6dhSrWjBtSc+EOm1RAMV/sH82Jho6Di2ZLyg
	==
X-Received: by 2002:a05:600c:34c6:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fd88607e7mr39791265e9.5.1790072609594;
        Tue, 22 Sep 2026 03:23:29 -0700 (PDT)
X-Received: by 2002:a05:600c:34c6:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fd88607e7mr39790745e9.5.1790072609134;
        Tue, 22 Sep 2026 03:23:29 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaab0497sm48489045e9.3.2026.09.22.03.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:23:28 -0700 (PDT)
Message-ID: <a5fa376d-0826-4fdc-b99e-cc4a0a623cbc@redhat.com>
Date: Tue, 22 Sep 2026 12:23:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v20 0/3] net: phy: Add driver for Motorcomm Quad
 2.5GbE phy
To: Kyle Switch <kyle.switch@motor-comm.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, Frank.Sae@motor-comm.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com,
 jianmin.wang@motor-comm.com, jie.han@motor-comm.com
References: <20260917131441.3428554-1-kyle.switch@motor-comm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260917131441.3428554-1-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 15:14, Kyle Switch wrote:
> changes in v20:
> patch 1: Add phy-mode description in properties in
> 	 motorcomm,yt8824.yaml

At least some of the sashiko comments looks legit and
relevant to me.

Note that the cover letter must carry some brief relevant
description of the overall work.

/P

