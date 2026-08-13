Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D747478E5E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631967; cv=pass; b=H0uNnDlZTUkN3mQ/XwGv+xcJstC2YIwIVhiXL0aVODh1XerDEkGLNnnt8RWLidY5bvUKxYuQiMgdsO0Wo0aA9IQ7aQgNzH/Xf8EaA4isW1hLai14ockwitoVkaj2NQ8zbsVmGTNwrCkYyEOL3w9q17A3ZafuG91G0PTC1Re6pQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631967; c=relaxed/simple;
	bh=8Zr+cqOqPXT6jbK9Tf74odv6YuTKizZ8icJ+LU9tk/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2MYx75I2Usbu58k3Mg7nNSnYIbTqwYNIu5EwABrCbszFWtL7NR4VUcwHoGRRuo90TAyN0cE1zfinhbvNfrIHzSyTj63pe51RqTIZIeeJr8uGlm+93Bsoz2sPtjBeMUf6jNMEbqN1ETIQJAsyOpB0roX6tvGRDGqCFL/6zuvVPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVDf5QHW; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVDf5QHW"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c4e9769bdso1497176d50.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786631965; cv=none;
        d=google.com; s=arc-20260327;
        b=EZGIHi7YVGnOXWRHOhQ+xrury0lXpYNmev5DTyN6qo0n3JJmcGYaBuAr98bQGpsGm/
         xTON1R3r6EzU0x46gOBjOwSKppbH8IJ48chYMshMBAUpbHbAAuQ0IvkGIi0a0whIqPUT
         oGXLXEvt1/Sb7r2fcODVXPuXaYnIeEqU7nG4gCOA0jfIBESUhe7ES7YCri1h6vFezVoD
         UoefifStKG1hjvj3XxXxWQpf9ggi+20Dlzq/zNxsJ7DVfeu3e9hAx05wCazhjvOXB9oW
         K6Z9c0jMKKQSl0wLVyt7eltEn/yfOHgyOMbMex+j5UNEp2WMyNaxq6lqq21zs0Bca5oL
         5g2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8Zr+cqOqPXT6jbK9Tf74odv6YuTKizZ8icJ+LU9tk/Q=;
        fh=6FcjlzGdFkmn3jKFMd8/LKUHTMtO8WLokdhfgPEW1wc=;
        b=V+JT//d4f4Eh7NQ4xrubfIik23JJqpq73DmIIJmS84sLOhV0eS9HC+NSaYGv2eplPm
         gSC6g0FMJA1AiML7tEv+KO5mtp7ci+8CryrUWhwRnfoNFZgk4NllmmpegCtGVc5UfZaK
         tf5/oufmvaStjnrGird0OVV0WA0Bcu0AT0VgbJpJK54Wu/q7wM5ZFyQ/Sqix4z/l4YCy
         fko+vKc1Kq+s9uODyVb73qfkOGPY93063VLGALGpXWWTlQE/1Kf6GvZnlM1aZAxZpt+N
         8d+bsjpPzpyqsUE7kWJGCikwNB9XadyXOFqwmo2MllYcQ0HL+O5xkAB1G58RSCAmKnj2
         cYSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786631965; x=1787236765; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Zr+cqOqPXT6jbK9Tf74odv6YuTKizZ8icJ+LU9tk/Q=;
        b=GVDf5QHWPFbQzUjX/u1N76JIIYwOk0csnOd4CBF69ZeQA993v9HhBf2236tj3B3TSu
         Ss5dzupgVIh6r6B+DhXHMLDdDB3y+ztbnlbfIfy69g73ZFTNrgwzMFmQeyQJW65N3cLe
         hvAIP27y4i+1r0dwO4Hr2gbwewqXbAI3VRj5aKKJi2AkuiVVIfQE8JSsyCEIjYRF6Sy6
         hwjC3VkNLQtzoq8AYHBAbFFcRBOrZIc2aGJ7D+4CyZ+QdJE9Xm1bMCYvRL+aXxl1NP0v
         SI3SFBbvDJKlovx0pXmy9uaWQUS2N42KcC/Cyad3gcn0qN6rcP3V5w3aDXBHeo43LC7D
         fewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786631965; x=1787236765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Zr+cqOqPXT6jbK9Tf74odv6YuTKizZ8icJ+LU9tk/Q=;
        b=k237eOzRrFPFQjaRqAA638Y6fLa3txF4ZCWXcMnuQ9DKPPoIkdUT575dgmvPi9CHBi
         WGiB/RCUZMZhD4UaQnoOTno8Sb9+8VqgKQOtBX8MzX3t4pdFZ1S+fwAHTg89NFQYgM+6
         2YSzA+qOYnuNjCmNwA3jkhtLJndqyu48/wF/7LxR3cB0DanzGqUeeAgOgIdiub4H6LvJ
         Rr2Nae7bnIiZOTGVhMry8NIiZ2bBLaFPbdZUgB2ibHEf6y3g4TySxLg6qkcG7Yc8eNAz
         EnFc4XabkZB9POH2WmSudpsAQYmHzZRe4SG9fv/kNyMvU/fboID01AmtJ/lBOU9vS0gQ
         ZXWw==
