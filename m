Received: from sonic314-21.consmr.mail.gq1.yahoo.com (sonic314-21.consmr.mail.gq1.yahoo.com [98.137.69.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD4513D503
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.69.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776493989; cv=none; b=tRW7OBWUMe4Y+PlDbky4e8DljNEGfDisKUEDuqCpjdq454ZtzdssethkTTCL02NuzPM7tRncBS+WWOzJTFMVre+KMYkJMkAUkzk9mGqiEd0vqxv0ZZDQI/VyiriAoNJs7UepmnyvPsiduerOboTZMpYyLs4fSYqBynVX/4v81p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776493989; c=relaxed/simple;
	bh=syYlsVI+Cyv8Iu32MCXECG2skpMfIlco1Q2E9koQb+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=pW9zgwdBVaHFG6COCs3YSfRuM1t5f3rPtZDxYifdWjrcuVkQV70WsVsiZ625X4cnrHUWdj8YWXgI9V7MJZeTuwrFiKhkaTsAJyyfD0/e2f7tNja1AqHOuSGMfU+QceN+ih/966yV2tSa1Kt0MuyKp0Or6Air3yfno+Ai5PMLTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=aB4E7i7p; arc=none smtp.client-ip=98.137.69.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="aB4E7i7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1776493987; bh=mBG7j24/UA6K7DkNwL26nXFDgEt/I9aECPcm83oyrFg=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=aB4E7i7prjU6q1ycGQSNxj3bLMJ/cEWH583iZFlRffCI/ACf6iJNKMqKqumJK+MQ7YArLmgAEUfKyDPM++DyAHAJvSAfMVXkk7DL+mbFNkXQ11p2On/tY7rw1NYZ2+rI5S+D6o3oaM0YMc64nyS2lW+1pju/Zmq0m3nOZ7tp0M3IfRFkkHmrEbNYM5elJnaz5higqxm7A0FYpvgHDFF4VvSsmDhaOB3cny+60o0a2KDm5Yzd6Ga7g44TqOBXxmKve5Ez80XYcvaaYa4k20Jnlrm+cM3CW3iFPnOavz18mOEXp2ROdLxO83X/VxiivGz3n4muKNjxQuwKMdG9KJwngQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1776493987; bh=9VSCLJEN1usyHRYHXyLBmBUbsMu1tJYfN8dmwJVztM1=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=iqSxYa0qn3A0gGuvuw9nYVGVA86zWfU1850+MU0O6B2PfT0UBoatbcD8pwXdBH8ZMm+7qmYJyyIjtwKebKsRwKXNHNctaVv4Vefa+xe2hFevyTcauHlGiSjYwvKYiSiUeWpuCS+yyFqOEgIhfzPthmo54PWGNUMp51OLgM+D+DAmArzwdOsLgUf0Bxd2kErVoXM14oLD86TRr2mfuuyQRfj21XaXkY3spNOJMTKhvLodq/fdqlPCkDVkO5s/3otm9v6vjOi8B3LTS1sAvOdlbOKGBCHCMKI80snu2L/4Wo9pDspjR2EXH6W8rOaH0f4J0xfyl0RCula1h3p4EWSA+Q==
X-YMail-OSG: j2eH2QEVM1n.585Kf._9NQGHgBXsRpS8gJUO3XlLmV_tyGhUiMxnDfY1AEUI4HD
 BKPPdQE8Xjx0nr98NnCkUQCX_UGZk9BoRAnUfXfeXUdAJtGlCvW.GXAg9uJjM.YVCZpQaZaayUJr
 YwPzUqBEUUVfzxFVeBO_zBQIQYgqxk5HqnO0mmCkx6uGn4PZCXiVmkdw60RX9KM9IXMsTnr7os8M
 QOzAfQhex5d3zPrw.LaOm3mw.Ah0PhXafEGxtke4a4yuqbS2TVTITfwKjtNZUhEOxdS9JTzMDNi.
 6q26VXGgCXAMZPperEHWxRw3mNSe_2.8CvyLM4Rb_9os4wmpzS.p1hq12UyUT5xHM8b065d4GFh8
 uEtVqNi318IJeMjcM9RFsPB33W285MQx3F44caQvABmkgrW4EmUGfrxnB1e9Y3t26XEpA4bibWf_
 J7LE9EOavR4V8T0qz5oNFsyumB0webJaXhNhJD9IUwv2_iUs73KzXYqC3aOk24BvRnjiZBXcnei4
 .9gTw7lt99RRt_GwEcD.RBOnu03T38g54YMEeIFKYlegYCIptYmyqEJZyJIRm7.g61Juxv0qfE78
 .j7Sa7BTlVrqh5sEFRSrKhs4lvTd3NCuC2qVzq17HfcuQI4eE7d9dNPUaTLirdqRMvLwo8zazPuV
 832Fbz22npeE9AprnZEheiLlS6f4QTMXKzocMjag_P9_7dkwDP0XmF_yE2EMezLC.Um9nTER6X_A
 rNMcu3PBgVocWKCeUGkqJ_KPS9kCAueQamHchu1nQvRZI3ybWZMMpwzo2ioCxh7YOWY8SRcFpNoj
 U3MNMF1GzPTyoQIUgKtfMF0cOJrj_r.XzDEfGpwmYz4dCRACOFNcUA9NqiBlIRzMMlThH4wTWi2U
 FXo1V_3cngqFjmJxP9JGkDVnObCrMW3K5XcWR.jH0_0rkn_Flq3WhuWYmuQ7t90t_uH7ZCkw35_t
 keoUGXZNSB3tFYneBPUhLTw2mGEMet4iscZdsqDVBICVCW1PqUbAzDl_pD8UCYH01xvaI2l1NjeF
 9Oz1Nc_RHaI5391c5tGiqQ9JQ3AjqRMeYEqQTOVUlwBffAenc29C1Wd4oaZjkUqDN.3YNVJNCtFG
 fQPHyvlrQRr2.yWlTGyy9cTPD2jjU211vrHNgxbSAtzsWX8U5Ul82.gZxtV6iYRWvGGoql7IuwHe
 EsbGw_76Mvze_f5FYPB9TxzC7ckr6rnUPSW0Opr2z5SK1eua3gGfLxHDe0NITi6Tfs5fbTxdxhPg
 .PdxwRU.whBcN8nTaGdZ_M_FPyFyg5QmuNeokfkbxwVnUo09kzW.t5exHWNHTwC7nwgzBZKehmJR
 ZKsQUeC0OsuTHqKUbs47HnceAyqPoUJChg1zehfYPIYVgFkJZ0RbnNlhnpHFqqrO4Y.ictfh.TkH
 AJ22lKPzu7yijgb13.aXRJDyWBlSl064qGejecNb6H74ux3xpMTTVtHMJCQIwxfDz.lFS617qAtG
 EQafEuu9JVxK79GTxwa8bBJHfKIoBQBuLfmsVnU_Flwse.l.VVtfxzvGEwxYK7U5Jny8Jq4TShjO
 3ZXzQUQaQMjoQNqK_8ga6gZnVVobrwle3X.SFPYaL6TR3hZG1lZv4BbPkx9TIdMaZz9BHUEi6b2B
 Pi.uPO8yozosBJVwO8Xb0P0BHokxVxx.PY3tLqC8EQ4fuRa2zRpT2pY7FDESmfs0dKUKrRh9zdJs
 hpsrWi9txXRq9PwE_XBxLStQVRIepepu6KB70QsTKYhSeOd_vXYYxsmGdnEhN14fA3nhSNtom.l4
 xpHA8fTvNldFVB2ekFLfkwkuTS1I3bfxjazWgitB4ZmN35YYE0jgzCBAfWWBtnnnVRREnewIfbkL
 7_4knvNMszofbWHwE2tNkg._4axq2CKLiywYHt8KoWxnSGMyQks5FNtIciTwQgygElYxsCU4Nn1s
 p42l1zOIvci3bf50j3B8t8Ucffq_.ilDWwuoynimyulcIuLX.IH37L_PCOTyJKZXz8RRqSAohVTK
 g8P8NCyH2WN7r0mtyLiWAN96v_QZJc6Av47012ZKFnTogZwk4bryNRuD7gZGUX9uW9KNvKNweoMz
 tVxmNZD_NpnPxH3Blvmy6I0KO55uHIm6PyJ5yU1KjfdN9PT7yIK8J0Hvv3eH304LZwu0wf.3GukW
 wJVTullGENvvgtYhpb20a35NDjxc1YKmx4L4abrfWnuzD.ev_Sx2ApJfQekFPJ21iS6o_HGbigKK
 IrlhfssOQSeF_GnloshKmV3By7Gp_GoCDMGkF4033e9CwwGpa6ujAUROTdQ5r09GPCVtVKLkMTVm
 UkDZ1TrFh
X-Sonic-MF: <sainiharpreet29@yahoo.com>
X-Sonic-ID: d89da938-ab56-4417-a5e6-f0b226bcd0e7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.gq1.yahoo.com with HTTP; Sat, 18 Apr 2026 06:33:07 +0000
Received: by hermes--production-bf1-697f88457-nwz5r (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9b8d7fe4763979ee0d1c15afeb8a3b24;
          Sat, 18 Apr 2026 06:22:48 +0000 (UTC)
From: Harpreet Saini <sainiharpreet29@yahoo.com>
To: Rob Herring <robh@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 0/2] Add PixArt PAJ7620 gesture sensor support
Date: Sat, 18 Apr 2026 02:22:31 -0400
Message-ID: <20260418062241.104697-1-sainiharpreet29@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260418062241.104697-1-sainiharpreet29.ref@yahoo.com>

This series adds support for the PixArt PAJ7620 gesture sensor.
The first patch provides the DT bindings, and the second patch
implements the input driver.

Changes in v3:
- Moved sensor power-up and paj7620_init() to input open/close 
  callbacks
- Implemented dynamic keymap support via 'linux,keycodes' DT property
  and enabled userspace adjustment via EVIOCSKEYCODE.
- Updated YAML bindings to include mandatory vdd, vbus, and vled
  supplies.
- Added gpio-controller properties to YAML for hardware completeness.
- Verified with dt_binding_check and checkpatch.pl --strict.

Harpreet Saini (2):
  dt-bindings: input: Add PixArt PAJ7620 gesture sensor
  input: misc: Add PixArt PAJ7620 gesture sensor driver

 .../bindings/input/pixart,paj7620.yaml        |  79 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/input/misc/Kconfig                    |  12 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/paj7620.c                  | 338 ++++++++++++++++++
 5 files changed, 432 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/
 pixart,paj7620.yaml
 create mode 100644 drivers/input/misc/paj7620.c

-- 
2.43.0

