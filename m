Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF074E0209
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657988; cv=none; b=OSHmPugwVPpJ/utkEHSUmOdD0oSXMiCZs4MmL6Q5DyLLS3OH+rNP5PpIWvuott5lV05o2LBMvYn7NSkuehwl0FryS6aYXZeutWjj2l8VL7uUnWDiIMOkVlkErItzw1s6Dz02YEtEflYLQ7fY8IzuUCPzo/U2uEikLjVV5Y9RAdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657988; c=relaxed/simple;
	bh=nE3yOBYFFqYYkkgQfghfhhNaCFe7JvMndx4HdCjUOkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivuJ8kPWVZI0C8ipB4FyOVPKNfONtKvOuu8ySwpgxlYLS9YDDk5wVFV3xCWUENJPiWBEG2pS4jcCKPKZNMUn6aSrei8hosxY+nRbxK05tNiJYO+PXLWAbZ5rWCo1iihgXHsE60TUykr4TqhdAhIxypEXiPGiYRJxylniz9wHDm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=ZHQLtzjb; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="ZHQLtzjb"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f55efe7so155186666b.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789657982; x=1790262782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXyMySlTneT5OxJWs5j3wToWbg7gTC+b+9BlWFDMiew=;
        b=ZHQLtzjbssryWleiIrc2Wan159dA1sxhddyC4uzrwIdod406QjnnvGONy+F9ZYCzID
         2xxoy6APpXi4qjTBnu1NvuMuXf67DnVPo9xcmN/llePi3R/tHuecCYwzuLvJjPvOpp3F
         Bv4QoopGQYlYGA42XP5yAOsSKQFNJ4su7dyaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657982; x=1790262782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXyMySlTneT5OxJWs5j3wToWbg7gTC+b+9BlWFDMiew=;
        b=RkZBtkPm/xgvvQlIwL0gh/aXw+q1WAkECv7m/HOE9iFgI5mhIuVLhdkB7Gi7nRGb7r
         vy+7af9ycY4RKiAnB+36gQzDSrkHiPY/VSxt9haeYDyVbDR9MJDjPVLsCOI02k5oazNg
         rV1bxEzwTHkvmWPSBOxBXkaP7XPdp4LQDSd362J8SAH95oJoWwxeUqVVbF7hCZ7YrzLO
         ddgmA1/Z9yIr/iB8TzAvDBfrbfqfVUoLv6AuhMV1fUS0BJGj2+wTm6b3vvPQyqlE2fMy
         zcFGuWBUoUyDMfIUck/uYgDVsn6DWmFZ51bxWCXMtBIq8Ohs9N32vcgShc9/CmMPjL0s
         UJfw==
X-Forwarded-Encrypted: i=1; AKwUvBxFpimic87ijX3/0PWDPGvP/n0ibXYjVc8fO8YNAO8CfTjZY+YVPdNB3WnkqgN5ZYIKR8ryWBfQZQUF@vger.kernel.org
X-Gm-Message-State: AFuF++mybmrht6PFYcUANioNO7GurOj6yTTQeNE5KDXlgsPfm7sMUOxj
	kbNtesEo+Tv8zbvPaPi4i54V0dOkGN294OpoBQP+DqY1QuO/sGUKwA3aaMgFZ53pmrI=
X-Gm-Gg: AYBFou1P/gJN5vKTpamirtwS+MU5R77bwAxh73BMLcnXdWCz+bR6jeF6LmBDSOlhRsN
	lRIqmH+War5sua4Kw7f3sDhqZSoTAV/PtvV3tpeT4FuALXj2jGLPKMKOZNddJSw1lR2eV1pfsbg
	cLje1g0cRnkNvYsqsrEpS/hP/JUhym9PqgZz2vCRaS6ZuoOREpcafECg0OpGPEnUXyzu5n6IS5Q
	j9h7wi9Ep+CtCB/k8s00sWaJ760P/PHoN8/1fPmiTIFuhVFaI4rp+dePsz+hE8Wf+/wnSZge3K9
	UHp04FLGtQcm0e4b2ovYGS/FICmEAVonReceDzkauB/QUZttxQgXvzisqJc8zaLpKEOQndOpuPH
	54UdTZRXdbQ/8QG9ZZRFmmGkAuaKy4kScPNkb7DK1MzWk7dEmV406FX/YYmkVh5yBOr6PhlygcK
	ruH6Stsai/2P1cJ5XsbndrCsQca131vqfxLxdfI2CZwaBpuXKd1300A6n7ublqxeK0xoPvoSD4W
	SWNxXU=
X-Received: by 2002:a17:907:3f13:b0:c29:4311:e23c with SMTP id a640c23a62f3a-c29e52b4043mr521614766b.28.1789657981872;
        Thu, 17 Sep 2026 08:13:01 -0700 (PDT)
Received: from cabron.k.g ([95.111.117.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29e801cdfesm263168566b.58.2026.09.17.08.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:13:01 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:13:00 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Message-ID: <20260917151300.GE4583@cabron.k.g>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com>
 <20260915133805.3249587-2-petko.manolov@konsulko.com>
 <20260915-swore-armadillo-12f821bb00fc@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-swore-armadillo-12f821bb00fc@spud>

On 26-09-15 17:29:29, Conor Dooley wrote:
> On Tue, Sep 15, 2026 at 04:38:02PM +0300, Petko Manolov wrote:
> > Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
> > 
> > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> 
> A Link: to their website would be nice.

I assume the link is supposed to go in the commit message, correct?


		Petko


> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
> 
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index ba2002969373..276d62b848d5 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -467,6 +467,8 @@ patternProperties:
> >      description: DPTechnics
> >    "^dptel,.*":
> >      description: Guangdong Dapu Telecom Co., Ltd.
> > +  "^draeger,.*":
> > +    description: Draegerwerk AG & Co. KGaA
> >    "^dragino,.*":
> >      description: Dragino Technology Co., Limited
> >    "^dream,.*":
> > -- 
> > 2.47.3
> > 


