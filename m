Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951083559EC
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777317441; cv=pass; b=gk8giKuqwfYeIdDg/k80M8P6mLJsyBECw1HBoqq10BpM7Jd/qkinl8++F7YHN4dxPLnzfu2V7v8299/JjbzPq7VSWRxq540fay2EV8Q+UAWPfweJU5yXytHcPn1gLWfA+NT1Wv3JzBXSVAlS9urg3bgBhh9wcyqOYUTrhvmBk/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777317441; c=relaxed/simple;
	bh=3F8lak3aibVvF3EpcEo1ul2OoM98TrAYOLetRf4hJFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRzeZzWkKboH1R+oSFdNScAnzZxNWacDj7SuCCN39BPaftPJGj9uROcEDW9yKjpMoPRtfZDQWtnIjvHa8mZlOH2HKV4I6267ORdkt+2gdZXbYM2/uyieEU5rvdIcCs5EhPRe5Me/gBuBAIW7KMnUaZQ4s9YEb89/NAHek828EMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2x4Dmtb; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2x4Dmtb"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so18621455a12.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777317438; cv=none;
        d=google.com; s=arc-20240605;
        b=fOi6lc1d5kOdrLgc2vkwiXY/BhMlnnelWAAb7g+1Mr/UMvxkl4oMMr5faRq3d5OaUk
         RXUGIrHbVDkNlqnfiTeRBTsMrjehOwqixzQ2YkQcwdP6PSB1WsxC6BujKePglocz7VJ5
         pQYWxtuNuPmfergor5cIV8aaL8FmlJO9cBBjULrL9BTdEQJI0kKRo7JEyGD7orv5Y6dh
         EHuMSDujefEGu2Yf0/+9Yva3R6re1de8lm4ahdzzGO1NxdesCjoykf+iAOAgxwyf55WW
         6ckppVLrixEaMkQxQr4PTQ20w7XhnPvafgJG5nctUnSBnddwpaeFLAEEAmIRtH0Aitj4
         7vTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=;
        fh=l4LHBH/wztTXhNIyEOTnLqRapYnzHlw/X/p0U+P5uvA=;
        b=BjHUlMCzMZS+R9aucm99XLt1nPFMPdL+iPCIShgbNkJxhppZo+A22N070wGiz72paa
         GgE/i1CAQopkDOUuQIWPD/oBfibFxr2ghkgKQS5XjwRTR3tCVQGpJnVJrCD6TjJlmz9M
         DrQS/qJoZ9rhDGtBnlXQj1sovDiMAQZ4i6oMJF7vGON10S4Rq0g2eUvrGAD23+4WRGrr
         l9i2r7adOi9LWwpBoK0R5blCzaESOJb/iGSUz9X3AaJvIiNmg0ExCHb02u0B0q58bufc
         VgX1B4RLO76E+zs6TJMEhAiH5r7L6FLiMotOsnHzW4tIaMCWq8nM9n3l1tiN6KTbUH9Y
         TTwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777317438; x=1777922238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=;
        b=V2x4DmtbUzEE6LipAMjIX10MJTDrcljW6jvVo+CtOCDnDHw06yacCIt1gQXlH4ng6K
         QILbneEbrakuY3JU2xUg052kUBzNj9/FNPavgQMUulKu1O9NLF8cD2eDZJDwBxcXk98v
         dx8W3WOzqXZQFmd6zwnZbxB7S8wv7eyLKaWgSwN7AiLnV9Q55A0+TMlxD5HwbP7/W++v
         XyL/E88xGCapUqB9/BvBAWt8SeENjKXhqWdSwTNAQHijE1YqmMcDe9MhD4l7sIB+QH23
         +XXpHvjInKudmh3az68Rcvd++VJO6BhmgPgR1wgFBbQjTY/hOERGiFvchkvFEyC57Mgb
         mR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777317438; x=1777922238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=;
        b=Wu8mGDf5jA1IisdUtiCVMJJYdxNmHgYVGuiGNkESLRLVlrunJaZQYGClu68v74v8Hr
         fYeBCojDyFC6TWjTwbV0YXrjOfWTay4X72xG2LlrU89gPVsJxiAqDZloKO2Wt8xa4Y1m
         d6CM2iv44CEKKtUxOHx0fyeT4KShfpwszcGF/WOQ8+0y0yvJhYasTcRBPcKi1X8A38Wu
         GGnApEm2aVknRHn+bwI0HJ0Rbi87x/dVzusnnItNcpDPZqvR+0pnr/v7B7jjVUi3Xyf6
         xI01Bir1InMi/LGaT3USh3+8mDTQNScytQWZZSPU0VxDYUBONPs36l3JzAL56qcFTh6B
         GGxQ==
