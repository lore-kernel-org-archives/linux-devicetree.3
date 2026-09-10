Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFC8361977
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013158; cv=none; b=Ot5WE5CLZh6/Jn3LePL6iRws7vNZ8jDt9fd+koxLn6jYEqbhxyRtVyaG9+nLwEUejX63lMlhGRWzrepfYlZBC7ok9TpzrdEz0aCCQHX8WeMC/Bg+LlzpZd2u/md4dK5uR1QxpxQfwBH7kGf1BLFAI2Fu1OKQnjog8bcfuWAHM4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013158; c=relaxed/simple;
	bh=SZex78iRRmNEPMFSl7W6+Q7e+5ckE/x74Tq8Bf5J1w0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=QEsgv0+h8EfCSesxOJtWIRIVjCqYt+xqAqlrz7YYVW9tPHohhYbeuAuBdC/0m5dSCbzbHte/TFveTU1SQym2BRSresjvUrdL8oWfYFIVPrRB/lBu10dQExW4SVTfELXE5HIqS6PC9z9kQ4ZtUixa2YL5P0NFsHFwqoXrhOjOxWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=As1RbXNT; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="As1RbXNT"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4aa19a3faso770594a12.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 21:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1789013156; x=1789617956; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X6+WYysp4a7UmvnN2F6aIsypaUaxxW6rRb3Z7ELY0Lg=;
        b=As1RbXNTCFgY4u39aT7fbd4NvNji6HnzwpHVBJqKU5s+TCixW1zCKIzLidmOfgCWPI
         pYnbS0EG3ilC0fLBrrcKziVs9ww7xDsrfAFAerf0EzEjfa042LV9cxF23Fi9ZyXAtYEa
         cNsVFZa3fPfvFp4OxQ0a4PrU1wC7gkOZRZ3vCgxEIbTRcjceXHZgKG0Clw+kE+xxpu2Q
         32hdnbXEzVTMjNNjRMZ6FhwZZhkuQvCFtpzYrwzRV5R4/2WFF5cpabkPWgJCSbK393xF
         JoxllxTtLOKanRlimgJNKydFKS6abPb0NklNcjvq4ZHuNJljEQxv8McaNKx5JBIBIRZ7
         Glrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013156; x=1789617956;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6+WYysp4a7UmvnN2F6aIsypaUaxxW6rRb3Z7ELY0Lg=;
        b=Jjbp/FZwtcjqqDrP5TbDuMNB2Zc6hkXclLQMWf86SvMrVLMr+SY23veX3z7IJz/vYc
         isiXTyBJ9wMv6buKkNNRflmX4Xuz7TVGLn7+BKbqKHcZUKVR0xKlCP5vegttYxgsYodY
         tRvlRGHSQO3sYeG0frmQa8O3IkXq5ehKqRr94xrzBXnKX6yFRt5UElo+rRIbTnQj0KuK
         ziUVBwmL9zoYiR3vxAZzASZJoXPupdkaX+pN3+9KVzzMCH4xhT2x+MLJ7xDTtvAdLe8N
         6iD9qDMhyrZZrRMqHWdxhVwiSN5VddHreWe5qoA04s4hxJ00kOeXrCOBF5C6cwIBhuvO
         H/Nw==
X-Forwarded-Encrypted: i=1; AKwUvBx2vNmcckQwJKjxQctWS8ncvyX3lL1swc/6GWRtF52j85c8p8FV9drzk0skLl0bt2CTcPYxcb3MhF+2@vger.kernel.org
X-Gm-Message-State: AFuF++n2MoBxOw7D8h9cNaLGMyFDyrM1oGE43dOzvGPZh0ZBJrwN65Bi
	p8geZtg2OIke0gI53dMBy/da37bzK3dNVM+DORYwkFe5VpiQu3b9PA5ZKvu7wRY4qnI=
X-Gm-Gg: AYBFou0WNX8ONkuIRzxPYjTMwlm76UADTIREyCGf5AYXMgW6bbccRsHKzAGEToHS58q
	seANTwLvIWy1Nx2+f4pWHEEO8xZTkojy7laouihTI69bbyWte1SvRpbnNzJZvV0Emq6lupBhZJU
	ASdP5brVVxBd+EAsAG0uF9ItL/J9g5MN+Oiq54WUh+fpNfGRwjOf7x/IvXSx92YRtXUnIVVYrif
	XKvmFJq42Rka2/yXxikPaOLZG11NILf9xiEUajiV+GpW5iNUhqyqosdsypjQYRTKS4DwoTL58dZ
	nnI9oTHAkiriKeDAsX0TiDUFgddG5KT6lmQ12ulj6IriudqYPvvQUdDuubCEeLtS7s7qxP1wPpK
	40nUffQGtSwkBpJ2qnmwQTPlQCsH27DNeHpKxAYk3VmO/6P3HkwVs6jCJvMInWUTlh054KR8apD
	jEHO9GBWR5/6E4ggXNScD1uRY2S7miGNOIAwz5rqgDKgzBEhdEIFd3OQjek76IB8Y6nhSTT9A=
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr58669335a91.16.1789013156095;
        Wed, 09 Sep 2026 21:05:56 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm49043209eec.26.2026.09.09.21.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 21:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 21:05:53 -0700
