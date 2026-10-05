Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1793244F563
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195294; cv=none; b=HjC8xM3iy1+6JJuDf0A3s+mw6+f4jqSRBffPNCt8OzhsAHxuymjPmLTxRVV2FisctWsX0UgfvYLEuyOf7EwH55wNKqdK4XR6HIfw7dQj+Py2YNQVWtxbF2+esZ4DeBD3HsAafKCLswldUmbM1rdLdPbXRrbdhO/fKyWodsIKahg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195294; c=relaxed/simple;
	bh=SiCSaNH35Aalw7e03q0enXBs+RMPPX74VeGZyDKg77c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6JqOnTyWlKC5rq4w6ReLGvp0Dc+oPRFdhD24YR3TcIqnV6HMCOG1/kiRq1YHWxgzoZ2pGOrHrBaYL1G0hE8jojhWT6CKCEeZI8Hb2q2pha0guQUA289ZUOwLCs4Drk4wDYmP8YHjmdGIIFSrlbQi4lIPGtsf6J2dnVdgry7MPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8z4F4C5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8z4F4C5"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1594897f8f.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791195290; x=1791800090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X6peHqRvKIr35uOnhSLA6otbHrMaTXR/Zz2Q8g3tXsk=;
        b=E8z4F4C5raHgkCPaxLGTVC0qnmkMTwYp83gmHKoYs+PTOp23wwEM4G2fGm/4p30ByQ
         /iJgvJdhLnnt3i/B1ouPcQBzN3golvYN8nLAl2xcFwHNzfGsUTxFLG+iRobqUKvUua/G
         /gfBhz6cCbO9vH94UHgHOXYr5aSueXkYQ1FZaZd7FKYIRYYK/GPbu44e5ye3uquiK239
         cLEXQ1GFoHzxbZpZC1Ikg+igmM1Z/kpCZvbafptHJTT87c79/y7coWOEHWjnTtQKq0GJ
         U3jEeuH9eJUq5t8xTnZXDiAp56K/ieFoeK0NcmXqNqbz2vfxTxH8/zN49DZ9ORjUeXHb
         ZihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791195290; x=1791800090;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6peHqRvKIr35uOnhSLA6otbHrMaTXR/Zz2Q8g3tXsk=;
        b=nfk1Q5ftlWp5S/iQE+bXqoX0m2h3hJWk7WeNobS+tzo/cNRZVrQtgIR15obveZSckp
         nvtwGJe6Hk47NvBgWiaNjXRM2hBNZmFnEZO5X1d6pvYB0OrI5Acbj2PR7yyM3WoBpu6C
         0bS4/Yhoz1Va1GRiUCrzHKuCI98f2Q51BUPZlDzL20nmcBD4dTtR06GtG+QZr2qi3498
         gCTOGR+7/0l1rYkfJnsthZBrlcaAUDbI+335Pm9f1/EoHN2uyRE07fjgbf3C9mJFzrD5
         QBIWKE93/VdX7LJkGJbXunsG6e9F5lOCKloZdeJq2UI+lGB6G9HSvPt8wzRyxOMJQjsv
         wSog==
X-Forwarded-Encrypted: i=1; AKwUvBz56CVj6U9UOKOtLmjd/sNbWCoD6MhCqBY5gowtq4l488kvNPxd8cmsYMXy551YAvRVBjNoB03YI9Ny@vger.kernel.org
X-Gm-Message-State: AFq9FYIdEQj/+Z0ivk2QgggWriR+DF+VR+VXc/kcPJJhYiDpevG0I8vo
	XLA+5klJ//hDOTOdFDoqCadjXE3DT0z9JGuIaq3lDFScylWNApwS3rcK
