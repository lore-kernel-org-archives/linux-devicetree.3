Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792684B04AB
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786136304; cv=none; b=FvaFKRkrTOYlJnQXFyOxSBT7AGd5y/A4sLdSBCyv81ARZKyv+yXniuv76I4avDiMppypIiisysjYggclIy9fFWWeiOdL95nmrJxQvyDE46tuGhmdSUfi1fcYYLy1t/04NVY/F61kRPCEEjQDHhB5gUBbkYZkIzyE4ctK9EAJfQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786136304; c=relaxed/simple;
	bh=2JoD3JO2pW5pi92+cVlcHhTmMg3nDMhKO466t82pHT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u15Rcc1k2NO1H+fOi1eF6uiPREsBZlXTSEmF6ZQOtCTX4sof7g/mDL4bfw1+n+TleQdkhAPInOcqvIxKB4GLO+82hSqqkNpmWmA6+RPM9P8NzRBDHdV/enLyHAF5o0TZCVUK+WrlZrvJdaBlpYsBNN0e3IEOVj0xiGIOk7Z8F04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=lSzTW3oM; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="lSzTW3oM"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e67555e24so202678485a.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786136302; x=1786741102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kj8kzkNEBS/XA58S5M4C363N701v5oQh8U+/4A1gICg=;
        b=lSzTW3oMQbVr8DD6SWLhegR0IZaHXqUSZI8d4lxlLX1xn0qDnolTgZUz+1h0GQaKAA
         XPdpF7F3HvZmrquN1/EiNPwml4dj82dcl0WDeMSBDKRPYp/XRNuLY35vP2SE+zq3bKx7
         E3wL3/bHZ+55nrWaZmFdPR4XQRLmMMfWHd6YLNd6AOglPDwiYl7eMpEF6SRfGXFBrhBb
         raw9P+F2EROwdzmfuCocm/mrz0l15tHA2ezqIhMY3RX/7uu3akkARi57tlZLsaT06n8Y
         uDxD5YoYOV/cqi22bGvhXIffsJT+DmY2btj2KexlfaZaBjIjjsyvWsQyLuIksw90wsxr
         xjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786136302; x=1786741102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kj8kzkNEBS/XA58S5M4C363N701v5oQh8U+/4A1gICg=;
        b=TCUMGEvjPiqSo+iDNtUCHCwURj0IXY8As2EabTXcvNUsSAuDw8sKy8riOtK1XPsZ4P
         DXVgTlExmo2a9QFB/qBm50Rv6wO0z+c3lvFKyNRxwuyEOqSBnB3vXK1EWaN3ix4ycZiv
         49s64Ze5ESUU13OHnDdHdoubY+IHVbNzmLKL9YQmpV23d8B5enVyXa2poQcRcmgajijP
         F0I6CGSzhgy4ElwgO5DIkvYrs+wM/2SQPIlUTUGIBt/I/ClYr8AMdBFMUyhKUcgZI+h6
         1UP7Qq3f34ozXU0vHdmC+3XjVUNLUBl/2o3vILWGWsTdE5qaPQUjVyoC2Web0DAIEL01
         pDeA==
X-Forwarded-Encrypted: i=1; AHgh+RoErpP2czIC1/R96z4Ccj364/DKnZ97eOmTgxd/H96dUBWwJNvvu9Xks4dpmWgnUSEksQq3PZOzkVix@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc8l1L6r5twAMpeyEJmUStkQ/5qHhyUI3TYQ7yyYbcseu0DYLD
	Xfs1iR82zn1JGZ4kHuJo/udJBH/nkik80pAUchqL4wR2blwzR4RRgxG5WxaH6bfhoUbylVv14qo
	hdW6Dmz4=
