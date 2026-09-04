Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90DA39EF1C
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 21:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557615; cv=none; b=Iqs7rGX4HPVNafuw/pPziMSbhh9WY1ZvZnrndFi4+ID9Kq6Ru9I3nzDPA3uu0V6SN1wB+4IRYq6WQb+Vg0vM9Sd5QDMa45kiR43LaWMZvIzgd/1Oyq1u4Cj9Y4+/tjGfqYoq8NOLyRAZ+FJKLf5nqYzeLGe6NV/4kU3Iim+4XRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557615; c=relaxed/simple;
	bh=anGfUtiHyTDnvv5CR6dVKodyZYcTvafQEd9tT4rOXZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nR79kxaQw649UDZsGJWAtjY7GG3s+gVZxPUH2MaBjo4+joBlmd2tqwf3wgY+OnuGHwDd0I+XE6YNNuFfZkzW1QapqZVcqn4gxIvq8uZumLF0bZ3Qg7xmWq3eHCkt9xzbVbYPjL2mX2fczx9awzWG7Wawhi4Al7K2wkLC6KAbxkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbFQnX/z; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbFQnX/z"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5300bdf61d9so17742371cf.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 14:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557612; x=1789162412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5/Xia7rxdpyQybCgSGxs4a0QCDbKXZF9niLTTnJnSM=;
        b=rbFQnX/zrudSA0i46pCEV9JRmDIPcVxWUpyKYuF6molEHQC6lfAYBgFxi5kIFsycSM
         YONexQgkVuUVoULXi82d5IkG8N9obMUn3m5Mk6koaPa422u/RFAYSMviqkEgj0cbCogi
         1g6PlBh9Zx6eBrRRiejzf/+pWEga6JEn5kMZaA0t8f8b9G7iphiYSDfCe/UamimfvocT
         g5PtgVTgGRoFEx2pUfZBOvw8WdJlQpiH3vvxBsx+4DTiY/5cm7gtv6IOpE9F8O4633GG
         vSN0Wi18LdVAvWycMFUClrotKwVG5p2qpHHBUq8HvQ3xtBvM8GhZNbSswH4+XL4YQZ9s
         6LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557612; x=1789162412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5/Xia7rxdpyQybCgSGxs4a0QCDbKXZF9niLTTnJnSM=;
        b=ov9ZUfOnSMup4x9isUzXwyuwRxHyJR8mhBAEw9fxYwsDKo7v/pxibvnxziMCvJ/WMS
         dyqF/11euWZ8rVQeHfmoJWbvJEySZey2T1PXm0HyxVJAQqQE2IPoQJG3m3lyf6D3ttHg
         TYsa8E2yJqu5E4wotf5WZaDTSvum3xdvRNJG4KYcfOy/oMuRzV4XTN3xr/MMx4muxPg2
         nzTHLt7HolE+szoUNcSuctIPe71/AIWlkHRm67brzPgKXY87R9j86VYpSPQCcD+6IiQo
         xb1+hqBhY7gJhdLfK1dEzeyr7QjHzk7I1ffse92MpklX51488K20ixgrvk8DKNGtgr+8
         /fHw==
X-Forwarded-Encrypted: i=1; AKwUvBwJCvtRO38WbCE7PCtbK9nsKKs0uWSDrC9UU91dS+TyIL3AjO/HWEh8NH9w6x+f+g1w/XVx9dQ3rAaW@vger.kernel.org
X-Gm-Message-State: AFuF++nWR8MLC5C6prLJUQOgkUCkLQxGIBwCPiFKnr/mzjprkoziZaCj
	1JiSn5QBMXh0uAOftISuP+lR6KttdZGxBNVgjLRrnXgx7jWwmF403tc=
X-Gm-Gg: AYBFou2/geCAxY38mFscsPrxja8Mhs/yFERcAezGT+dX6AyBakTO3Sf24DNfNtHBqwr
	KnHbPEkvaboOgNMj5Fuq7RJVHEkrc9JBFbZfPFj+jo5K6BXxoVnE9eWyLlHvthHOjCj4+e5ZFI5
	eEonVaapjq3jIW+vDi/tS3HMx269fkPqQbormEwgxDYCRhg2x2Z6nmgcs5UPkRDSo0JhES24o7C
	DO81mszs7AVCS9ovI1CTChTv4JxwAQGbxjyK3QC9691DQ7NLa94CtDqnWmhTB7pbHaEoBTV4LF4
	ZPCMIjpQSg1SS/6dvuT4YYbu0yXITI7PKXPtpOpZI2Y8UFO12PpR2+J6vHBx9cviDEMaHBbP1/5
	peKn/NNKeYKMFkic+24LofCf6urrTaOJ+Aw09GGWMqqEsbvjfeFKkEfX8Zuqxgl1aKoIZLdWDmi
	t6f99TUj+z54jTD2pRrwQa1KtA7colNCdpnj4qf4bMLdMzjoghhPxwQHTCF8j9JDcLP0uTDegcN
	4mGPF+zU5ZCY2s=
