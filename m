Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794124136;
	b=qCTlNa0hOf54eQPzGEUWUwDh7icHLZIzlZX8u9G6EMUveizUsb9GIDWhFHxVdn8RaO3Y
	 xOZnm8k24bs27nk/Ju6SRZuHYS6D2vnaJ1xXs66QZ+9OW68m3EKXxDEVHPXE5QVqJ+zgJ
	 CW8iPAdP8SYyK7NDbyI5peMXmGNVW13YMRqws0wjt+uetExwqaps0dwx/eTkcr4J6gaY7
	 KEYiQFgRCNjcCzHuH23ElNxPD3/sCzoS8cRR+OvtUjZ+XF6394d+FdxTF4S/VkprajBt3
	 1up0LxMJM9sIT9WhQHjOQ2P1EQSu8NB9ngqwzfT+6ucQEXMeRsTuwMVJvzdlELc4Nwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794124136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=q1Zvus5rC8hShMH7t8nxjox6t7ensKu+IzIvUVh4Gsw=;
	b=n9Jll4tc9pOu43gYTQnaqz1Hbpvr6L+bBjYczrEFsn5ZNwG50MDKgeRvK6A81eeM1aYk
	 cmMClyebFcKNg72N3M37nRQi/fB0k9rTssbA+FG9aKXlpjpZC4iAM3l1TPhJ26/wH/kDv
	 HFY0pBdK9o6UvB3pB9nIOdmk5g50dx1zIhD9QgyXo2Hc8Ity9VbABcf9z4LwRBf3nM7qR
	 4DT6yxVudkjTpPyha/z/odzDeMHfxlyDqVdelj9I5FBUsrq1tRnZWT8gluomqvUfDy23t
	 /ySWRW6zQcQXFoHx/Uly45m/7f979uM9wvGOFsogrxmT/4YihTHehjyT6w5BDsAks+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hq5Q0Zk8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90F0606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 07:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hq5Q0Zk8
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b360828905so1545897b3.2
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 23:48:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794124135; cv=none;
        d=google.com; s=arc-20260327;
        b=P8247bnIeyEAX+xK53DKLZUH0JYNjU7IW8mfiTBk67n1QMS9XG7YRFravANAgV7E5O
         WJNKR7sLwFw0vbfdHUlFQPRP2zrP56WMCk5w2YzIPUATpeHwMbP0d01HmK2w6NBhznhY
         fhHRypj00ABruNfafvj5QDGDUHbJy31OG4ui70wTizj4NUk4TQ5N7ia6oI+yCTuoWYyZ
         y38oFVq6ai2Hl6IcHIX+ILA9lLb7+IXljtJzo/OkbD+6ywiZl4mS0U6emhneXsxYykVz
         gVt9z9Yjz/DA83q6dAX3C9xmWb4Duq/rpb0Kdp8OonNGQcwG4czM+fe7Uoi/cclkMPQv
         B/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q1Zvus5rC8hShMH7t8nxjox6t7ensKu+IzIvUVh4Gsw=;
        fh=1+k/ettMv+rtx+la5kjlBwDmBP5y++S6s+DDc67P+Ow=;
        b=UWMnA9W8slQvbGm0JEsALmI5CAnE+UwAzX5buwmtZZQhEkDrSxRONPz4NDZiDetKVq
         sh7tV1XwGFzwVl+RH2LPolr0r6tSJX6rLuGmyLV7wW2IgPMMAcMkOolcTBkrzX1TsPkm
         gAYhNMqIJd9EsL63z8hVbOulK+TBS65clo1/Y+Y/sY40DR9BC7y1no9WGDNdkDZjdoDC
         tHxJ/PlGyLWJKS0mvdy923P5fa06NbRB9ro5xEWEhoEmADP+9M0sdxE+i5h/ynqBDZ/y
         EEJ3rbVDcKF/1w6+19OAYluBeklfigMMbkEl++zxBrv95pJK4crElXBYFEZVrO99g4S2
         A+4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794124135; x=1794728935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1Zvus5rC8hShMH7t8nxjox6t7ensKu+IzIvUVh4Gsw=;
        b=Hq5Q0Zk8osL5u2wXfAxeQHwqUJyw+54EnYgiKD7/xrVPG/AZjhQ6zOnxaqwS1kbXvK
         ZpD3UpEtYUwcqMHBJkFby5fuLjZ4t9CYJlf0gFfjHG+OLcuahCBM8jbXoIEIwMpRRgEL
         v+0+jH+zV3bWzaLYR8Z0mR5j1DjuZCsDkW7DMNTqe6XA0dJx+X3YwEhCDDmtaJy8Yt2Y
         9WUCHjM7n+fq8Vs22zsVrt43gnI3QfmskUJywDkZc1RTsm4CwUIEt6lCgN/4/hlogxOe
         1uCxm3dmJCyLEzXzXIh6UIhme+S3NrHYCsT/e1Ni94y69P1GSu90woc/Daqco7CY+fNo
         +JVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124135; x=1794728935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1Zvus5rC8hShMH7t8nxjox6t7ensKu+IzIvUVh4Gsw=;
        b=xvIY3xdlJ5g6IIta3BAWC+9jcXMK7WPS5AL/JZb+379vhSP56JacWRjdm5Lt/quGMB
         3mivJJz1KDkz2YWU8Pz2WK+OcV2Q56S7SufSWKqk5BnukltsBlceFpTBU5itiujuWfNN
         0crc6Z8XhZlEL5Y5uo7zXoxALFrKHjh81kjB9/NpSq4IW/+8OOZuqKVnBshDYiPUx+ZL
         V66N2WwENpxBrmKr+7pAmzY71IRHN7C6IHax6D0IAQ0WZPv7JnOHUDi2n+ZGtruelFhp
         ZoXciZA9epzpMMM+NJ90im9VY3IwR8o0p1uqNtUhkUDtegXQeiwVrCWeZhLJkkFLoMyT
         CftQ==
