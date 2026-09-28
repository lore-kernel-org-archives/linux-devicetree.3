Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668324DA9C3
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 23:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637570; cv=none; b=deSXYEv3LgQBHOEoFe1VE3mP/ZllCD7w85GfXqxgRIYJzRP7JI7R0q7wEsM/bmPOjLV+dHqZIJP71fTUSHDXb8Fl2MEJNcMknknTkKGh7u22quegYWz6jZXoWevqcIUEIxkfhib53VN8WUF0X3Vz81PgNHarj7YSKsKjuJjDstY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637570; c=relaxed/simple;
	bh=FCGF26dCddhrQg7vYYo0pTLzkYH3qozJaaCKhDXyBpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LFJpFThZh6ip8bBuix2d7mwGoatZrpawL2G0miyTVhOycFOpPpzis7WBSnZY0/0mkD62D/krd59oq/4MePihQO6WuYbvrvGtmYybE5cQiG+rnw8M3cfYLW1q/XQb/I/QZA4VeeL+pnh4WbBqhOXCG8I4h/ZS7CCkztRdk04GXXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JXbhllKm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mr7n/T2C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JXbhllKm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mr7n/T2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1L37AvZaZESgc3kaNIXv7EdbpEkOBgUu914+Tx8mGHA=;
	b=JXbhllKmSOXRbYIrkasseSEc9QxCPszgTkjnhhY6B6CmZuFhIX4heDAtZ9YwVqU6/vZRxo
	CL3vue1thaM01YGz429MFlCM/z7zCHg9FMSA/oRgMiLjc4zzpHetpRL6wE5h0j7ZuOsxXA
	bHjc+Gj8B4W0oQCfF7P29iVyhYNxtbY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-mbqM-a8MMmqcD5-A421a_A-1; Mon, 28 Sep 2026 19:19:13 -0400
X-MC-Unique: mbqM-a8MMmqcD5-A421a_A-1
X-Mimecast-MFC-AGG-ID: mbqM-a8MMmqcD5-A421a_A_1790637553
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-88322409239so52402467b3.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790637552; x=1791242352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1L37AvZaZESgc3kaNIXv7EdbpEkOBgUu914+Tx8mGHA=;
        b=Mr7n/T2CvTKN0+XEXZEWU3gom4OW7PgoGKMJ5TFrGDkHxSXhguaA04dVf5L5KU62X+
         fcBuocLLuj6IGLTDU2FDIs+QiTzOJt3WEeGvJPtVQtlPhvlpktTDim6ANamvm1zgfYYv
         ME9F6NG3CGy7YOm05nHSBUnaUMVvnPMWYIGIz6Es1tgWQqjwSpr8m1MMMibMNWLSGMpc
         x+8MgyL4Q0wIA4lEY2iJ4TARn5WqJ/8lqWGBCuAPXSqRnwwxchGVaexeIERQn2IuGhpF
         UO0qspiSA/I6P7Z+oL3s/mOtxi60R6rUplYvrLZcTBO1bBVf57yxWwlE5qJT8bUlz7VU
         lb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637552; x=1791242352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1L37AvZaZESgc3kaNIXv7EdbpEkOBgUu914+Tx8mGHA=;
        b=Nnbck3wzmXqxNMbQcpSvNBUiabEa6m+gm9t8WnPwk1a604CVXNIgKjqRewLx4ykhqR
         9tVtZ3TWmq7YG2DPAXKifQdWIyaG7btMrUsDxj3IHbn7kguAUO2bvsdc4ijbbj3YAYxZ
         8NOftwDVEEyV0wFQwcApTWO/DgOl8MZyt5Yh0VVq+Euzm3rFC/EpgufQMxAcZbsiBqSr
         /Qny7gUzLPAA24Bl5TiQ/qLYz0Rig4DAINsiyhZTwu/dFCAVo0Wj6g/f60p+28gDrbzx
         WyJh0Qja+i5caE11ExdBPoaCVnIibqVOC2McoXSVl7DjuZAv2sZXP9Q3YUSGHYcxBPmg
         dNzg==
X-Gm-Message-State: AFq9FYLVpx2JSuDTynp5kvoalcDowYM/qxbWOdzEaz24Uz8kYzBpLLb3
	vQCTlMF27Fn0NnKaCWzwoviySkt21HnYWKy37EZbb8q6yqBJY9wJOJ+gFlCZVf0iYHKM/lPQyQ5
	X5t4NzhRQjs9PULhJoUK01Zy3+xZXIKa6ep51IC+lk6EcGPsVbnHNG8vdrxlxJSc=
X-Gm-Gg: AYBFou09/BIjDlVpceeDRxdWiRE1j7DcbObEGdft4jbAjaDlIfl5WKozBHhF4dAPgm/
	rBnTFGL5xBWhe6+rywXfi3JeqznmeDS/RD1E5+suMk0nAXnH5niH5xaMqeYPvsQoXE2XQcywuri
	GG+QPlDz3gQl5soWz5w+9u9RF7xJbuufY88NMWhBZZwhhrBdaDr0ldZhIVGVcXodRmUJMXvx7LG
	T9Ygo5gvH+iKOawEwpT5sw2siVXgYBX/CV/O3bktoDL214MaLl4bsMhh6MdpN4opqXPEr/VK0zZ
	w1viq3p7laSVnPvxjvlet2yf2S59S8Fx/AAMRRPZDnUxM27EktkB7g==
X-Received: by 2002:a05:690c:e3c9:b0:8a9:9a2e:e34f with SMTP id 00721157ae682-8a99a2eeef4mr35038767b3.13.1790637552668;
        Mon, 28 Sep 2026 16:19:12 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c9:b0:8a9:9a2e:e34f with SMTP id 00721157ae682-8a99a2eeef4mr35038647b3.13.1790637552245;
        Mon, 28 Sep 2026 16:19:12 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:10 -0700 (PDT)
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
Subject: [PATCH 0/4] riscv: dts: spacemit: Enable USB and PCIe for K3 CoM260
Date: Mon, 28 Sep 2026 19:18:03 -0400
Message-ID: <20260928231807.1757995-1-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset enables USB 2.0, USB 3.0, PCIe, and rfkill for the K3
CoM260 Dev Kit board. This board has 4x USB 3.0 Type-A ports and three
M.2 slots which may be used for two NVMe drives, Wi-Fi, and Bluetooth.

The USB Type-C DRD port is not enabled here because the necessary
drivers have not yet been posted.

This is based on spacemit/dt-for-next. The USB patch depends on [1] and
the PCIe patch depends on [2], which in turn depends on [3] and [4].

[1] https://lore.kernel.org/spacemit/20260928205012.3689405-1-aurelien@aurel32.net/
[2] https://lore.kernel.org/spacemit/20260727094726.890179-1-inochiama@gmail.com/
[3] https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/
[4] https://lore.kernel.org/spacemit/20260923015016.64069-1-inochiama@gmail.com/

James Morris (1):
  riscv: dts: spacemit: k3-com260: keep dldo4 enabled

Jennifer Berringer (3):
  riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
  riscv: dts: spacemit: k3-com260-ifx: Add PCIe nodes
  riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes

 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 122 ++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi   |   1 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  |  33 +++++
 3 files changed, 156 insertions(+)


base-commit: 4947ee60bf48caddf5caefc08dbbc84d09fbbc6b
prerequisite-message-id: <20260727094726.890179-1-inochiama@gmail.com>
-- 
2.55.0

