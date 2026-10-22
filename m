Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792649722;
	b=nF0heh3Y+mz/VmN8dTFsvP74yhzqn2Ur9wES6pWyGJXEuIdDHcZ6k3HHsCxqaKn8ezEc
	 GDVNbax+Okk7Xeymrw2N4Q9AcMc5Ex+zTUZtoGUm4+kNERI19b1vvr5hCiVQK+NTB9NzJ
	 7LVqGoaQRvdU8v9mjfaIMWlUtOtnDlmxraZ1z6uxc4wg2JnHt/HpoSV0iuyUoKVr3u0R2
	 +NBenGDZ5jcvob9SDFS9FQeaZ/gUi5BVG2+PJycjTUoI5O6fYMHFEvi3e3xnb00lKVDE9
	 zZZRp/EVrQOKxKAmci3IOz4JsPKhSbYbYq9rG8Q1n+bt0GdP9PH+Toi7ayRkvGSeQPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tNAW4moukw1CSqvHk1qqjH8bwOSbgrDYX8YbwR8FDio=;
	b=Tz2br9+bDE0dUUhulu2Gc3CAJIlJkwMNk9//GYKAmeHCKZW1D9LYmAdQ2SrAqknTnr2i
	 URECnzORb9l7h+/C8d9kQmPLXUKr9G6qOnnMTAKpvoJRd9Pgl6uhHTJV6G7SWgS/217UP
	 +VoqedklopZmEyoRXYMOkEtNfR1UwAsv4ucERU61KUH874eb0Uvfd/csFZhIjV4pbNpDs
	 L1DH5S6kiuCX9UqXSq/4789MIztE6AJf0SRGmx9ElRpXKYhbnp65NK5ykIy9H+2s1EG5z
	 ayRdbm24nA6LV9BhrLN1u3Ril96FL2G8xsbpmMOiuZdO5fE827YsIkYVrBGhBi8ALLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cKTdbRlH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5526E606A320
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5526E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cKTdbRlH
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ac4806e210so14082947b3.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 23:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792649721; cv=none;
        d=google.com; s=arc-20260327;
        b=LQ/+t8u+mBzafW+MsDbAqZ0jY83ssZC1PbWfz2X6GZSMOthFyTM+3qEBeQxbZuBJob
         RhSHWz4wCXiXu82knEDSjOh7Zabt3oO9ktdFyuXIdWwr4AtUe8II2fddJiOaYiyVbvyu
         8+W0/27YLgwqIOles9QRJNlnVAWL6q08zwnW7BegaNnmSo0+wmza/zdshWbxNj7I/TDJ
         8/Y8hr+xu9iWzj1T3hhUqG6yFoKQZwafWFSyy5t49rNRM1mVN2aLWh/N1TeZg/qL5RF3
         4XV438V1jt53OzLWp/YQADjvEybHPyncaSnhck7YZ1MM1uBvKq/hu6oU6f34ebInjqXc
         5hNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNAW4moukw1CSqvHk1qqjH8bwOSbgrDYX8YbwR8FDio=;
        fh=F5FSPRWYcQzJ7hzC4G0NxsDuZ2rolKsoUr4pZJ76+8Q=;
        b=YNWsWRONjHRlAri5OklSXvsQPqdFgKGe/+ghT/z8qGI/SnJoKjxL23+iCEy2sFwUpO
         H+roARG5vaLU1imwkqm/GzsEskWj7h6TtByGlr8nwxojQJl0CstHhMXTEWYbcEfIN3ac
         gT1tXV+a4ztRBPKSyidcXU3691+gq2TQotPRq4E5lb7Sn0WH7AEGdU3j69kxdSUwsgdr
         pkbbVYa9pQLSctKdtXu2DrtQKzh3iKFrVAN7Hr4JJL9sgEDdPjKJzflDEn4AMB8FYG2T
         H8jhkTx1EnP2UU7HwB/X7bhPqI+PwOuK9LFjTayJi4m+IGEUyFL2t0D3zQzOI2W0g8Fj
         hT9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792649721; x=1793254521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tNAW4moukw1CSqvHk1qqjH8bwOSbgrDYX8YbwR8FDio=;
        b=cKTdbRlH93tw3PHlpA+KIqygaBRjO0n5TBKcvu5IkjSlTY7T8koruWcRN9DthktJ3+
         l3d7ex8Dt3ArSl3mOX+SL1D9ICQdP9zY9W5kdqc1YW7e3/fZWFt0QgnDzNNysDsrD6i0
         8oCyZbNM+StCCCXlaJ6tYb6DfJ57pi/FEphV0G/XG73LIqojiujgd4bG2UT15GdWbPvG
         Or4hdqQCCVAe7pxQ+xYwhylXBjJtRKZTU3KtqwG8zNPOGBMqkYA41bHh69Xh5aTA4TsM
         1NRemldPZKt78zGFT50bVGLW/JPFgG8LGy2Wb3Sqxl18l8UcSjrw+VeZDPOaf6eZE2Vm
         v2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792649721; x=1793254521;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNAW4moukw1CSqvHk1qqjH8bwOSbgrDYX8YbwR8FDio=;
        b=IZ0bIFlj3eNr/PVTF89txyWDGNuOqx5JpAEOFokVJOW4aGtdJqe/BP0h1ZUxisjGt8
         5cdeS9cPbgItkQZOHE++pAvTKZqTr+ICERYeQqy7Bfe128DTrqr7MnGpLefm26HMrR3B
         O2zEonswqvXGix9iaH2slYJueAP8wNwMRro2drHUkd3d8MnYPPeZLflL1raINzdhzUHO
         WEHD4weZD9RKkLbyffyneB2BUVWN3Lhfi1cR9vQYPbhJ9dVIZBqZQ/fbCTPSWTWySN2j
         QaK4QTtogFiiHuL6kFth54VM03Rr0tC/RQ+vU7A50vTrfbGz9/80g9SH4UqXp4VQv5Iu
         bZ0Q==
