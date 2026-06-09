Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5193EDE66
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993954; cv=none; b=C62EFwmGubhhf3xaXSC5H1qqpjZSQ4Gb03II0xjBM2/D+pZ4BVX8MxT8EYsN36iwuoFZsdzco/4ZuNQQgtEvLg4YRid++SaXBlwOYQ6hprlOwLCmlDfDXbjvKB3mnw/FEJCIgFzqsFDX3qw8URPKzSj04MJjPMrLZes4LJxeusE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993954; c=relaxed/simple;
	bh=dwkFkckx8A4lLBC7MNotRBFCE13hS9ANi2U4ayVEduI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2KToRrX67+FU6YSpCmuBqr2sDkbMrH143zWL+Ne+5ncyrMrJH0yYurA4cvpLjdC8aTv/hErP1QEdghHD97SOwoqxXoVoIypf08kcsllAVYTAnFTjkugOyxSFnvBkM2WZoKVQiIWYjmNqAZBrLmWbNo79+EsMDNQvHPlFI0xWYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yot3jYum; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yot3jYum"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so7506349a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780993951; x=1781598751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRVsCUYNC1QWFnnUTXYvdwCGlZn2yVPna1uH1jTZ0bw=;
        b=Yot3jYumJmO/y0b6nP/Qr/mWyuzoYZXV3MSuhzesudnqoMUzFE5zBOvf/KbCws8bfT
         Ps3JZ+sVVSPWPq71RZyx7LIGHjWD2jrOq0cZsIty/yq9CkJwX6dRuYJfJ8g7r610odVW
         QrCk/hZG3apyqTD+zwkzuT0hlDRjl7w1EU2Xa6f7ffyWuNP0P8h7U8WamUnlk7edNvhy
         ipuyz2+ykNrK2TLo9LrJkjAqArFLcjgBWbZpW5SF3Yhop855O6pvR9+qm3d03fwdPpws
         s/3niytXMv8fIaj9r4azaxcWVyzDqdkEt3xsygvIKdiMeKFwg/tSIm2bP3SJuAcN+LT3
         JPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993951; x=1781598751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRVsCUYNC1QWFnnUTXYvdwCGlZn2yVPna1uH1jTZ0bw=;
        b=HtEXfa3i0ugvwPqVoCVQA2byUWAxrNIHCJUgWp1xIBTAe2aIN7UXnpp4s3cD6CH+iD
         DHHG+9uLiZlSc1xwtD2ugkDjyheDR56p0/1GfbcK+KuSLduVCr9waROsEjckStrsNNmm
         kvTT7oQSFUp/MHhF13OkxizkSfE3ecy3jhz1hjmbfX0Tzr7uRkj5BWkbKAVHs37OfH9R
         mN0K840l8FhtSDjYq8qrmGoPDJoQF7lVaFzHuzTQSEzDwukZnL2td7BhZ/WZ7fuHOVMM
         1kcFZPcTveRyrue9oG/DtBrxCw6/t6v+2+wxbVjB3Nfr7aoNNe5WN/wUP/JdN9wrabh8
         OYVA==
X-Forwarded-Encrypted: i=1; AFNElJ/+FFJPnYKCEe2OqsIR8tb7RjRoRsSyoxUtMdQLkjxwsAygvQccQFz0WNXatQ59SoO4bD2j9dfvvPAw@vger.kernel.org
X-Gm-Message-State: AOJu0YyxNZmLFR6i95EsvBrk0p+BftTV+WJ24IHbdsR7l7TbR2FmsRfn
	cotWCAn8zSPjYlRjPkqoANBlalS+kHMwMc46gLhg6aBf6th9vEsBvEe3
X-Gm-Gg: Acq92OH/mlU8FJ/wdF300KuAINC4T+3EbMBPPs3p+3TKpATKbsLRJvmUXbWvZ+qFAwx
	s/lkVSEiT99lu6779Iqolsgwb97Vj3ZkfJlWh2CFylSXcQaxXuNn+dM7Qvw8dXjY3X668u9L5vx
	n/9svvCxeg41m/wGOlQeqjkvpypYlwjy7CA2oF5G/1aNvgzrkHEgKvRMlAGKx5JD/NpAr1+1yCO
	0iRysIuxRhVybI3/aaIujFjC/P4rNw3StRo7CPtJlQ/cNXz4czopKqLvbxBxE15xqhuhZ9s30PY
	IyYF31eyYiAWoX6K5iHbyRQfIRrbQ2bI1K31E0PmgFwwdRjXwvpUktIe5iha82+qdEu3b0jeDWX
	hKx9GtJk68AHU2ADO45qVpZi36vAeMNEBAWH9r24gM7KDVEKGEuG//3+9MRu6zUuxq51V4tZAR0
	NnPw6vxm3RZWLB00wWKjYxTYgeCQlQEu7DD8ymXGzXOA5U3RLVV01N0lnOWjmUIbnKyBtQm4hiK
	XzKTjTRs5ozIZsiJ2gpxkyfFFgHoCPB5iwSfmBSXCVlacdYuw==
X-Received: by 2002:a05:6402:3988:b0:691:6fc9:da93 with SMTP id 4fb4d7f45d1cf-6916fc9ded9mr4253991a12.19.1780993950904;
        Tue, 09 Jun 2026 01:32:30 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6915a637180sm4254235a12.26.2026.06.09.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:32:29 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 9 Jun 2026 09:32:20 +0100
To: Wadim Mueller <wafgo01@gmail.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxwell Doose <m32285159@gmail.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] iio: types: add IIO_VOLUMEFLOW channel type
Message-ID: <b5llqv5gikxjffro4rc4avcotwlaiizl5fk4mc2zt5fbpbotjh@bbycp7etmj23>
References: <20260530205435.37326-1-wafgo01@gmail.com>
 <20260530205435.37326-2-wafgo01@gmail.com>
 <ahx5cuM1xlOVP6DT@debian-BULLSEYE-live-builder-AMD64>
 <20260601104233.310ac930@jic23-huawei>
 <20260602-slf3s-v3-reply-03-wafgo01@gmail.com>
 <20260604094436.3c50f123@jic23-huawei>
 <20260607-slf3s-v3-reply-femto-wafgo01@gmail.com>
 <6at5vkw3byvbdw3przfchwrqscghdfhuwkv5xf6v6dkvfpplt5@3k3gjxn2ua26>
 <20260608-slf3s-v3-reply-unit-decision-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-slf3s-v3-reply-unit-decision-wafgo01@gmail.com>

On 08/06/26 14:24, Wadim Mueller wrote:
> On Mon, 8 Jun 2026 09:53:28 +0100
> Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> 
> > v16 is essentially ready to be accepted! I suppose adding the FEMTO format
> > could be done here if needed.
> 
> Thanks Rodrigo,
> 
> then let's go with m^3/s as Jonathan prefers. That does need FEMTO (the
> SLF3S-0600F scale is ~1.667e-12 m^3/s), so could you fold
> IIO_VAL_DECIMAL64_FEMTO into v16? I'll base v4 on top of it.

v16 was sent Thursday last week:
https://lore.kernel.org/linux-iio/20260604-adf41513-iio-driver-v16-0-1a7d09143bc2@analog.com/

It does not have FEMTO. I meant you could add it here (in your series).

-- 
Kind regards,

Rodrigo Alencar