X-Gm-Message-State: AOJu0Yzw0UgPHe2mc3QmVBLgEYlEkPzmryAg9vh17Ry9tit4Y75yaHp2
	D2um1MQXEvkZVIcPZeDJpnm4clqtiKAOw+9BlBYvQ3twfOl23bfB8jMTiGEYCHu2bV5sQ+CJIDL
	d6FQ0IpzV0REiMJD+m2b+EEG9emURb7U=
X-Gm-Gg: AeBDievjpLbK/Dfn+qate5UL+3IGlwFp/Aa4qG1wqCr6An1EiJGup8XN0S+BiGM7KvM
	qPr2tcAv1Pnr9o8f8uW8e592k7S4GgyyHyFnESJf3uMUCyGuz79LNaD60wdeNK+JZxV1qXJIZkD
	c3MRU78hZLHs5pkHUZ0OMzC1nNyTw5i2A4ug3bgVxC7Zf8awI7Om3U9X1jRRRQ6eBNTwNSUHMnS
	zcJdBjOxx6W4c8yreDqWwK0GUf3m0cFVn403Bp22x1XQo2JHcJIIl6E/+ORA4mkQO6V3libObvc
	+ZKJTOTF7q0+VZMruk0bdRwb+DizBpIDPQ8pZgfnTKcuFJS8AjPb5MLxVPeDKtpcEx6JE2eh2UY
	C6pqGPI4OrmhUIBYXh/lNewAtJrK98ZJ0Dzm/aH/7JxqHi0cz
X-Received: by 2002:a17:907:9453:b0:ba4:73da:c with SMTP id
 a640c23a62f3a-bb80530197fmr4956166b.47.1777317437558; Mon, 27 Apr 2026
 12:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427034427.881389-1-rosenp@gmail.com> <20260427034427.881389-4-rosenp@gmail.com>
 <20260427-hug-baboon-d60bb8fdfa51@spud>
In-Reply-To: <20260427-hug-baboon-d60bb8fdfa51@spud>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 27 Apr 2026 12:17:04 -0700
X-Gm-Features: AVHnY4JrG3QUmyGyx0Gb_wy-V9vfTB4Vk66pF2gttwnm5MDKbGyJbNEFCLFWIDI
Message-ID: <CAKxU2N-mhrhjDEc2MnOvDZC5PpMzj=vRgMemNK4qSQzNQ-=BPQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: mt76: remove mt76_get_of_data_from_mtd
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"open list:MEDIATEK MT76 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 12:09=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Sun, Apr 26, 2026 at 08:44:27PM -0700, Rosen Penev wrote:
> > mt76_get_of_data_from_mtd has been replaced by
> > mt76_get_of_data_from_nvmem in all usages.
>
> All users in the kernel, but what about other sources of devicetrees?
> Those built into firmware etc? Are there none of those too?
I'm actively removing those: https://github.com/openwrt/openwrt/pull/23113

Anyway, irrelevant here.
>
> Conor.
>
> >
> > Remove it to prevent people from using the deprecated
> > mediatek,mtd-eeprom binding.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
> >  drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
> >  .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
> >  3 files changed, 92 deletions(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/=
wireless/mediatek/mt76/eeprom.c
> > index afdb73661866..092804323d81 100644
> > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > @@ -35,89 +35,6 @@ static int mt76_get_of_eeprom_data(struct mt76_dev *=
dev, void *eep, int len)
> >       return 0;
> >  }
> >
> > -int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int off=
set, int len)
> > -{
> > -#ifdef CONFIG_MTD
> > -     struct device_node *np =3D dev->dev->of_node;
> > -     struct mtd_info *mtd;
> > -     const __be32 *list;
> > -     const char *part;
> > -     phandle phandle;
> > -     size_t retlen;
> > -     int size;
> > -     int ret;
> > -
> > -     list =3D of_get_property(np, "mediatek,mtd-eeprom", &size);
> > -     if (!list)
> > -             return -ENOENT;
> > -
> > -     phandle =3D be32_to_cpup(list++);
> > -     if (!phandle)
> > -             return -ENOENT;
> > -
> > -     np =3D of_find_node_by_phandle(phandle);
> > -     if (!np)
> > -             return -EINVAL;
> > -
> > -     part =3D of_get_property(np, "label", NULL);
> > -     if (!part)
> > -             part =3D np->name;
> > -
> > -     mtd =3D get_mtd_device_nm(part);
> > -     if (IS_ERR(mtd)) {
> > -             ret =3D  PTR_ERR(mtd);
> > -             goto out_put_node;
> > -     }
> > -
> > -     if (size <=3D sizeof(*list)) {
> > -             ret =3D -EINVAL;
> > -             goto out_put_node;
> > -     }
> > -
> > -     offset +=3D be32_to_cpup(list);
> > -     ret =3D mtd_read(mtd, offset, len, &retlen, eep);
> > -     put_mtd_device(mtd);
> > -     if (mtd_is_bitflip(ret))
> > -             ret =3D 0;
> > -     if (ret) {
> > -             dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\=
n",
> > -                     part, ret);
> > -             goto out_put_node;
> > -     }
> > -
> > -     if (retlen < len) {
> > -             ret =3D -EINVAL;
> > -             goto out_put_node;
> > -     }
> > -
> > -     if (of_property_read_bool(dev->dev->of_node, "big-endian")) {
> > -             u8 *data =3D (u8 *)eep;
> > -             int i;
> > -
> > -             /* convert eeprom data in Little Endian */
> > -             for (i =3D 0; i < round_down(len, 2); i +=3D 2)
> > -                     put_unaligned_le16(get_unaligned_be16(&data[i]),
> > -                                        &data[i]);
> > -     }
> > -
> > -#ifdef CONFIG_NL80211_TESTMODE
> > -     dev->test_mtd.name =3D devm_kstrdup(dev->dev, part, GFP_KERNEL);
> > -     if (!dev->test_mtd.name) {
> > -             ret =3D -ENOMEM;
> > -             goto out_put_node;
> > -     }
> > -     dev->test_mtd.offset =3D offset;
> > -#endif
> > -
> > -out_put_node:
> > -     of_node_put(np);
> > -     return ret;
> > -#else
> > -     return -ENOENT;
> > -#endif
> > -}
> > -EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
> > -
> >  int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
> >                               const char *cell_name, int len)
> >  {
> > @@ -163,10 +80,6 @@ static int mt76_get_of_eeprom(struct mt76_dev *dev,=
 void *eep, int len)
> >       if (!ret)
> >               return 0;
> >
> > -     ret =3D mt76_get_of_data_from_mtd(dev, eep, 0, len);
> > -     if (!ret)
> > -             return 0;
> > -
> >       return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
> >  }
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wi=
reless/mediatek/mt76/mt76.h
> > index 527bef97e122..f447ecac664d 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> > @@ -1339,7 +1339,6 @@ void mt76_seq_puts_array(struct seq_file *file, c=
onst char *str,
> >
> >  int mt76_eeprom_init(struct mt76_dev *dev, int len);
> >  int mt76_eeprom_override(struct mt76_phy *phy);
> > -int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int off=
set, int len);
> >  int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
> >                               const char *cell_name, int len);
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drive=
rs/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > index eb92cbf1a284..c24e1276700b 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > @@ -29,10 +29,6 @@ static int mt7915_eeprom_load_precal(struct mt7915_d=
ev *dev)
> >
> >       offs =3D is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
> >
> > -     ret =3D mt76_get_of_data_from_mtd(mdev, dev->cal, offs, size);
> > -     if (!ret)
> > -             return ret;
> > -
> >       ret =3D mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", siz=
e);
> >       if (!ret)
> >               return ret;
> > --
> > 2.54.0
> >
