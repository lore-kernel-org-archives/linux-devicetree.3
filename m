Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304482;
	b=B6WBV3HVf38EdL9eToc51gvelOnzDZXRXxCqZ+/odsYKlWcWKDsrdHrA3ppUbmlK0jDF
	 wEe1jh7vRSCk9Zz2AtxWe2Zqa1fLx7KNRsQbsLHrcxc6mGw1XA1XfXiCRj7E8++leTmNo
	 pTcJPpjjqV+TPRrieJjQ6awve6A4VBCmPoqwnMXKYayRNQeOfXZNKPECIt7ZPQEt7zviR
	 qzWYvIEehZ6m4fnwQINw5XNPutHwYKh65/8fCPyxtTvdrw6bM41Mz7zEtKK/ldqla3RC/
	 0QhsD4fbsHCVzg4xwN19BzboP8qwUVW0w/ww5BVXralzwe/dUytqhICH6Jmh/UFNxfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
	b=uIBaYmMCQgE1t4VZnMy+MXgVsGdgWACO2beN6gb0Zg2e3Go7gwZOtBoA2wFmN6VIv9d7
	 S/U5Q2E0lEztPmC9IRn4hiFbd5EPAH7vBZVeOkh9e8tBRFm+Y4BWSibXDRtW1nhH4nhB4
	 kfDorBDV2MA8+cppZxqGz1Cr10iKC5BiPqpMhJjFRRD4Iq0aYlnbW9HRdkU+aKgPhPvWt
	 9Wt66AC51ZFhuoNMH2oJZur4XPhD7B/pEdvurvh9bgikcoYsizDfZHJngYvNK/MQbswa6
	 9fSJsXqFd4Y034HqMlHoV+FJAQAd54dYBnN+NH7RxmWKzXbBkbd5XqRcinOdSyc+RGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CldSljc2;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E92F606A325
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E92F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CldSljc2
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so6738485e9.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304481; x=1794909281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
        b=CldSljc2YDB1K8RmxJDeFZjd2LVdS9NaIH4OGfpHmMJoctX3GM5a9xvVKV4saZJWu/
         BWGeGNMj6H2n24m0+PY0cdqD7OSFs20lSGZGBRMLMCh8mRBiiSvJFyhpvCmkDsMH5g9N
         tqiu3KwHxHqtctw5+o+K2gERzbelRMd2UvmNhuvC4mt+nC7t+U2nYGTfkVTRHlWfOQU4
         TmHYxhwruyXtOIEsbu9VYPvrPi4iEJkKJhr4CMe1GgKcmGSxTJEAUcJOdxK0wttfKSAc
         NqujhOFc14aMK+XJ+iA2tuRJkUBDtt63tBeySZ4zeBV+eOrAPGw9l0AdctTGmK57HUXm
         PG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304481; x=1794909281;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoornKh9z5jpJH7j8+EuQEpUcX1Rogb6YE7C2nngtQ0=;
        b=AS0KJOKaOnLOZdljHabwlfykYRBmeWQiraFljx6fpEI+fsK9McNyugqmOc4A2QTZk4
         Oj4EtE/CB5croGWoxYCszVng3A5C+iEhBvIGiGRbXVQSEaCbAa0xoxab9OkY6FWnVUN/
         K/LMstDYAxQIm9JEAPMy3ZJsAT26LaOeI59hE8xsSa8dHw8KOKVMKovfCygHRhIvEqOh
         eL8ZpfpUkKu40OOLNw9JEORJThKVxSjh1AuQY2hg+I6q1lHY/mmXvlmqAGMYn6R5Wd0v
         WQ2imr2cazr9eGcBX4v2d3fjvaiEUPVCpIh3uRt8B11xuySpirQFSpg/36PghCUHb8Ct
         flOQ==
