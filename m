Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDE13914FC
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263234; cv=none; b=bFtsS9LITcRGKu58cVWvPFpGbT4Y6X9KAqTae0j/7911HkpcecMlCjfikPN9ayhHIgIBPqhx0gOmZnl2PO+mkhUtFfK8v0wTjitV2KFiiCVWymDE2w3+ee/Sdl35QZibeuVOJ0m3/T6Ka/6ddET0R6d7mvQCV8s3IRX9Q5za9PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263234; c=relaxed/simple;
	bh=w5gAVks6i4eCJL/XLHWcDKk0c+PivOriZ11Uu861GzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaQB89Rx0RyoKErDMbSpgqFHvYse1bKVjDdZdscOPyxIrcbr7GZoJc651t78ms21D1vuP7K0TpBFHIZACwMyoqSV2bh+Rcqh1VXIuYBbpdxi4EcyeceNHRBidMUrmnB+2FWv+krfZ9dLmrLJIHHfnYi9yiTN8VK8U9PjaMIx1jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R5YmMkQr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=l9hM7TMK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R5YmMkQr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="l9hM7TMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774263232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yx4+4+l1arorWkWKWlQ/lP/rEQyJg55LIMd4QQKC0Oc=;
	b=R5YmMkQrAtVvSoR7ggefYX0jqpGAU5NXNhJn04B4eE9tbRhEXFnwZhhX3DFkzp07do7+V6
	bxcuXMW9KB+XoKqyrP7Km1EKS4W0gseRU8APzI45LyOjPranzFoioPYlk+KShIHpjiuGyR
	6/5XoP902P2zxBGVxPw9N2UtJHrHoOQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-Jd-fUyVePDuvz1tQQo1V-g-1; Mon, 23 Mar 2026 06:53:48 -0400
X-MC-Unique: Jd-fUyVePDuvz1tQQo1V-g-1
X-Mimecast-MFC-AGG-ID: Jd-fUyVePDuvz1tQQo1V-g_1774263228
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c4ec516e5so106625956d6.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774263228; x=1774868028; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yx4+4+l1arorWkWKWlQ/lP/rEQyJg55LIMd4QQKC0Oc=;
        b=l9hM7TMK8EYwd2M/K85sY5UDbIbqSUa+RyvyPo7+rVgJxyIAmoK7BWekhtu9vCEr33
         SJYl19IWRt+CS1r1G8O1PxPDXAIe9nozmsXmxkzaX62ciYA+qJefdqWhMsiZafKpzauR
         /Gt44p8KZEiwA07N5kQB+KJRYQ5DnXkie8bNQg16lUeq9umk+3CYlBgruqNXZQmg/7sL
         b/TUKzUrEkypnLqA56BBIp5BzkSrrCIpn4wdL+ZVAYcc8N+IyqsvD8N2kfEO8xl8EY7d
         4dzDN5tY+VJp4jNRuKeLQNY76Kb/0EDav6GQP+Z/3ShiJf40yMfhpPu5N+EQWQQWw7+Q
         6Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263228; x=1774868028;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yx4+4+l1arorWkWKWlQ/lP/rEQyJg55LIMd4QQKC0Oc=;
        b=kS40Gd3LfQzGtiBqABQJdaJH4RAAOj58futs8iyH8smIr6CpJmRghVhcWiGJdtaP8Y
         KUMKBXglUIuKPT3OkjWMiVUHsIblRQBA9F+50paOFT/eBt7GF+yau0j8gVKMSDqK1m+f
         AJsclLoqBqWwPMvoUcEnFH3Avmu/cU5uBvCAYY6r2x52C6JgYC0Pj+SRjAplC95Qdy+v
         poyU0bvLVxFaEQ40IAGmViA/S18BWY2somvNVYRf1AsATid+60TscNJn0TA3d/Hh1mGd
         AnKnxvcD5Ta0ROjPRYUA5eqCIQDhINQ8dv4wtFGd4joI+VQDRYtHSM8JqpueZyk+IgmY
         SVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfWINtZmjS8IOhiMk2TdZFg53NKm7cofA1GiyyjPJXqwa65tv3P47COOqN4T7Uu++wSyBqhPeBxVpr@vger.kernel.org
X-Gm-Message-State: AOJu0YyGAbeghcjPLPQL8eg0XgG6i+789RdiKYYmKQXVl/D0Q/Wv6Mb1
	O240wvhPOxMREwR8g7UZG2X47Ge2RIh3NPeSoz+q33r0VT3ZMpOLb8gIHdbrM1Nb6RiTFwTTl36
	RqdeFGQBru31XYjOj3sw6s8QTgHdDozPUuDwYpQayHhRBKWaIhmqFoqn7uySmxiVJFQMaWFc=
X-Gm-Gg: ATEYQzxNKRMCo6rAfQLOYOuXaercba1t2OdUbSNM6TsdaJdh4dtjCsdV68lOCTf9ZTt
	Kg2stlTJ+V7bN5hp4apFFEoGwqaXoQKhfk+SljyxBmVPxqxMxKgXNZbvCrEsN54OwFIKxKZYovB
	y+aWgvvjYVfijcm1HIOuciuQHAX6oS+G9w9z8wNW6xqOQ9n03zgs6Rmste/Risqm8/jls1HXobt
	c/WIs+F3p313OE0tqShIEWivvo/ndJkYz7yNpBt4MYdsNMfvT2cUPGOHPcEWF5ip+cgB/cV0U14
	SXO2cYCE8UzW6vN/heUCwqW82KMW9+lyOWDaM9jqBKGLVGuVkTlxqaNcsIuZA5mFVA55AtQRoLb
	hQpHw4IghY3/p0iVENFLgSqHidpsBBBDnAbLxP+MnHYfLuciKtneiIPVV
X-Received: by 2002:a05:6214:601b:b0:89c:5f6e:451f with SMTP id 6a1803df08f44-89c85a0fd6fmr173905656d6.26.1774263228106;
        Mon, 23 Mar 2026 03:53:48 -0700 (PDT)
X-Received: by 2002:a05:6214:601b:b0:89c:5f6e:451f with SMTP id 6a1803df08f44-89c85a0fd6fmr173905356d6.26.1774263227651;
        Mon, 23 Mar 2026 03:53:47 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8533573asm85089416d6.24.2026.03.23.03.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:53:46 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:53:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] interconnect: qcom: define OCMEM bus resource
Message-ID: <acEbuBCsF-fxnNpB@redhat.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-5-7892b8d5f2ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-msm8974-icc-v1-5-7892b8d5f2ea@oss.qualcomm.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Mon, Mar 23, 2026 at 03:17:21AM +0200, Dmitry Baryshkov wrote:
> Some of the platforms (MSM8974, MSM8x26) require voting on the OCMEM
> clock. Add new resource for that clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

