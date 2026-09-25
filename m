Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3EC442B3C
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317905; cv=pass; b=WojfYXZhNj9HXdKOHldbvzewBycWegLXgbT/pOwJHC3FH9Zmks8eHrqba0ihlOH8Ot90IqNkRfloSIFMGwA0j2+DsjlsOcTbKf9DulvA5s8YyFUj3tTTsSNl0Pk/SIDjXKMGEbXql54CCD8+DKuWuxkZf1WGWjjtywA+eRpUh5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317905; c=relaxed/simple;
	bh=hFhKrEvSZBpW410acqJJcTqqpIltVfjmIiS3oeslrDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQ7I8KZn2AfNd4R9gyPuzM8rs1JCCAaYunPAMYk2Wq4qHaSVX7cDWWKn6BZbsuuW6M+hisL8yh6QRgta8Im1isT/FfaAWzLvbU60jl/+BEZiVxuvMZStZqSm32rG2zQT12tV4LLe7ZaR3oBdSm7joK0OaAMXmFVpBZFSvEJ4BVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3UorOf1; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3UorOf1"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso597123eec.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790317899; cv=none;
        d=google.com; s=arc-20260327;
        b=rYsWrRCzx11HUHhGGtYZacGJEiS13agfDmrl1xgqdUvhNdsePK39p10cpT6B1VP2zg
         8wLV4F9uitjT6twKYNt2OdwPAAvlegmz/57lpfg/r6nR/qnyZcSxPeawTAQ3eehlP8Da
         cjy/BIGXTT3KOVWhZDNx3f1VE8w/JDu/ygPjskROpNS0UkgTkQfOV7/w5Vu0UOfR4XVo
         UbHBkRAd6gzkCODg5/cxqJvFztjlNBF/AqLTXd/fl/hshrZFl06SMiGbu980tlkeL4WV
         V2KtCEouR/yetHWZ7HpXpMN57DK3MJlBBECPhpe+q/ohjFMYrpXuOE9L4n5b/aO5LWBv
         Yjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5w5yxx9oXlIPFCQHU1ihbBkwH62nsll6yBXPYXhhP5Q=;
        fh=cBoVgUvby/6jOn3Mqg8SoQnPDoJHS5MwIPThgM+mFDE=;
        b=shzcYgon5kO8rEA08Q7KdEbYHpLwFin26Hv1fbbbBwVEt+XSM1MpEzummg5xmOB8hr
         F072ASjJH4L3kuC9ME6+0BBF35UlZ7d7vW74vLVaLCyPpVfnE2Lm0GH1zh6o6SFguFjx
         eHeSg0Rz/IudpN5NY2iehvXrrMUE9PI/JgOFzjPsbnUUTdPYPOuksPjGS1T7Buk3vLdP
         N6W8IECqbngLoTeRAgpCvM1H+jBFE5bSX/WSA+I7rRPWZqV+OFrvMUPSXCo3zQAhtPXa
         8NoXSO0nSEZycodGO7R/mc6ifXea1huWBhzFhIKLsXxIgyiJsUF/Gr6B7mvMwgXchacH
         G5qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790317899; x=1790922699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5w5yxx9oXlIPFCQHU1ihbBkwH62nsll6yBXPYXhhP5Q=;
        b=O3UorOf1qV5JIsqsIqmitfKsyx84ASkf1290p06d2IASL8ooh/gp9ytTZRi7eBojlB
         hUdMfuRfNMsuSlTMU4ekxduvpje/WFQ6uXygRVEz6nF5dp1S+B5sQSfHeSQIMbMJ797R
         +V3C+PGyufpBLMdmhuTO1NPm38ukbFqyog57snL/J2q7+v2Ye7UyFdfJPPnaSE0ENePa
         8VydY8L/xNvtQ2GUZwieMlqtNgLy5N737t/xV8IvaBJ9AtVTDHAa9dBVL7iSX1cRemJZ
         Em46WIeCMNi5L7ft9vaYvzkzp1/1eWWdYJ264lPkb/RsZdZL3DrEzD1HeL9rbmnLshJc
         HSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790317899; x=1790922699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5w5yxx9oXlIPFCQHU1ihbBkwH62nsll6yBXPYXhhP5Q=;
        b=A2AvyRPZKvWiEHXzgDsRxDpLWxPwQsIOyuDqWAvxlTMl/dt3TErKGNydKYBpFVer0l
         m7eZoLgin7Pcdwd249UvKQyaaqum7QseVoMxeAjBA68+jacXNwTVwIuE6v/G8ro6MhPN
         5welY/c89Qr6MSYH6KoJ3+vVrG1O8sAL2H1Ba1K1iJ2mH+X9a7zJ2nykGYiQBx6Hps68
         n4HxmWSBjnTxD+CO7Zu3yywYhONmxdapclVJsAySxrQVb13Q7sCQM5Ykc803IBOYkWDT
         xdSoXoTLVo6g7qwxgifCCq61B6RH1TFgXmpDOIp0QelNku2P+1XvhL9WFjzpfa87m2CE
         b5eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz6wrZrepdCn8PIePGwQS1iafAEnXuu0t5uu+5LgHWq8q4qmM6S0lyseUc9LJAq5kAAcKDYE7yTttL@vger.kernel.org
