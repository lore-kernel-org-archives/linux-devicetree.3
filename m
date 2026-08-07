Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21978377EA2
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127587; cv=none; b=EfgYaEGyuYfY9hEAg7+n3n/JQnELzedFEWdf8ue71/8ehPvC2P0ckuR/8fQ8Bu8kfDfEE3cjxrcHhvmWbN/Z9hQiHccqo6aTVF/po76hkOqkjIX4P/qv3Ah07L4R9Bk26H/Lf/i2Y3YEjpoWYEHg4B4b+slr9y64XebvVXCHnfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127587; c=relaxed/simple;
	bh=LVRpvRWQSaxHfSgYe3MtbFfNAnOMtlsZRIWS10Dv0GE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bo5OAjX4ZzvDIGqRI+L51C8xWq8j539UaJG6PJhcOQnslCQHbnm+x0XCcX3UH+2e2IfWylOb4p021DS35Et0bu4PKKx7V+GmohU/DQPYRzN//uLFaZ/2r22/fIWMIAItAgK2ipaTZ8W1PKDSdyJA5DazSNVeMqWar3tHszjJin8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXQxGHOA; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXQxGHOA"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e99ef0902so208218985a.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 11:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127585; x=1786732385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rCdCLUuBP8/CkfxUK6b74oN1gwbSsaQEa9gHG9eOXxo=;
        b=ZXQxGHOAbmMIHVU/Yu7D4PNpE+Ee56ASOWUid5PZeXt2kis9luGCXXULW6gHNYSqap
         9f/fI3A9q7/MGwWOwAFk2ojXbbCU/uGVDBi6fIfoROv89Qm6f5Ibq5hULAlMAwAtxFtn
         B5O16ktooqjyYXKgiiEQGe5sY/vhfbg0csKGHJX4ijtRcchdgerYNY8C39Aj3plGA3Qz
         vCdoDrB8Y7o5P9ZW//zB12pv8LSk1iFBfm0zTLJgosY+K/2HqFfT747ArhhMBcG2e/w9
         bB6TeCWaLesmdd6kbb5OHQOr5V8CFOLtzPx+iAZTcq4KNVxq63mRrNtFD20q8WGDK6p9
         jz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127585; x=1786732385;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCdCLUuBP8/CkfxUK6b74oN1gwbSsaQEa9gHG9eOXxo=;
        b=ed/54WHVBeuajI/wYDQshS0QGQIcPls6d5ns8W2jU+LzkJQJYo1n0Me9zDcmrIQ3hV
         +r+6aj1zCCsd4WI5migsGRbiho7cZaBytxSdgoaDkYQa/qkKgoZXOGeHXLj7V7qdgGlO
         1IMo3C/TXBfvuSZjRpGosZaO/3VaPV0x5Modqo/6xtPmrYvphRsUhDNKsB0wzD7rcSOi
         AyjRDPNEzi/bBHX6b+u6QoFa5buh1m6PeiqjVWsB1lwBmyGP5tUwBlpEIXJSEZhAQX+V
         1UASD0fbE3OPBwtKXM60cRrGOomtbLeoTGkjajWoypaQXQCrOhKT8BETY38FfZdbQaqL
         uLtA==
X-Forwarded-Encrypted: i=1; AHgh+RovGWzMd+k7ikIUGLjeh5vqGl8PQt9zygrLcguTAupMyJRtR2Ayg87vwC3x6ygqG0ebH8Vy9+bK8DBt@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwhc/oFhtHQZPva7yug1uxbi9BBV3HI5LCyrVGBeAR+gobDWU
	CKu2Sz9q6h/s9kGEoSnyICin18r1esptp7+hcEq6I+StRgYZGSYp2Y9S
X-Gm-Gg: AR+sD101t/f7UJiBDBBKosXRxDSUPBThLJRfo4HcX6x/E2WWeJLGhpIpYcUszmX3GLh
	VrqF1XIkSsJhjsZIr319Zj40mpFknvqT6Oi768UeSIHHil1X0UT6y9+2T0NuBS699GT7YgTHEN9
	3kGtblY+ZeHvKsUUeVMpYjgIRU0IHincszEigtuxOB1ulfjIZEodyEIsFYi2M6YY0oX6a7fE2Lc
	Up7vkst182hvM2ISPYW7hjwc2vdJdpWsFSagjlmDn05g3UhCXDJWFkFXABHnKl+Fiz0685hexoL
	sCjOwFe0gB6Ztn0bmIwJGI1aKIkN7FnQnQdWAqsjfyoyTcDrHZxWT2/YK49wddyaNX0SOdo76gp
	2aZkC8IUMf7OlWIJD9P9poBJnLxK3qN3wRovmVX9HxiAGza6oT3SYPiYHPiXjEJvl8MEGx7eVK0
	SkFt02ViiAeCisyr9zw0dM9K0Q6K0LLJJHuX3/A4w5Y5KkNL7Phk9TyBFxAjJLwk7LcGueLjJxY
	Q==
