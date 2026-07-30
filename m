Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DBA3750CF
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429101; cv=none; b=gf3ataerQ/I4I+TJv1QCkzjHUW8tNre5IfHH0xQR1JVlr0qBK7Atqp60WhR5IOLrrFPEJaUtB3ixsDc5w+IZ5Kf5JSitPkb/2FHw+Fa/bIkYjIH9lK7L9V176fhWyUTP+4od4j0FZVWj31gq3BC2HAoHLQgRrf+vmbj5kQOxJAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429101; c=relaxed/simple;
	bh=4DEOhG/gAL2tFwgrO17fUGpYKuc98k4IngdS7c+uNb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYxDyhPi7uoPofFsFKXUv0D/s9q5A0FN3Lp4+A2SqMwaLIr6NkEasW4PjeTJp0LyaKw7bsJ8dJsKnUNdkGIqg6h8CzMAVGCczwBAwyYM239chNXZEnG1e7QGBLcu/qDTLoaDMBWty8TFEDcWzGPZlTIWLLuT22bGrLmZAMIXXCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c8O4hzDd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sm8fZ2JU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c8O4hzDd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sm8fZ2JU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XjO18nbJbiIjdwy1Ooeo07xeKl9j1Vrh8YDkz9Zjps4=;
	b=c8O4hzDdluaQ8yCLSRjdgDhxXUTQbOcw/7VaE7gZprzLfjzzA36Eh7xop7PVKJTDGcJyms
	IDTPHn80+vbAGQTLfWcGx2vmTPh9BNi9cNB02tMFvXqcalBwZS9qPIgV57fDwqrAX7M0/Q
	rC6KOA7xyfUz/jDIE+phwkieaq6a7bc=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-vcnk-F1qPPKo--DKMN5zPQ-1; Thu, 30 Jul 2026 12:31:37 -0400
X-MC-Unique: vcnk-F1qPPKo--DKMN5zPQ-1
X-Mimecast-MFC-AGG-ID: vcnk-F1qPPKo--DKMN5zPQ_1785429096
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66799e7a177so6451213d50.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785429096; x=1786033896; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XjO18nbJbiIjdwy1Ooeo07xeKl9j1Vrh8YDkz9Zjps4=;
        b=Sm8fZ2JUq5/0+nLOwRTZt1cwSorDk7k7eGR0aHfzMAXpPqk5v73i+mLB/O0bQjWbQb
         rgpstkGBIKPfQZRcbAOJpgh0DP8pXB8qw9l0gWJvik5C+0gAeLUeWGFBywa2uMAiMLVa
         A/4OvBCCDl6pqUCzFhIzzEEmOHVqjIqpYCxQ0U7z3iPpCT0eHhkshwpPeEN5nuecUMYO
         1Lr+iIQJ4STfTkb3PayxZnbSuixWCUK6t7HC/cz8tPG0VvyOS8qSBXZfphpffclZYQzh
         RGcGS7hul1Icwbl1qChqfG8bS9HiCkk40Oy/Gjj8C4clJsDlG7GceKHOEeG7S6623iOV
         wxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429096; x=1786033896;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjO18nbJbiIjdwy1Ooeo07xeKl9j1Vrh8YDkz9Zjps4=;
        b=dPD1V3KehvSDByja5DwKGnzehDEoJVg2R0UOtuCS3Tngdf1UUwNhxcZCZvmri3PDdu
         bTXGPyteNddXwFePHkOp3xLZHSdmdHuOPpV3UX9exRo9MZmdqL0Ld6FH6pHb26vDfQBz
         mTAtuQ7iValbWbkJOJGNu1v8PmiM53Hjru2FdlrhlgMI1IxjHWKLI2LG8xOWrcz5jV1f
         mZqgQbz7+jqcP/bsuyPpjUGQAUHWtTNFOwTFH4q2+QTbtjQyVJelLnrO1MXLudwp3ns9
         gCNYv69UeTzi+sBqpEkMrXeVyubw7Dm212dVM/X9gHD1P6z/usvpgFvkJhj3Z0Ge+VY2
         xb6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq6bVITa7JlOit9zhwX3+8ZJtr5+R7UFcNwUbEC1dmkFN0wklW4sYU1O2Nhei/oQya1sKjdWnvQglgC@vger.kernel.org
X-Gm-Message-State: AOJu0YweK0st6YI+4GsV8/F2VqovTi1i3JZfm0Gya/tWRdigVDOVKgEg
	gMc3QoOTiKkCI92rc4ckPkQk5ACdQEckhTX0VNJEQPZX2wKlqxcznxgJqFwjcTFnMdsDnIEHF3f
	bq/YWhQmlEcFTHRpCig2QMmVN/8ytuXTL/eT9na51LGiDF6qK9fTJvFM1GROhGFM=
X-Gm-Gg: AR+sD101Cvy/UGC+1nv4E5dxC8NfSmE2ZpwIQRlx9E+b+RbkylxBbM+49km2np33vQ6
	Wfkb4nOHIaFqii6Hn17eC59h5J+Xum8pjxk6gmKcFGPgduuEHo2+XzPtWRH+YACPIzD3dWqQ85c
	2U69cBFP5PcroAF1B71MrJIv7BCa8n4W1cb0JsC6zFhka4ExbjjfB6z/IXiglC9xQm3xtKTtVt3
	7Msv91t2f8oQw/ZjKYnGxTZiaWLS/GQyOxHiaXjkKZqQ3HjVG8+b3/UxO5GFwMf9mtghv0glMHd
	bp01Em2cyh4z3hD0WlBU/wVW4LgHkAw62yGPnKAADPlqVQUqAkZcVSGIY5rBA/1Sa0QfzoJnbgS
	cFtKx9PlytsEBj18QZLMQoxhevvEddu8rFro=
X-Received: by 2002:a05:690e:4809:b0:667:e8a3:ebd4 with SMTP id 956f58d0204a3-6693a328de2mr569825d50.4.1785429095987;
        Thu, 30 Jul 2026 09:31:35 -0700 (PDT)
X-Received: by 2002:a05:690e:4809:b0:667:e8a3:ebd4 with SMTP id 956f58d0204a3-6693a328de2mr569786d50.4.1785429095425;
        Thu, 30 Jul 2026 09:31:35 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c8e57f2sm1632516d50.13.2026.07.30.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:31:34 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:31:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 05/11] clk: realtek: Add support for phase locked
 loops (PLLs)
Message-ID: <amt8Y84Z0O3ZEVnk@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-6-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-6-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 28, 2026 at 10:28:00PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

