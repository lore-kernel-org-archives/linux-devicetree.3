Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705862;
	b=0ibgxnD++Iw+y7ndgzyeDHS06gI+yRqDe5aE/ytK+juo1OJdJ6fTbLO1QWPpt1yL3iRn
	 HWqjavyVaMPAFFrQKJ0nH1v0Kd1zBUvqLEaE7lbSB6kXWQnsESbghDx0c/foirdNBwvOC
	 x9XIOQUHZ7N99+uqQSBmp1JLps8fqO7Ekza0ty9cCJzZJqIjt2xelQgOZxwrplZylrvVC
	 bbNUBLaUTsrD/c21bKDPvGkC6CemRMUn0bluSrUrutMdoWk52E7n4zjMnhpOpX3LugiwQ
	 xR/veMOxDDN+SjzyazqRii49sQkwkr1NlCoM5wWXPZ19OKiOr4iVgQnvSGepBGp+DJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hmKc5OL+Mgz6BiLPRBsvhxg+w0u2ZayYKVKGlsKtPPc=;
	b=YPeSBMUyfdcS2xR1dAo6/XtCHI2PsoCY8xuXW9d1yybjzEH1cwf6Nshjn95s/y2DYxqp
	 lQs461DcebTcY275eA6na/MxzaNDt4pp854SXI0pZMC4CVQUQyZ9/mdtJmRhgTmS47Uw8
	 3yf7bd1qyZLLRfsqk1Qz1auYoAzh9EnOZ+sZpUe1fppNI5gBR7GXpvw3Di9nVQYtWPqS+
	 rs9YvaEqZR4h7CFtuw0W0UPerW0D/bITEl7A8SjIIXg0WmE1+RmsUVnIWOvdPWN7haWda
	 668Ij1aXSGBjn6KICz1Uemhbs7v1tSqmhnxnZ6iK2zMcGciIHeCdmxF0dp6bNKhLRYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=2vNX7mSL;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F167F606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F167F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=2vNX7mSL
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso298880666b.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795705860; x=1796310660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmKc5OL+Mgz6BiLPRBsvhxg+w0u2ZayYKVKGlsKtPPc=;
        b=2vNX7mSLMS3ZNWe+0DciQ0V2qhoDcCVY/a39ikrSq3nn6C8X+RwcvVFKT7HVSOhA4I
         5ZxPAKArax4IHH/7aVWsuWG6Jks7NGNmtExFNFyHi6TDVsHDAoaYLgNyL763SHLrMKLC
         +uT2UIUMoOvSnFGpG+BqL9FkexuYvKBC0kDL+ygJYbnzsvvtT8jnNvmAn52I9G+r/J+R
         vP6YquxG7XiwHez08tly7eb2HGHX0hRGs3bOoMN8dU9CZGbtzZI7en4SeGmK00NcZt8X
         PAA7DyqCrcf/MHTtj3uZmRHZwdnnZy80T1UFS2PH56kmM95WUf9/dvzKjA93ffOm4ZI4
         tKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705860; x=1796310660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmKc5OL+Mgz6BiLPRBsvhxg+w0u2ZayYKVKGlsKtPPc=;
        b=PKtMN5MN7khsKo1/8lAE4Zb75C1/1z3AEWg3KoN7uR/c/m9emkGQIHxgZONAcgPJuo
         NMtSnf2Ecp4nKv6htTrCAQ/fXHfuJdDGjMijpQTZnmjdG4QDpQ+7+tutv0RkldIN184C
         qU7ncVu4a5t4phn29DxccvKF4LG1iDn1dYItnUkc0JSUPPRpi3cvBiuXRrRGc5iFk1gE
         0pNNgx8i3Gh3V5X26EMft5j1DmadCQXN0lOSpxlCRhI7hyikG5JsYBjAnu01FjeW8OWM
         YITOFaywN89YsVEdYSuCRtcNbmmR39VudGs8B4PYvP982dlSt+rPDoQyfHP8KvmnbZuW
         5/9g==
