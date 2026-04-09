Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4FF1B4257
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 00:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775695300; cv=none; b=LuF6cbEl4uDnhn01nGWwkH6VnzH+ImH+/sxArgLfmi8RVT1gzuLjdksw26pj+IryXbENVZibFda/7RBGJzvWBB7io7lKEIqifGKAqb4Lwp1rVby3KZtPzlkj1ha9S4n6+GnrR5r4jNwSc9PK0kNbArktCBxKWB0jYcSDEQYoqJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775695300; c=relaxed/simple;
	bh=+eoQlwxmrJ0yU0sRjyQcMuovdOk6IVOb0BOsgL1htYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtVnubrecEd7+y/MifVGVtecEg9XK/VmHR2Duy0O4qPOvcYAmSgxDlNEYNNj3XnO0h43Ulu2oxiDI+KUvxZcY61DbnK5Doz3FWogzAZQ3FEpnJIUVHBzKl1zb/Ns9EVfgqgPkHNsbl7BX5w3ttzvbQuQEdINMhGCkk+vfsBtTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WTihPDik; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B+P1FK68; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WTihPDik";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B+P1FK68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775695296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V1dvJSTg+CsTdLcj8Y/DkvdTOLgIncY12oieKd2qC/U=;
	b=WTihPDikIQYtZWBzh8P/wifEr4qVeW4XUo8BJW7WrZ80QZdnEvCB4vGcwPlPV4rQdd9jCK
	vRq0qIPalD7PU242MZ4Xdv5AAFda5LrsVR9ELyyBlqrNKVnfO4/rc6X6TIE8qQJmy3xMzb
	kgnCTibNYhc6/MwhmwZhu3YC3se3NSk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-BMHjIpg_Md6Kt_4nR5I6VA-1; Wed, 08 Apr 2026 20:41:35 -0400
X-MC-Unique: BMHjIpg_Md6Kt_4nR5I6VA-1
X-Mimecast-MFC-AGG-ID: BMHjIpg_Md6Kt_4nR5I6VA_1775695295
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfc1bc572cso78507985a.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 17:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775695295; x=1776300095; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1dvJSTg+CsTdLcj8Y/DkvdTOLgIncY12oieKd2qC/U=;
        b=B+P1FK68VyjTDVaWQ2judsMLUsCNrG9vXMeA8u2gg1PP+1A9xHeJOprDke04WUnPZ8
         YL3e0Dv/nG+lDcUUcBt6vh5ZhcgrfSlOrPKrIZ1kF3NSuLYIMvUoDUmtJGk6BlE1cnF0
         TnEG1QJ/Ng2OdDNvIcldiRlrY6WujFW7JzsEcRDlTMkdHK7n4HDZcS5vOcvRbcaTy+c/
         53eymz7gJGqGmj4zvGUC9sM9otaxRAnBOlKVRwDBZBror78chQeafp8gFCpPtSHItIuH
         eGWJDhxgL6amgFIUv6nV74l5LAwP9JFmXzb3GYC+Q/5/bGWB1goM9AGIE+JajjyaoWog
         PtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775695295; x=1776300095;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V1dvJSTg+CsTdLcj8Y/DkvdTOLgIncY12oieKd2qC/U=;
        b=Pjlqus+jXZ/VoTbq79y+eh3fbzEoaRqlsSDVDDu9rZCxyo3YMn9z0p3/4E4mxm6dTl
         K8uE/ec9+UeKKPhtnVC5vt9hKwQ2HqVI8PHuV6Lu0urnTebhQ6Wmmhru6jVjpbqT4dxN
         +RFEVlasjXsvM4WC7IAXRF4GYuTUZ1ucK3npHlxFoCt4SzVAmDNGtzvH1ErgdA1hjffn
         Q78EsI6SlLr3p5IxDuVjDZ6GBaKfbFCT6OuRRdtnHy06WmM76IBUT7HKI4mR6oVLMGg4
         HuJbfo01Eys25uZ+ikD2j7Cq60tnzpiy/sUshKIuWW1KG8KaOrcIp+3CTEu/2J4dDbCM
         4l5A==
X-Forwarded-Encrypted: i=1; AJvYcCU9a3Ho+0IXt+G56qV0KGtkSqocWA/BWjgMNZy4nmUtbVyMMpBqJmnrpbil/uqwQ26im3mVxD4lq2kf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1NFXWMP2XdT76brzif4VRTiH3+c00/EnCI91U1RlGU6OYQd7
	W5AWpNUqSBdLWzTijjd8tSWUwdCZgY+JyVTiGLspG56BHmiJreR6HT0s7JOU5BQtk4HvgxWiuf6
	nyghoHuzbn3IId9WmCC9fnrGpyen7E1MX/c/Gf5ZFDoaU2ASmMGfw3FoGRbA9pHY=
X-Gm-Gg: AeBDietweHgiscdww0jG3ba2D5jG6kXbWQ5oW4tn2jRgB7oCTXi3emirXje6KR34xq3
	8V1tHl7Dei7duws4g91q6y8R6XqFlCbAGNhTiuOGFH1JDkW9g2b2MNreyN6znAGicOp298HJsnd
	RRJKFwYfcCfrlqrLH1G1mUx9dhVsGHDgGfBCZ60hzJ3MzuV9p49cNc9iobXvVU2i0gtu6tF06+E
	3xcVs/4584ctxq0sBTo1IknaS2sraiyKeR5HwTMd9Rv+X0q4vw/CgOD4YZ00J1EvSEn03jB+LnI
	SyK5hsL5msoH2ZOD012DsYJmNWmygO35qNITjr8KxZNm1DM7Rci95T/bSj7fptguothDodR+gvw
	IXG/0CwrbRHyBntaJPThB8MMk2JR7e0xSwFbVfKmvcUmkPjVvwLL2b4hi
X-Received: by 2002:a05:620a:1995:b0:8cf:d7ac:1893 with SMTP id af79cd13be357-8d41db4cb38mr3237515585a.36.1775695294927;
        Wed, 08 Apr 2026 17:41:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1995:b0:8cf:d7ac:1893 with SMTP id af79cd13be357-8d41db4cb38mr3237513185a.36.1775695294390;
        Wed, 08 Apr 2026 17:41:34 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8dae66c0c23sm344881185a.12.2026.04.08.17.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 17:41:33 -0700 (PDT)
Date: Wed, 8 Apr 2026 20:41:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] clk: fsl-sai: Extract clock setup into
 fsl_sai_clk_register()
Message-ID: <adb1u3Ov5_H081e5@redhat.com>
References: <20260409002952.319668-1-marex@nabladev.com>
 <20260409002952.319668-5-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409002952.319668-5-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Thu, Apr 09, 2026 at 02:29:05AM +0200, Marek Vasut wrote:
> Create helper function fsl_sai_clk_register() to set up and register
> SAI clock. Rename BCLK specific struct fsl_sai_clk members with bclk_
> prefix. Use of_node_full_name(dev->of_node) and clock name to register
> uniquely named clock. This is done in preparation for the follow up
> patch, which adds MCLK support.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

