Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC76333CEA8
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583147; cv=none; b=DXWjCFjbRQGtvUMCKobBZIz5eLVtamNOpqwBcjDvQXFAjFBNfhiTNi/2VrDRiS3r+JDqqX3qp7NUBIhvWH1TSazZ6PQHHCz5hzSZ855mnvXyBz3jbOFGL4eHx56hd4pzAjSgNaYpmLSYJ9ySPzpXhME04p7yKEGoE5AfC4qEzjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583147; c=relaxed/simple;
	bh=2wYO5D/BuxBvW82ZWdwBdAgbv77/vthjMh+/d5X866Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjOAH+36KaKww1RjLn9mjA23j4qnBe9IW19mTWTb7GqpJFAGEvG+ALmkYhcDlACH5/levXDh2EMYgJEpClfFDrge93Xd5LnaeONU7fgMTxIOJDDy8142WMJK/yXsL+sm6UKAW3Lc1jvJamUN4nIwLUE4yo+a11qz8jWCB7uuDu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spPenUxj; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spPenUxj"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso3424117a91.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775583146; x=1776187946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cVQdVcDn/x8UdvOjp6K2mfAS/Bs2g95UfBr5r7LzxA=;
        b=spPenUxjU64rq6C2qt9YH1ojwsyyhNu91xhm3d5YA0/UnVkzRBzTf3NgEbrvzywqvK
         HtOEfVO52rf5Qx3vMHKcDrFCMEEDe7QjRw5P+1QmUxBjqOnDag5j6rGcIyMrn2SbgAdp
         lUk7vjDdggt2wCap4p1MmeCZVh2FONdonAVUKfnt7hjFvHVjGtWU6C85T06EqWSOGOYV
         wn6JZMVg+L/gzN0d9gvYDcdXBzkGGf7PcJOqX+EI9aVTU0BLpdPePDvJlEq7vSpsyNr3
         nRCy4ZQExc2MJzTXUcLkzX0z7M+4BOqhrWt+QI9pfVHdn4Yg9E/guvuVzao37Imh9umy
         rsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775583146; x=1776187946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cVQdVcDn/x8UdvOjp6K2mfAS/Bs2g95UfBr5r7LzxA=;
        b=dCPiOtlJvIjbZehFnuHz9mnS96QiSCSfmznsIHgh9XTPt1luRldjNYasf+sr93GBKi
         C1VjkpCxPcHUDnd7LrgGDotYr1jBNULn2tKZnqaYJ3vaZovXKZ5L0eC8Y47rGPw3IOMJ
         +TCXjs0VyxGUuiA/fS34PJc+iF4tdq9oseIJnzeMoZIpQI3nKdDRqyUd50EKn+5icuPe
         CGdo/fx4ZRnblHXHUlffcWXbpQrKGvI07KtkSBEopxrWSqT3eJ68ptVVe19ylvnymmEb
         i8OBn/7n4R7XmtVmyHGftpux174xvSY/Fn95AwT9u7H7EGtPGLdnbSVSX0Ae2HbL1xjM
         blkg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/I85JvkFzIE02+OfGmgtn9GkGKS0tWVGB8qv0+vUfIP+JA33Mwb7TmbORTn4FkMADBa1vEkfJj83@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWGV22lZBS6zOuLHESSM5M68pvr2B5+pGvfI632ZRd3E4aamF
	0xegBhhykihwi+bV8ZWbEzfEVZb9gHxK5UJbWTGJl1LmsRGUBMDqsAtR
X-Gm-Gg: AeBDieu3taKROPrMthRZSDTVtkOK9yK9HGDVZL4RClqJWgp9lQTAcnhp6rsbXi7m1Ws
	+9Y9/IvgKFu5XbJXwycvx+0BtgpNqFs4V/6XDdzl0qhZR1hfcaqpCZlJsffow0plpezMCLTLn1O
	PRlXvkqtbm1WQl4Vq9YDXZU/9E+0lTNLW9KIoKpfcsdtv7FISk+o8e9NCKNg9PXHRxnVnPbAtby
	e7HEanDCvIrOxTnSgc0iIV+23W44MgFCVK1yuwG0o92LdmGtHF0HI915celDQRDP0MUNXVIHAzk
	0l7WpsZv1Cu4G7BCKk3EKYOg/GCtLqNlDqrjoCH5YMAnlTRHimFYOUnFK5FrAlDEyvW3dvmhfTB
	2QQRu/mHyDXuxBVTWDUy0vN3k7Igm07bITMnhsq+N7fRSwzgef9k8UhOgm0Krt+lCsv78rvY4zT
	odgltCVVH5mwXnJ0hOkZQfoJSBq8aPSoyGeCMyRlXxW8o7rx1S0w==
X-Received: by 2002:a17:90b:4c0b:b0:35c:fa8:3673 with SMTP id 98e67ed59e1d1-35de6946f27mr17738388a91.22.1775583145877;
        Tue, 07 Apr 2026 10:32:25 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe95abc3sm23531420a91.15.2026.04.07.10.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 10:32:23 -0700 (PDT)
Message-ID: <644c9b98-cf7c-4e5f-bbde-7d848583f8e1@gmail.com>
Date: Tue, 7 Apr 2026 10:32:19 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fpga: ts73xx-fpga: add OF match table for device tree
 probing
To: Phil Pemberton <philpem@philpem.me.uk>, Moritz Fischer <mdf@kernel.org>,
 Xu Yilun <yilun.xu@intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407172730.1779804-1-philpem@philpem.me.uk>
 <20260407172730.1779804-3-philpem@philpem.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260407172730.1779804-3-philpem@philpem.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/26 10:27, Phil Pemberton wrote:
> The ts73xx-fpga driver currently only matches by platform device name,
> which prevents it from being probed when the device is described in a
> device tree. Add an of_device_id table so the driver can match against
> the "technologic,ts73xx-fpga" compatible string.
> 
> Signed-off-by: Phil Pemberton <philpem@philpem.me.uk>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
