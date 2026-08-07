Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A4015B135
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113268; cv=none; b=cwtGLqcHsCDnZKqIvKpBug76dEn+1vZONgSAtLyrm5FW9vuWPkdrRYNtIar0FcHtb31lnXBSKYOmi3VSnKhdLyvgP+SWEGeh5+nTcFqa8UPYdM5v2zG5jly1kNfKVP3BPLmnrIhfGJ5Lr0HsUPpHs51A1SPnS+vBaOCnSfhfzU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113268; c=relaxed/simple;
	bh=mraH6v8aksAhesK9eG356Uif2nQEzR62+Ce8SxAKdG0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=M+CwpbFiem/tYqXX4kUFhit8PcQYwbyG7WsdxzbTEqzKX24O/wKZXSt5yAQr8p9nazEWxwrdBW/+Uef7Yb9UtX6QitLEQ87Tkz3FmcOskzFlInB92Izt2gKPFmm6rvyZPjq3UE4kRBfKjADCfV86/Ln32YLBhcKMVO47zqOHogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9/0wp5m; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9/0wp5m"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so21362055e9.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786113265; x=1786718065; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sGoO/Wbmk80pptcCMxW1FaIeOFPEzTpAp5ud70lvHlo=;
        b=R9/0wp5m59VpDmTNWvORU6ee1XhBbxJFT5GpSdKfWz3UY4Io83DJcKi28MkUXTJlUb
         KHs/2VNXktMQmVY30Kb6VAQECdu3yn7bhnSn8NfnRVgvLvW3dlSXRd5z8bbd3Od9KwK8
         lU+AOn6cufZ/0+Lmye9pYMB7rm9R8NM8oI4NclvOgmRq9H7ixofyMKpcMRDAfe+yeq3I
         6p3rUI/1LbYWKfJm+v4BmBD9rBhQQp7W5lDzSC3q6ux1N/Wz3Hu86V/AFMo26yh7zsmf
         00AtY4AyTsCXOJXii5hvaVfwct88wwWxiAUEuykJ4FnWWo6ByTlVoCPIuWdq1d2+LuAI
         7N1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113265; x=1786718065;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGoO/Wbmk80pptcCMxW1FaIeOFPEzTpAp5ud70lvHlo=;
        b=pQKGBNWdn1aEyJk0Nn8Kg3Jibx+WCLjaLb2E//AArJesqIdt/BJ1hLAjhft9c/IHvY
         jwWGEeJdf/jdqNz1zGlpWXXuYbeKpW3rDOfZ3xmnPKzaFA6ds58jx48vkPY7JKitJRn6
         dW868f0SxdlDPuveMZKHdzVkzCTP4BI50ooP7d9d4QV4H+b1e3JorUlhF3Z7r9bWU/84
         LfblutIh7yTGVQp9lfTuFAQVC+Jhuzce/upk0Xsb0JhsxG7M9DROAmsp1Kosk6/1aJiJ
         Dzm/EMdRHjHCuhvvSt0OV9C1IUQMaVgoGJlUHQwaa+6GQn2x3I7LkGqGgM+iYtgl/c/x
         aUww==
X-Forwarded-Encrypted: i=1; AHgh+RpxjpPOAKkC7tnIuRZ9OHdchIxfxNEWHU5oq8mdbmrhMtu1pQZNXOpgtKm+Nr0anBfrBwTg2Lokc9sz@vger.kernel.org
X-Gm-Message-State: AOJu0YyFK08Bk+ndCKz7p6kZdOxwxDdUqIReJDr//WPkIBoDLnNk+Nrn
	q/RPaKxfs2PH0FCUBHJAW4CKXeXJ52pp0HGtosMDi2zz6zTNSTS7jpno
X-Gm-Gg: AR+sD12R1ZjjWsTg06twnnYZBvAdyruPHzbyw2wmZWirmMf9QET3n4+10vOYwarNOk3
	tBXnoSXlVwxawEqSv+lEQ5rUpkzohmUSu/zy1BOelXecHZtXeJPMGmDzvYe4e0N9CMxLOek2fqf
	iuKQfn50GE1Lbwm7L7CUWJRT3pmnIVuLko7Y4DhvSX+nQ+wb7JjHl0FZ4xz+uU7u6nz+O2x6GZs
	HRuJ9gwoCXP92vqcy1NGo4+HkWA/ZG4Y7Vsih+HqjLtYQ6/cKniiGl2jNQA7LPP89eIGqOwKJ7m
	iWdTn0YbsVPClNkqDIPRnvWSjjTa7c+8UrWU51xsOruYo92dqeURMZyVJDtenAWAD5Q1iPSqHVJ
	9GXZ1xkALxuvPHz/FNNMxTD72P/IEbu5EmYvVz+eB7uo9bKp54q/Gaq/JiKJcIp6T8bTBgsES8Z
	Hp2Ez9OLITN+h54Lm4+Nkj4CCtfMIVQ4SVyXHBf7rIpkq20kkTt2wfUykX8eNcKzqjBSjbm2dFN
	Q==
X-Received: by 2002:a7b:cb95:0:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4994e7c118fmr229562055e9.11.1786113265021;
        Fri, 07 Aug 2026 07:34:25 -0700 (PDT)
Received: from localhost ([2001:4bb8:13c:7c2e:12da:15e:8c8e:cf37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995421934asm163305435e9.5.2026.08.07.07.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 16:34:23 +0200
Message-Id: <DKISB5L2MJXM.S5JH6EXSRJM2@gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: iio: light: veml6030: add
 veml6031x00 ALS series
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-1-e60876fb3640@gmail.com>
 <20260807140640.80DF61F000E9@smtp.kernel.org>
In-Reply-To: <20260807140640.80DF61F000E9@smtp.kernel.org>

On Fri Aug 7, 2026 at 4:06 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The multiline `title` string in the YAML bindings lacks proper in=
dentation on its continuation line, resulting in a fatal YAML syntax error.
> --
>
> --- Patch [1]: [PATCH v5 1/4] dt-bindings: iio: light: veml6030: add veml=
6031x00 ALS series ---
> commit 8d68b2e616d3ddf21759545fea44ab122ecc25e0
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> dt-bindings: iio: light: veml6030: add veml6031x00 ALS series
>
> This commit adds the veml6031x00 series of ambient light sensors to the
> vishay,veml6030 bindings, updating the required compatibility strings and
> datasheet references.
>
>> diff --git a/Documentation/devicetree/bindings/iio/light/vishay,veml6030=
.yaml b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
>> index 0041e1db68388..6a387c76df353 100644
>> --- a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
>> +++ b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
>> @@ -4,7 +4,8 @@
>>  $id: http://devicetree.org/schemas/iio/light/vishay,veml6030.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>
>> -title: VEML3235, VEML3328, VEML6030, VEML6035 and VEML7700 Ambient Ligh=
t Sensors (ALS)
>> +title: VEML3235, VEML3328, VEML6030, VEML6031x00 series, VEML6035
>> +and VEML7700 Ambient Light Sensors (ALS)
>
> [Severity: Low]
> Does this continuation line need to be indented?
>
> Because it lacks indentation relative to the root mapping at column 0, th=
e
> YAML parser treats it as a new implicit block mapping key rather than a
> continuation of the title scalar. This results in a syntax error during
> dt_binding_check.
>
> [ ... ]

This is right, another device was added to the title between versions and
this 2-line title need two white spaces at the beginning of the second
line. I just validated it with dt_binding_check, and it will be added to
V6.

Best regards,
Javier
