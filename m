Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425919;
	b=0Dhbuxj3/8zSaDWNOnS9KYvukzNvw4TFCyjB7O6o+FohyuvSw+4i5BJvw3U2oH50a2Ho
	 NxtKkTY++YC794f6uJrM1OT/4cFjwIYhocWz7rnrQu2E4Z+ypKfsLv8jZCAqHNCQx/WZI
	 Yhc952cHbB/8j3EqeAAKEuO3wtRilpkLmCpzmMdPjnaKGmsJDtfzPtzn50OfSJXef4dpV
	 CTqhrh/CPpzmERyq0pG6XNeS5hDELYH/q+znEev19nk9gnmwjsZ09TDOvvSWWTMKsMEWI
	 xrssFXHss7ajn3FEyPpHey8geHmCeSbVas0B2WUzaKE35eWVN/0eFkuwMNbt7HR0cJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UgemrjOaWZ2A85yJM6JRsBPML8uCzY9gPVtlKFZpxk4=;
	b=iGRoKjQyWECuPR9plT7/HaFBjqjyKaLk9egEvXvV9HT2zvRlScwETq2zbwUMPhAW8fJh
	 5JEqmAIiZkNQ6xlZT8N1jmz5enek7GScJl4x7UEROiDbHADG1n/nGPzjaf4bajCjU3JJm
	 E1MwO4c5QhTlFNb+9coaR1rqrLf7LlVcIRzNEirblvPVTbqL8AHMGNNfEhv9JVOtwcUnd
	 R+SiXfG/+E0GKbIaELscxv8KzBVT0ujmGiFQlUTZUoYUCYU4U3H7VkA9U3wDtRJhGxk4c
	 pUXSLO/PvxcrZq4wG5W80MhW26F3dEr1NncJ/pJ91lK/y2CDSRzIxEbcczWY8PHJxRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzjwIu+3;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2694F606A327
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2694F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IzjwIu+3
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-860f0ac44a9so484854a34.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794425918; x=1795030718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgemrjOaWZ2A85yJM6JRsBPML8uCzY9gPVtlKFZpxk4=;
        b=IzjwIu+3f1t5K1bR2rw8Mb5KZmw0vFtUOL59nANWu7+867ENtdNEXbD/XA8Z2DyuwJ
         cNCBOjI/QBahzViGurtDbwMt6XC5A6c4BKOXCfTo5FqNBd7MCLSM1oXJu4ssEmwbjiVa
         fVroBG4FF1U3HwPvSKLRmg37nLijCfKiJmExZeywUOKowNIiyRsfz9wnof2ZzFAlv9fP
         Zb1gaBr6CzLTEFRihhGb34MfvWCuOdOWv2tBZG0CKEWhK8oCP3Z4816MxSECh+iqm07J
         3GFwtqf+LU/Ibzn4/NEzbEVQsOSh1DdnIak4lsr0ZujR8XzJF8+NX133PfwlNoExtpkl
         V/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425918; x=1795030718;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UgemrjOaWZ2A85yJM6JRsBPML8uCzY9gPVtlKFZpxk4=;
        b=J3G3NJ6IkbUeZbqBThxdsReDDxCT5DB1YWNekaRlFsDoD+i2mVcNjjEEbl1gfa1cav
         6/P0zOjanDwbJDF2W4ytz9jRiBdpSsPNPxh9zRz9iv/L5yNbfwd6WYBVgvv/X626mwQR
         6j8bYRwGyXI35maPQKPUnlz2wRvjcptUvlM0/R2/JK4U4fh1fr6icZHzOraAJCMhZGFg
         +2l1jOwL+ydZe64iVZSXyVtP8Dcn97gs0iWmxAKN0xqWf5dW8lhpv9fuUD/yasjEP9Jw
         zPumIQv4GnRDR8R5CSORpQeqpO4v435o/Q1YsUpiwnYpmXoy4st1xJJqghBCd/3siEPT
         ZDMw==
X-Gm-Message-State: APuU4Z8I7iyF26r62KzUTqoBEXD/+CIo7MCHBhZrkAVQfWeXJRVPA6ft
	08KURpYN07dp7w4pHVBrg2udXBhHfKqeGcNRAqpx54ndsIoBFyc41rgv
X-Gm-Gg: AYBFou3APlpPyj7KTWIRwnT2182m1Y/BAQ3cZA5z9Urp8YCLzOYDXTxGonqioFzyA6E
	ooZ39Ww+AaldpUyB7S5c6LEOM5g+Ky7DdMMy3juStm8IJdXkNlJSR1OC3NGksIqxH7K1eWFLIl8
	AnAuE1UkoL8qABw09LavUKnjcbDcEA4wU+voSSIhlA3XByspZruCsXgPgCVs/we5O+WruLwV32T
	RlGhr1x12KGrU647Baz66AiXSHJQ8AjUFqHfrrUD5jmwHTqokEQdpeDcp5OZm+fCzrOjoVNpFYC
	m+bx0qSqE+/iuRreOeGjYC0RpwEshITxDQ4ZY9oFvPa1xgFJuBRhh8GhaGnYZjbYnWqsSSHwEp5
	ytIWLXLZoPWkFHOl9/Y2Y42/b/smbC5ao0rZHA+A4PkTONqqEJbRP/MZLNIYomrIYJmKOkNUpeu
	QW8z0HChPe0KudZ7cUmfqgXlXRJpAVVch+LL8kbZbTRGb3WppoNO5ls7v1Mp7uRnThD5hXuQbd8
	gBnuClRmwDDwhagnJjmQpG0HUiRBK0tTyikwsa5Y1SXO+irQCs/DSQ85L8VDxMnCAxztvlopvvu
	Sha5MINMZcvZwXE+vPhRSvlD5rebV3oUpWrfTcdco/tp2K5Uxkkc7nw3UUUdQsz7ydjwls4C65t
	FmkCknK4dxF19EwlPOdc=
X-Received: by 2002:a05:6830:640d:b0:85d:502e:a26a with SMTP id 46e09a7af769-860f2848713mr3424226a34.14.1794425917990;
        Wed, 11 Nov 2026 11:38:37 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7b4sm5098512a34.4.2026.11.11.11.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:38:37 -0800 (PST)
Message-ID: <8e18dc61-4d6c-4da7-bd06-d547afc5c545@gmail.com>
Date: Wed, 11 Nov 2026 13:38:36 -0600
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
Subject: Re: [PATCH 4/5] arm64: dts: mediatek: mt8173-amazon-suez: Enable the
 volume keys
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-4-77b47cdea702@gmail.com>
 <sashiko-outbox-209564@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-209564@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/11/26 1:31 PM, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Does enabling &keyboard cause make dtbs_check to fail on
> mt8173-amazon-suez.dtb?
>
> In arch/arm64/boot/dts/mediatek/mt8173.dtsi, keyboard@10010000 uses
> compatible = "mediatek,mt8173-keypad", "mediatek,mt6779-keypad", but
> Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml does not
> list mediatek,mt8173-keypad in its compatible enum.

Same issue as [1]. The binding has been applied to input, but since the 
mailing list patch doesn't apply to v7.4-rc2 cleanly, I didn't add it as 
a prerequisite.

[1] 
https://lore.kernel.org/all/b005af5b-96a3-47da-b53d-5dd034b6d56b@gmail.com/

Best Regards,
Ryan Brue