Message-Id: <DLBC8GPBM4MK.3002YEAZ3WPT0@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>, "Roman Gushchin"
 <roman.gushchin@linux.dev>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, <sashiko@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] of: property: add i2c-parent to fw_devlink supplier
 bindings
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.22.0
References: <20260815-b4-of-property-add-i2c-parent-v3-1-c22588b6482a@nexthop.ai> <CACRMN=cXSy0ZYH78sQ88QKkwYtbE768kh=KzRhkYYCO4SX2m-Q@mail.gmail.com> <20260817145906.GB579285-robh@kernel.org> <7ia4tsosfsj5.fsf@castle.c.googlers.com> <20260817210038.GA1775252-robh@kernel.org>
In-Reply-To: <20260817210038.GA1775252-robh@kernel.org>

On Mon Aug 17, 2026 at 2:00 PM PDT, Rob Herring wrote:
> On Mon, Aug 17, 2026 at 07:36:46PM +0000, Roman Gushchin wrote:
>> Rob Herring <robh@kernel.org> writes:
>>=20
>> > On Sun, Aug 16, 2026 at 10:17:08PM -0700, Saravana Kannan wrote:
>> >> On Sat, Aug 15, 2026 at 8:33=E2=80=AFPM Abdurrahman Hussain
>> >> <abdurrahman@nexthop.ai> wrote:
>> >> >
>> >> > Platform-device i2c muxes (i2c-mux-reg, i2c-mux-gpio, ...) referenc=
e
>> >> > the bus they multiplex with an i2c-parent phandle and hold a refere=
nce
>> >> > on that adapter from probe until remove. Unlike muxes that are clie=
nts
>> >> > on the parent bus, they live outside the adapter's device hierarchy=
,
>> >> > so nothing orders their teardown against it: if the adapter's devic=
e
>> >> > is unbound first =E2=80=94 e.g. while reverting a device-tree overl=
ay whose
>> >> > changeset attached the mux nodes before the controller nodes =E2=80=
=94
>> >> > i2c_del_adapter() blocks forever in
>> >> > wait_for_completion(&adap->dev_released), waiting for a reference t=
hat
>> >> > is only dropped later in the same teardown sequence.
>> >> >
>> >> > Teach fw_devlink about i2c-parent so the core creates the
>> >> > corresponding device links: consumers are unbound before the parent
>> >> > adapter's device, and probe ordering no longer needs -EPROBE_DEFER.
>> >> >
>> >> > A plain DEFINE_SIMPLE_PROP() cannot be used because the property ha=
s
>> >> > two incompatible layouts: the i2c mux bindings hold a list of bare
>> >> > phandles (i2c-demux-pinctrl takes several), while toshiba,tc9563 ho=
lds
>> >> > a single phandle followed by an i2c slave-address cell. The two for=
ms
>> >> > are indistinguishable in the flattened tree, and a 0-cell parse of =
the
>> >> > tc9563 form would read the slave address as a phandle, linking the
>> >> > consumer to whatever node happens to carry that phandle value. Use =
a
>> >> > custom parser that only takes entry 0 for toshiba,tc9563 nodes.
>> >> >
>> >> > Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>> >> > ---
>> >> > Changes in v3:
>> >> > - Fix the tc9563 compatible check: match "pci1179,0623" (the actual
>> >> >   binding compatible) instead of "toshiba,tc9563", which never matc=
hed
>> >> >   and let the bare-phandle parser misread the i2c slave-address cel=
l as
>> >> >   a phandle (Sashiko AI review)
>> >> > - Link to v2: https://patch.msgid.link/20260815-b4-of-property-add-=
i2c-parent-v2-1-239c6da9e097@nexthop.ai
>> >> >
>> >> > Changes in v2:
>> >> > - Use a custom parser instead of DEFINE_SIMPLE_PROP: toshiba,tc9563=
 puts
>> >> >   an i2c slave-address cell after the phandle, which a 0-cell parse
>> >> >   would misread as a phandle (Sashiko AI review, Rob). Kept the ful=
l
>> >>=20
>> >> A bit of a tangent, is this a bug in Sashiko bot?
>> >> It just dropped me from the reply in the v1 patch set. Any idea why?
>>=20
>> Hm, can you, please, clarify, what do you mean?
>> https://sashiko.dev/#/patchset/20260813-b4-of-property-add-i2c-parent-v1=
-1-a2487e920ce1%40nexthop.ai
>> has your email in to according to the email policy.
>
> It has mine, but not Saravana's. The problem is Saravana only gets=20
> drivers/of/ emails and not all the bindings.
>
> Saravana, If I enable your email, then you will get all the=20
> sashiko binding replies. Is that okay?
>
> Rob

Hi Rob, Saravana,

Gentle ping on this one. The v3 thread turned into a discussion about
Sashiko's recipient list, but the patch itself has not had any review
comments since v2.

To recap the state: v2 switched from DEFINE_SIMPLE_PROP() to a custom
parser because toshiba,tc9563 puts an i2c slave-address cell after the
phandle, and v3 fixed the compatible check to match "pci1179,0623",
which is what the tc9563 binding actually uses. Every other i2c-parent
user is a bare phandle list, and i2c-demux-pinctrl relies on the full
list being parsed.

Saravana, since this touches the fw_devlink supplier table, I would
appreciate a look from you in particular. Is the per-compatible special
case acceptable, or would you prefer a different approach for handling
the two property layouts?

Happy to respin if anything is still open.

Thanks,
Abdurrahman