X-Gm-Message-State: AFuF++mFJfYcVvbhyX20wqAvh4IBu8v4fjuLoKModRVovelQiQO6DJfh
	+T4iK2/qNW7ug2nmS5LHhqJNa9xUyxa6zVIXtwQ2T11h8KhfXrfQMgHoiQtWcGkghZkMxbVH457
	Sdw+jDn8bzlQw9mCUWYBPbLdw+0NV+T8=
X-Gm-Gg: AYBFou1SLrrx+etGeCzR3suuOlMsKNyxzcTAQiFnf1kUNbqu6Uo9y3EDB6Ju3DV1aD5
	SIc0+rwBytmSqGL9+ygCnEH4pvr+T3v5Trw96bJWxTCUQM+uk07gn8+UzfK45wk7fgobWscvGCO
	bUaDByUsg63SIfhOPnaXzUExlmGyF9qdsNjgWaw6CZtKwUS4ck0yzEL8Es54xq/mwx4gqmcue+o
	DhST96bVEVYknYOeA7KQqgPPI2l7p/+PSzQh3Si/7vDoR/QG34EEkgecEHLqhMP6GSZGXHp9Ps6
	BbUGMuZYTtUH6jmoIqoW5tykAnEBlAKiJYtgc+fwdqhCYpB0CCNDOmxa
X-Received: by 2002:a05:7300:169b:b0:340:dca6:f34e with SMTP id
 5a478bee46e88-340dca6f75fmr2420984eec.40.1790317899352; Thu, 24 Sep 2026
 23:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
In-Reply-To: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Fri, 25 Sep 2026 12:01:28 +0530
X-Gm-Features: AclHuK-KyM2-sTWnkjehqT7295KW9AXgH1dDi83R9qL68ibmWBqVLHdfx79TEc0
Message-ID: <CAJKbuCZ1733m5UKXNwOV-3WBYNOFbgUA7QUfhAY51yskv6z-Aw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for Infineon Digital Multi-phase
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

I hope you are doing well.
When you have a moment, could you please look into the patch to add
support for the XDPE1A2G7C voltage regulator?
I would highly appreciate your review, feedback, or any guidance on
next steps when your schedule allows.
Thank you very much for your time and continued support.

Best Regards,
Ashish Yadav


On Mon, Sep 21, 2026 at 12:27=E2=80=AFPM ASHISH YADAV <ashishyadav78@gmail.=
com> wrote:
>
> From: Ashish Yadav <ashish.yadav@infineon.com>
>
> Hi,
>
> These patches extend the existing driver xdpe1a2g7b with support
> of xdpe1a2g7c model.
>
> With Best Regards,
>  Ashish Yadav
>
> Ashish Yadav (2):
>   dt-bindings: trivial-devices: Add support for XDPE1A2G7C
>   hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c controller
>
>  Documentation/devicetree/bindings/trivial-devices.yaml |  1 +
>  drivers/hwmon/pmbus/Kconfig                            |  4 ++--
>  drivers/hwmon/pmbus/xdpe1a2g7b.c                       | 10 ++++++----
>  3 files changed, 9 insertions(+), 6 deletions(-)
>
> --
> 2.39.5
>
