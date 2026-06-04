Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA63B472798
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579148; cv=none; b=eHnj4odISykb4f7HRSvHFcYRV3PAQHlOhcCf0Hd8vhMAQxJ1zMFBEq7AZJQeYkNU2/LFjmEwMtvhspZIY5SW+VmZ8XQPwAPM05SKTfr1Ove0cxu7OAO/zI8bDwsk2FVXXBQrSAFdUWirYjM2srm8je8B9mUKVD9PO5L6hSQgAOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579148; c=relaxed/simple;
	bh=ZL2GPEr3Ol2qT7YzkCE58F7Qiw4vVP+eKl/QElSmojU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gfCWc0dwuE+SRu1cEcykMyrLchREl1FxJy4tQow9ReqbDxP5bUK50ld7Mv6ZjywjHqcvcCDSNPuNZqliXqj99lw3ZiQnt6gQ6k5d+Vq1zPqktajlsBn+YrVkbWtWv6M/Se10S8/CQKPCTj9ioRpzqkGfNZf9TI6Hg/6wl28uzWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z7qWBLZ+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YwWmMvKB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z7qWBLZ+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YwWmMvKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780579146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9NLf3OTZQcVdHSOSM3gNimtkOpf0GLwo462qJlWyY4=;
	b=Z7qWBLZ+7W1wD640MW6X2CeqEV9yN0OvHoVCmjzDuTTCJCuA92wBmo5mIP20YEZN4cwAzE
	T68zOnpJ+MsAV2N0af00/ba1CDrCKjY1GtaDzfa3nn/o8Mp85dj2bZc2gZ80VkUddITN+l
	z2htKQZYij+YW07fGTCqDMcnPTDpTTE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-EBvf-4aSOCy3nxwU150NHw-1; Thu, 04 Jun 2026 09:19:04 -0400
X-MC-Unique: EBvf-4aSOCy3nxwU150NHw-1
X-Mimecast-MFC-AGG-ID: EBvf-4aSOCy3nxwU150NHw_1780579144
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490afe64f26so3432735e9.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780579143; x=1781183943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m9NLf3OTZQcVdHSOSM3gNimtkOpf0GLwo462qJlWyY4=;
        b=YwWmMvKBg9sN0srUH0/NYGk8t/fDExQDXtR8OsE068Yj0onW1r16hCDGGeFeWLbw80
         lzwlW7Kq4bjnB+JfpozomDf4Hr9XoNq5pLgHLThbEKBAtGzjkqEbapxTwCpus4MtSnrH
         m7Jzz5JZzGyKBZhV9MVfkg+zdbDc9V5zo9Yr7BH+Ct/6QY05rYGZxmceVPJEH2a+UcoE
         UHVERDmswwo8IPbNWPgMgHT6o6QUzKBBWYg0dbPgu035CvGPnvssKqcpYeTMPQ7F/EpT
         NdSew8+ELJC3XgBpJSJdI2yjqbDtSN6jwfPytI7YczQt+KIFkDi13DCqIvrss8Wllv0k
         X07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579143; x=1781183943;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9NLf3OTZQcVdHSOSM3gNimtkOpf0GLwo462qJlWyY4=;
        b=hWx02lpAW736/q+91TNBp8ncvBZ5YkAqZpJv9DJM8+80VAXBRjvUen5sGz4T2W3FtU
         5+OTnlweKQPfr0dBVGayRAx+Qsqlpm6/ZSYh4ddTfolv0rD1DzfaI+ouPnW2nmAjJq3L
         i+AH62XwExesSJWGFG4Wrf+OxvTHIlXzMT40ZXdt259NXv/6LudYncHTRJYLHQgChciR
         PGkAHvjJJ/ZVC47enlvHPCcl0yZRqE/JDIk2nNDM52q3ILLltgZQM6CHmOdDqszzHoy1
         wfGXK/Fy1GpdHXlx4pVhh7qbsAK8AhpF2zR4wBPaPBPmZfnzYm1CB9P3QhS8NZnYLq1S
         6Xxg==
