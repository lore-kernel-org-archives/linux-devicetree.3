Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681FA3E6DD5
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700692; cv=none; b=gVYGP8Ro+EJiwxjT2I8SxKjHMwkBwpPIaw15XoO53E91hp1qq57Fy3XwYd0FUSoBEY2p8nbgmHNQgV/Mtp88kEnehiRu5LmpO4o8m6wHn62HqDxwGHAsTzhQV+dc0nwcj535qcHlyurnQRFIlLv05M6IPuGSg0yNsLiqK/09QGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700692; c=relaxed/simple;
	bh=KPyIrPmq8jYkS6wHePhAy1DCi/M7oDqBqGbUGVFhiNk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gqPn7koYM5RqjaTEKYK5uQUsoIJ2R0ONUeMnhFXRpQKo99arDI4Sp+ODMivJQTiIM1iEQFKsnf5JV6TLeQHAnq/08yb6bPFVCN95pvrz3GlbMf18nnIlCdvYRG8s1lOZNETPmZHURjqlklVTnTAAE7SOLLWPIig6seR9lP6Rn/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IYZmloYV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UIb+B76t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IYZmloYV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UIb+B76t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJlUaG74o7jEfz91Y8H5nhfc14UxArn/vIBZ8Onqono=;
	b=IYZmloYVL4nIbxk1xGYuu9nMYTKJPdKc8+n2voA9snH71w7vs77ncgGuJKH8/P4FvHJbhX
	PvKcujSI+126ZbLjYu93hemRRSc3Y2qf3wkFqq2sgtnNMsCd1WssSXxMqjgcTzJuXsud4V
	Uc6rr1YuR9M4I0DYfa1FKZKUWro1B7s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-sK3Z0sLjOR6azawBN-kFwQ-1; Tue, 29 Sep 2026 12:51:29 -0400
X-MC-Unique: sK3Z0sLjOR6azawBN-kFwQ-1
X-Mimecast-MFC-AGG-ID: sK3Z0sLjOR6azawBN-kFwQ_1790700688
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso999147785a.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700688; x=1791305488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJlUaG74o7jEfz91Y8H5nhfc14UxArn/vIBZ8Onqono=;
        b=UIb+B76tlN2x0yoV6fd3fwAUMUkP8AduxVRldpiwSjlybbDaH4sa0+QQNMslohjGEB
         ayxMCtX4Hh5ojcVEqdiQalXB6AByIbZQu6ow887UrF7YT4nTHoLhmavHmuRtmsVcLl/o
         HT0qb2DSyaiBEEVhon+NUGuFiEEPo1Z2PDO4IGtEYRbuvrdmk8b9svg18ezokoG8LmOD
         cGDW8Mx5EMi5IHfC/6ZsirVd3CmKOooIahGmACRhs42js2LFeORsmPFOeBk4txue4fwO
         ij4RsHqNttSODV3CKrDTyr8ig4wVCdPVFilzcsnEjX2LgkMFUnZk/LgQObnUDKMbSEdG
         /Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700688; x=1791305488;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJlUaG74o7jEfz91Y8H5nhfc14UxArn/vIBZ8Onqono=;
        b=CbDI7yZgPdgk/xpnnQv1GK+u1qJmhBHKnyYhD7OZVmFWA9voAYiccLNwTGC2OqSQ+D
         ZNzgeManpkewz0sDyu6OfHKmL6CegwYmAx0CHugrF3YcY9tTG/YHHvsZBBz6fj4BCzuX
         sQf2OSZB16q5cwIc5LKT6jz+vbgNB6o31b8bDCZ9Jy1FoO7dhM5/EToG0vrn1qyxsoEq
         Pd0VHU5jSoOkr7eL1RpwdL93J439laE5C78KbYb6AqLCktywCzbmkvzqvN7QkPuhRUtx
         githZp3miteXOPZVdaNdAzdJR2mAR6rxH1qS9oewWHP2MAIUTnU1XsxK5lYyayZmKnkv
         zpKg==
