Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FFA367F48
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754449; cv=pass; b=p8eN13LdB6RhrafeYE3EiWct0+AU2N6Mn0iUNG1n66L50Xuln+GMlbJ91K9U+Fj34tlvMtV8yn7CQ8K8UAsGNvwCrWElyRMT8aTAA4W4ySVcabyjlPGTVsYSYtWZSRIWDJiWoyp3UKw8tl2o3+7uZFrpQfnRdwAdTmGfoaq1k9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754449; c=relaxed/simple;
	bh=xzCairU6IJG5sPtRT7A/BsD2wq9hPxLyZpXhYTWkbGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdLo67v89UwqgS8OrnscgNoNz83ueq5zAQkkdAp9BkScXHRCMArTZhox/YGQ4+fPIyWCEOJrtb1r35OYCurw/k2e1N0RgzK4gDszo8gCT45dNC0KiwG30Pd467kkMZS9z9Nm0CIaypRX9S2Lto5hRBmFIttEPr8IkhnhuKjIjfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KmP87kcR; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KmP87kcR"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so1998041b6e.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785754446; cv=none;
        d=google.com; s=arc-20260327;
        b=B+F1a/SzIKF9Rxs7U1OfTmASKO3mi2fBHZRmVumBXZHSAq990DvjAXE5ruL2Z11+jw
         vItIArNLPoEqjhwP2BKUIkLLAAM3iVVWxKJL7bGk+3FVeiRm7gEmnXXwsnQeZGBW1uQR
         OyCDkGlvBNH+orxcgMfxIc2He+NsPtD8JW55NgC5PTn23V0+VOWXRuzfPmTAU0c5zxHy
         UGSzL6FxlJn8mDbt7fkMWmAC1QteCuMTp64y80Ahc8umymdy9VgYmPxsNeMhFyteaUhM
         UEX8sg5sPsgyw+93xlqzkx7XPcOeSZ1h6DE8Ndu4GtK7yRJpdCDtUkVxLIKhWyyoKRck
         PkKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WkMM4gx2K8iT6OacR97bokA0kWNfszhjDnUN6+5+1Tg=;
        fh=I3DQboM1fcEzxP7qvCBYcD+jeIriXkvRv1D2igBwwJA=;
        b=BRVUv+NvViNmjOEhXyKvG3m820hfyQGX9huCmarA5zLTr4rc1Xwrxa23SbjxVv2A8x
         jgrXcYGA6kMQKAS7EvueAkUUncV4ABZf7dGvwk2/TaiFt3/L8p+iCwUZVWdJIs58hfN4
         Kd/B9ii3icqs9vFEcUCMsNtbtJIfUM0M6D/O4NOZWLmZU/4HcTvUF1RZeQTxME0e+ct/
         kUCCI2MOvPimxYHsg9yrdE94qFGaQ6bNtD95l0Rd8RJ1DEZODe2R8MuEGQnqy9BFpcQU
         t7hrqqFsh+vpQer9lYkyhOJV1lhHC3Y/c5b1tYyb/Y+IaVn3pU+CEWghRMN15rbZoJzN
         aXXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785754446; x=1786359246; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkMM4gx2K8iT6OacR97bokA0kWNfszhjDnUN6+5+1Tg=;
        b=KmP87kcRS4qm/AKThwcxPL/GSZ/DxQgHV5JsnDW8JsHo+bzgywP9yUNJxJzxBP0Bxu
         kOsmjZH3DivTpdnKxTguE/vZzyLnbt9yJy1U3c7XwHs+6PKRobZ328AgqWkBa2P/Bm0H
         e4sIa8cIwSeMJEmcoel7yZpOwkhG1s1eeYpiGiKvqrCeduviJV54aBqwM7D3zV4vvvmV
         h0N64fg9vtUU6+6EwzmOyxg68HyuLzSzkK/Ju+nU2xaru81ldxeHS/e2cC+EMT6ODrKw
         kgxN0BhmpaOs8nnxmiUbF0BTO2iJgIpetcb5oxgpjLAzRBkN0WXwJqjJ6l+JhsLWoF65
         OY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754446; x=1786359246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WkMM4gx2K8iT6OacR97bokA0kWNfszhjDnUN6+5+1Tg=;
        b=SmYIAmx73tKWmmLM2Joz/V3oQVQQK5AXR2D6yfM5bDTBVlEtrC1LLHHperQrVRUYjb
         HO+2c1XOi7+KwpddrCn18harn2U2WqGwgX7/gRmU8vPms7xldRiC5JNYPp4v8ByFMO38
         pj92UUfXBhRomwiVu8ozRWMqPwFF/Vu8iZ23SJ1YoZQDioHPl3cdpRAwYEFSRDs9Kn8l
         J2Y7AuiFgIjAkLV1g9JookCnBm+Qw1gjtJcrmn8vnlDrm/R9bEVQonKKSWBLNhzfSbzx
         +gZj9MT7PRkOzA3QMw6q9Wu5DZuxM2fkz2X++k9DGbTVh0J2unSex+Ya/OTX6RN1tqEQ
         uE1Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Fa/ycjdxPwpaCVTXDT9wm3eUf2yo40r/F6EV/u2yy/UZIlwHo7PUgo9eQAz9d8SPkKJnaF+UHaRl@vger.kernel.org
