Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491110;
	b=a6ttnBxnaCd6KaaJ1jQ8eG3nE0QRHcsAask34xbgG4cbdL1irL5X36G0Ej2K+hI2iXyG
	 5aRRdoq+D6AovYO6r15ErY55jRtu1My7YL3e/Y1kzxNI9kT+IGWr6QwPQiQKgZUoRdxr+
	 /QD3fUoTpCCk5EtKDuwg4DDl/Tc0iqhHQxkNXeoFiWd2d+6SJTYluJng3uoodozsHe9m4
	 IjtFURFFNLFbJ+XPhbH9+uBJuE/nT1Oy+xAXe/lcQfZaw9bSPsyreK9ozy7qFPyDQ76os
	 zt4VtFsGsVFWbC4VucDDjEMAbdh4laq15WD/4afxJll0aFeN7v2hUgpptP6MDmtIlaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qKlNSAE1LII8ekZyJm2r7dBRiHTZedE60seDigfXqMg=;
	b=fxuRti4ph1RBWk8RdLodoilCWo3sIJUf71vElvT7MCjZT3UgkXpaF8v8a3pkNbNyLkrL
	 YCQoUILJhTOOU3Z2yp/xE+yyJB9JsZy1DmLlt+VOnS7Q2/Dni3tzo8nwjU1XrU3dWXio9
	 EMppv6gyOab1SaM6m00cjbFYDC6vtTspqx3bXYjhDyeeCqFzcjQ37AdP45x+OYSGtdOLz
	 Y+uw7EQKb9DPqXbhTPJcsr3lA6BBk6NkadGPv7kwYC0ecawYjHLMkSVmYNdzGtxENyA2q
	 a9Xjwtsh1UptbJO2Uk6QY55I0jzYpGrlPf1+PC7uZS8AHI3ShWQ9DR76qJQPszbVZQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJyKBxyw;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E17606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 03:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJyKBxyw
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd69954c755so2889551a12.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491109; x=1796095909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKlNSAE1LII8ekZyJm2r7dBRiHTZedE60seDigfXqMg=;
        b=ZJyKBxywY1jR97SrgWiVjVItdHoMsPvRrkSw1lLWg8kruZiH+mKiYCWUyHUBrL+MC6
         jMw0BCpBrYwPm1lGTBuQ8S0Nw6lDdW7ZH2MWX8P7qZ4gdtNapm774saai376aW1pWE2/
         vvnGQlQowtN4WgBtb7Y6DcrNQMy715EZty5zsS2Qw+CECEmN4MPFjt9yURmEQClithkE
         933ee0+c3KQtK0K552R1cJLqP4wVDj/uQfLuHcqwIe3Pl/PkoJzNzATTD1bXx++xrCwJ
         dBceWOAAmCTaKWXBSpdodENzjyqoPT0BbdLhwH6Gv4sn4avkB42h2m6zMwuHR7jO76QW
         r/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491109; x=1796095909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKlNSAE1LII8ekZyJm2r7dBRiHTZedE60seDigfXqMg=;
        b=qr8RCHpCvR1gtIH74yYDMZkk7a+30jSjG8QmlhVndjZU9KMjSiC9+zk0Y0KF+ddbt8
         wZ1sSSSu5Cr/DUoeKzSfiR9szZp0OsSAfz0PM8QHRKMpiv87dJt/anMdDeZET6z8AjUy
         0VPR4qLW/SmaEH2EU7sj+UWmgVB9fKbwuE5txvDiGaZzE212kKVR/v26H9CgeiC+lnmk
         nt4sOJgbrMdFMSsEhmr4um6vtbzURYpoDK8ok5EiZbl/fckpJmLefoIrjCUgMGgJ6+04
         UWnmbKg1racfHCZhJDhmks65fkSKD51Q5X/UIK/EmWziKzoG0/SsY6UPr2DKx3wbsFl0
         /EjA==
X-Forwarded-Encrypted: i=1; AL+hErFdhwAzDVK4f2V3Dmkc/I9AzbQaBg/P/QEm1J6WX9choyfSGuDCRSZ8xLYssJqzO9IUazi9hr4/Ise0@vger.kernel.org
X-Gm-Message-State: APuU4Z+bw1lRnEhaKGRQ4wm7s4UZN3SevQ81QULHOCdPxGEq3j2Am/h7
	iJPZlr98UJiJhnJdygIadLA2ymd1sV/oozRVi/ojpyok42X8dYCVNfEx
X-Gm-Gg: AZFdTZdQONofcE9GZ4B225PkVwHxj/w9ErEIUvIc03GNVqZHFRcZcp/PHSVro8MXXJR
	jpKyAOO6h4Z5sRtJ/1dwLqXLCnamMA5N5xiQXveFjM+0MgLyUjvN1ofaE8likY939Mr6vxwNaLm
	R1Je14WRifm2wgK5E7XOllSYL6rsPjA6ylqaID7SeezoRIG8sZwZEFj6Z61VeGqbIIg4blnzSu/
	Z0W1/TLUJ5FYqdvmRyysc5W51R0MpktH8eQ6PXRiTabuJCkxH5YsPdqnFcJ4FknE39Uda1a1s9d
	ypvhl7PYRkqjUoHw31SiXm3jg4K5tIznX6+5aIyulxIcygz+3XUw0fwWOGgxr2ZTrIT6aOcU9TT
	tJo5QJ4iH3umwGEc8CKKEN4Qvy/XjrwQqAKZQvN5GRw2aQcwfqc5RyYtjFxj1mn3HE1AcEYUDpy
	MxTyefbUiXZggua4MniK8vJhqqW4/ltUPbGtyjtENC04iSBBI4R8cLvEi3kc0L0hMeHjhNEhn0I
	iWvvpDuST3FCy4aycyyWFZ3+t7VQq4IVvU/y0dMybxZ/HRTjuj1bwce2h8GP9ApPIqajTrBkEad
	VSCRs255IyJn5CK6//FP8k4twJHlNG0=
X-Received: by 2002:a17:90b:2fd0:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3b41cb235aemr14048909a91.58.1795491109076;
        Mon, 23 Nov 2026 19:31:49 -0800 (PST)
Received: from [0.0.0.0] ([20.89.104.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm23890691a91.10.2026.11.23.19.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:31:48 -0800 (PST)
Message-ID: <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
Date: Tue, 24 Nov 2026 11:31:44 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Junhui Liu
 <junhui.liu@pigmoral.tech>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net>
Content-Language: en-US
From: Zixian Zeng <sycamoremoon376@gmail.com>
In-Reply-To: <awS2-clBenE1r1a1@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Aurelien,

On 2026/11/24 5:58, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-23 12:41, Zixian Zeng wrote:
>> The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
>> 256 bytes with an 8-byte write page, which can be found in schematic[2].
>> The device tree declares pagesize = <16>, which does not match the
>> eeprom chip datasheet which declares pagesize 8 bytes.
> 
> Oops, I am not sure how I got that wrong. Sorry about that.
> 
>> EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
>> together, based on the chip model shown in the schematic diagram.
> 
> The k1-milkv-jupiter board is also affected with the same issue, despite
> using a slightly different EEPROM (24C04).
> 

The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to have
the same issue, which you can find "Page Size: 16 bytes" in datasheet:
https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf

But I don't have the board, simple test would be appreciated. Perhaps I
should include test steps in the commit message for the next revision.

Best regards,
Zixian
