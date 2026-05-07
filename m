Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E503890FE
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161949; cv=pass; b=OTTkIHS8PBYARrStX3vxXnt1Ro9DOD+KG3RL4C1WR3LjzsdQMtSpdu7Pk5gocNXxho4G2+MG+meYalH0v7geol7+gtOo7KpgYufjUZD7DKwRFRexcWa/PqfuLoox5rVgT81F25IaZzrnlVsckNvHi+AFxN4UWnEJZjh6u+m0Ff0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161949; c=relaxed/simple;
	bh=KRwaHdksT4aTptGMK5j5s77NrG9FZxEiuA60DYpO1Io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVJY0c1y8O6UVHr4UhfADJRYmhsIoHYA75dkvI4p7l5/HPJTwYHZEdqDme9Hn0KZs37G8ZIxxyzAKXpg9XVO7JUtffxBoPznnv2BL5/PrdhmuSuqYisX2QOIuHu7AT3fZnV2NhylQv4OUnO7m2pKpsvF25PwPyrWOXPnE3rlH/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mG54V4UN; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG54V4UN"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c8f9846c8so1291078c88.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778161947; cv=none;
        d=google.com; s=arc-20240605;
        b=ahFgQLD47DFqPtkp2yhi458OfAejUgTFQiZDYXzz409AiEmPHimS5Sb8Wz5jX+QCQH
         4Q5NB/c3rwsFNrqydiKnvaAw0s7xD7ic3rXs1FyW0hoGTQvxRkAMHUfp7CIqOfoenXn3
         DDv0ydD0SjceUYAiGFKOFfsOZbeKVgXB0BHrPvuNQ0owNHTpenBt6IfndlHdZ1LwhLAb
         EOU/SxVmNvFANrpZXmyGYX4Ny2adpTiaJhYefXV1l3lxfI6Tx3QJe3ZLJOo0zNCWZA+E
         aqxS786hbD78CDds/qTQkRUTbsgqOw2S08G29GJdFe+Wui8tQ/6BCX39NT6awbL3J4Nn
         6JTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bGVpGj5HHW+JUpr36++44HV0d9D2Mz6mYHWRKyMr3NE=;
        fh=gPF6bVuRFlB5WUpHjoOliY9P8LmH3648k3rNVgZS/9I=;
        b=QUzXFg+8f3cnEh8IvUPN5F8GLNVxZae2AO3BWJh3s7uQS1I058VgG8T8ZcCN3jybA3
         PM+kdBj7kpHh15gKUfK64mrHmeoFE+BnoiiQ73W5BUZMIE1NPQwoA5Ya6mNTMVwv2VbP
         6KXYSYO66jJ+yWFNZsKcEZ7Pggt5bc8WnizMavOrXiEV2mqCvpXYn9Mz+O3zomYhEWjV
         5kA+tGsNZwAXkujyQGZyf4tT+zYBdD1vs7yUuRYS8NSG99k2A5nYUl5BQja4inWerzft
         kvm/BK2cK+g0TAfyIWIq5IA9yt6AAM/3nTZzoAMNYLr3kJICluZvOzD8JYr808tWWOBz
         LAZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778161947; x=1778766747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bGVpGj5HHW+JUpr36++44HV0d9D2Mz6mYHWRKyMr3NE=;
        b=mG54V4UNDB5YKenS8iYZYRud1hqoDlh38IFqgTuGJBuoCyflUjZHg+nqTYOsXyyidL
         rfp6QsjB8XDh/MfdHso8+mw6FOr9NjdajxYvlLdC0JceBpLOkxH4rnmZVrCnX/ZlUsRh
         L53O8CCgcoJYDk5fXxl6wQkaVTHh2219ZTg5sAPf3LStpKbysdsVIBojXpoWi33oavDb
         n6z90EHIp9NuqIbnGBlmthT29B4MVoztj6FF+P51VAFI6+DioSj0a20QuCZ2ByDJfUT8
         MTHSynbxNv/nr/cblCnRDtgTgjBA7F0m3pBFQbGstMXI/JsjR1OsazQcUVzXwQ5ypP30
         bMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161947; x=1778766747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGVpGj5HHW+JUpr36++44HV0d9D2Mz6mYHWRKyMr3NE=;
        b=i2K6VDS/hoGdctzzUQ9tbhvycFi5swRFkIOge3lwmLS0pqQYxsD3abi/eJVgu08tbv
         Co4N7FNtaUtsrgo4681Rs/0bs/bl0CUDqt16h+LKwKd9B9YFIoqk7uzF0tLCBR0Osfxd
         LazqIz2O9irafAECQ9T1sBYIZNGMrq5+gc9jBU9D0C4uMLtURt2SgyD09wiRV1CL+L6q
         ihfnjj/4SgMKk8eEeLiie06IfCDxeD2FaFmjf1iWUA1YTAP6uvIFWb2R8rIJes9A2x/v
         vzf1FfEzqQQmDqkgSZ9fYX+KLRPNjKylMZnyPTVrdcJk27PKZ7nKsbWrjAdnSg0G6ZO3
         IFvw==
