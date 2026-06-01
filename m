Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A8339B4A6
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780310507; cv=none; b=jf6Zohpr/72hCMWiy6EMLAU1qT+m2xFaPDkBfuKw4me/5WL9INXxOVDMQmtwvEUC2ki7qeZMsOnNMHl+Ez6Twe3mB7U4aChpwMTW4pFo16F8dZjDdbIzUWjkQ7C82a/I353C+Pg8JvbU1yduBzlqVKED0WaTbB5ihPyR3v3MjQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780310507; c=relaxed/simple;
	bh=s+c0xM8+gvtFUA5waeSL8CyP5smDxMDZTJGiCFyuu+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meRGUPdgFsxIc0N8UxLAMQewj4jBADHSR6nbMy7o4UysxhSQhCmZ1ItHa3jU1YYkPHlzVwmJR6qi+X65G+pFHMSFD5Vr/jznxskwlaninYZElOYYhw0mN62atxVnr5RM50QB8tpw8c6Hz554YtL7mT6dGmLxMCmmsdYSDVsEWGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bymmPY0O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kp4KhkQn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bymmPY0O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kp4KhkQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780310503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJeaJGvB8Mvl8AxiXOwr4lw9nL4JUXUEE6pr5CDoFrU=;
	b=bymmPY0OLOyrGCqSdtNdJlXFDJEKYqH0Dylk1uTduu/bynYSdkRxcCg87kYRjpJoeT4Sti
	1x0gvYukpsH9uoDQOZ12oXU1Q9SDtxZIb4uQ1dA4V0SN/emp7UhPlKspvAJ+XyW4rXrnKE
	DRz7RVPYngbNOyiVw0/z/Ztta2sWL28=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-QcuXNGy7PgSoaPCgBmsGcw-1; Mon, 01 Jun 2026 06:41:41 -0400
X-MC-Unique: QcuXNGy7PgSoaPCgBmsGcw-1
X-Mimecast-MFC-AGG-ID: QcuXNGy7PgSoaPCgBmsGcw_1780310501
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490ae4d89e2so3412525e9.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 03:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780310500; x=1780915300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJeaJGvB8Mvl8AxiXOwr4lw9nL4JUXUEE6pr5CDoFrU=;
        b=Kp4KhkQnFsd/XI7cs8AxUsPg/3wzfEErDmlti4i7Pu2eGxmyGiBF9M33aOzzCMiO/N
         t26g6EknRR3GdpJMJcoV/msTHihOmE0lmjXos66C8PSRKS95ipUMJJqjko2Hc6KAzLTW
         eijWvKk6ftacfUIz6HWyPBZJFTWv8CKzHNGNUqhReEiuBeCJhEsBCuye7a9RWxuAVRn5
         JsPjAEHq6cvc5PWR3WtLAbEtxiFB5Pf4Tt3rEQvJ90K8WTfZxh0hTE7wstLFMOF3s/1c
         l3wkdCTnbxW6K4Bi6rN3ldszscaCJ7TRjVhq/tkL2QyED5uzvaS4oOZPkTXRrHske1/I
         0VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780310500; x=1780915300;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJeaJGvB8Mvl8AxiXOwr4lw9nL4JUXUEE6pr5CDoFrU=;
        b=IHsXgOvDHLbMqrQSsxz8qObTO2yevHGQF1OJHpy+GGj5lUK39OEF5i/Jwbv3LPsFBj
         jM9GdaIWHsSpQ2ggZlV5teCkrfccvnsu0I8doYC25afn/fiQfzA1DAVozT7CsZ0Bg73M
         ivROAXmSFLhURbTLo4rtQ6z5jixC7rADOFt1UPV2a4J6e4GJLFzhynPBE41dIGErGllN
         F4fwP18UumizYMJL2/zz07YLknA+1bwxa6UepKVOaOHOo1LXKtNz02NP3ZnAi0cvkY1Y
         DshOKNn19ffzsQuqPz60YJSCsgLySL9rz10wsAIFPfZi3u4/HJdkC2y8pxEI9YsXELRD
         YwSw==
X-Gm-Message-State: AOJu0YwmU4iKX80XevLzfP+F2P005Aq/POAryZiYcUDwT34vnseAtPoG
	G67gl6lregXADzSph+rvci0hhIjt+Y45yg786C5kd8/v1Uozoay0gvxhEm0YM2d/q7KfHo5Vbr4
	dt6KrzPYxXrclLWE++4c+0Ul/LyqqcMiQO7GwIkXmZM57dJpV09AMiYawbEUnfyYSsG7BXT4=
X-Gm-Gg: Acq92OE25vyoO5S/x2Ff58LRzR0Wrzgtjg0FDRauihRhnDtTbHM/P35RnmVocCJdby1
	k5kaIvYnBOSe5J5LFUPqBsxzxCOo95UrY7f7otXfSTerBanH/fMVEDBji3QMjYl+xnQ+rTNrifk
	R6+CcnkbOP18KK0QYHzVp/LkTs5q/Oyp1LjoFXyJDrXxf8onUH5seIkdNLGYEEfVGzyJWVaObA6
	u91SR85kZ5KyIEA1cvo/z0nnLwcmO+RAHfdty7CuyfhipUhOLGNIyf0YD652RTSwt66Vw1iakLJ
	nJ1zttULFB90THoPRV2JeNo7nxM1eTzyiSC7nQIOSUsCtzNA2zWtI6lh+7uGVRrZtjT1Jk0T6/Q
	AKwNrzuxD1R2AHZM+yUUIymBjEkyyoHUQoAUwD871GB0acZfAtUg8elFD5mO8YsASjdWI
X-Received: by 2002:a05:600c:4fc7:b0:48f:e230:2a1d with SMTP id 5b1f17b1804b1-490a295d5ebmr189424315e9.32.1780310500602;
        Mon, 01 Jun 2026 03:41:40 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc7:b0:48f:e230:2a1d with SMTP id 5b1f17b1804b1-490a295d5ebmr189423955e9.32.1780310500125;
        Mon, 01 Jun 2026 03:41:40 -0700 (PDT)
Received: from [192.168.88.32] ([169.155.232.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c3081sm24553503f8f.15.2026.06.01.03.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 03:41:39 -0700 (PDT)
Message-ID: <69dfe2a0-ce0f-4a92-98b5-c4cefd30ce49@redhat.com>
Date: Mon, 1 Jun 2026 12:41:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 5/5] net: dsa: ks8995: Delete surplus driver
To: Linus Walleij <linusw@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260526-ks8995-to-ksz8-v3-5-c530f651989f@kernel.org>
 <20260530004902.BCC381F00898@smtp.kernel.org>
 <CAD++jLmZoGh+o5YKfjoUCWhwiRaO+Lm-9DFUdUzd9KpydWK27g@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <CAD++jLmZoGh+o5YKfjoUCWhwiRaO+Lm-9DFUdUzd9KpydWK27g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/1/26 10:09 AM, Linus Walleij wrote:
> On Sat, May 30, 2026 at 2:49 AM <sashiko-bot@kernel.org> wrote:
> 
>> - [Medium] Silent loss of switch driver functionality on kernel upgrade due to missing Kconfig migration.
> 
> No-one cares.

Uhm... I have quite mixed opinion WRT to the above points as try to
avoid breaking users in any way. I'd love to ear a 2nd opinion from the
DSA crew.

Thanks,

Paolo

