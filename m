Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B8546EC73
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118745; cv=none; b=uMIwNuCb+8ky1DK8fPoLNpNEI5r2BfiUSB3YOgewKnDAOvAL+Q+EF+I+Lgxgdr4o9pCk+GeJNPOigkzEbf2pIWD55fvAj+c6uFIxnkUB5KDEYoFxqh9Is7BansS/j0lUfYG7sNmMLT/bV8fKKfOTOrF3cRZbIe2QB1bVZLl5UBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118745; c=relaxed/simple;
	bh=+hbhW7C6eM97mFb2FKZiCDMBNxK/ZTdLSStbnr8knoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUyBnF9huj/1CY/ZJyMqLy5qabofXsT1Lp4l4N7ZcwAoWu0oONI28ZP93qwR7ASM6yJqXkqIDI7/JW2LiTZssu9371yzi23PJC17D1fJyPJNtQ9KN1hd6JTxuoT9HAc3fjBYxTBv5eN5uRnPN5uXq6ClqEJTT48764hUNKSlH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=tAgaI38R; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="tAgaI38R"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2938116fefso125842766b.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789118742; x=1789723542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8gX9N/TAzcuCOzID4yZlMsh7bJgTeR63hKKDKisDgEs=;
        b=tAgaI38R+RNObCtY3F06INVWouDYm1sz3SgMpyRjNDxglBiL/xXdwzg8ZmVhQPCd4Y
         ThR/KXRFiXt+6Xgsw0l2N8Lbxmnb3zeYKH3PWblLQXJfJqC/oqDfGnf/rMShR8PlZKNH
         zOEVzopQIbmSI2/Ih2hfBrvpjiCrAQWFuBW30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118742; x=1789723542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gX9N/TAzcuCOzID4yZlMsh7bJgTeR63hKKDKisDgEs=;
        b=rII6Ucoi2hE9+slIngAJI6FB+0zsst8XdqH7BglwnaXhCl7CFFuadDEoOv7DTaa4vq
         bOTvnIIga17DllPlBKK6OyXr425k8Q5qkki3pzRk1omLNwLR47zRfPr+7rotf0b865Zp
         4P8QqBmDOnoRQP59B6O0Om8mXwsllaseLzqkA6Uw7tjMham/vXg2kA3Y3tYHcwxs36lb
         fJKoy1v+yYGDEup8SJQvEJfGU08LGSZD73+60Iihgra3eduYkDya7K5b4S+KVfqDkhi8
         nZ4A+43EEZePW2+ci87wRI59R8RGZRaWAGDg7IoluhaidG7tqiIaP2wvekO2KhlXrUj7
         dR3g==
X-Forwarded-Encrypted: i=1; AKwUvBwGY60FKiNDXizr1HXf2IL7Z1rLdcAATZLLqq3Hg1pNUUu2GcoKmm4JDHTQRWh7jrt3wn5JKVmho/9S@vger.kernel.org
X-Gm-Message-State: AFuF++nopWwkPIAhbce4GNwP7ZNgLUfVUXxGpi1CYsuLgvxh9SXcdSiD
	AE97vR9mRhOKaCn7UI3Y6w5kASxW5L5kSS3RUnye95q80zlctI7AuprWrDgK4dvVKTs=
X-Gm-Gg: AYBFou0WrBImDJ9rZ4JCAC1nReAz0Z/AHk/F9bB/cBSL1mBP63hDk6AkSBqzq1WneEP
	2OViholjVx0ii4sZKBLp3HjGo5yAqYAcTWDbEuwBbjNzMsSnsmC5Z3ihXueJirCZYk8IqEsiz10
	PDttACchPn7c9mKr0oCzdkZDFX67PRcfCfsA3j0wLzGXMgVwQlqCKh1+Dbpi2JngiuZ2+EcVO+o
	vlIAcWm+vv5zdBayqjs3RkHtqoBp5pHQT/14HyDXax34hySRkKiqsKmZGC/Syl/Eg3gNBQJ0KML
	ZdM5eWek30yRiW2+ageK4VnRaPMNPJdWNeCSHc3CN9gNySldmvmkhJz9HHVTPHnz1eEnvXiMxio
	efK6Av12WGuvFCW05sihiNBZPizcOdSOAlGe7PydOvCVADGI3/vCMG7CgDi6dujYOpFIPkcrWpr
	l34gDWjHvu3i+Od19UXiNcd1AeAZh4FbUodiiivuwaeOyxytMcVOi59ZADyXsdgYKOnpybpWm/D
	OzKBROBNXiSaRFk
X-Received: by 2002:a17:907:c48d:b0:c29:3a1b:ec7a with SMTP id a640c23a62f3a-c29665377aemr142889266b.10.1789118742279;
        Fri, 11 Sep 2026 02:25:42 -0700 (PDT)
Received: from carbon.k.g ([85.187.61.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b75sm60416566b.29.2026.09.11.02.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:25:41 -0700 (PDT)
Date: Fri, 11 Sep 2026 12:25:41 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 3/3] Add socfpga devicetree for Draeger's M48 board.
Message-ID: <20260911092541.GE722@carbon.k.g>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <20260909111513.2259643-4-petko.manolov@konsulko.com>
 <0b682ab0-731d-49dc-a7f8-64c4d71bed71@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b682ab0-731d-49dc-a7f8-64c4d71bed71@kernel.org>

On 26-09-09 08:36:14, Dinh Nguyen wrote:
> 
> On 9/9/26 06:15, Petko Manolov wrote:
> >
> > +				bank-name = "SYNC_I";
> 
> bank-name? I don't see it documented anywhere.

These DTs come from u-boot where it is documented.  What would be the correct
approach: to drop the property or document it?


		Petko
