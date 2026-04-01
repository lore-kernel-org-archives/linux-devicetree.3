Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094F62F546D
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 17:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775066255; cv=pass; b=XXvnCCt6CQEIy3X7YD8WkkWP/yde4ssRKY+ujBpQAp48DV5zh9LOw5xOaSXscqakrm0o2z+7wfCcwWCsiRaGWXGOxD4T3iVCu8MWjCX2s+aekhPOR3lWuyrJpeI1geoIxnH4zZp1lT60/Gqc7I0Qy3zOQ+EKDHGJxSgGDU9S9oU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775066255; c=relaxed/simple;
	bh=sticRGoiJd50AlwAmvUJQlHaSt7SV20x9UbLs/IndR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6Eu7EddqsiKF5ctnYr1kk5qDZTTG1ku6/T4qUgEWZHXIKbIc8oM+TKp75lCcAJ4cVqEuxLo84GNOvCU2z4ipidf6uikHQHq4cqQKal/iLTVvp/8PRxh7PIXfjDahM8MK7QEcpTLOojWPdN/oANQt80sHX1mfzeYAAD2SIX/UWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQgIY29K; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQgIY29K"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c76b6f9a50eso813570a12.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775066253; cv=none;
        d=google.com; s=arc-20240605;
        b=kQqsSfqBniuW1+MQfFTCDaxNJc2C/ZPd9Cd29LNRBkmaxVCryfbYFegEYkUP5T8g0D
         D5GlQIbQnTGtel/XOkV6wYqJc1EmACe5Ym2ZSfJfbj6hR/mJmngaKzD5cOSNEHVcxudM
         YMScSIJqYdZT0/WRujzQ94TkNvC0ChzOQ/t8995hZg/225NPdcH9ZSGFNBJF+rldG+1/
         Kh7QCwELaVKDmUsn91JPNDkcM2RY2+qoDv6m4QQ75LWWZXZvYAswSUVloQDl59hjKBvm
         qkznD7OsGGz0JrsPfxOHtpqjw0QW6yHbC7ex7F688lOraJ2rn4KFvHfyxaIDz1twvFdh
         SH3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sticRGoiJd50AlwAmvUJQlHaSt7SV20x9UbLs/IndR4=;
        fh=lUZ+IuCsRk181+Ekl/wdWOlVoUx7PV/qLeCo/SRktZE=;
        b=hJM6IlV2azXNr8orQKGrA/7ldUhXlnBjr6JzHllH0eai69u43tKpFOwGOQsJ8HP8KV
         DMt29ouVkEgFUwr/hs3dGXkfCgdJ9cvWGPq3+RSp6wYSVsc0cvETvJMX8wJU0tk+Mv55
         7AHXVXjqlDHNa2hNHv15NsKI69IvD33z23U87lTs/pZLqP9jPq0UBU1CyitBKRatnJAR
         uGCRplZICoH6zrNs9rvIo5EfSje3yb9evjB4J9ypvw1mgcUrFlWuK0+DVA1RxWcAHvJ5
         xAvMkhgVL/K1nQfA2ENgjcH+9PeuupYFTFxlgYhTVf/5Q2SC4dEnwxNNzdTyFHRNUzPm
         ly1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775066253; x=1775671053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sticRGoiJd50AlwAmvUJQlHaSt7SV20x9UbLs/IndR4=;
        b=kQgIY29KkmJJNofIeLm3bt5BdPrdNfb/Ea9nKFO6MW/kMh5mvIAx/7NHx7kHC92fW/
         A3p70YuXY3W0zd66c9I9cFA5WsY/PNdiaRAqa8CPBt9LQWSenu3usSZ66K1idNlUY60c
         CFKzM2qG9Q0JrV3PdqGcYRsXqHVAQn337vsaKmisETQzeWpJfv8nTue2khR8O+q7TMIj
         BmcgAakXoxgjyleI2Wl2UAOEo7cSvvOlP5ZE1uEJ/YwO/tphlU5f3upQJbBZknKvfh8C
         vg9kRTa1cWUnpPaJA3Kq+buAuQjX1NUMDH6rgFCUgMvRVV7JpY1lOK2ZmYwInN9Pj2k/
         8Rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775066253; x=1775671053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sticRGoiJd50AlwAmvUJQlHaSt7SV20x9UbLs/IndR4=;
        b=VgbdtZbQhwahT8pB4DD8B3ZVzyoYW3h6absq0M9qKpArVfwwrrPXeuNd92K34zfuzN
         i6CUkO11kg7hPFOFx8+s2a/v5+Yw93AM5G5RMOrNViFuUS3tpNZt9qj6mAecDx53qlX/
         /DcwZYhTYG3KxzVZ+6RTH8CU5gGpvBP9MuPrZ/bff3WincCMTjYSAmZx/2nQXusQ8fq6
         grXwhyh3k5s/H6thlpqC1cb7+VdHNju2vLBMvcLSYjGbnzSaoz3Hcq+OUN3Mu1DND/Xe
         WGM5O3mLWL+4HRLzIris5Drk2GemxxDkWASpCbDYelL/b/cRjdhERjxJG71y6OxHgJm4
         tjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7W9oamYeTvOHS9Y2R3jPBWPltIMmEVGqEAqOZdmyO43zAd2V+Cxz1oprCInPbpd2CNq6SFbwTwFzC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9IHdQoBeevAsoqRmdtY7rvu6f0rVkn0VoH3O/E3tZh848nIwB
	wcP340UKfXz6WSeeATsfwaPSHhKwfyrpQDbPTVznVp/ovN3nJUWWQWSIDFEyxRFEfXYcSZ6q8/H
	iUZ7E+3sEXiv6xR+KG9WpABSi96LF9w==
X-Gm-Gg: ATEYQzzOC6apqdp4MvbrdLK0n3rqJyJpxI2XykfOqyFRiEfSh6VPtZim2w1xTMAU6Id
	MaksJhusur/QX68h22rUPr5yqBGEh0ClrUH3pP2FUe/cd7luI79QAQdRofaBNG0WRwWJtsbOdcX
	7bOO7dCnZ5jTDIbnYfopkXKBGzshP5a1JN3yjsfN1IsFJdWssr/Qf+2Q0BNwpKyHjNMxjCyj5JO
	YOo3NWlFuAZmqjdSTtmHhKeZGR/xs97quHYg4kIaJkcAWFTrwINA7V8O6AInhzwOx6eABdLiSZc
	LYXYqk4=
X-Received: by 2002:a05:6a20:7f97:b0:39c:4ca1:345b with SMTP id
 adf61e73a8af0-39ef76881c8mr4839961637.38.1775066253292; Wed, 01 Apr 2026
 10:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325095016.48752-1-jihed.chaibi.dev@gmail.com> <20260327-orthodox-brainy-poodle-738eac@quoll>
In-Reply-To: <20260327-orthodox-brainy-poodle-738eac@quoll>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Wed, 1 Apr 2026 19:57:21 +0200
X-Gm-Features: AQROBzC78ISNFgpUptYGFrXZELfZR_BvImx_oWPzjRYKyKtm7OmyEjYn8MBo3A4
Message-ID: <CANBuOYrPuLKnxqOLOZUEvBSG-4ceeOWMhQKPZhEctzcjBUnbqA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: twl: Reference converted YAML schemas
 for subnodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, andreas@kemnade.info, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 8:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> No, they were validated by their child device schemas. Everything was
> correct and expected.
>
> Best regards,
> Krzysztof
>

Thanks for the feedback Krzysztof, I have sent a v2 of this patch,
please let me know if anything else needs to be done.

Best regards,
Jihed