X-Gm-Gg: AR+sD10mxGLC84OSvKT2QwaMuMdHgm7olzD9BP3z7C7TgtM+cKUe+uSYItNcIxgK5sY
	8XHOIlsRwfuW5ymXwAt5GDm29i9bCJTuKzAWNUG4Pngl7qXT8w26jVe5Qx7Z0djwJK7WFaiay2I
	wG4q2UXca2hJHvgvOgm/0WQ+CORoOPo/qy4WHNLOdimACzzR09lHG4/hJsyagUCticSyCmaegDn
	OEMIoRjjE2uLZf0NdwIFYqXipmJLJLxvgslYyj70pSYhiSXPQ319/7VKE4aqqN/Si6LNOgANqaL
	jpfYs+U3yzu0pFmqH5SrrAasY3cb8/O8HlfSEe3Vqr/+xm0r3FaE+k39+T78neDmsgHFwvUiH9+
	IL95Q70MwJeIgzYD331u8ShTE5AYcZLzvQbCNJ/C/16jQIxx/nhVhG6j3H82KH+juK2TiKEPr9o
	+LbfUko1SHK2UG+/cv5eeg9k+jqO3VbtJS6z9TOLCnJ11YzGS2lkikadna/5rr
X-Received: by 2002:a05:620a:4416:b0:930:9fdd:f4e0 with SMTP id af79cd13be357-9367984defdmr383213385a.26.1786136302464;
        Fri, 07 Aug 2026 13:58:22 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e09dc07sm233090185a.15.2026.08.07.13.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 13:58:22 -0700 (PDT)
Message-ID: <929976b6-0960-4e90-a7cd-f163ecaeef3b@riscstar.com>
Date: Fri, 7 Aug 2026 15:58:21 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] PCI: of: introduce of_pci_verify_node()
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260807194100.455599-1-elder@riscstar.com>
 <20260807194100.455599-5-elder@riscstar.com>
 <20260807194944.DEE001F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260807194944.DEE001F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/26 2:49 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The static DT node verification function `of_pci_verify_node()` is mistakenly placed under `#ifdef CONFIG_PCI_DYNAMIC_OF_NODES`, making it a silent no-op on systems that only use statically-defined nodes.

This is a good observation.  I think it's correct that
this check is worth doing on static DT nodes even if
CONFIG_PCI_DYNAMIC_OF_NODES is not enabled.

I will plan to send v2 of this series with this
suggestion implemented.

					-Alex
> --
> 
> --- Patch [4]: [PATCH 4/4] PCI: of: introduce of_pci_verify_node() ---
> commit 29170ab92dd207c740eed74438cd2e09bad49131
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: introduce of_pci_verify_node()
> 
> This commit introduces a runtime check to verify that statically-defined
> (pre-existing) devicetree nodes for non-bridge PCI endpoints do not
> incorrectly contain the device_type = "pci" property. It adds a call to
> of_pci_verify_node() during PCI bus device addition to catch these errors.
> 
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -1265,6 +1265,7 @@ static inline int of_pci_get_equalization_presets(struct device *dev,
>>   struct of_changeset;
>>   
>>   #ifdef CONFIG_PCI_DYNAMIC_OF_NODES
>> +void of_pci_verify_node(struct pci_dev *pdev);
> 
> [Severity: Medium]
> Since the intent is to verify statically-defined devicetree nodes, will
> placing this declaration inside the CONFIG_PCI_DYNAMIC_OF_NODES block
> accidentally disable the check on platforms that only use static nodes?
> 
> If CONFIG_PCI_DYNAMIC_OF_NODES is disabled, this falls back to the empty
> stub below, causing the verification to be silently skipped.
> 
>>   void of_pci_make_dev_node(struct pci_dev *pdev);
>>   void of_pci_remove_node(struct pci_dev *pdev);
> 
> [ ... ]
> 
>>   #else
>> +static inline void of_pci_verify_node(struct pci_dev *pdev) { }
>>   static inline void of_pci_make_dev_node(struct pci_dev *pdev) { }
> 

