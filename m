Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6C43546E5
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781266175; cv=none; b=VcNXCJOazSA55qHgrP9BhyJb1flYUkKrpuP4cZpEqiqdHnZNnK2NT5dK2/3fVhzoLd/Kw3ZYTuQ5RuIc5bgOWKx9Ibb9J0k02R6PzQ4sls2GahfUaMs1Q6CaokFNDhBm66aKi1dH8UKeRzfRgYbCwVDE8bSUYwuuH3TGQB8exHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781266175; c=relaxed/simple;
	bh=bop1Jx7gdEQ8Zyrw6ZT6L7KGQrSEgKobAYE1La7kKg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKN0wIup7mcnA6wsrG6ofWVV95A+xSAMp1oZnL2d97WeT57OmIAaodc82xFcLQsUpHMb3qSd0LJK0aVZkzYsCO0NDc6BMtqAUVu9JgdA4HwNUmquDQIBhFKT1umMbQbCPGpV2djmnx584YqPpTR0bdAzYPE+oWR65os2dVvf8ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMw9hRfm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMw9hRfm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso93505e9.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 05:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781266172; x=1781870972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KfGyX/QinnMuisy5V/TZ4GlcvW6yAzZU5ot0B9/Qp+M=;
        b=mMw9hRfmc2OGMe6PZQ/6FjZfeKjQtwAdT4iNo/kbJq0bj53I+yffPeiI50r8jB2aGK
         9ucX/ETIF8qzSTIl8F2g5uXUwW9WEw2/roXLujEtQgrgB3AuxmUqtBq69pKE2fls/ht6
         79pqnr55pGZjl+bwMxb7EJTKJ1Kemm7Ita/7/szhP2UmFauF/nR0HDD9DFBYkCwIiKNG
         G+oS5W57pcwexg7LcG2dDrU7zqnrbeQkCKPqDXguMEjFetEoEkAcKG0L4Ik+RqCCbCs5
         qkkRpQrDh97evsYscnA5is7EwJkcPylVM0fvbUWB/raTh9QgdjusV6BOx1x9GB9j/LVa
         5EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781266172; x=1781870972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfGyX/QinnMuisy5V/TZ4GlcvW6yAzZU5ot0B9/Qp+M=;
        b=leEQ4kdoM2iW2VgFLo4TM8zWIPEROgw8q8CLL0iwP/43Fl87edhJL/gw72M6kRpKN2
         IwveD17VvK4bxaU1Eegfk+Log6DEYTP+s/sX3ytM4sI1i87zRKGfSAdGmt8pwsp5K8+J
         eqoTai6MwGH2qB9zcAMeWDfvnQOiwLVCKTIhgVug2qws9b7bELNUxd9Sf4nrAlaHPcUu
         zbwrYAg15frAQFNuZRpTfa/JJ1g5GwTy2JpLOZf2sOBuJ7KLDBToo9QVl1JW5r32dkqX
         8nAl69kD+7A5MO5bI/0YW7eqjjS8ZkOk8xwpAKq2RDiX5luIkgBxzeYwzSca+3m8TlOF
         Vq1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/rFExsssLbvzEox2nlfgVN3uYP0St20RvXe4vquMPvlCW9IzDkqjuWlMH29HPAPA9ofXsqHFy/7CAU@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ1RpeHrg5fa1i2hpHCUopKnT4lROda5BYVf+S9Qlqyg2zEvuL
	Z5J8BjtJw2s+rMERaJt8wCb9YX35rOqkV8EprrC6W+Dn9It98APObn9g
X-Gm-Gg: Acq92OG0TEOMv8QOv6H7ng7MNIuSKS1tMrN3KZZKFkZqCF7mgzHs4YwGW986C4UObUa
	j7yds336e2xDamlgYNpt5m9/aKw8WEUyDJCNqAIgFV2kGRl9yiTYgf3T9Di/bt9ENot2yp55/xI
	NhdmsZETaQmiOmmdAMFyRM4HFYvD82TmR2HOq0tq4E50q4LcpTVDrFB16KVW64O+XhBWAp6mUyM
	BfrG0efBAQU4iK6XpCUxN9JXtBLlCrPsnz+3Wajeaj3gLMdKWgTnjPHuVDGfDfatxliyqWEJTe2
	qqUp8SOOVuke2hlJklmZNb8ANkXgazC4M7fo+pvDUpDgl5L9wLlT6nI7mp0+AAnXLAvZ7+Xu1Zm
	cyxQtkUgI1gCVYXSd8vG8F/VfI9An27dobPiF81QOcA3yZFfSwFtnZlDn5m8FxRs5fblxbfdXZc
	EkHpimmPaIzKCUzpQsiqPYcKhP8292y7ANLKoCMX4+dTdeN+HvUEzutNZI8KDT1NRPJWlV2rhUx
	rUMBUN8VjRZqXsTs2o=
X-Received: by 2002:a05:600c:3145:b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-490ec480f88mr26461605e9.2.1781266172176;
        Fri, 12 Jun 2026 05:09:32 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea94f5b0sm42232815e9.1.2026.06.12.05.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:09:31 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <76b41187-15b6-4ebb-ace7-186a8619b67e@gmail.com>
Date: Fri, 12 Jun 2026 13:09:30 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 7/9] i3c: hub: Add support for the I3C interface in
 the I3C hub
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
 Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
References: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
 <20260612111816.3688240-8-lakshay.piplani@nxp.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260612111816.3688240-8-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/26 12:18, Lakshay Piplani wrote:
>  if I3C
>  source "drivers/i3c/master/Kconfig"
> +
> +config I3C_HUB
> +	tristate "I3C Hub Support"
> +	depends on I3C
> +	help
> +	  Enable support for the I3C interface in hub devices.
> +
> +	  This option adds virtual I3C bus support for hubs by creating
> +	  virtual master controllers for downstream ports and forwarding
> +	  bus operations through the hub device. It also provides an
> +	  interface used by hub drivers to enable or disable downstream
> +	  ports during bus transactions.
> +
> +	  Say Y here if your platform includes an I3C hub device
> +
>  endif # I3C
Hi Lakshay,

The 'depends on I3C' here is unnecessary because that's what the
'if I3C..endif' is already doing.

- Julian Braha
