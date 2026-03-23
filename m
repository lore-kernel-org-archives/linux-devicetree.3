Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023FD390CBC
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263392; cv=none; b=rbiFPpzRfNik2jZS02+hftG+8tAujm5++yJZ0K1JBUK8Dap265FzPsgi7s3Wy4nMV2NtIJCbAnxslHDbao7eYNVRS2G//4OJQ4bVaQo+UWQLJO1WvE31uAJMH3fpIqrXKdIETaiKAvRCSza6KgiFHQGs8SlVAWQZ/Mp6w5F3HN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263392; c=relaxed/simple;
	bh=3ND2U9WUVzc8Lv0ev2KT23OqMrD2HAyt6A+/DGBkYww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzBQaLRTltAf/zkeo8HPmPPYc56pZte2jochGYiQN/Avf9eQfIGcY6X8mUffer4k/QOFQd6WmMEBZ/flIFfsmB/oW5DZ1mXpr1CDiKbgmIUaUZqpbhtlBdp7leTZUVhFrmIZvEZJo3O2yvlP9QbqRryFs/0qeNM+kpeE/GjgwfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WyJmjn7x; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TfPCTOBc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WyJmjn7x";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TfPCTOBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774263390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W8PnNxrF6RAnd6AXtVYuBoGbmL+cIw2K+KfBdA2DfjA=;
	b=WyJmjn7xn9Km7GO/UXc+FXFMeg1vHjP1x7t0xH2rAb9awx9NFzD3asZI3fi5pf5tRn4hij
	ESZH7dgRFkP5F9NERWGOgc+AvZY5VQ9FxRh8L7FJOFNu9Lbd7potTYbN3bqxViNVeBhwMG
	gvCo5BgJbI59IvIwouJSqa8EPfxah9I=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-OrqnLrNDNQa5l_YejPXibw-1; Mon, 23 Mar 2026 06:56:27 -0400
X-MC-Unique: OrqnLrNDNQa5l_YejPXibw-1
X-Mimecast-MFC-AGG-ID: OrqnLrNDNQa5l_YejPXibw_1774263386
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso57067521cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774263386; x=1774868186; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8PnNxrF6RAnd6AXtVYuBoGbmL+cIw2K+KfBdA2DfjA=;
        b=TfPCTOBczF5n11yj5pmZvoODQk9L6EqoLGgK5asQwc4iiVwPI+3Dfn0QxQBX9Gp5ec
         AKR/kYPP0ME/HkQtv0km4uvIA+e+DQtkiHdiyKhaNZVdUIp6kaz0PRyOy/hNlpBD+Dcg
         NGY7jAphea3pqkLKuaMdLkin0ng7SxCMVMggZ4CT2zlS3pNd8Jc96QpvDFYzcH6wZVJT
         3kmxijnRnY+r7vRU9UOST4Muv8Ma13BLELAQ44jeqYimnelmb2E9vlEL/V3g60rYmSM1
         reG+3hHvc/Lpn5haclr5RnABLEMPAcfF0lXgsNtpirfwRlxeZDp51qhtFtz3r2TtUFKd
         hoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263386; x=1774868186;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8PnNxrF6RAnd6AXtVYuBoGbmL+cIw2K+KfBdA2DfjA=;
        b=YojQiEpgTTct+nYO0QvwqonR1alWRiqNsWl9MNVvUXdJLSw2RERyVZwpzRr/7THBqh
         JO5vhjjX4Yr/wmIqPCsf6rYFQncZuSexOlWQGludTBOB+73Ho+6V+8/wJdNpFNWchNfe
         2Ch3S+F1YBIgH9sM4M6AtzjG+JaiOdQcsEElRXBfVeweTIrPL7bAG2MqiWycNWq3Wqoq
         RlOAc8XMPVOMwCP3gs4pyKviJ1ZuqJyylH4AoRr61VCuzengUxdXDGFoa0Q+c6T+8W7U
         vTLnw6flyI1MBQrI1N32hqsGiybELUdWzxRq+8EUzH1F1D41ny0DsS7KtVNK2gB/YnsJ
         m9+w==
X-Forwarded-Encrypted: i=1; AJvYcCUmDPR5RvsLEFqqqSlpJnyuCuPJlWzge6+knc5H6Riyw+mKbdwQvyRPlx4xyH4etIrso1mF21ihYMv1@vger.kernel.org
X-Gm-Message-State: AOJu0YxyNo91PpI/dhDFL7QYGLdH7kNI9G1v3Zyypg60YzYiakxgKRyB
	uvj4IRtS5nxLHUEcIoxWbjgM2NdaFNANuJZeErFFE22xvwNfCgVlv3/ECyRcG/OkhWxx6dE3UnV
	JuSYAGDWW5yTnqIteKMPmGx0hcGQAVSLk7Fj3pTbUiS3/SAlrRie/WQa/Gj1L8QVOkchefLs=
X-Gm-Gg: ATEYQzwewekCSKZlVlqFD6l3T2u9PnLrG8ZLozMEqLksR7UZgWXpaom3ATPpPM51sGw
	uzQ+28YtBqx+hB0AABE9K01FLYM/t7ewUlktuJiP2igmRQPg3SzLwNus53Ak7sFxUuMC1Gk0u7e
	wymxaOaRp54T7RNrTAsxqVyJzRU6/6+SjNigMUS5uVtzNrQUi8A923oII2MkubGtmGw9RUkP26x
	ETQK9wk28ryOYEMUSBuoFh0wAor/9Ny0so22ePF/bWDzd0w0JFgpxzBh82h5SvhYjT9tUKSmGRl
	EkVPuAkpGOewAyq7pm0lz0r5OZQDt6Oy2OqLPuB+WbpLwSWJZxOknr7AXJfymF2nkmNWyWff6AR
	PB5keQTe33O+x4NP1mM5yNpnIgUcegY11pZLjs/HGC63u3026PgDEft37
X-Received: by 2002:a05:622a:1e8b:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50b374268bdmr206504771cf.24.1774263386455;
        Mon, 23 Mar 2026 03:56:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1e8b:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50b374268bdmr206504631cf.24.1774263386125;
        Mon, 23 Mar 2026 03:56:26 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e350b6sm83525921cf.14.2026.03.23.03.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:56:25 -0700 (PDT)
Date: Mon, 23 Mar 2026 06:56:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] interconnect: qcom: let platforms declare their
 bugginess
Message-ID: <acEcV9wwfx0UjOQa@redhat.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-6-7892b8d5f2ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-msm8974-icc-v1-6-7892b8d5f2ea@oss.qualcomm.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Mon, Mar 23, 2026 at 03:17:22AM +0200, Dmitry Baryshkov wrote:
> On MSM8974 programming some of the RPM resources results in the
> "resource does not exist" messages from the firmware. This occurs even
> with the downstream bus driver, which happily ignores the errors. My
> assumption is that these resources existed in the earlier firmware
> revisions but were later switched to be programmed differently (for the
> later platforms corresponding nodes use qos.ap_owned, which prevents
> those resources from being programmed.
> 
> In preparation for conversion of the MSM8974 driver (which doesn't have
> QoS code yet) to the main icc-rpm set of helpers, let the driver declare
> that those -ENXIO errors must be ignored (for now). Later, when the QoS
> programming is sorted out (and more interconnects are added to the DT),
> this quirk might be removed.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

When I wrote the msm8974 icc driver, I spent a fair bit of time trying
to make it so that we didn't have to ignore those errors. As you
mentioned, the downstream msm bus code gives the same errors. That
downstream code was the only reference material that I had access to
when I wrote this driver.

