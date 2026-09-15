Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C0D4499A4
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501792; cv=none; b=RP3kFOTbgnPt4v11lkx8z+2QA2WwRWeT+147fGHcbBzlaiGGBVKDxRf9xsNSsZVf3z+UtZ8VE6HmdQuShM+OUL5xK+CInWm09PEsqFJVzCg/8mXbTQGGJTrWFQtupgx6ra5FEGKROW+8OKhlNcXK9DuDNMHNX+xtVglCJeAMI9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501792; c=relaxed/simple;
	bh=Ox+hNbTd7f3+G4o+Sw8Uzx0THm/NdMARd2zaTFBMXU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5wLNInD5Xx5ltRaG+7NZi/LQJr2MFbobU5OHtFQhdWvbYuPXvpW6Y5a4c9wWvsWb6UsVesoAGpzL/0hOtNf7340Win9yVOT+yppZEQi7QxVzmQa/GtvNHavZPqo7PeaQ9O/rqXFrafQjmiJYwmHxRn7CF27VevpUNbO++QZO7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0TUYJeq; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0TUYJeq"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba91so107971a91.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501790; x=1790106590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8A5+VLIUxly1brCbgDAu6UdvaY0/rGFhneDDaN+WcFg=;
        b=s0TUYJeqCqxXG9B2wBtLX5teQlFVqBteh46IKtD255/zdKrhQ+Ad2+YuQMA0N5nxir
         ecdbqJ33HTPMRVzXydNQUZK1H2W9UFr9bX6R65oJkZH+Zeh/RZMb6s6yJG6AeBI7QkWt
         zzx4/ZtUB4auFsIwEkk83q2vhfVqW16PJcAiTPtEZio+ddg7tOjTTIoMcDxRsoKE13Yo
         jB12NsttsL5wYhIFrwMbPuXLfMyweIWOK48uYVYREo4MoaaVK9rx6MDkKRZkyHX8BsVg
         qhymf0Sp4pmpq4XR/cDdGmcCSTOcwjnh9XnhFh78MWHMnYckA7oaMea1WWAVH4e2WeB3
         cTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501790; x=1790106590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8A5+VLIUxly1brCbgDAu6UdvaY0/rGFhneDDaN+WcFg=;
        b=RMXGN6gFEFfl8+2qA7rxKtUBSHE3OU9STMiAJjh2/6exV/wBFA5OJKl7erU4doYdXP
         DRqub+cZcbRcKWyGQ/nNGZqobJxt5gnOcybdYU5bqCZ4aR9ugWJ8dlXuSWPjYa+x04uX
         WD/TfqT0NqmQI5K3fNxy/s3Fije6VYkI3yaVGNN61EtjyXWw1Dw9PSRSsDtkm3csxsqx
         SPOFg9eFFIHh6+4Q+gpr9VjyEq1EmNB4/YbDgtFkfODZWNz41Ofaxen84zZuL7/SD9pK
         jYYCy3ddqROHCdE2na/uMu9cT/aQnJvUn9B1dimFiljMUN7HH3TpX7q2L2t9XNzBplDY
         FLww==
X-Forwarded-Encrypted: i=1; AKwUvBx/aokc/es4Xbba5XQvxFgKAZuLBr+lKW5vUckv8jmbw4sUQU7ZHeEKAIBt2AU/pDFGc5P0074dERlX@vger.kernel.org
X-Gm-Message-State: AFuF++k+W1sgbwYThVhGQpH6iyqGDegDOmyUQcZXUm8t9+S8IGwba24I
	cojSlb9qPEwoTrwl1/M0FKUK/CesXqADI6NWq0hc0eY1vHn2Q896p1S2wqMzX6Ok
