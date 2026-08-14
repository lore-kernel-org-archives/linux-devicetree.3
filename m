Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57584BC017
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734832; cv=none; b=MfPkwhV1q8PI1qvSfz87ubX68SSvJB/lqqwIGl/ndefDwUZISuIrYspXbTbHORaIqhyTuiCbDdRMtL8Ami4gHHEqKxafUY9EmUv0FlIz7RsQl1yRWHHDkLdjVMSNuLlA4q2VP1jhjC7cTwiR61NGEn2elOnY/DRZtO1NS5TTjpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734832; c=relaxed/simple;
	bh=/hRBCrnW8Gh3WW247a/00Ca6LW4xE6FDipjhpbexhOs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=S3qExKkK760KW8NQ8cWrwXqHI9P89ngHnRqSM/mFic0onN1G39aV+H7kfVFUb1FpaQhDr0zoaw1mFrPR8bebA1K2r+izktiTEnYSq7RYxGtqY5wrQuOoQMlJpGGm00nI0OjeUXMWFZ50BCEuX8s1ebLezBAh7uyDYHyigwKfZuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=blM4TTk+; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="blM4TTk+"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbeeaac53a9so1378884a12.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786734827; x=1787339627; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CkCO8GlMITy4YSr7V6q1rXobtNDejLvp1V+0zJdP38Q=;
        b=blM4TTk+wGnbAP7eRUvgWMhwu4BOZcOgXgnAPtJ9qiLTXQpuN3rZ+HtNCiz05VqgUF
         6ivlJWt4S/wHdrFFk/tx6qoK/V/EdgSVrRTdX8vzkRmCAfXxgJr4lus5CbSd1PTtS+Cf
         GGGNbKxY94kxctmf5MVYSRZpkiBMmT9uTTl5Wa/1Y5th7ZI6z77Sp1reuHuv8VVfctRu
         licAcn5my69K6a3tYfsb06iNJ3prBgFlhSXuro2VreIfkXEn8kW4xTqrmwjSWwOz+WGe
         y2/4tK9ucmXhvrATr5NnaTwydqnJFhK6Q0anQ+QdRU/5nhMCfVYzfXHMJJtyV09yS0i5
         RD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734827; x=1787339627;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkCO8GlMITy4YSr7V6q1rXobtNDejLvp1V+0zJdP38Q=;
        b=aTL0i/5YILijNzFYa86+lcqxZfvXpIkLhi3BX2cju165S20+oaGc9SY0hoMdIvrXYF
         1c1WQSCbjwhQDYb8kr9JaITd7unG8FTNiEC3lKrCMY1TMZIyEAtYjS0GwQnC8JENKeRH
         YmR4pggwRf8rGIBI9xh98SK6z1izqTQyXWOj4NYIHlkq5flI/JSD+yjaJywJtAELxS9v
         5lu4j6YIDGRj/0AjA5fTrZF6/guoLVeacSpmPGeW/1qXEx75Acpx/VhEknd1QDLdNgMV
         PzWgHuMGFuwaDzjAufkmuVQW4QImOiifsZPNVFAq0DLVvSo3NPp4dlyGnvhP4LVv1WWS
         w7PA==
X-Forwarded-Encrypted: i=1; AHgh+RpW9r4ZXnEU/VYxW+CaGylTK+EJ9tPbnsF81sSduXZG1rAgBjh+6ps0SaSboFT5Eu4ufYgokBDYke06@vger.kernel.org
X-Gm-Message-State: AOJu0YwVucEJeAzSbNUJ7NKwrosswfe8drULwdYceUW5EysIZ8kl675g
	J12Kw4dkIcJww8ggWbxVUpu1iarkFsqCUmI09cjH+WXI62D+0TX1EZju1kkHx6/vM0E=
X-Gm-Gg: AR+sD12kaadi76D2Q2AXtBNtfmPtdV1Q7SIb8KD0v7JAWG58U+uWJwA+BScvxGzVzNe
	722lbaeWONrQ7MwTcGFFGtWuaacclzUOBLfz1/14TxzFaztSPluGu9tFeY4aZfbIPbsqImhP/+6
	vzEsDiUGDvcFpn2v3XltZMTWLiivhJXCzpnF3MoDwdjq3df3A1whl+wQtgcvznZmoGPiT6O0Oy9
	d8+ny1iNn9GF/01HjRx4Eb7FhnGuKIplfMKRloQxDCzsoiJD69HZpzVpQziO9Sq18W5NocNwvKz
	qAnEL27wPZJakopS+Mev0Tg6Oana6Zp6e4qxFy3dZHrQxgjqdjq1L5O/LUdSHIW0RHaLgaGSour
	aF+faVPmuNoGpkpMNpygXvwMFVBzj0vfHTygEnVf4dnuoi17lOnXtphFczg7wfljmbvjhqg3hJj
	2eZESpimHh3e7/xyzkSf0IjcF6n9hh9cvY0relm7ti/GOm3LoeIJh7s5HOtC7LuSFXyA==
