Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC7F33F394
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776461161; cv=none; b=oFvRxGftnfNXhMbLJmL36WJSnOC3IJhqpGP1NQRofuJQ3Xe5YTYhBspES0P54CfWiFkR1JGlvlTtJioTI8P/1kZNFv7VGODHpWnKc9HcZyVwWp5/+42AeKih/WT/HIHWuU87mwxeB9BFLiROM+Z4FyNa2KOH52n5MMhKbdPss1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776461161; c=relaxed/simple;
	bh=cM9udh9m47+Gpj0oDvbKWKK6KeOdsP7t3oTK77nW7+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxigU+9T9T5dK6L1TLu7nRMyu3emXa5o3xksKg8KCTnilZRpnuI0eUEvlZi3/BmseZVd0AOr9QKZ1Nw3tEMw6WBDM8KtgcV5+UOzcLpS/GOHVti7FUjatHX3bsoTLszQr2Br071H/Y5Q6SExnZXDVZ5hOc9b2CQSkGt9AXXEiOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZpYCguTV; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZpYCguTV"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c565dd3a7so2007615c88.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776461159; x=1777065959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ErnZs3Q6bv+thvgwVa4Ah5gWyVYiLGdPrGb5UASYA1s=;
        b=ZpYCguTV0o0Sf2iEY8xS42Qyzg+nnAPv3PIH54VNBUlu0GzlSbgS+OO2US+7yjLtYN
         nttDBb+gUI6RIWRCpWMyIqitmpFZdu+N+s2700cyrv7Iktw1D4UoNiL/ZiHnRXhp+OZ9
         tTVFoO10UvGvZ2o2mPU993DLD9sqgi+pvadNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776461159; x=1777065959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErnZs3Q6bv+thvgwVa4Ah5gWyVYiLGdPrGb5UASYA1s=;
        b=Jk6bedSpz18MUjpzVSAEO1h7D/h8uP6//9B0t58axPkGbQKaZB599AGqc95pXwhpej
         sUuSFJho+fnmGHY2yR8cQHvXdfMDEi8du1LCcMpslAF69ya7QbMSpEHUup5+XjLPwFm7
         7O0IoPh4L9rh0LzuDR+m92OY7U9+TOKZkF3NrJBJhkoEtNVKazDP64f4YzMH3IPFsdhC
         xMQXfPvUo6j7zNWJwpjsBAxNNtQhDrT1wJGCMo/AQAPBz48LfHh002lr32uF4oPYs4rg
         8i2mk3QYTgiSYKrM9XF6hp0CzSd2SMD/1IvAnGFLIuEMf/sFnm2/9kLuaWMe95Zq1z6Z
         V0Dw==
X-Forwarded-Encrypted: i=1; AFNElJ/ewgMQMqpZ+Gl4ZRGHSqN1Ya8rA7EDe2W2niY6c71E+6gUlurodHbT44V121+lmNrSfyOFd4S1J2km@vger.kernel.org
X-Gm-Message-State: AOJu0YzpaBDQ/oWgGDTuAlr0NLYqDddtfwDfX6icdaH23yDqWT5zShXR
	Rx4KbPsLy2opiB5QQGtiHis/hH0boZ463vNuQ8Ruj7pfDFUbk4QPzJwIlJomubIckCeknkybNCN
	XvhQ=
X-Gm-Gg: AeBDiesSe2kSBM36pITtEk+hIMpebVCZFqIeIZumj5RyXWSGBXgowtfWYf6o4uXUj+R
	AxCTCio4ljAw7281w2ILPXwp7MFhuVLiFBbJucMT9Qd37sZaNVaUyeQdeps9K+MIhxT4bjuaM1Z
	1v+NSKxtXheCDNRwY5GmRwr5NUFVQNqwYZsGfrCkKXHCHA1RB3mF5Dk/U4DIPTubjJw+8YKdHc4
	8KZGTeUliFa0KdSQht7PySnOrtW6/j/+qUFYcawiIIMinEOf0yDpFalKo3HGn+wpwsDUxf8ds4x
	X6Rlb1OH7M9Wx7w6JAONJ3TCAy+/v92cUF8mcPNorIBoXbbPjra11zA1G88mZiMTJB9Lo/tiFOl
	NcY9rarGru51kGg7WF0EdjOeYxMSFznqowKL8cNlbP5sSaUrUOzuW1ojB0ezVbADA2XXae1tvjh
	NqXNN/RV1Z7OBRirmjAZguzdIAmSr5LhDel6avKuJe4wKmbP8qUtYHHh1Iw2sPbkIM/k5y1Nw=
