Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A978B3AE713
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 05:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895076; cv=none; b=qYoWJzHYVuZZDbOEJu4e+OeaZS4afpScolpt1Y6oaritcsNSs4+66Q6Bg5/p2S0Ow29ECiS9hi8LJb3gJxYZeQfuSrzNHu4DYg6uu6wKFO1/t7kS1ra0gc+DIVOVH61P3jVptCW1DvvzWGvDG+ipazlDpACoupvWEpDJeNTsnNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895076; c=relaxed/simple;
	bh=YTFU0gE23Yv3Z9Pp7jwGWPqFlGbCbnRmk0EujK9qIPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZBWR5/93JItOdJGs1tC+QCXMgaHw+QA2iHUTYyee3SfQl5wgVOoZaNguqLjTgWQDDTEC4vFHBXeAjnHFm9uc3cr7MOA75m5x7hgks8cj2Jcu0z2UeyH36RyOLCzkk+RcuT9NGOGNzqjpEz2Uhwb5Eq3n0XqhWIjMOw3p23wg+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxqgF7Cn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxqgF7Cn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49954b88fffso3704175e9.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 22:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787895073; x=1788499873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAtkq/Rf9tx3iqD7FVH2UaRrUXSVTeHKGxvC6wVqwgI=;
        b=cxqgF7CnZRrMSQd9epSUaCyOAHnFdorOEDbcKOGzIA+OYO/ZytsQ8mhn4XhqNzu7X4
         DwhcfMj5CyaGEOi0LLuGj3hTm7YLGTs391BuGd69f9fHKIE/q+EO4QmVDdP1hyRLUzh2
         LjvrXuT8b6PazThtCWLIX5b/Vn3bYV16Y0zPr+RvKe8G+KQlD9MQAPMSGnbvRSUGFEBI
         A73Dsf3U7vpPrfH3bpJeDRNt0UqM794hb5b7ytjSkyTJ/PU/j8H0ZjFYA0ktPw24bU+O
         n2FUdJQavQkArFHM2nsh/QIRMi96Xf2HypdnUlWw9Qsyn0tFm4ofsXqYv/ImJmakBxBE
         iXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895073; x=1788499873;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PAtkq/Rf9tx3iqD7FVH2UaRrUXSVTeHKGxvC6wVqwgI=;
        b=RDKQ8w9ctO08ngM3lQ+y2UmYUtTD2ibhzHNz2KlRAYE2RDAGspD9XhnDmPyK4pBHSZ
         pjrNoCNQW3cr3mHB2ShSdkVnLgY7R3tE2HoTWesvd8ZrNE/WplHvnFHoGKpdrm5gldoF
         oTyQyl+0EelCmoJWlF3E56cIq4yai9CZE2cwaxWZydVQCbZxwfu8R6jScl7shLiRrbZk
         ZEo5fdzf2DnD8AdGzYsWkaHs/uWGj77yNy0ytUUd72WVLbI26YeRdIQivnE8wn4Fqo47
         c1yhWKL+TlJRraSB527p96agj8vHsznljhvikKQjVv9Dj7zreg0h7bjw83xjfcSpoXhw
         4JTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWoN+PAmP5Dgck3jhQ61WyNY+yxFQ6sTHYZ02h7scJ/FWcfhTbvZbI65FongQRo2czB4xLDimeM2Ko@vger.kernel.org
X-Gm-Message-State: AFuF++nFx4Dq4JXOiXhjW2pqjDTFB2V0O3QOIx08HHVsA6XTp8RXVlCO
	nhSz3MtOD1sqoGTrnbx+tehvkeCJ0aJw80JrvzwO+5PA7lSh00NtDXPD
X-Gm-Gg: AR+sD1057J5jr5HpLQDhGlltQIPdJ14gaYgHGCFknz6Fnr1gPb8134uBTPdwb/+qy/b
	e8hdsMGhXJJuiuhhAW+rsMx6RT7oc07GytJWwukNNS6mwC3O0Rh3cqcrVpdszjnassyXVTDggGD
	MetOA/GaKJ4uajTQuTQwZtd5wmP4K16a/KYXqcMemDPTlsCUqidgIxgWuV3X4bUIREPPdBJyFoo
	umvGwwlTFx3bdLKpXiAQuPZ/1tBaLgFq0/j71fsd6rxQKt691/r7Y/ZsrQJI2zW2nYsYzuUgWvr
	p1xBGhi6r7D/tjTeeI49qOyypKyoeEBdE3rKLjyogf87BuTKQkkcu9DUKUnLHXaa3d/B9oB+/AP
	Kr8ad6DgwHO0yve2f+rskuCmMObpIbpB9NblbPpoJk3mDdtdzmMvJ0sZyJpcoXmFKNL/A6dQRPf
	XXm2yXrAAl9A3A1FFIhNS++Wu/gVIvLO8vKv7vXjh7qBrUEdVNLxtb8LSj4gli0hlZfpM7JJOpl
	mNzlA==
X-Received: by 2002:a05:600c:c4ac:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49b91c20e36mr56718415e9.6.1787895072612;
        Thu, 27 Aug 2026 22:31:12 -0700 (PDT)
Received: from [10.51.121.166] ([193.118.38.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm102633975e9.15.2026.08.27.22.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 22:31:11 -0700 (PDT)
Message-ID: <cfac0540-4f08-45b6-8d01-71080e0fcb47@gmail.com>
Date: Fri, 28 Aug 2026 07:31:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Vyacheslav Yurkov
 <V.Yurkov.EXT@bruker.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
 <20260810164000.GA1846263-robh@kernel.org>
 <20260810165403.GA2145873-robh@kernel.org>
 <20260810-smilingly-kung-1fddc5e18df6@spud>
 <c53ce2d5-4674-4bda-9e92-fb4fbdc32da8@gmail.com>
 <20260827-parcel-isotope-22b344bace78@spud>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260827-parcel-isotope-22b344bace78@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.08.2026 18:55, Conor Dooley wrote:

>> It is n input clocks and 1 output clock. It is kind of a mux, but the CPU
>> doesn't control the clocks or GPIO signals. The whole idea is that
>> peripherals check the output clock, when it's locked that means _all_ the
>> clocks are locked and GPIOs are in expected state. That's why the selection
>> operation is not really implemented.
>>
>> Actually the number of input clocks don't have to correspond to the number
>> of the GPIOs, because the GPIO signals indicate the locked state of the
>> clocks that are not accessible to the CPU.
> 
> I'm not entirely sure what you mean by this, but it is starting to sound
> like you're only having one output because that's the minimum you need to do
> to ensure that this driver has probed before the peripheral(s) using the
> N input clocks.

That's exactly the idea. How else I would ensure in peripheral's probe 
driver that clocks are locked?

> Requiring other input clocks to be stable before
> declaring the input that's actually connected to the output stable
> appears to be a shortcut/hack rather than an accurate description of the
> hardware. If that's the case, I'd be much happier with this if this was
> implemented as either a) N inputs with N gpios and N outputs, or b) 1 input,
> M gpios (if multiple represent the stability of that input) and 1 output,
> with N instances, one for each clock.

How having N outputs would help? It looks like it would just move the 
job I do here into each peripheral driver instead.

> On the other hand, if this is genuinely a mux, then the binding should
> reflect that, rather than only describe a subset of what you can do and
> the driver should only check the actual parent out the output, rather
> than the N-1 other inputs.
> 
> Thanks,
> Conor.


Slava