X-Forwarded-Encrypted: i=1; AFNElJ8gvZY60qJWxcfaz7G7Udj2wIGgnZ7k9jXXOPhL1A3P5KPQjXJ4uyXRdDCLWITMH8vnnbBD0AJBXJLV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7DbuWi7bkO6UVxP+KLbHvEZtUEvZ6wZ6GU8yDo+xfTr+mlJD+
	/2QlXZ/l/GzL/VzJLy1IE+huHUq4luyQsKR5yQzmUzFbrJuNjeaUr3d9je/94mDdZwLDzm6R3ZS
	TS6ID3SXM3pqumLth8jzIF9+M3J6NxSDq4UdM1Ud13TMBiIvK8HyjkSxI3zeuUME=
X-Gm-Gg: Acq92OFSTsMMq4q0UdfgquaQoBSHq/HQxW6faABtB5R5KUsOm0Dk1cIFyeMrBYwqkgk
	SogfTBx69HeEnwbIifm9jf5ZF8YIs7B3qsDgTOPULp2g7mjY6MJ+JzD7iJJA1ZX6yNcG7OhFxM2
	u1QiPAJt9HPlSZX0zduswZ04QDwl/li8fWcklmEu5YOK/p+QAgnmBRI6fYga5zxxE6JJc/J16XU
	gINeqoRAxCgMn14LegQiTqtzxXd8QLw4BO32/1DBvIaqFi5j/moKCBVxwbu1W4Cn/ZBlyaN9nbE
	/9pwTC0iFjSxgdH4DvGDTrF/vQB25JcMtd/QaFhpcrCgGZrQkL41/gqzEZhi7nNLaq0hDt3/NKd
	5aPfAl54FS4G6WFaY+3JizAyBHXwqzveEEHGXJlU0tWZA0R4W6GvAL/tFgbbk/eQvkF4=
X-Received: by 2002:a05:600c:6095:b0:490:bb60:68ca with SMTP id 5b1f17b1804b1-490bc4b54b4mr51068705e9.3.1780579143397;
        Thu, 04 Jun 2026 06:19:03 -0700 (PDT)
X-Received: by 2002:a05:600c:6095:b0:490:bb60:68ca with SMTP id 5b1f17b1804b1-490bc4b54b4mr51067875e9.3.1780579142742;
        Thu, 04 Jun 2026 06:19:02 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7a273e3sm107604705e9.0.2026.06.04.06.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:19:02 -0700 (PDT)
Message-ID: <42052da1-2d33-4023-b383-482006fcb628@redhat.com>
Date: Thu, 4 Jun 2026 15:19:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 0/2] Resubmitting with cover-letter and threaded
 patch series.
To: Selvamani.Rajagopal@onsemi.com,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Piergiorgio Beruto <pier.beruto@onsemi.com>, Andrew Lunn
 <andrew@lunn.ch>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org
References: <20260601-level-trigger-v3-0-da73e7010532@onsemi.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260601-level-trigger-v3-0-da73e7010532@onsemi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/1/26 6:07 PM, Selvamani Rajagopal via B4 Relay wrote:
> According to OPEN Alliance 10BASE-T1x MAC-PHY Serial Interface
> specification, MAC-PHY interrupt is "active low, level triggered".
> The specification mentions about the conditions in which the IRQ
> is asserted and deasserted.
> 
> Bug is inadvertently introduced by treating the IRQ in the OA TC6
> framework driver and in dt-binding YAML file as edge triggered.
> 
> Changes are done in two files
>  - OA TC6 framework Ethernet driver
>  - YAML file for the vendor that already uses OA TC6 framework.
> 
> Maintainer for this driver is already informed and aware of these
> changes. Testing for these changes was done in onsemi's setup and
> found to be working.
> 
> Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Note for future submissions: the cover letter subj must refer to the
series content, and not to changes from the previous revision.

/P

