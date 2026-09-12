Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811EB18BC3D
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 00:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171713; cv=none; b=DHkJujd00QUbGgx8J0Pc1xYYh4LwM/sTZ1eeEEdDZb2J/lIcI/XaN5KHHBXmBQyoS75gv2IM+Jz6Pk4fLoO0sJeGdDcofhRKT2EgBy0SgxUAMtxHxxsF4jslBH7zOZ3outvDxRuNPcdp08AIsO72BJKt2jOT58PUPDHCz/XRMsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171713; c=relaxed/simple;
	bh=qg2xXIZS9q8+FQ9NaVnqQx5QGT07BCa7Wy5M4wefSiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zrj3+TjmqDz+JLRtuM1zamnxK7Jfe9LSuPoVonJv2fezER7B9XNT6k+s05t0LNvdTdwaAmXmCrgP+yyDPJo0KQWxJdYy+d8tFvw1JxbuRaSe0eY+ZeqXMIcMPjsJDjfCud4bkXRqw7OD84CuxDzVJfnUdvsjGHzdyHrGaxrS4vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8QQoOva; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Viu3DDxX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8QQoOva";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Viu3DDxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789171711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r+e6U5jGD86yqBXhoRz8wqGY9P2a9TSeSSbA20YZjfA=;
	b=g8QQoOvacpz5TJpghxmtMh4vYA9oUyFX8TR1+LEfoEFYiZgM9nXw7jn3ow9X8027zWdS30
	9jRwi4hX/yQXCS/sWJsSVO37wjhF8zPiwtsIWrWReMq8d4r2YRfsQSrp7fcg5r0g3ICKt1
	I2by67xdUOx38q8aDGGA/aSVqjmgkO8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-HFUFmF8WM4icp2fhi6V-QQ-1; Fri, 11 Sep 2026 20:08:30 -0400
X-MC-Unique: HFUFmF8WM4icp2fhi6V-QQ-1
X-Mimecast-MFC-AGG-ID: HFUFmF8WM4icp2fhi6V-QQ_1789171709
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e87478402so32760236d6.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 17:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789171709; x=1789776509; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r+e6U5jGD86yqBXhoRz8wqGY9P2a9TSeSSbA20YZjfA=;
        b=Viu3DDxXEFGseBmlMQxMTMPsPIU5fm7TqvE41+LFBzPYL/OgcGske6+LVxjTy4dAeQ
         BQrOTnVZ5oV8qLKQkBnlBtlqng1jsY2bi/9ciT/J9Kzx/VsHOQYBvoSLtJ/qS0cvEE+X
         cvKpWVW8rJMDRURfHcSY/XziCouHIzHN7ot4vpR1Vilh5kGbYBbonZ96ilqnFexC8W3n
         U67O4Q9XxKQk/rGpJAHesCcFJ9WzDLsldcj39Q7MoLOBp8CpO0emtchNK3Y/T/gTTdsY
         9uY/D6a7DebBXx0ofSvCkDEg/dhAvQlV9KI0RZq399YVtCevBgJn1SLVEJNOEXD0yc9l
         +X9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171709; x=1789776509;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+e6U5jGD86yqBXhoRz8wqGY9P2a9TSeSSbA20YZjfA=;
        b=VKs0MsVnUV12ZphkxSipjXANLhgCz5PejD+CPkMjxc6Jxv6qRFGX5OP3RixtKU29CP
         hBdbATeCKXIC3kG9XN6WUNJrtXzUPaGRHZ9YJFOYGGaA7FIq5RMOrNXQgqszzbVxx+IY
         TGO7QTLUHry5kAlHCifl9ej9H7+9qxMucPotIk6JSDXImSfX9Lubt/mrIhqeU8AwLFcK
         GmCHajariGSLr77A/HznMehjaQL9mtHrDluoCp/oNTHKoJqfkf+kreCFSzvBLb4zhCf6
         bPmkZMeX8PYxiD9UkUtVntTluPRa9NSCuYFRpaEyxssahaYkrkWkAV7pZwOW8xxf+VQ0
         ydLg==
X-Forwarded-Encrypted: i=1; AKwUvBxFG/EswTa21eiOM0kMUPTO9XNSY3AxN4Ltsu/naHBolZs0Ou3b9wL42Xggk3OoIgpKi+UfQbyKxYJI@vger.kernel.org
X-Gm-Message-State: AFuF++lNivCPIRD94Is7B/vrx5nEavbCfapgJNL0//3w+w6KIgZg6Eh5
	ErEkBqxFEts/9NmDsRH6gtp3mDiW+7SdSN0XP7QDSCQk4rugleeqG5HYXA9bc1UbyEGqeY03qtG
	eaHXU6eRZJf0qzwlWlnelRmiiBLeRW6qv6n8OpVDulH74mxfpKnOpFZXT0+weWvA=
X-Gm-Gg: AYBFou2anpb68S+dbxfWs2cigM9rU3RDXjbyo2Km8PPn1Hi7N/zm3jvVUi0++Za5cCP
	GbWugMTcRE5yQoL0lnFZbOgsmQow4tK9EaZ1J3PCblfu3Ac13QwtLiC1R03tkoB3sS5KQxwU7AN
	FJjBFyOJKCSZu74eWOI+lOgj9JL9lIKLSkgUrbu9ob2ILOTsWqbH9wIWsNVgeA9ZKRpLMpRJ9hu
	Kp62geL1fKbb5FEmct9Iw0HH6Eq+AvxP8tNxOVp4RFfYr0tHbtUt2GrL3Zy4Nea6ym2aHE+3zzG
	0IlGVWIZh1lZRq+W4Dn+TaZuEqibRJvTewS6F+8yZrEbtN4o0bATVcsfjswpNpdRb5DyRKA7EN0
	a1Qk3AA9uqc0MV288BcVc8O+Dp/GsaaAeL+I=
X-Received: by 2002:a05:6214:2307:b0:910:722f:b8b with SMTP id 6a1803df08f44-9121da7621emr10925436d6.21.1789171709457;
        Fri, 11 Sep 2026 17:08:29 -0700 (PDT)
X-Received: by 2002:a05:6214:2307:b0:910:722f:b8b with SMTP id 6a1803df08f44-9121da7621emr10924946d6.21.1789171708976;
        Fri, 11 Sep 2026 17:08:28 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f20367dsm32915306d6.6.2026.09.11.17.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:08:28 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:08:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as
 critical
Message-ID: <aqSX-kUvYaixESxe@redhat.com>
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-5-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905153234.133217-5-tanure@linux.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Lucas,

On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> identifiable consumers - the three MMC controllers - so marking it
> critical was the wrong tool: the clock should be referenced from the
> consumer nodes and claimed by the mmc driver instead.
> 
> Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> have no single identifiable consumer.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
> This patch depends on the MMC controllers actually referencing the clock:
> the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> clock must land before this patch, otherwise the boot hangs and memory
> corruption this clock caused are reintroduced.

This series should be merged together in one tree? Which tree? I can
provide an Acked-by if it should go through the mmc tree.

Brian

