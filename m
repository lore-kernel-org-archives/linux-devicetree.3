Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C713C1D76
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963875; cv=none; b=uaYj/elyI3HYD/gKRvItVCZ3GzQ2/6tVGgMmqCqzq8yBA2S2hGOeSu5iM+QUkeKJN6lOvhZcVWUL33aG5f58mXazjHrTUnsDNy730ScuHWlq4i4B4UshqtqMGTbHsg/S0MMNjZYUjnKRXmojN3OppH6Uc99ZFstiLAsO3OoHJu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963875; c=relaxed/simple;
	bh=Zo/IJELH6ai7E1VCqk8pVwwOBxDGzIxLI79k6nC4IdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0o/XwPc4YffvwKiumPSdpsXRye8gU18b9f28lC5i0ibWyBi6eSskCUMWUeyLfS9VI1kTpXoV+wHmSZUu8EmI7rYT4tnL+Dn5ZqFns0kzv2iVUg9ByZucCNA4WsRfD6r4aufqVOD7KJ9eJqMMCOYXY3JF7gwB7zIIzX8qu4c/6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZVLWSCyO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZQuag8sR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZVLWSCyO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZQuag8sR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790963871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YRmfniRYY3gDZtpbulPtdSLopqAgCcIdSXqyEPuAkSA=;
	b=ZVLWSCyOMZYM4xQeejfTvNkawDgetUWv9+MDLvrEqW9jDdyR3MXd/T+7Qf6y0a8rTy6YG+
	wIa3aS+ZQuqXUDvP4G2TNiY3QRE1FuYPmBfzTjCZ3+dWVaY6pGodwq4XZYwgGbfLmKuFKi
	1IlcN/btCkNpJHt9CWAIof8+1Crdy+c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-Mg08iMD8O7yUbTxx9-RWPQ-1; Fri, 02 Oct 2026 13:57:49 -0400
X-MC-Unique: Mg08iMD8O7yUbTxx9-RWPQ-1
X-Mimecast-MFC-AGG-ID: Mg08iMD8O7yUbTxx9-RWPQ_1790963869
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338c59f90dso4742671cf.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790963869; x=1791568669; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YRmfniRYY3gDZtpbulPtdSLopqAgCcIdSXqyEPuAkSA=;
        b=ZQuag8sRzDDsKyHc9I/zOZbbtK293iziA/f7qxB/6UDZ8Iy1ad2ssCPoKhDKEJf322
         JAHHgrAnUHZ9wBCQGZMKjtQlFAOVGkWDfg2+fKkdaFx7rCpvsv/q58tcov30QNhu4uXr
         +MXZykA+d3xvYdmz4ol0502Y2kEXLaPtZpID3lOum9P3lZIO90Ao8/u6N4VkVmHOTDxo
         PxOHj0sApVYGmIyKo0ddJFFRkf7m+Ko61sWv44t0ZbRBC7fZowC2zjW9B9/8ig7h9QIZ
         RZFmyvKPgYNXbtA4Sa2SKW6o7XTGxgVwEY2gr2DNxFAGK4MtDgzDpk7kqxUASdeDBDx9
         OvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963869; x=1791568669;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRmfniRYY3gDZtpbulPtdSLopqAgCcIdSXqyEPuAkSA=;
        b=VjsWeCUhLAuySzmOZy6fWlmq+AdbnqHBjuhh2fVeZroK4Q1A2GfTPs/Vz2PYXJBtSz
         If2v035Yrlow9lf/nyXxIWkChWYPWQbAnvPr1VexB/DwtegPQIUrb5XRGxbBU4qccQzW
         /dHi2O4m9tS4IE0OeXpb2Va491gcKjZoQPJD+DAKvzh3okchYtUNCX85ZKwDysSOCP9V
         B6cVH2xWf12di2X0/8pcoPVogXXfwAX2ukFKboZ6zLBU63WW2B965sVfHoGzKkyD9Qok
         +bYLfHU/NJb/7PAfWu/vmcHbN9MsvyE1z7tPzW0N1bTYVLpXIcQMlJ3rh2DReIzf708o
         EGmg==
X-Forwarded-Encrypted: i=1; AKwUvBziEsufH+eivKy68jXXBnUDnSyD+fc/f1wF37Zt5czbHOBHGNJeMnxeOpM0R73gSlDD1o9smzTH2aTg@vger.kernel.org
X-Gm-Message-State: AFuF++nUDbr3Fn1CPTDF1CI7pjCrC4O0z4ywNOz0ww9HRbtosBqaxqVf
	2mXYji6z0ulR0WbmHcshdsa+2OoClqwysr1+zY7wFS16MPK2aYpI539Fc8rVaki2Kwnq5u95isN
	qmmTB3Ug7hzdPQQLvp4Gr5SgHUzkxx5oFh0ULEouXxAC+NUxMzEQH4J80q6a10mc=
X-Gm-Gg: AYBFou0EcEdIhpsvYsJ866rSDF5dOdaapE2AVxcyfliSXljpyGfLEfRDTMYbcSQglkl
	dVMpQXcuJgWGiD/YYwjYMJxAhnwbqqdygdRsUiY506GAHbQB9TckaNrkmxthdczULAAMLKo8osZ
	gGdIGokjyG0uPnGB5L1t+9EVkZQ9opOCuC4QS+Hmtkq9qldApdOChrYz4GmUToQ41gTYyRp3+Hj
	HexiZ6MtDf6dJm3QTnNNbt+5flA6npLJq9itRFdVl6tXZJx7tum7lMyIJvF/iAAbyr69mRm6Zp9
	zhEo5Vk2gyBphZXkejLbMOIcYQLvGl04oOB0q56HNP9AO3ujF+7extLgOugwR0FQbs6QWnfKwA=
	=
X-Received: by 2002:ac8:5750:0:b0:532:8063:4ccc with SMTP id d75a77b69052e-533831271a9mr130025981cf.3.1790963869145;
        Fri, 02 Oct 2026 10:57:49 -0700 (PDT)
X-Received: by 2002:ac8:5750:0:b0:532:8063:4ccc with SMTP id d75a77b69052e-533831271a9mr130025521cf.3.1790963868585;
        Fri, 02 Oct 2026 10:57:48 -0700 (PDT)
Received: from redhat.com ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398bdd010sm33168861cf.19.2026.10.02.10.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:57:47 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:57:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <ar_wmUWEXgIzq1XM@redhat.com>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
 <20261003-dr1v90-cru-dt-fix-v2-2-6e7d96612ac0@pigmoral.tech>
 <20261002-crimson-unwrapped-b067e86de38c@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-crimson-unwrapped-b067e86de38c@spud>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Fri, Oct 02, 2026 at 05:33:24PM +0100, Conor Dooley wrote:
> On Sat, Oct 03, 2026 at 12:28:40AM +0800, Junhui Liu wrote:
> > The external CAN and watchdog clock inputs are not routed on the MLKPAI
> > FS01, the only board currently supported. Drop the two fixed-clock
> > placeholders from the common dtsi, as fixed clocks require a valid
> > clock-frequency property.
> > 
> > Both clock muxes select their internal parent clocks after reset, so
> > the CRU operates correctly without the external inputs. Keep only the
> > required oscillator input to the CRU.
> > 
> > A board using these external clocks should define them in its own
> > board-level dts and override the clocks and clock-names properties of
> > the CRU node.
> > 
> > Reported-by: Yixun Lan <dlan@kernel.org>
> > Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1V90")
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> 
> Per the v1, Brian said he would rebase the clock tree, so I'll just
> squash this into the original patch I think.

It's already rebased, and dropped from the clk-next history.

Brian