X-Forwarded-Encrypted: i=1; AL+hErHGGaHhzHXP3FVHS6kOf/Jshj5S8tnZ0zvbnyIPFff6/Bzel8X+WoqMYpIwD6BRY6cIJMzoSpG3av8a@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bf/1ScU0V+kEdUD+pWHh5B24WwzOJbGYplRMCunb/ZOH2Q6kH
	1zlap3Jnajp/Je86ExWkSSpr2I/Yzyw2skGiNlaSKh+fYQb5o9F6vuLrIpK8j3WRB+dCyH3qmZL
	8BpkknDE=
X-Gm-Gg: AZFdTZcxATJBPrE7zKn1UxcFT9OKkmiqWLtGxIsV5u0zTwLEdairWFzdlyMVCwPg1+B
	mnlUZflxJv7HWwBg0V/8U+vgtAnDRhL7pVHu+Fsz3dsh24aoMP+GxGjUqf5VsHdil0yWhNoyCOg
	8oq14Dx7J1duhP4xNwMR0/1v4FzTrqUdOoCpsJ7uaDk+c2SuCrxfPiqQlHBo8w37ANqwbOjvN5s
	id6LgJ4FPhECV25IU1JUqdu2VC7B3My6TyE2A+gsqiKQcaTTlYI55hY+VstZakxwEHW2mt8jKmS
	EsceWAbcI/O++gzfQeE4mEl8g81Wai3Z02XpqgRhfmZTWcegL98MytP0cZdjTba9wb1pG2kq40I
	P4ZIsm8IHc/VVlVNWliBF/q3hJOQ/gGNiQDQudRAl+ugyGN8icF6uYhaTeIBsRC+kCCIrvUF3gu
	rxHgyN7IEFWSJ123o8nuEISQ9+MtKI6uHGm8qy85NBVt5BYNRDVQVefdrzNElD7qqsApBNNvWlS
	hr/XCFFQIRb0zerl22WXUfvP1HX73To9ti+0OmfW3RJaREK5rJNJoo8zlrKcdwVOusyoZaamEDw
	YpLmer7wm4H235slhSt8gsygyh3mIgyN4aRvyn/sym5B1Omych1Q56Rn2mOXIUrTWAvGnjZasi8
	xvz0PHA+tRgxub8UMPyd7lpeRe+SVWFCExanFErJLJn03k5M4MEUdGpFnioPNUg==
X-Received: by 2002:a17:907:9629:b0:c51:536b:b23c with SMTP id a640c23a62f3a-c51536bcdf4mr1427126966b.10.1795705860333;
        Thu, 26 Nov 2026 07:11:00 -0800 (PST)
Received: from [192.168.1.104] (92-115-210-87.ftth.glasoperator.nl. [87.210.115.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec177sm767498166b.72.2026.11.26.07.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:11:00 -0800 (PST)
Message-ID: <37ecd4c5-e768-486f-a7b3-2e8a46e4d4df@fairphone.com>
Date: Thu, 26 Nov 2026 16:10:59 +0100
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
Subject: Re: Surface Pro 11 OLED: tested optional vddio for DW9800K (re:
 [PATCH v4 0/3])
To: geoca <geocausa@gmail.com>
Cc: sakari.ailus@linux.intel.com, git@apitzsch.eu,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <CA+7Hbh+=SOYBqqQN_z6869s54hE9QpKSr-mZ0+2EtdNG=DMPbw@mail.gmail.com>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <CA+7Hbh+=SOYBqqQN_z6869s54hE9QpKSr-mZ0+2EtdNG=DMPbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello George,

Re-sending in plaintext...

On 11/21/26 22:46, geoca wrote:
> Hi Griffin, Sakari and all,

> Would you prefer the vddio support as a separate series after the v4
> binding settles, or incorporated into a subsequent v4 revision?

I'll put out a new patchset version soon enough, a solution for this
could be you using a tool such as B4 to list my patch series as a
dependency, then you could just send it out as I churn out more
revisions until successfully mainlined.
Otherwise, I only work a day a week so waiting for me to finish might
take a while.

> Thanks,
> George

Thanks,
Griffin
