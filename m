Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220790;
	b=iUpFE8tEaWA7tqWJkM6b67FBZkMX9HmRMyN6+9iwnaPq3tyA6XRa4VwoyVj5laJvLcjg
	 8QUnC5Meh9hWSmLLSSeiOr/Fh0tfARPrLoZUFEy757TV1i3d+dCc5XEWuezqP9t3Bums6
	 a1uaTE3CmJhk9anF+x4Oa5sCC/3o22Gl3tltIAR3UZ8tcov+M+t2uBJOtOSWHm11ayotQ
	 Z5yvgcD2JyTIFYueZhHOqXu3iZfImYKIGzPTkSkkTh1Y7n5Fsu5l4zIvaWcT66YkY7gZO
	 jqmGRCvz04qt4CC69O8G+Y2tkaLTnpbyQYzmet9yZW0LrC541KkfaieffGCeLkJzZzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L7KIklNenV0Aq+X7+Tzt9NxQNoozOQ98M0kMCyjyNk4=;
	b=DJSSzd2CFhEbzKWqVq+OicLV0IGEC99IfJ7gN+3JAT5WEbsq+UDoKdyD/dtPtSGG6zbH
	 dK9fiKOnE2Sij+afNs7oD8p90MfsxLEy7CtNNjkl1MebGCsh5idKZ2tySOszUMkdJsahO
	 WW20U0P6mV9x0kr462yAYwqLllWK0aVe7v7bzzagxG1Gh1UENNh0uc0ChVBkY2qRU4eI3
	 8RBc2m/RB4Fhb2ivPC4ivVph48jdVSO/xvDH+zcBIejn7t6uVX2rZP1q/tnsaoZHPQB+i
	 ML+0zh2P68mrnblAVrWdhrYFDggwk4wLNxbjHcqDeJC21+fHFF2hZMnsYXV3FfyRR0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0OEpSmdE;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B76D606A6AC
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B76D606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0OEpSmdE
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b40470fdd8so736727a91.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220783; x=1795825583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7KIklNenV0Aq+X7+Tzt9NxQNoozOQ98M0kMCyjyNk4=;
        b=0OEpSmdEGdTGyraprI0hH612QKpsQB8N0Dw9xk/HhXX85oD4XHimHAHHhqjvbCLjBP
         nUk9SSFewx8mB6FJbFA3hxkfSkRfbO+jw5g2svnzDKs/f+/hIsuR6UeVqeyNkKToLrgV
         ga0ExwRtcb7/kjjs9quKlRhG9ucloWSf2olJN2rRVApYhb/6fXTzsmb4d0s8dRHr+Q0v
         v7sy3s4owN1pbHI22dSz4c22Bz7u3OO+nUVw9qsFu60hL/YPP2EGyB93TtFvgVA0kvEf
         g2Lsu+AmVBIiHqij1eksFKgefxAH7aCTICFfcEqP+7+UWz5aVbg45WoEMyfkWgoBz2T+
         oVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220783; x=1795825583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7KIklNenV0Aq+X7+Tzt9NxQNoozOQ98M0kMCyjyNk4=;
        b=auTPnDfrzwM9UhrTs86e0NUyEx4hfWQnCEDUiAEXLXSLNznu5paPAI2j18XfpLsvtA
         zT8KTmbXh2/345MLa0FMyC4xzhFOpbXhF+4wGtxCCxmoHDt+7tVZJk06NOk2Sghdivp4
         i4ib9kAnGcHetPsHNY/gMDUXIZpj7jd75JkqPHjbUbfOW/9D3N5AbdmqfLP0GvjM4e04
         gN/QyDgZbvQnUTy1s3Em3XBG3GFRf+y+MGO63Zp8tplT22JfhTPxLkY/3BAiU4FE9t4b
         ntob0RjTWtOHcEVScdkU7l1AxSn7AJTGNsQ/x/1TRJ5LkJZxQvIxGqexCnatgzHAj6Gw
         jGQA==
X-Forwarded-Encrypted: i=1; AL+hErE0t3YHHTIXFkjm6lRDhJL9a/I4k9704qR76Kt2CVCI1qVUqMQFp4wAqYZp83qcP3AQcV/IX6xq0HYD@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z7XSMsvVDmFcg6m197EWzHFcrh4Uup3qy7bEN2MCWTFJyLGYH
	GmYU+EabHSUozWsdRfxaDjZwuX6QAlhPX46VwWJ3HD/I6TylmPR3Mv0k
