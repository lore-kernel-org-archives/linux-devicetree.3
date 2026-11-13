Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556464;
	b=4lFAp1174Zi4rc9BX5P/I+ZdNhDLZ31VToYxL8h2noF81MTD2zCQqXfbx5gJFMhh7fYy
	 sGSidqLWyZfHMpyX39qd46I81ZnE1R+HJmKCjTIVRqsp9ZyzOUchvf6frdlE/raGMyI8G
	 4rtUuKvXcvdyiYGyfPcyEGiPM5d/Uhbs6ic8GoHn4o8NLhfQFZuHYlfganIZm5LFOYpKU
	 2bH1Ka0BGWO70EJLC6PCBMmV8ef0Hzr8nFZK0uxIUduWbqsy0NpKlp8l10o4QQCmIHJ/V
	 zKGB3Imb1/+Yr7JIyAxzQ3o0cSxJu40OnJs7WZ+fAMIrWoh/tJ7ZvJBlik1ff+M5jMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
	b=EuuspGEQvPrV2+h2nKASfbMLi9q0qQ2GG+J4C+KGn851/TODz7iN5wksEYuqTb9As1UY
	 QAg/i+21JXkfGjDIb07I6RXrp8u0CdyEmML1ju43CQ3TJxFbUfshJMvqTItEb5cQg1YNH
	 N5rXkwpwV/EQjql5NmyfgbXJgfoMgj5KqSmbGfzZM2K1Q++BrSIEJ2qvC+XXrpMmWtIl+
	 agB20zRiCX5k7CInVmWcIhr4RIPLRUFxgCJfL3H3q3AsI28FdEVt/5Cs8TyhKYgoKDH0R
	 7Liqd3NtwaXsZu3KeS8qHTSKmYCFDGUUK7TLAE9wIKYGtbF4++z4jY4WhOuZiTm0BMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWBfalc5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA71606A33E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA71606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWBfalc5
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso1352271fa.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 23:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556463; cv=none;
        d=google.com; s=arc-20260327;
        b=kMmpS4W5S//1JedCtDUV4p/yjvWtlIhdVba4umqBbqi2hTO0ER1KlDCkND/NxKiyCS
         uHD2f5mKzpBxVWgVDe3mq1VChuYu0Dc6eu1FjGunTcp2f4sKJQ8QCDMKOO7sNY4yTR3X
         zDNpo9YB9OQTbEfob8nvMKMJxPMRz3uQ1bFaHdad6kk4v8yzNNV7HR24KEqtZweCUn9V
         /vAhieklhRjMSDJmjIzIh1/ASjGazVe1Z2rTzWFbaokZOfLieRqibPQisr6CgP6fhsmD
         MVcuezyqZEZpo8QSODZuXSvDHvAOrNhbBA5YKeyHcqUYC6tRqhlzWbnze/qTEmUxiLAp
         ML2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        fh=xqNI1xQMPBmPv50pmlZ9XO8bmu04Saxlx+MtjGEPcWk=;
        b=snGabNBmjuxK0NjJrRv6THNeULEQghwQL41Cjk6kMtUuEdP0zocffYeuT1VmUcEoyj
         s1HxeIUkJq6KXnUR5rz6bJ6PR0ojIKXp2NRyjYcF4P1kdlDkZw5uoPfVZOeAoYcT1uSF
         UhYCsH0LoDDSCOnITeuKjJMvGOgFaW5iauuErWaYVkZkChSadV2lYPzmngorNMkYcam1
         cqxzEZ8tV8Nxcec6D3c/tQ+ukGPCFhszvfiNb8gfr+E6/IHaOyHa2PnXNUAOYsGPJpGO
         u8g9mRN04laCCpi/graHsNiTGKOXt8ygzDDks7zKJdvmBfKfSR7sEzaDdosXCVcfjb7J
         o7gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556463; x=1795161263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        b=lWBfalc5odhHJQWPB0IRkDdkAm39vie6sBqtg8GNvSOoS9CHH/JhdjaTbIhIyVAckk
         GC3OB9V4gEMXN+jAMZPKOjBKUwtvBNfCBZHLMLPWFlZ3YzpBiIHNu7ovHm884isdQsVY
         CqP63Ase+zOCljdTJKMKuS7udyN5XNbtaORQGTZgVgSsPqnjGz+6+nUsQlEJAi0h6UMo
         uIpgGhI1fWB4yZ1mZLyTLJu2gAHkLxAT5Ygda7E7aNNiSzbg8tUH7yXumwmJQMVcoXmb
         cpygLUps/5aVKjZRECROZAlcCSnUSF6i8qCt1tPQgGDud5mnI9ml5bPRVixIOjUqthxr
         KkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556463; x=1795161263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        b=IHaD9LAovb0yEpUmNhTFi8XIRWOuv2xFCvdUsRmjIV6p9bA7Gt5ijljvsqkYvRgYDW
         Ey3v1+j3aA4EPnnwGRBIu1v7DrnmQL/0FaYUZJ+2MI3IDv4iExBhct6MJPtWH4COGa/0
         z+xd1KN4/POrieBHGP/wMmhvCtbgAo8Qh51o97yWUBaaWp7XQT2EVGdUV2PmeRzlx0wX
         IgEd+8XUkjiOApCr86N8/zTlPJGgtshPHSucv6tRHazXsa1MqA7b0lqAR2JRExgODzKU
         6wuKt0lS9iDR8Kj7tgfQ7e9hUDl814FhIpaPUnufJmoPjIQawBPvewy35aFS9XCHiuU8
         hyrA==