X-Gm-Gg: AYBFou3AW9EYqvCKh94FZdcPQmGF8oab9zGZrBn/8xQqYKxH0JALa0CwfxIXpF4AFEU
	UrFQDvCebu5uozBRqwb4ulv/mts/deTBsNuiS7p/FogYTBiwd7wR8gjFLOeGVsmRzkZ2LLtBfVX
	0y7gy9bcdUrW9hqO+nWg8TAZzAPigjGIB2ggIsQEoF/titGLejR89RGYhXgO0fZ4LV0QmBL83F9
	CaOJUORxo1A0eethpehQaPEGtTubsXhkPfAVCXgQcuantTdOahL5/d0/9KQDfkqgrQ21A3EXnd8
	MvXmZrMHRPLESp7emeAp31qQGhE3IdIrvFtIK9TAYRwi0z+cd/OWjhdYCrKQMaaBUnJL5+TUbTj
	xLt5OsmyEV2rr4MXiXb2AEEvrZw7eXGc1LuHL87R2iSJ+RYTXtdDDij7rlJsHk4t+DUfGPr6noN
	mXLF8S4NcLPNE7NR9N2PiaKfHlqmx+6EHG73yAc8IjbqyD8m2/fYC7N0Yl2wMe4rmlHdgI97UHG
	/3M1NensfrEXDZmDSzZamK6TwSjxzeH6HAfpadLVLq7MyqHWpYq2c8rK6TbEZz3FsM6o3ifckor
	4wXTei0DkBZVcNA/p9wjBMEgAQ==
X-Received: by 2002:a05:6000:2482:b0:486:e707:42eb with SMTP id ffacd0b85a97d-48c47fdff0amr13692245f8f.33.1791195290122;
        Mon, 05 Oct 2026 03:14:50 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62270746sm2478145f8f.7.2026.10.05.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:14:49 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	antti.laakso@linux.intel.com
Subject: Re: [PATCH v4 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Mon,  5 Oct 2026 12:14:46 +0200
Message-ID: <20261005101447.15264-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asNsiKal6GgcqUSK@kekkonen.localdomain>
References: <20261005071010.7191-1-robertbozik@gmail.com> <20261005071010.7191-3-robertbozik@gmail.com> <asNsiKal6GgcqUSK@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thank you for the review.

On Mon, Oct 05, 2026 at 12:23:20PM +0300, Sakari Ailus wrote:
> > +	{ 0x6ad0, 0x00 },
> > +	{ 0x6ad1, 0x75 },
> 
> Are there any gaps in this deluge of 0x0 and 0x75? If not, could you write
> it programmatically rather than using a huge array?

Two contiguous ranges, 0x6ad0-0x6bef and 0x6c00-0x707f, with one gap of
16 bytes between them; every even address holds 0x00 and the odd one
0x75, so it is 720 16-bit registers set to 0x0075. v5 writes them from a
loop and the table shrinks to 345 entries. I'll verify the stream and
the image after the change, since it alters the bus transactions.

> > +	ret = acpi_dev_get_resources(adev, &resources, ov32c4_i2c_res_cb, &ctx);
> 
> The presence of additional chips like VCM is very much dependent on the
> module, and I think we should have parsing of the I²C address outside the
> sensor driver.
> 
> One option could be to stuff it into the reg property in the ipu-bridge,
> that way it'd work the same way for the driver on both DT and ACPI. In the
> ipu-bridge, I'd use a static value and provide the reg property for this
> sensor only (based on _HID). i2c_new_ancillary_device() will only use OF so
> the driver will need to dig the address manually still.

Agreed, that is better. For v5 I'd give ipu-bridge a small table of
sensors whose second I2C address belongs to the sensor itself,
{ "OVTI32C4", 0x3e }; for a sensor in it the bridge adds reg = <main,
aon> to the sensor's software node and does not instantiate the VCM
from SSDB - so the no-VCM exception of patch 3 folds into the same
table. The driver reads reg with device_property_read_u32_array() on
both DT and ACPI and the _CRS walk goes away with its CONFIG_ACPI
guard. The property fits into the existing dev_properties slot that
lens-focus uses when there is a VCM, so no change to the header.

The rest will be in v5 as suggested - the register names, the RGB/IR
comments, the function name, the error label and the comments; the HTS
define was unused and goes too.

Thanks,
Robert
