Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE4C30AAA9
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778092907; cv=pass; b=i1fEAjLRrkqPd7Ugh+Y3VbtATTRNcFXlVsY7mOur+vT/CKdRSOKTHp335EgD1ln9iJUEMdVRmtpef3dYRApht33BUrs3baVAatX7QcOiRTDxo+UTzkPl2RBvCF+pMmu2Zxs/cfE3RzQ9hMJa7voiDvFWYZW3t9Z5coi8x70CVqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778092907; c=relaxed/simple;
	bh=j9OzMDCUx++xg1QXmB23Fwoo1yepjodBYzCvOs07Zjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUSPoza5c7ujkIx4ZTyruaaJ6gf/6rb2VN3Im/F9wLiERdkCSUUf0xFefrQBBcldioWOr44KUWYkbpV58/ChxOE/vgx4c5n+L1K+/ZhNATAjIgVN87A2cZ6FOIyR+cdoPWL5uOn+YAgZmfVKcHGQeHEU54bUOHups6iUv7VLYck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJDHtfa6; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJDHtfa6"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso87582eec.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 11:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778092905; cv=none;
        d=google.com; s=arc-20240605;
        b=ZjuLNlD1F6KMh4/DnfFHIyK2fImXb/HSsiaADMJ7BIkC58fMm1gDkYQ2Etxv3jfBJB
         Txdv5hQtsPMfXDDJklDtuZxP9+dLXUVlmQQT5ygssr14cAGWPoaS364M1xxswF4IuDp6
         WmHBV5HF2qJYbcqSRWZZtcibSDFSV7vrDoVFjCgtW2TkaIkkzn0GR51TGwli0Uied3rt
         FIA7Rk2YliS2hXAFVJifqKq69f6MG9D/LS+SGJIHqo4QdnL+IL2cKG6TMf216W2hTxtJ
         fg4Rj80jkx0UeU3cxXLqNZ2e9qGtjJs9VmqNiY8aOVa2mHLzjvPKanc9A0hD1Sr0h5NX
         FMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2FN/TSj6Y6Yd0pj4ZkU/MOpnX9WQmtjemQYqLmWwiOM=;
        fh=iugoKU6/X8DCY1iLqN/0s+w6p3urE7Lyh3IPoVOpmbA=;
        b=Bt6B0RuZomuyDewGwdB8Vf3UsJGIJ4BU9zwsFGMgjHxsi8DsEvqNGAx3lZfZk4yBK2
         W7B8FGJ2w5RLp1ufRnr3WialYRKsT6EOD6Ff17Nzeg+B01IKsXQQB61tiKXBw3tQgfZz
         u2FBDgSTfSjnNtOq2oopYTa2EL7NL9SlWxkZ02z0qvEAB+m0IAspZDdP7qbQzGWceiAT
         KDxk7zW2jycLTI2j49UjRCOoHJW9LZQAzLkicrorLpuY1DXOnrNImSqAOfHh9wI3oh3m
         7adIYM7N/GI/Zmm+YqKZ07s0m+JCvxPapsfUuI11fgHD23uKbZblg9N1BGlUqvz3Ruxh
         eQVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778092905; x=1778697705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FN/TSj6Y6Yd0pj4ZkU/MOpnX9WQmtjemQYqLmWwiOM=;
        b=DJDHtfa68Pt3KoKChlwp16FeItOwx4RRItk9f0y/ouX0SwbQSVAT52uI41Zmo1dZx4
         6EwXkm/NhyX7jx50TCZOS/DOSzbIjcOj2qwcLOBblJZ4si8cO24agwP94s8arDRXU+wK
         uRCyGG9l+QPqE2Lk/KiRr1FjeQZqoka2AIaEUgR9tfjm9e4q9uCSYefptRrL+9+Hrn8o
         y0Npfvb4x6piUTlm9NpBm2YYgeeZS96hwFDtZRHEy+2Pm+ZzKrOnm1tCU9nwsC7biFao
         nsgbySPzCZVqlDnLc1zKmYO27NSqdg86nfdmjxvrZVNRZ6OrN25wp3EX3ZKWQe5zSCJT
         dgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778092905; x=1778697705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2FN/TSj6Y6Yd0pj4ZkU/MOpnX9WQmtjemQYqLmWwiOM=;
        b=hCJ7Q+gz7DZyryqeL6AEtVUTF0m4fMEJb1JsctkWft5C+Em24rjSSUjUarFuo2bNlT
         rAcVXtHaXAWdiu50I0iTvQzPWKakC+z6ZiPezwOC4nXwZWRGMovjlVvtXCRA2TgLAVO2
         pjtylBkv1qxPZAO25IkjZJxbH7SvwBjcaJT/S7LuyvM/4wlkRYJcNPGXCeg7ejmHZjjU
         kcsPMXVGgr/OEPbEwrTCtjLNKUVpUB3JsssYL5jcSDxLACKionZvS0952MJDonFA7tpx
         +09f++5hbz3JCo+AcsU8j/FNJpJ50n5kzGO9TmmjSsuXfyeT0AbTUv3E1v9qqE7k5rBO
         +Ucg==
