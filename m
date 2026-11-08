Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173512;
	b=jMupEX8T14FrwsQozjfTmYVLmNfeTPdNYt70BrtS1MAQF0xXiBTkhKUkzHYkBY9BzDkm
	 K98OlavMLpUoTzERPq1V6OGRqBMma71xA4UCq7KzZFNZyQ2okNaIMeYJ9R6mpP/mqeISL
	 wvxmsLKnH9L/qzPw1nHkniBdnUQIZYfgsSZ22AnlLuJoJn/kWBiFT9w57vqw/hplqj/V7
	 JER02YNXrxNQF3Cb70LYHbre3/c1Gl4W9PMBnO6PoP6YL+zzdwGXsr5mQAXAZQ5a3yvTx
	 BIdsRgi5ND5YpijhMbJX/qtoRcK4LHn3eJRKP2sHvQsmELoCrGOB98KdiR90y54WFbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rBMGVypFbtv6OA3tQuoT/CFxuNnCbyC8FkABPLfi7Vw=;
	b=tnGtZiycTmmfh4lTi1mvoCDA0zllmv0DizsK9ekdLqR5pjRL6GBxyJRNbJAZA9RknPM1
	 dEPDU1B84TXPRI65DCDUBgPzfXHz3jZttXa/0z8xLScnjNGlZwNb99LVd6SB2p8HnQxYL
	 nrh0neQ09+lZvVmNeucVFodmN2X1Rth3ekdIa23jdwWvwaamaFE+8GUx5sabpQ/UizoW9
	 ehGeMf6qcnxQqOD/hqKTN5MK/q5b7oB346Pob/rgEM/0hSoRF3ZNhRCShkztIafzhVg96
	 OMvW7qBpj2msDBEv+RbgKiiNBqoVgSi6DKVRc3UOv1dT8vhGbL0C+J3s4BpqD6MGZMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCMpf8kV;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FCB606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FCB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCMpf8kV
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae18eb9b69so254626c88.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173511; x=1794778311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBMGVypFbtv6OA3tQuoT/CFxuNnCbyC8FkABPLfi7Vw=;
        b=MCMpf8kVOPjbb/SHSHLMyb3YAsSrk5Ygen+7axWUq9EERpWUWmh1pKPThjwRKn33RB
         e3pld9f2GzDScf75GDhERsYay2xXa/g63NHXlJvP+8I2WSQQ8juMRU7Udf8P3iFb75BB
         ucpaoTMO/lXhzEF00DMmocN+mPMwYawtEIHlxzvf5b7cB0bp9qSgqK0qoHBl8bEpC1dH
         fln7ngajmHHuw5cKXqRWof/6tU8OYAHgxvQ2Fr4KGlAsnfXZnthr9u/Fah5iG7NsWi5v
         dU8goz797H541pLrKkvITXyYb1OMS6PgC+32/iDLC0Nqw4DGHBHisW58MSmpyZkOCKIS
         v/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173511; x=1794778311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBMGVypFbtv6OA3tQuoT/CFxuNnCbyC8FkABPLfi7Vw=;
        b=mVtUP+Uer1dqzlEomcyQjbvwtGIvHDOi+2zZMb1OMvumt5OV2BiS8LJ0mtspeb4Ibl
         vPDSnRnM8DlSkj5Y2iS78zZZkRx4IAefCHFK3NXyESeFDTvL/Ly2QDc0T01UlOO/rh8p
         a/2x33a1nin3V3si7VJixEcy345HIOGZM1OWD6xyesDqeuungxjCMkJeZSVo5CjTC1jo
         ZLsRnr6hGm6zsVJST7F8KQ1TmFKo36IMXB3+23zoSRgaYE3C5a+R94ogBGONghk4Vaj2
         7/9f6upeTcerymBQDMqhnMgKIAgUkSfoAJhz4ODYbt2WkNvGfp1c+WYiQB5yedNf0B5Y
         ulcw==
X-Forwarded-Encrypted: i=1; AL+hErHsSw1aPE6kZyDAFbryV+20gp5yXE24j484fa977uhictOi6YRMD8pCA4ZRvPvbqtd5JCEb1CLy3o/1@vger.kernel.org
X-Gm-Message-State: APuU4Z9vd6N89ytqJSZtGOQwZzZ1h1d/ydX318Ngs2NUA83IdZ5foCHA
	xCOkbi4q2UnpAc8qIzieWPPr7scN52vwbB12I19BwWwqGNElXPGcJI8x
