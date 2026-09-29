Received: from mail-ej2-f16.google.com (mail-ej2-f16.google.com [74.125.228.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C482459E1
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689130; cv=none; b=l1Qd/QoZ+i/lgeM5HgF2xlCecOtRRiezNP5CJJPbgSn09qHQezvS2qASFY9BRr5ZQMXNgESr00xnKlj8IkuOIYehKFM1LmOGk7fbeOnhAeTFuS4lIdQxWB1tV9T8NC+MJOvi+uTE03UMr/ObJDkWjJubV84vP1BEtluii0XAeWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689130; c=relaxed/simple;
	bh=JIiCjYom2uefj08ZzhPJxrCGUg8WLQNHRokiNENLBt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbZ+w/CdktiHzNrKPeodjKQNPAbudlxm+/D/vcIryBWTmd6opV5boBbedlUrr7EjmiISWU7a+f/lhC9oyDnw3yUc0Gezf0DYWDIcZhfriniwYBuUJcB3Hvyuo7m3YPO2TzmmBF52r2ilmp8vmajEJohsCA8lMNYD2VB+CTJ9CTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=h++Kc8Z9; arc=none smtp.client-ip=74.125.228.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="h++Kc8Z9"
Received: by mail-ej2-f16.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so454506566b.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790689127; x=1791293927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VKEdloBXg0GteUPySA69WxM1r/24FRYU1/WWsji16GE=;
        b=h++Kc8Z9D96BFiGGK6WpXvXyYE26gaqmrV8cBAtgMsD9Yjq28ufVddK9mAUQHL67+w
         J4W1Ka+MMLUHwHjjb3WdnelQ+azEt7qNimTGS4X6Qixx2q96iqu7VexduSX83dLs1gu2
         famg+IKQOrY/mgEoObJ6M0ys6tD1aroWWg/5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689127; x=1791293927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKEdloBXg0GteUPySA69WxM1r/24FRYU1/WWsji16GE=;
        b=OD0l/Vu6W8jtl8B1nAXR1MUKkeLaQrnH2To71IR6dItEi0mjGA1hLo45idRSRMX7Nl
         OS/EiKRwlUzk9klIUfYOZppgivJH4Z6Gjnqg+i7xxe9vF/MJWieAyXUHQ/8WZ4211e/G
         m1HMkgYKzbCF/pKvG8ho+I9C1d+6uj55l0cjp4gEv58XkE10J+eOe2t87cwB6PCBIgRM
         4dnnCv1d3EUabOnCNaj5QamTi47W0RzfCJOzMkvQnDkl5jtydIEeSgJKlNY01lS7H0Ad
         5RDu6hrNQqofkBVtoO6HXCjj/AizJLOe4Ma4W0r5xpNV/E7fo5SlmV92039aYJs1LWiQ
         y+hQ==
X-Forwarded-Encrypted: i=1; AKwUvByHdvHYWd2y3d0Hkuw7Y0UxiZesBb3P1mE/hzirVryQVD1imgGtqO10ll9uJFV8PUt9Cbd8i73bWtBS@vger.kernel.org
X-Gm-Message-State: AFuF++lD18JACt//CWM6Z+FFdbmTFRWHgBqMNGHWYntuj6gqt8jP33Ga
	e+K8XfRuNKEpW/I5yPdr8ZxmI9XwvF1xpPb7rF/TlHTL2P/v6uTZCR5mphC4IJAFVcY=
X-Gm-Gg: AYBFou3SQ7QODCuueFHYE8XjVK2e3RJcNb3F9Q8p6srU0NLWqUJs84gt4t3GT3KInNJ
	YJGF8VZnpckneib0tKm4LoqTgzsORCcFNZ1+gD/62+3tNsAa+UChS9Qbn7HH/15JB3rl4VzH1dJ
	IMzV7ucIwwcziWl8DOwi800HytuCxzF6pxgtkEXvUFV3dUFrxJGS0CG7IbiXVUmZS50XUfnQlEa
	KbwRUrOjvQPhFVeYBZte2znQLl6cdY02reNkIR2YuqEIUO7YnX3HiYekX4UzDJZW/AmzEbXs47O
	d1l+5RQQuthU93MFXBkYEEHjrimR2JkCIBhVX1hSNXPYsamgPfkeLgePnsRhxyRqS+IUVu7gD1C
	OCXN5SjorYFFoFsodSJ6UnXQ8vpe7LMRUfapPtozKWWIh2rz//RQ85I4WyHnDz2EKDbWTB5opqN
	adScncj+k7/aX01u9/5s8mUsD4w2V+LSHLjGgvzS1HC/h9TnJEb79dDSFwSJciMXG4njmUw1gto
	kz8Lre7U4Xh8h/gri0gsCJfZTn+uGSMkpA=
X-Received: by 2002:a17:907:e107:b0:c2d:d702:364f with SMTP id a640c23a62f3a-c2dd7027971mr376425666b.3.1790689126737;
        Tue, 29 Sep 2026 06:38:46 -0700 (PDT)
Received: from carbon.k.g (90-154-213-116.ip.btc-net.bg. [90.154.213.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2b0f2f4f53sm531974466b.47.2026.09.29.06.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:38:46 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:38:44 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v7 3/3] arm: dts: altera: add Draeger M48 CPU Module
Message-ID: <20260929133844.GF10296@carbon.k.g>
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
 <20260921090735.3174292-4-petko.manolov@konsulko.com>
 <ff085338-6310-42ac-8023-bdf6d48ad103@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff085338-6310-42ac-8023-bdf6d48ad103@kernel.org>

On 26-09-28 09:18:03, Dinh Nguyen wrote:
> 
> According to all my documentations, the Cyclone5 SoCFPGA has 3 GPIO ports, and
> those are already mapped in the DTSI. The address space that you have
> specified here is for FPGA bridge. Which leads me to believe that this GPIO is
> in the FPGA.

You are correct.  These bindigs are some sort of leftover and Draeger folks
confirmed that they should be removed.

Sending out new patch series...


		Petko
