Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD2440A93E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455661; cv=none; b=I2NleoRXjB30EXrO7MPPnCSqMFw0Wd5J4/Ra2rOGG7Tmn+YYVJ3xlW9WPwSD1lPnq4vzL6SfGrF0epinKlfHQWMOv592UAhgf4E0dzrF970sXZv/QZDsW3qSchBSsKx65GLw/V8tiIjVM3zE8CikqM01nepEGpp1tiZnqaeJ6QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455661; c=relaxed/simple;
	bh=NjtMmGGe9Z6SsWAnOywBj2B/KK6ioQeD8WkEr0YiNlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VcaxV/7sycK+M4LMqvyvYMejt3hxIb4NQgX6D2uAe2beV6/YnX44oFcVcEnJm70ytPaEOaIQYcfk6xRo4YBv2pd89lODe+zaPDAGM9+yHAl3Tv/kSpldk3ZeT9Vl9Xp8seoXRkbymgbdAYmmelSLd4CA0uNh/00/AlX+LJvBQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAacpQ3a; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAacpQ3a"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc74881317bso92399a12.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455660; x=1792060460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRmkdeiD8ReZpDPX5N50tNchauYw/eSsVXxk7TAzHQQ=;
        b=cAacpQ3aIoksykuxOchV5x69Sgsyn/7AjkuGm4/HLGEukwtdyGsV1MRi0wmr/0UK54
         AKbwNJ1mr0Utyd9dy+GZQFde9ERwfkOZGflqJIKaoVkZlpEJMSMdz7mmEnsSPavmwyUC
         ykmCj2t8QX9QVjOdA0fELEIK+otJPkcizCFIy5C8drCzOmNXssrLDOrUf4uIGeitcSCh
         n0WmZoRJdS3yxWuacHn1oq+SNFdD7YZoIMopRbB7HoQjmh4KT6eNWYag6HRej/jKQ+2B
         QIxa3reJOciABkFyRJmk6yVjr4YHPoQ6rC64vxVYljISWe97j+l4h5hxzdlZzb6I2kPA
         /T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455660; x=1792060460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRmkdeiD8ReZpDPX5N50tNchauYw/eSsVXxk7TAzHQQ=;
        b=APBISOsI1s2eh5hsH4azb+Ys7KG1T/chMAduFM66P73rOFU7gQm/fBoJwqfniSmSMN
         GolaifJztU6rF6RlaoVF6ppPZiCYp+GMWXVY5cyDsUMkWwYsm/oWHX/vljyROrWIKnoo
         uu5d3hCMUbmT4/3lzdTGSWcbtGZALK41xd24DSm4IljD26c/ddA3nvEj0/XxgVhFlW2l
         xLAtjND3FxNvnROEJX8HbHVAGrm+v96+nwDJjiLeQTNSFaUJBMeuIkuRpjDFfKCDnAzL
         KXN5fLpOMEefx13xh++W0FCwHbDuSAezn8UBcSDuncmF6Edph2Jb+KAMsIOcbM7yTmYa
         7Kjw==
X-Forwarded-Encrypted: i=1; AKwUvByGLUP8ZX9Mn3DiNab5RBmLB9FxM4wiyXS9WmNCSRYLMfa3nVXT4esS+DvoOGyliuk+vyQKJkuKm1ZM@vger.kernel.org
X-Gm-Message-State: AFq9FYJDx6LnyhGAspfWBuof4x0aH4ojt2F5Tyusd7Hr9+DBPmW1T3WZ
	Dq90lkMk27qKqlRciay7gaDG7I8hr+sXJsP9wmJUOCPHGm1hZpMOggQh
X-Gm-Gg: AYBFou15v0X3k6urIfeMRpjwmqBobW3TX++pXuH5f6V0KTjWme1HBEU1sm42jgBZW5k
	jSIMMg4p7XQNNBIEDBIz5JfNWhTUghBBFkYNNUI0GixiOSp/M0uUr4tEzwY0lngPr09PSFQGLvj
	aNibXELd98+GHuAKgeDZ9idlYD0VYvSHmL6JPNjuxqoUOldHoCKdJKNxOj3iHTJAlzqtwEGPvYv
	K5IighIxOJm+xW4+fEkkHmA0PSH0/i+JzYJvttOIvFr39h+8APUQA1iJ1ZX1cTGQdXBu5H8BzHe
	cRDL5lsMIes7WMxx5ynBUN/KOSWvnKM1RyeE3MKrAe9ATfOV7k+PsNm16xa2uSEoq43WUR70CGU
	JPblGbxgTJx6OBUmRDX/3zxYwT4BmZxC87n9a61gXea9UPdk9WvtHaQOZZzwVE9zOwn8UuxKEfY
	dHr9MVQojP57gMxNt3fKvxolss8eo7aTaQguwp+PLMsihXvC2TScvPDUQhZIN2md+XmOvJAW9HF
	9sLl2nt3EQIWvl40Axt+sWf
