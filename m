Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ED2426ED3
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818375; cv=none; b=IJ7lkIFmHcDMiNjt4htLxc2B9/M6zvnHWd5SqvGS0G+zBZDctHoGzYaKbNVtgCCE4mQ4a1a/XEyAQaZfrFJFXNoA8Yyuw5chRuuhuTLye53Ck06Wq+oYwrkuUI3U38tWluNjVbpv2SKIQTtzODUJusloTNS4NZrV9aywto2l8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818375; c=relaxed/simple;
	bh=S02hdHNrlyNXo+DoiglBQ0OphGNn6axHScvr0PU8oCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REj7Y6wCXyjCJEExVtEj68IERcoxo0WZEzTeECaKMwEBwwuUVff95nW4DQATrFal/FgjChFR0F/N5y93lpp8FKUHxWUsX0vYO9rm4yPJ5GCTcYiK8NMkrRXBND7MpH6VKbyYJgwCT13lYaJ99jL9hRbq5fNRPZsx3BJwAP9xGLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VBP/XVmP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pv/MlFTj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VBP/XVmP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pv/MlFTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779818372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0WlLC0Nh1azJwNxju4dNnGV/Z/3xMSajCPbgT1W2wo=;
	b=VBP/XVmP+SaxyFbVBWkbkQSNQsiCdVXNv5glUvgNgQQwqaUXOQYj+nHTHBgbVjOHFaSeoN
	ADzYyYyFCmhSMwFmDjdkBnNj2k5VndlDB2iShW+mEQC4G7Erx8HGEI89LyXpVKJQk1vvXu
	YUb6mWQalEiBKs8i3ZFbIG1Eze3jJSw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-h0-IwLFjN56yM52IPxoBAg-1; Tue, 26 May 2026 13:59:29 -0400
X-MC-Unique: h0-IwLFjN56yM52IPxoBAg-1
X-Mimecast-MFC-AGG-ID: h0-IwLFjN56yM52IPxoBAg_1779818369
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b49260e3d5so8952206d6.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779818369; x=1780423169; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J0WlLC0Nh1azJwNxju4dNnGV/Z/3xMSajCPbgT1W2wo=;
        b=pv/MlFTjdDnmu0LUbzE3W3hn9NPfpVVGjo+Qx1XL0TkjsY5n1q/ndOSvxhHL1WVABC
         iHVgaZXxaU19Ow/tbou4Vk8SMGjHginFkJvvbp9vHU7470h5xH49iB8Iv9sU2PcwfoH4
         JfIjOYhMOx/jjmHqMFKt/qp+T32azeFkAfZo07OLjyQPR2BKN8Hwqo+Q8q6PrRb/9gR6
         dEyhPn07iWAmULChaMHCL19D8UlLrWwLpqHPHzPaLbvMOKU2q6kMRJW5D5bze/c9xbUN
         qzeX6s92O6Ed3+6mD7cIihn7QpnDNQfqhrIilLv0X3K+0F4shgI3/mnnUHMx92qfPLiT
         7Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818369; x=1780423169;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0WlLC0Nh1azJwNxju4dNnGV/Z/3xMSajCPbgT1W2wo=;
        b=A5Zt+oM7jYR6S09GsYnlssn7gMvUOy26rUH3R5gZYyjFkSopcmqXBhPUVRU910hFix
         Pzuy2aKCoebzmocNYhn1K0wYteUKGhYMJxzx8aT9SW/ZMfxlsZIgpnbCh9BL2Gs6o4jL
         CpBDlUljS5VKZW10teeva+KG0v/eejtLDGdjAE1BiMUv6PbyAhS3dSrxa3bNzJ6eIb1P
         w5uMf/fMkWm5WmqjF6q5tosmjB8XvWj1agVdzTHj/L8kwk9qR7LZp1I1eSOUdNPIOF1v
         Yje9z5ldjzBuCfsmtPboa582wXexzJEoo+HxfhCLi/G9wMp1vdvQVuKgYntPRPRTpv9P
         TWUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Q1DQkVpD8OaTcirsghwwpWt0eTjVRvm1R6//ndExwKiuv0cAPqVFH4FwJmMdgQDg8FbnoXMY9R6OD@vger.kernel.org
