Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E37440A2D
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908871; cv=none; b=FU9cqltFiFV27zNU9aOpgpug8nQofV9gOe9gQ2r/0YIP1NlEEZnUY8ubd/3y2XzzwXyeHA4DAtv741vqTiK4aNH4WsSkfso8Jy97ocedc7ebqvHYCoByQH8/fU3hr7WLdQmy08NrBiwZSGKuTHFt+ZpOBRtjaiUP+HRvNlMQ9FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908871; c=relaxed/simple;
	bh=Fn1LSFnvcQPwl+OpOHERR5ed7+JefDQcZI+Vfb0q8B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz0i6Sq2hBuQFBDR3WGRECADW+i2hxftXfpVZrr3bFP10OaKY4BifcKaWxmL63KH1Uo5b+a+ym4uNaRgA3bbGqazb5vcQmpaewqcPIpxYsUYqjyzkW1GzNz5zDziDO1fvPKl8Oa2JarcDqS+RcDR0zQrScz+95H/z5MNfsE7E6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lb8M6sfn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hlEu+pdZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lb8M6sfn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hlEu+pdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784908869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+bkEHSp7uhvmCp1vkWRoofsHVhKJ4GQ+rCHfCWSCHbk=;
	b=Lb8M6sfnShlXEq2LLahwEJSEfYlLQ+BMcSKIr108PpQsuAxa2p2o8gLC6VhM/Zg80FZy3W
	IfSEriTnrDs03+4AayUnsUIlY3XkC1dDXVKAtvbxoHXds7xf53gRMVRov1ki5xD4qr0aai
	HgkvXywpaZn2wHHNWmnozfgfPcrer+Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-c9mu5ie4MxGGWdJ22txuCA-1; Fri, 24 Jul 2026 12:01:08 -0400
X-MC-Unique: c9mu5ie4MxGGWdJ22txuCA-1
X-Mimecast-MFC-AGG-ID: c9mu5ie4MxGGWdJ22txuCA_1784908867
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6ed4fe99so122375985a.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784908867; x=1785513667; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+bkEHSp7uhvmCp1vkWRoofsHVhKJ4GQ+rCHfCWSCHbk=;
        b=hlEu+pdZ71+vAy50pQIwy7Lf9whVopXa+O/Kv2J8qWag8WnYyn6NFF0OcWJis/UeZg
         0PqybQpu0CVIy6iqRdrUiVzW0XPyQD7GtzpQvWNOzyBOX2sVsvU6GKVZrXgqyEBRJdLo
         ltP/TkvhFhJWvf3N6RvwsTuroJH7JtFvugKptHGQj9z1xry0Phl/3sivMIewHM/3ghly
         S/UlN+aDEPSkMqby8AoNfvZTg9xwiI/XMwWXbkqW73k5kOomMfspLawzJ1GqDLXsou23
         vBrcLjFZTX9Fpq7hxh2f5EzvLFQmOZO78r9JLti6KuPnJZIZOddvaX6XRiIoXMpp3SMZ
         NAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908867; x=1785513667;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bkEHSp7uhvmCp1vkWRoofsHVhKJ4GQ+rCHfCWSCHbk=;
        b=gR3Gysolscywe6sjoCzlGNzJ16OzZ1sSFPkB34GMxpGDorX5V6T7xLCDEVQZctJMhD
         nVEyPT2RmLMs6W1lcB5vc3tgm2QAqq3O3ZfnQ9deNjT0oMc06ZoNaPGLgnRviCRykLwl
         yY3CR62Bjmn76cCyxo8t980Zqbz8FYTMywSP/Fxz3LvQPH0dYqPbY3LcuTMmskAXmE6C
         TbhkXCQH9O20aNCi0tF3JFKjRUNuehWZmeueBCcv1y41uWf0C5aqQ6Cqi+si44pfeKNM
         pMZ1wi0s78sXTVYUpSwgY5W+gBhYgcfhJABsLHJJyhJ8kRKMZT1PIHemLsaQwDiOU8tR
         yonA==
X-Forwarded-Encrypted: i=1; AHgh+RoXBxiNcpvddxN2v7mQfrOAAfFzH7zimjq/l90uyfc+RkGRPJqNKJhZ7On3jUJnbsC7gHvVZX86nNrw@vger.kernel.org
X-Gm-Message-State: AOJu0YymKpZpNR9qnxniiwozWOMrbHRxWGFC+/bAr7X7U9Tzr8XIon7a
	etCkY+qijkHK30wR6SzG1/F3H3zmRKe8tD83tKbPbicz2ntELOD9aeGVgfF/7vWZBgVBw42882R
	qiz+yaITjhtfguQjcg1P9M4PByjVDB2m/0Sg7BqYt7VSgQ9EskXAXPHwclAIFJIXgiepWmY8=
X-Gm-Gg: AR+sD10U8Cc3ZOqsK/iPEh/jrzaxEvJj7TN8Etl/IbQgz6P1E56/0kXmCx8hux+iENv
	2pNs8GUHY0j9vVJ0l+i2vj39CNu3wmXc7sXpKhHsowZAk0P/Lwp8PHhMTzFVldJ1oM0ZyHX65Pb
	jU0SrzuwGZlY1zB+T+s6GQWxmOt9TAUDZU1Do4wkAb9AEynjhBPz1ekKibpd0GY1iaowVb6X4rm
	mMJ/t6zi4ZphXg7vFPVWSCQQvSzbklKaQxax7ApeGay+BA5IzGuYhGGrGf+wSpLVZGbBleKnrcM
	HSoq2Bg724tL/JzFPTZdgvaa1kzjOrO2hOC0wmkbhFilcWOBSyH+0fwtAgrD2GKWeqjv4F4FJkX
	4vLlQdf8VepxZPbkLZoDlQhdaoch/tQP2ZhM=
X-Received: by 2002:a05:620a:4706:b0:92e:7c0e:5912 with SMTP id af79cd13be357-93103aee644mr937771785a.56.1784908867052;
        Fri, 24 Jul 2026 09:01:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4706:b0:92e:7c0e:5912 with SMTP id af79cd13be357-93103aee644mr937759585a.56.1784908866130;
        Fri, 24 Jul 2026 09:01:06 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a0371asm684521085a.27.2026.07.24.09.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:01:04 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:01:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
Subject: Re: [PATCH 08/12] clk: composite: Export
 devm_clk_hw_register_composite_pdata
Message-ID: <amOMPmn1fBE1gGoe@redhat.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 24, 2026 at 08:00:30AM -0700, Luo Jie wrote:
> devm_clk_hw_register_composite_pdata() is defined but not exported,
> preventing its use from loadable modules. Add EXPORT_SYMBOL_GPL() so
> that out-of-tree and built-as-module clock drivers can call it.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

FYI there's a separate series for the UltraRISC DP1000 SoC to export
this same symbol. It depends on which series Stephen merges first gets
in.

https://lore.kernel.org/linux-clk/20260720-ultrarisc-clock-v4-1-fe639d63bbac@ultrarisc.com/