X-Forwarded-Encrypted: i=1; AHgh+RpffuASgOT04HZrhAro7ffa4AQRqDL5d47c9SmtFf3cuYfXb+zIHZsksgcyTgpStARnbPekQIR+BxUl@vger.kernel.org
X-Gm-Message-State: AOJu0YweEaFxmdpMTVnGrsuo8pM6WmVDKZ7M8v0ihu7ok7tBCLW9OpGh
	+89urvqGlkAvadZo9sGHiTysSlCzA26EgJhYNOKvwz7yUIDrG/qGgxAYNxxC6gQqT5dV1gEcA0y
	2km2yXdiroFfu+PT4NDEQL5/jLboWAJ8=
X-Gm-Gg: AR+sD11HIpqqwFko4za+Z4sGdVPZusEcr9DU130y6vrE4jiolMKoael0FkO5aqYPbmD
	y1+P1VYIoRwTgzNLKbmEISYj1tIqYO3rVsCCR14tQWFjr/BeqEBOGEnrfWeHKP1uIe+7cXW0Lhv
	96c3I9DLUe2vl1sBeQxzUGEJ3VAB5nSDKEVkL8F07d9550jQnNRex8/Gbld3rryJGswhXPzcEv4
	0ctRHtEgLxUElkQrtQzrI4Z4QjGN84nA5vkK4hoh/SsKAT9yyh3aSsr0OaQK6KyT3k2yLXeoRLN
	+QDJSTXSN4WVVbKSMPR/l1zy0yag0fPxJ6MkkbZ7YGuLGsyC5206AHuZ6LJq2ZzrUObOtd07nPC
	I
X-Received: by 2002:a05:690e:1ca:b0:668:24a9:a7a2 with SMTP id
 956f58d0204a3-66c5144015amr2178393d50.21.1786631965153; Thu, 13 Aug 2026
 07:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326181726.64957-1-challauday369@gmail.com> <20260328-economic-blond-termite-daecb7@quoll>
In-Reply-To: <20260328-economic-blond-termite-daecb7@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Thu, 13 Aug 2026 20:09:12 +0530
X-Gm-Features: AUfX_mz1Va2j09Iy1CRVIuBw0EQrt2i_eqpbFdm_zeWbdH7HGMhZGyg5CQ2blJw
Message-ID: <CAAj-GBnP0Tg3cAP217WD3OVfpUvtBeKFogwAzUW_WhG9=U15nw@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert
 to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

> On Thu, Mar 26, 2026 at 11:47:26PM +0530, Udaya Kiran Challa wrote:
> > Convert the MediaTek G3D system controller devicetree binding
> > from the legacy text format to DT schema.
> >
> > Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you, Krzysztof. This patch has not yet been merged into the mainline.
Please let me know if any updates are required from my side.

Regards,
Udaya Kiran Challa