X-Gm-Gg: AZFdTZeVVuprI62kK4miIXA4O91VzYDuXINUusjO8olw+Y4JquVkL3PT8G1oMu1n7UE
	sCD32pzgX7SYxqi6WO6aoZcJlPYtE/pfol9IStkVxA++gQjlOPON609UwSo0jRIpDARXkJjliWK
	rowOmfDuxLk4mMTdagmp/Rf9eeD5fAClg4SdRRmpiGVQ1VFMaNOb188J3zZ67rQtvKWo5vkMAUU
	aaII25Y2K6v0I4XEdJLFHDQ3NNmioIJWfVEib14Wf6jp7lc3HcHqVQdQk6+hUMl0qbgmD0tppHq
	F2OrBuccKJi6KcgynXE7G8dl3lY+YalhtEcIzYtaznyvBeRDgCdE0KrzADBeL7SegULbe2SRWx2
	Ogp2xBW9LHDoHP5wUQVYUONEDTx9Y0jY9wN3sx1iEzo4JgJWEFegTOrVXMTbJYseAURLiRwQcBS
	uq185qLsFdhaZjyypxa7rkTj4jhgcM2qLP26MsqVsl3j63OYYWTPmM49BGgZ95zVynlZUcslb2B
	P8yy5obBYRU6be+xQ78h5qkfo5ZaaMCFqLmwtGcwVra+EsgTDPqu+yE4LgFNjhXJOLkVZprPXEu
	gs1O+MzY76SMb/LLaQhc0EXl81b858bNrl8YducsV7gTv+52+ZYf/E3K4eUhVieF8D7wjHUXva2
	aMS6BBKsachPYKJE4sTf7IDO9vGu4zXCmJvHntTFVghtgrFdfmb/Hi0C5fyWtk7SlK2IA2fhgZ+
	O2jLHTPspl5WAwrIo942XM6kk=
X-Received: by 2002:a17:90b:4c4e:b0:3b4:d22:85fa with SMTP id 98e67ed59e1d1-3b41c98a150mr4244660a91.14.1795220782623;
        Fri, 20 Nov 2026 16:26:22 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 00/22] ARM: dts: BCM5301X: describe switches and use gmac2 as the CPU port
Date: Fri, 20 Nov 2026 16:25:40 -0800
Message-ID: <20261121002603.25254-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series describes the switch on fourteen more BCM5301X boards, makes
switch port 8 / gmac2 the CPU port on the single-CPU-port boards whose
MAC address can be assigned to gmac2, and disables the GMACs that a
board does not use.

Patches 1-8 describe the switch ports on the RT-AC56U, RT-AC68U, RT-N18U,
R7000, EA6300 and Phicomm K3. They also set the WAN MAC address from
nvram, so userspace doesn't have to. The EA6300 and K3 get an nvram node
for that. The port mappings come from OpenWrt.

Patches 9-19 do the same for the R6300 v2, EA6500 v2, R8500, WZR-900DHP,
WZR-1750DHP, WXR-1900DHP, Archer C5 v2 and Archer C9 v1. The R6300 v2,
EA6500 v2 and R8500 get an nvram node and use port 8 (gmac2) with the
MAC address from et0macaddr (et2macaddr on the R8500). The Buffalo and
TP-Link boards have no MAC address described, so they use port 5
(gmac0), which gets et0macaddr through the SPROM fallback.

Patch 20 is a fix: on the DIR-885L the nvram MAC address has been on
gmac0 since port 8 became its only CPU port. It moves it to gmac2.

Patch 21 moves the CPU port from port 5 (gmac0), or port 7 (gmac1) on
the RT-AC87U, to port 8 (gmac2) on the remaining single-CPU-port boards.
Port 8 is the switch's IMP port, and gmac2 is present on all Northstar
SoCs. The nvram MAC address moves to gmac2 as well, and the R6250 gets
an nvram node for it. Boards whose MAC address only comes from the SPROM
fallback (et0macaddr for gmac0) stay on port 5, since gmac2 would read
et2macaddr instead.

Patch 22 disables all GMACs in bcm-ns.dtsi and enables only the ones each
board uses. Boards with a switch node enable the GMACs behind their CPU
ports. Boards without one keep gmac0-gmac2, because nothing configures
their switch and which GMAC carries traffic depends on the bootloader.
Boards with several CPU ports (RT-AC3100, RT-AC3200, RT-AC5300,
RT-AC88U, WXR-1750DHP) keep them all.

Compile-tested only. Every patch builds, and dtbs_check output for all
BCM5301X boards is unchanged by the series.

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to review
the series, write patches 9-21 and parts of 22, check the board
descriptions against OpenWrt, and draft the commit messages and this
cover letter.

Changes in v3:
- R6250: set status in the existing &gmac2 node instead of adding a
  second one.
- DWL-8610AP: enable gmac2 too, like the other boards without a switch
  node.
- Link to v2: https://lore.kernel.org/linux-devicetree/20261119085452.75708-1-rosenp@gmail.com/

Changes in v2:
- Squash the per-board port 8/gmac2 conversions (AC87U, SR400AC, Luxul,
  R6250, Meraki MR26/MR32) into one patch (Florian). The DIR-885L patch
  stays separate since it carries a Fixes: tag.
- R6250: add an nvram node and take the gmac2 MAC address from
  et0macaddr, so it doesn't get a random one.
- Keep Buffalo WZR-600DHP2/WZR-1166DHP/WZR-1166DHP2 and BCM953012ER on
  port 5/gmac0: they have no MAC address in DT and would get a random
  one from the empty et2macaddr SPROM fallback.
