Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D3842089F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343386; cv=none; b=WWiw9txaDP5Jn9xISITBIEBnyyRHsNbVxxdf1xGA2w2rqQdljmiZZ1KWZy94S3z5gwHfr+4qpNs0NSSF8K9mRxcbhV0Omjy4oMPYvahqLPze27nbkb+ymMv8zJf54nsYHdGf+WuTL6mqmcVXronFWx3nUePCTawABe7ElT24Tuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343386; c=relaxed/simple;
	bh=l41RXQvXBkxvYTzqq2rFLxtUAbzHPMY4/jExtvAtGoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7ehlAczblsxOupNclYzYHWLTctqpipD5sWdCH6a6kqELNRsweuttDQAWg2r/m3Qt0EH2qfPPCoW7pl5P6QS4oBNAqUno7kJb1CSp+KXAP0Nw1aI8aKut+lAjr9jLXaVZ/JlFPdtd8gs3Kvq83uZLbBVitluUtfrfWcVS1N3D5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eAEuPb/H; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ac2vAY7y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eAEuPb/H";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ac2vAY7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783343383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tUHCisuScEtc1kpgEniw1SQHEHnjG8D0qhIWEGCMudA=;
	b=eAEuPb/HBJe8Z1MJte8FD1wpEArskyr3PCLV6pcm1rgC9zodqjJ3VgxpE1URF++mCLUE0w
	M5Oc/u6itehPacQUzrEJveweTZlk0cg5B/15Q+wfKmNEGPNznikb9cao92oGMFotkb+PFA
	5/GFs3FivE63EFQSsMYquLKZraCrL9I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-mOz2EU-fN9O4LSddg6FpjA-1; Mon, 06 Jul 2026 09:09:42 -0400
X-MC-Unique: mOz2EU-fN9O4LSddg6FpjA-1
X-Mimecast-MFC-AGG-ID: mOz2EU-fN9O4LSddg6FpjA_1783343381
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso24222755e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783343381; x=1783948181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUHCisuScEtc1kpgEniw1SQHEHnjG8D0qhIWEGCMudA=;
        b=Ac2vAY7yfmxQbyWeQvPtdzzMOm0k8nRC+Luvqdjzg0WrAC5SZuMmiOeA81AgE17UVY
         5MXaKKU+Xho4YSscxth7UFM8yBnc+E08tgHykdfq8bFSA9t9WcVxozypA0We/C9vxt5E
         2wD8yI2Mli4lyjajve0Dj6Nnepsj3qGz/ixlmqakSPi+P5D+JuxiHBio7celn5yXJCXK
         M5lMSO2vHl38UIzZk/kURmZ0Qlcf09E4lAUTsxIwbJ8MOKgx2T/xuxswl8W7qzihtAuA
         2anZBGU0d3OkoNxC8CEpui8heMnkG6cM2FRxJ3C66qwpk4Jl2zkYs/z0h6VesK+gajSI
         SYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343381; x=1783948181;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUHCisuScEtc1kpgEniw1SQHEHnjG8D0qhIWEGCMudA=;
        b=U4bqgICNfjcefamREyzCxz0+WfMIhDUW8IsMApGJwQD0jKGD0OGD9grPaapt5QmlmX
         SpLs/KDWTPMnAOrCI5xdDZROAdKfGHwKg6GWf5Iwco7byWa6XjcjHLq6IbWo07s+EJEv
         RIjPrQl7frpQS19xZzbW3sDVCAlDuQi1GaEro0Yd+IcBSbW9mlGvfwCh/TxBXqEB8fer
         bf5xTWrDttHVwm6BGmbF5wXw3+SxJQchFJNZ0d/8r/lkqfLYnKtG2H43tlHKgQkU6bJQ
         vAiq3WpeYU6aeG2AM59ih1oMjWZTt1bR8gU7Fb5ZukcnM/TVBrJamWTaBRwjM7UOHkX2
         l9Rw==
X-Forwarded-Encrypted: i=1; AHgh+Rpd1ckUU/wwYbhs63NNM6jyjw/mej4pUMQhVemM7PSKa3Eu3x7dn69fBAXdMw9jx8xmUnGbspVSUtkG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5psbD82l0oal5p8iKE+lhq3+UZe/scd8gYdP12sZS9qN1Qox2
	0MBy9Kq/6YMAUsHd8sXfWAU5qJlLeD6KGJMFwzVTSEalKN7UstFx0S0CDaVGk6W3e8ydUEGL/4S
	ztS6z0YMyc1Gm16wXlWqCZwoQ3L6tE72bZCZcNP3qKSe002YO52wLsg2jDebFygw=
X-Gm-Gg: AfdE7cmlJZhr7pibE6fyvbivkg1z77uHbAzHuQscoiPEjBnwSAihkl0Ea9qNH3QNhtC
	PhAB7HxO5mga5nBcGKwY1ZW8pIlMhxVApjbppIQ5yJtqL3xUL5a97lv89jcmj+bhzsujUmMnPwS
	fNMNN4Zmc5hLaKwkwL/7458PJ0z2Ldy7ESP/2JXrvnb9jiMTkdw15ldyejI8+haUaTBvbPfTvoA
	Y3b6sDkc1gSBufcvJHqNAwFGIFl8C3XpuuJ6DFJPPQTsOk+oZBpKAj30G9O2xN8Vxlw581ONXo8
	unjsNRTxZrdd3+cyVONRZkIZwn8tX1yykonPVAom8z1t7nz9quDA8Oc/j7+bOCsWprBC4brWHvR
	H9Art7Fnq/sx96d+Lum5w+83uqtVWsIgWRCDhR5RUfkYqCh2niuisq7HnZzxqjfLxOt+EkEllcc
	bJdpXi/2gFypxx
X-Received: by 2002:a05:600c:3f16:b0:492:454c:347c with SMTP id 5b1f17b1804b1-493df066413mr4850915e9.7.1783343381410;
        Mon, 06 Jul 2026 06:09:41 -0700 (PDT)
X-Received: by 2002:a05:600c:3f16:b0:492:454c:347c with SMTP id 5b1f17b1804b1-493df066413mr4850375e9.7.1783343380895;
        Mon, 06 Jul 2026 06:09:40 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25839803f8f.37.2026.07.06.06.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:09:40 -0700 (PDT)
Message-ID: <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
Date: Mon, 6 Jul 2026 15:09:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 maxime.chevallier@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, weishangjuan@eswincomputing.com,
 horms@kernel.org, alex@ghiti.fr, lee@kernel.org, wens@kernel.org,
 lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, netdev@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260630063445.1226-1-lizhi2@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/26 8:34 AM, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Enable the on-board Gigabit Ethernet controller on the
> HiFive Premier P550 development board.
> 
> This patch is included only to provide the DTS context for reviewing the
> binding and driver changes in this series.
> 
> The upstream DTS series will be submitted separately after the binding
> and driver changes are finalized.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>

@Rob, Krzysztof, Conor: I see this patch is not listed in the devicetree
PW, but I think it needs explicit acks from relevant SMEs. Could you
please have a look?

Thanks!

Paolo

