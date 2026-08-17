Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86474334CC
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972874; cv=pass; b=iXBp7CPNgLbEXjRTutNdCujl+nY12i4By2dyS8C5yLgadGtQQn2V5mWrIri7sd33C0916T2gRXVSIZpfRLFx5vfpuFyProwVV5m3a1Tdx+T135zzPEKddLduecLbTv/tZkUezNnAkog7Dgi9iqHKRJVNzr8paj4JjNXEWKdtnKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972874; c=relaxed/simple;
	bh=LBQ3aCrYIe56Bdog+4hPW3SU+28zBQdKbKIRZvwWrKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7lG5hTHVHtA9Ms84yUrUSTsqJDcLdd87+LM9MoVAyNfliBKMM6SdsbN/HEuT6L/BtM+KmZdg6ArEGKAe+PtXlVS5W4QqjFtZUxQMm2yb2dPDiJQRjekskes9KFdvTAsrsasD7zW9m2sngGe6sy6o67tEy1ZANOHrBxoOnBo6tE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrUzhFhF; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrUzhFhF"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b013084dc2so2555654e87.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786972871; cv=none;
        d=google.com; s=arc-20260327;
        b=Nw0mMCuQLHnt+Ex+oZ9p/xfEVDxA84HMvpvfJfjOYVp7TT1lYTTtTSUDKW88VtL+nc
         bkSLywfZxlelQyz7hjQUbVnBN53eBIZFmDc0wOI9GlRV5aU7Nz1Auo//v4wPYbdW1Nmr
         cseGzQ8JQzzjgCISRoGHp20xYuw73wTskALO3IBRT7rtZnDxhFYHkNbtjckTA0ZKTf0T
         XUkclAFF15xPcLJTMqGrQVk9jYXAsWgbVWOI3qShIHd8Bozn6hBuBZfVXDMBEnUhSEAV
         tn1jGkcTK/v4hMqFjIXt9MeG0K6raTHPrqfVz1j+0/HfTreu9y2nvFYbSwT3j3cSGPA0
         ldtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d2cyI6mzx6oJKUliXKmfq6Ny/sEmn4X6lt43pxzRGug=;
        fh=w1C4L63sjnN9NzZg/0cCBATVksmj/l4mEtKIsYiz4Wk=;
        b=WOdKRFMS00s+3btyNWt0rBVOK+ZHQaM1OKhLsrLqi+rusBMA48/J/Np/AiUi+cQuVT
         tHiPsVCBw1Vs9CC154vkEGUDgg7O8PqbalTm1m1OctfEAu9bg0CDdcty+E7Guo3OWW18
         KOKCPP3f0SKNYPW3xSLSkeQkVF+RfYDPjllHNOwbKwvAajR3n8qXLV4kESj8+IZZmTIu
         13f+w/bJ1t3gQmnMVwKBd+7xSwXVKkHi0n4Vo6la5CXpzAID/dUoi4+vc6L34CJ9NP+l
         qm0UDU4b+ecoMFeE7oTGAW2SozSxauu9NYfJ+kgTjROHIfQ4Xfn1NEvCLSBB3Euz+SRI
         ko9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786972871; x=1787577671; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2cyI6mzx6oJKUliXKmfq6Ny/sEmn4X6lt43pxzRGug=;
        b=HrUzhFhFnW1fEEAQDVwR/2+nnrKWdBR9NT4TJUnpzC5A7TOgZIzpzy00Tyw6bXaIGw
         kEdkOiOhNYgKjbIlCKUdykgUqlsF3MSYW38DmcM+bIM1w61iy5zdeXgIL/0sTHr7FUDu
         yMQTwAIbRR8HSNMjIkufAGs4/7PZ6e315RPgoA3c2kK8pdIQngt7SNsJqzQhRjikEmFO
         eRfx/pdAncAwFd9LMyBMpqQOEpWF/gfGU1Lg/r0UBtjR4G3aKLzwflix1vJaPft0KmVl
         sweMICeeOYEA2obx/PU10j9vle125kf9wfHMgVWd6dwxYIdcQqX/a3paALcbYNOAX1NH
         I15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972871; x=1787577671;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d2cyI6mzx6oJKUliXKmfq6Ny/sEmn4X6lt43pxzRGug=;
        b=bKXqGXHslUbzmhRGCr8KzZP5l3JcCnTYWCBw+vNifoLoc/TG/Y63JiLhDY+C8Xj0vI
         BROnCTREsl2rnIGyXajARBq5dRgYHjFud2pEA5PuvDYpLFBarErPcjxbpUb3JVj4nYe9
         lPjXZR1C7/c6gG/3E5xYnrn7tIBgLa3uwBoHuoOuCGYTAbeAUhs17xi/2NiXdqwH2CWB
         YAnWJYC0RG1Bi8x/PhYO+F/Dt61TwQtL+tEdYtXtICKDg3i+VGl4YOHvnHqNRBVS976f
         TK2uPO14hJE+5mo6ef5QxAzHx8aD/8SrqQn+7567bINa7PXoTmQQGOophmQOnrCQecHx
         Ywlg==