X-Received: by 2002:a05:6a20:93a0:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3cc71ac3815mr11249965637.1.1786734827398;
        Fri, 14 Aug 2026 12:13:47 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889bca5sm16915474c88.12.2026.08.14.12.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 12:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 12:13:45 -0700
Message-Id: <DKOWMVJ31OP8.KS5H56DT4YUE@nexthop.ai>
Cc: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH] of: property: add i2c-parent to fw_devlink supplier
 bindings
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>, <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260813-b4-of-property-add-i2c-parent-v1-1-a2487e920ce1@nexthop.ai> <20260814010950.051261F000E9@smtp.kernel.org> <20260814181510.GH1981719-robh@kernel.org>
In-Reply-To: <20260814181510.GH1981719-robh@kernel.org>

On Fri Aug 14, 2026 at 11:15 AM PDT, Rob Herring wrote:
> On Fri, Aug 14, 2026 at 01:09:49AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [High] fw_devlink incorrectly parses I2C slave addresses as phandles d=
ue to 0-cell supplier binding definition for `i2c-parent`.
>> --
>>=20
>> --- Patch [1]: [PATCH] of: property: add i2c-parent to fw_devlink suppli=
er bindings ---
>> commit 85f34a66eac871d9e36bccb6795b94b17ab065d4
>> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>=20
>> of: property: add i2c-parent to fw_devlink supplier bindings
>>=20
>> This commit teaches fw_devlink about i2c-parent so the core creates the
>> corresponding device links. This ensures consumers are unbound before th=
e
>> parent adapter's device, removing the need for -EPROBE_DEFER.
>>=20
>> > diff --git a/drivers/of/property.c b/drivers/of/property.c
>> > --- a/drivers/of/property.c
>> > +++ b/drivers/of/property.c
>> > @@ -1409,6 +1409,7 @@ DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cel=
ls")
>> >  DEFINE_SIMPLE_PROP(leds, "leds", NULL)
>> >  DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
>> >  DEFINE_SIMPLE_PROP(panel, "panel", NULL)
>> > +DEFINE_SIMPLE_PROP(i2c_parent, "i2c-parent", NULL)
>>=20
>> [Severity: High]
>> Will this correctly handle device tree bindings where the i2c-parent
>> property includes a slave address argument?
>>=20
>> For example, platforms using devices like the Toshiba TC9563 PCIe switch
>> might use a property such as: i2c-parent =3D <&qup_i2c 0x77>;
>>=20
>> By passing NULL as the cells argument to DEFINE_SIMPLE_PROP(), the parse=
r
>> assumes a 0-cell list. When fw_devlink iterates over the property, it fi=
nds
>> the first phandle correctly, but won't it erroneously interpret the slav=
e
>> address argument (0x77 / 119) as a second, independent 0-cell phandle?
>>=20
>> If another unrelated device tree node happens to match this phandle ID,
>> could this cause fw_devlink to link the consumer to the wrong device,
>> potentially leading to spurious probe deferrals or circular dependencies=
?
>
> I think you need custom parsing for this one to read the first cell and=
=20
> ignore the 2nd cell if present.
>
> Rob

Agreed. One wrinkle with unconditionally ignoring everything after the
first phandle: i2c-demux-pinctrl holds a list of several bare phandles
(i2c-parent =3D <&iic2>, <&i2c2>, <&gpioi2c2>;), and in the flattened
tree that's indistinguishable from tc9563's <phandle addr> form. So
always stopping at entry 0 would silently drop the demux's remaining
supplier links.

The only reliable disambiguator I found is the consumer's compatible =E2=80=
=94
toshiba,tc9563 is the one binding with a trailing slave-address cell.
I have this queued for v2:

static struct device_node *parse_i2c_parent(struct device_node *np,
                                          const char *prop_name, int index)
{
      if (strcmp(prop_name, "i2c-parent"))
              return NULL;

      /* toshiba,tc9563 is <phandle addr>; every other user is bare phandle=
s */
      if (of_device_is_compatible(np, "toshiba,tc9563")) {
              if (index)
                      return NULL;
              return of_parse_phandle(np, prop_name, 0);
      }

      return of_parse_phandle(np, prop_name, index);
}

Is a compatible check in property.c acceptable here, or would you
rather see something else (e.g. entry 0 only, accepting the lost demux
links)? If this looks fine I'll send it as v2.

Thanks,
Abdurrahman