X-Forwarded-Encrypted: i=1; AFNElJ9tBrWarx0oYteiZyVZ2CU8zeArJyOaMVmrLz8QP5uoW9w7s4qlZKG4xb82DWfBPMugP5bs0aLNkhlc@vger.kernel.org
X-Gm-Message-State: AOJu0YzYeGqT1sLdxFP2F6ijajYTfLKstxpd8H768qA7gJb9oPYEdeMD
	mQQfRy9evypjXv3iGpzEagYrMFl7Ea1yFapH51ynveeMrMsetBkC+cHscoL9JMOwTBjF8w803Vp
	sthxdbcuDE6HCSik3RPKHCHe9nw4PxX0=
X-Gm-Gg: AeBDietF/0Uri2WVvVC/p+YC1tvkP2sFlk2scgqg2v4rIR39wS9/fHzi0pmdwdXW7NV
	fuRWT7g/rL7EhBsNNteyBHzRtnrjwr3sZBqaNfM8eqvdVZWzroBw0DBM68tYmz7DSkVrt0WU/Qw
	UrTx9OowHXEIoP6el4e73bSQ78FteNPN591ezRLNrsx9fc2zq1u51Wa+aZr31BqqhBRKxesrFDG
	xyOBpgv7a3BgkydehR1MsHHUa0Z3Dy9KGeX9IF3Item+sszuVmKsu8HNz/eA/qvtrTY+1JfnS8T
	9WbQLOpg2CKXAETF2dA=
X-Received: by 2002:a05:7022:397:b0:12c:34b9:61bc with SMTP id
 a92af1059eb24-131852d97bbmr3640712c88.5.1778161947269; Thu, 07 May 2026
 06:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-3-eagle.alexander923@gmail.com> <a7daefb2-3ab4-43db-b7cc-c3b7d0c0fae4@q-lab.dev>
In-Reply-To: <a7daefb2-3ab4-43db-b7cc-c3b7d0c0fae4@q-lab.dev>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Thu, 7 May 2026 16:52:15 +0300
X-Gm-Features: AVHnY4LdRP5lX1vkb9aowQufKGKoUyQ9w5QdIA-mvvR9K0p37g2wbCIy8KrK3cI
Message-ID: <CAP1tNvRRk9Qx=PctW4ryBexfyFt6igFQxx9TN0aOHDPtpMSkvg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor driver
To: Quentin Freimanis <quentin@q-lab.dev>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Quentin.

> > +static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl)
...
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_HBLANK:
> > +             cci_write(ar0234->regmap, AR0234_REG_LINE_LENGTH_PCK,
> > +                       (ar0234->crop.width / 4) + ctrl->val, &ret);
>
> should be (crop->width + ctrl->val) / 4, &ret) to keep the control in
> units of pixels

This also results in changes for AR0234_HBLANK_MIN and the step
to control V4L2_CID_HBLANK, right?

> > +             break;
> > +     case V4L2_CID_VBLANK:
> > +             cci_write(ar0234->regmap, AR0234_REG_FRAME_LENGTH_LINES,
> > +                       ar0234->crop.height + ctrl->val, &ret);
> REG_FRAME_LENGTH_LINES seems to actually be total lines - 5
>
> I had to make these 2 changes to be able to get the expected framerate
> when not using the default 120fps.

Yes, I found it in the datasheet, thanks.