X-Gm-Message-State: AOJu0YwOy4iocLfoyh4ryViiHg3BYr6tmHjz3JjALzojjHRU52+NWhal
	wlVH1+SioJ2qZfCz1MRcYrJhr8hTTGm1sx4xC675UC+MMQY9BIOztceQAH7R13eb+QxeXzUywAn
	XXHvPnTI8Tzy1Vn86yD5LkNE8RxImN4NrXd1yXU3AXQ==
X-Gm-Gg: AR+sD132XYc7vGVRc58cFawknzsAeLkmHmEzrzgD+rkJTVIqOSziXwE/njLQ31NQ94f
	7ieko00xhBzysrofFXxVXEQRv1vbMor+OM10N2VvDQpNcXSUaqbjlwtGmL7D/oD8ngpVdC2d/5J
	OC1pUc381emiA9gkG2cqxxt/Lljak/+iitAjbSvW8LuKx+gCZ8OslzLfLQMcSHcKwR5xk9Kt8kf
	rb4++11H96f34dZVr/ZZHNqJyJcTIASlA4wiiGHO17PEWMNXul+k2HY7ahKCTzWKmnEjbn1wdrQ
	dAD6E4oXdSTFjtV9pspZbnctifPODBqKbvN2ae2mKTq0hxKIDPxmJ52ofdXBXnpoDAmuy4cOuRb
	y
X-Received: by 2002:a05:6808:159c:b0:489:a387:1e29 with SMTP id
 5614622812f47-4af5e3016cemr15807503b6e.20.1785754446430; Mon, 03 Aug 2026
 03:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
 <20260730-small-solid-spoonbill-8a8bbd@quoll> <6d9b28ec-0905-4cb0-9a62-980c7fa69572@reactivated.net>
 <e4dece11-ef3d-42e1-b179-cb710c501622@kernel.org>
In-Reply-To: <e4dece11-ef3d-42e1-b179-cb710c501622@kernel.org>
From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Date: Mon, 3 Aug 2026 11:53:54 +0100
X-Gm-Features: AUfX_mytTkO-AkNzCG_mHrIojcRJSCw-VpYldbwKB1TRQ_LSnTcKOsfcIgvxdHU
Message-ID: <CAPhyPA5K6nBAoSiUOyx3EF7mu7AHP6pEo5u72Jr+r5WiLo7cNg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Drake <dan@reactivated.net>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"

Hello,

On Sat, 1 Aug 2026 at 10:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 31/07/2026 22:34, Daniel Drake wrote:
> > On 30/07/2026 08:00, Krzysztof Kozlowski wrote:
> >> On Mon, Jul 27, 2026 at 09:43:59PM +0100, Daniel Drake wrote:
> >>> +static int bcm2712_iommu_init_cache(struct bcm2712_iommu *mmu,
> >>> +                               struct platform_device *pdev)
> >>> +{
> >>> +   struct device *dev = &pdev->dev;
> >>> +   struct platform_device *cache_pdev;
> >>> +   struct device_node *cache_np;
> >>> +
> >>> +   cache_np = of_parse_phandle(dev->of_node, "brcm,iommu-cache", 0);
> >>> +
> >>> +   /* Fall back on 'cache' property used in old/downstream firmware */
> >>> +   if (!cache_np)
> >>> +           cache_np = of_parse_phandle(dev->of_node, "cache", 0);
> >>
> >> NAK.
> >>
> >> You cannot have undocumented ABI. I asked you to drop this at v1.
> > Is there any approach I should consider here in order to support
> > existing shipped firmware versions that use the 'cache' property, or
> > should I simply break compatibility?
>
> Kernel is being shipped with DTB for Rpi, because firmware is not
> embedded into some lower fixed storage, so there is no problem of
> compatibility with some out of tree, unsupported DTB.
>
> And no, you cannot use argument of undocumented, unreviewed ABI in
> downstream forks as reason to add such ABI. This defeats the very
> purpose of having upstream.

The IOMMU cache is a separate block, shared between multiple IOMMU
instances. This ought to be described in DT, one way or another.

Of course, there's no need for back-compatibility with any downstream
DTS, which can easily be updated.

Regards,

 Nick
