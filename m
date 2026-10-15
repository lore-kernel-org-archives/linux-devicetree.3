Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C195356E043
	for <Devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088586; cv=none; b=WEpV15O3VbWJmZTdZObvHmIJCx+9MfgQlCm7svcPUX+7XgqG/ZZVtMsDbEURK11KYGt2gnPZQ2qCvfNMSJfU97kUbVPa6evq2scl5fzEKiRMe/KcFRci2tkbRooVo+wnEznOv4XmtzuK4xhzF2AbPdxzmUWj+Oko44lxl+4I5ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088586; c=relaxed/simple;
	bh=XMIvug3i0RknPRe7WxtiEDH0ly3owKWOWapuAf1DmBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xc7JmxxCq63637wJ6a8rShpbNkYBhrUh226xaJYMj+nWIjj5M0bDlnaF+P/BAKXElR6GtHyT4s4xS2sankY1Nv2Sy/EtqCmAWlTwzzOnCMRJWiGLC0VCiVTFPpJAc9fG7BeoX9Dpl9Lg6OByYCMCW0dKVpMhPwBU7V1U0lhF1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jc1pxq+P; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jc1pxq+P"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so3468913c88.0
        for <Devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792088582; x=1792693382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E867nn/QR68vfYR6iPaGHnb6wZdyLc3jZCntABPPlec=;
        b=jc1pxq+PK+i+oET1dwRBkVfZV0BO/nw+Kf5d+3VUHC/hCBJ5KKXn1xiZpf+r0TF/GF
         Ji4h5Q3mzPEJ4jdhdUKvqzH8JQIO7PJ35+2CoVrO2ioR5K2zzku0PNhBHuMUcOBjGZPp
         d8i0mSTq3+EVhQgWR4TeRWqbSNz8sYrfUV2/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792088582; x=1792693382;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E867nn/QR68vfYR6iPaGHnb6wZdyLc3jZCntABPPlec=;
        b=Z5XB0sM8UyBJExcAB/17pjLn9w8MUYiIfj6OQaRv35Kb8ZhpY/qr+ihmxeQosBiIDx
         e4FaFR8FCPbbnaewlt+LQDOQnh+nlOVwlA0q+CB68yepC3ZGuLAdfD1nRerOYro5PSNP
         f8fHTONJp0fq5eM/Fm0C4/IpMLyE5uq6nyIBuX4GXwhVZa5pVgGSS0eCftx5o9AdXa4g
         l3f++Zxt6BMqehJMEmOU5MJJdRDn4FI/R3Z6kF5YRsiYdU14amNtC3P4GsDz+pB4eaXq
         NjxgBDxOgvd+ESPoc3mvKrv+5u8BT5mLFpxWiu0ej+Jdo5k0NZ618vxpTHp8I64dDeA6
         iwxA==
X-Forwarded-Encrypted: i=1; AKwUvBzVVic2MWqB4q7tvehwcWPLh3EdEgQCyR5lqZuq33XaXhEEZSLl0VJtYeNK0sjFFMf/tbYP5CuATsV6@vger.kernel.org
X-Gm-Message-State: AFq9FYK/ToztJKZ0RGGreSWYbpk5uGtvpLbAkEUOKDB7Cii6uZa61Y/1
	qDxaztSuLX1hcB/Vs8rQWIsWsBbjt/mHXakr5BS8iYbPXmjeVkvjmji9ccNx54Umqw==
X-Gm-Gg: AYBFou3MA4NiXz7BDDLK7620Zb07CPWbtKMCWXHaqoqknGb9zbrmjuhqBsUYCRQoXqO
	zpxQpvQdYAXiam/1IGozytaJsQJcmosCtBGvgnZWnzFBLFUn/N8tEUAWuPJLDvnS4CVx6aYQpSD
	IBQeM+ziT586TDoxvxEa7P3AIKXT3r9qnWerGq8CWPFJk1Apo6NsNXwJRv3pdpw+ds8NU75mICX
	kgAOUKRTE47DR7fiotLZdRADJfiCHLboRvDt4VjOcwKXdgWU6C4l/vP1kaOBcSO6/QIqQuYSkEY
	Gbc5gzxRosMYAnZstjaaqRw62xXJk382CpSEwj4JnaHLyenE3gK+P3GR62SQZ0y1Fb45DqP4Jqv
	9rSghUsNSlqwK6nQ6PXg2g4DUo20DxqnyEEX0DDFKuMerRFpowcBiz/y+bdXZQlZPNcUiJkpwQR
	TCRndnJimB0bN/vjiK0iGsNAelw8DV59abcULL73VXtd7bDizAL7J/xsjmjVfE+S8e0LgrAIzX8
	D0JvdIhsIZUmh593GbZ82hxiTw2io1G5na1Fs30hnQvF9S3ALeBlGweQYk=