X-Gm-Gg: AYBFou3X4dG2RdMBL9YQ6g+e7C1N6cOtqF2tvK035qyPkvYvRcCt3OQPITNa27C1PXR
	K3JEdJx6WSSAt4zcUZXLXMtyVhUCR/aJx6JTmUFP3tdx9sXYxN9kjBekd5udK6qAbZDyNZr4C0c
	IpDY5ZPLFJxvS5KntqQzVLc8burtbYdboAD6e9yt5X1yCGc8Dvbx6qFepWou4K7irQJt1ICSCF2
	+9Yb9OmraJbxE/QstGEPqaDHSNvHyy61oLTz0zVnEL+1nYhdace/HuwNlUhLO61Th/CQ6YkIsSG
	YxkUjSxrKxiR2d0a9Qip3ZgpFueLZ4fErfLkB3P9x4hW/Ta6I9ZjqG7UymkVUyD/hhkI+Izf+Af
	KLer0YabPfFS7jhDn4bbTGbrvMUYQAcNjfJvjHIPddPT71n6Y4m9yH/TTIorv3gjzglySOdoBJo
	ICGYSyPsim5ynGN7TCUr4u/U1qcAQpymJf8tiR5BFVybQGeb2sFMKl7/S1CMnhKCfJf59FCdhkN
	0Yv0PYTK1IV8/yEYaxjBz+mFVlUf+KNlHitmTXiYSGVq9N2IsFTPWM=
X-Received: by 2002:a17:90b:1f84:b0:39e:1b0c:4773 with SMTP id 98e67ed59e1d1-39e1b0c5c9dmr789092a91.0.1789501790027;
        Tue, 15 Sep 2026 12:49:50 -0700 (PDT)
Received: from [192.168.68.67] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm821075c88.11.2026.09.15.12.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:49:49 -0700 (PDT)
Message-ID: <583fd625-b57f-44be-96c8-94d981c29c79@gmail.com>
Date: Tue, 15 Sep 2026 12:49:47 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: leds: rt8515: Support single-GPIO
 flash ICs with vin supply
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
 <20260912-expressatt_camera_flash-v7-1-e1fd2edc8d84@gmail.com>
 <20260913024510.485A11F000FF@smtp.kernel.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260913024510.485A11F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/12/26 19:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `oneOf` constraint incorrectly makes `ent-gpios` and `vin-supply` mutually exclusive and strictly requires exactly one to be present, contradicting the claim that `vin-supply` is optional and artificially restricting valid hardware configurations.
> --
make ARCH=arm CHECK_DTBS=y DT_SCHEMA_FILES=richtek,rt8515.yaml \
       qcom/qcom-msm8960-samsung-expressatt.dtb \
       st/ste-ux500-samsung-codina.dtb \
       st/ste-ux500-samsung-codina-tmo.dtb \
       st/ste-ux500-samsung-gavini.dtb \
       st/ste-ux500-samsung-golden.dtb \
       st/ste-ux500-samsung-janice.dtb \
       st/ste-ux500-samsung-kyle.dtb \
       st/ste-ux500-samsung-skomer.dtb

all 8 in-tree users of this binding. 0 warnings.

existing hw passes. Probably not useful to account for hw not in the tree



>
> commit 72463777ee1c18e7913b350d5d2ad857810ece89
> Author: Rudraksha Gupta <guptarud@gmail.com>
> Subject: dt-bindings: leds: rt8515: Support single-GPIO flash ICs with vin supply
>
> This commit adds support for single-channel variants of the RT8515 flash
> ICs. It makes ent-gpios optional and introduces a vin-supply property,
> adding a oneOf constraint to manage their presence.
>
>> diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
>> index 0356371a6b014..ab3c5139132cc 100644
>> --- a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
>> +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> [ ... ]
>
>> @@ -81,10 +90,15 @@ properties:
>>   
>>   required:
>>     - compatible
>> -  - ent-gpios
>>     - enf-gpios
>>     - led
>>   
>> +oneOf:
>> +  - required:
>> +      - ent-gpios
>> +  - required:
>> +      - vin-supply
>> +
> [Severity: Medium]
> Does this oneOf constraint incorrectly restrict valid hardware configurations?
>
> The oneOf constraint strictly requires exactly one of its subschemas to match.
> If a single-channel IC (which naturally lacks ent-gpios) does not use the
> explicitly optional vin-supply regulator, zero subschemas will match, causing
> schema validation to fail.
>
> Conversely, if a standard dual-channel IC (which requires ent-gpios) is also
> powered by a vin-supply regulator, two subschemas will match. This will also
> fail validation due to the strict exclusivity of oneOf.
>
> Should this be modeled differently to allow vin-supply to be truly optional
> while safely permitting single-channel configurations?
>
>>   additionalProperties: false
>>   
>>   examples:
