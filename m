Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6119C375F83
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075136; cv=none; b=QZmiYk0QdVSbqCP3BHRCZt7GtTLHGlOztjs6+Od8ve57lJo9O2bh0NUwyLYnjNq+W3wisgTCIe8wtS0Ypb+y9vvJ6CxOc3/wzf5lEz5DRngyMya+fc1CbHg0dacSM09mmjRUnyJrBXvCagqJJ0xH13KXs6jIi+LV2EhqlLmZ67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075136; c=relaxed/simple;
	bh=JMGu2iM1quSp3Cy+yK9EW1dG4GajR3ZNEWEAaIoU1f0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WOWOfdrxVLj3oZMCEWuyfHCBNZ6rrx69j9jNo+XzwTOZT8b1YaEqcaKtcF9xLBvw5Scb/jUgQtv+nd53lKkwKCImULAq22+PA+XNf3W8Cd62nNrcNR//OrD6naMbgRackIiA2aOA9i/r7qI1NatIiXrXQK51Ix7rI3diFfXPk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=AoDwUjKF; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="AoDwUjKF"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-917b78dfe30so85416616d6.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792075132; x=1792679932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87ArKhOz4mXpsOQz0dSA1S5HtkiIocsYKLa7zjBJOG0=;
        b=AoDwUjKFNDMIuLAQpcS31VBM16iaveOUugmbll1thuhLqmTUcZBf2k0csqXga0+k2V
         y77VmHzT57KEJwzkDZC9ezq2aEkpn8cCsCo5vzMbaeFz7RgNxMpLD50irKxpjfdxRIiJ
         pAerW6P1W7PvMLaN7EcUfGmfmN1pcyH8hdKkCpjpfmhNBExaterzBUit5igk+GAWNKS8
         7wZOplvmRG1VipSLmbmQAhzCbWxoRUHKuuDVkQw6/jompkKefOFXM5s5UGgjGgiYDfYQ
         HxqaMyi0/7Xcvhv/Wv4zs8c6kHUkPuLKBNNnCwV1u4aKwxas7MKB57JvvLzvEke9HaLn
         BamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075132; x=1792679932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87ArKhOz4mXpsOQz0dSA1S5HtkiIocsYKLa7zjBJOG0=;
        b=fdXINwkY0uzXjd1TIcHV5kLgtB/LJNGLZngufyOHFqfekRFAm2LCq5dTCPiAQXc3y4
         LVMda5bS+kez3T6rGJKHBf0tM2UEHpM0rz70EO/5gOhsMK6odQ0qxNx24RNnC5oDZEqz
         jvkZc6UwQLMbK+u4+MIXW0NIL8XniriTTx+9RYld+0jmpB8JfVcsUJQ+OCkQN6hNecwd
         bgwCnrFOZdgsrPtCD3XBHlfsWrOyqAfjJ6Q4mrPeajJsC5SSPihADhx3B6+nVFfOev6e
         AmidiEJQzSGkBATKRihwB6PiWYNQQt8mHOjpfE7GTWtOEP+blGV+VF9iJLQo3/9w0S1L
         jGnQ==
X-Forwarded-Encrypted: i=1; AKwUvByt49dQOIbqyka23K0ar1XjtgIWFfn67HFltHQSU5Frv+yJS1/LA7rfFniyClT/Z3UEMQvDFNahBbym@vger.kernel.org
X-Gm-Message-State: AFq9FYI4fRppV0wOZiZFaRAhfkFEgffv9nH7FVpaFtkQea/ZJJc3TUXj
	/dPYzE7BNPHEfw+SXHQVc2Wn4aEHQWPN/Zq18A4gvjzVtN9jalNq8sD9A/zuDGQYR+U=
X-Gm-Gg: AYBFou3ejlKvdrsrOHr3HEvV+202/Kc/qt85DqKP685CyphvPX+peBxhIfqzNUrXAQO
	8Hg59fRqt+q4rMcgu956aIgtLyCuEaTheg7H75hi/VIMvqARiuxtuBdvw40gUAcNdYGl4Q0iuou
	kb81lx0R91QZ2fEbOo+xqQnWLxr/dAT/2REgslsAOECd74l1d3uYheERKfCTP6DDhjbUu84ysvY
	OcbQGlnQNK2gXIENmPr8shhnhnb2VJjbKnW7FQtfnQ8rJUQFNTE/6JW5UYMellR6pOU1E7T6xnr
	jRv56MJkbRFIEGbW6VEcqe2s/cLIWnrLTuAammhsoH1aDOIX8nXuhytZzRqC/uxU4zj3XILE4JZ
	Z8QOyiZQLNMbdQGiV/TcRrv5Mf5bbKlCWx4QCt8pszmZXiAqDnAUP0//7QdysKmqwtx0vtQqIHl
	omO8x1wWh7FIMxCAEVDxLA62cvZsD9Ywd7CFxVFST8x3j8SCrvJsnZzwWpJMYFV/MnkCq37xGPt
	uM=
X-Received: by 2002:a05:6214:590a:b0:91b:9061:b808 with SMTP id 6a1803df08f44-91b9061ba50mr181091236d6.21.1792075132399;
        Thu, 15 Oct 2026 07:38:52 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bc6d42sm82581486d6.34.2026.10.15.07.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:38:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: ansuelsmth@gmail.com,
	donggeunyoo.kernel@gmail.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	daniel@riscstar.com,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: phy: qcom: add qca808x support
Date: Thu, 15 Oct 2026 09:38:45 -0500
Message-ID: <20261015143849.483339-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm QCA8081 PHY (and compatible devices) has four power inputs
available.  Not all designs need to control them, and some might connect
multiple power inputs to the same rail.  This series makes it possible
to optionally specify these regulators.

Between version 1 and version 2:
- Add a devicetree binding update that was not provided in v1
- Remove #ifdef CONFIG_OF from the body of qca808x_power_on()

Version 1 is available here:
  https://lore.kernel.org/lkml/20261014172300.292324-1-elder@riscstar.com/

					-Alex

Daniel Thompson (2):
  dt-bindings: net: qca,qca808x: Add regulator properties
  net: phy: qcom: qca808x: Add regulator management

 .../devicetree/bindings/net/qca,qca808x.yaml  | 16 ++++++++++
 drivers/net/phy/qcom/qca808x.c                | 29 +++++++++++++++++++
 2 files changed, 45 insertions(+)


base-commit: 73022f605c447f31610b94ed4a983d2b4bf2c721
-- 
2.53.0

