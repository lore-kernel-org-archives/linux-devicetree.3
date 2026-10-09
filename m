Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1C48A8C1
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540206; cv=none; b=AU4rxEZr7EDL8qC9QLo+lNJzG39Gd4zc6JUyep0okH8Vi/Agl9johH3Q1hXULjP+8T8QFNDIItdV0hR765FY3w+DpJldnKP+GK7NefqINlsq7vPFE7AlUMqAOvbDn9KVXmuE9cPOzfryZUhLi+XU5BIvq7Cl/mM9Wx62hZiItho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540206; c=relaxed/simple;
	bh=KPAFyUw7nX/MpchqdZD/H9rJtTKOPIWkCTHK0liR+yE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWgVn9aR6BIGbUbPcwtPIbw7xCY0iKU1a5FbL7Fk1+cF6UvcSAUq/i3TB63OS41R28pSylUfdCgMC3wrOy+rWn2ZE7a3KDLj8tx7BlYEJVoIR2JvwWKtdS2w5Fzx377jBv6w+uGzlJWhBWifkF1iudznjbHGyxo6pPdTM/FsMRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=X+gJx+86; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="X+gJx+86"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so11273155e9.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791540200; x=1792145000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPWJMeDyVSRIeJtDK0w7ULZSIZyQfconBMNDwO4cVgs=;
        b=X+gJx+86UR0wiJapCi7qYJfEeUAnWJx723oaYX2UjY8JGe38SiECpw65yTvFfitb2y
         drJYwVo25AZuQFWgsiQ8ca/vcIL9sQoBvMuhhQKzp9NmI99vthM0fSTEjRVc8/Vu9d9L
         L3INcs9Fd/MZXkrDMjUetbfWkSUm5LHPQuNsSjqca/BvaJW7yY4UWMJhc9zWeITJyaxp
         Ni446nAlJuF6+1buV0EmsonK9YDbSpYgW+RUYIVTtq/WtjV3Xk2ua/y6vG+Z9QJqw/Bt
         NTb3gNqQUChi27ieP0sKxK6XHRf4qno/OVrwOUg7IiWrLs2Z0sTIc7vZt7glZM/EG/vf
         diuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540200; x=1792145000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPWJMeDyVSRIeJtDK0w7ULZSIZyQfconBMNDwO4cVgs=;
        b=PDrlYJMMhlCsUTV7mLyKfsncvgjbEFBYbXsJwT8gNF0Tm9wd8KoY2l7DKOs/GT7Jbm
         e0hJoMRpGWT7+22MGTo2ittrpHEiafgZA/yOhNIiq4Laj2bQ1NyOgsnzjuxQf+mo1gXz
         DZb7TuHFGJd2I9SA10kUk943oWaMlc30mRWbNuR0SpKl/XAeVCMAFZGZw2G0wn/HnbLd
         mVMBcIFf8zHp/eAeyhKqdvVrxZgZhW/dZyTkqhbDdDFzxgJ7kB5c1k7ULo5H1YN4vQ5d
         XATVizPqBdD0X4J6RTR7VWO4LH/oxK+o9aRIxiSsPoTlWFDvcpX2uOzw9fLpi8zD61m5
         /qjA==
X-Forwarded-Encrypted: i=1; AKwUvBwfz4Ezc6S0UmR+nJct15r1tJ7QIxJQlk1v+CEMcs8tSWcZel77or1kmt6OovE9t+UAxuX/l35TFJNc@vger.kernel.org
X-Gm-Message-State: AFuF++nyCSzNczeJOeoEeeP+WS2A3lZY5GlTtzX6w7n5vUwqaDih7SWP
	48glM3h2hf6A1Nm52O9OEbP5U4Rd9sOBdgW/GhS/dSfsmF/uP//5uRxjYjBwHXy8USY=
