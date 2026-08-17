Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3451C3BE643
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787002167; cv=none; b=RNA2ECR5RYSiMDgWjmFyApJIQ78rBkvjQpQjUkdSHiKF+F2nMfG+zMFDD+6p2i8sBxf5/JlgkNIQ9OG8O+vC2tylxKFkAJirJGWen0wxK0bJUJE4s3hay9hwK082Bi1eASPAWi6vw+Wfs7ZMewEk2zaCISfg3ZGypDSFiOw/75Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787002167; c=relaxed/simple;
	bh=RRjYjO9utSwXFNiNlGy5THKzfGm+sRKB/dDa4OjFrtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOYxihe+1+Om2Dk2bnEfmfyLhKBU3oWCM9bOW7qgUUiDZTPdwbJh1AN4P3f499xRduOimKFEwhCt/Pm5Fd3zdofIjXqHDNTgLiAkv4QY22Z2Hky5Ghmmkw3Wy/d9v9J1+qeQb3Y4/fxYduS/82hh90eRxsPiWErk2GLvZLRJaVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoqc8OOb; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoqc8OOb"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74dce749cc5so575865137.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787002165; x=1787606965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiXCkGd4+m7MSxEiROxY/FH+NnJuFc43Sy6i9qtL4cg=;
        b=hoqc8OObrTRSktIYGRswLh0Swr69w45sBeEdhTkukpOlKpgtQ4fdxDJ8hUrmqSETN8
         IncKlBoEIHuLFU4DSq3OslZd7rfGnS1/3hCPFQ01PQN1JS/0vCo2NstXnilIBd5gmnPh
         82mBywHYBAXdzouZ7+SgsD4Ul0jrxJa8cGXqSSBrGjeE+oNORWwEuH3Mr89LSAFtU7wC
         RbK7UABLQpl4PM7WLObkfUKI0ohB54vyi1E+cGVv4tYPXGvFVYrYpNobw8wHq6sgdPqI
         LWr9B9PlowBWo3WMkclbd/MzcRBDNbV6ILlelT29CZzLoeBvJoy5emknEP/GA8L+Ovb/
         fxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787002165; x=1787606965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiXCkGd4+m7MSxEiROxY/FH+NnJuFc43Sy6i9qtL4cg=;
        b=aSlglA65nVqE/k7MAmOCz02F4Tar1DJCMxrKG7pCj/8FMFevJbTdzC1QutR1nyHCLt
         MD+pdw+LQprq06Ir1xngGc1mxujblSoxuojkgM56U0wRI9gYfeAZax6G8+OlRZ+9nmnD
         XJMX2ae0/NNz7p/DaVENQOZF0IbEcMQZrbB9Dc14xgS48oBJyHagORarcoMR4Z/JtZzn
         XjDgFsG+T0KT+V0e5tb260XmDRRGZEVQvSzdqgpFjwUdJxqzzDsbtO2bgb2Ws/bfE9Ia
         chq5rYEqHyFYt7EyRyzAUUxep0Rf/Xu5f4c7UNqWgJEYS7kTfFhraLHQUV+sy4Kl/Gas
         rlog==
X-Forwarded-Encrypted: i=1; AHgh+RquE6Cl5pdAJ3fdv/5h/Zx68Vw9NF0YOGigXisauf0D6Vddei4S3+l5X0qg/ZimudI31sAGfXAJ5TwX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3WoHwUckqrTglGwmzDU/IUp5uMdmzP265Up6pcN8xgVEutFCv
	sOBVnV/tSs3cEtPWTIZXdBMySEgkyLS8KWGcl0IP59pckNKz2FPABTOJ
