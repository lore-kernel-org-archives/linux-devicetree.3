Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAD43630AC
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931307; cv=none; b=CDHE/FYOnl6BsYXvz1H9lB4fGpcTnd3HxTK5bZ63IXYAM8vqElA7eo4DdvsdLklQqIuFCv7RRZ3XQjpgBwrJA62C1s4YoDpPBF20Oh91jKzwbXhpTLXAdE4WrAGtRNXQckge76sgLaPQ1WOtf1GKaXjLvZ48iWh8L+G68Z9uaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931307; c=relaxed/simple;
	bh=c/t9wvTrRm3cNtaiF1yv0aTmAvMyzHTd2ks5sPAyh+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbgmWfam4aDUe1isyzwG2c3dtQsoZUcK952K5Xowb6QebFF2ZtSzyT7TDICtpainbG5YtuZqv5SfQsZTHHBKOJ9iUXTvfE+9gJ2ZoYwNhJWO/YH2gSbohZ7dNyZwW7DqusWZ/hmY0hm6f3K0YcfwoYaeUi+0/M79qDtR0dt9nG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPiENSN4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPiENSN4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482e61a34e5so452919f8f.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931303; x=1788536103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qLyJXx3vDV6RKEzodqCE4zKvUZXhtE2BMX7guEURaQ=;
        b=jPiENSN4GoR5xzo5GAvIeeKAc7FTcAvSjwrqcKLQ8zhuJwTPBqzaRx53Brshn2MDqo
         piVDJH5QOYvSEhfo3Zn2M5yhndEPBFBd49ZGCOaCt1qzxtnDxN3R8ldCt53YQku5waQo
         sJq5VBwbD9adLJ0SMjq0v2hTUTjFqkcMQ0kJ68+CVBiX8CT8sHk1N3rDgIzWRGLqYejK
         4mtEKHoJYKHaB+28Dx4BKSyWuY06IKELnL4Oy1Zolwnzco922fxIxiujL8oj5xtgOBGp
         SII1bTufyk1+XmHaNhHolJU5ZDt+9CuEkH3FTJV7lh11iIVAYYypJKMNc0+REP/GfH8O
         +IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931303; x=1788536103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2qLyJXx3vDV6RKEzodqCE4zKvUZXhtE2BMX7guEURaQ=;
        b=A8HCfOtnqNnRRhCF+KmhRa2a/iz9EYZlYFtmeyhkEE8DUAeyMnoBhW42FtST8Jog5M
         XoW3fTXXVX0dXq3Otu7u9s33Aw17EM0xnf/Mv3SrOFpA82aXqv4EM1QbO44Uadzeawh0
         LaNC5CwXEdFX2yP91QTYqGfgyvqtNcjTFKzFfsZx+kvKO+CronOqVsHVsTxpwzxcdNUv
         2kJKDWtknTfHCxlta5lTtxwNOZ0NPRiz1KLzMKBU5o8fTj5SDURoKtImbQujw7Om9WTx
         kW5HUsQHMowNQV8pzQaqsyuNgyn29apjInLX0TWwBEJZlSmUTcCB7yxa6JhS4HcNvnfJ
         RFLA==
X-Forwarded-Encrypted: i=1; AHgh+Rrkso0hzp5zjBaYcSwn+cqF1GE3DHDD5QVSCpFmaBp47X309X5QLfLJhVqUPtk/05CAzQgM0FGjt73H@vger.kernel.org
X-Gm-Message-State: AFuF++kiU3Vd5vgl+lZUW03z17fX6kSBzEdogFybg1GiCyluioNKmM0d
	IcdpTJ4x8BA6OgNitzsxicQeTgRuGlsrwScvh//YWQRikL5/4ZnM+EhYTAMHWjyMRWU=
X-Gm-Gg: AR+sD11joZRFOhnMcZp1CT1vKNkveJme1IByXZTgjsj1j+h9cn2kzEr9cElFsqFqjdu
	RurFBr5xL+INSYn8MFk4zfVNjOPsztrUZS6JussVY7jfCpKxMHk2KGr4owARE3k1OSOTXxokmtY
	vEsYzzWy4Z3vsOlY/nU7HNjD66APugOqJTIiAmeKc/Z70mh+qVRGF+7779ZIZvpd5uDogD0YCfK
	rR0oCTranQcKS4csOxRhHjUc/jC8mf4KGwqvp1vy6WQR7ltg197iyy7IrwHnyioMjefVvjz4Zk3
	Ivtc8FLfX5NBMDhgKPsOONH1CbKwH60PpvYRxClqchrmX2ij5P16QHnJDpXg5jh/nE54fuU4pCu
	VC8RG0cTkd16BZy1T+zMrFZTn50BTtvbCoETJyBdU7YstlxIi9LCLDa+N1ywUS2HqPs9ide970g
	uRnCPvgobpavai5HZQiSXXrVEcbwZk/k6GiZD67HeEacx7VL/LhOsXY+igCLu/kC8NaiHSTLtQZ
	f54SrzP0rRN5R4EYsswQNkuQCkaQ01Dveo+P51Zu2lO74PO40SNsq+QXrtkXQKXGiphUWf1UugG
	dThBU7d9C/Nypjs=
