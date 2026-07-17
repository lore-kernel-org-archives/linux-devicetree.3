Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42163EE1C5
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286542; cv=none; b=i4SPty+FhSo8lz/0xeOaZ2w/mlihTPvKo2rrGOBJFhQ28cShdE5uNkXG1wDv5Aus4Ll5MUSRpeVVP12KcLJyjdYc8QdeJ0iMcQvv4/aCnP7vYkG44Qh8DgIi9nMVKjzStg2EDsAZdP8vvS+YEnF4nFc+6B5u/k+JqASbKzzeIE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286542; c=relaxed/simple;
	bh=zDVOEiONu9RIqG/vaAanRhfnlAZdolLbZCe8JQswCvI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=CA3r6qWfO/V/46h0hyVgZtUEl0DL+s27uwHC7Vw9j3vbmFeSJX5KlDl6BlY3fikxh8c0hBko1O9TleDJEGn2WX72ePgCjNgVcKkq9myC+5DUPOknFPTcRkImP1LfZEkciw4wwk7aA0oKjSqZlmroWHOk8BF2eB4sGMalvc1wjAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QEIr1L6X; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QEIr1L6X"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso6576495e9.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784286526; x=1784891326; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PkeU5J611rL837GI6Oka3yn0u16RbjAUf6SE88GlOtQ=;
        b=QEIr1L6XLrizYJueg5AhVRz6XKVuHOMZhGNsFoI3lv8P1DtcrJoj6vsZC9udmiksx/
         hxEwhQy49ksmryc3/5E6miBLDWu+tt1WRww660L9iMoRJx15y80g5GUXFse+DBvSLAHV
         WKg1ZUrP7Cx3qeDq9eJTiIsprztGBwcKF5mvVE0377msUIW0y3sLQOLdOSUCTdBrO7Pw
         0cucDaWW90PucyXdegTOE5d/Sb9lvxQmPUqZRMXEr/xVLfDLH0EYlVGkgNWd2iekV2dd
         r0H5ht7fdK3BX2r7z73qDUq0BxscTV1anl92MoNjy4iLXJJJaIeyNfgTrZW+n0GWmzKP
         dcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784286526; x=1784891326;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkeU5J611rL837GI6Oka3yn0u16RbjAUf6SE88GlOtQ=;
        b=VbSLjYccm0u9YHsOnJ2EPhi0V0ZpGpE+Nv9Bn5XGXgUueV8HDggY00UucN/SwwT2LQ
         TseHvsH7tnOpREAdZHpYwQzyLBYGYMTN8tvtZ/pl5S0hblzsHfOsiPF8IDtHHOEtsvAE
         6rELHbPqQfbUHr2jkxMF0S75Dnflo6Sb/Xfu4to0QgW5BtaIIp+4PK41fMg9GboZ0pDf
         W3iPnctYV08Pv9Ou7XHP4R6u1ckjhaPv/h8v5oALwN3uP1Jcob2p7A2hxLm4JLHmVCvm
         qdCR1kw7MdSQTXXfetUJt27Mr7Jsnvcjh/rqNFeNQIYbMj6OmoaZXwlER3g4xoCVze7+
         v9Ow==
X-Forwarded-Encrypted: i=1; AHgh+RrX8DMYPbiQLmwIfUB4kpigayMyjqVjmZRP808Hkn+qsOBBKyPGbdkctW930dFHTyXtnmI5xdLPsCOj@vger.kernel.org
X-Gm-Message-State: AOJu0YxcVnHTZfgzDM54pW1pOlpq86mG5ajdRIt7VYKLE/qhIN3zMGn7
	HM5+ZuZ4O4D/vMgd33Og2BNrJo6pPLcQaNd6SZiTi5HJzkM3eCQSB++gh1EAW+G9AuM=
X-Gm-Gg: AfdE7cnUE5oloKt3kALk6x68RM8Di9hRucQAreplt9Cv3xO3B1OMjqzTIiY+H9ZlprW
	5sR1VUHCpoDF0vYynTTAr+27kglkwECrNtlcoN6yQX64h8NxLGs7019TZyG+6zCDXRgmzKRyMA2
	bg9Co9S/wy3KHbt68dWdV0ZMwQ9KXRNt2/e4+EO7hz4aOWk/bA3FTYx7qh11t/CqMOAC5rcsNqT
	nAcDsrkagFCpA0cPLwtkDxKidjZ8VmYnJUPXrAdTM+EIVArmf76tlVOhdreqJPgKYGlIqBhjywG
	Z0iA7e4AiypXYJ0DStfwMcC90Yl24ub7miyP+ykr7obt9nG2f9nwtbPtcimu1uKhjxJ1PI7f7mK
	NQUIyp7t/bVYDY0RaMoPKpfEp6z89wx4lOPdYMRGkz+J2G9aJiD4Z/h4jPLam/inSYTBSuqXZHQ
	CUYRi8nqTWJTS8DM5oOmiEvl/LOLCFkUvHqJKBN99ud5JUJLyuERDBddUAYE9OLA==
X-Received: by 2002:a05:600c:4e0c:b0:492:3e44:214b with SMTP id 5b1f17b1804b1-4954bf564d0mr15542655e9.13.1784286526389;
        Fri, 17 Jul 2026 04:08:46 -0700 (PDT)
Received: from localhost (host-79-16-115-126.retail.telecomitalia.it. [79.16.115.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a36312sm46247875e9.2.2026.07.17.04.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 13:08:44 +0200
Message-Id: <DK0SS9CO8VPC.288VHJRRGAWQ2@baylibre.com>
To: "Rob Herring" <robh@kernel.org>, "Carlo Caione" <ccaione@baylibre.com>
Cc: <saravanak@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] of/address: Fix NULL bus dereference in
 of_pci_range_parser_one()
From: "Carlo Caione" <ccaione@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20260706114731.57353-1-ccaione@baylibre.com>
 <20260716204914.GA1262499-robh@kernel.org>
In-Reply-To: <20260716204914.GA1262499-robh@kernel.org>

On Thu Jul 16, 2026 at 10:49 PM CEST, Rob Herring wrote:
> On Mon, Jul 06, 2026 at 01:47:17PM +0200, Carlo Caione wrote:

... =20
>>  	ranges =3D of_get_property(np, "dma-ranges", &len);
>> -	if (ranges && len) {
>> -		of_dma_range_parser_init(&parser, np);
>> +	if (ranges && len && !of_dma_range_parser_init(&parser, np) &&
>> +	    of_range_count(&parser)) {
>
> Why do we need of_range_count() here?

too zelous but this hopefully covers the case where init succeeds but
the property holds no complete entry, so the loop never runs. E.g. a
32-bit style triplet on a 2/2-cells bus:

      soc {
              #address-cells =3D <2>;
              #size-cells =3D <2>;
              dma-ranges =3D <0x0 0x40000000 0x40000000>;
      };

It is unlikely and a pre-existing problem so I can drop it if you want.

cheers,

--
Carlo Caione
