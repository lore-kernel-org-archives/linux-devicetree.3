Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2DC38BF81
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428943; cv=none; b=NPprTBgYAEXUfzLxz76jGIcg+1nYnwjZ1x8fVUALsMTK/ZnGVYrRML8/KJpnAGrWlbgBZXXJyYUio6hucsYZAX3gGIGRc4Vv+7269zDsDyAh9p6/jQBb6wvQwxo4blBKI699WsNDy+PxZ+ux7ACb1bDtOwxQkEycw/VH1UmKdEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428943; c=relaxed/simple;
	bh=8S+TWKatXbX5wujIAAzGp39n4pQcsk+sM8ipb22/aEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/wdulqRYOSn6PTbVZHExchsqc4dvA+y8OGopbdLs9bxft8peUjuaEaU32pX4ip/ABqHTbnqj/X/FnhIGdRQJPJrnqZGhSS8NSw03iXp90+Lh8JZ/qWaiozxEAw3wxz4VekcvYH0iQ+aKKwFYHwyARmdwLvgVm1Nth2OiHVg9NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=chW2OVNu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M71WIobj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="chW2OVNu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M71WIobj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785428939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWnL5VleVaqHnf4WDlOmR61fSZ2iE1J6L7mVb4UvJLk=;
	b=chW2OVNuwiMJ5FdTDDC4E/CW1qsc3l3HORqD+G1pI+BJSlD4CEXF4eU+Yhxbq4MPhpYGJi
	xeQq0uSSoJoBshk714wUB1gnd8j+0Qy/3x5tx+NA2Sz7NVsViNcHPKpbSdBbdcb0050258
	w+DaQZTpq/keCZaLV+5ECEufQ1GXe5I=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-BCL9BkyXMyu5rFyaNVMM1w-1; Thu, 30 Jul 2026 12:28:56 -0400
X-MC-Unique: BCL9BkyXMyu5rFyaNVMM1w-1
X-Mimecast-MFC-AGG-ID: BCL9BkyXMyu5rFyaNVMM1w_1785428936
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81cb01c07b2so177747b3.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785428936; x=1786033736; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YWnL5VleVaqHnf4WDlOmR61fSZ2iE1J6L7mVb4UvJLk=;
        b=M71WIobjLcSRkZYmyRuWDhi6RkQ5L5SPpQxZl9utPY540t0PHJR+ejQ28Ji8vWQKYt
         ZQXs+ntAl3X8PwI4gT8Ov+y5oBKS1pDrHiSeRNb0dL/Ws5e9WBa6KP3BKobUjeWWUUTy
         ebvaqAjUmHQqZhqxYKN+/HJ8P8ql3mndrjiS0KrN6z3RfF939OgMKfmyFCIdfUAttAUQ
         A1u1lQjGG+ufs3z7Fd1rA/k/Or4n3FD9CXbFoaUZ98UyisayC7UqiXNXUgNcHUwhcSPG
         hoOs6KqCap5tIXW2g3IFu/LgWF7lvE6AG+IzT00mhRWFoCH+sjTG/RkbZmpYBHhvCxCx
         MU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428936; x=1786033736;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWnL5VleVaqHnf4WDlOmR61fSZ2iE1J6L7mVb4UvJLk=;
        b=J0Xuo1pghdnJWwKvc/WWILrJO/4qTj9RML2BmpiH0NBZxfW1Fk0wqCd3H9lvC712Uu
         tN7EJb2zlUONSHybfzplrflVBkAIKNHP43Ed/zXMoVhvrGGdA2KSaG0jgySaJPJTNON5
         t11O5JGsdsv1hpjQ3ZBZKLOTVYOoHFFLbAhP/exhV7kSNvEuzZFOFbgOxioSWI2umahF
         2y00lnl3WLaeIvrClfvCVnLq6EdLu/raQ21uY9QJx5sySjqMhXN/sV8bHoxsi0AN3Wf0
         wV7/tNZxKitPkTazE1dHjpZlpaPQAXx3lfT/RoGwiR7Td6/gSY2YfHQt5c7PatreBbx6
         uGcw==
X-Forwarded-Encrypted: i=1; AHgh+RropXBxnUdxLMEQd/Rc6i6PI85QjQqV8Z/oqdvzzfzDsDrSL4HekmJPC7soBwAut1oBxjK8ZUfHyqoy@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLrDTPMVfyx0TzdlwoIRrfaOKcZ+7jbZ54fy0KB+hk8dkCDbD
	NCMA2dJBgifhEeJjTs3HNROJ8U0hFmtqzsmxESqwSXJwRPnNtcKw8eCFaPGseRV8lWwdsiEAZJl
	CLhBRx16d8u87dBF70RwwDWsOzuMJtzrzQxSzd4pyGVQtq89hUabTl8tha0hmAoE=
X-Gm-Gg: AR+sD105jWkLeUCdojOOqX6J5Z9iXxqCo5AA2DiPe3JSMkcmw/ECnUUCzcGr6hpzt29
	WewX9z7SZ27Kiwcwl9QmWDe0Hy3n6feUqnznmz5Axn24G0VhL9b2V9SvWso7iovW3SvB1PYl8nM
	Dy6zEm+r65iT1Cm98GV7OamOUazAUbhnniqnQglVb/xtKoZhfQ0I8i9BREn4Np58t2XcDIUj/Rb
	5LUn5pfZtRljezIPJlxPFGnLuLkqwY3UNuzFR2HZX4pwucFOlZoJq9+z+vjkchlOBeDOQ6+W532
	ukp2rjpfzxPS0dCh1Wa9MtaDG53Kj+Soz5G5/t4rd3hBRYVV+ql+sFCEfOjl9arg+Bj0oMnIPQD
	E50RcMiRvjzq+fmo57H2l+CHH9g3c1AtYgW4=
X-Received: by 2002:a05:690c:3503:b0:81e:6c2e:f114 with SMTP id 00721157ae682-81fb895416fmr21778887b3.30.1785428935668;
        Thu, 30 Jul 2026 09:28:55 -0700 (PDT)
X-Received: by 2002:a05:690c:3503:b0:81e:6c2e:f114 with SMTP id 00721157ae682-81fb895416fmr21778617b3.30.1785428935253;
        Thu, 30 Jul 2026 09:28:55 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb88c4a57sm13093077b3.8.2026.07.30.09.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:28:54 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:28:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock
 & Reset Controller
Message-ID: <amt7w327inR5rZrU@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-2-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-2-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Yu-Chun,

On Tue, Jul 28, 2026 at 10:27:56PM +0800, Yu-Chun Lin wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f9472c1a090..65dd2be63903 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22741,6 +22741,16 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
>  F:	drivers/net/dsa/realtek/*
>  
> +REALTEK SOC CLOCK AND RESET DRIVERS
> +M:	Cheng-Yu Lee <cylee12@realtek.com>
> +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
> +L:	devicetree@vger.kernel.org

You add drivers to this list later in the series.
devicetree@vger.kernel.org shouldn't be listed here so that the list is
not CCed for just driver changes. It'll get picked up if someone is
making changes to the dt-bindings via the "OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS" entry.

Brian


> +L:	linux-clk@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	include/dt-bindings/clock/realtek*
> +F:	include/dt-bindings/reset/realtek*

