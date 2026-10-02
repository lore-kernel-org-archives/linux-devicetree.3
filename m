Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF1B4CB8C5
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953921; cv=none; b=htl9K7FvT0VBr9k/DVj/Vw0mj1LwAIUp6voaMLQCB6HWbLqSP3ADWVvZrjWx5SqArWCHNNiOoFf+YtxgY0+Zy+wecMZ1c7mMgczUcygOsBSIkl6x2qx4IEiedgCuyDNcNEWQTQKk4ZNEtuBYGVZkTDcEwdbf0eeylLjW48ddpSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953921; c=relaxed/simple;
	bh=BXSTojC4lp2VomfKySiwbSrWTs82k5is0N7A+po482w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKbLYZIqKK3Zw6pZtCitkOzZBSr4+4Vv79QkjSd9fPDIvscm63R0srAhaVBbhSV2qvOATEXdfGtTZoQX2wRHb2jUgaVM/NXzEQo7AwWrgPR9bsDPw6NW4cLqrRZmI2UDwu4WaPVAabS+DGrRvXf/6QMWi+BKP0fN32wFvPki7kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GrOBZ3DC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pN/gn+T8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GrOBZ3DC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pN/gn+T8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790953917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWmLd+rLGF8wp2MGoAWUFRqguzK3p2qoTL1+rkmSfkI=;
	b=GrOBZ3DCcTz+fLX0P6vRG3M6AEd8qeGvuVNAeFxscJZtchngQfND8TIg2N5YtTl9iKpr+G
	3/OmAnEhl/SxPZeDulKAtN7xTnlrh7SKv76WOhIZ1ImiZ9ZKnPFcvWmWOgdFhhCCHV+qCO
	vE1QzMrYCpeIBFfUWYroN4wDhLh2avE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-U-0XkOarMUi3DW9_Rp4gJg-1; Fri, 02 Oct 2026 11:11:56 -0400
X-MC-Unique: U-0XkOarMUi3DW9_Rp4gJg-1
X-Mimecast-MFC-AGG-ID: U-0XkOarMUi3DW9_Rp4gJg_1790953916
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c58ee2116so1456331385a.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790953916; x=1791558716; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWmLd+rLGF8wp2MGoAWUFRqguzK3p2qoTL1+rkmSfkI=;
        b=pN/gn+T8xbN49zVpBn13gV7HsChE0Sk3cphEVrJs6osThGDtD3g6Lgz1C6Cd3QGUgv
         MUPECoNqBLI01vuAuRIC8n+w0cgGF54xvtuOQnRnjB0CxI1Mvb9B1zdpJXJpqfNFpgW1
         WHQj4QaDtdebuPXIDE2Cry8FHWzriIquA3mjygGbwbLC1/s/lY+DmmUm/MiK4iAT9LBk
         D6tjdknJrK1fxy8r3z6KQ4saHba56h9gixc66poY6m6O1bQb9BzWtqO2NVNlwBq31LTj
         D7dh8u8EpHM1OOwAJIaqafKgC/uqZVd+n1VcOcVl7TuQltSMBnOqzdkryZBnY3DiK112
         NUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953916; x=1791558716;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LWmLd+rLGF8wp2MGoAWUFRqguzK3p2qoTL1+rkmSfkI=;
        b=nDlKxv0QXkQXvkoo2nqRqy0CtbgrcTjcHeOUc3a32i1MBUYUFHhmElm8zMULLwZdnr
         ntAgOvlIKlZmNbbJFJtM0cDSbaealFdKnI8ou7q5s+u3laKuwdSNYhftJ1d22RLc+6TE
         To+wZ/yTn4UfXteYvPdY1CXlp/+jJ+kfLEbOHJv47CO3B2HrFP7OGDwj7EY+KzskK1H3
         kEpkbq6pdagkX4DKdlOOn47lrv+vpQ8HagghHx7lMURDIhxMUWuN9dDUScF2U7bNkFk4
         VywomoBybnU4xI9HcHLHKG+1FczYAdkb3k8wU1RLWlzCwaSVDNb8a0JoeoDtH6dtl/ru
         E3Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzMzmgVsuaOsUrUXaz4fooaH4qY8u3tIQ8PCTv8Ru1Enjdmvcp+B8KK90d7+MGSXiBmHI8hc+D3tq4D@vger.kernel.org
