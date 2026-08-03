Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF6736B912
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762600; cv=none; b=XaDI2jrUKuokbb4DoR3snxhGKQow52yOv9NOWaiYy1APtGTcPo1F3iGVfD0xy0dSa0YQ1wzp7eaSOShHOlNNPPlvYpnTfTP4CTYDdTxCfX2l2Rg95ow+v6ZdXyr9AIbLsbZ8p2jM84nszvMtjFvFY21aiAYwptLoH3VPNb9Cexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762600; c=relaxed/simple;
	bh=MTOMkVpQfqMobihR6CronKRn644MvaQgNmLnisoTi7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xmr+FrK23ethc4LfUqTXaF/T/33LAHt8/m/mzx/h8cSO5Gx6XpYGfQKnxzg0DfUyzeCNyTrRRtORyxGEKLJ24DIsmnK/W8Wx+5+aVyRea44BvEHIna6vdBRWLwn3C7RRb3kU5JVwMyWVSsmmdVQ0aDOM4YWJhMAXlJ7cOniY4ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LVp0vMd3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dlk4dil6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LVp0vMd3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dlk4dil6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785762596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=;
	b=LVp0vMd3O/RGryxtUZAuOOX0SSd96tPNDZkStq5X1S7Ay/fUM33oUA8J50RYNuThgSGxeL
	8VpFkvhsucPyC55OP/zZjY9KdTBLT9pdwY0bk6D2odz3wgF5d1thrR5li7DPWawZ3yBvkN
	B7wXtgED0eharnvOzvSQPZ2dFOxEC1Y=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-zUQM6j5WMaGHaxiMVttk0w-1; Mon, 03 Aug 2026 09:09:55 -0400
X-MC-Unique: zUQM6j5WMaGHaxiMVttk0w-1
X-Mimecast-MFC-AGG-ID: zUQM6j5WMaGHaxiMVttk0w_1785762595
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81ebbbd60cbso51346367b3.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 06:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785762595; x=1786367395; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=;
        b=dlk4dil6iUcVTz4WyG4vxNlD71U4O1gjqC8b1zxqMugdZMHmQJzux2KphZvjDgQAxf
         rIEU+CQ5XmgRraMSVKkhgciY+cJXkLY+URdFUwBMHxOU1mRmDM+lEQZgsM35ZzYQ8dkF
         N4broRpzkJvZzeou/n2F7QMrAUKKMbk0hWxAVp45M/roLiln5Nwe/AsBxP2dTWPr5+JZ
         Eo+Oty+4PRh4PDfrEHOjHf+/UW/6mx3IDd706+EPZFrumqR2RrkQiHrdwcz93tULyQmb
         uAvHr3qhOjU6bCyGdLKO5d2fGbUvMjQudoEZi3qjPtIVgN0QsPn4B/wYf1Vvf8sQ7Wgl
         Cxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762595; x=1786367395;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=;
        b=fFjdSKFKr6S67DSSZh6Y2bSjJ6wuVS3EtJA0Eaij8oqy2o8XF4dfPLUF+VUTQj58mK
         40iwQ5fKvNix7OWQnkkAMd7YrHuHOmne1wti8NuNubmtxpNCT1sd1yYVbyepm29oIp4I
         NK9kBk/jW9iAYpZeQhj9E9hif9X4dzltqnMqwQt/TnnsXiR19sf/5nD2zVpRl8J/kgDg
         EZxVQkzISyPdGKncobHwEvii276VOO1q9q0d1PcUNcSIbhWSyC6si7pBiDLKNhnn6trL
         pqzlk56fGGkRyg/4+jbYtYtTw+Nm5nxMNmPRS2Mi8tKSez10wSmrD/XotbV8mhWU62fk
         rmMA==
X-Forwarded-Encrypted: i=1; AHgh+RqWOtWGYvIPRU9Baq5vieEz7z3QjvM9MvCEChkU5vAW14Rx9buXiHc4ZXdwgLQmQuo1cjEz++TRLmOE@vger.kernel.org
X-Gm-Message-State: AOJu0YwmNSl1OHT9lL8K07gtvqMc7XvSHPu3pAroKI+1V5BgasqEcejn
	DUqSSZ/2ejFACCfyjdIcrPRKWUhCKOPQXjDMMD+AUwWldU5+mYPvmGQnEOgK7AIxpX366WW2EuH
	zPZWEjZloc/7eP+Q4Om5OpQyvycQrf7y+Fn3pVLgx0qLXALBiEpepM3et+AtD2CY=
X-Gm-Gg: AR+sD13a5FGFH580tcTF7ONuPiQcdPcZaZpExVzRpUJd/33SJAmEBWEcvNLQht3asIU
	Ob3vVRSsz0pPWqovUgP+bF/3PUfpFj9CqGrCUHYsJMkkBl1xkdAGez8XeJ2Wh8g3QOT4VyIHyFE
	G9BNvxESeiKZr+SuOmvj4PckWmrBOp4XsjJ1fCet9niBcHP9mol18mGlpXZQPVcJlRX6aczcDmJ
	h/OGQVpGoGF/Tc5s413RyhMx6D+I2l2mSvJ8JvHjK1/rjUZlUC02LYFGPpEsF+RUOMTswxbKxiV
	UvNcYQzxUqHLDdYg5B+6oY6D3f+j6r9+z55mpjjhsPY+Y8PzepQvjC4jQAJ0duPVfkndBYixFQY
	xEybLkbz/fjZ6eGOrSfl1iHnMXR2GEFQ/RVw=
X-Received: by 2002:a05:690c:c503:b0:81d:a1e5:a4d7 with SMTP id 00721157ae682-81fd49d3db8mr127611177b3.5.1785762594614;
        Mon, 03 Aug 2026 06:09:54 -0700 (PDT)
X-Received: by 2002:a05:690c:c503:b0:81d:a1e5:a4d7 with SMTP id 00721157ae682-81fd49d3db8mr127610687b3.5.1785762594054;
        Mon, 03 Aug 2026 06:09:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm55024337b3.5.2026.08.03.06.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:09:53 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:09:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: clock: Correct white-space style
Message-ID: <anCTHhVjoymK6AiW@redhat.com>
References: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 09:55:41PM +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

