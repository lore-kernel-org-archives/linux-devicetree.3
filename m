Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1518B1E5201
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776742805; cv=pass; b=rINGRWk7iute0XbLPMqU5mYD2dt6RHfZ/tgEQnlogMKSwfYKUNJ1cHotbCyrMvGG4a1eV4MRx2QpDw32l5nyaxDHHthuPBhgF/vbCujrRs4oigAjAqEyjkXfBpoCrP/7dCMXyqQeeD1rqRMUv4b6yingDG8F1+jPKvRsXMteFQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776742805; c=relaxed/simple;
	bh=ay2Jfk17hcUaUdDuLJYXG+7jPIuJWj+B5HL+s8VnJxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxUpJI1YUafEiYY3UbrA506v/Kfi4KPRvnNyq74xq3YlCZYqhcMz5j379hdaOckPNVLueGzq5r3y7J96jdtGC2QsQrPOsB+v/uELyZvv60kUZlcyDkPjlmIKdSfR+mtqcBgcOei0GxfvbkGynDm4Hkmcp3StS7uQ7EhpwnFrhtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVnCXnvH; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVnCXnvH"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-66ee7b9af94so1329749eaf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 20:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776742803; cv=none;
        d=google.com; s=arc-20240605;
        b=OJnP2HShTXe40K8nfiZtEevkYrz+HX2PrCqMqBVv9a275e8dIp8hJpolUXy3ELdz+l
         rz6pAZF2rWQXJpZ/Ajrj4hGFAhZA7MQGj6jHZcIx28DqcmuoogEq9GPqMAGiZg4pr5Os
         g6VqtZplTKlKRBR2fSb8EAs4bDN1pvynJWdjheU7Repz5GANEo0MO4PVHOeK/71TdHOg
         uzSJ0b19eeZFw4pItfE+Dodr++CRwk0ahi1OaIGAj8R205Zqum8aTr6NO8BPs4JXHw8h
         6hqaPKnGZD3iiTcwUGgBIiVw1kpdrvbC1A2DSLBqfMpFEf9bsDop52//mn2ZJRIQAFT6
         tLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WfEmyIjuh8sO3J0gUNj620iHLRP40PwnMO2vrwbQQrM=;
        fh=rQ2DPy9Hg9EGPpZvIWybioyFn8lNVmutMGG93p8SJbI=;
        b=EMD5wcEFnvZZ/pe5Xlw1RCW3bJZ86AjIpr9EX9WR7MXq3pezev+djCjCb/LAGmNqm+
         ToQ/+fp569JJPgNxEf1B+nhzaWoP4VDb3w4uLecdisORhaQJS689NV471+BQtaQAaAyV
         mnGH43CZkTQP8mFysRYsi8EG2ZmZQTm75Ga40ENeD24WLuhnSHKY7ne2MtexjqpBwBu0
         lPbi+WR6ePg9sdw8OL+sCpnSVYI9q4kQ/r/fMaYnvKBY+WMDY9OqYSgyNjPEwQ0RrgMk
         QgXFma6Zwi4J8XW8L9flRLUyn0a67+zOkNC8S255EOr2rOM2T9djXNVIv9k6/X57LI4D
         GGfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776742803; x=1777347603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfEmyIjuh8sO3J0gUNj620iHLRP40PwnMO2vrwbQQrM=;
        b=sVnCXnvHQar+6Q2Za4BrYU3lG/RqhmxITPcc3dyrP+LMB/XsrOe42LOsNSuIBX1oem
         uZBJn9lxqXOfx1nD6YJxHBOi4anKHOxXI/3ezxfSbfLwYEz4fpZ0I16P4n7CPhiUOs0S
         PfjZdIi18hGuqB193WKxVvv/gomnjzNv10WarY18KEUQp2oEtNUObzZKj7ZHRdaFlhcJ
         PJgdUP+95gXUSgDnA9fcmkH1SEVZGNHUIndQHor9K4ttzxDy65l0c0Bvt07yfUFgqEY6
         fTqvfw+cMHNose0x67FMEcmCH7XsqQn8KR0OOJliHSwVj7on2p9QSTNE1KbWjp4ip7tC
         6oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776742803; x=1777347603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WfEmyIjuh8sO3J0gUNj620iHLRP40PwnMO2vrwbQQrM=;
        b=tJvVPXDU1o17AFuIuWh51zY/Bli4JeWgaZRbTk/cSeCdK+ITYNfNyJhmdJe+7/zmff
         3EpJNc5py/zyIuxOzC6DrWzSsuAfBFrmMTpLAdvgBCJlW9MXldmc4/70QLBzh3V4zfE7
         0AYJLtYfpHY05F+2dH9jPKTjhxsFC1DpQVweQTRipUTLRlnXWsR87noql6N1c1XK+hPf
         1ZMftjTJ2iTDdAqlemGEKrbku4SmfW0I7RH9tOF4Wc6VzLrv8Xz1MiDnDKUDhnagPycC
         jzYOfDmGD0qxsEbC2pmW5vAcy2omSswtHglv2BQNSVENzC5a/Y0RzXDwU6ikvQTpdQii
         1cIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+c6NQ0Rr/86zacZu6xszFpwsfxYVZO6wbjnrIKw4+yBcuVh5D0poijgZRo3jCPaTJd3u3B1NwNBOJ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MXBpbvzbCBNDP5mZql/NDPNGL9AI7tzZ9Vil+YAZieeZB/AQ
	AmO3qdxymkK2OtFYYpZDIkoLu7WS3pFdgiNp9HJzPTIAqRDb4hLJ+RF0Ej383y8st413CQcdIHO
	tG/Ns7zaPjtwUp0eOB1jHCgh3WF3gUds=
