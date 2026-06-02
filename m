Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A513EDAA0
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780414546; cv=pass; b=odD+XZUzptIF//PwAlhsp5DcZQ3NDH5lgvWet9uRLU+MGjsKmwnabMArGJ+vgnJr02mahdQ+vU1YoGxgn5xECgGcU9Q0KeoMss/YZ+C3DBQkTIsNfSHYlH9pgsD0efD5vmwalQi4KakZZQYx3JIh28DlfC3IJjisb24R3ccfDOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780414546; c=relaxed/simple;
	bh=oKhZRKSNDQsRxVT0JGr6nA+dxNnWA37kOR8/qGg6Q1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTuRZ5kCyuWo0Fml8hq4wNVmj54ot3Lj4qlnwdNidc6tUVpuWguqHCBdbK3IioXB4izf+Y56HXMpglSkGX2lCePK08u5UzfX8p3H8dFe9srGh2l2CxhdONJzzZoie+8wOgXBwweNNOiTGQKVdaMmGIg6yBbsx1n78GF36DZN72E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=nTWtNnAk; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="nTWtNnAk"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84237c55ef9so1227662b3a.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 08:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780414545; cv=none;
        d=google.com; s=arc-20240605;
        b=k9AQE0zY6h8wzWI1gOHcBfKaB9yGrdKYgOtcsdAz5VurXTmTu4qw3g3qs4g1osPMGU
         2v7yvIoTgsoHRx7tDkGzKvi/ur0iJwFxjhdbN0b6NxfujcHsGopDuahm3fXNBz1ZsGWa
         IjryGUsRPSAsqpU16cFuV31zGzS8KOQc7+5HBKNXsgyUwT/OeL1x/knBNb0lV5cs3/gB
         hMkz4YYg3TIfhmJy44M6JNs1WgRkaSsZzpu6K53n5TBD3fLCnLwCfzpNtafM8yRAi5kR
         MH1DQIDMiu3LFVQiyDw5yyCHpNaU384Cgy7GP8+0J76WQDYsZI6QsWd0+t1GTGc8ncHG
         U4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xIH2uRX8VoTWmyY9T8w1tKTf1uWV1y+wbUzLia8/LPI=;
        fh=hCqmlAELkJOWnZL8WLVxT5Kj9rTVthQ3gn5ZNoLq7TM=;
        b=PzMi8SxpSp+uYiBrtPv8jc0LnTrZ1xwqks/H5KN/YETTkL1ph4o9O6aNQPk0wXoCmw
         x6fmLIcWrocaVMV5hSZ8kDkXYM/02ozNDuake8i1mooK9IVjhMdCgEr/GMYay678O6ms
         eEjWlxOkTgaKRi+aiYig6Q82z8BeqNMIpEKgksJpZYfBGJxgW15OODXkZAV+J64//OFl
         M57iQ3oVFZ9uIEqTwdDmUgX8tDzMQDmO5Ty9WZsrig7SuZw2oJLjyJFHPDadIPM62Zk0
         I4MHa95dmsdUj6DSaVJtwC6TET0MhKYjDJJXgrkpNmKfLygcqIIK9Q9JbA6A45//0V7l
         kcjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1780414545; x=1781019345; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xIH2uRX8VoTWmyY9T8w1tKTf1uWV1y+wbUzLia8/LPI=;
        b=nTWtNnAkx2IZWX2abNaxi39nj78ERcYHOQaia/o9AT0DuOcSJkDKIYJ4VnHqmaFVu3
         LfRcqexPGednanrxMWijK6dQdeuj7Pi5A3nx9YKv/CQclRE//vE6DIKj6d62tR4D0wuw
         zpFx2j9j+Re94WhP7QfWxYNIH03BJfbG/Q24E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780414545; x=1781019345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIH2uRX8VoTWmyY9T8w1tKTf1uWV1y+wbUzLia8/LPI=;
        b=cPb6njWo/99GpTWVcYPFN4pCgHFWJuiutgxuzR16pGq7Zrlp3dyY0fVzrHm0XG8zrI
         ppvS2s8eD/tnaGNQ3v1b+zLV2z4qNXnH1LbpAS0nDtsc/AVyezYCdWO/fBtAQ58lEkwM
         datKTdzbQCF3JMR7u2C8QFDy9V2osBy2FLlrUstSLIClOC7/XChU7hcmeVoHLUPriFnu
         7cw0YIjwq7Kg+lYRbp0/1w54o/EC8dbA0rsr4DmYRZOWn6h7dhiNrgmkdKUKJrWR58k9
         aA9hycyEG+FtO2w7tZh1WGd62ONCGXAJJQiLQO3S3kaF1Lvs8dAX5dR1E8HWoMIWwedr
         eIYw==
