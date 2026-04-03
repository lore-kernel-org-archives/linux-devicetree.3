Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9693909A9
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209523; cv=none; b=t5vlYXo1xWAu2h0d2F9P12wX3AwTmBgRO73mAl2uqHwBTgaJscJTrntVdTKAnAEsp9ShvD4lsL8WNbB1B9cniTS3Uxkf1Zhinl1bmEKrEHrlzy0UpqcafHruykgcwVWf4H4VEovRnfglgq038mD1hqo7EzagrsoN0LezDlt/6uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209523; c=relaxed/simple;
	bh=rf4dDvWp3PU3Uif9HeZdC7SKlkhCZx6cxAvy4r5EGSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bvovr/BlccIMqpS4xS6j6tFxH+Xqn9FkdQC/VEVdBVTQTB0cIqQuPTvfJTaDTnw0G0b7IWaoiPcMyNJ+5iqG0QGdNLloqqNZ6HLJ7K6qwySn1W3BZQb34zT6vvVndYIGEWYyRCCpJ24sbNlqJSZDOd7dshfzDbNQ1FEjayMIKHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L26UcBJa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fFosXsg/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L26UcBJa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fFosXsg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775209519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZH9+LliZTB5HpO6CFpEOH4jpCgMrdVel5twiQSolHR0=;
	b=L26UcBJahTYdEPvtdGgDj+Nenz/AX9z6icHuHq18kVUqBfNJrtYr2XHbE6j03MR7lm9aGt
	Ld7FHAYG2HgbL5piDa8kDBXAmv3a7/C/KlEI6HEYHGyhPOthBQ8b4DQ9n35BJ8MjXpePFT
	l+9/kxODymFX8uIg+Nl7K1F7AoMM17U=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-gxrtj2hDOWelrlbD2Qho8Q-1; Fri, 03 Apr 2026 05:45:18 -0400
X-MC-Unique: gxrtj2hDOWelrlbD2Qho8Q-1
X-Mimecast-MFC-AGG-ID: gxrtj2hDOWelrlbD2Qho8Q_1775209517
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c7ec40f92so2495721b3a.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775209517; x=1775814317; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZH9+LliZTB5HpO6CFpEOH4jpCgMrdVel5twiQSolHR0=;
        b=fFosXsg/a38JkUqdV6xcQonp9NmOX8sDRiyKaaI4fgiZVqSA5NVy24V4QRubEBkSgu
         1WylTp7gDURAkrHJ2UOKPWR/5cXDZNpPqyMehk7+LcRaUALkCjZuRn54g/TwhvPreb+R
         TGhTlReNdgsjQTR0GjQwDzZcKi3RHMt/QwDm+vjO761aFZaeZ8cmxcytrUqczZAS/tGD
         iv9WSpDHiC6uBQMq4401G8aRyizOaI87pZyKGV3+iC6fNX1xgaTsNQ4CqHSfMFPfDPb2
         gTM1a/+moToWVzbSkE/uDlgg+j8RE1RDJE9NtbxAOnI4VElMtzhLA1A6lm1rRN8PW/9o
         Sb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209517; x=1775814317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH9+LliZTB5HpO6CFpEOH4jpCgMrdVel5twiQSolHR0=;
        b=miHUW9R98sjOJLm+NRTFL4F9xn01WPigAoy2DQtxSIi/hwdZZ2tWIOj2uu0kUwIW5L
         hsoLrIoZUmKasyBveCoqVbh+NYnDSBKk9bkLQDlVjbWSSjavIGfUskLxb5vkzsq1IALC
         C+xz9grj4UU0Lt2sYbdlD0Oq4mnJENawdvBLOOTmcv5KcEehfyFt3Nd32m5CVLHqBKVy
         ZxSnWXMc3fC0vIXTMylaXHfu77erTZyoxT2oprllbHZF6QEz2LUBpW0xltDUzhwbGB6j
         6gB/H4Wi2JGBJWhNqRY4+3YF13qB818+ywrK9WXFeUE8AYXlsviH37U3LinUESAdkocH
         CSbA==
