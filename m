Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E17298CAF
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 05:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776750557; cv=pass; b=B0Fyql3mhAaTAaANJsaoeH+71fAYUF9Nl56vkhBBAvJjz9x0dw49ys7tsR4rH+kfPCEyz//ssyc8pvU8oIRUcU6OmXWaI+YM6DPLmbkrvSCbK87r2UHwbo9vm5PgzNv993nZVPB4+/2kg0bLK0sU/aYnnOdsAY78JK+0XufBMfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776750557; c=relaxed/simple;
	bh=EwuvVz/fAGrBMUKw08OZQykzrafoMhsaQKLumfDriEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FM1J7qoXH0st8U+Z5RSp8+dFm7i8D57j0Ha4jXIomiOvH5DpHQSxcc4Mt5BJGw7w92ztn3AEUSTq1CbZXzn03J+sT6fBcxviB1J53yfqcTs5+O5jACKxDSTxPSFxZT4fYJ/o0rhqzf+7U2h10XiV16JaM650qdJ2sCdsmZ3yOi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiotRBZf; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiotRBZf"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7dcdaf06498so79557a34.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 22:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776750555; cv=none;
        d=google.com; s=arc-20240605;
        b=h0k22jSGCGMtVazky5Ph8dKdDNryrAnK6CYduLZmQ3oilL6++fvzckyrfLVjVSYspa
         OjpIMN5RL17jrZ6y/hXM1Di47qX+1/9Ac1f7a+t6Q3YvKOz9TGHA1U3JeFOrOO4cnNF2
         xGpBeUuNeUWqnKASWkZ6/FgoSauv30B/UvPQPPggNFLHVv5fuzFe1nDbElJ5s5n+SJrT
         z1GemzqCo7HyHhomkhgtCxL9cHWyZctLcp9qYDIo+oKdkkBAjhUW4rYYYoZaeF8Vl9lG
         T4MqylXnIOMAOkQ43a9IO/8+bZFEFcn7i1qUiR3DRkq+kI41dJ3vUprpnW4mB6Rn3SIT
         14Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SRWv1DAnKxjPg4EeC1yHSfGfzIInINqcAO0DlQUlQZc=;
        fh=Sb0Rm2CcxJ+zGpFIIuIW1MzwSGxoOTirxnm70Gorkoo=;
        b=bci9Aad1toRG4M5clbVJewdNELFYR9Ahf9px10gT0stR15me36N/HV+JL36OMDgwd5
         qk8W3Y60QYXPPkaVOr5VH3AL5VbGtbEjPiCEb7mOwWpdouWa9ITWbPLtuqeA5xuACBqG
         eijNwoA3THaKol+lgGrEwRykBsLwdZBV9ZzYjezB6J3X/s0oa3Eweo/RbvAp49cJOBpW
         hnzNP2gQyPdzlxqeEwEczAyUgPO2hPu+2y9IrXCKFtWg3f2RR5swGnczY/9+7qIruqn9
         AbggBGPyJAWAoH3JIyDWeFtBbMHs0oK8tlDt3Z2dVk3qfXlNqtrhv4ATwllZkg64G1Ra
         ZV3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776750555; x=1777355355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRWv1DAnKxjPg4EeC1yHSfGfzIInINqcAO0DlQUlQZc=;
        b=DiotRBZfyyIkxGViyCl48F+ucyJP+X75qxC02Nr+RCECqTVE9QmC9zV3XanWSdJAMD
         QUE/DYYGcITe6RRXa+soa+bJmIeSTwTMmiC5a7vy0ivbyDOCS25ktu/7fA1agTgxow2f
         eGqkqYEsYpd32pny6s7TvtFkXIxRal1o7AeFVKAnwuJZx/KBatpyNpHE7oHJLLTGqJ5d
         ncUrfVV3SrqQaaPMhzfrbKX7TYUzbAorfMjgeWQdLGh368SM/U1NjbQrog3wuGkR15kE
         24tITB3cmyW1VFdKhN7Zuc5wvMHKEpAIyx4N1XCWbbA4G5F6VnAamNuitxes8REfd/U6
         MzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750555; x=1777355355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRWv1DAnKxjPg4EeC1yHSfGfzIInINqcAO0DlQUlQZc=;
        b=AXK9wE4dmkTw8rtBqHp5f8Z951t9eUsmO/0g9MYWOoXrZxiZ3rPBPv1D5S4mzrG9oM
         BotKzGk9ZvmYImBSlAkXpbk8jWCuHZGHz4Cqu7dPn2qnMecwNsshVYLqxKDAY2WIAc4g
         x54sBVFBmDiMwzU+fwkmyxQC9JrbT3Azk/ESGE2gfJbJqB9RY4vEd+gBJVmc/PqQavtR
         kEOXlMyermXhB+ViUnxcaz53Mc2be7sxH9qaADPRG7EwNbNPUeUg1OnYvUdabaV/Wc08
         Wdj5G2K5ZfK/N0aaAXLRLDcBxly6KJz7jZLER777OsyQhxOHwnPH39gM10EhsaIV+vsY
         J10A==
