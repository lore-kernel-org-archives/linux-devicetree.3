Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8693B71A0
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670334; cv=none; b=auMG5SO6ulUVxY8iEx9jkVUtwsNp0HjwQa6o9KajD3cQ4a/6Sfx221lezBn6r+cEPKtFOyNRTT8T9C3zV60CQbaXwEi87Y33p9qOTNxfOi3o9Ci+rdsGQG+lC2w2SPu7c2AL21lu2u26GPBZlziqDYODgcAM/jW+X4nwvLT+GRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670334; c=relaxed/simple;
	bh=qzXYqaNZ8YacH0+RDZBrFejwkYxrl4euPf9hs7+Yt8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNE2Qcm6cr/RZRDPGCh3mrdGLWoSdtdNvH0yj+dpSRILAf02w41AniCXExTvhf9foFnJh+EQ+kUfcvbMpRM5hi0ff1OpEYQUJjJf/vHCE+Jq7srCy+Lagybuqi6TkXZ9L3vIeoY5oMzNrPVQkdeVaqwuqueCBscHlORa+k7FTek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BHn9bceJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gh6E+EKD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BHn9bceJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gh6E+EKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784670331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4/knV+I82RYJmpNZoc5ZNNpDHi7DOzo99Z4+2yaDWXU=;
	b=BHn9bceJGEymtvMBxoOp/rvTRNsiLxKw83XWj4BgM942qa/Impb6XllZLwbVpDvxj8vJw7
	HcULS+zhipRX3FKO4uywkSYz5Ro/K4wify9w4tjY5QvAqE+duX4TPJ3sNHM4TjpLE9WROW
	eTaOyxuExofiDnZUpXXvoSwgMX4pRRI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-fUb69I1TMLOnAUdJi-xdGQ-1; Tue, 21 Jul 2026 17:45:30 -0400
X-MC-Unique: fUb69I1TMLOnAUdJi-xdGQ-1
X-Mimecast-MFC-AGG-ID: fUb69I1TMLOnAUdJi-xdGQ_1784670330
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so116316541cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784670329; x=1785275129; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4/knV+I82RYJmpNZoc5ZNNpDHi7DOzo99Z4+2yaDWXU=;
        b=gh6E+EKDOkf+X515twa7YNj2UI2cH5SNSGFn8a2jmZbaImwjQnt3lRXl1IKyvY0MHu
         cNCTth8wzx6SiCxSe2afPuvJRpRBvFBxtoznT8pWHnzLcpeiut51xC74yvF5szB+X1LH
         fq3O0naFqDcCBYS/er2+e265dIcvKig6QRmyDyvdgt9WZX2prddhslSYNbdoHy3HIiQN
         ZXIc8gldcBJ8aSkLdSv0r3H/PcJk86yInWLdiPAaOpxEEZdOSG47YTKP+CsReUPELrnL
         KssZRWTeJphHwxjNCc2m7YXT5iOBkKDbPuI+Zq9zAikXPhwwYak9pPCQwa9NaNdS9hhI
         ayZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670329; x=1785275129;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/knV+I82RYJmpNZoc5ZNNpDHi7DOzo99Z4+2yaDWXU=;
        b=ASEouWUFiYj0HJipwGrl9L7lzvQHw8/Ybt84+pPyBUNk/cdTMz39PmNivkA88rygxs
         b9c5q9LeQ0xA9GNZ+4rh1oIk7Ftf+AYff6bSAxZcaO+YoyOiNIYpW4ENL/cN1MiOlPta
         osH9ozu5DXvOlyzep4TEi02nXsdr3m5O2An97SRlMWk+Ivd22tMwuLSybuT30fQKIHsd
         Fc//FqLqh81ayxpeVpMCLaxATCxeMnKNzx8CVQLwEsogz/P6sZvj/ADqnXqtEbZt5Wz1
         /mEBr4gkASNnSL1WRyR0uPq+9enTSPJ2o2rc5+VJilvaKjLnC2cBwUzgjmVSXTxTG5DW
         ZENA==
X-Forwarded-Encrypted: i=1; AHgh+RrnFbGlwj1ON/iICOYgc8RGdHzDwqFKXtGv0CX6uSge8N77B8b6DdYY9QvsCNczf5NU47kUj6FTNB3F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6pVcHn24yX3adA5mYu7QWbYr1A5BtbrgU8KY6lXucOJlfdO0E
	S9ZbCKxYQpliL0syn4e5YU5EIudswL9LXVT3P6rJx21nP30LdtXEA88Sjzyb+/VkXKEc7TtgTpj
	hg9oklk5PZ6x52Mg+NcGk2EbEyMNLEZ0Ot0C26YCLfzkbcGumk4uy4BqVa0vRSaitW1sxfsg=
X-Gm-Gg: AfdE7ckeEgXScDRIlri4HmLrcfzAVf2l9WSgIvVWnTiU0pzNteSJgGOrtInWsoeK5VW
	CVSxuuolTfaORI3oGGSTJIyOECmSbQc6n7zxdBDNrL2rYMlrGiNf2/+rI/6noHJDjllx33rnvKW
	hysckiSFbTjm0t+NWEo3pjJ84qYPxwCqYkrfUTpXEksmK4gnUqF79O1rFBZqnv851SPYGpJJZwb
	NxyNml3iPDDnTyCEpcob3gsT8MefgdLxwKwJa+Vn4k9dyJS7P0kh6pIyEIohiaH4OzAc9OTkFVw
	lElurrbQwqLAQ3/KLiWdyWwHB+AWnLWeuA+iw5mQsgY97Li12JYYrmVS2fvFDTE/kzRjFobGIfN
	sDf9xYx+IjMcKVc3uucS48AzRYF+1P0BNLio=
X-Received: by 2002:a05:622a:17cd:b0:51c:7b12:1209 with SMTP id d75a77b69052e-5213f6687b5mr187303321cf.87.1784670329639;
        Tue, 21 Jul 2026 14:45:29 -0700 (PDT)
X-Received: by 2002:a05:622a:17cd:b0:51c:7b12:1209 with SMTP id d75a77b69052e-5213f6687b5mr187303001cf.87.1784670329212;
        Tue, 21 Jul 2026 14:45:29 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e13d1sm5679306d6.28.2026.07.21.14.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:45:28 -0700 (PDT)
Date: Tue, 21 Jul 2026 17:45:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: wangjia@ultrarisc.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] clk: ultrarisc: Add DP1000 clock driver
Message-ID: <al_odvEwqk2f3h0w@redhat.com>
References: <20260720-ultrarisc-clock-v4-0-fe639d63bbac@ultrarisc.com>
 <20260720-ultrarisc-clock-v4-3-fe639d63bbac@ultrarisc.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-ultrarisc-clock-v4-3-fe639d63bbac@ultrarisc.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Jul 20, 2026 at 08:38:06AM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> Add a clock driver for the UltraRISC DP1000 SoC.
> 
> The clock tree is driven by a SYSPLL and provides fixed-factor clocks for
> the subsystem and PCIe, divider-based root clocks for GMAC and the UART,
> I2C, and SPI blocks, and per-instance gate clocks for UART0-3, I2C0-3,
> and SPI0-1.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

