Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388553;
	b=uCSQNhQouxgGWw6HLdpx0FbZdehwhuGf/uW1573Fl6Vzlji4mYlApytKPh7uOdCb6euo
	 4vUeBWrw4rbE2RYlCAr8QGihl4zdXMTulq7Ey4UhHSSmH8V1KWRWRaV1jNY0ra42bI6BU
	 UsuUw+FAUheZWNw/J5YzdZURl6iwLB8/bapjB0hzKP3whbYEPzgHa29YYcURANc7v5guh
	 51bNImfEsirfLWZ6Y+9UwAb4F2OCzNJO21MOXZwWLuIY/caELBs0Vh0d7mioX/ErbbvhW
	 DsdDW6tLF3N9ro8tzMCXjySMOp9Ad4RVC7LxiQagGfoSGnxQxNOMktpwBEF/5uyQetQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k1FWUPbFFF4TedlPxPeZbgHqqhA4GJh/MR+RPJTO25Q=;
	b=dypNz11z1d6ayQehR2AjQePxwPFXNJvwwttjmQlWUxS3k8orfGYOgKeNv1ILvi6KhVCO
	 i4lXwdtO+ljMWOT1R9Jo2b0syDGr3ppyMfReHnd9qgeU+yTAQkq1ADC+bzZOpho1Q1tjb
	 iJiixYRijOy5WAz1yQVVhQT/C+rMu1VkUBUCscqwuoPrtc5moN3JyHChJCUrSjAX6aN4q
	 L0f2gEPEnOyftvmUkGZ4fGJDudU8lzXZ8FH1t/gq3Uhjmx5T4XR1CsOU7i3JpIBM2odXe
	 TowfLzUwDH1sGfQU4dauGVtSF2Vpivq63EJL0+CZzHdpYfPu998iF+XOcvTM5zIWqrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZ7NgLkd;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168E6606A31A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 23:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZ7NgLkd
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f0464dd6b6so14099345ad.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 15:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795388552; x=1795993352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k1FWUPbFFF4TedlPxPeZbgHqqhA4GJh/MR+RPJTO25Q=;
        b=TZ7NgLkdOKtTTPF4ve4h53XWhnSAoKbxp2rNzV4o+GxRijqzoIjpSvIgT792wuWJfX
         BB1w5bvGlRNAolvKNzHDoRGa5FvhpKCt1qikFte6bnw6uvy1hMeohMsKdZrRP5g3eE6p
         CScBZPobNr2bHW2ZRvpwu9kPt55ki6p1Azqgki1pT/NUn9uxo14gRp3GUDW5MSdAtcRP
         4mh7xwczjTC6HsUxLgOBgTc3cLrWOyvEFSqbhwOjAoc8FsixUr5PQACIKRCzDWWO5fUq
         MqWbNpEZz7raoWt7R0zDJHb4/hgeg03QcUCGCOC8Jd7AY5REuuXQtlzT13shTQiQmm2v
         hC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795388552; x=1795993352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1FWUPbFFF4TedlPxPeZbgHqqhA4GJh/MR+RPJTO25Q=;
        b=jftFtWORlkjlrScrNKWjgxASV8pvjKL2gkFZdF4ETwOvYIBdfwWjpHhG7hNtd2XpMC
         pGyqvTscZHWuZKEQ0AWLjeJyuVFiXJBR+MKFqbtzKdF3anuinvkgjwK3eA4PWR4k/k6C
         TLtUPm0NYIihq4TEsMWuDjsMMcJdE7mIpjkadKZhuEbjwkXD0J09pwyfeE9/d1ONIdss
         yGjSvwC49U4qeSAnOhrmZzMr+djiNf49zvKWR2WYoB19Cl7l0QsXF07kpJsiMawSwFKf
         8kvdwbwVDz7ux2as3b28/pFUVdkRThVhUsWNKf43rdeDbyXpaj2qmnOjqdAg58f7rlfu
         YA6A==
X-Forwarded-Encrypted: i=1; AL+hErHTxAOo8D8DLY1u38V0gTtMxGrg3Vo5rWWvOeUS6GQgXdBRO8cfJy/Z+68q1XD0mfB5RkNqhcRKwY5u@vger.kernel.org
X-Gm-Message-State: APuU4Z+rGbb5kubVb1D1RXldg1FkCcR/hpDdzJsjgRE7CiprDGvYa2yG
	LVeOMV1tb5vx62jDfv7EcrZJgqtnmEQrvc9Qgo4rbLOpPqLPZRi/gmE7
X-Gm-Gg: AZFdTZfGcSTLoJE5oUVgVHKm3nYPVRls9HerdBqKUFceIaq4iySdOTPNYEMLxu0qKrt
	bnY6U+j/deTL0AJTrmDAPoM0tlQ5mG12qfO1wbU2T1TawjC3rJh6YjiRITziu4FauuE8Hec3U9E
	j5aHL+Lhc2Cm++GOoCu+eL8MtVYRV5NiwsGUxBXCwGcmvy98aUJsAATCHgHB+z5HJQ1RJbxbHvz
	IzfVw2e7kbIS7pHCnDz8Rg7y7OKa9BWTfa2X/CoMCl9BlBRUdrgxvGjqJcgBdIjU4oOpmnChBux
	4FcKtkbZEJm2Kjjh195Kiy12qyQ8z5Gb9QoARI49Lw9Bn1E3CHzBmC04f5RAbgSl+nb46f0B2ge
	BrWOp3oC7jWJtnoScoqsogLc2uLW72gLgHpacJ/YMUnIuka7O5nN2ta6R2J1w7bAUMq99YK7wBX
	ulKbm8afbf+nXDom1SNlB4+Q71Rap4Ho70Cn8iubAYPRb+How3/E070M38QytrhvPjZkAlB7QZD
	l5A49/Z1I2f0/n1YPzZe9OctvN9WsCqYnWD6aupDgCg8ySruS5YQST3tQh3QNahR2cSmOt7l+wB
	hrD778Bqi0IKSie2bBzwOSIDX66w6w5tfNkhQBKnOdl4TVYq2m8ZRm3mPRBbcDvYV1M=
X-Received: by 2002:a17:90b:5109:b0:3b4:1621:ba5d with SMTP id 98e67ed59e1d1-3b41c95afa2mr9167746a91.38.1795388552237;
        Sun, 22 Nov 2026 15:02:32 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm17663215a91.15.2026.11.22.15.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:02:31 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: hix5hd2_gmac: support fixed-link
Date: Mon, 23 Nov 2026 07:01:29 +0800
Message-ID: <20261122230134.3366017-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Support MAC-to-MAC link on hix5hd2_gmac. Also add and support mdio child
node to suppress warnings when fixed linked, as in macb.

David Yang (2):
  dt-bindings: net: hisilicon,hisi-gmac-v1: allow fixed-link and mdio
    child
  net: hix5hd2_gmac: support fixed-link and mdio child

 .../bindings/net/hisilicon,hisi-gmac-v1.yaml  | 15 +++-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 78 +++++++++++++------
 2 files changed, 67 insertions(+), 26 deletions(-)

-- 
2.53.0

