Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2803E009F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227848; cv=none; b=tvYkavB5jxX5JbvQD76Vz2wPd+ly7wCz9hZMaWMnk4XYTmJNpT4XgxIbAgabVlzYJTIUD95Cy9/b7CUYsDiTjhl/DeAsxVCQhDO1P1oWU2hgbfEvDFEH2MP3hTYyWHhFItjRHTXKrg21Xzp4pPZXZxK3WdIJsvAXVkJhMZHCEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227848; c=relaxed/simple;
	bh=kvOziwHTfwbnIkMV33Q47vUInB20/3D0E5bjpQBS/js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mx3p4y/kh65g60YMnXB2ciSzmtYTpFW++e7LkRAmf6lwJXJex00w3Gkuw0HqEqVXIxHnCNIlk4GsRbWbmWBpkAQ48wqQ12DW3GyNkyeXP8gLAan+eoKfThAcQdXiyn/9JNzHgvYZtuOx1ZdrBGi72dYU2gRgp4qfRhAJ3N/wwPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAu56gvN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAu56gvN"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e347638adso3300261a91.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785227846; x=1785832646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfzWVXRZDa4gX/lhkOHjJJWDV2ss9jewQTF5vSegi9s=;
        b=WAu56gvNfpTZhcukEewYq/gkW8ekoEADQU+GxGbtcDRFjPyffljTU2jPR1EReFs4o9
         uiKiaEfB/57DjZEUQl0AAmqJPNPeg/dq9RKvSqbfrKHTES7s2fJLFccb4PRLS1U3nFKZ
         WjGSNkNSUebV16WPVbT8liuhwRw5KYI3gsrtkzqeSTqAXvL4w0uK4paLoaOKztqQ3wZc
         OV7IO239oPJh6fvidnJSqBsGviwKqxTGYAVvBmKAXP7A4Vb9mMNGmPUlhvoiRN6cg3TT
         6JDbc2fqDBDA8nBPla6PA79jim92IL0LN4ee6qYOGuTpw/XDQ5KEGNdEMNJSnNPUUArV
         AklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227846; x=1785832646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfzWVXRZDa4gX/lhkOHjJJWDV2ss9jewQTF5vSegi9s=;
        b=VRDEh5czTLoxItRMB6MOzgWi4+pE06VLqHTloa9Jkbr8JkREKyeIEqON0ysY1sM7wD
         L6NZ/aL2fdClSJ1m5nduCj9mkNYNAAHtoTkCLrZWJmIYmHga5bKmIo/8WMqKV1UwmmDF
         UI96ajnUlCggPY+zmoiDa08QC8xdzlxlS4R9YQthBubnKig4R+IxCJ8WVsC8FMfD3DtI
         D3uWl1d90w7TGjGL1bvQD2SC5pFuLL8ALonVyRA1KahvYM70w6/1OXA4yudAh/j247J7
         /FEZ9np2e2YpaAMlYx4oTX7e7XFaSQFaNTT5oEHMe0ubCUr4KLoIw3GqbUVRvlIBMAIW
         JhYA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7IRdyc8cDv7X9mQVzT8wbZ3WyWZ4EiIGh/2p9RiRRXrn4ePWvK1hIE6uL4W9+939+L8WY75Bx3MI2@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ9EZIUBAUOPxf8lzUKkhYk9s/pGSrRQT79d6Tdhs1XYi+fjhH
	MKumjaPe1R9oGZ6xNgwddU48CggVZICXE+jAfuNx1RavJ29VkHdnHP9e
X-Gm-Gg: AR+sD13ApsEZYxs2TzwOHgRD8vYE0CZB7I1QvwGpMr80q6+n/t0b2eZUY0b5AiAShj/
	i9K4OGvgkIJtm5DzfWIEmTqbQdMe0jkEjagV/2aINrhWmWX9pYz27k6O6j/4dDZv5ylO5U0RSKd
	AA2Pu8SIQthx6u1z1bzpwAKlXhTd17WXtzKRHTdpHGocPhJR1qtGjlGVY8E5f68MH5wNo8leNrO
	s8KEonMZaXbn5Z8nnC59nW9ZwVxY5duGVd7VqUsAV/bIsJPs5JNSwvXwwiCzmq8ARpOdAK8NnKa
	T/WoFcD0GvT1BmWgcwVjqEuLhj6fq77wnQyg73iTigqCaNyriszVk8amnoROEchP7IuijnASUp+
	KAqAJ2sJzW1ETZ7c3R+Lp9j1LoBHeCGHSlCn8hT5U+6yrdDeUvP8vV38459jX3v4ViACC+xFTVK
	70yVc/vfvQvGM8D8wG6D3EDMBXcJ/AmBq+Rx5mMPb70xKcFLMBLeDngQLNDqxv5wHca3s6WCWRn
	z8HeUJYmH9A3W3mZ1yhalN0frH6GVkxQnPrad0wRPs0a5T9xj5NSUaBD53hpEdVWy88UHdIuenZ
	yOGv8pgll8Qsp6I6nPdVmbf1hhfwQs2zHCJY0mE=
X-Received: by 2002:a17:90b:57e4:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-38f6a4594e1mr1751973a91.16.1785227846554;
        Tue, 28 Jul 2026 01:37:26 -0700 (PDT)
Received: from [192.168.0.100] ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412d1cdsm944553a91.10.2026.07.28.01.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:37:25 -0700 (PDT)
Message-ID: <b004a0f5-1dcd-4d40-84c7-33108eb20395@gmail.com>
Date: Tue, 28 Jul 2026 14:07:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,ns2-leds: Convert to DT
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, simon.guinot@sequanux.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, kernel test robot <lkp@intel.com>
References: <20260724162332.32291-1-ninadnaik07@gmail.com>
 <20260728-garrulous-wild-jellyfish-a6e0e4@quoll>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <20260728-garrulous-wild-jellyfish-a6e0e4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28/07/26 1:24 pm, Krzysztof Kozlowski wrote:
> On Fri, Jul 24, 2026 at 09:53:32PM +0530, Ninad Naik wrote:
>> Convert lacie,ns2-leds to DT schema.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/r/202607231542.6ovJrInT-lkp@intel.com/
> Drop both. You need to read that report again.
Sorry, I missed the line which says not to include the tags in a new 
version of the same patch. Will remove.
>
>> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
>> ---
>> Changes in v3:
>> - Add optional property num-modes to the schema.
> Missing rest of the changelog.
>
> What happened here?
>
> Rest looks good, so with dropping incorrect tags (really, please read
> the email you received):
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Should I carry over this tag in v4?
>
> Best regards,
> Krzysztof
Thanks,
Ninad Naik
