Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893FF37C110
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154732; cv=none; b=AV2J4YQ8VNWU1FwsJUO38nR6lYdnF6XF8OPHl0CFNSdWSqRoA+O4gxX78IC81GFPvfmpPD+FXes6csHSykeVokBd/VAWoT610uvK/vYBHYcPxn/qXkAXx93vadrOLPbZt/DR6bLTgiNFqm8tp8HSKhanzn4EuGEGYMoGHWMNCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154732; c=relaxed/simple;
	bh=A7rPbhe9tHHV4d32kmPILTC+TeE/L3PdKVHCOt46Bvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gPZnYDi0v4KTb+Vq28aCauCz3B6BnqdrxXxUKctJOJoSPwi1/VV4zGUN6t1wYk0hmHUvj52HKJoola6veSjFO9u8IK0xB7XxMgOlhEIowEe4G1a7vkJi0pgPx/Zk+kTVgrQ0iQNUiwdy1upsEovJ4L1nIpYXDvdRg7NEtDtIMzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjgAYgli; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjgAYgli"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-463f00cda04so682425b6e.2
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 11:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154730; x=1775759530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+5HXFm4K8EljZXquMjN18Vn+rr53ZK3oDrIhR9XX/Q=;
        b=WjgAYgli0ZEdBBt6gpMBnmA5Wu9DdEq36MA2VPihvjSAU73blYQBa16R8f+4k50IRZ
         xaShqedrqWkK6JNW+LnVKnaZcFoNlfY8BxOp3Lwe1BEbbasVxHwoyqfyPo5ogKWYHVx6
         5IulvpQuEDe91QuEb/Lok/oso2bqrfkeqxdLAphTjytRaFKOSm6pJrB+I8kcOUvbHHi1
         HSOAM1AK7dX/SWvc6X7CxEVomdD7VG83IzvuGG5qXbzRAl1U13Y+BdchhpU1B1HbmlM9
         qBeIdhf5um2GNOWobG8zmynjH2aqpcdc7Mk7qArAYqXj1a/Wly0P9IwtOd8JjKmaAkQ1
         pjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154730; x=1775759530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+5HXFm4K8EljZXquMjN18Vn+rr53ZK3oDrIhR9XX/Q=;
        b=BMB/JUARTMEczSfpyAHTHHe3RE6pXGKhwK6kv2Adqq+KTZT7y1qqtIZzpmDmhKwi4N
         o7x3NpePGjFbgVYao1ve5lT1lEELp11rpD9X26lMPDul2OcXQOmkmeX0keb21lbLXh5s
         Fkyi3qEGC832SNOXYwLQOTIhDQkLjaBuvs+OiRM0ZZ1wc0uRu+X3kOoY1AMKqFv8yUjc
         B91BF8S+IR0urVzW3c0t/MlIdagSa/M86K3LPIiumBWzjBIC/mAVMUzmNgkXwsGnXvfQ
         LuBPjhIE4RDPIl5ydueG3Gs6jMMo/9GGHe+MuNzNRM3jw/wlf1xbKKwcjksMx648shrB
         VYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1M2WyJEvfLRiHDJaerr8bCIfWLsF+v17aHYPrd2LoBO/iLgn8aXY96HF9jbUNODxgebcFEkpM+BFA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr+sgHHJbY8Wlc/LTGgHygoprcPXfqirRdWdOmzieYMbTWk3yi
	NIYwe/UClAxS7SX4uc/1pZEWYk7d2PbGFCCvBcmx6cim/sxIXGs0niB7hWwYQhYq
X-Gm-Gg: ATEYQzzrMZvhpOO/+Im1YHBj/qFL/DOr2Y2vbmL3AoWamJbVw8MZ4cZgCXg8Omjjz5L
	brl3cJRFOsfhF/dbUoveX9e6Up21xin884EiAkCsPTCgCiciM7BVAUa2AKUMy1VZy0gUbF23mBh
	Cd05ALZVOe+MRjPWGpEm1iQLtnWnSh9EhqDGz6Mkn7DXyGZGP2bROWO5gaNSFnuyfmKkXoI5Swi
	DFby+Qc8iAcsRbQ6VGYC7HfBf+YpGhyzMQ3vFvLJu4KtYTQkcKILuYGw7kKBggSaYAV33hZhyYm
	wURJPAXMAOgz5Oj+U4np59eoZwVWVbuboQus5F8afVobVoiTIY+gSPbKcjUBUYMms11IuZ+Pih1
	LUpGtfDwwwXW0E4sdxfbHqq5HDnez8KBi5lRblLtYfyubBMRjejMbdKM0dXHCY1IQzr7bu833Ez
	k2aOTaxL2cd9NO2/PJZ9uL1JQRhYIOPY0qI6+2GCuIp26pFDUJdXvJwv/fJXwXzZXO1qDG3iI=
