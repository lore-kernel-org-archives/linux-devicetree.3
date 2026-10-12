Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634E333A70A
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799414; cv=none; b=Rz5hXYRCshs6Zoyq/a8a9NYLt4eaIFt/z8uQcyTvalfkgitHSnunGycQMHTEAjeNKL9nBD+8+bpvp5KIyepLTR9JyzAsQiHA+RNQNYWDag1GJIIOsGIAN8UY4T8sUcHChg0Srm0Xk7iaEmqhM5W/xk2EnPX4n2yhQdXjLVti54o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799414; c=relaxed/simple;
	bh=pMB0A21SryNXlmUH3phs16FUTBMr5ipX7K9gSx4AdVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGT0T8miTO7Ohg8e7XzrJQ93R5JwEeAqvt9UcOcU2XKgWFWut8D64ndLm/Ywkisxo3Nbis5PUClsTb5KDSgtjolkkCJoB8/8E/ODtEGACfF4cF10ftK1m9s4ffQEM5vaMPFiuuG1VJ/HNrd/bNEDVHa3ndNoyYiPnQblihJ62Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuUfMxGS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuUfMxGS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d01548ac96so1129085ad.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799412; x=1792404212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMB0A21SryNXlmUH3phs16FUTBMr5ipX7K9gSx4AdVk=;
        b=QuUfMxGSrJyTq206XjGDYxRcDbLEWnPKUWaibCM94G6qDpXv6Au3zPUtL2xSm+Z6Dd
         o+rEXB4/lmzCi2E8vBCW+XnU4ZOLEPPa7/Xj0AKIgl9/La7uAz9LBa7sKdPgkdZRXVVj
         N55CtL39ek9O/FsY6zLohCwRaZ/0bdSQoV2hTBTIltNB0lriAvvV4RHuyfyp/5411qPz
         bu9DQWiS5QRQHyh5bLQm45Lun7TyfD3DEuk0E3661macxPa4rvmA9CgxCfgrl5dLwpkg
         QvBCoztR/p3KBUos5qH4ITxkY5i2x7jIboMP1Ndayn4GrvuZKC2oKVLzVXNhwITCKz+i
         /m7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799412; x=1792404212;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMB0A21SryNXlmUH3phs16FUTBMr5ipX7K9gSx4AdVk=;
        b=IrNNGWJhMNPJPFKvvC22LidKM57l8bwhSlqNMIzE2At/EH1deF/TfV5jS650+Gm/aU
         obz/cqtYNVFYHgYo/9jMyrOy4pwOCLolLl9vluM73EYuF1GpyVUind7w9bPNgJylJ0JO
         CY9XxLo2RFqk0MdxdclBaVt6IIoNOCXCRtYxUAhQnU0M75mvNjMFvy+d5C6A8eohl8dr
         wcdE7tkynmJGNKvzlq840pC+EBaOqliFv8JQAD0ELfvxGbf97ePYfGngUw7En4l2QwOc
         p1qBXmX7Je+k2oweAcvwCVbb71wcs0/6b5IeSm/A404+CIEkyn490QYEzkE3h/EJ9OKQ
         cf0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxM9tbvB5Av5MjlnkP3nOKXwvjzZOaxmyb3E1vyb57YMezAGEJu6vC+MCdf0TGsutKq96SRUi0t3XO7@vger.kernel.org
X-Gm-Message-State: AFq9FYKlRL+7FysXcpmvlXmv/Ej4mCZyUajS1wku4DQa6VCIZ2pWV0dE
	oUdGb/nJDqvUZxlS25HZWbwTTJZDPpOfjfW/l9w4GGkzvCsWuSXtYe43
X-Gm-Gg: AYBFou2lmqHd511KIRsvIped0hOOWRhqOcU4GGgGOrc2Li+0KVQf7bSm75dIovJzRK1
	OTPa80rmOit+NZs9BfeZUVFWWBrZAALXgnD5EaU3AxzM0a3v+kq//LCYuKm9JbxzGbSIXGvi0D6
	7knV6zW5r+d/TtOudwbmMREmsiqVLAlnb6ZMd8IqHXksx4F7FaF3usMEa9/ePefeQYG8DEQDVc5
	LNAj5fvbAm+hYr2tQQObYGEVSlogsvxZB18GGfCddemp+lDbuQpdZlIrmfmwM372DOM4RSG6Rl2
	pbG1aCkymRi/cV+WgwVh2mTObzPZRuonqAvaBCsuQkvq9088NnTmQRhawZTtydoNLxeVoxOYRPM
	d3LN6jZ2Wci7fFgcm1uN7bK0oiG9oRxC5HFQ45kobQ1oJ23DbYbVh9AWM6ajWgimv89r5CZmSwD
	wHCFOG4ZwEsm8V3CgwYHB85omSbPqYuOJaRB7elpuucmLCCP6FW5jN2zzpDQvPfZ7ex0irdfV4s
	JnJv0udpS0SwQ==
X-Received: by 2002:a17:90b:224e:b0:3a0:bcc8:1549 with SMTP id 98e67ed59e1d1-3ab3afb180emr12455847a91.6.1791799411141;
        Mon, 12 Oct 2026 03:03:31 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm16124808a91.0.2026.10.12.03.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:03:30 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: kaipeng94@gmail.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Mon, 12 Oct 2026 18:03:21 +0800
