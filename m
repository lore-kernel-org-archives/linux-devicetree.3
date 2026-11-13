Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794605670;
	b=svYmF6FLueqTXuSKvcNQt9C384J1MqM/uXuxaTnGtMJMHKR/ynaj1l1ZNnE2i78JtuvP
	 YQuwCOiTuq5HJxmnMNzEuB4RxVxSt/cWr6P7rtkst6Yt2du48ughfXwNs991Y0XP/Anhl
	 0/6s588AvVM+3cx3HWrq2BewtehEtFmJ+Pkmnz+kF46A6qfvIgHuVGXO45MGVmkApSgtQ
	 2V6/TFVdwfX1Bc30giMUmbi8Kj4rXgK84C3FO7R/QA53Yos35KvPoia0akkzqfo4fw7wQ
	 TVh+52p/tJrmgv2tJjLHTab8vptFBPLriyTu7qiXOwgFqGUekSV7YsGiEJizjZsJX4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
	b=fA2gAarXSKfMg2WGNzlrh9CGYFqkKnKoN9QwOR5UL5vV35DAFeUehNmZXPsc+EaSbJAk
	 9C7bFEIwfIJesJUaBzDbo18MxlBDqzlChZCeFp3AeOaAGi9l7NHHe7odurIIWLGgdpwli
	 hbHUrnSALO0gjkvM2KYQEfoomxqFkxsvbqzQP/tKIkwy4uLxDis3E0fTIPOC7TaZ24zlV
	 6DYzecB3bTgbSaGnHL24XvXZT4N30WhcV+k0lmFZ8hMOPdPMGA30FwMNJbzT4e/uNpx3v
	 Us5wjz2KecIY+vxHFYqwn652XbLpfa+QUnehQgV4ZBC+SWZ8xoITdY95vrUxx3flxXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6Zz1mY3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174E6606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 21:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174E6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6Zz1mY3
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so2870652a12.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:34:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794605668; cv=none;
        d=google.com; s=arc-20260327;
        b=FFwHt7N5v4KNPQICs+5hOrUl5BqVYbdifar0sVbSRkb7Q0TksPV1XBeKqE/Yfc5bmQ
         LSkE05pqAQGl/er5tmEF0GO0NURheJD7tsTFX1vqmCPg3C0JwNlwrjb8oA5BziE1Bqs5
         AUKVVDnMEmOrsNRzEPY/C9PdFeeUWTVe4lnEedgRfeznUlO+dPFzqL8xXLndJtycPuqh
         mU2lk2jSLDWPFYi5j5sGwKfcvW/kxxkmjRTtZNU6K6UASln7BrMVkreAYzdWlCknxogo
         /xZ4K89OTJ/QM+jyAKH6SfpSLm76V4DFnQysGyXDwmVUQmSLZtkx0MZu20Wba3IcqVnV
         a6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        fh=dE/CzdWNorATlOJyzbgF9nagH4Le3ky6hE4XMAaqfV8=;
        b=eIYiBfj+LM33QknmpfK69wJBMd5ln5mpFsShgRziyLU1wl/86XzG9meK+ujvhLqrRa
         EIOCA1lVpGMSN41fGokgTAqYiQ+jcCDGSpFYlTYFGfMWxy079PXxR9sZLs8dcT7oneHr
         VjNILkh2v5s2/3ObjUkVbOA/yUW6ZfZfd+W4A6r/G4n4K499nRfVEWv4w4kgjDed/3DW
         IB/ZeBoGVwrzP1lItrzlREO7qEwnZDDnLiYk4zDgJVvk5XYUOCjSD8/Y98+zctqtN/7W
         kvVGDQANPNc8y1YTipBsub6ZUUk4jS1gMZrC/AmpmNIj9GmsDz3bozhjCe7uFC4+6aHs
         9KaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605668; x=1795210468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        b=n6Zz1mY3OwnMRux9AIi8h3mMM8K/rdexRAXliMbI7BUAeRbFl5+myZIoZntCimF8Gh
         NRFXIgPkWX/XM25RdeuiL4uKgE4qBsXMFNPKRRGN9AypAcEYXtdDkayrgRITRAP116u0
         TrsYowDxQL8tggHBaLER/J4IKU/BsHTwzLTco17LuHBVBDXEGn0cccQWQpL0pMg7NpBA
         DMWTxB9UXxK4HysvunwnGs78kAETl4RiQMdZbfsTr45AujcYPUU4AwQLAD1jEjVvLGc5
         NVzTn2sXhZooZEFd0LVw38BEJHFLDvvmyZuwv7M6IE1Gs2PM/5oYmKBrgAj10tQhRtOh
         uULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605668; x=1795210468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        b=GBjpQnBNfC2iYkp334MDlZh/fMfcVh6Qrd6B80+FS2l322rNdPsrY7cUHBtFwdKLh2
         KeWuIPBDPoF9i3z3rTNqiXFhXWsLwTs+Ef3kmBcEJP0q4S7PwE2CfGnGnHQsBEm4NYUO
         SVIbk8H3iAVXe1gQ92vHr7QZaGxLa1dlfRWdc8PQksUnavwD5r+YeLqPwSR1KGznnmFJ
         +Hpkmcu3atbBODtjJSUrwSHX+EtmGDLmJpO8B/ZA5232ADPwBOXpFdzt9aL69OkXuRcW
         T7xtdH2bsRgmK5o8/XZ/iwjYjHA/h0JyL4k4+b6ujkOwa5dA8ASxzgk1UA9pKvlInRLX
         qDhw==