X-Forwarded-Encrypted: i=1; AKwUvByImSZaZ2qq4cj+R5M1t/1U5k1xGuTfJbNV3xS0AV2HjOMcLrF+doQfK/UbDSMPDA6Dm4OOs6yTeIB0@vger.kernel.org
X-Gm-Message-State: AFq9FYJRH1U/75pqxhsm7kOK99VTomlUxE7qxSF0/LifAnkufvyr3Ow4
	F9K4LzK16D+Z+n1QuRrt+8a5oyI0aHoMrMZ+DHFNJstv9KLnY5E0VKvyNRoZnGFUJ8V6lYUHTCm
	A5fIOuCDFvHig6lO2gB64vvLNO+V9FBw=
X-Gm-Gg: AYBFou09QM8uBAy8ooxZFZQFnYEkHSA8EUgqgkWQwjvOlLZ/4r05b4X8yMu6SKUb0qr
	LMbwV9ipmHOZWtrUnMyhIhQbFRvETvyNE4tFABkN+b6Nyuhv8Oa1f9uUOK23jubbjSTXAC+OVe1
	b7VKKXcKxQhDhovKXcis70qMCcJaXPKRi7fBp8LTleLM5zYwZamARgcjXhrVbq2CtpC1zzvGusU
	/a0ZpmNHvjgQTgw7I1d3Frt0DOzfBgvFuaE5ChpKFOPzBS5AZvpHgW1VczdSn7Jh5WZ/cHaTIn5
	tqcf4gwkQ0JrWp2YVUP9W1HjvVJCqheWzQlCismhJKGrdO5b5jjUU2B42UKAb/Jgn+K9mZbPxfq
	/wi0YXwGTvhFWNsGugvcZdbFS2mVwjVyl
X-Received: by 2002:a05:690c:ec7:b0:8ac:cbaa:1704 with SMTP id
 00721157ae682-8b133fdcf05mr30804577b3.25.1792649721338; Wed, 21 Oct 2026
 23:15:21 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
 <20261013015728.43307-1-liujianfeng1994@gmail.com> <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
In-Reply-To: <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Thu, 22 Oct 2026 14:15:09 +0800
X-Gm-Features: AclHuK_IAy1t3yMlza72vaYDqeOJBevwsP67Waq6VJ7l78GWxOLa1DEch8zh9BE
Message-ID: <CAHk8ZdvrVt8TkZrSd7qyzi5AirL+FtwUpHT0QLcUd5qBJmhy+w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, jactry92@gmail.com, andersson@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, robh@kernel.org, 
	krzysztof.kozlowski@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

Thanks for your reply.

On Wed, Oct 21, 2026 at 8:48=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> This makes it sound like the retailer made up / confused some names,
> let's just go with what the manufacturer says
>

Just want to make sure I don't misunderstand anything, if this is what
you preferred:
```
model =3D "Acer Swift Go Pro AI (SFA14-11)";
compatible =3D "acer,swift-sfa14-11", "qcom,x1e78100", "qcom,x1e80100";
```
Thanks.
