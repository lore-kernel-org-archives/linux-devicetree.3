Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1692453A54
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732918; cv=pass; b=FAYHyNbPynNsgXkOhDPfoQJrtm+Wf2Ud517CvR4gF55N6siIAh3EP2I6UOC0kFGwYdRgnxw5hytq/3rDy16aT6EB9dIYt+wMi2MYZs3kyjxmGS2LdSvqtKPUa8v/SyxECW+HHFCRrX6I2+EQU82bEzBZevu8VL1zm1H9sB5WxsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732918; c=relaxed/simple;
	bh=M1dK5DFyS2Xdz4T/diTsjALrxvZ/bfOp5H11ne5BCCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFUhhgV6uulDEp+lgTnWUqKCrtYN2XO+PhmlUSR2v/X/4kWWOu/7z5kl4RVS3Y/QeVpjNAzAQrasnQP8gyLKTyWDkYdQzginF85MXklLTKc0zsYDlXXW9RfixJJ7VFUUGl8JmOUVD/qDsYLAdDhGFmOhQC3POY84E0r3pfwlifw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/FVqspF; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/FVqspF"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530d8a00bcdso3797771cf.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 05:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789732916; cv=none;
        d=google.com; s=arc-20260327;
        b=fpGbRsKZeFAgBdoMKzpktVh3Twe8Fgu0zT+MJVqMNsqTMyhlZSyBBmgQPsdcCtjk4L
         qfyf9AX6HGRJoZwP9PGqfy7Yi+5ERzaQ3Jh4jt7XMpyX+x1IekglB36JNMfywT+uMQOt
         cQ7I4jisgUdwCQEoVBOR7+qncACHClpmOslLUTjIbQDVH06VqWgmEQ5VJR7cO9IpeVm/
         JFSs36fMEls78WOtRld5azvFaCUNNR8uYXTyQRF6LaA0LxUZ4izwq1LdvkpNnn5BXa+M
         AmMp1N/q0s8wvqW5+QAylRVXs3n2siY63bGdIUEtW/Dn5K8W91V8PPWey3O3abkABXN7
         FLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M1dK5DFyS2Xdz4T/diTsjALrxvZ/bfOp5H11ne5BCCo=;
        fh=ZedWhLm0iSn4ci5SxxEHKDtlK5MCXxYWWx+yE17vwNs=;
        b=Ly3vv8/rZbzOammwrOiIhiMNUKAI9qwPE3WXukX2KJNWBlvb6MT1iuse9TOqkMNshx
         KgRt5zZN1zvLFbL9ODgdF8a1U/8CXF822gvFiEhOj6FeeOl9HhaHvz6AsGOzLgbq0WG5
         KlNVpgJCtzboN+vknCBu/9FlUTv8daeuMgScSiTdnTSxYY4P79Te6xt74ZcLvAdSN8ZH
         bIvyvmdUwXWWpEARIL45j79FSkcEFWPMI8QKiL3ryPytwB7jIXZmrBWl3BQ4aMCRYQNY
         /6/hiC3cvDrq8wsSRyNjXlEYIDZV9rdcFT1yRUxv/6/EGC0DNkbb8M1JGiVTjBhfLklF
         Pt7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732916; x=1790337716; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1dK5DFyS2Xdz4T/diTsjALrxvZ/bfOp5H11ne5BCCo=;
        b=a/FVqspFnoZVJqVCKknw+PsR8Tj3CV4XK3np/pgDkLQ9DZ1bCLG/pWTP+b9bfNUuJy
         Dq3Sgh+aq39ZlHJbztUaFKIGtmIMUpB9KvIJkos63asDzUucV+Lzm8QHoIat8AAxW3UO
         8PK8FOg4Ka5nmBdb9Fxs8EEtjKgjIfbFOmK3FWiD+83EZP3ZNFNVohOeZJPNL8n1Y4IE
         knYmV2LAED9vJeqwUkfcgTeUhiaygZLH0fk4jhwv9RVOWsjuVaqMWVr464w7epAB1y4a
         ZDj54WIpFPk1BUvl8xbBtM3HnoHW+mrpQjSHEzuFnWUWZNgTtznfHajTXaL5aygoxWDE
         9uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732916; x=1790337716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M1dK5DFyS2Xdz4T/diTsjALrxvZ/bfOp5H11ne5BCCo=;
        b=VPuC4ZD+KMMP1x4ODB23uqY7Y2mOcX1HC6TA90J7vzZKhoiIglaB1M0mSLdkCjcZ/9
         tzzYP8KrL7YdHmC8MD5BItWVnuxV2YZaAV6xSl6O8GR5iCde8W+hcXiEuWZFapJ0cAhe
         QhV7zJtE2hQ8a9lhOYirn7ZhG63RskUf00xMNYuVHCJPVqI4fqcGQdWWWD/fXYK3GJ8p
         a8CFHByTyLOYpPTKrdZSwJlAJ7yxWAFayT8xEIcCyNblwMHMS1aILft2gvfGG9Ldc4Fr
         rMgq0eSykzqeGhYiuOyNKMhW1Bvo/exofzzqLnf3g0QOdbveMM7NYj/7lUrGjbIDffmj
         ND0Q==
