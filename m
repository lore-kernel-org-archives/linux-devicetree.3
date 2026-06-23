Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F477388879
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782234099; cv=none; b=K68/spRa7Pm7NG+YHsynaZDyXXc+m2QHPXD5uJIzC+dc8pbR0J4UDdkd114V4ydsSVzhIXVZHoa6d2fpue7o7/+cCiMmQ4hg1cvYhHXh/VlQs/GINbquQjDVD5kFqH/+/BlwFLh1oJ35XDNQ13BmY8D+1CLkAG/K4EA7t7vqMjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782234099; c=relaxed/simple;
	bh=KLp47J3F3ZEmgySRH6ZoydWxIZaG/J2hxWrFEP1eRUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coxaqVylcbhprsbp01k0o1qHhRHF5TigAVcWdqChLXAV5FI0BDTLE1rFMMciY6wPSBYSMg/TgKTwML5TOofEQmD1rNCN/MBJlJonHIdsOKeiMMmifQrfCFzDeGmzg+6NMhswhEYrYoMgMC7MdSq6VG5nM4PHi3AdkBH1C375yDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g7qngg+r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hOnhKRvC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g7qngg+r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hOnhKRvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782234097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHLmvt/hfcPMjp8rNAR4Lzj4cVVJybJjQGa6DTmnt7A=;
	b=g7qngg+r6M/rLSfwXT61BNvp/FblDzB2ZQXgQ5zGJ3Dkp7VGWih1OBzRUwkcmPM+FB/o+n
	NiXiKMCUovkKpDxmSIMJJDlA3l42n4N3AJwloh7FXwPnhal7QxUvDo8uyjXswmZLg0vvrC
	eO5qC9Ehbo2jjAkOz+yFd51t1LaFmrc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-0B1tf8QDMH6bn4nVx2BcsA-1; Tue, 23 Jun 2026 13:01:36 -0400
X-MC-Unique: 0B1tf8QDMH6bn4nVx2BcsA-1
X-Mimecast-MFC-AGG-ID: 0B1tf8QDMH6bn4nVx2BcsA_1782234095
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dd2138633cso1953436d6.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782234095; x=1782838895; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHLmvt/hfcPMjp8rNAR4Lzj4cVVJybJjQGa6DTmnt7A=;
        b=hOnhKRvCr7kk7O2JbBoTiGfFNISTeEX5+riyFb7SvTnzwj3cVcUqNRyvflrubpSwmO
         LDNOjCIzz+1Y78mGQlHcymEwhFnU1rsGMfwT7xIm7fq87cp7MPKTwHywB7Ij+EeNRZIa
         dq+0GDaEMk2/X0mJwnBGYZoN+j+Dd7ZxSeN9oNLuNDvPIKSLrlZ0LB1GrZU3yPDQzzG8
         lfg9vu3YOTta25yNDZ27JnE6Guq1wRXJ/P1dLm8Y7p9lP9qhAsI4ztgfTGPn3fhFMm0t
         IUyhjI+vqqLWT2/KpIf8roSA/rIm4KM/ZqX+MjBUneE41hYojvXCIDMJP+zAuKNU5MjT
         PISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782234095; x=1782838895;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZHLmvt/hfcPMjp8rNAR4Lzj4cVVJybJjQGa6DTmnt7A=;
        b=b1c4fQufwT5ctAk3GyZ7DRleLHW/v9F9gui7mX7i2qE+XN2gcKFslUe3jcBMNfIi3i
         /oVvPzP1ZHuOLEfqJlVw4bK430AzBmXBXChanv8kfqVct1gVeg+TQzyaJnWP3hrd15Yc
         1F5xQrA7FNN+mdXa85NNLEvJAlH5gltDp4r8PyrnF/N2yrq9Hfz6Qh+QsdabYU7ePca9
         P2y1r0j3lNejh4BcTlFYj9c+1CnGuHRA80zmQsNJAr0pliWPQU57+tIdYyMGjNa+cfRI
         3PYv2B77I4zqjB2fVht7Xfds2Bvio92TZyxOzXWGPj/aiKjBVQWjXU+tADssKSFSSo+R
         36xQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLhSbn5udhKZNPdxftvnH7FgiWIoS67oaAxQjPyPL7Xw15fMwxZ2WcT1QlXqp9vNQHW+c7KkluKh1d@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy9bVTP/EtW1Lc5W9d83ulFyA/HPm2+6P8g/9/1wSdYTcmEHoF
	3eXkvX6H0sFvnWHx7JCt2WAZftr7ZaJ96rf9vkB0IxrMVjQyyDl9Hom4ckTtKoSsOx4A2LADQ5D
	xMxRENLPto4nvXWReUEvYdfbB4yVByNixfwSetqdpeJcAvnuM6xlOfULIYMgsVt8=
X-Gm-Gg: AfdE7cmTthpJo/K3tI0iiUsz9V6VYtIz85IFvPdsMwNK8tWWQbXcgIpXpNxqhFmJYR8
	ps8rhNZqT42k9XiIUCGkgG2EHZcIxjtHbWF4jY9H01OweQzj7Horr1GDOPWpjZLceEyaPz6ohdm
	GMiQSF710b6Lf8IegJmASqf3GLrrUg4htcBU3/DsfchAVoNeKRolnV9/5oDVFfbOHi5e+cqcU36
	jKlwLG2PWA8sTKnh4k3fCCAfP+Cdr4zv6tVNjZxxyPkVMmYWGbzWZYK+mq/KeUf7DTMF9x7O/KT
	8/9fQ/0HemiWCjLW8q8+fCXn/8GxCiYljfPW+g/bQafgxD9ZTAzwXVQgHGJkR0m5tgnHg5hT4ab
	GNRBaq5bYvR+qHe753bZM76aGRREXldpfGKhoQ+BS5+kjuA==
X-Received: by 2002:ad4:5c6c:0:b0:8de:7e5c:b57f with SMTP id 6a1803df08f44-8de7e5cb63emr362656316d6.4.1782234060165;
        Tue, 23 Jun 2026 10:01:00 -0700 (PDT)
X-Received: by 2002:ad4:5c6c:0:b0:8de:7e5c:b57f with SMTP id 6a1803df08f44-8de7e5cb63emr362605556d6.4.1782234033037;
        Tue, 23 Jun 2026 10:00:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f01855bsm146771086d6.9.2026.06.23.10.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:00:32 -0700 (PDT)
Date: Tue, 23 Jun 2026 13:00:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Message-ID: <ajq7pziuKDFZqj40@redhat.com>
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Jun 23, 2026 at 05:20:37PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Alex's email is bouncing. Update the maintainers list with my contact
> details to take over the schema maintenance.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Ref [1]
> [1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/

Reviewed-by: Brian Masney <bmasney@redhat.com>

Thanks for submitting this quickly.

Brian

