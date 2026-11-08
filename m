Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794149306;
	b=wB838Stpt1GQAX8j10O+3RupJJt3D3gYUA8nCXx5aFPdQaW38Cen7zzaOLbCiYDjjMF+
	 r6Aod8xyP9uR+4OsAuk58i+qQcSURfcR6APgfqD1oS9xwg7WDA3kyOMdC37qyPS6vAOkJ
	 JmR6GLLN15JAiAoSk2cZz0pgGiBisil4kDUIya0/RML6fdfpL+zf9mF7V3Q3EYLJz1tiu
	 R5N2i0TMqT39nNdBNQ+kkokFMTH+fAG9kyE+iwpGQ6hxEfIFHS/7Bfw2jpQLYr5xPaseF
	 PreHTMCQ1XP/sHmV8x3t3yTm7luYl5eD7Gh3+3yHkVfNaMLF6KIz37oMO1TdoPpHcHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=72njd0xQ5iZD4pPKmsLG/N0Oqv9jSjZrxN3BfMccT4k=;
	b=BsUUyxr5AHPOqX85tKTf7QkdkGlY0cZT85mWTZfhQ9j9ZO2LpukqAVPt3wcr/ngVMjM6
	 zY/IfwY/jtdYcsIT02Wdf5CIkWpH4+bOc7y4ZH4eN8018/xUvZXFD2nCaXoFKPxrWlojP
	 Vvnr6eGPCgh5p4XT2nYG5Sm2JteUc6L8f1TQzeaDd3G7Qg33xpNL6ZX6INvOgFKduKjpD
	 X/VylhkhliQQfAXmLsIoH4GyVK+v6lMdL2QT0FWfHKVlca0IUZBygO+DtvxWFRdLttyWn
	 Rjx9ExT9bUgUdm0wpb7aj5Y5+Co46lPFMpLT6zXr4fMn5rKwtZurjz8dlud3i9Fu0og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M89O7Eav;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1880B606A321
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 14:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1880B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M89O7Eav
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so544995e9.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 06:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794149304; cv=none;
        d=google.com; s=arc-20260327;
        b=eDQiHmGUexzbdCb1B/e6hgsPH9DXlAA9ApH33qh03XH6kaGowWliuShBqblZ5HEfkG
         Yp6ZGmNknH/6Rt0fVKiCdAHb03o6iHkfEZvFVAAg5+gnoS8npt2ds7MqTMh9VwV3cXJy
         EaZ5xvXdCYmcLk0qtycbvU180B/Zbz8YgY8PXUo77DA0yIDxe3i4IL8q2DK/yXeMWkQY
         ifQBxNi3grEpCuI6etV4SdQNO96SyHSfSWWU9JuDlnaEExJJGgSIFCZ0YwxXSnlm8IVr
         1AAKOV55psn7X8dro1A4GmGgWhaak7xz5iD5p+HNituv1mODO8Pjkb8yNXOKTdT+fR5o
         rkBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=72njd0xQ5iZD4pPKmsLG/N0Oqv9jSjZrxN3BfMccT4k=;
        fh=AH17WySX/yext3Jtf0uuXwk7wKIZCPoq/IrpdJs8f6Y=;
        b=tCmXzddrVynV/EYgQ3QXFpF6fopWnrsL6UiWmp1aOUj89vuX14MCGz0A2Z28zWhr/N
         Mju69YLEWaY6xhQ8KtqpJh+QuxMlbR/xxh13VZU75PSSzoC/Y+aO0Chj5qnvhW2996qG
         E5OFux1SxLI3PMRVozd54wThvpk7e+0VsA+hvjOF+5UV/YnPf549ofCNgCxMeuFzwKxs
         qHqExdX+fdBHWC3Iwkr/Afn5HMY7Hch2D7UCpwaZq7oGJe6Gl/XSLWEUhWyPMfg5MdRL
         bBs4qrzqgsX4g7ETZWFSqZMZsLNTXOUSJgwfBYxHC0FF1j/U4y4mDwJr8USq0GN0ecna
         dO6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794149304; x=1794754104; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72njd0xQ5iZD4pPKmsLG/N0Oqv9jSjZrxN3BfMccT4k=;
        b=M89O7Eav+NpL1KqjMFVjw5iimIbpfy/0FQfp5RsxTeLQo/jL4ljSEZt+csLG0XgNQG
         7gmTLcUa3Ox1lX+Cq+ptOazATthaTntkflV6T0LnwYHpmzkv7JBIROJfcp3grtuzuZ5o
         +xvuRc6fZ43kmkCyGHMLQcDhcZXphFCeGHi4i2+tXEOFB7lyTIu/ICjylpIPF08BEQDF
         bZFmY5k2cqcKVdQg3gdw3mcXTaS4Z0bCA2KTwChkyMQ/8XERMIcV4hXcQ3r76D7Ods36
         6KArQhsNgtsOLOEtt4ZnfwUIPNNjnjKq+Q4EgDoGy/hUCfjf+/dDa0GWJYMrgpRjXT7r
         Wt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794149304; x=1794754104;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=72njd0xQ5iZD4pPKmsLG/N0Oqv9jSjZrxN3BfMccT4k=;
        b=H/oYK2Z8V/9KOl6neHcUSrpukFo5g+adqoflh7w0EGKMyhq1eMHVvUIYNTJvHhZKL4
         rFCDziIq+pjNHAHUN/mYxtrVpZw4Jd15YSDLnPd7jQ2WBrqk96DG5bs+nRlUqgpqSxt/
         NS8ljKWztPLXkZJd0qX9fcPNqLDqyggY1cVslyxHPp+GpHPLsJ1KrjQe2EW2jCP+7HA9
         KVrEckQhVWx25+BnLthrlaDR3w1ZpfcdaoYkqFeCfKZ+Q+QzXvHZpRsqz5FfK2PuTCOV
         lKJrr1SgpTSJwAn15mmx5wBd1DFQDPDjTsNwM6rkhNYYW546HPET+skJYv+9SKhe7y//
         Qtkg==