X-Forwarded-Encrypted: i=1; AL+hErFk5o5zn5iNFiidXCrYW4sef/iIlfQO9TdL3b6zv6jTOVw2TDaXu+y0XdJu/79oayEo7cq7jdVWZprw@vger.kernel.org
X-Gm-Message-State: APuU4Z9wsN1VWdK9q8BgYVkzqryAtavrbZBjvFzTC2Cr6JEBTwzs3rF1
	eEwl4qqD0dNRBzLnR/bnhrdCvhGcE8kV9k6bBIzz4Ld5THPklvP/U5noh5ctlE4B58U3+yFs38m
	FaSfqLSdl/RxUezKDdIOymP0kYoqcm5E=
X-Gm-Gg: AYBFou2G/5S1VORriofci7DJ6FJ4KOD/RZ3ddYTSPC/v+r1XMH2J9rtJLIs94pmhELy
	Iz7JOMu9foMs4PJTRgkK80XEgGGWPO1iC+oiXgjhy7nOgnw1eSrcKpkBH9mAz93i6Rya/3xMFrN
	Vy7rbdyHhfbz6mdJLbXjGrvJE/Gv3DT6jwvlGUz8V/MXIZ1wgwVWi9oe7WxRlEMKgk48k6QgurP
	BCD7oYPT1D+Ra5P+HxXaqZfh6txltXw9I7hMEbQhNpInAksaeCDhFGjYf1uBqUl0S/0wntDTcoO
	rMH11ThZUU0kmqyTF8bRgNtzjPXWM0VkC56somYccWqrEn4vZMuWZMem3sXRrgB6oHjKtvbbDSR
	o3AseIQT5CwssMTvkWR0MwJ/HxvyPCeaqW84i9+d5OqDGvMGTc4YJBeGVtVMYF4nRKU0WK7k=
X-Received: by 2002:a05:6512:3da4:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c170434e66mr787433e87.0.1794556462452; Thu, 12 Nov 2026
 23:54:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com> <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
 <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com>
In-Reply-To: <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:54:10 -0800
X-Gm-Features: AclHuK-bvo5dDl4JVbgBvuOoQVFelHqw3mvt8zCrdDgOeg2cHm6xn5vl5OrzWyU
Message-ID: <CAEy9hNU2ox76TFKtdisqUHDxZ=3gPVBDBcjz_W8RtCpCpK5d7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Le 12/11/2026 =C3=A0 11:19, Philipp Zabel a =C3=A9crit :
>> If vsi-iommu accesses require these bus interface resets to be
>> deasserted at certain points, why doesn't it request its own reset
>> controls?
>>
>> Depending on implicit assumptions like another driver not asserting its
>> exclusively controlled resets seems fragile.

The AV1 node lists these resets for hantro only. vsi-iommu would need
them in its own node and binding, and both drivers would have to move
to shared reset controls. Device trees without them would still hit
the SError. With this patch hantro never asserts the AV1 resets, so
vsi-iommu no longer depends on what hantro does with them.

> There is a side note on IOMMU doc saying that once the IOMMU has been
> enabled it can't be disabled for security reasons.
> That means that writing 0 on VSI_MMU_AHB_CONTROL_BASE register in vsi_iom=
mu_disable()
> could raise an SError so I would suggest to remove this line from IOMMU d=
river.

I only see the SError after hantro_remove() has asserted the BIU
resets. vsi_iommu_suspend() does the same write on every autosuspend in
normal use, and that has not faulted here.

I don't think dropping the write is enough on its own. With the resets
still asserted, the AV1 domain is powered off when the IOMMU suspends,
which is the fault 8e26d4c20ed2 fixed for hantro's own suspend. The
next bind then resumes the IOMMU, and vsi_iommu_enable() writes its
registers, before hantro_probe() deasserts the resets. I have not
tested that.

If you would like the write gone as well, I can send
that as a separate vsi-iommu patch.

Arun
