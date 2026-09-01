Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26AA4CCDF8
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245883; cv=none; b=N2we1iYf2xcCQN1vVkGV57sDv7CL5mmLwsvuIMPMTFy+tZMd2PJDV28BI4FTS4CTO2ssvnDp8B7FF0ro1jDlFasBZNkqNshT6fNh7b3dPg0ie2K6cgVGIRG1l6cyif9GYmcdA3D4rzdBy4KpwlEC+MB7ojc/VePzNA7dNFO9XDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245883; c=relaxed/simple;
	bh=JWHArNMHZa3syaxkWQOyplqPmFE/oqiYh+nkNJ3SSbU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=cR1WO5ErBWXLhaobrv3IDmAlH6WgnkW+h+wJa8BMhOy2K7LBBrRT1U11rQB3qUVIHT3DJGBBiUPumVfnnrXGRlUTpooxlM6ZVpBybuVh0hgJDLBNF/KDRImwxhzwTThjreiI9khWRWYfc5QLhcWcqlA+2ZLAusBXxTr3cqEs/R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dQ1xvGid; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dQ1xvGid"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso5695547a12.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788245879; x=1788850679; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JWHArNMHZa3syaxkWQOyplqPmFE/oqiYh+nkNJ3SSbU=;
        b=dQ1xvGidr2Ndl4JReANdtfQ7QsGO5mChStGwnGs2P5Z4qyeaAvL0TFXJAjOie97WFM
         tUoGp6bzuWMZxYcqLhUkZM3wdlqD0aacg5nWW8EmRZLZgBLHzwypqe1jM43FhkUvUmVs
         PTXAvz20yARdbjD2XYZSKvPkKmBodO9Oc2oDyiXILRaj7o9kzD6MWvLVfyZU8DAcFSVK
         /myVzytlZ+sBWduJ+WGSmafXiziDZRTKC9eUDJgbAi3yh9HEHm5Y5fQW+g0+gGWfHlQl
         A5iYOwTsxnKo+8USszuzeFrs6gUbPOyMfIR5NMYiNo5lOzmThoSZCjqYFA6Upc3CnXos
         hn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245879; x=1788850679;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWHArNMHZa3syaxkWQOyplqPmFE/oqiYh+nkNJ3SSbU=;
        b=QZT2efA9wm3syQ9C6u1tDevEIzwGKbNs+h4mvsO1WlVEb2PMoAU7wag1wjSbMscX+R
         f+4xnVIvSIqtmUfpyWsV/CfcTuCRk/9YFRgU8yj32fOF3rmmr2qcbBuI/3dxVksbhFgu
         a37KGAucwYG9ptuo6jS1bJKhE6aZAfTnN6sAW0pF7xGh8g+LT1w9Vd2IQoqnHO4dj7TU
         h17aSlE9phpEgEWAuc578h1Y5Kq4W+5N50GqowsitugsFiyiJkgpiMDWJKuRp86w3Iij
         zT38HKdJfj+001iMRQfC4z7hxT5Dp2aHGzl9TjveNCKaPVtxF1XbilvvWA88kxnCQWfB
         Bufg==
X-Forwarded-Encrypted: i=1; AKwUvBxPAbMQ6O/W3gDmyg3H1pv1i6h2on88jalGJVmfm78mWMdmQ9Z8KiwSQqTXwr9uST1CuNo9i8D00vWw@vger.kernel.org
X-Gm-Message-State: AFuF++mT5eMhN9+b49c4pIsHcCdgpDR830MSnDxol0ylXq0whlELCnRZ
	Knu0mW1u0oB0toemj6QgxWSylDYw3bTj9HOdYIL5yJH+81VCQQdkqKW5RcP41ijBoyA=
