Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D23339382
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723008; cv=none; b=ZaQk7JuPCIP9Ge6plCNLo83sCoaCEwTPLh/5EDbhoJgtEJajB006pU//nnmWldx9LnE5t0ZVBLthuqmrGQXyzg6DVCTpowlBpqtsPe7kj17FVRpwtAYFcwtYwAj5zCvshLOyDHdolQaQnT91iL2IgK0zu++sSIT1uPR1HfdK7dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723008; c=relaxed/simple;
	bh=wM97kvcRUSThzd97r/23TdUXo2jWwfEOWZ3NBcj9pu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHQ64UtY7OVqBqmqzlzgUK9UMBMcLf1gtu9GxOI6cURrAtRh0IkIIo5vNJ43mF106erjWE0SyO4nuSYCD1A1+KS0y+gM4PYDN7vETwbiSSLvcr1sDw1oKuLHN6LNSeKTQWwauS7TzEPzmcqX/2xZ7bvxMxVZhU5ae5nUGrP/1us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JC9c3dfk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NmCCi5vV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JC9c3dfk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NmCCi5vV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784722998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bTaDFtvYba+0BY3a5BGkT5Gc+0ou3yxmeYhSlSYsXDE=;
	b=JC9c3dfk/uWAoJ3nTitEUAxX0ars4tBLbDAdZBYHER7MvZg+gjydyZSHfwh2aJZ6uPHhW5
	nzOLGj9bXoM0gaQGJ0yTKdaE7tgEtrWTh6vsuhYJkCKRMUyQ9yADJdBXCa011pXAl/CWV7
	iDE/YI0lwbuQBbXXqlcdHqo1MOnulNk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-qJtj6CRWP4yXTJfZi_lFNw-1; Wed, 22 Jul 2026 08:23:16 -0400
X-MC-Unique: qJtj6CRWP4yXTJfZi_lFNw-1
X-Mimecast-MFC-AGG-ID: qJtj6CRWP4yXTJfZi_lFNw_1784722996
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso337362366d6.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784722996; x=1785327796; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bTaDFtvYba+0BY3a5BGkT5Gc+0ou3yxmeYhSlSYsXDE=;
        b=NmCCi5vVq4EvamBjRSX2NCJG0hnAwh0Y336Y3sx/XSQQKBBG4ccRpBAiI/N2UcksCz
         z5w6lnFO5r3k53OEOvxu8MhVaHgKHnsNRPAlup9fuRvb38H0sY4qPgb5XSxTMYy0I/y1
         7DerbjwyDhq5HuF+k5GVaT7zZKsO/mi+XCksQ+oVW2Rotl6Jk09Bz80jpe5ZZbp8B0bP
         NXNGV3A4k/tB6A/7u1W3YmNMl6lH8ma1LyDtmFzT2gh3feljyajkeON2wrwwYRzGMYEB
         3PmPHuFJ1mw0p6uOvXAAgGTRXkI28CL4QZe/SwaSdU/PGAAG4uj+cwP2lUnYA67GtDJy
         sjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722996; x=1785327796;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTaDFtvYba+0BY3a5BGkT5Gc+0ou3yxmeYhSlSYsXDE=;
        b=N/PPKROFKJE21q0pF7JdeYIUHIEAXhOKj7e5TnMlL0qRZQljsDhV3C4e9huxxlXf0G
         tbuaiQkfM5wznlSOmOF2m+sQU4YRpGbs2MvFqt3MvleIbjyvzCZ0jUZXtaZNyADN7zMh
         ZWQVuCS6V+bkoT0dB3xkX+RbrQCojNJ8Snv4JPmyx7Uf2im/QTY35e6Oo4BgLe9ugrBn
         rT47oGSUhEZBzn8emVTt7Jl63RjkxEXiBUC66J4D7Np2vq9HYR65oOUKR3+M0CjKmN6m
         7xX5bon7LBCp7d39R+me7mFkM6NS9UrR5hFbK6e+7CeoLXvLYBqOO0wTLl5G0nVykzbZ
         9KEw==