X-Received: by 2002:a05:7022:383:b0:128:cf86:d1e8 with SMTP id a92af1059eb24-12c73fa708emr2682205c88.29.1776461158761;
        Fri, 17 Apr 2026 14:25:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:a468:d4b1:9c3:f6c7])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12c74a185a8sm3892511c88.9.2026.04.17.14.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 14:25:57 -0700 (PDT)
Date: Fri, 17 Apr 2026 14:25:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Doug Anderson <dianders@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: [regression] of: mis-parsing Depthcharge's /firmware
Message-ID: <aeKlYzTiL0OB1y3g@google.com>
References: <Z0NUdoG17EwuCigT@sashalap>
 <c25e6a80-f6dc-4ef9-a90d-0fa09cbbc217@linaro.org>
 <Z0NbeyTwxo-M4Lgi@sashalap>
 <936bf452-3d1f-4940-9a91-69efcdc6985e@collabora.com>
 <CAGXv+5FLkZbZVHNkfRWuT+OioZ0TG=u2WfaFCx-jZFi73QHnVg@mail.gmail.com>
 <19ba4910-f909-41b4-ba62-c904bc37d41d@linaro.org>
 <e77669ea-9edd-4321-8d17-4da40161b59d@linaro.org>
 <Z0R6myuCR4Jpmc_y@sashalap>
 <CAL_Jsq+QBweDZ+1=FXq7Hez=+mhiOxOvurr3rP0+3y_FCd49Ew@mail.gmail.com>
 <20241209092809.GA3246424@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209092809.GA3246424@google.com>

Hi all,

(New subject; was "Re: [GIT PULL] Devicetree updates for v6.13")

On Mon, Dec 09, 2024 at 05:28:09PM +0800, Chen-Yu Tsai wrote:
> steelix.dtb is the same, plus the firmware now inserts #address-cells
> and #size-cells under /firmware. This fix has landed for all future
> ChromeOS devices via our main firmware branch [1].
> 
> AFAIK they also have a bad FDT END symbol. This was only recently
> discovered and fixed for future devices [2].
> 
> 
> ChenYu
> 
> [1] Gerrit: https://crrev.com/c/6051580
> [2] Gerrit: https://review.coreboot.org/c/coreboot/+/85462

This all comes back to bite us, since nobody went back to patch the
existing Chromebook device trees, and now we've added a true regression
on top:

In commit 6e5773d52f4a ("of/address: Fix WARN when attempting
translating non-translatable addresses") we now reject devices without
'#address-cells', and this breaks the DTs generated by bootloaders
without Chen-Yu's https://crrev.com/c/6051580 fix (this is ... pretty
much all Chromebooks). Specifically, Linux now refuses to add 'reg'
resources to the /firmware/coreboot device, and we fail with:

[   11.886271] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

This is almost certainly a DTB ABI regression.

This was noticed here (OpenWrt supports some Chromium-based WiFi routers
that use Depthcharge-based bootloaders from many years ago):

https://github.com/openwrt/openwrt/issues/21243

For now, I just patched up the OpenWrt DTS files like so:
https://github.com/openwrt/openwrt/pull/22951

But what should we do going forward? I note that Rob says "We may
revisit this later and address with a fixup to the DT itself" in commit
8600058ba28a ("of: Add coreboot firmware to excluded default cells
list").

That never happened, and a ton of Chromium devices are still broken.
(They don't have WARNINGs, but /sys/firmware/vpd, etc., is still
missing.)

Can we patch of_bus_default_match() to accept an empty 'ranges' [1]? Or
should I go patch every Chromium-device DTS file I can find? So far, I
think I can get that done in 17 files in the upstream tree...

Brian

[1] From ePAPR:

  "If the [ranges] property is defined with an <empty> value, it
  specifies that the parent and child address 28 space is identical, and
  no address translation is required."

And:

  "An ePAPR-compliant boot program shall supply #address-cells and
  #size-cells on all nodes 16 that have children.

  If missing, a client program should assume a default value of 2 for
  #address-cells, and a value of 1 for #size-cells."

So far, this does the trick, but I didn't review all the ramifications
here.

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 4034d798c55a..f86386c407d4 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -328,7 +328,15 @@ static int of_bus_default_flags_match(struct device_node *np)
 
 static int of_bus_default_match(struct device_node *np)
 {
-	return of_property_present(np, "#address-cells");
+	int len;
+
+	if (of_property_present(np, "#address-cells"))
+		return true;
+
+	if (of_find_property(np, "ranges", &len) && len == 0)
+		return true;
+
+	return false;
 }
 
 /*
