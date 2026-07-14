Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E66B218AB9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 15:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043197; cv=pass; b=c7iOV0hARsegAVP7W6Yigu8sgLkomuQRqoyPAU3Zn2Ey9iwp7LYXIN717MixqFSTWTasatlN9qr295l1e6iyAx3JpAndLN9RH3dk7+gMr7KiPT0MFP8ga4S7x/oKRpg0ChbGzaTk7hpBrXKAwrHcLRjuGQdLFhfvRsPsflBap90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043197; c=relaxed/simple;
	bh=DUDxctZujNARWIATLcjZzvBa5DYpwPhbf7vLFByLhYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dC8/kv6P915Qdd5oi/A3I8Vq5EsZZcuqHBOzBugOozIpZcX22Q9OLTvnsz/GjlLv/U2hBri2QUw54Y1cC4gzNoTSGhm1SIBOxAoI2B34PZu1pXajm/guy5q4cfYpQQqZB3B3zgksR+m5iUjcJ+5Yh+En2gxAKNZkHxZa3vVBGAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQnXyVjU; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQnXyVjU"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15e03c2763so234696766b.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784043194; cv=none;
        d=google.com; s=arc-20260327;
        b=UOCQXv3vIldejPuNEA1N0iPXP3/15THfxn+URV6flV+BlWxHV8NM1wfGJv3gXdPc/K
         89I4GhXTJ114aA9XdVLHzLMBKkzyPr4fRdzp5ydhIT6AovzfPQIde4uUvuJW5HXLG7TZ
         LoJknleeSejW83MFjnhTho8HXSaFReOwRhGMIfYCRLk2ZsNaOtXIH0ub5WvrTf/SFcWT
         ZZfn05SOYcH6c1VW+SVmXIjCacdwCx0OEY4MTTiKM51pqs6CKLS4vqzzWT9wxkARaZ08
         8ne0uccuXIXqXCBTYhkP1RYCcE+94wl39Qwxhhhc8knKNPO2JYZ2Q5g/yFBc+/PXyzQN
         MBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUDxctZujNARWIATLcjZzvBa5DYpwPhbf7vLFByLhYM=;
        fh=MyHZ8/sVvPzLEG+omM6cF86xGRxwnpjwN1kOWsr37f8=;
        b=ghCTcHX9yqWWfJjMdUr6NrcxfcghrdjXM9xe1QbJRc4tlZT50pybPtbDFqvc7AiG9S
         lUcPPMGgxhCTi0PQHAsqdZrnlckb/YAKaNX+56iVS4JQoWXhPZSGERAbM05FdDaY/oaS
         JZA2gxoN4+Qyk7/MrwwEDpL2dNeUJq8gCMzchdJMyLzT0iFhLerSokCssmDg0RxSi5ZF
         7dZAUbuIDSMlFXZV+3K+XoP53jpdH8APvZi7nwL43xKH/B7B9/GG5FZX3X5lTa2rl4Ud
         dGMX5+pXaQ4RMAEJcF0pNDUIJzXOdFkc7kRTs49J19+NuNeBqF5TTxlQmja/26H08gRu
         vV9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784043194; x=1784647994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DUDxctZujNARWIATLcjZzvBa5DYpwPhbf7vLFByLhYM=;
        b=XQnXyVjUuRPXHrOESoZop8jaPiCTSf7OvCMOrda7SXo86h2NhGjWOv/IvZkaZPD7kW
         mhP7EDOgyZOLv1tg3ApqZ7gb6+vRaU6cYgdIeqbq7fKy+M6lNt1bQ3z91Iik0Yh2B3SI
         51UqlUSWsmFj+poDJeHkKkthpEORtKUeKklCTfENvukZnyDebbtnAmvgxDTRFwON2Nbd
         zXPR0ylv48qKl1FucYU5Cr3Fz7jqqeuyURhrx+zV0CTnI/Kei0UEQ07PpE2YTTVn3id4
         KJRJ4EAZcmzP7NPgbAnezboNPq3/feHPMjSQG23mrXpTTPxlUjOCLz2Pir9qJYPwnixH
         WUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043194; x=1784647994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUDxctZujNARWIATLcjZzvBa5DYpwPhbf7vLFByLhYM=;
        b=m1mA6QBavZwLHKU5NWih9AT39t9pK37Yi+b9e1KLWPWu+QMNsTIedACD4Y9WvuapXR
         iVRPj1C3YBdL84/TMW5jvpT6IeDjc/Az/CYyPOWZPFa3JZOusSpcEgxxO2ob4sqlW9jG
         1vraeTiCJdwXEM4LB6MwO0EbasMxU9ql4kt1YQppY3YccJcv7SBLtfQO1cF20lDTDDvD
         /Pz1xRSU8bql8PVy0vgcDaN4MdP4l24QAzq7j6H3ksDzwnknlGUIcO2r2l3gQ5wdsRVH
         LJimwCja21+QchxHeJvcDtO50Uftj0wpftI6HniwOlKq0Ah6eaTs4LasZdpjBBM+om7r
         9X1w==
