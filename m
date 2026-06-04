Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6C313E10
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780565113; cv=none; b=Nt5orccqx/AexYVaRJ9UPV39i3GFJOreQwsynKeUxaf5MTofJrUK9CypDmIb0NKJKaYajoyc7ot+7gN2d5KUBI1QeQMryWtDmlvEjzKIfIXwYNv0XcSfwY6RlF1Jfj5LTHF3U/a/g4W7pIO/cqIKspnKfHbKxFPV8tm4U9imj0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780565113; c=relaxed/simple;
	bh=rz20gXhQdVOrTdEhmhCpXq0m1jn6BoI/ZelHshCeHzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjgnHYaMmonZgZiJBASaZUMsPGCkmxhLGgLo6x1iarYrbpsZSNd5sGgU1uzzH9Qk00IaDG+37O7MLRSl6HlD0WUavPlch9yaTwNJBTJs1KVRooJqd0K56YEGW+4ElgdI/3niQ6MGxqVpSHnXwhtBci/etTOSSuX5CPk3T0g/HrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmw+4LnL; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmw+4LnL"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36c68964315so253971a91.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780565111; x=1781169911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rz20gXhQdVOrTdEhmhCpXq0m1jn6BoI/ZelHshCeHzA=;
        b=Nmw+4LnLVpRJV/IdI8giZDLWdDFcOinq0XfLqgygraUWndBHFfgddC/UVbXFelmjHW
         PjYbVmh7cSrtlIBBR+hZuknotPTR1kCt2UJYw/5kyaj9lf55xCBy/o7W3mN0o/WrxvTl
         3n5thIhFRPcJWVoNu1TjEXNZMo+6zNJ0tEcdyn3ZKX7LQSMq8e15qOX/SowNahdDvGxi
         xZbIC9D6dmEIFCiLYxM0nsesZ+fwvnCj6Nyy5Inw1/3k4HDiWTgNxzAOifBNVK4x07Qk
         iK+Wy5xscApkBflsgaFIBMYcBMZv8PC9sxiJFW7rdgApczRQ1EKYEuH3zNh43yKg/3AE
         haEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780565111; x=1781169911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rz20gXhQdVOrTdEhmhCpXq0m1jn6BoI/ZelHshCeHzA=;
        b=PnOZwmtH6VcbqtV4+bbZCd1cbsmGaSnjCWKBh5Sb8e95PskZmlxr6w5GamMyOIenB+
         5EPkdNyt+AK0+Etzc/s5JyJ/3ELJ9at9XMgbbdlBnVS776U/SwMGRt2IfX7kSqOlenfa
         bcRBCSUvraOTtpq0kDUm7ot+BO2UE0fwRND6aP0x8WUmwODpNQoAFqRSiK+5J95aeLcv
         LXWWU6ZozMT7qEgfdY9K7Y+ivbTfRTDa7m2OK5MWHcBakWO0cB/YZ5uLnL9NXJDyuaMk
         Th92sEEPYE/DvXai8p7d+JeILjSzQdIqq1Q2sAtTbDOe4yA4nsaEjllWQRwN1bYdT2lg
         NF+w==
X-Forwarded-Encrypted: i=1; AFNElJ+RpYHml6RDdNUl0RosEdDe9hCoKrMYalAvdW7+Mjf1tku2h8c5bhOv+o7MGlV6jcdOO6PW2wi3HS1U@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh41D+uwyfcQr+DAuBnrHJr6XyQ9HwcHqizi3nSHakSUuHgnDO
	Uvuf0htZm1Vvj6Yii67WR1Jx25ISgc9zxH76w/5gQcmOKcpjYFGDiV/V
X-Gm-Gg: Acq92OEMMQaIoVp/M3RZxbHG7v+R726S0zBDmvOYQ8l4gvGF1Rwsx8RR6tk7FdD3OpY
	7UVdKBf9ukVzfjUdqzcuBXEKXrYvLafmlgiEKGMiPsV6BE8l1QUJA3/6GMQjCgc5j/U/2KNfrWM
	gf8QRix+PCBi8EmxcFMGWDjDMY83Rvva5ieD4kcm3WuYGYkMeMv7mmRZ2P5qwy16IkdqBj70U9g
	KNyAy94l7LRHdEnAmP14/QgpEcdi9ync8pkCyEBzM8ROJoCrlPQ6P2U82KPXP4LD0OhEjvdk3Xx
	YP49y2duBmihL2lYY42uITtoSPh//Ldk7TzTOto8zR6OaOjpU5O9cc4LBi042ckEefrZlsu09o3
	Y2ddZS33cklMlYTyEJOYEL8z/r1r1i+gXlt4dM96zAVhWJ0V17z7iYtosQTS2v0gbDPZkt2AWfJ
	O/7uAaVWddcRJYZMNbGS6F8fAE+eqSAWAa6pWIZS2nrAdl3lvQs0J4NN02CYPdxRFtEZAOrLOL1
	NpE3m/lhGilGA==
X-Received: by 2002:a17:90b:53ce:b0:36d:c159:8f11 with SMTP id 98e67ed59e1d1-36e34775d33mr6490845a91.26.1780565111106;
        Thu, 04 Jun 2026 02:25:11 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e7014f288sm3459212a91.2.2026.06.04.02.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:25:10 -0700 (PDT)
Message-ID: <b90b4b9e-9e11-40c4-9407-ac9bdc83b0b1@gmail.com>
Date: Thu, 4 Jun 2026 17:25:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI
 Controller
To: Conor Dooley <conor@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-2-cwweng.linux@gmail.com>
 <20260603-daybed-absentee-1b64f5caabe0@spud>
 <41914879-5fd0-41dd-b097-2be80096e464@gmail.com>
 <20260604-anthem-jokingly-8d8312ff0c3f@spud>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260604-anthem-jokingly-8d8312ff0c3f@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Conor,

Thanks for the clarification.

I will keep using my personal mail account for sending the patches to
avoid the corporate confidentiality footer, but I will set the commit
author and Signed-off-by to my Nuvoton address in v2.

Best regards,
Chi-Wen

Conor Dooley 於 2026/6/4 下午 04:55 寫道:
> On Thu, Jun 04, 2026 at 03:07:31PM +0800, Chi-Wen Weng wrote:
>> Hi Conor,
>>
>> Thanks for the review.
>>
>>> Missing commit message for one, but why can't your Nuvoton mail be used
>>> here?
>> I apologize for the missing commit message; I will add a proper description
>> in v2.
>>
>> Regarding the email address, my Nuvoton mail adds a corporate
>> confidentiality disclaimer to outgoing
>> external mail, so I use my personal address for sending kernel patches.
> This prevents you sending with your work email account, but you can still
> set your commit author to your Nuvoton address FWIW.
>
>> Conor Dooley 於 2026/6/3 下午 11:24 寫道:
>>> On Wed, Jun 03, 2026 at 12:35:50PM +0800, Chi-Wen Weng wrote:
>>>> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