- Boards without a switch node keep gmac0, gmac1 and gmac2 enabled
  instead of only gmac2, since their switch is left as the bootloader
  configured it.
- Describe the switch on the R6300 v2, EA6500 v2, R8500, WZR-900DHP,
  WZR-1750DHP, WXR-1900DHP, Archer C5 v2 and Archer C9 v1 (new patches
  9-19), taking the port mappings and MAC address sources from OpenWrt.
- Link to v1: https://lore.kernel.org/linux-devicetree/20261118054758.132233-1-rosenp@gmail.com/

Rosen Penev (22):
  ARM: dts: BCM5301X: AC56U: specify switch
  ARM: dts: BCM5301X: AC68U: specify switch
  ARM: dts: BCM5301X: N18U: specify switch
  ARM: dts: BCM5301X: R7000: specify switch
  ARM: dts: BCM5301X: EA6300: set gmac2 MAC address from nvram
  ARM: dts: BCM5301X: EA6300: specify switch
  ARM: dts: BCM5301X: phicomm-k3: add nvram node
  ARM: dts: BCM5301X: phicomm-k3: specify switch
  ARM: dts: BCM5301X: R6300 v2: add nvram node
  ARM: dts: BCM5301X: R6300 v2: specify switch
  ARM: dts: BCM5301X: EA6500 v2: add nvram node
  ARM: dts: BCM5301X: EA6500 v2: specify switch
  ARM: dts: BCM5301X: R8500: add nvram node
  ARM: dts: BCM5301X: R8500: specify switch
  ARM: dts: BCM5301X: WZR-900DHP: specify switch
  ARM: dts: BCM5301X: WZR-1750DHP: specify switch
  ARM: dts: BCM5301X: WXR-1900DHP: specify switch
  ARM: dts: BCM5301X: Archer C5 v2: specify switch
  ARM: dts: BCM5301X: Archer C9 v1: specify switch
  ARM: dts: BCM5301X: DIR-885L: use gmac2
  ARM: dts: BCM5301X: use gmac2 as the CPU port
  ARM: dts: BCM5301X: enable GMACs in boards that use them

 arch/arm/boot/dts/broadcom/bcm-ns.dtsi        |  8 +++
 .../dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 39 ++++++++++++++
 .../dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 39 ++++++++++++++
 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 +++++
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   |  4 ++
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 42 +++++++++++++++
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 48 +++++++++++++++++
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 53 +++++++++++++++++++
 .../dts/broadcom/bcm4708-luxul-xap-1510.dts   |  8 +--
 .../dts/broadcom/bcm4708-luxul-xwc-1000.dts   |  8 +--
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 20 ++++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 53 +++++++++++++++++++
 .../dts/broadcom/bcm4708-smartrg-sr400ac.dts  | 10 ++--
 .../dts/broadcom/bcm47081-asus-rt-n18u.dts    | 39 ++++++++++++++
 .../broadcom/bcm47081-buffalo-wzr-600dhp2.dts |  4 ++
 .../broadcom/bcm47081-buffalo-wzr-900dhp.dts  | 42 +++++++++++++++
 .../dts/broadcom/bcm47081-luxul-xap-1410.dts  |  8 +--
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  |  8 +--
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 42 +++++++++++++++
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   |  6 +++
 .../dts/broadcom/bcm4709-asus-rt-ac87u.dts    |  8 ++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 42 +++++++++++++++
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   |  2 +
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 39 ++++++++++++++
 .../dts/broadcom/bcm4709-netgear-r8000.dts    |  4 ++
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 42 +++++++++++++++
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dts  |  6 +++
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  |  6 +++
 .../dts/broadcom/bcm47094-asus-rt-ac88u.dts   |  8 +--
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  |  4 +-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  |  2 +
 .../broadcom/bcm47094-linksys-panamera.dts    |  4 ++
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  |  8 +--
 .../dts/broadcom/bcm47094-luxul-xap-1610.dts  |  8 +--
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  |  8 +--
 .../dts/broadcom/bcm47094-luxul-xwc-2000.dts  |  8 +--
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  |  8 +--
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   |  8 +--
 .../dts/broadcom/bcm47094-netgear-r8500.dts   | 53 +++++++++++++++++++
 .../boot/dts/broadcom/bcm47094-phicomm-k3.dts | 53 +++++++++++++++++++
 .../dts/broadcom/bcm53015-meraki-mr26.dts     | 21 ++------
 .../broadcom/bcm53016-dlink-dwl-8610ap.dts    |  8 +++
 .../dts/broadcom/bcm53016-meraki-mr32.dts     | 23 ++------
 arch/arm/boot/dts/broadcom/bcm94708.dts       | 12 +++++
 arch/arm/boot/dts/broadcom/bcm94709.dts       | 12 +++++
 arch/arm/boot/dts/broadcom/bcm953012er.dts    |  4 ++
 arch/arm/boot/dts/broadcom/bcm953012hr.dts    | 12 +++++
 arch/arm/boot/dts/broadcom/bcm953012k.dts     | 12 +++++
 48 files changed, 834 insertions(+), 84 deletions(-)


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.56.1