X-Forwarded-Encrypted: i=1; AHgh+RrtOpC532CafpUFvq1I6WnT6ETCLkWcLitvOQi5tQIuD/8T4iRMTMDapPYWm4kA3wAyNgVrjnbJCwJn@vger.kernel.org
X-Gm-Message-State: AOJu0YzmL6oQ8gxbgcm97RB2PHtuuIBbZ3i1M61hSkW2MEvrZv2eGWXy
	vk6Ct8jeAJNCEcnhpXeuKVgRMtDgXCQezqwcCCm5vNBTtq0G3qfLM7c9cJCi657n6/0QINI3z08
	uJFKiIc2noD8KE2lJhPR0MP6q0jAF25Q=
X-Gm-Gg: AR+sD12rIjIcntFUlZ0ecdjFr6ClJlF0/51O0SE07MOtsA7nPJ583MEAEnJYodHyUt3
	q2u6VfTquKg8jkDJ5kNz3+vwYJkH8tWVdRgF9up1EMGv9PXelIeOSmcfXVR+dQx48cYXW3nry7g
	vBqtfGF77A8XnhOsLjf14KKDS92WGv43zZihyJ5hNY9I7vqTcw4j/q+o+afzlbznYaSwJaWJVGr
	eiShAF6e+vyNjx3DKs65D4pAIAD2QhHIQ0sukghkdelCDWIarOCHftcj+6QE6bITk9UNGPsGAwg
	uJsQ3vBbJakdEIJ03JIeQ1RFYhbc76qac+DttApGNVRM5K82nGKm3vDZTDDB65j2EaCzfXH1qVH
	+BdBO9RL/iiAMf5tgeMVipr8K
X-Received: by 2002:a05:6512:3d0d:b0:5b4:51b5:6081 with SMTP id
 2adb3069b0e04-5b45915d407mr3952421e87.18.1786972870527; Mon, 17 Aug 2026
 06:21:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <anoYr9H4KojJv-aZ@google.com> <20260814125025.90522-1-gvalkov@gmail.com>
 <20260817-hairy-serval-of-refinement-49039a@quoll> <CADOrJmb3uJPpYR481rB-CnL0A9B_5PQ683XP+Gdis47uihqMBw@mail.gmail.com>
 <9b3b6f29-35a8-4b79-a002-bd0aac5dbee4@kernel.org>
In-Reply-To: <9b3b6f29-35a8-4b79-a002-bd0aac5dbee4@kernel.org>
From: George Valkov <gvalkov@gmail.com>
Date: Mon, 17 Aug 2026 16:20:58 +0300
X-Gm-Features: AcwNN1X6U-ZMoqh7Cxmw1TZJAety3Im5k5ja-jQ-2gFEkWXaK2yQc5cFAuGj_B4
Message-ID: <CADOrJmZRBQb9u9oi2m=4iJuKDLVi6HNjOoSurRwE5QKPB_LetA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 14:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/08/2026 12:43, George Valkov wrote:
> > On Mon, 17 Aug 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Fri, Aug 14, 2026 at 03:50:23PM +0300, Georgi Valkov wrote:
> >>> WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> >>> from the mwifiex ROM, which conflicts with the platform regulatory
> >>> configuration on units sold outside the US market. For example:
> >>> - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> >>> - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> >>> - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >>
> >> v1 as reply to v3 in big thread. How tools can parse that?
> >
> > Hello Krzysztof,
> > I apologise, I forgot to add the v4 tag to the subject.
> > I have documented the changes between each revision.
> > I saw my mistake after sending the mail. But I wasn't sure
> > what to do? I will make sure to add v5 to my next revision.
> >
> >> Does b4 diff work?
> >>
> >> b4 diff '20260814125025.90522-1-gvalkov@gmail.com'
> >
> > What is b4?
>
> Tool used by maintainers and contributors to handle/send patches. See
> korg docs (or just google "What is b4 Linux kernel").