X-Received: by 2002:a05:6000:4705:b0:47f:f4b9:88b7 with SMTP id ffacd0b85a97d-482f7988875mr13087444f8f.1.1787931303054;
        Fri, 28 Aug 2026 08:35:03 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm4453038f8f.5.2026.08.28.08.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:01 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Fri, 28 Aug 2026 17:34:58 +0200
Message-ID: <20260828153500.31556-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apGbnVqQczMrzoUg@kekkonen.localdomain>
References: <20260826072002.14357-1-robertbozik@gmail.com> <20260826072002.14357-3-robertbozik@gmail.com> <apGbnVqQczMrzoUg@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thank you for the review - that is a lot of detail for a 2800 line
driver and I am grateful for it.

One note first: v2 crossed with your mail. It only carries Conor's
binding comments, two fixes the Sashiko bot found (pm_ptr() instead of
pm_sleep_ptr(), and the control handler freed on the probe error path)
and a trailer reorder. Nothing below is addressed there; it all goes
into v3.

> Nearly all of this belongs to the cover letter -- here you're expected to
> say just what the patch does [...]

Will do. The commit message will say what the patch adds, and the
measurement detail moves to the cover letter, along with the long
provenance comments in the file that you flagged further down.

> Is this needed? The DT bindings suggest otherwise. :-)

No. Dropping the ACPI dependency.

> Please calculate this instead of adding a comment.

Will do.

> This macro name suggests it's a register address, not value. The register
> address should have a macro associated with it, with a human-readable name.

Will rename it, and add macros for the timing register addresses,
including the ones behind the fields in struct ov32c4_mode.

> This isn't really specific to the sensor, is it? It'd be nice to know what
> this required write is really about but it sounds like there's another
> device there that needs its own driver. Is it found in the system as a
> device (see what's under /sys/bus/i2c/devices)?

It is, but as the wrong device, and I think there is a problem in
ipu-bridge underneath this.

ipu-bridge takes the VCM model from ACPI and does not verify it:

	sensor->vcm_type = ipu_vcm_types[ssdb.vcmtype - 1];

Here SSDB.vcmtype is 2, so it instantiates a "dw9714" client on _CRS
resource 1, which is the same address my driver writes to (0x3e). dw9714
has no identification register, so its driver binds unconditionally and
cannot notice.

The chip at that address is not a dw9714. With the sensor powered and
the dw9714 driver unbound:

	w2@0x3e 0x10 0x01  r1@0x3e   ->  0x04   (what my driver wrote)
	w2@0x3e 0x10 0x00  r8@0x3e   ->  00 04 00 00 00 00 00 00
	w2@0x3e 0x00 0x00 r32@0x3e   ->  all zeroes

repeatably. So it has a 16-bit addressed register file and retains what
is written to it, which a dw9714 - a write-only DAC with no register
addressing at all - does not. Its lens subdev has zero pads and zero
links.

I could not identify the chip. Only a sparse block around 0x1000 and
0x1010-0x1018 reads back non-zero, and I found no ID register. It has no
ACPI device of its own; the only other unbound I2C node on this machine
is TXNW3643 at \_SB.FLM1, which is the flash module.

Without the write the sensor NACKs everything at 0x36, so it does gate
it somehow. The Windows driver issues the same write from its sensor
driver, so there is no separate driver for it there either.

So I agree this does not belong in the sensor driver. What I do not know
is what shape you would prefer instead: a regulator provider consumed as
dvdd-supply would mean writing a driver for a chip I cannot name, and
something would have to stop ipu-bridge from claiming the address as a
VCM first. Guidance welcome.

> These belong to the int3472 driver or the ipu-bridge.

Agreed. They go away with whatever the answer to the above turns out to
be.

> These are 0 and 5 ms, respectiely.

I am not sure I follow - could you say what you would like here? The
values in the patch are 5 ms after the supply and 20 ms after reset,
arrived at during bring-up rather than from a datasheet, as there is
none.

> Is this required?

I will test without the retries and drop them if the power-up sequence
is enough on its own.

> That's not right, these are in pixels in terms of the value of the
> PIXEL_RATE control, that reflects timing on the sensor's pixel array.

Thank you - I will correct the comment and re-check the arithmetic
against that definition.

> There's (typically) no need for get_frame_desc() op if you have a single
> stream.

That was my assumption too, but it measured otherwise here: without the
op the call returns -ENOIOCTLCMD, the receiver is configured from the
media bus code alone, and the IPU7 then reports one oversized packet per
frame. I will re-test that for v3 in case something else I changed since
has made it moot; if it still holds I would rather explain why the op is
there than drop it silently.

> No need to check for errors here -- v4l2_fwnode_endpoint_alloc_parse()
> already does.

You are right - __v4l2_fwnode_endpoint_parse() returns -EPROBE_DEFER for
a NULL fwnode, and the comment there names the IPU bridge case
explicitly. Dropping the check.

Everything else - pm_runtime_get_if_active(), setting the control flags
after the handler error check, v4l2_fwnode_device_parse() moved up, the
error checks on __v4l2_ctrl_modify_range() and in disable_streams(), the
definitions from mipi-csi2.h, unsigned int for the loop variable, and the
debug prints and redundant comments - will be as you say in v3.

Thanks,
Robert