X-Forwarded-Encrypted: i=1; AKwUvByK4Fej/YCMV6EsB9FWC6TfjlreSxyOPNEwD6fPjDyaIu0cdzraLVTB1ZlX6DFF6NnIqFs3vgnTJq8T@vger.kernel.org
X-Gm-Message-State: AFuF++nHkeZTEe2afTrZyys/XcyLnjyeb445B/eHWsAJAWUcH9aPMZTq
	2xH8aDo+b7N3mg0Ui00Cjwpkp8d2fonKQ08tUD5buOMpAh/PqKCjkvpoowFVWAxm4inBcIg+ToM
	jlBJgsrQ8Vkwie5j26dytUWT9S9BmsL+2KOosRIjuTr/0tNkutfqEZqzx0J+/Pyg=
X-Gm-Gg: AYBFou2TCu8R8LBGZmyVOfdTcNovmNOxvKSatvSwtQ9juabUthLstPAw3V2a9GJUrod
	44KwLB2zIaO7km0ycBOWX1Q7o7tBzyrzVYd9rCVUvjO2DKsBL4JihI+UqTbkjfwuclJ/U4YpCtu
	6GtMnkvaSnCSp3W+7EIxzpn+HBI18OuFCxxHVVKk8G3FAA5GtbHYtT7TP9SYAO15LFgqFD7jqH9
	2vhC+eoW5Th12V5QLEmIgqi88G3Mp9SXrjOX7B/tD4lTQ0EUoEM/sbregHx34G/V3bWRmfs2oUd
	tZyCTu93sBL5OtdNzX2XdbGswRpqG8S1/8JTUQ+5AjGFJxOjgrHmordj1ZgWXWTZ1Uzjmh+lj+H
	aFde0GWr+l8ft73DMNisef0Fxjhly3hHJj73FhkoT2ZJn2TjIk9k=
X-Received: by 2002:a05:620a:d8b:b0:93a:c102:1123 with SMTP id af79cd13be357-93c9fab92f9mr15582685a.15.1790700688313;
        Tue, 29 Sep 2026 09:51:28 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:93a:c102:1123 with SMTP id af79cd13be357-93c9fab92f9mr15577685a.15.1790700687812;
        Tue, 29 Sep 2026 09:51:27 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f465795sm12077985a.7.2026.09.29.09.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:51:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com
In-Reply-To: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
References: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
Subject: Re: [PATCH v3 0/2] dt-bindings: clock: ti,dra7-atl: convert to
 dt-schema
Message-Id: <179070067699.199845.16336809521598081292.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:51:16 -0400
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=729; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3HHqD6xsSTvsmagNkkuwzWR2bd4nu/pmM6WiPAl6ZfI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v+md7zf9V2niO2f/Sc8LBa7ujHn8epZGzN8KoR9+v
 kUmypmtHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzk1VxGhjU7ezszjwSVSTA+
 bZDi0nkSw9nUln6XZ7KVgb9wjE3CWUaGhb0Sr4qOHvv+o7yaTVRwh3v216nLlre9n/0vmENbzns
 TNwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 03:02:38 +0530, Bhargav Joshi wrote:
> dt-bindings: clock: ti,dra7-atl: convert to dt-schema
> 
> Convert the DRA7 ATL (Audio Tracking Logic) text binding to dt-schema.
> The original dra7-atl.txt contains two bindings mixed in one file:
> - ti,dra7-atl-clock: clock output nodes for the common clock framework
> - ti,dra7-atl: IP controller with register configuration
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: ti,dra7-atl-clock: convert to DT schema
      commit: 26881ca4ad352d4003c6d6acc1343ecd1823953f
[2/2] dt-bindings: clock: ti,dra7-atl: convert to dt-schema
      commit: f31b15c9bbb03b1560fbd137439cd9fba037bace

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

