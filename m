Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F61391842
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743719; cv=none; b=ceQjri0IBJ7j/gqElUFQCmgd0GHACDu4xKqseiCKIBrJa9xWeL7qeL7c8FruQLvWzIt+FiT2atkttyHrhMh0FA5ciVetcwmX1yo96S7y6xabgybgcacFc9Utb789U6whk49OtR+045reKXmue36uvHkN42wx2lJtgEcVDmV2CL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743719; c=relaxed/simple;
	bh=1o03/ndP+4oh6D/3IEGgeqs0/5WU893jqrOxWHnIJBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TPjAIwchIf5qcGOtgIiaY02qOMFOC/2vMgfsZ4Leaiway5LaqKSAfFzbTQSEuACt9eF1uXvCYFTv3QRKNMdTNz0/27NaXitPrimoWa3DS2rkieRpN8tGJNNzDYoOnMFvypgpfV6KEd3sGczEuCIC6/bHqpjLaajaNDB4Pdo8iOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMYBJ+gd; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMYBJ+gd"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso1353605a91.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743718; x=1788348518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTt48UsjI6unQzCay5RMDU5Cm+VyaIXFptKfLmQm14g=;
        b=HMYBJ+gdUD5F7T04sYU8N08D91Dlp+jaBKsmPQo35QLSpI19857VYNTkosB3fl95F3
         Ms7flQFySmt61/98osNvXB5GZsBwPM6rMfQTyF67V+KZf+nHLKSdelw+e0CDNXoef4ge
         KbqPRz6ZVGvp1hqNvyyTPm63awYgUg4yuqDEDZ3JUWKDBL3tFiKU/ZUAea33fZ1ymJOy
         dk+E7AuDemkIYcb+cvINWXWH2a4xuP2VWTyMANave8S6KvplIMCwi5C3yB2bJvRKbue9
         HSNBXBs15yN6eiXdCAL1NNBGXaDxf2vO9N2xTiEjLtJrUYAVgAiz9lm1D9PEObNmi/kL
         Tfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743718; x=1788348518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTt48UsjI6unQzCay5RMDU5Cm+VyaIXFptKfLmQm14g=;
        b=ftpZmbWXsEYGu5DFuiCFSDzz60YhFjjlczi6r74W1fEq6AUf3rJB5GSBqmcfDNIgqH
         j+M4f6jTLTRqM3pEmWaFEhzYp3VQmTspXwhCRZ4FZxGYAEIyKhEgkGFCfw2Iqd1sRMQq
         t7g4x0MvQ/UYOp5TJpoX5l8S0vtDscR+4pogg+9s1gqeQ2xnfRyMVpO0+tHGHzh5S63+
         MgvwxG3EBt7TwpbTXw1oPk+PbGseKcX95FDHM+h3KzKtm/bxCYhtL9EisdDwreWELtEL
         nCu0E3kGPz1Y5XYZpvXZp5gU9VQxIL0aKf5NVSuo2Gl3M8qZWut+rPGoyBBLKM6F85Wd
         hUZg==
X-Forwarded-Encrypted: i=1; AHgh+RpNd+88gvzmR7MrVInvo4fiCD4YbIxa8XQgXlUNpommf/miFf2OYo333WyacM9kTXhrC6GtJa4DkvfM@vger.kernel.org
X-Gm-Message-State: AFuF++n2qjxCzShmvZ6RibwRq3F/Qby1swTKaDe6C8mWasUtTp8IyCMe
	RJlN2XdzUMkAsmhAKRZi5nrsK7IR87GS8BDByt3ZR4SFiDP5ILaIOTNU
X-Gm-Gg: AR+sD10scNDvDlm6bnfbB/t0t7RmzTjZhcuJJz8sSpz1tdTWUnSkFT2NKviVMZMJeEg
	vRcQARnqNup1VQSlockfhkCMpzclwUWg04Zt9/rBg1ufDNasftHBr7h1Nj53xv/tseFXa3dSHDW
	nnNBGgeQqPBZJ4EOpaKKTYyfeNcsxpj2dPOKZ2c6thS6sW9JxU2i6jk/Iuncxxy6+fTRShkYFS3
	W7rbrj8DIujW2r6CKED4q2P6Jxzb9eIaphpAsyHIp6tAsy2MqrBrn7mKz438pi8QIDhKzU+NtVi
	vhRdplxxB1sZtfnre6N9wMdDLOh6vscgEz90jz0h7Ik4cKMWBUYIhKlPTSdjQqWEG1R5/xw7GDw
	MzOhXOBNA3w1Ugj+dHNb7NkR6/Or18fsiUwM8sBjFML9rT4DqgCvZhuO5/IWzBpdiKZVPJfgycc
	xJndVVagq+5f/8RjWWRyXwurXoTZ/tJ14mmtRBL8adcKPc0TsOKS1I92TkGteX37o6Pgvtyjk6g
	Biz9QhLmYsSsz6i4QlGh9Nt0A5UTuvYuum7VuqKsJkbs2MvBevG42BdEp97BkndobpKd/aqA0B2
	dttFyBSsdg==
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3966d3dcdb1mr12379744a91.9.1787743717901;
        Wed, 26 Aug 2026 04:28:37 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:194c:8843:f38f:1aa8:6d39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm12414919c88.5.2026.08.26.04.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:28:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot partitions read-only
Date: Wed, 26 Aug 2026 12:28:21 +0100
Message-ID: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
from being modified through the MTD partition interface.

The corresponding boot partitions on XSPI0 are already marked
read-only.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 20d0b607ec62..395316c61f33 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -825,11 +825,13 @@ partitions {
 			partition@0 {
 				label = "bl2-1";
 				reg = <0x00000000 0x00060000>;
+				read-only;
 			};
 
 			partition@60000 {
 				label = "fip-1";
 				reg = <0x00060000 0x007a0000>;
+				read-only;
 			};
 
 			partition@800000 {
-- 
2.43.0

