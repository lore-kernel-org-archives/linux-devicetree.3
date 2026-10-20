Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522721;
	b=EIzAZCpbiBsppaT3b26dQjqykYSTcecM0mqtYD1i15r6mmO9TxyC2h0qoH81/peuwx/v
	 ZSd7xSfte0rZ2xes4nmD1UwknMcvl2/XUh+0WtZPXxOra4uHlg8G7G/1Kp8o3kG118cGR
	 yOM5eojM3A9yHXcPqJ2bINHXbMvswHeDCdA9fUHCJVt0zE5f4yRm5BfoqK7toJ6FVCzUp
	 QA1cH8f3kLOs/YrScyp15JOw36LdeHZBXZ9QnfaChz1XE7G/Z/aYcgkwaE4fAg5hnuD4J
	 3i7vOonsvNdRA02NSnl8jZesVznUscmwgGz1HQaByOycwwuzbXwNdbM0jmSgKp2wBsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To;
	bh=mawDnWzs4fnqEe3LjDzISKgGdBwKvLiWqFhvrvd71LE=;
	b=ZwgKTBH/ltAR9oHSjhJQDqQw+6HtiwyLAGslmqOBckMxB0TSgW15ORUGonOeKgj833LN
	 7QuszWLOxfoPen/RMSP9DynPSZK4zraohluxhffAMTK+NDmD3FlIsoBOBjrwbvh8XTqq3
	 DtA/TKsbuTWvhccOwV7tIVQ/EhyYrM6Y+voZ+ty7q86cqux+KobpzmCATOO+XgCri9DLa
	 HVkbeZLL4reXrY32owaz0l4qFDoR5UUelZhZDI3+lhBGKtvBIcgp1pix+Y9dtlPy8XpmL
	 ZFRL4hTESHGuJUuy4Kmz478ySiOvy1oSemdL1pA5E0J/j+7aoc1igr14dvUkafBczAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=c25yAxJX;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C39606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 18:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45C39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=c25yAxJX
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35c76e9614aso6571897eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792522720; x=1793127520; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mawDnWzs4fnqEe3LjDzISKgGdBwKvLiWqFhvrvd71LE=;
        b=c25yAxJXnLGbZbe0H/IIYhi4952TrJ5/lFAnKapG+ZYVl2WYsfqGDERXe6GOYk+OKd
         LMpTqEtOJiZ26u4BS8SMfrqcpCZg51KHNo5gxleGWgg/p/ZfO8qTMDlAPnAuV6CZJrlG
         iTX65EIpY+srQNZp+/5rvEjJxVj63mCPTus3AryQS3FbqHpyp0qImaYyFyjLQRQGHEY2
         6BwnC5t8vNPtJfN6wbhOP3mpfciYF+esIex/lejtyMtMPqyx9SwdaY4IN94QNZGY8NUz
         NIQDrJJ5P9CssQTgfAqVXqerPmtiudz54SPXzhMf8WqIYi1RDUVKOoLNvTHjvEeUZuVM
         5dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522720; x=1793127520;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mawDnWzs4fnqEe3LjDzISKgGdBwKvLiWqFhvrvd71LE=;
        b=riHKYss5ejeat+ntFPr6oFe/Gsh2gSsNISPwZ2wpwTol1UKwynI+7g3q8OzI8yrr0l
         r84qWEiDg9B4ClkSRcXBDP6eac4bHce9caNeW4lvNEi50T+LY0mDpvLMUh5qdeW3bBIO
         VgGts6qEb/Gv4HeuhAPMz5X3xmAYAKGa6kQQDRSlKzQ0mMT30nPUnR2mBn1vSk9rPRnj
         RBLoElO/B1jqrY+LJA9ZdZ2DYx6vgPa4+wR+9x02Rbb9X4Zu5Q9d3ZQWYHKs72BkJdxQ
         YLtE2AAJOCo0+2EEF45R/Gwa0zfa7Jls9SkCAyPuyp+Djw4NsNes9h3djgMa11fKL2wP
         yt1g==
X-Gm-Message-State: AFq9FYK+79pfOARCU6/7Jo7Z4nbNlMxstBk5TUS1rnCnWx5pL+jmOOf/
	51lclN1OIhBrUj5JlGHpMXatIfZt6SVEmSyo6mPUGqiCfIgU7OZTGued0xjxOPpq0eM=
X-Gm-Gg: AYBFou11C2nV+CrHH1OR9UnsZh2+N57V7aOsaA4DsoGvFgRuphtbjO9QupmXt0pUtB9
	QLVH1tkXzi+E7lX6O8rmJdElwJ41iWmsBxdCsCwPiDYoG6fA9+ZjsRuzNVvh2e3caJJzEWtkaZd
	1FyWyFuuXJ05IOplzxt3zsi7Wp6NcGiK5G5VXYrbbMN2be9tcnvYyyTV8UeozqKZV+pGZZlhA29
	T2/ubXYfSic52BHWG3juOHhlC2Pp3fEJrLIFVF06l0yQhQo7nkH+qqbEOjFxHaRAFpb3oLYuyCn
	UxxVaN0GzL8kPdnb232b97peFfQWVPrVeuOF7gv5ZaLDUj2AjPJeHJ8EboMFbC8dnIifLvnCiEI
	wsLmDcsnWcvCSZDEEXhoyfZ9F7t81GyoSpraCfo7x/9zxA6jqNu46h3l69vZSrTwXHeo4tqVLiK
	WvDev+U8F+nIEqJM7LTCA5EMTv9mFh+wn38xXoJs3b+wyNhNVIoJsUbmbXr9jODPfCiVvzyl4=
X-Received: by 2002:a05:7300:4627:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-3674e164a78mr171066eec.25.1792522720294;
        Tue, 20 Oct 2026 11:58:40 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm454400eec.21.2026.10.20.11.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 11:58:39 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 11:58:39 -0700
Message-Id: <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, <sashiko-reviews@lists.linux.dev>,
 "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
In-Reply-To: <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>

On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_vo=
ltage()
>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in r=
egulator ops
>> --
>
> Good that I did not just apply this patch. Do you have time to look into
> those issues and fix them ?
>

Looking into it,

Thanks,
Abdurrahman
