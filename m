Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453073;
	b=RLGMWAUgyD2DOiA8If95TWwoOGZsJcCMiwp9JTDIF2Glvkrk6ZeMVAObEcIAie3cD45W
	 9rzJEBpWP0SxJt2YxvT2E9oGOBMt19PfYlHotuJdU04OBphPqu8WuXPMtNhN9/V3gm0zr
	 FnLuf40z+nOrEXooxbU2snbyv9ZcSbDntn0onpJSr9MrT6zlf/Yu+bxmK8t2DOE4fdtEP
	 tEca2LCeR5zB6v38njKrdAQpl+oZXwwXAbkBJWp0KeORYg1szu8ANjt8q3vt/kKd6f01c
	 QisJ+WIr7RypKf8+UDAd1HEq8dLa2OwaUlddqmjBPMV1aInN5gHLvkQnwY6HEYm/sSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GH9PwUTkNOVR19n9V4pHtHTQ3cVhwyxReHCBvD2/+eY=;
	b=dW9EuUe23hui00t6VN4ge9W0Omyj/oF8aaO0dCVEFYOSoaxQKgKmc2DSuIYJ0JcZYTeg
	 EaPXHtX68oTQXYpFYmP38MBUkbS55CUUuIPOUlQOsEdqiLAJ+LB01d9SMXtaqrEn4d25C
	 mYFGyktEWcz3OFBIo/qC4rGkVk1Kipz345c9G+zTq0YoR7CHNCplrIHU+6jIPllxEof9T
	 evLXMbRxWZ7cwKQ4XRBLQ1QpwN07CQzoEsuUndnkBBPhp89QSOUHySEUsF6ZM7AIEIe2O
	 cIgaJQeDPUwgDcdFy6omFsPoWfQgfhwCPC1JNh+sinkzBYCMoiWJ3M896vcGFSFvoAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKpJs5E2;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC68F606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC68F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKpJs5E2
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-384d0550c71so2032517eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453072; x=1796057872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GH9PwUTkNOVR19n9V4pHtHTQ3cVhwyxReHCBvD2/+eY=;
        b=dKpJs5E2IsqugBWXIya5uRF+1FPXcyUJXwbGdAlKOTm1OKPEAY3cPgxsgaJf2KK+PD
         1iPTuRk6DBFpEuZyzI/v3g3DT+VZKcvcl8Q9elBP+i177JZCC+Kgyy6i0mlj/+zTy8DE
         arPYuEETuhQF7AQP+jXzHR/uM46xkVntGsXDZEcsexkcQeQtpSdOEWE2ebCY0nUz1DVF
         zqxLiAdfBAd9qhu3JfFTLUIzDhMb8W2fwzQyiEFlY7od9eR5VTb+fK+fLv3KzSG2tzPi
         jC7TVBgGVrOY9tlaylj7Dt4QjNtdTRdInJs9jp/RgAkRTFIKuZpMDEHr7Do9xSYrJSl2
         sF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453072; x=1796057872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GH9PwUTkNOVR19n9V4pHtHTQ3cVhwyxReHCBvD2/+eY=;
        b=EvCfScflRKAgChMfq7JYVODDCwwudPu8//cs1POIPyZXjvzjBJydsTxt/jOdqNehRp
         htHKZV97dJFrVx0tMSC/FA0L2fIwrzJCPkAPiseAckSPxRLSo/kR7UrZPvO9vyQFlxPc
         HwXyfLzvH5lhUsZYlMw4ALujh4R+ZhK4J3qr3C/8zAZcNh1Hrhhx8EB9IjM+zCq+OM57
         K/lhLJ34fAcuhSejDK/qLhSt2wqPSxPfsmJ6Wxkd/zVh1ZvFsl7/PUsizafjzCW47PPi
         RAYWsr16LQiTlo34LT8R3Yry3KrDKHeQ9//BEqYbklFytH7/8iNIGRT3wyMGAOt5oNot
         25ZA==
X-Forwarded-Encrypted: i=1; AL+hErEC5AiStF4sdSF8IAaJQeV+v5naBuYSsTIgxuW++dOP5SPcFO718Pai/qnPXC/kFmb2oEnxOiPBwHz1@vger.kernel.org
X-Gm-Message-State: APuU4Z/aBVUeaJD8lO4E8xUu/UqwGAOlDg5RdlosO0pKXgAHjZ/bU3tV
	5o9HpqZKm/UGYtOEYBkMfKke3Xk9z365ahRrneG2nv2XUhv3CLr7ExL7
X-Gm-Gg: AZFdTZegQAGcLKQdNZcc/wL0BHYOY4HdBzC/D0+JSeOuNyJK8SAASiT/QaBVCDMY/E8
	5PjMRGNCpVFQ4ERvy3isJ5u4t19HmfQTl7N3ot/UhdJPR8iZaLV4iP149spiv3kaj/BX1LeyoaZ
	+hl891xAIy08tOdpp4md4Mlpe3fiuNHSvKsJ/p5JxUB9Id6KBqHulQA04xgQfbTbaWg47T6YEyB
	w5xkvIcJhVKqlIe0V5PBqy6Nf0Szg98rdToiYaKRbUs586VOOjkClv8rF1FJXFmrt0oY931boDe
	BOUld0svJq7KKSafLRY1caXTfEW7aDBbLLh77pmBoOtfnzC4yc+W1JG+mSnOhoDaKZgy5NvN28C
	EMaZuFX4Y15tEiRId7ijMsZb6QjlzF04vGu8aGBzffQvVz67R/uRrhSDFRi9j0KbYUcxAj3EMXA
	t8D2aJhnHCLVlMeQOEVTfFLvgGU4+ci2VH6wYaNVkmmNhbXQLdX5augIzkcy2gfzH7pyK6+OS1S
	fDiZ8lfeEVXicM1rLxjG5SpAMNSg+jsh8wUTVqqU+iqWwWQYHRywDr+kOmXYS1nMUKOfMEmnAeM
	Sa+QMx5VCWmaziHOpL0NVKKVZK9oWLpKk6vrfvResXVuwtJvWPMn3rrAq4s=
X-Received: by 2002:a05:693c:8957:10b0:386:b089:3520 with SMTP id 5a478bee46e88-386b0893ad4mr3583969eec.19.1795453072013;
        Mon, 23 Nov 2026 08:57:52 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm13315280eec.0.2026.11.23.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:51 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 0/3] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Tue, 24 Nov 2026 00:57:00 +0800
Message-ID: <20261123165703.667564-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds the RK3568 XPCS node, describes the RGMII PHY LEDs on
the Ariaboard Photonicat, and enables the SGMII LAN port on the same
board.

Changes since v12:

- Move the XPCS reference clock from the SoC dtsi to the Photonicat
  board dts (Heiko).
- Set rockchip,sgmii-mac-sel = <0> now that the PHY binding has landed
  in linux-next.
  https://patchwork.kernel.org/series/1180426/

Previous version:
- https://lore.kernel.org/all/20261023053548.1595033-1-coiaprant@gmail.com/

The XPCS node is disabled by default and is only enabled on boards that
use SGMII.

dtbs_check passes with the current linux-next.
---
Coia Prant (3):
  arm64: dts: rockchip: rk3568: add XPCS node
  arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 75 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  9 +++
 2 files changed, 82 insertions(+), 2 deletions(-)

-- 
2.47.3