X-Forwarded-Encrypted: i=1; AHgh+RotbdftpM8as8aWixQDaPd88GdzRNKwHou3e5SSbk82cbndnrXfIBKBjei2J8wRO5WPQ9G6wVS1/GTQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh0tpGwC9YlrqOc4Eorhl9xz4z/cSvKytEm6Of0Omboyr16e0k
	DIjHEb4O+2dSQUmzIGBRutHTnMchayiTSGOHML8ngg6LJdhPuR+HxZh6G/TVCebI5729Ekyrrpi
	TcJ9o62Xlz1hmkg5LoOm5ueaOfViL8Bg=
X-Gm-Gg: AfdE7ckxsRptcK8zBZWZCAuN5dx5x+pgEPcxJtOW2FzUw1snY9fQGfJa/Vbqrh7IJGr
	RcxyULb+baFJrG4N7yepus7RMeuwcfQCvvPPzXjdKv106DyamTf3oGWB58391JMBLxCI50xyH64
	TG7hMDAlzWVP9ltL9jHxcTWBN2msQ2Lkp6lMByCjHwkY/SM4jIOG2uvhzCy9sl5iPf22VjreZbB
	bAq16a5m7bQFdKLR9CDgREo2tQz7J4s0nriOHBUDRM2bA/eryx/cS+iS1MAvI2Sutt1sWy8ww==
X-Received: by 2002:a17:907:7211:b0:c16:242a:4733 with SMTP id
 a640c23a62f3a-c16242a5993mr650163866b.18.1784043194326; Tue, 14 Jul 2026
 08:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713131223.279555-1-a.shimko.dev@gmail.com>
 <20260713131223.279555-3-a.shimko.dev@gmail.com> <20260714131729.48CD81F00A3A@smtp.kernel.org>
In-Reply-To: <20260714131729.48CD81F00A3A@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 14 Jul 2026 18:33:03 +0300
X-Gm-Features: AUfX_mwi-FnQhvC2JtVlr51haSy7xBYWK3yOmmbUT8m24rZgRfmOoOKYkm8x-Hs
Message-ID: <CAOPX744Q2pyAv2ixFgrwGrW++-BVWs-0Hx7tW7XzJ9KbpwZC5w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: phy: add DAPU Telecom DAP8210R(I)
 Gigabit Ethernet PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 4:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> The commit message documents the property as tx-inverted-clk, but the
> code implementation looks for tx-use-inverted-clk.
>
> Which one is the intended property name?
"dapu,tx-inverted-clk", it will be fixed in v2.

> [Severity: Low]
> Does this cause a compilation error?
No

> The abs() macro in the kernel strictly checks for signed types, but the
> result of the subtraction here is unsigned.
I inserted abs_diff instead of abs for u32 variables. It is safer.

#define abs_diff(a, b) ({ \
typeof(a) __a =3D (a); \
typeof(b) __b =3D (b); \
(void)(&__a =3D=3D &__b); \
__a > __b ? (__a - __b) : (__b - __a); \
})

> [Severity: High]
> If the bootloader configured RGMII delays, are they left intact here?
>
> By not setting the mask to clear the delays for pure RGMII mode, this
> leaves the PHY with whatever delays were previously configured, violating
> the RGMII interface contract.
It will be fixed.

> [Severity: High]
> Does this write actually trigger the software reset?
>
> This clears the reset bit by passing 0 for the set argument, instead of
> asserting it by writing DAP8211R_PHY_SW_RST.
In dap8211r's datasheet the low is active for this reset. I will
comment it in the driver.

> [Severity: Low]
> Would it be safer to poll the self-clearing reset bit instead of using a
> fixed sleep?
>
> A fixed sleep might fail if the hardware reset takes longer than expected=
,
> and contradicts the comment about waiting for a self-clear.
Agree, it will be fixed.

> [Severity: Medium]
> Is it safe to modify MII_BMCR here without acquiring phydev->lock?
>
> Concurrent execution of the phylib state machine might race with this
> debugfs write, leading to corrupted link state.
As I see, the phy_modify acquires the lock internally.

/**
 * phy_modify - Convenience function for modifying a given PHY register
 * @phydev: the phy_device struct
 * @regnum: register number to write
 * @mask: bit mask of bits to clear
 * @set: new value of bits set in mask to write to @regnum
 *
 * NOTE: MUST NOT be called from interrupt context,
 * because the bus read/write functions may wait for an interrupt
 * to conclude the operation.
 */
int phy_modify(struct phy_device *phydev, u32 regnum, u16 mask, u16 set)
{
int ret;

phy_lock_mdio_bus(phydev);
ret =3D __phy_modify(phydev, regnum, mask, set);
phy_unlock_mdio_bus(phydev);

return ret;
}
EXPORT_SYMBOL_GPL(phy_modify);

> [Severity: Medium]
> Does the else branch intentionally destroy the previous BMCR state?
>
> By unconditionally writing BMCR_ANENABLE to 1 when disabling the packet
> generator, any manual speed or duplex settings previously configured by t=
he
> user via ethtool will be overwritten.
No at all, it changes only loopback and AN fields.

--
Best regards,
Artem