X-Forwarded-Encrypted: i=1; AL+hErFYRRxvB+66YADgSD/xhcjDxXNbGiApi11t+rjGePDQEeBCONDdcFzzcFjxTokl6gdum5GqVULgS3qn@vger.kernel.org
X-Gm-Message-State: APuU4Z/hTi+6dKsYYnoWrJeJlW5YJYV2edwwT8IfilZqrugARqjc+OTX
	HnC9Z8Qv5u08VgTtsNvaSOKHNckojbKZvKQtQKwoFkNI0TWPtOLUlEnRTVHuMdhpMYPEM3bnPtU
	JlL8o+ad0H43/rJUuX4ZuQrEeG8UPJYk=
X-Gm-Gg: AYBFou1AJvxx5Txn+uTixg8g64NMkxZtwfF17IO940CFg2vfbL/ZKVpJjpc+3TtleSa
	r/Th/GEXRUPnDOBg/2zqq3CNlnRMxLhBYiAs3aM+tVAfwnoC5P7DfMZyz0DFvCpM01006eCRATo
	kTM9Mr1Bp2027RmHbjMkDKDYcjk9Wz4QXMf6GUrnSFM6TqcA9mSbrZz88xeqcT6JfbySj/6pb6v
	36xtwyNpx7YrnoV/9jIo0KlO2qWS3K7onUsN+U3maSCz2fOwCFP/c2MeQVUKGMHWwOqZc/N6+f3
	RPey2vEKSdro3SIx+vT1er/AIluUTgFmR69g/QPwcvwY4Gk5x3wzIkxK//b9nrQw8HMgP6mkUn1
	Qo9tvcO9HQ+Kz922vuSUFzHPsvn07i/wtd/ulfse9/tJj9XG0yomRmUbj3G+vLjq+rqJUTPT4D1
	QiRH59aLsRZ17ef28oAyl0wfoyAkZxzEnomGeJJKQFlrLduwzRMaV5a0GT9rEx2ZlGb5UqkvnGn
	BhSE/D//griEx8644FBGvstezRSCSoo/ZHHsKulVnzEkOylzg==
X-Received: by 2002:a05:6402:2422:b0:6b4:2960:d38e with SMTP id
 4fb4d7f45d1cf-6b7c0c6c168mr3184743a12.26.1794605668245; Fri, 13 Nov 2026
 13:34:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111034418.194610-1-rosenp@gmail.com> <20261113-gabby-vigorous-dragon-6a2fed@quoll>
In-Reply-To: <20261113-gabby-vigorous-dragon-6a2fed@quoll>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 13 Nov 2026 13:34:17 -0800
X-Gm-Features: AclHuK860Je_aBBSmUpm949DigIPgWY0YZ3IdWomRfLhm8LCUntc7TDGkYsdgmQ
Message-ID: <CAKxU2N846Ebd50z8adJsNcy-kJBSNDSKU8_ZLf68fJzoc+r+xA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:11=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 10, 2026 at 07:44:18PM -0800, Rosen Penev wrote:
> > ath10k PCI devices can be described as children of their PCI host
> > bridge, for example to supply the MAC address and calibration data
> > through nvmem cells. The only compatible for that was "qcom,ath10k",
> > but the generic PCI device schema requires a node under a PCI bus to
> > carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
> > validation.
> >
> > Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
> > ath9k and ath11k PCI bindings already do.
>
> We do not need to least all PCI devices here. Were is any actual DTS
> user of these?
I have some WIP patches that include the QCA988X. Reason for it is
nvram calibration and MAC lookup.

This is basically copy/paste of what's already present in ath9k.yaml.

AFAIK this came up because of dtbs_check
>
> Best regards,
> Krzysztof
>