X-Gm-Message-State: AFuF++kwuz5MVrom0ChQX1561+Be2qQ9hO6d2dSxLm4yQtw9AS7PeMJC
	T//2clWGBXGuoOYFcGBV2uj8Yd4Ow+xuKSaDkmeDjTVGrrbw0aiZjmYXb+yXy6vPF3YvqUE8lHT
	YmBANc2W20xqcRHICPiJjdftcvq2DaffWUChue65F5fA16DBF6jNbNpTNMddJjus=
X-Gm-Gg: AYBFou1cTWcDhjfC3wxVRiYqdn9SdY/SMWvFAgawYVWc24W5FhGdjpl8B0nrHKtcqHt
	r8ahflqT0rYkJdpjgblDnY6YQ63gYYga2WkC+ZZ4BNvxxD1yaQtn+dlPMbktYHlki46c9knNOkF
	Fg+FkAqwSczwFDzzXiYG+nLjQpIIXUl2eQ/9ndhqSuNZmSqXrS7dwsLtBIGRmO1TpYMjt2OE7yk
	bdKOFi7o0Q0pD9qnJSKW3GewxuPRutnqcny8CWMtx8naEzBAfgDvosr8kTkzIiuYcft6T+6c41G
	0wKevz0K7JOpmqW+1ncxYH7DeuWINbVjDF/OT1PBkRVQVVU4mPcQxIiZrv+xxCgSYEIoxj8TL2D
	AEMYfD134wqSoPMTvZi+TcoEmGul6qp/HQK4=
X-Received: by 2002:a05:620a:26a6:b0:93c:5efa:39ae with SMTP id af79cd13be357-93ce7c1228emr548897785a.12.1790953915755;
        Fri, 02 Oct 2026 08:11:55 -0700 (PDT)
X-Received: by 2002:a05:620a:26a6:b0:93c:5efa:39ae with SMTP id af79cd13be357-93ce7c1228emr548889585a.12.1790953914967;
        Fri, 02 Oct 2026 08:11:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a433dsm240505285a.13.2026.10.02.08.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:11:53 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:11:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, mturquette@baylibre.com
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver (v2)
Message-ID: <ar_Jt4eIPy1-uq1-@redhat.com>
References: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hUBEMGo3TGyVsIj5LaphmQ@gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Stefan,

On Thu, Oct 01, 2026 at 08:39:27PM +0300, Stefan Dösinger wrote:
> Hi,
> 
> This pull request contains the device tree bindings and clock driver for
> ZTE zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and
> adding drivers for its PLLs and clock tree. This is v2 of the pull
> request, based on v7.3-rc1 rather than clk-next.
> 
> The patches have been reviewed and carry appropriate R-B tags by
> Krzysztof Kozlowski (bindings) and Brian Masney (clk driver).
> 
> The PR does not contain the MFD, reset and device tree patches. They
> will be submitted to the MFD, reset and soc trees respectively. The
> clock driver compiles without them, but won't be instantiated without
> the MFD parent.
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/v2-zx29-clk-for-7.4
> 
> for you to fetch changes up to 75e4151c9e157d84c8c6c365893ecf33d221bca5:
> 
>   clk: zte: Introduce a driver for zx297520v3 LSP clocks (2026-10-01 20:20:43 +0300)
> 
> ----------------------------------------------------------------
> clk: zte: Add clock drivers for zx297520v3 SoC
> 
> This tag contains the device tree bindings and clock driver for ZTE
> zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and
> adding drivers for its PLLs and clock tree.
> 
> The PR does not contain the MFD, reset and device tree patches. They
> will be submitted to the MFD, reset and soc trees respectively. The
> clock driver compiles without them, but won't be instantiated without
> the MFD parent.
> 
> ----------------------------------------------------------------
> Stefan Dösinger (9):
>       dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
>       dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
>       dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
>       clk: zte: Add Clock registration infrastructure
>       clk: zte: Add regmap-based clocks
>       clk: zte: Add zx PLL support infrastructure
>       clk: zte: Introduce a driver for zx297520v3 top clocks
>       clk: zte: Introduce a driver for zx297520v3 matrix clocks
>       clk: zte: Introduce a driver for zx297520v3 LSP clocks

The commits in the pull have the changelog in the commit message. For
example:

https://gitlab.com/stefandoesinger/zx297520-kernel/-/commit/75e4151c9e157d84c8c6c365893ecf33d221bca5

I went to the last series and cherry picked the relevant commits.

Brian