X-Forwarded-Encrypted: i=1; AL+hErE900RAAed3rs+flKCbDaIoBm1QLKY1ZhkbW9KHaZH3x4EScbaR+Vg+VYjO0VjiRVNbxWGtqpBJkvpr@vger.kernel.org
X-Gm-Message-State: APuU4Z/5R5ANtZkO83mf+ndJkyHa1wisA8/sSJ1kpO5dtHdvODrFhLjm
	awhtkSidosK98vHPxL5ZqAEAAi7hFdckFedC2yo1SRONqjLyQHf3Sb3x
X-Gm-Gg: AYBFou0Ou7ThY9Io97gvDp5uj1Fr95kgrfnoopUQf8IpxrwV3Q8d1quttzIZUiC82un
	xI6cYSBcd8IjRnu9vGEbNcR6I7tmKQy4u8fDef8OQ/B5T8zkgyylDCSm+6K0juAuX/6HKI4eGha
	3M464o9XnLuX5VZPIFBToK9VFWHfNjq+su1LwExD16tO3ZmjPX4NbgmzmootQbF8K6741b+Owj8
	wftg5FQBsvpbcESN31gt7Ndpwgp1IEXVaK/MDVxMqAUrp91HYr2yUNrn29EbUaodr4RK93prQ/4
	28m6w8JkEOuSdwDJzv8vmoQKw9MuwxdCQl7B8wtDsuKCEBmANPS0VycmvIZGLlceC+g6MzcFtPP
	9VrlWnXh32H3csNTUJSC7PI0ylwrL04IHrRjGNdD863c63XhR3fpJJMxoQEweRd1GUytrWujYKZ
	UKITiGBaFTCh2Vp9OGUviPW5bi/BI4RccsHhKi/HJnSA4ZHzszrBe9KgOrIHvEiDAHkKNJKjIHf
	+ewPjpwuRqal3Leu0VCrIQwW74TSYiB6OLXUXa92u+zUXNxlpK7y4yz6KBbRVeglQ86MmK9T0rJ
	N6PqII0mGYJNXXdUT5fxLBxcfBzxbMV7s2Je9DgJTEIyxq7VClaoaUqlPVbLVamqL1P1kquK+f4
	25lrlVQ==
X-Received: by 2002:a05:600c:4f4b:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4ba0234bd12mr43740995e9.22.1794304480565;
        Tue, 10 Nov 2026 01:54:40 -0800 (PST)
Received: from ?IPV6:2a02:e98:40:8091:e8d5:38f4:f7b3:6dbc? ([2a02:e98:40:8091:e8d5:38f4:f7b3:6dbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204e22csm48483805e9.12.2026.11.10.01.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:54:40 -0800 (PST)
Message-ID: <873c22a2-fd3f-4927-a06f-16a73c30de86@gmail.com>
Date: Tue, 10 Nov 2026 10:54:40 +0100
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
Subject: Re: [PATCH v8 00/11] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
To: James Hilliard <james.hilliard1@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
Content-Language: cs, en-US
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Based on tty-next at 6628e7d4c6b2 with the posted RX trigger callback-lifetime
> fix [0] and DW BUSY-safe divisor fix v4 [1]. Platform setup runs before
> installing the BUSY-safe divisor setter.
> 
> [0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
> [1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com
Hello,
thanks for the work, I wanted to upstream my changes [0], but got 
redirected here instead. This fixes the issues I have had in a better way.
I have tested the whole series, so I reply to the cover letter, didn't 
make sense to me to reply to all messages with tested by, but I am not 
sure if that is the right way.

Tested on Unipi G110 controllers (Rockchip RK3328, CPR-described
64-byte FIFOs, ttyS1 and ttyS2) on top of tty-next 6628e7d4c6b2 with
the two prerequisites. rx_trig_bytes now reports 32 instead of 8 by
default, and 1/16/32/62 select the matching hardware levels, checked by
chunk sizes in internal loopback and over a real RS-485 bus between the
two ports at 9600 and 115200 baud. Changing the level mid-transfer
kept all data, and the level survives termios changes and is kept when
set while the port is closed.

Tested-by: Kryštof Černý <cleverline1mc@gmail.com> # RK3328

[0] 
https://lore.kernel.org/all/20261109-8250-select-u6-64bit-v1-0-04bc8332fa34@gmail.com/