X-Gm-Gg: AR+sD10nnyxgbUIGNqa22kwxpHYwK1j6znE6Uhw/bwZb0kIbR0J0GQcInu1a3N172b2
	+1oQngzrVYuC/lB5Ps1Sl3JtOi0n6fFQU7l+p3343+WLUX6Qv2ZOKozxSsrH10f/7cwW1OxIVTQ
	CGZSRx9/geJVurGx4TNXKTA6b+Itt5VocvHSVLefHEMumO7RQDm29171sYe29AXF3Rjp525JL28
	pMnwKQer+bAz3ETWlSRLs78HkSnrXrrQwhCey/luiigb9R3uUh3GQoOOPHTy+S++qtRQrDGL4MG
	/8iu1k4eHRwRODcCj59oYOuzG6oJ6TQmi1nWsce4kgEZcIkp7DgzQbglQgOmxOMSm7o+m7MBr/L
	AdTp7da4tGzOc+1gQhepantVT69UQSiRqQ96idWYDWE0lpz/KBv37tMQctdyMESHgl+O/sRfPEx
	ONUjnkgN5PwD/ZRHNcJotp2Nrp+otKg4xg6yt5vUj0HvD5pTwpDacAMo/QMMbNE/a3z7G8Zv63e
	m3btMuTd87seDmcTpB0UIm6xxcJ5qwWgmLad814XVkrDRr1d7pb+qTDvpDQqaSzz02nzDkd
X-Received: by 2002:a05:6102:6898:b0:738:1fcb:f276 with SMTP id ada2fe7eead31-7747c0b68c9mr783524137.1.1787002165013;
        Mon, 17 Aug 2026 14:29:25 -0700 (PDT)
Received: from ?IPV6:2804:14d:4c64:82a2:de83:b808:5922:82d? ([2804:14d:4c64:82a2:de83:b808:5922:82d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5c78eef7asm1683621e0c.16.2026.08.17.14.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 14:29:24 -0700 (PDT)
Message-ID: <9f0a6334-f40c-4e19-928f-57b709bbcea9@gmail.com>
Date: Mon, 17 Aug 2026 18:29:17 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: proximity: move LIDAR-Lite v2
 out of trivial-devices
To: Matt Ranostay <matt@ranostay.sg>, Jonathan Cameron <jic23@kernel.org>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mranostay@gmail.com, ~lkcamp/patches@lists.sr.ht,
 linux-kernel-mentees@lists.linux.dev, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260810192131.153495-1-rodrigo.gobbi.7@gmail.com>
 <20260810192131.153495-2-rodrigo.gobbi.7@gmail.com>
 <20260812053450.2e14b074@jic23-huawei>
 <F_gQH7S7C_a2e4gmKfLMZwNzMQ2lvOoBcv-tqJsuNGsWYdJdV-KhzKRPTqo1JS4yGoBK6bn4lscAS3et1Uxm-obr7Tjw3hzePjHOllpSlc4=@ranostay.sg>
Content-Language: en-US
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
In-Reply-To: <F_gQH7S7C_a2e4gmKfLMZwNzMQ2lvOoBcv-tqJsuNGsWYdJdV-KhzKRPTqo1JS4yGoBK6bn4lscAS3et1Uxm-obr7Tjw3hzePjHOllpSlc4=@ranostay.sg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/12/26 07:11, Matt Ranostay wrote:

>> >
>> > diff --git a/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
>> > new file mode 100644
>> > index 000000000000..e19c8d166b81
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
>> > @@ -0,0 +1,64 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/iio/proximity/pulsedlight,lidar-lite-v2.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: Pulsedlight LIDAR-Lite v2 range-finding sensor
>> > +
>> > +maintainers:
>> > +  - Matt Ranostay <mranostay@gmail.com>
> 
> I really don't use my gmail address anymore. Would be ideal if it was changed matt@ranostay.sg 
> Other than that don't have any issues.
> 
> Thanks,
> 
> Matt

Thanks Matt, I will send a v6 fixing the e-mail. Since you're fine with it, would you
mind sending a formal Reviewed-by/Acked-by?

> 
> 
>> I'll need an Ack or Reviewed-by from Matt for this. If Matt either doesn't
>> reply for a while, or isn't happy to take on this much fuller binding,
>> is it something you'd consider putting yourself down for?
>> 
>> Otherwise LGTM
>> 
>> Thanks,
>> 
>> Jonathan

I'm happy to be added as a second maintainer for this binding,
(I can add myself at v6) but I'd rather defer to Matt as the
primary one for now.
Thanks!
Rodrigo.
