Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F3049AA23
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637580; cv=none; b=pqa3L0kE+rXd71uZbZ1B5GB7PPtojBRto4yWUCwhGKiTK2rxXXCXRkInGK+SdEASsu3h5m52HYGKuzgc+tQn5q9Ds8VDAFNhbjp/R9Y5dvOgYZKSkLAIr/4cgv34rYWhvE+lBxc/qezZt/UND6rr2oqR6IRylGpxg/g6/RpALHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637580; c=relaxed/simple;
	bh=8Hpl/jJQXgMDIx/9aRjnDimcwY9u+PRuHlp14LtJI1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIjs7cDqMPrsfYCL8+T+461Odf8VxbqVUdcsH6LBaX6yXd4L9sTvygcDIAgAfhqCbzd1hABQ7LvbyWt60zyAQKNYmkWWNIHmodl8k2IS/nqNh9i3QZCZANOJkOUiX327JX+/smJS/S0T803vjcBAUvqWF1hCIR8/7Tcq6gcKDi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TJ75/oCg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iibBBT+L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJ75/oCg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iibBBT+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4bDunkmKzxTEgKxBi/DaPG7+roKleuHpKwgE8PS3EY8=;
	b=TJ75/oCgSqYLgxRYrftq8+JpLzUyGtgVONwcXcZ0nkPoeaKD3szupeowiWa7rrdm3lNXPj
	3n/LODSHyQIddVyIlNzTI3tkucVQeeBBUyvKcFJzyzAuMi4BOzofxSP5THkTugoD7yiZXC
	S38VxvAn2xLc+gwMjAUi9w8gD16Q4I8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-OmeV4vhuOoyAAYFcX3Zfaw-1; Mon, 28 Sep 2026 19:19:35 -0400
X-MC-Unique: OmeV4vhuOoyAAYFcX3Zfaw-1
X-Mimecast-MFC-AGG-ID: OmeV4vhuOoyAAYFcX3Zfaw_1790637575
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8546e211940so50629427b3.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790637575; x=1791242375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bDunkmKzxTEgKxBi/DaPG7+roKleuHpKwgE8PS3EY8=;
        b=iibBBT+Lun9q5MYme41HkYMZt4u9A/DAitSXRCMqDz2iIiWBYi9uU3a0yi9Ni8lRRk
         tCxeOEEMnF7QldhgFwccToz02wvjYxv6dp0O2nLRI1/QgtLuzTWom3Tv2y3m8FT1xeCM
         OM6vE4AFvmQlXHw8L8ElKVmGZMszVjP+AoTY8LFV076JgWUsaWlVy4cCpnHt6v63Ev7C
         zdBJxDBYcRltbOfwgcmoI56LwSZR2d/C0qOCaBHcpu1TYF0ZcBX+hDKY98jtHzlENOZh
         YQRSoQQ7DIeSqxAhuGT0fNz+vLZa0kAc3kfBNgbziqo5kz6FPwZk7oeXQfSiANVNpUbe
         KBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637575; x=1791242375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bDunkmKzxTEgKxBi/DaPG7+roKleuHpKwgE8PS3EY8=;
        b=U4aed+DU4Uk5ILf2SRyMZUWDrNJEgOieF8PsAAnRlBxsiwbDJNEYx8ClZlU3f8mmdq
         Bg9vzsDDR1L1mU91AwfIrytCv42q3gyNZoZ5g8rhVJVT4vc76PG0DHXcd1noeyNvnWbb
         FDFJnIut/hSw1iPj3d39UwbVabHLR4nvaeCf6wbNC5518JwCScOzac79B6w0HXYOp2ma
         MGkELOOmWlKSo6k2Bp3FwXdkHH/SM1jHzKQrAglsgvvTBZ4tEmJe7tUN/asfjNu2yxWT
         dY/xsPBjRLBto5nxKMysa3UhvFGdjah2EIq6O3SESmmexgSuCTJ10/uuJqluBt6v81w7
         0KLw==
X-Gm-Message-State: AFq9FYLDLpfcJiA2coeyUSy3+zdCEJpADoPqh3OtDcQpzXgqymQItSUJ
	KO/Uk7zBPv5P4ox0CNsf5UWGw8b3a5joqbejMvcfg1u8LUsJ9r0xnuu5RfR73k4sH7UWAWhI1wo
	SZsgashCX3H6s7r9OTIjw7tQ3gUTW39dXWZzUF8VRGam1AC2u3KIkqtolDaRhc9U=
X-Gm-Gg: AYBFou0FPBrnQvEmmlVkYm2W9jRx2QHPBhD9xPpYFNDRD6hizIlLgCqfSCZxiO2am0T
	uxIKFcm65n09qUCa0Se9WpyXMiCu1GuzLHpRuDgBsMaA4/GaFEMd4C/y/ghk4vwy8BQcazIANUc
	gMtgeaqisooXXX0SeKAdHudfa2mpTUIeP/TAgm6/efYhjJqefctOkQbVDquFwaIMhGo1jDo0a57
	B1VmrncY6/mf8hyIscf7b60vnhzy7whoqm4xlOvEhxFBNkn9O9IKyzVuks6Y/266dvVine0X7GM
	zYkd9QdarFyebmElg/bzUeZAqA8uzkVej+cF3hAkQFOyuEal6Oi7PQ==
X-Received: by 2002:a05:690c:3181:b0:8a8:889d:2ea with SMTP id 00721157ae682-8ab3b5249c4mr5722487b3.48.1790637575106;
        Mon, 28 Sep 2026 16:19:35 -0700 (PDT)
X-Received: by 2002:a05:690c:3181:b0:8a8:889d:2ea with SMTP id 00721157ae682-8ab3b5249c4mr5722437b3.48.1790637574673;
        Mon, 28 Sep 2026 16:19:34 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:34 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 1/4] riscv: dts: spacemit: k3-com260: keep dldo4 enabled
Date: Mon, 28 Sep 2026 19:18:04 -0400
Message-ID: <20260928231807.1757995-2-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: James Morris <jmorris@namei.org>

dldo4 on the P1 PMIC is marked regulator-boot-on, but has no consumer
described in the device tree. The regulator core can therefore disable
the firmware-enabled rail during unused-regulator cleanup.

Enabling pcie4_rc on a K3 CoM260 Dev Kit without this change while the
board's included RTL8852BE module is connected to the M.2 E-key slot
results in CPU hard-lock, as seen in kernel log:

[   32.521536] dldo4: disabling
[   48.125823] watchdog: CPU3: Watchdog detected hard LOCKUP on cpu 4
[   64.125829] watchdog: BUG: soft lockup - CPU#1 stuck for 26s!
[   64.125926] Hardware name: SpacemiT K3 CoM260 IFX (DT)
[   64.125928] epc : smp_call_function_many_cond+0x158/0x740
[   64.125938]  ra : smp_call_function_many_cond+0x11a/0x740

GitHub Copilot assisted with diagnosis and build and test automation, and
changelog drafting.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Assisted-by: GitHub-Copilot:gpt-sol-5.6
Signed-off-by: James Morris <jmorris@namei.org> (Microsoft)
Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 92dea86397798..054bfff7413a3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -187,6 +187,7 @@ dldo3: dldo3 {
 			dldo4: dldo4 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
 				regulator-boot-on;
 			};
 
-- 
2.55.0

