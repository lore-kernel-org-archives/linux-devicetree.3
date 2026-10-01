Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFC34EE87C
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850462; cv=none; b=WsttR3eJL1KF02O4PGE8DLAeO9MvRZzr3piEK1Niqmbh4yYT5O8Fx+9hclGM2B3t6WJdd5jJBM1Hi429mVbN4XPEMF2TtbtKzKv6QgCuqRLrsEhWSMVv/qUtgMfgYhZfSo4zkJUYM1UwFtR62hEzrM7BpXhIpAmZJIMxbWnZSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850462; c=relaxed/simple;
	bh=2y4gEjNzgA3MrPbQRg5Ifw5WWUUepc12pSJtVJWCuNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MD1Unm8GrnXwkJ6iHV0W6dE8lkKZ+LGP8WvUZR5xNHD+Vsawd9wJBQ9igqDfW+QHt1gksfahAFJJGCSCMKGsC3wOXBlGXZXvgn+1ibEa7XywN55yEhzwjF4pOf8S3d/fcqjMrx+9MBxPe/McixdB25diA5mW1X4uP8T2l9ZSQKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Js8hr/gx; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Js8hr/gx"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25400so2634250b3a.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790850460; x=1791455260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zOoZbBrkeSpdFA8vWrJINhow0mO467LA30uvn4Xle+I=;
        b=Js8hr/gxkm08MeaRvuDgNr+iPda5i6qBPBSUP4g0y9i+FDF8Z4TalxCSF+ZgmaLVo0
         mCOqmMVQS4iQ5wfblzULoMqXCcV6ZJzCQ+w3+v1UOngMbAcD/qhk9emqRnzCBxPKAff7
         qJpaxxjyfXiO9jUjTRt1VRr2vv1ar9O8NF4ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850460; x=1791455260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOoZbBrkeSpdFA8vWrJINhow0mO467LA30uvn4Xle+I=;
        b=K1+JN7iS0g99LCvtfFtUtQXVlZ2NQaWlCBXhwvCYVO9i1Z/UBi5I5V2PqyM3h6yGbC
         2yn4wYikJnDa1ieR4JXesimgeOzBqeK5Mfm2qkPmUtW9xhRKFpVdcC40Y8ONaY0XZWoj
         Iw9k9ZAB+Cg7qPXVba0OhLpuxKH7zKqUIdcLOMobEF5bwXr+P7CMXK1L1YmKppKGZsdz
         EL8YGcTzX/dLdc/bzJORPPqjC+TOSVlVQH1xVnxQNQ5G6pqjdQz0hajX0Cv4Zoe1QVlQ
         fMDYFttJ82SFcEO3fBdDcxfzlbxMW8DX++xW30/WWQpCbsHyl44geMwLr14QeueKjgGN
         JZ2w==
X-Forwarded-Encrypted: i=1; AKwUvByffUAFWnFW4wzrpJqedvNLEgfZuEz1VrA8eTRXbKb9bQtNaRiw1XKiHggyspJNJRAmnThGFA7GXCAG@vger.kernel.org
X-Gm-Message-State: AFuF++nt+m+6bp9uFIoudtAJmeKtPBypTtZYIyqQazjiJSLz11hBamvZ
	aVWLufIBMqhqWygCQvD6i/qw1uWh+iWjCpFeudOlJ4I3QoVDBpfMfWUQjRz3w0kxRg==
X-Gm-Gg: AYBFou3pOic5SSSoWGpTFoIKyOnhR1Ly7SDp0Rh0Y+qX+SPLEzEkD6dRBH7n40q/TfP
	DvBPBiygoC1caFbvdMCHrdY/694ElbXB2XagTtbA6DtbHC4oF6hm8JOgNTHjXXhRzCx9hf9qpIa
	QgQOFEIZfV2Jexr8qGoMi4mhTz70DJFvKX12dzBBLFXmlvu2hgH1X5Cx2n1FcCzkCZGIupRFyAL
	CoyDVtzBJpQSysDYPurD71oaw2X3qS0sSYGZ2DjntOzmOwBg+PfPQZmq8J9EH8851QdzbZ6KD94
	wGq7sjSMDChq8WhEaUPzliGke3aFraa2dStYXOBDd6x+wyOxnrzWm6zGtubTmNuVAc0JEGSLugw
	5SwTtUuQ/wID71ZtNfofbstYrwqMHvqMSzBX0Fy/PztI/MV3brkNobmlHKa++wPjoERRCwMPJFJ
	x+uss7JHpuWfZQz610RofdcT2JsC8PW/iOYpYAuC//lPO9jg3TmXt8gOEBbirs03VGjdsbOm0kQ
	rRFHJwRgpGfw6BQt8aDB6LObMvDqRGRlHDz28c=
X-Received: by 2002:a05:6a00:b81:b0:874:705d:f64a with SMTP id d2e1a72fcca58-8874bffd4e6mr3058007b3a.44.1790850460353;
        Thu, 01 Oct 2026 03:27:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:d042:b5fa:ebeb:ace6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818719cc8sm861475b3a.16.2026.10.01.03.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:27:39 -0700 (PDT)
Date: Thu, 1 Oct 2026 19:27:34 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <georgi.djakov@oss.qualcomm.com>, andersson@kernel.org, 
	konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, djakov@kernel.org
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
Message-ID: <ar4070oH8lRCJMRw@google.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-dramatic-hasty-pug-68ebfd@quoll>

On (26/10/01 10:51), Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2026 at 07:52:13AM -0700, Georgi Djakov wrote:
> > Add a zcomp backend for the Qualcomm Page Compression Engine (QPaCE) so
> > zram can expose qpace-lz4 as a selectable compression algorithm when the
> > QPaCE driver is available.
> > 
> > Compress and decompress operations are handled via the QPaCE urgent
> > synchronous path: each request DMA-maps the source and destination
> > buffers, issues a blocking hardware command, and returns the result size.
> > 
> > Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
> > ---
> >  drivers/block/zram/Kconfig         |  11 +++
> >  drivers/block/zram/Makefile        |   1 +
> >  drivers/block/zram/backend_qpace.c | 134 +++++++++++++++++++++++++++++
> 
> So entire qpace should go here, no? Why did you create this entire layer
> of indirection, singleton management under drivers/soc?

qpace seems to be standalone/independent arch/soc specific, and can gain
users outside of zram (fs compression, zswap, etc.).  zram's backends
potentially can disappear all together, if we switch to acomp crypto API.