X-Received: by 2002:a17:903:1a28:b0:2da:dd0a:99e0 with SMTP id d9443c01a7336-2e7ff49616emr28797475ad.2.1791455659602;
        Thu, 08 Oct 2026 03:34:19 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604b63d9bsm22860405ad.84.2026.10.08.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:34:19 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: kaipeng94@gmail.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Thu,  8 Oct 2026 18:34:11 +0800
Message-ID: <20261008103414.6170-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006085425.40450-1-kaipeng94@gmail.com>
References: <20261006085425.40450-1-kaipeng94@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kaipeng,

Thanks for working on this device! I have also been working on a device
tree for the same laptop; my series is currently on the list:

https://lore.kernel.org/linux-arm-msm/20260929103053.10241-1-liujianfeng1994@gmail.com/

Since we are both targeting the same hardware, I think it makes sense to
consolidate the two efforts into a single series, as is the usual practice.
Below is a summary of what I found while comparing our versions, hoping
this helps us converge.

A few things I noticed in your v4:

The vdda-phy/vdda-pll supplies appear to be swapped on all four QMP PHYs
(usb_1_ss0_qmpphy, usb_1_ss2_qmpphy, usb_mp_qmpphy0/1). The QMP PHY expects
vdda-phy at ~0.88 V and vdda-pll at 1.2 V. The same issue was fixed
recently on the Purwa boards in commit 7c1d0ef2969e1 ("arm64: dts: qcom:
purwa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies"), which
includes the reference mapping used by the other X1E boards.

The &tcsr QREF supplies are missing. The qcom,x1e80100-tcsr binding now
requires the vdda-qref*/vdda-refgen* supplies, so DTBS_CHECK reports 18
warnings without them. All other Hamoa boards have been updated with this
block.

The series is missing the QSEECOM allowlist entry for this machine
(firmware: qcom: scm: Allow QSEECOM on ...), which is needed for
uefisecapp / efivars access. I'm carrying that as a separate patch in
my series.

The three PTN3222 eUSB2 repeaters on i2c5 (addresses 0x47/0x4b/0x4f) are
not described. They are present on this board and feed usb_2 (webcam) and
the usb_mp ports.

The displayport-2 DAI link is missing, so audio over the HDMI bridge
doesn't work. My version also sets sound-name-prefix on mdss_dp0/mdss_dp2,
which is needed for the DP audio links.

Two nodes look like they may have been carried over from x1-crd.dtsi
without being verified on this laptop — could you double-check them?

  - key-vol-up: as far as I can tell this laptop has no physical volume
    key (volume is an Fn combo on the keyboard).

  - dmic23 / "VA DMIC2/3" routing: the mic array appears to be a dual-mic
    setup beside the camera — tap-testing around the chassis only shows
    mic response near the camera.

On the naming: upstream asked me to change my compatible to
"acer,swift-sfa14-11" (my v1 used "acer,sfa14-11", following the DMI
product name). Acer's support site calls the machine "Swift SFA14-11", and
I couldn't find "Swift Go Pro AI" as an official product line anywhere.
Since our series use different compatible strings, file names and models,
we'll need to align on one either way — I'm happy to go with whatever
the maintainers prefer.
One question: you enable usb_1_ss1 with its QMP PHY in USB3-only mode
(DP input port deleted). Could you share what it is wired to on this
machine? The only USB-C port is on usb_1_ss0 and the HDMI bridge is fed
from usb_1_ss2_qmpphy, so I wasn't sure what ss1 connects to.

By the way, your EL2-mode testing is a valuable data point — I haven't
tested that configuration. On my side the following is verified working
on hardware: eDP display with PWM backlight, I2C keyboard and touchpad,
USB-A ports, USB-C with DP alt mode (video + audio), HDMI video + audio,
speakers and headphone jack, WiFi and Bluetooth (UART), webcam, NVMe,
GPU and battery charging.

Happy to integrate any findings from your testing into my series, or to
review and help with yours if you prefer to carry it forward — whichever
way the maintainers would like to handle it.

Best regards,
Jianfeng