X-Gm-Gg: AYBFou2KYs1vUj7QqDpys7aqNDywrrrYsg0YOOLaVCVr4lUNcOb0TyFfOO3kSodrH5c
	D0WZVZZDk8SyWHmtorfa+ca2stxVjx8hw4JZEX4jzEgHocJpoiSNwsq6M3JTai3XNUEKeK/112d
	hkYBrXzcKCnfHrvPHvVuqG+b2nvWzz0buZHJDm095JaYMYR6E5YXAcjsAYcKMfjXeJRf2ZboaHv
	5c3eII/R1pcHHIK6VW2cTq5PLf0Vc3AFXrt9dAdqBiuRBHiulTXQmKEAuvI6p7loO1txE2ItsIy
	4jKFKqmevg2zfSoVbRnc0vc4gBks8T3zFJptq/zJ9Iqusd7HnS1qLtrp3FzUqNDO8/XQyDy0xHq
	yTlXzheE6sCTn6LTJ6tiCS5C03CHSU/HML6WUaqL2jnj8WWQ1KZM1CBSbODFSWoyQbNXM8vF8Ra
	d2NWztQN05H0XB4HdNDdqhAkjmfm6mRHu1S2C9cXq3khEBuVMU/BEaJhKr76547N5EFq3gpT7X9
	ziJSb07IIq+sTsDRVm1gR50MWo5uvR9PA==
X-Received: by 2002:a05:6402:a0cb:b0:6a6:32f9:d7cf with SMTP id 4fb4d7f45d1cf-6a632f9d94emr10639538a12.20.1788245879073;
        Mon, 31 Aug 2026 23:57:59 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66ed20d3fsm252725a12.24.2026.08.31.23.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 08:57:58 +0200
Message-Id: <DL3S9BFOU95Q.1LPBODV43OMZA@fairphone.com>
Subject: Re: [PATCH v2 5/5] iio: light: stk3310: support the Sensortek
 STK36C61
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>, "Marcelo Schmitt"
 <marcelo.schmitt1@gmail.com>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, <linux-iio@vger.kernel.org>,
 "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@intel.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260826175409.326131-1-jorijnvdgraaf@catcrafts.net>
 <20260826175409.326131-6-jorijnvdgraaf@catcrafts.net>
 <apEMCqQXyj1tAMoP@debian-BULLSEYE-live-builder-AMD64>
 <20260828154705.11962-1-jorijnvdgraaf@catcrafts.net>
 <apRGQVfPKWHvE2Ct@debian-BULLSEYE-live-builder-AMD64>
 <20260830201950.63838-1-jorijnvdgraaf@catcrafts.net>
 <DL2YT4S4U7C4.2CPGBR94G01FD@fairphone.com>
 <apYiYnlM-agfG9he@debian-BULLSEYE-live-builder-AMD64>
 <apYqUv_uuqZlhtOh@debian-BULLSEYE-live-builder-AMD64>
 <20260901025502.231703-1-jorijnvdgraaf@catcrafts.net>
In-Reply-To: <20260901025502.231703-1-jorijnvdgraaf@catcrafts.net>

Hi Jorijn,

On Tue Sep 1, 2026 at 4:55 AM CEST, Jorijn van der Graaf wrote:
> On Mon, Aug 31, 2026 at 10:28:50PM -0300, Marcelo Schmitt wrote:
>> Never mind, I completely missed the point of it having a preliminary dat=
asheet.
>> It might be sensible to try to estimate if the final version will keep t=
he same
>> name and PDT_ID.
>
> On the name: the Fairphone 6 repair document's block diagram labels
> the part "3IN1 ALPS/RGB sensor/STK36C61", without the A ([1], page
> 107), while the LCSC and JLCPCB listings carry the -A name. The
> diagram is provenance rather than proof because the same page
> misrenders two other part names and I have not read the package
> marking itself.
>
> The driver name would follow the existing family convention either
> way: this driver already binds the four STK3311 variants (STK3311,
> -A, -S34, -X), each with its own chip ID in stk3310_chip_ids, under
> the single name "stk3311".
>
> On the ID: the published sheet says 0x93, Luca's 0.9.2 revision says
> 0x95, and the part in the phone reads 0x95. stk3310_chip_ids is a
> flat accept-list, so if a final sheet moved the ID again it would be
> added alongside, not swapped.
>
> Luca, can you confirm which part is actually in the device, the
> STK36C61 or the STK36C61-A?

The BOM I'm viewing clearly states "STK36C61-A".

Regards
Luca

>
> [1] https://www.fairphone.com/wp-content/uploads/2025/08/Fairphone-Gen.-6=
_-Information-on-how-to-repair-dispose-of-and-recycle-EN-NL-FR-DE.pdf
>
> Thanks,
> Jorijn

