Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7BB4AB1B7
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718906; cv=none; b=RmNByFRhs/2LI/8S3pTffck4bk3LMDlNU5Z6i/kygz1CSNiFzhkSCFKtvDEeqVpR2tR1CfH3qIP1njM01ehbkISNMB4vNR+nuvlqvUqds0w+fLHmEucUjwhJFKVdTxxC5rmtsz+9oVTi4HgIHdjA2Rz5i24dZSVpgYZVE7c2Qwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718906; c=relaxed/simple;
	bh=szW65OGngIrVZHSZp2aEQxc71UJrXouv/4OEN7SWrbc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QYTMrxi+7TVENZXsw13mDyguVGv9aXHXiElt5evZWzcfPDxWsk9E63IbeLWbMOeqOJYy2wHrolYErxdqBMALV9Lq2eyir3IH7vsxIjRRlpSIAcpB3MsG/LzVPYzhNsyfvylKZ3J2TvIf2Sa5ThfLtqOYZuC323BKrYCcY+zcT5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=a04/KION; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="a04/KION"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so64624366b.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789718901; x=1790323701; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zunp2CFFOV00BN1XGKfmZnDU8vHJVhqp2O/gTm8fQpA=;
        b=a04/KIONQos8BjkANIi94spNF+fH3cNdY6znpdkMoAfkKmE6CAPrl6kKJrWKjwSIur
         BPbtDHotW0a+znEgU3IBj+UtkcToQDKUutEOhdunldKYVOemKFONnP0aBqw6zDxmtVk5
         tM01VHi+tajgfEvGiNuFX9rMKYhh3YL6w2XzGXttRqBOwO3bH2esCE550DSyEvQX/Hqt
         MIcgiJkaO8c/JHJVLSy3fqD18i54sK7aVc2r1BKrdIRjiDY0sGjrR+OCYtwWGgScqX/T
         B5XQ+9HEm+m+2WJl3Xe/kLOEPZ8jGn8eE4bEKAWgbUZxpOV8p7Oc0/jblbEElhZM2F9c
         f5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718901; x=1790323701;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zunp2CFFOV00BN1XGKfmZnDU8vHJVhqp2O/gTm8fQpA=;
        b=hrIWTdcD0a4LHrxuXnq1WHOXKVDbWx/C098uevufOloaj2f9Vy1naZ8wdzjQmKI35C
         hQAIdVMYZZFSWfw5K/BfkgiN1jDaVyIMySG+IA73ImtWhx/XjLuIV9uQtqyYPN6Z8O9o
         kV0/zEItE3xsz6EYIfgsGvgVR/yBn/HvVMcMvbjXZa/M+FtpqrmaCr4GB3D6xCmOpAdE
         ZQ3I8rUjk3IySveRnEI8LL63h48fZIETxsvPJ6kwDczRqcxLh43YTgr+t23NmtlL9yEV
         SGFyWnsb2wgKEqlVlM/Mw+8QhjdzD2jGE8aidcXJ6GFWBLL2w4g3894x8YWvnZarI0C1
         qoag==
X-Forwarded-Encrypted: i=1; AKwUvBzDeE0Ygd5+y+j2hFZ3jEPiCSL2uTBSxtKGUJnoZ8Iv/7ddYjrOaahnpzq1PeK77ogxiibaBmFrAyNr@vger.kernel.org
X-Gm-Message-State: AFuF++lbBruhUln0O7o6rKWtQ+EpA+cWeS3xP0uu4mn/PcRYzMUDEAm4
	iwOIqZhXJfV6jGPMuUUDtWhGtgEo85aeTMHHBTAaLaPeneTBR+VNwQ9kD9zFB10zkNXg0C9vfOp
	w52Z6
X-Gm-Gg: AYBFou2mB5VDMxdiY/qFl90KUwkJQceNXvzWPk8cCLXpEPYFvFLzwPuCAdu/4XpRwjH
	z5rUmWAQp7xxfiXVsB1isg7nMYS1eDQqiYfbzkpJYw70MozL970C0rGF5xbDejdKOdxjtcgTu8J
	H6ivH919Uj0O06FWk6HKI+ZwfTt5ra/b0pgEiH7r8DK4UZVgZG8lQZ2vw+ukh7RkYdwAcnO801H
	0JbSuock+ncvu/NqkdXh9xDXGyw0RXCEAdPnYGznYRy1Q7ZROpF+51cjVCetzXQnNfody4twRKj
	w/UxNd5IleifCHndW0+BlmUEKZqPIQKsg42xM1wETW+Zb2ob8xY4IOEKXCb2ffRsYzWpgOUiz/1
	sw6mKyXX1DQxxGXI51ypWUvLpWGZPB8ZK29/yZK6KC6qN9xuSADbFb9y0Cf0pD4AMTav9rxJYGq
	YJHCfCgBi9KHTYep1+vbMOVzSxlPxAw4Ll3zY3Oce16s4frhnkMRhuEkec72a3cCq3E+Iu/UePs
	Ev+6R3MM9NIemnQhRqVnUWTMC5famkNM8LjpTR2QQlV
X-Received: by 2002:a17:906:9fcd:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c2a15b33c9dmr191756766b.24.1789718901566;
        Fri, 18 Sep 2026 01:08:21 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb06bcbsm31932566b.12.2026.09.18.01.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 10:08:20 +0200
Message-Id: <DLIAEGGE6ON6.TF50P7IWGBZO@fairphone.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <oe-linux-nfc@lists.linux.dev>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 0/3] nfc: st-nci: Fairphone 5 NFC bring-up (ST21NFCD)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kristian Brox" <isyourbrainfoss@proton.me>, "David Heidelberg"
 <david@ixit.cz>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>

Hi Kristian!