X-Forwarded-Encrypted: i=1; AFNElJ8LwadpKWmZ25Rhlcbguf8RmDJBZJbiskfkTd5/geAhporHc+JZxS2wrMBBJOKXEfuZM5yDqeQi5wZn@vger.kernel.org
X-Gm-Message-State: AOJu0YzfRDm1B/y42//rPFvGc2A7vtTI0a8ck/G7RsRkOGW0oU2qQRky
	z8Jxcmyi8cfrq51EPJNi8vsKQC8qV2jOw6gFcxyK87VF0foWUGazde8lkatDQiQg0rAvy8VDr80
	2RFB5vuEXA0yUdYXedHQ1sbOqOxhMx/s=
X-Gm-Gg: AeBDievDRe5Bt9X6nJFsqeWRkVpLTW4zcZ4XWp1pEAlzj118MmumMbzZuf4yOALO3qq
	0iZxR2IH4QNyu0PyUiyjCM2/adnFD14EAZEXCbfpzBeGT65262gNRFW0VqWhnzNg9UJboP67GV3
	PuhbrYvziMX2YpacXFzV4Dwm2nCL0RQqBNFf/uN/rc27UpFvEsU2Jpw22qzChzVicJOYiQg3Tt5
	m5QyiI/Kq+VE8XERsTsbfg+3bsjZwNP1GWgk4/6JsdJlY9iqiVhd0Ihkl3RS4tj/y/Jk5RcFLgw
	THkDpTreW5bmFvjm
X-Received: by 2002:a05:6820:8118:b0:688:e3b:3b8d with SMTP id
 006d021491bc7-69462e1648bmr9079448eaf.7.1776750555537; Mon, 20 Apr 2026
 22:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420061644.1251070-1-syyang@lontium.com> <b2a5ef92-f312-4e0a-9772-4d430b80a46e@oss.qualcomm.com>
In-Reply-To: <b2a5ef92-f312-4e0a-9772-4d430b80a46e@oss.qualcomm.com>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Tue, 21 Apr 2026 13:49:02 +0800
X-Gm-Features: AQROBzB9rYJlnnqh9os9JxgZAo3i8KtXGQWjM6H5x1xWxow6F4ShLEOhK5X1Slg
Message-ID: <CAFQXuNYFwRLbm8yLFNzAcwO24NuBWEKnaAQP=O5BhCuCb+eWuQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add LT9611C(EX/UXD) DRM bridge driver and device tree
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com, 
	rfoss@kernel.org, mripard@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	xmzhu@lontium.corp-partner.google.com, tzimmermann@suse.de, xmzhu@lontium.com, 
	rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jingyi Wang <jingyi.wang@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B44=E6=9C=88=
21=E6=97=A5=E5=91=A8=E4=BA=8C 13:09=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 4/20/2026 2:16 PM, syyang@lontium.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> >
> > This series adds support for the Lontium LT9611C(EX/UXD) MIPI DSI to HD=
MI
> > chip:
> >
> > -dt-bindings: bridge: This patch adds new content to the lontium,lt9611=
.yaml
> >   binding file.
> > -drm/bridge: This patch add new DRM bridge driver for LT9611C(EX/UXD) c=
hip.
> >
> > Signed-off-by: Sunyun Yang<syyang@lontium.com>
>
> "This patch" should be avoided in the commit msg, begin with "add" will b=
e enough.
>
it will be fixed  in the next version.
> Thanks,
> Jingyi
>
> > ---
> > Changes in v3:
> > -dt-binding:
> >   1. lt9611c(ex/uxd) content merged into lontium,lt9611.yaml
> > -drm/bridge:
> >   1. Drop the licence text, only use SPDX header
> >   2. Sort the headers
> >   3. Use library functions for crc8
> >   4. Drop i2c_read_byte and i2c_write_byte
> >   5. Lowercase all hex values
> >   6. Use paged writes as implemented for LT9611C(EX/UXD)
> >   7. Drop dev_info, use dev_dbg
> >   8. Modify lt9611c_get_edid_block, don't store EDID in the long-term s=
tructures
> >   9. Use HDMI audio helpers.
> >   10.Remove unnecessary flags,Implement proper cleanup path, unwinding =
resources
> >      one by one.
> >   11.Replace devm_kzalloc with devm_drm_bridge_alloc.
> >   12.Remove extra kthread.
> > -Link to v1: https://lore.kernel.org/lkml/20250903123825.1721443-1-syya=
ng@lontium.com/
> >
> > Changes in v2:
> >   1. Forget modify code, operation error, Please disregard this submit.
> >
> > Changes in v1:
> > -dt-binding:
> >   1. Submit the first version of the code.
> > -drm/bridge:
> >   1. Submit the first version of the code.
> >
> > ---
> > Sunyun Yang (2):
> >    dt-bindings: bridge: This patch adds new content to the
> >      lontium,lt9611.yaml binding file
> >    drm/bridge: This patch add new DRM bridge driver for LT9611C chip
> >
> >   .../display/bridge/lontium,lt9611.yaml        |    8 +-
> >   drivers/gpu/drm/bridge/Kconfig                |   18 +
> >   drivers/gpu/drm/bridge/Makefile               |    1 +
> >   drivers/gpu/drm/bridge/lontium-lt9611c.c      | 1365 ++++++++++++++++=
+
> >   4 files changed, 1390 insertions(+), 2 deletions(-)
> >   create mode 100755 drivers/gpu/drm/bridge/lontium-lt9611c.c
> >
>