X-Forwarded-Encrypted: i=1; AKwUvByeUmDUUw/YUmuRrchvukhayJDleDazUWSFshbj6Tj+PwBfSopdZQUiXe/Jpgpcf5MxfVk60Q98rWB4@vger.kernel.org
X-Gm-Message-State: AFuF++lk3jebCS1Zgz2dgYtEJOKBF32Aah3WFHTA/r7dgN1zepjUqcMr
	sCZr9pjKZLkQSCfNDL80gaGYg5H0ExiSlyS249ZlT9BKMAsXIGx10ogCm9WGrgkCwA1KTNbBT8o
	3W/fusxq931ZOrhytakz1icGlCNO41d8=
X-Gm-Gg: AYBFou2qQnL6G6FufAh6+T+mgTIjwUhAis6tlRrhGAw9fFfKpMVSREJW52r8UJsWC3q
	DqzSXyQgjzbncji0n3Tu4lOFqYUHEoFylkxt9RW0ZpvC8Nvbc8SFcaNIiQ2NmoVaUnOtE5IQYij
	w4yHjJW5mR54TK2r/NzdkhPZ9AZV2u0vvE/cKaoVBs+c4Ig4tYK6MS8wPlVxgb7zPcnfeRPyuyO
	yZH56XZYEcIbAcG6nUmgise0VEKpqfbvVQsnm5dFmlq3GHAW36XgT+0YqD6j710uZQpiyJgVCwJ
	peQXiPHVZDf4VyJQODAlzs6Jxn4aON3hmu2eRhgOF0ts9xy9eBCkK3A7PFai9LsnNPzB1Xqzanc
	V189dHF8Re0I=
X-Received: by 2002:a05:622a:118b:b0:531:1e10:b660 with SMTP id
 d75a77b69052e-5329e3ae068mr34191691cf.28.1789732916427; Fri, 18 Sep 2026
 05:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917212751.16729-1-palaomer100@gmail.com> <f98165f2-270d-4117-8492-e1bc94b19330@kernel.org>
In-Reply-To: <f98165f2-270d-4117-8492-e1bc94b19330@kernel.org>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Fri, 18 Sep 2026 15:01:26 +0300
X-Gm-Features: AcwNN1W44O_4sp_NosZJ8Bq5gVP124lqZbtMfXYK9VzIpzw4FBq01MkB6Is0T3Q
Message-ID: <CAKhZXnoyoqdz+BxfDsVH-Mzq7hdpY+_hwrY=K97UnBJigt1Acw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: adc: Add AD7816 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org, 
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Then why are you posting this? Did you read discussions I linked before?
> If so, why repeating the same?
>
> Best regards,
> Krzysztof

Hi Krzysztof,

You are completely right, and I apologize for missing this. I will
drop this patch since the driver is still under staging.

Thank you for your guidance and patience.

Sorry for wasting your time.

Best regards,
Omer PALA
