Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF93CC7CA
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 23:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785971712; cv=none; b=byyRsR80qjWcmmxj2+pWHOx8VrhxjgG/VA9foJL0O5STPkC3a53Vbk27XHgJonVWojHVQ5VgOzdBu6U7k/wxkZ+BqGM/v8PWomYN6oBi4nQN1vO37lCzS/FN1Z3gZ0Jhutt/s01zn6X+/rl0UWhNlibXpUQEnDxky6Te9dEf/Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785971712; c=relaxed/simple;
	bh=pPy1CLEmf7LQ7+VRVpU1PtPWWfqP1ERTf8ceNSl1ajA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwcDXY/jVnm2jMdMCerIebHOFIMWvaJte/dQF699kTG8s+30PMcu8wf9XX7MAShEhJ8G7cLCq5V9p5cHm7RN6MBj1lw+hn7u88qXnvBfZRPBx3vm7E3sabV/JD1bT002toKXjkNKnTXtJ+aTakcmxq7gosGmZYHuskOjl0wZ5KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N/oOBORM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8Jo17SD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N/oOBORM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8Jo17SD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785971710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=;
	b=N/oOBORM4PlQmbm597RKRqYlJBIIN5Ur9+XKAuOJgSGryOTmssuX1hEIClWZXf2bAI9XWm
	e0a6KvcuBKjjuJMRmOl90DZQnKrSk4bJY3MYOnZB+Rjte9rt/iCaQ3ezNtL18xXvVR7FtD
	pV1uYQzeoqGiQQLopY6cFD7ujm9hUJY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-ivoZurCEMYePRLSzrRzkCA-1; Wed, 05 Aug 2026 19:15:09 -0400
X-MC-Unique: ivoZurCEMYePRLSzrRzkCA-1
X-Mimecast-MFC-AGG-ID: ivoZurCEMYePRLSzrRzkCA_1785971708
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81f0b6bb02dso41459867b3.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 16:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785971708; x=1786576508; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=;
        b=F8Jo17SDBJ9LGkb3UFsUAzLadXVbtuk8yVWoTH7FeT2k3a1gvxnyMk5oHOehOsJOxM
         WJ/VQHKueUebSVx/JFRVpNvsbu4iPpAldG5IDpCJX9Q21cb70qW6vn1zNG5Zq/ZWKmQ4
         DrdBB2eJkQfhqEPddS+ZDcYw+2/urpYSp9UerrDTr5651AGmPLiB3gVdkq9IuXWRLJoi
         zCWyZD2swSgyersBHuQ2EJ7bd22Tt4Jw2BFaJ//iWJzDa1NZsq3ussKTHIoc9egR+gvo
         iuJeH9S/48PncBYzzVkxf1kd4FLn5dJwimUN+AgdJSdroqevErY5mOtgExtQVCePKS0F
         dD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785971708; x=1786576508;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=;
        b=sDlzid1FDZ8wAoIFk4H0+UtP+bPkWGa3vi5pMm4ZJHQa8yGsH5KpSZURUZTJnmmxGR
         S+Pwc+rPosUKDB+XzT69pHziA8pQ0qryyHFyMaukAswOWYvhdjwrOJEZKAJmCRyskyNU
         bxXUeg063EGKSs794lFdHMQmn9DcQHA5Kz3I4gke95VG148g7WjKufrVhEBtvFCZ2jXE
         1jxW7tUOLX0z2v6gcq4hAZ3B+z7K8W3g8qTv3kpmOYwSnhXvUsvYH2OUuk2RaqwfpvU3
         7CoydvERKyApFl4q8tLNxlyKI9/soBWG39dk3ExzzhPLdLTh+mz2OllnE7nNMKTYp074
         OG0A==
X-Forwarded-Encrypted: i=1; AHgh+RoV7Y5jkIuyN/cifTc2+3Kb8+JsOmszQ021OM0jhmEUfW+WDJbTwUMKbhtcb4R6CVNQDl4Yn6ikzc+m@vger.kernel.org
X-Gm-Message-State: AOJu0YzFuPBEXQ0XD1jAwcTeqnm0xNUIO+jQIu/pZjRoBR2Y7R3dN1N4
	d2P6ydqiXZlmYYWwBzWo9Q4L0q++ma87CMy9avsW15H8urS67zwkmtWkpSEesfs4+OxuAbvbX9A
	WpdeOsQwYpRQQQZ94IPQolYYIeiqzog1Fn4RALz6TawO6jzZF3Xnqt8/uU+AJPdk=
X-Gm-Gg: AR+sD12+fQ910EHiKeDNjkR4WApEsDKMayJlm3Sx9s7GirN3CJ3KAJ4Ebvtlokk8qvj
	/+RsvEEHVRU1Z+AE5TyykEb7OWjNA5nivlYT9Wwsp16sEQKvdGehSgXVDwLPuaA83GZctBvZUZm
	jldtmNy6ICpPcA/d+Dk0845h55g/d2FE5AUw2mUjVxo4ZQFD/4EJwB14Z1An0IhA2tLDRrDuYXZ
	tbJv5ElQjrGWoGB0xuyWpt8fdLf4cQ1wVXP3anFmUSwfpYY0pNeIf5Mez/EyhcBmu0nHcWvHI7Z
	F3YwvPfptG0WDPdN1Uhlcpbk11pQttt/g4S42igKF8EIVx83c12iwJubrbU3UZyA94xpaUgDO45
	JU29DNNNa6bmWY+CQdiKRTNBpb+zdddW9QnQ=
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr60602527b3.27.1785971708340;
        Wed, 05 Aug 2026 16:15:08 -0700 (PDT)
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr60601867b3.27.1785971707809;
        Wed, 05 Aug 2026 16:15:07 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-820134a9e21sm29018917b3.42.2026.08.05.16.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 16:15:07 -0700 (PDT)
Date: Wed, 5 Aug 2026 19:15:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anPD-I9GDyOZSDO7@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
 <anC72Cf1zKcLYWlC@redhat.com>
 <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Stefan,

On Mon, Aug 03, 2026 at 08:48:18PM +0300, Stefan Dösinger wrote:
> I have a long-standing question about tristate/module support for drivers like 
> this: I don't think the driver can realistically be unloaded. I have been 
> testing driver unloading by removing the UART clocks from the DT (otherwise 
> the clock driver is busy) and marking all clocks critical (otherwise 
> unloading/unbinding will shut down the UART (and more) and lock me out of the 
> system).
> 
> I have made it tristate because from early research into clock driver state of 
> the art I gathered it was desired, even for drivers necessary for fundamental 
> operation [0]. Did I understand this correctly? It also uncovered some linking 
> errors that weren't obvious when compiling the driver into the kernel.

Leave it as a tristate since that's how most clk drivers are built. Also
think about this from the standpoint from the perspective of a generic
distro like Fedora or Debian. Support for lots of SoCs will be enabled
in the kernel configuration. Some SoCs that may be deemed to be not as
popular for that distro may have their clk drivers compiled as modules.
(We at least do that in Fedora -- can't speak to Debian.) That way they
are available if needed, however the generic kernel image doesn't have
a huge number of built in clk drivers. Some more popular SoCs where the
distro may run will have these drivers set to built in to help with boot
speed.

Brian

