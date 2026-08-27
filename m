Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC2737C92B
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787839348; cv=none; b=QdPGPXKhYzikYMtQqbPh0xhAdCBEYj+zPDLhMnZIudM7DgHuRVZb2kjDhvnIoTJBL4NhcKSqEbZZpHpCl8nxbTvOI7CCv000KPk4nlAHAQSkCnenWoWZ4etQ2akBIgjR+lonuv7DKXFPsB/nBu7tVcmuEru/YU6O92i3rTdMcEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787839348; c=relaxed/simple;
	bh=svxFq16jhgUwujetnMHf4NGpGV3nz/ISyT60/BUazac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvES9d5Zzofd0hSJ+eJdHL25kH865ZV8PZwFm3vRW1dZPMmku07z+tTG/iCIzVYXPdyv9Ro7qXr+OlXw5rVSq9xEV+FDZCL/Ucy1N0YY9WXEMlCzKtxl/gjmePuB3r3Lkb6O0wo3KiU/r3nUsYm8uUo8ltgTqqkgMXoANpxyjTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUJ6aqgd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUJ6aqgd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so2206590a91.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 07:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787839344; x=1788444144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eDQwLy7w6jGmaKdMCoLcam164nOHb3RGtOUt5TvcQcg=;
        b=aUJ6aqgdc7lB0MYT97zhFm3BKF4VbtAUUU+rIIKwxCq5DLh0YDVTxydMjSS98jsuz0
         igirDowxj076/mH1COYePoY1V9FOv/WRBYZzKhBL0q9uprhWrdk64lHN2wBlJHEYFJtu
         i9Pz/9Qn8rWil2mCwxv8yfFBsPmFU4njR6d7QKzkue2zZ0OHTveI4Vr6eFcMmvWDOd6J
         2gxaf7A0wg5vHnX/zUxkVbtGlpob0Omfv8nuKdyLfCZtbyqff2413FvB/Nwb2pd0Ijbs
         ZSohLWE//HNMvVy018tgKtob6dL9zUzRgmhaO38WMaSBZTFxOTGAkXarbvEjBwAJyh03
         zoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787839344; x=1788444144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDQwLy7w6jGmaKdMCoLcam164nOHb3RGtOUt5TvcQcg=;
        b=EUNOqP6Pw7JhaKQWGjhmMVKQZhyb/rbJKGqeAB08tWSAXCiJ++1OGl+AYbrQWesHFl
         UtmclLKMVVCM/Y0ahGJrfqAmWjvONbdQOjBy0gws5aEBVVvjTPf51n5/sxDb6Lp+sXKe
         gWXA/cPv4bdxqy6FWDf8pApxqX68zHoK+L6q9GDchzDeNmTFZrJLUi5DfVFuk1jGr2rZ
         ebJjsDEHPM4UA4yMOqThCYLiELh7gGmAu80jJlWzinGJaD03HHKIPL3JE0fVoUwXj1KF
         6rJRouhHLV6Gx3fw+lim0lpozcAw2TGmieY39haHqo3yixL9R2tXkcpCCFrmO7szbcl2
         6NUw==
X-Forwarded-Encrypted: i=1; AHgh+RrBLJ1QmxVja/AbYOnyH7H/W48uyoGnEC4uW+XesDst84mCyUkYLxxwRZk6ZHrdZPMMYmCYzwZQQ+J/@vger.kernel.org
X-Gm-Message-State: AFuF++mY+oTk3059K7BhPi5RkRgWfNRgMNk/tnKPBThkzX60X7ucZChf
	ykK2jrjubtk6fCEnn5yLJI5oz/Rrrz6AH0GpJUTB3MzAYnCD0xuJ2tmD
X-Gm-Gg: AR+sD11KqiA3n3Z8m1rzdqYgec3cEmEKZQB+uhKzMrMG5pY1gUvUlE5UGGRlSl2zhJv
	vUzoylu9yjKJN1AKhB93BK7+mPowxDP5TQciGpCgVj6xUV590clffTE/CtF+823cX+Sp0FmEzbw
	sXy3akaylojS55DQcY+aVlYF3C7z1RQdk2NOezXmMSRde2JfDRqdFIpx5ftFMY2TymdzwU+3vTM
	bmQpBJDUovMe0ivQw0JoxeQ82nBtpf7/J5xFnXG1yAHeTXFwUEAY4e0WPqtdf/xTdpEyH5D+vTL
	rRZbtTf780cMBpMb1wj6rRhDesdms2gr3yZYo0TErh7riRblYnlCoPfyFrcN/Jn6mvDq2tGJzDi
	gX6tK58NGc1QVwP3oZy66IdkfvsHdsHrBmYr7sN36sTrlhiQ5cCkp4gzsnqJwH4F5Gs7ZNJ5WX3
	Z8+jps+pdJfTaZTQ1DHWhnekKi7KvZpL24hX38w7yIV4yM4vkbU3OEDwla1/9qNhsRrXuM4mQ2w
	Q==
X-Received: by 2002:a17:90b:4c8d:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-3966d1443a1mr31804030a91.3.1787839344389;
        Thu, 27 Aug 2026 07:02:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396759cab6esm2023470a91.4.2026.08.27.07.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:02:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 27 Aug 2026 07:02:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add
 CPG/MSSR syscon support
Message-ID: <9c9982cf-6fe9-4904-b75b-c0725db5073a@roeck-us.net>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Aug 17, 2026 at 08:25:37PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> resides within the CPG/MSSR block rather than the WDT address space
> itself.
> 
> Previously, this was handled by including a second register range in the
> "reg" property. However, this is architecturally incorrect as the CPG/MSSR
> block consists of two distinct regions (0x80280000 and 0x81280000) that
> contain registers for multiple peripheral blocks.
> 
> Since the CPG/MSSR block is a multi-function block, introduce the
> "renesas,sysc" phandle-array property to allow the WDT driver to access
> its control register via this shared regmap.
> 
> Mark the use of a second "reg" entry as deprecated in favor of the
> new phandle-array approach for SoCs that require WDTDCR access.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.

Thanks,
Guenter