X-Forwarded-Encrypted: i=1; AJvYcCUtMD59oj9884CKg5mGs5n8HNzqGRdbnYmHJ0KTNcKGtElYBPJ4NHXK757+A46TMYMCmQKf3kU5L09V@vger.kernel.org
X-Gm-Message-State: AOJu0YzKL38JQkIlFwQgdMi/iyeO4+iE9jF/rwGKkd9+tXa5PRIQl91g
	PCkaq9G1lslTcfYVNZ+bJ85iglblp74F4gXcoPSaWvuyA0sPz53hEARI1D7CTXq1viqE0UG8wqg
	xdZcA+8HwOwu2E67zVV5l5/KAwvdNeHhwLFDt2L+v7WBJ0N85pxfGtc1JkPWpCJs=
X-Gm-Gg: AeBDievYMt/wZoVQrGDtAxABdVuQrRMabO2IWJgeZ+UidloSVgsULptngRPFlJzq4D+
	0HwJX+rf3UT7YFXVebO8PToed0ibf+7Bi938FAkMvWCOKpRHzvfiIyLeVYNQUYXodsBsXSV7dFj
	amX+TPWMVjSWGnJh29+PUk1+4GTushpz7Nn1M4CR4Zu07JV+BYcIVUJECigNmrwukQVWk9JE1JT
	HYuC2kqffoClBb5kAcLNCj4zKnNzqvEJdPuytdkE+fcEttt5mLy3EdmA/FdepgMr//aF5rc2Rcq
	h0fwtzOlVGWIBkaM5XL8rkgrl+f2pbjFcBcLewb4+X/F/7wHZu7Sg6Pa17oOnY1TssP4kjO8xoZ
	fjNytn5V1k6RZ
X-Received: by 2002:a05:6a00:3027:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82d0dba9c6fmr2625455b3a.43.1775209516629;
        Fri, 03 Apr 2026 02:45:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:3027:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-82d0dba9c6fmr2625387b3a.43.1775209515832;
        Fri, 03 Apr 2026 02:45:15 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9cbf6sm5915263b3a.52.2026.04.03.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:45:15 -0700 (PDT)
Date: Fri, 3 Apr 2026 17:40:52 +0800
From: Coiby Xu <coxu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Staudt <tstaudt@de.ibm.com>, Will Deacon <will@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] arm64,ppc64le/kdump: pass dm-crypt keys to kdump
 kernel
Message-ID: <ac-KKklNrB5eQFvG@Rk>
References: <20260225060347.718905-1-coxu@redhat.com>
 <20260225060347.718905-4-coxu@redhat.com>
 <51761fcf-955f-45e2-97a5-2b49d8e79d04@linux.ibm.com>
 <20260402233118.08ea88a6836bd10f01031cce@linux-foundation.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402233118.08ea88a6836bd10f01031cce@linux-foundation.org>

On Thu, Apr 02, 2026 at 11:31:18PM -0700, Andrew Morton wrote:
>On Thu, 2 Apr 2026 16:24:14 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>
>> But while reading crash_load_dm_crypt_keys() I noticed a possibility of a
>> double free at the address pointed by `keys_header`:
>>
>> In crash_load_dm_crypt_keys()/crash_dump_dm_crypt.c
>>      snip...
>>
>>      kbuf.buffer = keys_header;
>>
>>      snip....
>>
>>      r = kexec_add_buffer(&kbuf);
>>      if (r) {
>>          pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
>>          kvfree((void *)kbuf.buffer);                           <---
>> First Free
>>          return r;
>>      }
>>
>> Since `keys_header` is not reset, the next call to build_keys_header()
>> will cause a double free at `keys_header`.
>>
>> static int build_keys_header(void)
>> {
>>
>>      snip...
>>
>>      if (keys_header != NULL)
>>          kvfree(keys_header);
>>
>>      snip...
>> }
>>
>> What do you think?
>
>It looks that way to me.

Thanks for confirming it! I'll send a patch after finishing the testing.

-- 
Best regards,
Coiby

