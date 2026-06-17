Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8448938B7B6
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725241; cv=none; b=gK8dUvXCr/HYf8QGLtYdiEXg8zoHRTGMl7Llt5CekT+RfI9enXUE3Nlg6wOXFDZ4RtKrup62+vDNRD4rZotg8J5tp2y7KcEXbo7lRWBB7u03cB8Ndjx9EW3u5ensgYi7Mi1BEi+pAMdV6GZowQPEuYy6BbtMvTu+G9RQTrfMlw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725241; c=relaxed/simple;
	bh=hC0tkmk3CwlTw60oCFg7NktYyWjvd8xz26/0DNfn94k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sy6DtY3eFhyIcCaoVQMM8o3777kERqu4YKf+MLWCqMZ7lnIjHT6H6SQFB+wMI3JEeSX241A92rLGYtj19beshJkQZ4BfW5U8/uxuQTK/YeY8r//1nneCbI1mgijYOLcZAhwcZo6ubuV20x5lOFSzTfrmfiYxKjz5zgR7pSgVqvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Td5XMaiR; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Td5XMaiR"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51778077b28so1344631cf.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781725239; x=1782330039; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7eyy4O5nzOr3kbi79Do1gW5A4O3qVnxOxdqKH9iTYAY=;
        b=Td5XMaiRMB7VW7/0SW8rT679aMMnb152yh2C9JlrtUmY97eRAb84stsdv9whKZwSbB
         HDKSXLL1TffVodfJICzpIz6ncFyMqCzBgr0+Ph6povET8bPeqPfSuYIZpWzmzhGcX76U
         fWlAhiXs9/T227u7B7bI6H3PveSpYvxHZe8XbxzOVxKwiHF2zGBmg1Cuthi5VyRiiWD6
         I5kJkP1l7ZW3p5zZlsfFdskyUzKmxc0mWj4+fZjvGn2KUwkYd4onMSlXVs+uEv9uo4MA
         r46PGzMmcOylfp0/Ui0ncdTvtHgzLHECScdwjJZrqXiRclBAgW8+L+OoP9fDSv41ExRM
         CJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781725239; x=1782330039;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7eyy4O5nzOr3kbi79Do1gW5A4O3qVnxOxdqKH9iTYAY=;
        b=PYqDFeA4mL1ojz6H//zxqOPmhjB0nJZL84l/H4clybgoyPvWwWy7FR2WZGPxs2p8nH
         NuaQAxx+UTffXB0lKj8neXgG4rmS7RCTrwZKiVjiV0QmK63ECDNHXsj38yDrLZoVCYzQ
         3P4MtTbLkH2NFcJRIaL4qVBNFyxfLVnP82pLa0r4AIL13E33twZspuStxCc74AB3F2VV
         ZKCK7FiTSD3x7BGfteEEJfOP0CL+2jKsoA7AeHW2vB9JiiX3g780CAShcy4jlm8lhrXz
         N15+vplys3+F8SRg9QRTnTXShZM3TesHKqpvcHsAv1u6DZJtQLW5Id39ac4rkVYVg+DG
         1f8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Q/vJG4tIR78ny3Uc9V251t1TxgxvFIsc9bEiHg6wMRDdqtTD8WkNryhhiG8CsWoMPpVNaD2JTEz43@vger.kernel.org
X-Gm-Message-State: AOJu0YxtCmjKe9f5cZCpaNWSGysb2CW+GjpCgpQGC26jOEKxuJ1iLFk4
	OHboR1maHUDG6ztWXN66uNTirNIKANf+QHsjk3GEaplkM7Kld5Tz7A5MAYUUKgsJZqg=