Message-ID: <20261012100325.38128-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAHk8ZdsVK-n6u+KO5W0=7c_4_eQ2Aj0aqTg_tqU_x_58t0L6dQ@mail.gmail.com>
References: <CAHk8ZdsVK-n6u+KO5W0=7c_4_eQ2Aj0aqTg_tqU_x_58t0L6dQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kaipeng,

Thanks for the detailed reply!

On Mon, 12 Oct 2026 16:15:19 +0800,Kaipeng Zeng wrote:
>Acer had a page about "Acer Swift Go Pro AI" but it was deleted,
>fortunately here is
>a snapshot:
>https://web.archive.org/web/20260314171131/https://www.acer.com.cn/product_list.html?parentid=323
>It's sold in China using the name "Acer 非凡 Go Pro AI".
>There is some discussion in the thread of my previous version:
>https://lore.kernel.org/linux-devicetree/20260729064538.19564-3-kaipeng94@gmail.com/
>I have no idea if your "swift SFA14-11" is the same as my "Acer swift
>Go Pro AI".
On the naming: you're right, and thanks for the pointer — the SFA14-11
series was indeed marketed in China as 宏碁非凡 Go Pro AI (my unit is
an SFA14-11-QWU1; the retail listings I found, e.g. on Suning, are other
SKUs like the SFA14-11-QGU1). One thing I noticed though: that retail page
 has since been taken down, and Acer's support sites — global and China
alike [2] — identify the machine as plain "SFA14-11" within the Swift/非凡
series, matching the DMI and the model string shown in Windows. So it
looks like "Swift SFA14-11" is the stable, support-level identity, while
"Go Pro AI" was the transient retail name.

In my series the maintainers asked me to use "acer,swift-sfa14-11";
Ubuntu's stubble has also independently settled on that exact string as
the hwid for this machine [1], so that is the string my series will keep
unless the maintainers reconsider after seeing your evidence — happy to
align either way.

>Currently, the audio of my dts can only work partially.
>I suspect there is something wrong in my ALSA configuration, and
>adding sound-name-prefix
>can improve nothing in my case.
>I still need time to try to solve this problem (also dmic23 / "VA
>DMIC2/3" routing problem
>you point out).
>I notice you list that your audio totally works, if your
>alsa-ucm-config is your customized or
>just using X1E80100-CRD.conf?
I'm using the UCM configuration for this machine from Ratizux's downstream
alsa-ucm-conf tree [3] (small world — your brightness work is based on
their kernel repo [4]). Upstream alsa-ucm-conf doesn't have a profile for
this machine yet, so if your Ubuntu 26.04 doesn't carry one either, that's
likely a good part of your audio issues, on top of the missing
displayport-2 DAI link. It would be nice to coordinate with Ratizux and get
the profile submitted upstream.

On the dmic23 question: the array on my machine is a dual-mic setup next to
the camera — I verified by tap-testing around the chassis (only the camera
area shows mic response), and the VA capture device exposes 2 channels.
The other X1E laptops in tree (T14s, Vivobook, EliteBook, ...) all use
dmic01 only; dmic23 is only wired on the CRD, which made me suspect it was
carried over from the template.

>BTW, could you let me know, how can you know which usb devices use
>which repeater?
The repeater mapping mostly comes from the ThinkPad T14s device tree, which
is the same reference design — it gives the i2c addresses, reset GPIOs and
which hsphy each repeater feeds (0x43/0x47/0x4f on i2c5 with tlmm 7/6/184).
On my board i2cdetect shows the repeaters at 0x47/0x4b/0x4f (the camera's
repeater sits at 0x4b rather than T14s's 0x43), so I kept the T14s mapping
with that one address adjusted, and verified functionally: webcam on usb_2,
USB-A ports on usb_mp. Your UEFI hypothesis sounds right by the way — since
Linux never touches the reset GPIOs when the nodes are absent, chips
initialized by UEFI keep working; describing them is still the correct thing
to do since it makes the boot-to-boot behaviour deterministic.

>It may be an unused USB root hub device, can be found via lsusb or sysfs.
>I didn't verify if there is any device wired to it before.
>I verified after you point out this, and I couldn't find any device is
>wired to it.
>All USB devices I tested still worked when I disabled it.
>If so, I think it could be removed.
>But, I can't confirm if this USB device would be used by SoC internal.
Thanks for checking! On this board the internal devices (webcam, the fingerprint hub) hang off usb_2 and usb_mp, so with nothing answering on ss1 I agree it can be dropped.

Since you're planning to send the next version, I'll keep my series updated in parallel and will of course review yours — I'll leave it to Bjorn and Konrad to pick whichever they prefer. Thanks also for the EL2 notes; I haven't tested that configuration yet and will give it a try with iommu.passthrough=1.

Best regards,
Jianfeng

[1] https://github.com/ubuntu/stubble/blob/main/hwids/json/x1e78100-acer-sfa14-11.json
[2] https://www.acer.com.cn/support.html?type=1
[3] https://github.com/Ratizux/alsa-ucm-conf
[4] https://github.com/Ratizux/linux-device-acer-sfa14-11.git
