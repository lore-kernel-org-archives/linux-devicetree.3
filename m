Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C837189C
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615954; cv=none; b=UD9moP4Ya274OZf5kmPk0f76elfIqcLFVLtwBfxgc6MB9WOh3apaKIJMIfkkbQAMlGQJR9QCDkerR7QlSjs3eMZGbJjpPM7vAJ6FfGPiqI/paLTR0CQJkP+Wh8osCzPH420foIEOzrjlKODE26HpDV/c9KLGMejCb1S6s6mEdzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615954; c=relaxed/simple;
	bh=JMKAvhIXCNUjIDcumQ07uQ6ytuxwQvAU0JuO97CiZgg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7+zYlL5aBw+gNrqR1lL6EG3aS+oZzD0JmZQdPz6x5MnaoipkPuraKEKSXlMqmknWxrbfcL9MmQ6B8DeT2uRfQ2ux1whXnpVZ9EZW276iUyHvJg2WUHy2deHfXsk3AxofgVI1sBCLckBtbOQ/wrjalwGzFaHPKNWd/4IpnZh2is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxcfU1+k; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxcfU1+k"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0728so68575f8f.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 00:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615951; x=1792220751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M9cNNicW0o/hRO92NlnGJ2pji8f57gDd+YVFwHh22Sk=;
        b=HxcfU1+kFifjL4FwBpqnR3SP4fU7IVhK7AMgJ+vFB5YO1heTATpr6yWcwkFxR3wp4i
         AjqeHkCDyUVPG3/Uqs5HFkvttghiCm1xpjh6gWA8AnPL8ZZEomUwvgaxYFwnAS9yAsG1
         Ef+6Z2H51B+6++lbrXKKIAg/Ns5PAiGz9lKx2tqvSH8Xk6pG/KJQ4igdp6NcDlFhLKDh
         qlE/qVC6zsJaZK8OTVdwjUbySZQCnomU0n0lZEYSGUZgHTF/zUeKKnNNQggYsZjV3yjY
         yei3W/Nwdgq7u68uRiqtEGr0e7Xd4tMagdIA0tpscz0VPyJmos26SwQvVks73fJHExiT
         cyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615951; x=1792220751;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9cNNicW0o/hRO92NlnGJ2pji8f57gDd+YVFwHh22Sk=;
        b=tChggTTuY++ZhnTut/KyLQkBdvB6dGfeodOfasqOqOfSLgV5VCFa3k1JmFanlCdNPE
         FgtqryEYqlwjs0bgpSotPwLmfCLzQLdxaXhmjdg7Iig0DGqVx0Fe+Tv5KCgWTYFyaILP
         qgdsormDL50y9PnrBd5mfVyK7E+2nvw+NBopJTsGNiboNthQTqrSlN8KIriB/P4TWSOZ
         uHad2j6if1ZZiOGZZwtYy+ah8UmZwnTv+ogQuxV5Gf1qKt6/L6jmu+MZ5fDD1t5dMFWZ
         LZvZrHxGra+gUf3LOC7lNEkIxpLqLZImqAmvis93BD7JHsdAdAnKoyFehgmxEaLepXbC
         Qtog==
X-Forwarded-Encrypted: i=1; AKwUvBxQ5pEoSZ/N4nWYi9qQ7/gy8HmkUb77OqMvNfQ2uPtj/qiD3SWYd3Wn1oIfX6+MKbZySV/Xqsw3Tfnc@vger.kernel.org
X-Gm-Message-State: AFq9FYJtiM0LiG9vEXBRXToFm/pu9PaKLSQCL7GMuQoJZC+G4UiLVuf4
	HeTYPeoK63YbKFARR1O+42/poPwECPxDeiKNnlPYxHPH3wx1IrwN7zNl
X-Gm-Gg: AYBFou07L3BiZjijv5ULWrD+pkxLhK4bXJLZe91j3JkK8ZNlz1QlU6bch9LxcXIeSrr
	yny8GWlkcXgU+gwQ/qr9Hr7bNVcGSQNpyxP61IUMkvsWvA34RRytZNWSoOdmzHnxppZY7wRLybp
	zG6faClOlIG/yOzKJVtsuD/3Yzwbgt+V8b+HnZvatB8vqTdK8KaEPnmLpd9qv57gMjLUVJsBsyv
	T/yOmcEVO/lMB477qf+POSZLyh1rT2p50gpRikYzcIyn5b21xUfH3dMMuEeeOM2VEREcCiOAEXe
	UU1vuWnB/yYOPq/kzeApVSb73IhYmpmaK3FmbBZMSWBZCokwkHJMluniUXkJ4v1LF9TEXRfrqRa
	IsodUIfzHBq/YUhd1Giu03hIsLsnUcYjuukLBRQAKgayMX31xjMOC195C7CZbHZd919wwHtzBMw
	queaQKHgB+YEu/YR91nPO37cU3pBa2BjfF/oh/17b9eBHaFJxf6KlkET1gQu1PiBfdcRU4H0fLb
	OZisYYAXwRyZbqe5NbA7Fr2u1EvErxM28Wm5UB1iEl3T4DitMH2G8XRFrMMKoossGTPqdzCVnO3
	7RI0UDZLP3d4lEPRi3bDn5SM+J1fd3GD4UqC4tpHLH+IWxzva2hQkMKV6YcTDItO75h4jIru+PG
	7dBzb+2b1cBC2W/8EYmSa3WNq23f0/eQjn1npS9mZQ0l2C7c=
X-Received: by 2002:a05:6000:4308:b0:488:823d:5060 with SMTP id ffacd0b85a97d-48dbacf1667mr7353088f8f.48.1791615951135;
        Sat, 10 Oct 2026 00:05:51 -0700 (PDT)
Received: from systembl0wer ([2001:718:1202:45:4bf3:6161:9f6f:60cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm7449823f8f.56.2026.10.10.00.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:05:51 -0700 (PDT)
Date: Sat, 10 Oct 2026 09:05:48 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andrei Stancovici via B4 Relay
 <devnull+andrei.stancovici.analog.com@kernel.org>
Cc: andrei.stancovici@analog.com, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam
 Beguin <liambeguin@gmail.com>, linux@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] iio: adc: ltc2497: add LTC2493 support
Message-ID: <20261010090548.789cb699@systembl0wer>
In-Reply-To: <20261009-submission-ltc2493-support-v1-v1-2-3dad1d4b152a@analog.com>
References: <20261009-submission-ltc2493-support-v1-v1-0-3dad1d4b152a@analog.com>
	<20261009-submission-ltc2493-support-v1-v1-2-3dad1d4b152a@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 09 Oct 2026 11:43:35 +0300
Andrei Stancovici via B4 Relay <devnull+andrei.stancovici.analog.com@kernel.org> wrote:

> From: Andrei Stancovici <andrei.stancovici@analog.com>
> 
> The LTC2493 is the 4-channel member of the LTC2499 family: 4 single-ended
> inputs or 2 differential pairs, with the same command format and 24-bit
> result. Add it with its own channel table.
> 
> Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/2493fe.pdf
> Signed-off-by: Andrei Stancovici <andrei.stancovici@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
