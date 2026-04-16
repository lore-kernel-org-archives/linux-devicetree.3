Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB11FBEA6
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 17:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358858; cv=none; b=dakaW5QIGCGi2j6dL2Ptk7cqL+cE72ujEFfQ/OVQZCH9qSZZicOypKsU1Bt5detW8o2462Od8LV61L1LhpKxWaimfxoNDAEQCXRwEHNfqFGI6+ipFncP5Qzv5HijQXg0aJSLPNacxkKPU+qoaPW5b+AKKosonrBWZPz3BUoagXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358858; c=relaxed/simple;
	bh=1CZuCyQ4F7gIhJWlCZS7gOU94W9dFudind/rqbdZLnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6+wDkubF74E1JW6pMp+l7GSHzke1Pangb8XJxajQ/mlQhR6TXwy1ACy2oIP5oY/Joino8nzmSpcEKhblHuTZT6WHnFrguBi+E81XvUBGYgAsdoCDffY9poie7D8GXArHLmTevwJHU0vwNkVEfhFqVwaGs8DxpPyQviMDlTD/K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sy138BmJ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sy138BmJ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so87544771fa.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 10:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776358856; x=1776963656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VpkNf2axxZW2MI3QuLeduQYZrK6zUSn2neT924zAFg=;
        b=sy138BmJhg46ddSgrk/ooCIiK1C1NcBAs8JXLnwx0oN2sFJw5hf8+zPixXNeBwY9zz
         WLggPaIomf4PudZyyCrDu22xuRhXf1GMET6HnD9q4hmw/TZ+KMHMrSPMD9+0JOwKM+u9
         gOi7KDXflU90JC1Sr/vDgaUxxGEhm2dgUsHHte9AFBSq2oaeImelNXICkEH/lJUgVCiZ
         2FnnXWY+UdEDQz+1DHIHNHSubZw7ZCw6IglJ6HE9f2F0zRe1QUiMVmcEq44+JmDTrUlK
         gdjsOVCQbz4BHUWvu16YG+EB203d1sQBNK2Sot47N3kMw9hYSCzHV89ANvggzcvzaAVB
         yrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358856; x=1776963656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VpkNf2axxZW2MI3QuLeduQYZrK6zUSn2neT924zAFg=;
        b=QgwWNJWGeh+0O4hBkC8PnxPv9d+Jeqgrye8pJYkgPUPBz0zTn+iUkJbDWO0NZQ5gDQ
         ZyD0bqup+j9KRCjvRJl8P6FTCWSpRUIeNFqQnoYfB5szrh7vV5Q/Thsuk9qJqw0dHdTf
         2Uohba0mH442eVtuUfcz++Q60NN3oi3q3vvv+CwFCHf2Mgae7EDcjBbiluGpOdRxCB5I
         uBblx4xwCwBg6z+Yto+oJ21PEV0PZEdaeRcQluqh6av+frKQqH3+Aa7i4fWZCxhfv7KY
         fNYDRWn29etIVvx70y0LnJCv0eJLZv30Wuv+mtO46+lTrsZiS7zB7eVIj7iunqR/f2ed
         Z2EQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gVrUvJdDx820HbLwD/qLzYzd6C6l3GXr3xy3VWAQzCpM/rs7akJn4G/l5ZJEbTKc4XOn5ilTnFzfh@vger.kernel.org
X-Gm-Message-State: AOJu0YyUK7iwQNt4e8v6GHKq/mzm/DTY1G4eH2exl5AkVuj/qRlu+gx7
	jcpu1FVFV6tC3nEPunXNd1PioYd9Y43z5Z1T8byNmgm22EfOXFXyGPGq
X-Gm-Gg: AeBDieup8y5lt/DNT+jZAO+mh2546VBazKgSNviOVeB5KCubRd1ZTp7oqsUnXx+FmMb
	cpkq0OztUCfRuEqraYtByjVu+jRV6uaaa7YqFjcFZK/xPeiOTrpJ7biCxbVy1mFRzHbG2agNFk1
	FQlpq1Rmhwz09aVOImGBzjAxaUJAW7DnAA3K64C80cUfp+BhhhvszHxP4Cl4UneYwr7mhAzRDOC
	dw6rsktjitMgLqUkiwaTJ/9rUiWnT2dU4GNkV0OFvudeachf+cViRz/glUu7LD1mN3PtZBOgQSB
	bhmzI5HFZJJlzzX0WQCgXb9OflulVqcWEN78s1cllSUeNEACpW8nWHAfCC5iJpE5n8JZdKM+hVF
	6pQSbPr8cVV+5hW3VB3x3H1mq1+Au7GDaorrBj46MkGQoCNeuH/YNzmz00bvdpSdzVpUhjs7jcR
	+cFajhC5+hJ/hYLS5YYtZg+YtfC1XUgrD64qfQHTivFADlobkQN4F33uR2cH6JttVNZB2+Ys++E
	QE=
X-Received: by 2002:a05:6512:3405:b0:5a3:fe5e:3d5f with SMTP id 2adb3069b0e04-5a415540f62mr51697e87.20.1776358854697;
        Thu, 16 Apr 2026 10:00:54 -0700 (PDT)
Received: from [10.29.244.82] (m-37-0-167-201.cust.tele2.lt. [37.0.167.201])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272e14sm1416433e87.3.2026.04.16.10.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 10:00:53 -0700 (PDT)
Message-ID: <6b8f767b-98c3-4e31-beb3-20988f764359@gmail.com>
Date: Thu, 16 Apr 2026 20:00:49 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> 3. MSM8939 supports HEVC decoding, however, as the patchset is written
>>    now, it does not work. It can be enabled, however, it will result in
>>    breakage of Venus for faulty MSM8916 firmwares, because the code
>>    disabling HEVC for HFI v1 needs to be removed, and as per commit
>>    c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
>>    this would break support for some MSM8916 devices. What could be the
>>    best way to work around this?
> 
> if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))?
> 
> Also, you mentioned HEVC *de*coding, while the commit you pointed to
> disables *en*coding (decoding had been already disabled prior to that
> commit)
> 
> Konrad

From the commit message I assumed HEVC decoding had already been
disabled for the same reasons encoding was - faulty firmware reporting
codecs it doesn't actually support.