X-Gm-Message-State: AOJu0YyWcyU0kysdrAXmNDTvSZTUKRQNXVieVqs25Hi5J5vCRoIEe0zx
	FFCRCtgfPMPQZwXViXyAorxTCE3NVyUCAe7e5FiG3y2W1jYzcHe9PPwoFI8lQ6WTOi4igDaXSOv
	j7LovGcjMjXfod+CNwOxuxDE8eT1Cc0ORrpVTXNa2/EJ6SWKuUq437X5aWdeCe08=
X-Gm-Gg: Acq92OEODc3pW5Q9KViyhX8Bm9TMaMjIsOx7vNzHl4jusMIZOYP50Zk+Ha4No77hAZc
	P8KFZ6WapNVY06mrlAu2W0Kw3W9Exv5C975QsZveqx8ils39ROLEpuzm0P6Uvqa876EkcmYQPBE
	8Typ2lWowaK/UfrYkheYuEUW+IfKVYbBCthlOC6bs2DS/cYzdzgCRhPVkmrUDwF5+mhXRaFzFkS
	1mx34IOufYTLvJFX74QNBXRMOnD4tDYhgJD6c86TA26QlOcg7G9e7+4p1IB1UQ5IOGmI03NrURO
	uk1PAPXwFbzAnILThLwHH/nONtzpUn+6Qrx0GufjR9/E5mrEEY9cYHW0r+jLJrdiHyAV4XZBEu0
	GKzmoPKYZtzznhw9ugZr0RDkTGynie3IQYPA4q9KVfRhOz/dDImiMqIgf
X-Received: by 2002:a05:6214:450b:b0:8ac:7627:8a71 with SMTP id 6a1803df08f44-8cc7b645335mr322548636d6.49.1779818369325;
        Tue, 26 May 2026 10:59:29 -0700 (PDT)
X-Received: by 2002:a05:6214:450b:b0:8ac:7627:8a71 with SMTP id 6a1803df08f44-8cc7b645335mr322547986d6.49.1779818368684;
        Tue, 26 May 2026 10:59:28 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80decd3csm147576726d6.12.2026.05.26.10.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:59:28 -0700 (PDT)
Date: Tue, 26 May 2026 13:59:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 3/9] clk: fixed-factor: Rework initialization with
 parent clocks
Message-ID: <ahXfftxBTE_5LzEU@redhat.com>
References: <20260522-clk-eyeq7-v7-0-14ad6c2c5213@bootlin.com>
 <20260522-clk-eyeq7-v7-3-14ad6c2c5213@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522-clk-eyeq7-v7-3-14ad6c2c5213@bootlin.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 22, 2026 at 02:31:12PM +0200, Benoît Monin wrote:
> Use the same sequence as clk-divider, clk-gate and other to set the
> parent_names, parent_hws and parent_data in the init struct when
> registering a fixed-factor clock. The number of parent clocks is now
> only set to one if a parent clock is provided.
> 
> Previously the number of parent clocks was always one, forcing callers
> of __clk_hw_register_fixed_factor() to provide a dummy parent_data
> struct with an invalid clock index in case they were not provided with
> a non-NULL parent_name or parent_hw. Drop this dummy parent_data as is
> not necessary anymore.
> 
> This change only has a small impact on mis-configured fixed-factor. Now a
> call to clk_hw_register_fixed_factor() with a NULL parent will register
> a fixed-factor with zero parent while previously it was registered with
> one invalid parent. In both cases the rate of the fixed-factor is 0Hz
> but it is no longer shown as orphaned.
> 
> This has no impact on properly configured fixed-factors clocks which
> have a valid parent set.
> 
> In clk_factor_determine_rate(), make sure the parent clock is valid
> before accessing it because the mis-configured fixed-factor now have a
> NULL parent.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

