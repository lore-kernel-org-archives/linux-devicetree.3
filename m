Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6CE3BD63C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497032; cv=pass; b=A1oyXQIyhpgkFXelQScFhuepLYDJAoIjVGKe6IwXZSMbO4X4a+H2umMgbuuLIKB1rMRrNdf/mwegaCbF6amnKF8P+A40CbQLNBXJReGp0998QBp5+AAQWhsr8UcmFJ5JFNPAKR3+0ZQNRYApnyxpf5tUElje0qYlkD9LaEHnyok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497032; c=relaxed/simple;
	bh=vTJLEVLprN0YEUXOPQmVZfla90xDkYrYmcqtfv4q/AU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmOWpA1dKMydIeE1XoKPHOSLkwKtjpBYEicNkOMjPNDyh5IebRIevlbPvH05pWKjlOiJEC1cTkDhIPJi6uFv+84g8HB5VdOrNtAGduJ5nVa37f1xdXdr6c9TS7yoElnl991uAF2/wZjsD7thkEO6qxqxjfFpAGrgtigAbPgUvkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UeSDOZ5e; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UeSDOZ5e"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so3833282e87.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778497027; cv=none;
        d=google.com; s=arc-20240605;
        b=ibrZqGO0eyRyPD4OcEzyszfTylLOrezugNvh7hccIi1qVXlGZXw6FuExQb9YyCgpqw
         3dANUHJHyVE9lSrGrLmaYJhCapK1y91xns2TKMirtMk2gV3lyO044ypoQN6sdzOzG18n
         yJgty8yU4GvVyT3bxOU6Z3VuP+O93gifEom/ClkyGhWasfQsbX66Tagv6gMoGU/HUqEJ
         Kbb9wqUHXDoDoth3VQIZ8HBB5jGHi/p+RhMWNKb6tjp2TPcA/nPcFFbC8XqIaHFR/Gu7
         U/aoH30hcHlhEp7a01wmq5TYxMAUm/0gvX+esI8wO6XypkjPbofBhyeo5BtaPcGmSraU
         91pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UNgY87VaqJb6Z7Z0eDu16xO5cNHcZbmgVwEFK0s2B6M=;
        fh=LrkyV7U674H7izadRdbCrOOUcntR5zR4WhCnZlItFxU=;
        b=hmR1qxcNgMZtzhUr3UvX3U1VXoUQyGGFmZYrM5SieQtmjw0ASLha28+lxwhi3geAcS
         pCtRB58TXHLOdRTVv40IOLR3Br9sTs8xXu1H/KSlcL5psV4w64jN5j1hPdY1Y3cQjc++
         /wbI8lcIepL9tIUylCMeR4X7lBVUVdhUImAUChc3yBmUFsKpw0hv6hyt0bY6ZDUPlZlH
         6aCMsE7m2HhAW5lyFuq9ByKzsj83oCr03AmNo6N15f0YnVxmzpjLNy4hknNHkdpMmPWQ
         C0OlvjNznCus9E7V0nCEi+Fwy5VybXHvcAO5Xjf1cPDCbNyQa2Wsiiq8mPhhrn3X0YPP
         0/bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778497027; x=1779101827; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UNgY87VaqJb6Z7Z0eDu16xO5cNHcZbmgVwEFK0s2B6M=;
        b=UeSDOZ5eeT/pq5FepKDmyABTPObEM6q5ig+jAD4OkOLjS6W2CrM/eZJqLA3GguC7RR
         8sLFvgbFYZ/E1DVTxkA+8JEVKVLhi/gvNKeVcduidmJ7uGlgk8dy3T3K2Dgf6xz3alcz
         370NvSkutIyKaEOMcBuJ7MjOyGMuVtoABjkUiEGz4EyoJ/YdSOVancm0s2hqneqwm4Hq
         qC/ojsoiYOYfALGSaIyUGHZZvI0U/7jCsZjkk0luHT+7KWq4vOnAZ/esNVmie95+Dd7T
         FANeuoXsGYdEmP5JkB/cDIRd1Hxq2WdsjseAQ5tmnmRrN4wneWRbxGHjgvMFbNjzMc1e
         RfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497027; x=1779101827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNgY87VaqJb6Z7Z0eDu16xO5cNHcZbmgVwEFK0s2B6M=;
        b=J0lNS0kemKh/lz86Lek2pnqNldbLCDvBg3hcsMnu7/FtqX2xHkOPacxBh3sissgZKw
         0kk85GIpAiKbtSdCnJMV1IqkyfXB+0WqO8ppCsdBnfxl70ASrnTxp+iVZ9oiMFOSBjmP
         MwQVRVqw6nyDZp8P8sYCuYaPcajf3PJOm+N9Pm4nnB7cjCdlKQCAFAo0u25FL5z6drCe
         VnCZ+3xAAv5jM2mGA1xKSYLRV+4iBWHrgXwTbBGCwvGkqQjUxhUviQiTnIdWRMJGBNDC
         eckEX2E9avnukJWhR6K+QImGm5Jm7bJjKGBg5g7LNhZ+WqmCD2JUhZ7SON9lvOQevEhb
         0VeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TNnYKmw8eAb9mTNhZAyHwI+/K76xFN5N1q+SuEEn5M/JZx4m06N94zTKMnKE3wEE9o3p3A0CXj4YX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3IwCIM5+r+mQLUmzIATpqg8ts8Akc9kxudtSn8XT1XFhQZrkS
	cvSyuixmqqfEEHbnWXvTF8JZa4TPCBE7vheRpBa39+x2GTMvwfmX2pzRMI8kzT+mUcmNQRjW6P2
	F5aYI36PvSCdRieHAkA+26lhN4CdyM49HG+9CcFfJTw==