X-Received: by 2002:a05:620a:2614:b0:932:deb4:7788 with SMTP id af79cd13be357-93648fc7072mr2802915985a.2.1786127584946;
        Fri, 07 Aug 2026 11:33:04 -0700 (PDT)
Received: from louisarchdesktop ([2601:184:417f:5ad5:c570:9008:5a2b:8db7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e229853sm206057085a.28.2026.08.07.11.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:33:04 -0700 (PDT)
Date: Fri, 7 Aug 2026 14:33:01 -0400
From: Louis Adamian <adamianlouis@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: pressure: ms5637: Add variant specific
 temperature compensation
Message-ID: <20260807143220.409fe4ec@louisarchdesktop>
In-Reply-To: <anT8Qs1ga7ayvtWZ@ashevche-desk.local>
References: <20260610020458.104818-1-adamianlouis@gmail.com>
	<20260610020458.104818-3-adamianlouis@gmail.com>
	<aimvBvJp8CsNKlPU@ashevche-desk.local>
	<20260611151026.4abf8804@louisarchdesktop>
	<aisNMmwMREF7Iga6@ashevche-desk.local>
	<20260805130651.4aceb71f@louisarchdesktop>
	<anT8Qs1ga7ayvtWZ@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID: <20260807183301.jojTkoO7qAdG4ooOhaI6oqPjKBj8ters_AwSWjZQZt4@z>

On Fri, 7 Aug 2026 00:27:30 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Aug 05, 2026 at 01:06:51PM -0400, Louis Adamian wrote:
> > On Thu, 11 Jun 2026 22:32:02 +0300
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > On Thu, Jun 11, 2026 at 03:10:26PM -0400, Louis Adamian wrote:  
> > > > On Wed, 10 Jun 2026 21:37:58 +0300
> > > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:    
> > > > > On Tue, Jun 09, 2026 at 10:04:58PM -0400, Louis Adamian
> > > > > wrote:    
> 
> ...
> 
> > > > > >  struct ms_tp_dev {
> > > > > >  	struct i2c_client *client;      
> > > > >     
>  [...]  
> > > > > 
> > > > > Please, check with `pahole` if this is the best layout.    
> > > > 
> > > > I will correct the packing on this per pahole's finding.    
>  [...]  
> > > > > 
> > > > > Can this be simply embedded into ms_tp_dev (and copied there
> > > > > if required)?    
> > > > 
> > > > Copying in ms_tp_comp_consts provides no benefit over
> > > > referencing the pointer; the values are per-descriptor, not
> > > > per-instance and never modified. I'll keep the pointer (same as
> > > > ms_tp_hw_data).    
> > > 
> > > Okay, let me ask differently then: Can we use the same data type
> > > in ms_tp_dev instead of adding basically the same fields as in
> > > ms_tp_data?
> > >   
> > Sorry for the very slow reply. Yes, for v3 ms_tp_dev will hold a
> > single const ms_tp_data *data instead of its own hw and
> > comp_consts. This drops the duplicated hw that predates this
> > series. 
> > 
> > One thing worth noting before I do that: ms_tp_data is currently
> > private to ms5637.c and will need to be moved to ms_sensors_i2c.h
> > for ms_tp_dev to point to it. I don't think this is a problem; it
> > matches how ms_tp_hw_data is defined now, but let me know if you
> > would like to avoid it.  
> 
> The pointer may be opaque, in that case it's not needed to be exposed.
> 

ms_sensors_i2c.c dereferences both ->hw->prom_len in
ms_sensors_tp_read_prom and ->comp_consts in
ms_sensors_read_temp_and_pressure, so an opaque ms_tp_data would require
passing both pointers as parameters. I plan on moving ms_tp_data into
ms_sensors_i2c.h, dropping the original duplicate hw, unless you prefer
otherwise.

-- 
Thanks,
Louis