X-Received: by 2002:a05:6808:6618:b0:45e:f0af:5148 with SMTP id 5614622812f47-46ef791a130mr217257b6e.30.1775154730369;
        Thu, 02 Apr 2026 11:32:10 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba72fcb47sm2720585a34.15.2026.04.02.11.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:32:09 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	andersson@kernel.org,
	bod@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dikshita.agarwal@oss.qualcomm.com,
	johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	stanimir.varbanov@linaro.org,
	threeway@gmail.com,
	vikash.garodia@oss.qualcomm.com
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
Date: Thu,  2 Apr 2026 13:32:09 -0500
Message-ID: <20260402183209.27159-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ebzdn3aplm76xkvljwpg6v4mid7ljslhzwnf45u4obgwhcnckh@rtdv64on3y6b>
References: <ebzdn3aplm76xkvljwpg6v4mid7ljslhzwnf45u4obgwhcnckh@rtdv64on3y6b>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dmitry,

> Thanks for the additional testing!

> This might be:
> - A bug in the firmware
> - A bug in the Gen1 support in the Iris driver.
> - A bug in totem (heh).

> Would you mind sharing details, which video were you trying to play (at
> least, the codec that it used, please).

> Also, does it kill the playback afterwards? Can you start another
> playing stream afterwards?

The video that does not work seems to be 

  Metadata:
    major_brand     : M4V
    minor_version   : 1
    compatible_brands: isomavc1mp42
    creation_time   : 2025-08-04T19:42:21.000000Z
  Duration: 00:00:35.24, start: 0.000000, bitrate: 6291 kb/s
  Stream #0:0[0x1](und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(progressive), 1280x720 [SAR 1:1 DAR 16:9], 6126 kb/s, 23.98 fps, 23.98 tbr, 24k tbn (default)
    Metadata:
      creation_time   : 2025-08-04T19:42:21.000000Z
      handler_name    : ETI ISO Video Media Handler
      vendor_id       : [0][0][0][0]
      encoder         : Elemental H.264
  Stream #0:1[0x2](und): Audio: aac (LC) (mp4a / 0x6134706D), 48000 Hz, stereo, fltp, 159 kb/s (default)


However, a video that *does* work is

Stream #0:0: Video: av1 (libdav1d) (Main), yuv420p(tv, bt709), 1920x1080, 23.98 fps, 23.98 tbr, 1k tbn
    Metadata:
      HANDLER_NAME    : ISO Media file produced by Google Inc.
      VENDOR_ID       : [0][0][0][0]
      DURATION        : 00:05:16.732000000
  Stream #0:1(eng): Audio: opus, 48000 Hz, stereo, fltp, start 0.007000
    Metadata:
      DURATION        : 00:05:16.744000000
  Stream #0:2: Video: mjpeg (Baseline), yuvj420p(pc, bt470bg/unknown/unknown), 1280x720, 90k tbr, 90k tbn (attached pic)
    Metadata:
      filename        : cover.jpg
      mimetype        : image/jpeg

I do not have a ton of videos to test, so I just used 2 that are on my system.

This is not just with totem, showtime shows the same issue.  If I let the video
play, it plays just fine, however, if I attempt to skip forward, back, or even
play *after* the video has played, then I see the smmu fault 

 arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
 arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x2a00
 arm-smmu 15000000.iommu: FSYNR0 = 00600002 [S1CBNDX=96 PLVL=2]
 qcom-iris aa00000.video-codec: sys error (type: 1, session id:ff, data1:1, data2:deadbead)

If I exit and re-launch totem, it will play the video through, but again, if I
attempt to skip forward, back or play once it has finished the video, then again
the smmu fault occurs.

totem and showtime both use gstreamer, and show the issue. showtime replaces
totem as the media player on modern gnome systems.  mpv and vlc do *not* show
the issue, but they also do not appear to use iris/venus at all.

Totem is version 43.2-11
Showtime is version 50~rc2

Host system is Kali, which is essentially Debian Testing.

-- steev