X-Forwarded-Encrypted: i=1; AFNElJ9d9p4mqOK9r8O5l2L4YmTyGx6R9ZpWNlCPSYOE5FuLtLd8/SC1LhBVHu30SIAWsKiVJLAugBzhZ4zV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyza+8Q5gxZ0CbpdVSPH6qg11P0oY3yWKfT5BsCmiDQNhK+I+/6
	DpKQhD9HX/fbkPkRDa39UHEuLE6iNt9kCSWKk+09SLZwLQTLr8yPHImnm8hyWgWVrighHhX7mxp
	2Nf4Fm/0lGUuMJ7twda3/9hqIwuTr5tR9DRG24B1ghg==
X-Gm-Gg: Acq92OEsVTOsvxXC23CMKcLGzZfDNpdUZe2mzc0Z6APU8JlyOYtlynBG35goTmH65HL
	s5LSCkFysMjggFw3xyrWlDsGPCUyfORT3a9nPSY/IAbgm/HV+TYSPifi1aK5hmai8AqmLqB0OZ2
	VvLK/+pzmG8s5Xf0znc9FzKRLTpfIz3RUdtdhvYczn9b1kf9vEFhbv6e3aulEUMjT6xxQ4gYt8R
	qhQ1glACzox+AM8DU7Yx7iBAcCYSAR9FO+kcOa4OekpeZEvCuEuEXxcdnS7SveKbugWXzLrIMus
	1hHm7EJHGC4EX8Lbmhi4yV+83t/ny/Uof+yGmrxQagWayo4imOel0owPQ+gsU/FV42R52m7D/y1
	HBQsC2aDIqWiXtI2AX0puLR1emJDLHeYyQ5A+k5tEeNAjtNqEfKlAWMwmsuq4Y+gXxpj2n8JoZ3
	D0eb5O6BR4FoHmrL7497E21fuYtP81ENs3vHoY6TD5AzOc05l21gzGr1nAzpE=
X-Received: by 2002:a05:6a00:1bc5:b0:82f:9985:d4a1 with SMTP id
 d2e1a72fcca58-84282f4be9emr114808b3a.24.1780414544733; Tue, 02 Jun 2026
 08:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601041336.9497-1-daniel@quora.org> <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org> <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
In-Reply-To: <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Tue, 2 Jun 2026 23:35:32 +0800
X-Gm-Features: AVHnY4Jsj6RGlQW4Ea0C-JB6jRZRFbYG2MvxlnfYpmwEKpWeXFNaNH003Nh9F4U
Message-ID: <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	"Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 01/06/2026 05:13, Daniel J Blueman wrote:
> > On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
> > triggers unhandled SMMU page faults
>
> How do we know that is a correct address - does it come from qcom
> documentation or trial and error ?

@Vikash, beyond your comment I linked in the patch [1] kindly cite a
source for the different stream-ID <600MB behaviour, and share
specifics, eg if silicon, firmware, or driver and constraint, defect
or otherwise, so I can include a definitive description.

Also good to know if my workaround is good for long-term, or on the
other hand handling streams <600MB is important/useful.

Thanks,
  Dan

[1] https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574

--
Daniel J Blueman
