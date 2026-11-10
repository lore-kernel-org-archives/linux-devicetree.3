Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303084;
	b=GBOMrhkU3oopYO0U9HcmE2i+8wj1MZI20G9V6mM/m36NkzKv/IJ/zMsJaD2dPHnjkl7i
	 maZOeyP4tyN0vIXKWYfs4MoWqZ6vFekMkXr1GO26D6EFg5IF366cB641iXgwFJe0Eo4Cm
	 xFnZqdACsUvNL/Es3dnJH/45vLONUpotVqy/WR0OD/Ir0Ch2932o4y7XQcKq1JwyfyNjO
	 C3QqIuhOXC/2q7z4iLJMoQcuMILw3fTmEiQN+hjtitgK7FJk7VCoXGAD8SnoIYjUjq2lu
	 S0BvWnCnQYOXjOr4jqBhx6pa2NaAjTVSPf43byw3hHKyXk9sdw7CgLcij0p1v1mhzUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sBy6UaDPBqe3x++DW9sJ+DLRXeTLdTCpRVDgzEeSkSk=;
	b=f78OVAYiSd6kHCscl7NBEHm+CbNIsdyu6Gxphlynw1+5ZKO9cqDoAHAE1xDSHm4WwWh2
	 GIW92FmdyhT+2ve3GPEcuUjmJKfJbAdhAS1b2xp4Q5bu05BSkWb6zt4F242TBpJgKs0mp
	 AbUeaSTP4YfDd/N+je13NEWZJpviW1d7nG/egM1BhBZB5A0rpsNkQRjlBmryZxNtZGh3E
	 kMXHFikoihCBLr6XYgHpoBubpDPqWXha9NGV35DO5MH0IRSJa/BAhZTUKmyoMEhlGKMQ2
	 Zexl3HHWa4b1o+Mo25JCNfaWk1vKMujTOYHWX6Pol/uqnWQ+zfsm4OZoNVQMGBraAFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lR1mEtk5;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF964606C658
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF964606C658
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lR1mEtk5
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso936819a91.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303083; x=1794907883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBy6UaDPBqe3x++DW9sJ+DLRXeTLdTCpRVDgzEeSkSk=;
        b=lR1mEtk5vQ3LzQZrkELEd1wqCamrApCcw0DApymYe1jgWlVLx+wvZChrFEiOp9ofMJ
         NG3Aj3yyRz8QFWbsGskuMmU84wnwlzWQyT3e/Nz1fpHQDxA6nZVpAJAQyrazD31mS8p5
         tDL0SmExCIr1aIKjC98oE9P5oHrB68mDd1V4Jw082j/zaMD++xgs3ijVs1AzQdeiHPB1
         g4ah84kEXE9B1fBPu2t0W0yDTqWMH8+aS2VAeeVj30KXlyCcCsHssVDrQ/yvyMPUG2iA
         Yc2oV3WSL+J7B2rea8MCWcvYYF2LNYUxIesS1yCU0jr0ngvg024IoZSw0kkiP8rI1ukz
         quqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303083; x=1794907883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBy6UaDPBqe3x++DW9sJ+DLRXeTLdTCpRVDgzEeSkSk=;
        b=AYMn9aHQFEQMX0EnCqklfEFy4coZKryS7hzXB/qxZo7e3XwVNgb9zd/bTaOonrqQFA
         6x3HqwmdvTCRuV7NPicgyjgm8dhlFJW46CjHe3CfDJxSErWJ034NdS3XGlwF8tXxo5pw
         1cUoUG/GILrNjj42Bdl95NlkLLEBVI8b2pXwMjrYTxqsrwIVOL4+XvJSKsXF0a5aNTT4
         ym86l+0kZ54cW9SyNB+DwwGJfQ1SamKrDf3JDSKWo096rI6c7CKx/+KKlwZxww6B6K86
         2pApvE+Iw1iHI3auT/ACOaFFwAWrJyd9WBbB/SY2WI+1cjHpi4yFzk201Gyv3DKoWQFX
         LoUg==
X-Forwarded-Encrypted: i=1; AL+hErGlkD3483Zbd6KTcjEZ4pbb0hxrBJl4yrzKMgpdU4bs3op1qt5TmGjZMy7a22LeOUEnmX/8DlLW4Hbz@vger.kernel.org
X-Gm-Message-State: APuU4Z9d3lhEBKV1H693ca9F58uLGlDzvNXsvGyls851WWMOrIRadreH
	PsjM6gAiVvSzLmrFHYx4ywjNwV4eoRc/LTNchC2RdBPtsNxqRE88XVk2
X-Gm-Gg: AYBFou3xGaFoL4QWWmBCd8qJDEwCDEha+cvQBzbcUgilFflkg9M/bD2iX7rZmKjiHkg
	qlfuUBsk475FlkgCMCc+UUxZcq6LDQbBEPSgzqy7s8jiWGUSIFBPTf3tPlq/pPJ587oDMYTpX+A
	mMrYYZAfP52BQbHIDS/dbKxGipyVEaU9feNOhs8WcKIOeWq6JO6mGg7EX7QXj39KVsz1Vt4Y3gd
	n4TrQNFAYFix055Jyb05aBRPAs6gb95dBcdGT71LiNKAS8cpD0pEt8ni76YpB6FZQEdrnVgYcYQ
	7IdjJPkwsEU/WbTrg9SBZ9oJ1z7Fa2A+tDjqyXQNFXrzxxucRdtIWIh21GAENN9e0/aJJqqYNb2
	/eIW6o8eYg4iuKXeDepzrWhzbqNKgIfw6w6HN1d+2IK1CQlYtg3jGNWuiDJeGAGf6qrBiHyEuNh
	Nei0Gu2oWZ/KihRB6LpHF2Agtmn2/XURo695TSFkqaEftNq/IKo2Ce0F9aloCLBghcnB6z3e7Jq
	aVvBsDdT3YjeZbD2WjjkFQdKRElIvO411fCQ1bhW02YSx7L872tZ4nen5o4zw1Jrgwmk639hDVS
	+86GEwJp4fX88FBtIjppSA5OKqysNe+FvQDc95GZcKoMDLBEqn2IpJj+vG8+a1PP
X-Received: by 2002:a17:90b:3809:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3b166d329d0mr2096181a91.54.1794303083150;
        Tue, 10 Nov 2026 01:31:23 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16913b050sm1115979a91.4.2026.11.10.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:31:22 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: andrew@lunn.ch,
	robh@kernel.org
Cc: gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	klightspeed@killerwolves.net,
	jason@lakedaemon.net,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3 0/2] ARM: kirkwood: Remove duplicate DS212 compatible
Date: Tue, 10 Nov 2026 03:31:18 -0600
Message-ID: <20261110093120.179318-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series removes the duplicate "synology,ds212pv10" compatible
entry from the Synology DS212 Device Tree and its corresponding
Kirkwood Device Tree binding.

The changes are split into separate patches for the DT binding
and the Device Tree.

Changes in v3:
Added the appropriate Fixes tags.
Split the DT binding and Device Tree changes into separate patches.
Addressed the checkpatch warnings reported during review.

Artem Novak (2):
  dt-bindings: arm: marvell: Remove duplicate DS212 compatible
  ARM: dts: kirkwood: Remove duplicate DS212 compatible

 .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.56.0