X-Gm-Gg: AeBDieuhnlBmfQmtTV6+ck1rJJZXPnef3CmdcH706wZ0NnWxxxtPnax9xINPKEI8ZDz
	QLs1rhZ1U4jvjw1mk4OqdU+yUehmtr2yVYzcuWpjIQmosr5v7xuyKsJUE+0/hukumCRmgNBWyd1
	8kwBkkCKNWXZssYSvXZe574Wv76witGW8ljyDcGx9AR50y+MEQm6w+l138uXO7IemqwPgZ8Q93N
	3lHb8Ha9tzts9iQWK2mAVT6k6VZDEjHC8wpkfCoeqL1TZgRAjnrmCqfuDeCi6lSGKW7tQZnQUkJ
	U0Twxh+r5wGSCbte
X-Received: by 2002:a4a:ee11:0:b0:694:6e61:8ddc with SMTP id
 006d021491bc7-6946e619009mr6913077eaf.17.1776742802908; Mon, 20 Apr 2026
 20:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420061644.1251070-1-syyang@lontium.com> <20260420061644.1251070-2-syyang@lontium.com>
 <192f1948-bb9a-4831-a1cd-5ef500cfb413@kernel.org> <20260420-sophisticated-scorpion-from-camelot-b9f326@quoll>
 <6f3a890f-3bc3-450e-b3a1-20fa7e84fb8a@kernel.org>
In-Reply-To: <6f3a890f-3bc3-450e-b3a1-20fa7e84fb8a@kernel.org>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Tue, 21 Apr 2026 11:39:49 +0800
X-Gm-Features: AQROBzAxO75Rw73HtESCLZIOSvSLMdp5lPhXnj6EDHdWNc5UBUQV17pvBB6hrXo
Message-ID: <CAFQXuNbNGNYiSpcNbVyf530s2LEFnNwaXoqZU_V42Dsin4txFA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: bridge: This patch adds new content
 to the lontium,lt9611.yaml binding file
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, mripard@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, tzimmermann@suse.de, xmzhu@lontium.com, 
	xbpeng@lontium.com, rlyu@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B44=E6=9C=8820=E6=
=97=A5=E5=91=A8=E4=B8=80 22:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On 20/04/2026 16:15, Krzysztof Kozlowski wrote:
> > On Mon, Apr 20, 2026 at 01:33:46PM +0200, Krzysztof Kozlowski wrote:
> >>> -audio
> >>>  1.sample rates of 32~192 KHz and sample sizes
> >>>    of 16~24 bits
> >>>  2.SPDIF interface supports PCM, Dolbydigital, DTS digital audio
> >>>    at up to 192KHz frame rate
> >>>
> >>> -Miscellaneous
> >>>  1.CSC:RGB<->YUV444<->YUV422
> >>
> >> Commit msg is not a datasheet introduction chapter. What does this all
> >> mean for compatibility? What is the benefit of listing all this?
> >>
> >> You did not even explain the differences between C, UX and EXD, so all
> >> above is pointless. Explain the differences and why devices are not
> >> compatible.
> >>

First of all, I'm sorry for the trouble I've caused you.

Secondly, when adding a new chip, my intention in writing this was to
let reviewers understand the chip's capabilities.

Then, the C, EX, and UXD are a series of chips within the same product
family, with differences in hardware features:

       - LT9611UXD: Supports 2-port MIPI DSI =E2=86=92 HDMI 1.4/2.0
       - LT9611C: Supports 1-port MIPI DSI =E2=86=92 HDMI 1.4
       - LT9611EX: Supports 2-port MIPI DSI =E2=86=92 HDMI 1.4

Finally, it will be fixed in the next version.

> >
> > Also, you have checkpatch errors.
> >
it will be fixed in the next version.

>
> ... and finally (apologies for making it in three emails, checkpatch
> warnings come from different toolset): your subject is pretty breaking
> every standard rule.
>
> It's redundant, not informative in various ways. It misses proper
> prefix, it misses even basic description WHAT. Everything can be a "new
> content".
>
it will be fixed in the next version.

> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94
>
> Drop second/last, redundant "bindings". The "dt-bindings" prefix is
> already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>
> And obviously "file" is pointless. Can you add content NOT to a file?
> Like add it to a directory?
>

it will be fixed in the next version. thks

>
> Best regards,
> Krzysztof