X-Gm-Gg: Acq92OEb45H5XUXIyZ3YROZstfd0G7t0fmg45cxEA2yohIWnEUosBj7x3rObKqFKxTO
	7b1XQ9ycAEd7sDwzP2Pa2ScSwiJqqmOFNxXVML0Z9gmewdkicgkLZxaijmG7ejVQObCciw8kw7a
	wOEEJw49wGGAdJ3QBNoW6b+gVdJ1xR/kvSIf4le3jYWlzylcwRAQKlgqXX2rJLzoUL5F5C38ikz
	uxpPkhMGfzAmzkVJ5k9niAPU4aHSJTcVtu7RwUgaupyt0pAXQlmVdaYKdCb7UPEzPJRKJlbdNPh
	+8xO7ZcMJbfNC2HQijTs2Fo63Dc5OnuDJjCntqzLDSg/qe2RWBh6y4QP51n6wnQ9YT56IoKrHX3
	TS90Li+Tv9PvmB9nFGkImsza+S9EZdMPdCMe5NL9wJraiDvy4J2LBigASZ4C27qgR1rLzlpy2CD
	uOt0N4dksqF0q/0tV0gAh1T8EWZrzSJOZ5YLXZje5eTynnmGuCNyqXc3vaE/h02hWlL6E=
X-Received: by 2002:a05:622a:1143:b0:517:b750:642 with SMTP id d75a77b69052e-519a8fd6aa7mr86533811cf.47.1781725239506;
        Wed, 17 Jun 2026 12:40:39 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-519bcf349cdsm12342151cf.13.2026.06.17.12.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 12:40:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wZw7q-00000001BL8-1aAs;
	Wed, 17 Jun 2026 16:40:38 -0300
Date: Wed, 17 Jun 2026 16:40:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	will@kernel.org, m.szyprowski@samsung.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com
Subject: Re: [PATCH] dma-iommu: Introduce API to reserve IOVA regions for
 dynamically created devices
Message-ID: <20260617194038.GC231643@ziepe.ca>
References: <20260119054936.3350128-1-busanna.reddy@oss.qualcomm.com>
 <cfd23f75-8952-4463-abd5-815b995031b0@arm.com>
 <bb59f07e-ca7e-f012-6a4b-0a148350b69c@oss.qualcomm.com>
 <20260612172649.GM1066031@ziepe.ca>
 <da77c21d-25b3-46c3-a48f-71f0549e9f5f@oss.qualcomm.com>
 <20260615125257.GS1066031@ziepe.ca>
 <dcc0d02e-91fb-ddbe-399a-0191bab94c4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcc0d02e-91fb-ddbe-399a-0191bab94c4f@oss.qualcomm.com>

On Mon, Jun 15, 2026 at 11:21:45PM +0530, Vishnu Reddy wrote:
> Hi Jason,
> 
> Here, the parent node does not have an iommus property — it only has iommu-map,
> like example below:
> 
> iommu-map = <0x0 &apps_smmu 0x1940 0x0 0x1>,  /* function_id 0 → SID 0x1940 */
>             <0x1 &apps_smmu 0x1943 0x0 0x1>,  /* function_id 1 → SID 0x1943 */
>             <0x2 &apps_smmu 0x1944 0x0 0x1>;  /* function_id 2 → SID 0x1944 */
> 
> When the parent device is probed, of_dma_configure() is called, which
> internally invokes of_dma_configure_id() with NULL as the function ID. Since
> there is no iommus entry, no stream ID gets mapped to the parent device.

Sure, but it still did of_dma_configure on the parent..

> The child devices are created at runtime and have no of_node of their own. The
> only place the iommu-map property exists is on the parent's of_node. So when
> configuring a child device, we pass the parent's of_node along with the child's
> specific function_id — this is how of_dma_configure_id() finds and maps the
> correct stream ID to the child device only.

The whole thing seems like the wrong way to use DT to me. Having an
iommu-map in the dt that no iommus property ever uses strikes me as
abusive.

Then hard coding the ID table and manually creating the missing
struct devices in C code is a throw back to board files :(

Of course it doesn't fully work, it was never intended to be used like
this.

Why the resistance to doing DT properly with actual iommus and dma
ranges for each and every stream your device needs?

Jason
