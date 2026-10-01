Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C074A64D3
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860722; cv=none; b=n5nUMMAaSNLNZo5PzXzqt7kcNAHy/kBYrVOfh8BkpJvfihYH3fftEQDo0P3qQGy7FZOOzUNoNqDhZGQfKnl9CeepJIS7KZhoOrb7AcyrxYjn5arD7MLoIQotzfvU5xaVRhSzAOOlpNFRQU84fgyGBLj0HKfheTtQEYiCpkFIEOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860722; c=relaxed/simple;
	bh=9WLH9+Lg9mafi3RlCnOSyDHhnDNxTttruE8nd/FvIYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjaMu1Qg5/g+cKQMOOcFAdZFH8dSviqwzNg+sp4CMWPLHl2fgGykeJ2F9Kv8Ytr6um72NgmpA3Faph9u+mHjG0+x6VdYdaNBylUaVY5WElNVTWjONnTVmb3Fwqo0DuCHFeqQhoN11ofRP8Qcn375mTw7USQSPJ4QKqv3V8jrfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gcClFamQ; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gcClFamQ"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae19319854so2729384a12.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790860718; x=1791465518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6Ys2U4rK4qRXJ88N00bl2NDAdA3PBqSlYtGtuTGakU=;
        b=gcClFamQwz+VOcaK6akNnTDo/TVzuT+OtMWmQIJRSlmi5p8sfWlQHMjFXGXlqHsbe8
         DD5qryVa4+sebOC8NKjT8GtlmbxEhvxkWXaUIH4/wvQPHaCwiBAIHLwGXsjAd696qqa9
         11f8ovWq513ibBbyTZgWPQmx9D08GSG7xAbKDLIdD3fL3q6hYgFFiihaYA9X5+LFji/h
         mknEjQldYVOHidYWmEG5psHUkBW29uHJ0v4KBDw3t5irPAnPZsBQqnzRNbxlG9UPKi+w
         atbTKB1rv6NKQdQFnaHL/Ue0lisdLRI14dGRfRJDQG3uKxz0/gKTviv6jL/HI/VuUnDe
         g3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860718; x=1791465518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6Ys2U4rK4qRXJ88N00bl2NDAdA3PBqSlYtGtuTGakU=;
        b=uquIA5H/3RBlx1rF4jAObesOEYmPFa0LXduzDWy++3/lhoZ0/bPFrDzjeWa962rWo6
         hguPHoeeXvkO/Gh5d9Uaogod+MDyRFnk/NsSXj7aw637HXVfn+4NYAOgRpsYqcN9GJnH
         pk0ZpCRCpcSXoH2lMPnGjBeQF5oxcvsDVn4mlVy6m9zRhFxZR1ECiJivTvoPZb4ZcE0E
         DuiMuju6TerqS5Q+ukIDrmS5yd7Dcwr4txQQ6y+b8U1FX1vY8uaZ68GooKl10GWiz30E
         ocaIUJN97KFA5xBFT/EH6I3XEhWb6PvO1a0RH4vjKyCBpFiSgwakYC6LQVwz4q+wIK92
         hLSg==
X-Forwarded-Encrypted: i=1; AKwUvBy7jhqzRHU8Bp3JnEMRVPHTVUMiBuGwqT8AgoTa/dbtAjzT7QSjZW/icM69NM7wVaSVJw1ssAgN7vsi@vger.kernel.org
X-Gm-Message-State: AFq9FYJxyXN9EJd0zHccwBcb9z+py8ttpHXq/s1MYuAuUVrgl+J0qRd0
	cLigV4UeagNJuoYw1OXmwfbNkk09qZcybwb5PPRWVIlu3Uhb8pkUtsVKFaJrTGq/CjM=
X-Gm-Gg: AYBFou0vROvK94fM+Mx6Eiu8BhA5FDCXlQzdQDsV1/piIJewKDl+91kd2GTdxnuoNXT
	ED2QURmwXkhfg5+bDYb/F+JDN8OyT5VeHBNgxROVUHPiqoUNpoNPL7TC4nL7tBpTSZRtl0209HJ
	MDS2nvAbhet99UmH4wA8JfBaDSLx5v2+CCift+ZIYx0WW5qmOYtD9oPDvP5ztpZseXE5PpkArh6
	DgpXw3p5IAK3LXNUJGNjj5nnTHQfyx4ZUmCs07drhQ6UK7V4B1ufGbpm5K++0S/pAb1hCXG6i3F
	zty1Ulm5RARIPfUHd2K/GbLSDjqiBb81xNpYKIXaLxrfU2BeWAnMPkMgYQY+xbT6hpyM165iYhH
	9PJJ3QLBs8+V9y7fdh7jw1OYeiYhKoirnOGykyiErpQ3gSdCp9utgkJ4PZepQwfoWlr2iffqG99
	pWQ7BGGPEQ0aqpUakt5jI6MKViSYavSp+gNKXF1+/DEXwL9+oS6QeFnDw5346bJa7BtsgEzjgYA
	1SmWpObYbADCZbsqMvksYcR950AvipZxpKotADk8c93slXVITFOl7eWyw==
X-Received: by 2002:a05:6402:2794:b0:6ac:ae52:8b75 with SMTP id 4fb4d7f45d1cf-6ae19978a4fmr3453730a12.44.1790860676581;
        Thu, 01 Oct 2026 06:17:56 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca63130sm1146160a12.20.2026.10.01.06.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:17:56 -0700 (PDT)
Message-ID: <16efc0e1-8986-418c-87ba-9bf1ca4e4088@fairphone.com>
Date: Thu, 1 Oct 2026 15:17:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: dw9800: Redocument
 DW9800K
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Luca Weiss <luca.weiss@fairphone.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
 <20260914-b4-dw9800k_cleanup-v2-1-6553273aaa33@fairphone.com>
 <20260916-meek-qualified-penguin-fd8cea@quoll>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <20260916-meek-qualified-penguin-fd8cea@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 11:06, Krzysztof Kozlowski wrote:
> On Mon, Sep 14, 2026 at 12:25:56PM +0200, Griffin Kroah-Hartman wrote:
>> The DW9800K's properties are too different to justify sharing the same
>> bindings file as the dw9719, Create a separate bindings documentation
>> for the Dongwoon Anatech DW9800K with it's updated properties.
>>
>> More specifically:
>>
>> The DW9800K did not share the SAC1 and SAC6 modes
>> that the DW9719 used.
>>
>> The DW9800K does not actually have a register that matches the property
>> description of vcm-prescale, instead the description of the clock-presc
>> in the DW9768 is much more applicable to the functionality required
>> according to the DW9800K datasheet.
> 
> I don't get why it does not match. You have exactly the same first part
> of the description, look:
> 
There is no inherent difference between the two property names, the 
values that the previous binding was using was completely incorrect with 
the hardware.

The reason for this discrepancy in the first place was us guessing which 
properties that this driver would need based on the datasheets we had 
for older dongwoon devices.

> dw9719:
>    Indication of VCM switching frequency dividing rate select
> 
> Your code:
>    Indication of VCM internal clock dividing rate select,
> 
> Both are dividing the VCM clock rate, no?
> 
clock-presc is used in a different dongwoon binding (dw9768) which more 
accurately matches the function of the hardware, So we concluded that it 
was a more appropriate name.
either way, the values we were using with this property was completely 
incorrect, so it had to be changed either way.

If you'd really prefer us use the older property name we can change it.

> Best regards,
> Krzysztof
> 
many thanks,
Griffin