X-Gm-Gg: AYBFou39ijIWd1cryx1gAi/4DiASYhlOAzr64Z3MN2sPWJkK+TISn4ayuz0T+YFPGbr
	RKGv/EzDMOrxMqVNjAd/uKcacxPBbvg3EB1rWDQ5hWbqBxKSQQnKvI6VPemgcnk+z3BMw/4y2hI
	apvV1TOCt6WXooOF2YNyIZSycGflCfQwV7lvkYeKS55vG6N32mkj7LsfVPU53qZu77SGwXsJZ3M
	JORQGysbS//4qFI+fFooeAiYTns7NEYmjQhlhiecSXbYaqUrQCIAUk9AlWjPdZ45ccSS87gR0C7
	pyzrDMzGVlTfjFC/TMrYedV1DFBh1hMaZFX1GXxnS9Aqs8fU/urDRRE8lZ5tge8QPvgAnvHDJMf
	yP4NA8YzK2zy7JTWj69RzfJskykPUQMMzPV0OrUkYe12R4JQYqbnizUtDRc6sw9zd1sus4cBlmC
	BD1Y+pCH+4uT34uL2YLndu+t/ruvapT9srnqxKgJIf+0W8U42Caa7qlfbSOfPKm7GuEKUNgfFAQ
	FtV290GJnoEcMdj7CWS5Dhnn7iwq9Zneds7j0HCqo7SM5U9T4TiJcnPDiVhnNOjS1dqDofQegZS
	kugR5noqmSPVUvzI8wmuD9ZkufUl6l59jUBohZZhcQ/qjb+n8yDgQ889+SOZFFlHBHkS
X-Received: by 2002:a05:7022:3a8a:b0:1b2:4da6:bccd with SMTP id a92af1059eb24-1b39fef46eamr3757834c88.34.1794173510833;
        Sun, 08 Nov 2026 13:31:50 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37560d95dsm7077840c88.11.2026.11.08.13.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:31:50 -0800 (PST)
Date: Sun, 8 Nov 2026 13:31:46 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Nizat Mikayilli <nacht@dxdmail.cc>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/5] Input: s6sy761 - apply the touchscreen inversion and
 swap properties
Message-ID: <avDoui7Foj0eVcaF@google.com>
References: <20261108-b4-s6sy761-fts1ba90a-v1-0-999b3cfaf82d@dxdmail.cc>
 <20261108-b4-s6sy761-fts1ba90a-v1-1-999b3cfaf82d@dxdmail.cc>
 <sashiko-outbox-203649@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-203649@kernel.org>

On Sun, Nov 08, 2026 at 08:38:24AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] Input: s6sy761 - premature input_sync() in
>   s6sy761_report_coordinates() [1]
> --
> 
> commit a5e7ac4e0cb3d02e12af7f249f64b3074df9f280
> Author: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Input: s6sy761 - apply the touchscreen inversion and swap properties
> 
> This commit replaces raw X and Y coordinate reporting with
> touchscreen_report_pos() so touchscreen inversion and axis swap properties
> take effect.
> 
> > diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscreen/s6sy761.c
> > index 1afa38850f12f..967fd222f0d62 100644
> > --- a/drivers/input/touchscreen/s6sy761.c
> > +++ b/drivers/input/touchscreen/s6sy761.c
> > @@ -153,8 +153,7 @@ static void s6sy761_report_coordinates(struct s6sy761_data *sdata,
> >  	input_mt_slot(sdata->input, tid);
> >  
> >  	input_mt_report_slot_state(sdata->input, MT_TOOL_FINGER, true);
> > -	input_report_abs(sdata->input, ABS_MT_POSITION_X, x);
> > -	input_report_abs(sdata->input, ABS_MT_POSITION_Y, y);
> > +	touchscreen_report_pos(sdata->input, &sdata->prop, x, y, true);
> >  	input_report_abs(sdata->input, ABS_MT_TOUCH_MAJOR, major);
> >  	input_report_abs(sdata->input, ABS_MT_TOUCH_MINOR, minor);
> >  	input_report_abs(sdata->input, ABS_MT_PRESSURE, z);
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but does calling
> input_sync() at the end of s6sy761_report_coordinates() and
> s6sy761_report_release() fragment multi-finger updates [1]?
> 
> drivers/input/touchscreen/s6sy761.c:s6sy761_report_coordinates() {
> 	...
> 	input_report_abs(sdata->input, ABS_MT_PRESSURE, z);
> 
> 	input_sync(sdata->input);
> }
> 
> When s6sy761_irq_handler() loops over batched events, emitting SYN_REPORT
> inside each per-slot helper splits a single multi-finger hardware update
> into multiple torn frames for userspace.
> 
> [1] https://sashiko.dev/#/bug/linux-c1c813ff-e5e5-43df-a3c3-af15e2a7dad5

The driver does not use INPUT_MT_DROP_UNUSED so it is OK to emit
SYN_REPORT per contact. 

Thanks.

-- 
Dmitry