X-Received: by 2002:a05:622a:1493:b0:52e:12e6:6d7b with SMTP id d75a77b69052e-530549f8c81mr96143391cf.39.1788557612371;
        Fri, 04 Sep 2026 14:33:32 -0700 (PDT)
Received: from X570.phub.net.cable.rogers.com ([2607:fea8:744f:d200:9441:f2ae:56aa:8a81])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054227a0esm29646561cf.29.2026.09.04.14.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:33:31 -0700 (PDT)
From: Barzin Lotfabadi <barzin221@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ryan Walklin <ryan@testtoast.com>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: allwinner: h616: add HDMI device tree nodes
Date: Fri,  4 Sep 2026 17:33:27 -0400
Message-ID: <20260904213329.3910099-1-barzin221@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

These two patches add the device tree nodes needed for HDMI output on the
Allwinner H616 family.  Tested on an Orange Pi Zero 3 (H618, 4GB), which
drives a 1920x1080@60Hz desktop with these applied.

Mainline already has DE33 mixer support in the sun4i driver, but there are
no display nodes at all in sun50i-h616.dtsi, so nothing probes.  Ryan
Walklin's "arm64: dts: allwinner: h616: add LCD timing controller and
display engine support" series adds the display engine, bus, mixer and TCON
nodes, but states that HDMI output is not provided.  These patches are the
missing HDMI half.

Every register address, clock index and reset line was read out of the
vendor device tree shipped with the board and translated to the mainline
dt-bindings macros; the clock and reset numbering was verified identical
between the vendor and mainline CCU headers before substitution.

Two things I would appreciate guidance on:

1. Patch 1 currently also adds the display engine, bus, mixer and TCON
   nodes, because Ryan's series has not landed and the HDMI nodes need
   something to attach to.  If his series is merged first, I am happy to
   respin this as an HDMI-only delta on top of it.  That is probably the
   right shape; I did not want to post a series that applies to nothing in
   the meantime.

2. These nodes alone are not sufficient for a picture.  Two driver changes
   are also needed: an H616 variant in sun8i_hdmi_phy.c (only
   a83t/h3/r40/a64/h6 exist today), and setting the TCON pad select bit in
   sun4i_tcon.c.  Both exist in the Armbian sunxi-6.12 tree, authored by
   The-going.  I have deliberately not included them here, because I cannot
   provide a Signed-off-by on another developer's work.  If someone in a
   position to carry those forward would like to, I am happy to help test.
   Without them these nodes probe but produce no output.

checkpatch is clean apart from one 103-column warning on a remote-endpoint
line in patch 1; the identical construct at the same width already exists in
sun50i-h6.dtsi:183, so I left it matching the surrounding convention.

One implementation note worth recording, since it cost a boot cycle: the
DE33 mixer's three register regions must be named "layers", "top" and
"display".  The driver fetches the latter two by name, so a wrong name here
surfaces as "invalid resource (null)" and a -EINVAL bind failure several
layers away from the cause.

Result on the board, with the two driver patches also applied:

  sun4i-drm display-engine: bound 1100000.mixer (ops sun8i_mixer_ops)
  sun4i-drm display-engine: bound 6510000.tcon-top (ops sun8i_tcon_top_ops)
  sun4i-drm display-engine: bound 6515000.lcd-controller (ops sun4i_tcon_ops)
  sun8i-dw-hdmi 6000000.hdmi: Detected HDMI TX controller v2.12a with HDCP
  sun4i-drm display-engine: bound 6000000.hdmi (ops sun8i_dw_hdmi_ops)
  [drm] Initialized sun4i-drm 1.0.0 for display-engine on minor 0

with the connector reading "connected", EDID read correctly from the sink,
and 1920x1080 among the reported modes.

Full boot logs, the decompiled vendor device tree the nodes were derived
from, and a photo of the running desktop are at:

  https://github.com/BarzinL/h616-hdmi-mainline

Based on mainline a500db7819c5.

Barzin Lotfabadi (2):
  arm64: dts: allwinner: h616: add display engine and HDMI nodes
  arm64: dts: allwinner: orangepi-zero3: enable HDMI output

 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 191 +++++++++++++++++++++
 .../dts/allwinner/sun50i-h618-orangepi-zero3.dts   |  25 +++
 2 files changed, 216 insertions(+)

-- 
2.51.0