Thanks!


> >>> When the system boots, it detects a conflict between the user selected
> >>> region and the radios, e.g. BG FR US, and applies extreme restrictions,
> >>> preventing use of 5 GHz and DFS channels. This also affects phy0.
> >>>
> >>> Add a device-tree flag, which allows affected platforms to ignore
> >>> an incorrect regulatory hint from ROM, so userspace can set the
> >>> correct platform regulatory domain.
> >>>
> >>> [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> >>> [2] https://github.com/openwrt/openwrt/issues/9956
> >>>
> >>> Tested-on: WRT3200ACM, OpenWrt
> >>
> >> Not a valid tag, drop.
> >
> > I believe the tag is helpful because it describes that my changes
> > have been tested on a certain device and platform. It's a common
> > practice in OpenWrt contributions. My last two accepted patches
> > have this tag. Should I still remove it?
>
> Drop the tag everywhere and instead on the patches which were possible
> to be tested mention how did you test it.

ok


> >> And you cannot even do that, otherwise explain me
> >> how did your device execute THIS (exactly THIS) code?
> >
> > I am not used to your terminology and this gets me completely confused.
> > You have not quoted any particular code change, so I'm not sure what
> > you are referring to. Here is a summary of the patch series:
>
> Tested means executing or parsing or using the code on the device under
> test. How can you execute/parse/use this code on the device?

Test procedure:
Compile, FLASH and run OpenWrt firmware for WRT3200ACM.
This compiles the Linux kernel along with all dts files and drivers.

1. Before the fix
Notice how each radio has its own country:
iw reg get
https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699

If the user sets their correct country code, e.g. BG, then global
will be set to BG. This conflicts with FR from phy0 and phy1.
And also conflicts with phy2 which reports US.
Result: the main radio phy0 does not start.

2. With the fix applied
iw reg get
phy2 does not appear in the list, so there is no conflict with the US
region. I can address phy0 and phy1 later in another PR. They need
a similar device-tree flag in the board file. The actual driver is not part
of Linux. So I'm not sure if there is any place to add documentation?
Result: phy0 and phy2 work. 5 GHz and DFS work.

I also used this test code to confirm that the flag is set:
mwifiex_dbg(adapter, ERROR,
            "[%s][%pfwP] ignore-regulatory-hint %u ++\n",
            dev_name(adapter->dev), dev_fwnode(adapter->dev),
            device_property_read_bool(adapter->dev,
                                      "marvell,ignore-regulatory-hint"));

[   19.927595] mwifiex_sdio mmc0:0001:1:
[mmc0:0001:1][wifi@1] ignore-regulatory-hint 1 ++


> > Patch 1 documents a new flag: marvell,ignore-regulatory-hint.
> > Patch 2 adds a device-tree node with the radio and the flag.
> > Patch 3 skips the regulatory_hint() call when the flag is set.
>
> I can read your patchsets and above does not proof how can you test binding.

Ah, you mean how I tested if the device-tree changes are valid?
I have almost no experience with dts. I ran this command before
sending v4, and I think it seems fine. Here's a link to the output:
make dt_binding_check
https://httpstorm.com/share/.openwrt/test/2026-08-17_mwifiex/dt_binding_check-01.txt

I have not inspected the output from rebuilding the kernel yet:
make target/linux/{clean,compile} -j 1 V=s
https://httpstorm.com/share/.openwrt/test/2026-08-17_mwifiex/linux-01.txt

Sashiko AI said that #address-cells and #size-cells are missing,
so I am currently looking for a way to find the correct values.
The radio works without them, but I should address all issues,
before sending v5. Please write a list of tests I should run!
How can I confirm the values are correct?

Thanks for your help!
Georgi Valkov