X-Forwarded-Encrypted: i=1; AFNElJ9v/hkCwoCSHA7PQ0Ualo+fZGvngIrgT1oRLqQ9ry7ROvkX6PlY0YZhhHJzJ74c1Mfryj+PrRYMCOHy@vger.kernel.org
X-Gm-Message-State: AOJu0YwMzO52v5tagJ/4yjY0jkNGqjkNUlGOpLvHdUpByraIdjavDEBx
	j9ghqVQcI1m/dCwV6fRIB3fqsZAzrk7gpaUEPV2Dfo3lgL5B5HRQCcyLx+ejoQ7eApDZxrqU6Ve
	y80V6fJ4BvsW+ZLpx3zIw/tajv3Fmlqs=
X-Gm-Gg: AeBDiesafnH3mrQxLkH4dF3Mev3jTj6+yX3uT9Dbeqm5qLyhTSbELSoQnrNnon8ksRd
	ChlyyfN7RhkMaQaNt+EJ7DbCIQHuw1j53SaA2ZpuDTh3aK9I5Kol22ocpnKA38CI3DEe4ziPbTd
	duyJAnGVkuQf+yGouxMj4gWNhuK7ciGIYhGwR7l739x3vPer+ir3eKRRUxwtdV7Ig+hAM4LIQOJ
	lPtdgww4IFey5YJB6UK2e8CZKj0sMp0jn8TrDMMrA+RGXvcG51dW1TX1ijJzHh2SfJK0eodquh4
	vX3xoYBn3XlmzVnHMArkWaerGQ2ZMQ==
X-Received: by 2002:a05:7022:221a:b0:119:e56b:958a with SMTP id
 a92af1059eb24-131851d7c2bmr2311809c88.15.1778092904822; Wed, 06 May 2026
 11:41:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-3-eagle.alexander923@gmail.com> <20260505161135.GD1547435@killaraus.ideasonboard.com>
In-Reply-To: <20260505161135.GD1547435@killaraus.ideasonboard.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Wed, 6 May 2026 21:41:33 +0300
X-Gm-Features: AVHnY4IaKXsHbk6X_FKurVf7JbuwUL8sg4j16TevJVgFZMvXnzm3gIMlSMMnh9A
Message-ID: <CAP1tNvRTktNJXDs74ntnS44KWOA6h00ZRrNi6jqRwe_=zifzPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Laurent.

> Thank you for the patch.
> On Fri, Mar 06, 2026 at 01:36:14PM +0300, Alexander Shiyan wrote:
> > Add driver for the onsemi AR0234 CMOS image sensor.
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
...
> > +#define AR0234_NATIVE_WIDTH                          (1940U)
> > +#define AR0234_NATIVE_HEIGHT                         (1220U)
> > +#define AR0234_PIXEL_ARRAY_LEFT                              (8U)
> > +#define AR0234_PIXEL_ARRAY_TOP                               (8U)
> > +#define AR0234_PIXEL_ARRAY_WIDTH                     (1920U)
> > +#define AR0234_PIXEL_ARRAY_HEIGHT                    (1200U)
> > +#define AR0234_MIN_CROP_WIDTH                                (4U)
> > +#define AR0234_MIN_CROP_HEIGHT                               (2U)
> > +#define AR0234_CROP_WIDTH_STEP                               (4U)
> > +#define AR0234_CROP_HEIGHT_STEP                              (2U)
>
> Where do those two step values come from ?

The sensor=E2=80=99s line length register (LINE_LENGTH_PCK) is calculated a=
s:
line_length_pck =3D (crop->width / 4) + hblank
The width is divided by 4 because the sensor outputs 4 pixels per pixel clo=
ck.
The step of 4 ensures a smooth, glitch=E2=80=91free horizontal blanking ran=
ge that
always aligns with the sensor=E2=80=99s internal datapath.

AR0234_CROP_HEIGHT_STEP: The sensor currently does not impose a strict
multiple=E2=80=91of=E2=80=912 requirement on the height in normal mode. The=
 step of 2 is a
forward=E2=80=91looking choice, intended to simplify adding row binning sup=
port later.
When row binning is enabled, the datasheet (AND9812=E2=80=91D, register REA=
D_MODE)
states that y_addr_start must be even. Using a step of 2 now avoids
future ABI changes.

Thanks!