X-Gm-Gg: AYBFou3b8kRbFEYCrqKhq+6ourlprAggSwXQQAU6CnKwtynye1BoN8NCTU+0qIRnUAW
	67FN4A8TDIr2vkOqbTyuwo9kePViKhXD0XvL+HgwhXgeE7Jgj3/TJVn7z5fhcIuAtaKW+LFZkD+
	CzA1yywUCgAfP+LtXdLXoUPY60Y+NFChxxpjoid9QX6EMOGSOFlsuvTCZJ4TJUsLPzZVdzj1Qq7
	Jso4vUrI2em8lDVVsT0/gLlLIAP54k4DHOvbrEo8ioZZWGF/sj0OrYXrtbkt0ynHAssHg/FTJvH
	gVc8LGvSzr5u0HdGWpjQMazSF+OJqfG/+/dObnduTI7fI6uEEy3OkRqx8wceG2dqOj6eI5Tbdl0
	ReVZwtRBUZFDWXcLgHqJwdXjxTjBXeOaKyPoG9CmLdOvvpi7Db9WvrhvaXe4J25eQjFCnoEKSLk
	Hv2AfFFI59yGQ0gUdLzfbTtOka4lor1NrIfCFaiyBysc5vJHE9XCIQ1LPKYzx0ATeZdeoEPn5aw
	rpMM7CVCfRz
X-Received: by 2002:a05:600c:4ecb:b0:4a1:76c9:5408 with SMTP id 5b1f17b1804b1-4a18e4a510emr26609695e9.11.1791540198883;
        Fri, 09 Oct 2026 03:03:18 -0700 (PDT)
Received: from [100.64.0.1] ([147.161.130.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm68317565e9.2.2026.10.09.03.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:03:18 -0700 (PDT)
Message-ID: <d998b030-fe82-4206-bcab-e00a53c4b28e@sifive.com>
Date: Fri, 9 Oct 2026 12:03:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] riscv: dts: eswin: add I2C controller support
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andi Shyti <andi.shyti@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Min Lin <linmin@eswincomputing.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-7-pinkesh.vaghela@einfochips.com>
 <a55c26e3-1bf0-4ba1-b8b9-14ad76a44a14@sifive.com>
 <BY5PR04MB70253B3321460DCF7ADB54DF838B2@BY5PR04MB7025.namprd04.prod.outlook.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <BY5PR04MB70253B3321460DCF7ADB54DF838B2@BY5PR04MB7025.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Pinkesh,

On 2026-09-30 3:06 PM, Pinkesh Vaghela wrote:
>>> +             aon_i2c0: i2c@51830000 {
>>
>> Please keep nodes sorted (the aon block controllers go below GPIO, etc.).
> 
> As per DTS coding style document [1], "Order of Nodes" states that
> "Nodes on any bus, thus using unit addresses for children, shall be ordered by unit
> address in ascending order. Alternatively for some subarchitectures, nodes of the 
> same type can be grouped together, e.g. all I2C controllers one after another even
> if this breaks unit address ordering."
> 
> Do you still prefer to change order?

Yes. I believe the alternative option is allowed because a few platforms were
already doing things that way, to avoid forcing them to change. However, for a
new platform, it is best to follow the recommended pattern; simple numerical
order is easier to understand, verify, and automate with tooling (which is on
the way).

Regards,
Samuel

> [1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> 
> Regards,
> Pinkesh
> 
>>
>> Regards,
>> Samuel
>>
>>> +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
>>> +                     reg = <0x0 0x51830000 0x0 0x8000>;
>>> +                     interrupts = <290>;
>>> +                     clocks = <&clk EIC7700_CLK_GATE_AON_I2C0_PCLK>;
>>> +                     clock-names = "ref";
>>> +                     clock-frequency = <100000>;
>>> +                     resets = <&reset EIC7700_RESET_ANO0>;
>>> +                     #address-cells = <1>;
>>> +                     #size-cells = <0>;
>>> +                     status = "disabled";
>>> +             };
>>> +
>>> +             aon_i2c1: i2c@51838000 {
>>> +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
>>> +                     reg = <0x0 0x51838000 0x0 0x8000>;
>>> +                     interrupts = <291>;
>>> +                     clocks = <&clk EIC7700_CLK_GATE_AON_I2C1_PCLK>;
>>> +                     clock-names = "ref";
>>> +                     clock-frequency = <100000>;
>>> +                     resets = <&reset EIC7700_RESET_ANO1>;
>>> +                     #address-cells = <1>;
>>> +                     #size-cells = <0>;
>>> +                     status = "disabled";
>>> +             };
>>> +
>>>               gpio@51600000 {
>>>                       compatible = "snps,dw-apb-gpio";
>>>                       reg = <0x0 0x51600000 0x0 0x80>;
> 