X-Gm-Gg: Acq92OE1SZDh0qO/Tf1t3mLzHgz6RIl7dSxTbq5egY87cQxilpbrF9WotL/59DiOTRG
	1WZbMhWlYWP8Tgj8Ku1ZmwBc8DymbGgELdndhD/89A1Sw1X6VLXgtATA7p/9sAz/LUCrUVJd0KE
	1k2bNzKLDXDEE2nDVQVO232ngByIrwSBJY+mnuSzI5BH+bwffnalt8HxPTu0ZBgXs5k7TOmhgrp
	ATam2UoETq2DfI0q9OELoshAs6Wk+zCBgdHb0NNXj9Yo9dHa1LXzh0kiEMDaeSnETpaA/CclFAa
	72ZfVoyDrTbiM4dnKGjcG0haS7b5fw==
X-Received: by 2002:a05:6512:3b97:b0:5a8:837b:3d62 with SMTP id
 2adb3069b0e04-5a887ae201amr7135423e87.9.1778497027226; Mon, 11 May 2026
 03:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
In-Reply-To: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 12:56:30 +0200
X-Gm-Features: AVHnY4K5Fa8XIOuKEc9fwP0nNsU7-2i8Jr2vSBdRJyGo1uaG2J7xzeVbIFlyyOo
Message-ID: <CAPDyKFr4TdLP825VrpC+gELKOnHHFK=oZ7x8HWQaKFox8Ur0Tg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pmdomain: core: add support for domain hierarchies
 in DT
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 01:51, Kevin Hilman (TI) <khilman@baylibre.com> wrote:
>
> Currently, PM domains can only support hierarchy for simple
> providers (e.g. ones with #power-domain-cells = 0).
>
> Add support for oncell providers as well by adding a new property
> `power-domains-child-ids` to describe the parent/child relationship.
>
> Also adds the first user of the new API: the Arm SCMI PM domain driver.
>
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
> ---
> Changes in v3:
> - cleanup return codes for add_child_ids()
>   - < 0: error
>   - zero means no child domains present
>   - > 0: number of child domains added
> - arm_scmi: adopt to new return codes (only <0 is an error)
> - Link to v2: https://patch.msgid.link/20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com

The v3 series applied for next, thanks!

Kind regards
Uffe

>
> Changes compared to initial RFC[2]
> - dropped RFC
> - rewrote the parse/add function to use iterators/helpers from of.h
> - add a remove function for cleanup
> - use child domain language instead of subdomain
>
> This idea was previously discussed on the arm-scmi mailing list[1]
> where this approach was proposed by Ulf, and then an initial RFC[2]
> implementation was made.  From there, it was suggested by Rob[3] to
> use a nexus node map instead, which led to several more versions
> attempting to implement that, culminating in v5[4], where Rob and
> Geert then had second thoughts about the power-domain-map approach.
>
> Therefore, I've gone back to the approach in the initial RFC[2] to use
> the child-ids approach.
>
> [1] https://lore.kernel.org/arm-scmi/CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com/
> [2] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/
> [3] https://lore.kernel.org/all/20250528203532.GA704342-robh@kernel.org/
> [4] https://lore.kernel.org/r/20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com
>
> Changes in v2:
> - dt-bindings: fix warinings from make dt_binding_check
> - scmi_pm_domain: switch to dev_err()
> - pmdomain: core: fix locking around add/remove domains
> - pmdomain: error unwind if any children fail to be added
> - pmdomain: fix node reference leak
> - pmdomain: ensure power-domains and child-ids properties are same
>   length before iterating
> - Link to v1: https://patch.msgid.link/20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com
>
> ---
> Kevin Hilman (TI) (3):
>       dt-bindings: power: Add power-domains-child-ids property
>       pmdomain: core: add support for power-domains-child-ids
>       pmdomain: arm_scmi: add support for domain hierarchies
>
>  Documentation/devicetree/bindings/power/power-domain.yaml |  34 ++++++++++++++++++++++++++++++++++
>  drivers/pmdomain/arm/scmi_pm_domain.c                     |  14 +++++++++++++-
>  drivers/pmdomain/core.c                                   | 167 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h                                 |  16 ++++++++++++++++
>  4 files changed, 230 insertions(+), 1 deletion(-)
> ---
> base-commit: f7b88edb52c8dd01b7e576390d658ae6eef0e134
> change-id: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040
>
> Best regards,
> --
> Kevin Hilman (TI) <khilman@baylibre.com>
>
