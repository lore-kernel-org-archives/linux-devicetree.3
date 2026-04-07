Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498F430C62D
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587712; cv=none; b=BYOD2w+lOb6CGYpSqV0tZD6YEFm5T31aFnP5uXQVV/kng6OYTq6svQv+FlTm7Ktx5mG3IE6FMOB+Qj7O8HalgHqz00vXO5UhyF1ZaH8fGkyGJDuHVd4k7P0SgkIGtFp04Ue7iDFkir2Gb04gaO/vDHsWZyOyO78DE1yuK5Z3TA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587712; c=relaxed/simple;
	bh=x79Jav08+LwoUKWXg4HsvIeK4Ps7KKBZV548bW8sdk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnU2ovg00wcNFVzOg77AGd2/np/v1agmieZ8McVtukrIZyBSW57R824+JqDJQyjZZQ4CfCgLOOKTnsSGdXhspVFBVi1/4KOuzIeggXU9q/jeuHZ2glxucKJLV8FtUvNsvE/+BIHRH+uIjHlT6QtcQmMPKQVKBpCPCdXUpwkVues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EgGVO7wY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SEw7g8e2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EgGVO7wY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SEw7g8e2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775587710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Pnpb6SDZMkbPbYvs4u7AhPVopmFX/goNUB55645IGM=;
	b=EgGVO7wYQ4jfAJtwmIhMNuwCaH5A7rHqP+unXewPCIMbPN8rzhId8eFPbQ2mTXOsdHg5Il
	SfWoScoeK2esy6R5wZ2StgLibMDT5erRHCNYTAO5SONXsBKKuVmSLWdXnvh2vQ8VCRJtna
	cnIOQ4AWitwWdAbbvAt6iNTtN8AhKv8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-unAzvcXfONyyOOWon_kqCA-1; Tue, 07 Apr 2026 14:48:29 -0400
X-MC-Unique: unAzvcXfONyyOOWon_kqCA-1
X-Mimecast-MFC-AGG-ID: unAzvcXfONyyOOWon_kqCA_1775587708
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8950562d351so77068606d6.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775587708; x=1776192508; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Pnpb6SDZMkbPbYvs4u7AhPVopmFX/goNUB55645IGM=;
        b=SEw7g8e2gwM+HRIFZnsOkyJbf67kDquYs5o2ZQ5TtI72UvLFJ8F8Z3K7arGfBPg/qJ
         F+6zp+/ry0tgdi+o83942aeWa9Ni9lKrUyHXJSSz6soNgO3Y8AfQHfcDjiR5eswDKtew
         uyRKeQv3LlUXnuzTIo6VtJ17shT/ZRF8HAdnxKyvgU9KAfE5rkeYVzy7bboTtSNRSZXr
         fiHe2VqWJ8wXV8U1W+6PAGbdNXX/TjUl3pl8CRGiV62XE4dcbtEX6cu5ubkb2fsjd9SB
         wN/hFOX4FFfRjZx0a/PH6kL5OqaPhxRlcd++aciqt70vPPKWHWtdAr+J1W+vMIoW+U14
         Xxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775587708; x=1776192508;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Pnpb6SDZMkbPbYvs4u7AhPVopmFX/goNUB55645IGM=;
        b=VjlMuiNL4GhSSzdOBHU4mblyfT2X9y6uKRCJ6QAqDmyQkrHKhIc87XRpvNGcXwtl/G
         z/vL7AQ71d57b+uylnSKCp8kQJFUppg/Gni+96bRD45KMPRcjMcAeBnLWPLSN4LfubR4
         kiKsGvKvQXkDjigjhe8nl5jUYv+F54fysfio67zM9UEoh5eBaJ4gUal6/6tvizeK0bjq
         Z4uQh7ZUk3dBNLV9Mmpe7C9PD2nYCk9ne97o/qEntg6uqulBc8UtKANfZI5e6KRr1Ztw
         182wIFGKx1PGBGw7j8IXlbi0JEis3ocpd1RToc7IX0Ql5MeH6jV9RajPmhxW609wKMLt
         HI/A==
X-Forwarded-Encrypted: i=1; AJvYcCWlbDQBrjUUa5SK/XAVa9flL4U7mx7VCXJ2sa4tlT143LGlLNyOgcJRz+6tyQjIjGE5UdRBksx0ir3W@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iZyXOiwleBvgd3QYxqL2NrKBllXBzkxj0QG7Ja7Zq0CVYI6v
	pRblS8QpW3APYDNGCukt1421y8NIN3UTfOF4mb9Ik51rSmPdgr4dyIfzGLswZFlIcjkk7WQDiUj
	RIpwdBZRnpdrZ0+cq/BFeemZSPhFXVkCpKY07ap1hnb6WrWAYMeEf7gz2xm3bJyuZLXqYqN0=
X-Gm-Gg: AeBDietnC3LVxSoHiY6zxazKTcyAQYdCbEbDsObQQ7oUXaT7BhFDK/WeO2Awq+c6Ot3
	cK8qFnOz3ZbhxZw5nskCd3DK2QBsx+98jdVkCG1KtPPePKiLmY2dhv57ucFz8bG3KRkge4qJzAr
	q0lvMHjl0pHf4DOwuCkNtfb5cUZKuMty6dqle3SXhMUqlzq6Z+HHAYhfyNCBpmY5bDwKEZhhHAt
	Z+IhjnHrHGFs/vZ1aWlKaUYnvcDu2A4e2tvKAd6guJPv63ntyhp1vjrbS1FU6f5H1tpTdLXbLjA
	CJpScf0TGYK2sUyhSi591v+p5jR1tI+rbc8mvDjsdua/hLh88AePuUZt0iNMFdnDeAU4CuL9rpl
	oQ02Xuj9PORGZOue+Hr/4AB2ixQzN/CT4/bSCNsSBxEfauz/I09AlTyj2
X-Received: by 2002:a05:6214:8097:b0:8a0:d5be:2407 with SMTP id 6a1803df08f44-8a7026ae50emr265416236d6.14.1775587708546;
        Tue, 07 Apr 2026 11:48:28 -0700 (PDT)
X-Received: by 2002:a05:6214:8097:b0:8a0:d5be:2407 with SMTP id 6a1803df08f44-8a7026ae50emr265415856d6.14.1775587708110;
        Tue, 07 Apr 2026 11:48:28 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974ddccdsm155250326d6.41.2026.04.07.11.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 11:48:27 -0700 (PDT)
Date: Tue, 7 Apr 2026 14:48:25 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] clk: fsl-sai: Sort the headers
Message-ID: <adVReVTsoUwAUxd3@redhat.com>
References: <20260406215150.176599-1-marex@nabladev.com>
 <20260406215150.176599-4-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406215150.176599-4-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Mon, Apr 06, 2026 at 11:49:44PM +0200, Marek Vasut wrote:
> Sort the headers. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