X-Forwarded-Encrypted: i=1; AHgh+RovfGEKIu+ZKDn5fQyZT4PmhOtVfNSIYTLGuecT+dO9dYYdNAf/XNB/N7eQPTLo9EDeEdJJzPpIgVto@vger.kernel.org
X-Gm-Message-State: AOJu0Yx586oRh14xVZIom5o0lJzy1SOE637+wy81F7BzXuDW7d+5XREe
	ThEmaPIPsH7tAkHpHhlVV0rpbWDB6k58x1AHWqBmEtQBn4qnoP1hgxKhvqTuT7/Al8zGAXnFI/z
	jdkNyPjieRMPhMml8xqEydu16PMtCl7untgn2URX09RBYdcGiRCxhmJLPCQ8KqI0=
X-Gm-Gg: AR+sD10s+djW9yoQK0pWia5i6c0ylfWiEjq/ISFfijx2F2pcn5yhuSvMeXcAEgKgxva
	152co7/KtYvphnWKP9e4VfqxXNLNLVnZwEwtFePbK+ItebBwYJGh32WVlWgdBwgxgSO/cXhFTNN
	4BNX1NhK+TSgpPee9voP6qzNCNyWQ8wWHZovbSMmnzGBwY1wdlMIWSlIfV59rHURhOa8jGaSiC7
	T8kobD6yNoQC1Q66IghhsaD8Tv0fVVsMKbDzmGdkrEd778xfNSBcKObvoObCJ8kFzyBMwrvGeFy
	LQFv3Dl44Z2DMBU0iWjDCHY1DiDh5ql2fd9cgjxHuFhQcHzUaNtActAPyPaMHt9rR4aXt/CHtuM
	0LSge/X6B5f+RVHlwgOvhuWSvOTQuMcM0eME=
X-Received: by 2002:a05:6214:5095:b0:906:2b80:4684 with SMTP id 6a1803df08f44-9077831647cmr253619086d6.3.1784722996007;
        Wed, 22 Jul 2026 05:23:16 -0700 (PDT)
X-Received: by 2002:a05:6214:5095:b0:906:2b80:4684 with SMTP id 6a1803df08f44-9077831647cmr253618666d6.3.1784722995525;
        Wed, 22 Jul 2026 05:23:15 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907bffe6994sm7978246d6.35.2026.07.22.05.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:23:14 -0700 (PDT)
Date: Wed, 22 Jul 2026 08:23:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joakim  Zhang <joakim.zhang@cixtech.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v10 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <amC2MY4QaCfCBdm-@redhat.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
 <20260720051505.1252774-3-joakim.zhang@cixtech.com>
 <al_vGXIW2bP8uGJ5@redhat.com>
 <SEYPR06MB6226C74C33B3EE124E3E0F2C82C12@SEYPR06MB6226.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB6226C74C33B3EE124E3E0F2C82C12@SEYPR06MB6226.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Joakim,

On Wed, Jul 22, 2026 at 01:45:52AM +0000, Joakim  Zhang wrote:
> > > +static void sky1_audss_clk_gate_disable(struct clk_hw *hw) {
> > > +     sky1_audss_clk_gate_endisable(hw, 0);
> > 
> > pm_runtime_put ?
> 
> No. Runtime PM is handled by CCF: rpm_enabled is set when the provider has PM enabled before registration, and clk_prepare() (as well as set_rate/set_parent) already calls pm_runtime_resume_and_get() on the provider. That runs our runtime_resume before clk ops touch the CRU, so extra get/put in the clk_ops would be redundant. Doing get/put in .enable/.disable would also be wrong because those callbacks can run in atomic context and must not sleep.

OK yes I forgot about that. Yes, I see it now and agree it's not needed
in the driver.

I think do the two other minor cleanups I mentioned and I think this driver
is good, at least from my vantage point.

Brian