X-Received: by 2002:a05:7022:171c:b0:14f:8e70:fad0 with SMTP id a92af1059eb24-16a6090d024mr25251303c88.33.1792088579688;
        Thu, 15 Oct 2026 11:22:59 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:9ea0:3a29:323e:5f11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a8a4a56bsm727204c88.20.2026.10.15.11.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:22:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	Devicetree@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor overlays
Date: Thu, 15 Oct 2026 11:21:33 -0700
Message-ID: <20261015182221.2931742-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Devicetree overlays allow you to have a "base" compiled devicetree and then
to apply an "overlay" to it to add or modify nodes. Devicetree overlays have
at least two purposes:

1. Supporting add-on boards (like "hats" on a dev board). In this case the
   main board is described as a base devicetree and the add-on board is an
   overlay. In this case there is a clear separation between the base and the
   add-on board and the base/overlay separation models reality nicely.

2. Supporting a "family" of similar boards in a space-efficient way. In
   upstream Linux, there are 47 distinct sc7180-trogdor boards supported.
   These board are all highly similar, but we compile (and ship) a separate
   devicetree for each. Devicetree overlays can make this much more efficient
   by factoring the common bits to the base devicetree and having each
   of the 47 boards represented by a small devicetree overlay.

Up to this point, the usage of overlays in the upstream devicetree repo has
mostly been for case #1.

Many Android phones attempt to use overlays for case #2 by describing the SoC
as the base devicetree and then describing boards in overlays. However,
this solution doesn't get as much savings as it could since there is still
lots of duplication between the overlays. Upstream reception towards
structuring boards this way has also been lukewarm [1].

This patch series introduces a tool to help make case #2 a reality. The
idea (suggested by Konrad Dybcio at LPC) is to continue to represent all the
boards in a family as completely separate device trees in source code.
Then, after we've done building everything, have a tool to automatically
factor things to a base devicetree and a set of overlays.

This tool has quite a few advantages over other solutions:
1. No change to the way device trees are stored / arranged upstream.
2. No need to deal with some of the awkwardness / limitations of overlays.
3. Better savings than just a simple partitioning, like between SoC and
   boards.

I've used this tool to reduce sc7180-trogdor device tree files (which
are stored lz4 compressed) from 1.71 MB to 213 KB, a 87.5% savings.

NOTE: on Chromebooks like sc7180-trogdor, using overlays like this is
an optimization. On Android phones like Pixel 10, the bootloader logic
bakes in the need for overlays. Specifically, if we want to be able to
build a single image that supports multiple boards and have the bootloader
auto-construct the right devicetree, we need the boards to be represented
by overlays. This fdtfactor tool can make that a reality.

The fdtfactor tool can either work directly on a set of compiled devicetree
files or it can work on FIT (flattened image tree) file. The idea is that
you'd create the FIT file containing all of the duplicated devicetree
files and then fdtfactor would "optimize" them.

I'll freely admit that the patches in this series were pretty heavily vibe
coded. I'll not pretend that I have a deep understanding of the intracicies
of how overlays are implemented. That being said:
* I've spent quite a bit of time reviewing the code from a high-level
  perspective: confirming that functions are well documented, well structured,
  and make sense.
* I believe that what the tool is doing and how the tool is used make sense.
* I have had quite a number of internal "the AI reviews the AI" rounds to
  the point of diminishing returns.
At this point, I'm not embarassed to put my name behind this. While I won't
promise that there is zero cases of the AI doing something really stupid,
I'd be willing to bet that the end result is better (and cleaner / better
structured) than what I would have coded up if I had spend a few weeks doing
this on my own.

[1] https://lore.kernel.org/all/20251114-elite-refined-yak-bf9e64@kuoka/


Douglas Anderson (4):
  tests: Fix Python test environment setup in meson.build
  fdtfactor: Add tool to split DTBs into a base DTB and overlays
  fdtfactor: Support compressed DTB inputs and outputs
  fdtfactor: Add compiled FIT image factoring support

 Makefile                   |    2 +-
 README.md                  |   75 ++
 fdtfactor                  | 2109 ++++++++++++++++++++++++++++++++++++
 meson.build                |    1 +
 tests/Makefile.tests       |    5 +-
 tests/fdtfactor_board1.dts |   69 ++
 tests/fdtfactor_board2.dts |   73 ++
 tests/fdtfactor_board3.dts |   96 ++
 tests/fdtfactor_other1.dts |   69 ++
 tests/fdtfactor_other2.dts |   69 ++
 tests/fdtfactor_test.its   |  109 ++
 tests/meson.build          |    4 +-
 tests/run_tests.sh         |  156 ++-
 tests/testutils.sh         |    1 +
 14 files changed, 2833 insertions(+), 5 deletions(-)
 create mode 100755 fdtfactor
 create mode 100644 tests/fdtfactor_board1.dts
 create mode 100644 tests/fdtfactor_board2.dts
 create mode 100644 tests/fdtfactor_board3.dts
 create mode 100644 tests/fdtfactor_other1.dts
 create mode 100644 tests/fdtfactor_other2.dts
 create mode 100644 tests/fdtfactor_test.its

-- 
2.56.0.176.g3575e65682-goog