On Wed Sep 2, 2026 at 11:22 PM CEST, Kristian Brox wrote:
> This adds NFC on the Fairphone 5 (qcm6490). The board uses an ST21NFCD
> on I2C. That part speaks raw NCI; the current st-nci driver always
> wraps NDLC, so using st,st21nfcb-i2c leaves the adapter unusable.
>
> The series adds a st,st21nfcd compatible for the raw-NCI path and the
> Fairphone 5 DT node. Boards that already use st21nfcb / st21nfcc keep
> the NDLC path.
>
> Patches are against linux-nfc/for-next (Linux 7.3-rc1). Hardware test
> was on a Fairphone 5 running postmarketOS:
>
> - 7.1.2 sc7280, earlier raw-NCI modules: nfctool Powered: Yes;
>   initiator poll / neard: NTAG 215, NDEF URI read OK
> - 7.2.0-nfc-test+ (sc7280-mainline), this v4 st-nci as modules:
>   10x initiator poll finds Type 2 in 0.13-0.14 s, no
>   "unsupported ntf opcode 0xf02". Repeat poll with a Type 2 tag
>   in the field stays Powered: Yes. Empty-field poll SIGINT
>   (nfctool -p, no tag) also stays Powered: Yes.
>
> The ndlc: hexdumps are pr_debug. SIGINT during CORE_RESET (nfctool -0
> then Ctrl-C during -1) wedges stock nci core; that is not this series.
>
> ese-present and uicc-present follow the public schematic (NFC_SWP1/SWP2:
> SWP_SE to SIM1, SWP_UICC to SIM2). SE/HCE is not tested.
>
> CLK_REQ (GPIO 39) is omitted, as on Fairphone 6 NFC. VBAT and VDD_TX sit
> on VPH_PWR and are not modelled. VCC_UICC_IN (L4C) is not modelled;
> UICC SWP is untested.

Thanks for sending this revision!

Unfortunately I can still fairly easily reproduce to break scanning:

[  211.682211] nci: __nci_request: wait_for_completion_interruptible_timeou=
t failed 0
[  211.682246] nci: nci_start_poll: failed to set local general bytes
[  224.483009] nci: __nci_request: wait_for_completion_interruptible_timeou=
t failed 0
[  224.483033] nci: nci_start_poll: failed to set local general bytes

I enabled polling with neard, scanned the tag a bunch of time. Then
disable polling, and afterwards the errors above appeared and starting
polling again does not work anymore - until I reboot.

In fact, I can reproduce this just be enabling polling, disabling
polling and enabling polling again. No need to scan a tag inbetween.

Can you please share how you've been testing these patches?

Regards
Luca

>
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---
> Link to v3:
> https://lore.kernel.org/oe-linux-nfc/20260820-fp5-st21nfcd-v3-v3-0-5ee0a7=
f44d04@proton.me/
>
> Changes in v4:
> - Driver: consume ST proprietary RF NTF 0xf02 (Luca)
> - Driver: set raw_nci before nci_register_device (Sashiko / David)
> - Driver: enable vdd-io and SYS_CLK before driving reset
> - Driver: keep named i2c/acpi id initializers; do not add trailing
>   commas on existing of_match entries (David)
> - Driver: reset pulse uses gpiod_is_active_low so new DT can be
>   GPIO_ACTIVE_LOW without breaking old nfcb DTS (Krzysztof)
> - Binding: ST21NFCD is not I2C-only (data brief lists SPI); do not
>   put st,st21nfcd in the I2C-only spi-max-frequency:false enum
> - Binding: SPI $ref only in the non-I2C else (not a global allOf item)
> - Binding: clocks/vdd-io-supply on the existing I2C example; drop the
>   extra example (Krzysztof)
> - DTS: reset-gpios GPIO_ACTIVE_LOW (Krzysztof). Physical GPIO 38 HIGH
>   is the run level. Konrad R-b not carried (polarity changed).
>
> Changes in v3:
> - Binding: new compatible is a different ST part (not a driver-sharing no=
te)
> - Binding: drop NDLC/raw-NCI description on compatible
> - Binding example uses interrupts-extended
> - DTS: one nfc_default pinctrl group, pins sorted, no output-high
> - Fresh series (not a reply to v1/v2)
>
> Changes in v2:
> - Compatible is st,st21nfcd (no -i2c suffix)
> - Sent without PGP/MIME
> - DTS: interrupts-extended and pinctrl for IRQ/reset
> - DTS: ese-present / uicc-present (schematic)
> - DTS: SYS_CLK from LN_BB_CLK2, VPS_IO from L18B
> - Binding: optional clocks and vdd-io-supply
> - Driver: optional clk / vdd-io enable
>
> ---
> Kristian Brox (3):
>       dt-bindings: net: nfc: add st,st21nfcd
>       nfc: st-nci: add raw NCI path for ST21NFCD
>       arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD NFC
>
>  .../devicetree/bindings/net/nfc/st,st-nci.yaml     | 49 +++++++++----
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 34 ++++++++-
>  drivers/nfc/st-nci/core.c                          | 22 ++++++
>  drivers/nfc/st-nci/i2c.c                           | 82 ++++++++++++++++=
++++--
>  drivers/nfc/st-nci/ndlc.c                          | 27 +++++--
>  drivers/nfc/st-nci/ndlc.h                          |  5 +-
>  drivers/nfc/st-nci/se.c                            |  3 +
>  drivers/nfc/st-nci/spi.c                           |  2 +-
>  drivers/nfc/st-nci/st-nci.h                        |  2 +
>  9 files changed, 197 insertions(+), 29 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260902-fp5-st21nfcd-v4-1685be1d7c52
>
> Best regards,
> -- =20
> Kristian Brox <isyourbrainfoss@proton.me>


