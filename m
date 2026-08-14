Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D911F3CFF44
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786726509; cv=none; b=kCgQ0RcTcvKR/IhLtd3Kz1Kl61saOJPxIRYiHGHEpDcRDZTw+PnS6IpUgRbRka2Lrqhq7qutgeILY24mDrDCQHXHzv4+WLOdQTHNpIhP3bYrZ2AxeBx6qn4/eOIMuWcir7/ltv1NKo7rrP6ej6PTFxG2ubuTlvQLEh9LGxtL/+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786726509; c=relaxed/simple;
	bh=i2QQU7JdAC+aaX/P9rI47R8LByKLDiPOAciQZkCTTRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EqGXQ89EYJFIzP8zrSQ7zgk/IX3rd8YnCmBdG7R5Xpo7xihiPsr5Surw0GY7E6hmCMxwH/Zjl6s4WK3qds6V16tjrPPF6TecldBAV/b34C1UjNunZGzc2fDqNg3gOweZ1co7BxXejxOKQtnHKEevPz2X/y8LZNdzrj96moJZ/KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=wc+ltNmu; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="wc+ltNmu"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-934974844ffso84925885a.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786726507; x=1787331307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClQeFE8grv4Zo5HkAwOcQ2W3r0In4+kVu5lGLxtEbvg=;
        b=wc+ltNmuSp0ZzaqstqnlydqTIKCrfrFh7AFAiz2I/+NiHfwZSP5OlfN7mWhuIBpyF/
         bf45MkYeaU0Y8s4CYU/nwqq8BP1mwmKaVgwLnv68F5nYCvWL1eJljz0/IXfNQAi7FJ7/
         2LhVwhZdhbAmaMz2MUSuUd2ZEcq40qKp9mKIBWIyBQbFCNPBqTY2mRkdatFQWvj0MdJE
         qwIN0YwDy0T+E4tKCBkRPaPFYLohK8DVdizq+vfBn/HnwHWdBZAWJUZH9fMNyL0D/RVd
         IHoE5j2WZWOim9vCkgEWfn6QQ/gByzR5YXHrhpa37aWV85BtcSX95K2UPK2yAtuZUJtI
         wxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726507; x=1787331307;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClQeFE8grv4Zo5HkAwOcQ2W3r0In4+kVu5lGLxtEbvg=;
        b=DdfNZTjiYSssHtMfPbv5X3zAmdacVypdNRZ8pEV0KrdhZLB5HhT+w4MnEbUzt4uLq6
         SrGqjH1ENhgDyivwgqmJVvqQ1b2JV3LGIpo84t6tIiT19oTe09GeSvQxOswj95s72lH+
         ZhhED6N6OUMFseOelih1JIHPCRKV7abqDoYTHOlxMZch1/IsBNvd9dCe5wWRc/uY+FYk
         OxsuJ3M8tscpXgA+NX6hggL4Y/PpIy525BHXxgLbeXou5AM9Gc6Qx1Cc87FDQPUFINYk
         PDz24gFlmYrC4eqKAxkwwd9pFz3v3KdpF4mC12Hpty+ay1ktsJypVSht1n1ic0eCsSWr
         ystA==
X-Forwarded-Encrypted: i=1; AHgh+RpPO2EAq1CNqkhqJ/y7hTQ87rWbR5dq1Jk/7W8IZHYOHOpydQEqAxXQaaux7Burer/pPY38//DQyDVH@vger.kernel.org
X-Gm-Message-State: AOJu0YyYKYglkNzQEmVcChG9kIrDmurMigwtJfhuFrw+WlZmrHnLNL2k
	21QgUq2svX9TGN34nVEtq/c6uoKwD1o/aZLbYMV6LsHaHtSvDZC6Q9hwYfYDAH8DQiY=
X-Gm-Gg: AR+sD108r0qba25PvBI1or3/27OqEstnzpmP9cZ6Jt6ThhAKVHgFQgYRUWz0SSstd2F
	YYHeRvSEDJaPkbkvtOH6nGK8NSv7xDDFfKPMJN2BnTBoXqy/A0ap1tAHwB5z8kuE75AxUZrmkl7
	z77AncpLUxBF2hh51MX+tXaPaU9L3XUJFuhXgdCbTj1jMdckXwG3tZMg+smC/SIuGm+YIIrrD2h
	dLYnNc9sEc9HRgturP+4ix1nBNnF9T2Kc5MXlyr9KzSXPixv80Do+hh5oK5+BsCXW3VIAE7zlAZ
	ZbmYw3RbXl2iz/O4rodYkWvZfe42al6LJkG7Stjbx5Oa1/4dXnioSj399nHUHYyHJB8xF3a8jr3
	Jqr2/Xi8ifcz+u1Nz41Uqm2r0/enHnSCEGkKlylLD1VAC+HMuE43E/96OrHRNQgn+UKzTHow1v6
	XLbx62M3vl3uyfGpCMOiHdg6ptkYzUiyA1BolmkW4VLKRdQR565f4R7KbfNpnk
X-Received: by 2002:a05:620a:408c:b0:933:ada:c3b2 with SMTP id af79cd13be357-936d2382749mr772663685a.34.1786726506665;
        Fri, 14 Aug 2026 09:55:06 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936ce0b3b13sm314967485a.19.2026.08.14.09.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 09:55:06 -0700 (PDT)
Message-ID: <d61b2a72-aa24-4119-bf5f-8a2456f6c9b5@riscstar.com>
Date: Fri, 14 Aug 2026 11:55:04 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] misc: tc9564: introduce base PCI driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, arnd@arndb.de,
 bhelgaas@google.com, daniel@riscstar.com, mohdayaa@qti.qualcomm.com,
 lbiancon@qti.qualcomm.com, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260813222943.1655453-1-elder@riscstar.com>
 <20260813222943.1655453-3-elder@riscstar.com>
 <2026081455-eternity-douche-900b@gregkh>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <2026081455-eternity-douche-900b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/26 8:11 PM, Greg KH wrote:
> On Thu, Aug 13, 2026 at 05:29:42PM -0500, Alex Elder wrote:
>> +#define DRIVER_NAME "tc9564-pci"
> 
> What about just using KBUILD_MODNAME?

Yes, I'll use that.  The underscore versus dash doesn't
matter...
> 
>> +static int
>> +tc9564_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> 
> But wow, this is a tiny driver, feels odd to have it in misc/ but ok, if
> you think it should be here...

I put it in misc/ because lan966xc_pci.c, which also uses
a pci-ep-bus, is located there.  That driver also calls
of_platform_default_populate(), though it also loads a
DT overlay which isn't needed here.

It is indeed tiny, and your comment makes me think it
could easily become a generic driver (along the lines
of "simple-mfd-i2c.c").  That way other similar future
SoCs could just add their compatible string.

So two questions (for anyone):
- Would that be preferred--rename this to target a generic
   situation?  For example, "static-pci-ep-bus.c"?
- Where should such a driver be located?  For example,
   drivers/misc/, drivers/pci/controller/, or something else?

					-Alex

> thanks,
> 
> greg k-h