X-Gm-Message-State: APuU4Z/aFwh4VRjdg+iuvKVifafdI3EntGPARoi5PQSvBcTZQSo1AVIM
	SXErCQbpNMnf1cmePxkziuRn64csItDEIztXOFzfG3q2IBqnjIyTqtQn6B9hFzzLwlhX54xd4f/
	x/aw77N2vSLjGfk4OaCenkKbzrwTdOJ8=
X-Gm-Gg: AYBFou1K9IKdiiKgaj535oMprbCREkVA+JhuLSW9Y8JYTL3lYGZuZSCn8oLOi0IuC+Y
	QkyhdHrcE/Xuf94yGaCuDM8vfocZvABkfQ1EXuty9rLgTeiZweUO7s9J0c2ak50AkI18kYXH8x3
	0wDB170WVKeZNIKhS3V3Sc/qE/yw0oW4v1Ud24dZ0qzblpXUtLWECU3KtFKTOLigM/1s/nHE0XB
	3aS+Ov7lh3L32VXMhz1fG7jCDHTGxp9RHAChVAqmZTH5Hs9E8KixFlmq62JFYl2bL7YOXV/aSI8
	EdxzPIZIEq1+NSxPYQ8IoowVNf9XbNLLz0aW2ku/znWriXumVDLlAJETLVFA5UrsngvqfbI1x+5
	gb61+XA9A75Y4fs7aQGsIVH2tdUIV1mhMA+y8NskJ5WJSsGBmJ/RQSjPrEdjDuDA31kRjzd520B
	508GyqUPmIoNCxRmUmK+sk/9TU
X-Received: by 2002:a05:690c:388:b0:8b3:2b8:854 with SMTP id
 00721157ae682-8b36caf6665mr5647857b3.89.1794124134911; Sat, 07 Nov 2026
 23:48:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-7-e2c97b82669a@gmail.com> <sashiko-outbox-203632@kernel.org>
In-Reply-To: <sashiko-outbox-203632@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sun, 8 Nov 2026 18:48:44 +1100
X-Gm-Features: AclHuK80jFNSV0poXYzL--QRjzmnK-TW4SRDsdRWfR9wTFf83IZv331kn811FJs
Message-ID: <CANpmGNv2WHN_C+83FiNZHjKrdrPECCapDRuXL4Bn+0d=00pfLQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: apple: Add MTP DockChannel HID nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-input@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 6:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> Are the M3-family compatible strings in mtp_mbox and mtp_dart documented
> in the binding schemas?
>
> Running make dtbs_check fails because apple,t6030-asc-mailbox,
> apple,t6031-asc-mailbox, and apple,t8122-asc-mailbox are not listed in
> Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml, and
> apple,t6030-dart, apple,t6031-dart, and apple,t8122-dart are not listed i=
n
> Documentation/devicetree/bindings/iommu/apple,dart.yaml (the same applies
> to t6031-die0.dtsi and t8122.dtsi below).
As stated in cover, documentation for these was intentionally dropped from =
v5,
because it was picked up into apple-soc/dt-7.5, so will be included
when this lands.

Sorry, I should have made that more clear.

Thanks,
Michael