X-Forwarded-Encrypted: i=1; AL+hErHtgvrgBMMTdf/5plABBcLKgf+kELsBTQfZP9Fydrcsej5X5DAqryS/7RY2tffiOUKCE2p5KdxOxZx1@vger.kernel.org
X-Gm-Message-State: APuU4Z9icbwmuu0hYCcv2MP02b05+4sbftBZWGK6Z/tpIKHuns/mNlkl
	vjHVG4gdzH0yoXMF7ELZVuW6+9UOPjFdEWhtywUkTUP1xGl9UZzQYz5ZSuO1J/gnZ9uk3pojxYl
	Ymg1CQAkpvyPqlxvjWaI/QkCTdczzqb4=
X-Gm-Gg: AYBFou1IW/6tocEL5AB7gI+TElDO7TNWK9vThM3PjjE89vuljM1OLlHKMo6STBcrKzv
	PdTSFz6Akz8VMURBGBMi9PJv7idXFmJTCGh+T1ugfxIUBVfmFOyT/jVclWiz0nyFE2JMopTUep1
	cP3R9euVq71qNfx6UVPl2Qc8yiW/R5cWQdjYb/aBlgDxu9DeFUkT2/a1j0iNo0jUJUWoEIlrP+l
	RuzuTiu4a4h6GOHiYCjJLLtOdWxfwu/gQT86tE6oKLIRYaZWYAn4j1nmMURm0tPj1R77V7A9Hbb
	tMM81wW/x8zsyrxOKKzMA+3/5HXv/358hlYntDTgG9NH4UypbymnIY/CP4G8iVIWaYVQHdMbZR6
	a1NXQz5mnXxjAHxeZh8vmtBQw9ZBaXcx1bMJKYw3Roxoip6HC/4KvokNqjkUq0EAPBmRfQvY=
X-Received: by 2002:a05:600c:800c:b0:4b6:267a:dd6e with SMTP id
 5b1f17b1804b1-4b963c9b704mr33733845e9.28.1794149304259; Sun, 08 Nov 2026
 06:48:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tle493d-v1-2-3246e91e6394@gmail.com> <SN1PR12MB25289B6D8FD76DE3160299B5A5762@SN1PR12MB2528.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB25289B6D8FD76DE3160299B5A5762@SN1PR12MB2528.namprd12.prod.outlook.com>
From: Viral Patel <viral8854@gmail.com>
Date: Sun, 8 Nov 2026 20:18:12 +0530
X-Gm-Features: AclHuK8k8SGGyofgHCdVBkLXPFoEz1YfhP16T0j4rlTWnfJa_LPLI57xmzGezk0
Message-ID: <CAFkCdFzQBHMc1CvOJFQY+mtepU12UrEQfWyNdY+rWUYW5CG7tQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: magnetometer: add Infineon TLE493D-W2B6 driver
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: andy@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dlechner@baylibre.com, jic23@kernel.org, krzk+dt@kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, nuno.sa@analog.com, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 19:13, Victor Chernyakin wrote:
> > Based on the TLE493D-W2B6 User Manual v1.11 and Datasheet v1.2.
> >
> > Datasheet: https://www.infineon.com/assets/row/public/documents/30/49/infineon-tle493d-w2b6-datasheet-en.pdf
>
> You should link to the user manual too, since that's where most of
> the information relevant to programming the driver is.
> I see that it's not available from the Infineon website without a login,
> but it's easy to find elsewhere:
>
> https://assets.sourcengine.com/datasheets/c9ebe749-34ab-4924-ab2b-aa7d4dd15e25.pdf

Agreed, thanks. In v2 I'll link Infineon's own copy:

  Register details are from the TLE493D-W2B6 User Manual v1.11, which
  Infineon provides after a free registration:
  https://www.infineon.com/gated/infineon-tle493d-w2b6-usermanual-en_dc6d4e62-cde1-4d4b-87bb-c3368e25e35c

I'd rather use the vendor URL than a third-party mirror, which might
not stay up.

> > +/* I2C addresses selected by IICadr, i.e. the default of variants A0 to A3 */
> > +static const u8 tle493d_i2c_addrs[] = { 0x35, 0x22, 0x78, 0x44 };
>
> The manual seems to list these addresses as 0x6A, 0x44, 0xF0, 0x88 (Table 4,
> p. 14). Can you explain how you go from those values to the ones in
> the code?

Table 4 gives the addresses in 8-bit form, that is, the 7-bit address
shifted left by one with the R/W bit in bit 0. Linux uses 7-bit
addresses, so 0x6A >> 1 = 0x35, 0x44 >> 1 = 0x22, 0xF0 >> 1 = 0x78
and 0x88 >> 1 = 0x44. The hardware agrees: the driver probes my A0
part at 0x35 on a Pi 5.

I'll add that to the comment in v2.

Thanks,
Viral
