Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7714FD799
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700780; cv=none; b=ctZeheYYzQNox1rexibtdACvV34RjTZD8ToXm1exS7JBM4gg6wclVXWVq527UjKT0TBoCpBhNt8k4mcIUsWchNdJphKDa/wpFoQvClwJnDwkKCIqs2P8/DSyvDj1X1BU9Za3S0rf11WlLiHJoZuhp8q01HV3MDDco9eNtHRIjEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700780; c=relaxed/simple;
	bh=qaFCsp8c7CGfKFzZ18kTQk2ARCzvSbrZ20wb3yYF6SM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kFO5NvPBBW2F33cCvvm+dLuqnqPKNDXjBkxKHKUBPJw0o03+dl88fqWFTL15ixMMOgJGyiexOgqcR7jDEjhBC07F/7a8T350+2qEcpwRhp98p8z1gd6N1CnEYYj7vPiTRjypUz06Ih9Abq0cZsAd9Y3uNinGBL7C62DTl6J0a8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WxbOTKwM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=egRAHL+q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WxbOTKwM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="egRAHL+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6o1EgwQzbNDEuQMqlYhAahN+QI0brKkw8w3Pq8/8w4M=;
	b=WxbOTKwM/EQZZc99U+Hod8OjWMBinDZxerZDATWzmpJ3+0DHlwDZ52pock8X5UM3QYwSm3
	tbh0P2ngg8P4/z65MduGTwlirqRlCAoTSLvjfhnO4sWGAL7+1jSlCprTB++eBAN6sGrYfK
	B5gCIZmqJF4mQ0rTWtS5rRSx1+nM7fs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-5NytVzWEPRmhAZDVevGezQ-1; Tue, 29 Sep 2026 12:52:55 -0400
X-MC-Unique: 5NytVzWEPRmhAZDVevGezQ-1
X-Mimecast-MFC-AGG-ID: 5NytVzWEPRmhAZDVevGezQ_1790700775
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9175cbd3beaso41519796d6.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700775; x=1791305575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6o1EgwQzbNDEuQMqlYhAahN+QI0brKkw8w3Pq8/8w4M=;
        b=egRAHL+qQ5CsChrxeHhQheTQlicf6Zg5ZZZ0h4csWN29n8Jl3FgT0q5I+5Q51oOimO
         qCDCsJvFpt/iGoRiGOv31u+KmRrRxXVyamegl8jj3aD7X/hIf7hbjs7wI9gKaocBAd38
         75bf1arsMHLrg9FEZkhg2PCidZVnb93XFAR8dxWuhTBfWaZEt25rhv8xo7ONYtqcNS67
         AYn7sjQuMLbUaI8LYHvriFz866tzGfyjsX6Pk5T0e9BQhNi3EDxBJjh6gmUhgH9XgxQ7
         nwcBAhoUo4n0rGN8BZ/AeP7WJyO16RauklOZMUtYpxa8hiU5vX8SI5BCohZ98/Bz7oxL
         JuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700775; x=1791305575;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6o1EgwQzbNDEuQMqlYhAahN+QI0brKkw8w3Pq8/8w4M=;
        b=WtSTe6zgPZQSL5ct7V8n5epjTl7ZPgPdwLcHaIqh0ex9iOKr8eBueJSkbfPjVMGyvo
         UlVfBNCXOJKgfw2toNDughude6v3iu5AXVlQyL1dI1tjPtvfzopL0LPFcmuSxJm/TjTo
         +6MONEwc79TmOxFaK4N628wW6XPpv/g4V3hQwd+ZzLHmOmKEN0BXxGPNAGty4wGUctYJ
         X/MNFM5VUTxkS0yxfhfrsWPOGg2qSGQlxWTjR0o8dwETM+9RwtUlJRYX4mpI+Do+prQb
         5AsHea6W/mU4cmbqkfzdqhn5+VGe5lGn4CtmnIT4ZlSoSCUOBECrjUfRLEukGrUYijw0
         1Wew==
X-Forwarded-Encrypted: i=1; AKwUvByQR6UjG9TtF0duMTQ96dlGsU9ieyHBkkeRdsMGUbRUoJW9Nj288HpdnEfLCkOB0HNH/pJbj2aBXfYb@vger.kernel.org
X-Gm-Message-State: AFq9FYIRBFvazyJGY3yQDJg1vTFGHoFqLJmIAGnwOSdS5V8NirPM9kgX
	KnrbvDOpnj/5DB7AnDm9AVvN9IfXy9HcWq2h/QeZlKpzWD4y2KZo4yjrA7NauNG8yGncAQrHwle
	sIULd2hlov/b1M5Dygki82CETHNqo6BbpkY1ohffmMRNJuQBYlgMyjDb2fiyjqDU=
X-Gm-Gg: AYBFou2B5i902kFxrRNUAPuXSbj5JGdbmPNqqGqd1/VW9hay6SNvv5aeoL7BK3KDe6u
	1HA/hMJyADlP8IIa/WcyYY2UT0ip8SuTX6Krb+xZ9c8IP/x5jOKae520/SHkSMXuQdRh0j5sag1
	rMQhP2W0FNUhY/EJECu+TNi3C5vJ8L9nRfW5PaWHYwiaNJ4KsVJh6G+FsuMjLwW37ZdG89KMYga
	FLTxLd3050pIWVyLtkJlRUAZXQPXiu+gKd8tj/LHoRTCbuP3HZb56ixAL+rS9J6QSUgjQAzrGVA
	sVKdLvw9DuKNvULqIYTkCD0B0beuSPqe9vYO0466xZPfWmOhJ/5pGY05MToGdhEuejmvMzvKZt0
	pwgm6+WXeVGm+z/w7KBmWatPodHkRL8ZUR95QJO2DGtD7tBUpc+w=
X-Received: by 2002:a05:6214:2f89:b0:914:2b93:3f3 with SMTP id 6a1803df08f44-9142f6ea654mr302167276d6.14.1790700774698;
        Tue, 29 Sep 2026 09:52:54 -0700 (PDT)
X-Received: by 2002:a05:6214:2f89:b0:914:2b93:3f3 with SMTP id 6a1803df08f44-9142f6ea654mr302166736d6.14.1790700774056;
        Tue, 29 Sep 2026 09:52:54 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d343c11sm14454746d6.25.2026.09.29.09.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tero Kristo <kristo@kernel.org>, Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260906-ti-fapll-clock-v3-1-b0ded340c62b@gmail.com>
References: <20260906-ti-fapll-clock-v3-1-b0ded340c62b@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: clock: ti,dm816-fapll-clock: Convert
 to DT schema
Message-Id: <179070075682.199845.16100370158110486691.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:52:36 -0400
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=329; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bJDs7mdWAsDC2TJlkeIHEoIE2dsMin2hdtYBCmAzCEU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v3m0NebrBsm9mQ4Hl9y92DZzMu/iiz+4DlU0rzR9M
 1FA12daXEcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATuenP8M9CTMaqS9xVQDf2
 cnxPoWMZh/VbFoG9r95JzwtcvCnyym2G//7vCvlD08qexIVmN324cEI2b/GkzxeO7uRkE1lgW8F
 bzwQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 02:52:04 +0530, Bhargav Joshi wrote:
> dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT schema
      commit: 64461f89a37a788789a1ce22979e3c0695ae0497

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

