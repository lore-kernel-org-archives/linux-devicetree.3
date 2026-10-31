Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.92.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443368;
	b=QOJ/4g79b1v3pRDi14pBmGMwSc/oCQj++SuQYYGpdU3LSRGEtIyZ1hJTxYmnvF5qIA4j
	 p+hSjn7i19fWxpu6LUW++9kY63qveTTPXZwl9xZxUaK3/bhew7XfpghRqUp1u6Mj0MJvy
	 sVoJnjZPUqeDf7/FoyljN7cjSANnlGfSYJnPFmKsAxPc2JZmwebRhL+uUi1/JvtDoODR9
	 760V7nAu4YdN1ayGGDWA+BdhiWN5jdgA6IjWeinyFvIDoYBA2WWYTqZ0V1QGo/i3cIWdH
	 14KHqBPbgCWiQ1Xk808UoQGHvCaC85jA/iUaiMec26z8Apsq5SvikzUJx1YDJUNwf7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443368;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=orKhTfTJ1loFLWK1gC5AQvr+zdn3IizBZw/adtSa0io=;
	b=LSnHWJ8NumsrNP3YghaeC99y9bRLW7iWpwmlY8TnrjVYozCxeNOagq97qKsdpNycEybr
	 BzqXP2pWJvbuhuPOGbFoD0KNTKa7J5+ZeQA3nh/N2iwRFFKF6XcYn8bxojS1eYeUs5jAX
	 HdXjyIZLhPz/JrrRKKZsO7ifHQfwjv1X0rKHfb0bDXe33oi24IZBDgVBlFwk1rF+30How
	 fZ5YA2d9iCFzDJvNJ8ARxYauv4yebtGiaGW/MsUV43yZxJHHHXTHAlepXCS+jlSY0CarK
	 aqxlFhA3V7jXAXcdZjCa85kjlk0CoOpMEORfgTjgMLH+cWg72F+d+QomQdICVCqFo7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	dkim=pass header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=HM19M2tj;
	arc=none smtp.remote-ip=88.99.92.76
Received: from mail1.rojer.cloud (mail1.rojer.cloud [88.99.92.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB1606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 10:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78AB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=HM19M2tj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793443360; bh=orKhTfTJ1loFLWK1gC5AQvr+zdn3IizBZw/adtSa0io=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HM19M2tj6EbXZb/bdYPKBiqS1WZGxaaXlQL8iTRTsCdIbzH+/igpWkRqByXAFXdwt
	 L9j/QGwr2lAarRbet1+MEYShhpZnK3jcJVqE1TrKuGH1kRfrnNNEj9ERR9uGlvs323
	 /0CT9Y21opwFnlevgLZnGPtbdlgb+qlVvE5J+R2UhHdi7bhUf5W+yYlJFiVfTWpGob
	 acYe+FJr+WeCnIGAzzt2vgnmbZ//uhsX5y5Jp+R/OIRuTWpif6SvBsvNlQbFxVYRZC
	 skvPMKrmOxZ63PdrJw4xEWGI1qcnFkiZIj4PoYaB0LtVj9xmkHlUs0vhSWAGNmEc0z
	 2ak7ritWRnHaw==
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 6DA7021695
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 10:42:40 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-48ed0b68895so1088844fac.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 03:42:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzeaXyFNJYMqovKfHyZZAX+fvBYSb52ZNqbcxHvUwUz788vl7JM0jLm0zBamp7RDF5i139DKq4MFRWe@vger.kernel.org
X-Gm-Message-State: AFq9FYINpWztXmwSMk5KTM3wTUTjrzpoeVDM5vys/fKjtGARaCAPgHRX
	JkCV5O5favvMiwSFLJ96W34yHXt9e5O7Nu+BCcbMIWJSFbg+EKC7Xb5r2l19xo6JqKUSwyLM8B/
	m4Swn8d2iH6L/eyDQw+1cGyJLEvcv6Q==
X-Received: by 2002:a05:6870:21ca:b0:48f:e363:5cc8 with SMTP id
 586e51a60fabf-4a9077bbf39mr3116106fac.54.1793443359009; Sat, 31 Oct 2026
 03:42:39 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023235959.2988087-1-rojer@rojer.me> <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
 <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com> <4193517.ZaRXLXkqSa@phil>
In-Reply-To: <4193517.ZaRXLXkqSa@phil>
From: "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Date: Sat, 31 Oct 2026 12:42:27 +0200
X-Gmail-Original-Message-ID: <CABFmFwoDKspgTcsStz4WKQZ+diRLLzu+MMGaRD2D9JXqDmg1_w@mail.gmail.com>
X-Gm-Features: AclHuK8EOjybxhaUBVSSjy2qBrrG1wOp4iky1FyIolBHsnDnBLbFpYQOr0Uc5JA
Message-ID: <CABFmFwoDKspgTcsStz4WKQZ+diRLLzu+MMGaRD2D9JXqDmg1_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
To: Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergey Bostandzhyan <jin@mediatomb.cc>, 
	Jensen Huang <jensenhuang@friendlyarm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes, i double-checked the schematics and this is indeed a difference
between the R2S and R2S Plus, the change is necessary to make the wifi
card work.
sending v2

On Sat, 31 Oct 2026 at 02:23, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Deomid,
>
> Am Dienstag, 27. Oktober 2026, 23:10:31 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Deomid "rojer" Ryabkov:
> > Hi Shawn,
> >
> > agreed, it makes no sense here. will drop in v2, holding on for
> > feedback on patch 1.
>
> No direct clue about the board itself, but I assume the schematics
> should be correct then?
>
> So no change needed there and just send your v2, I guess :-)
>
>
> Heiko
>
>


--=20
Deomid "rojer" Ryabkov
rojer@rojer.me
