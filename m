Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36D83E5A2D
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786796573; cv=none; b=KCeT2044bwOi7Uzuek77saeDKkGXfPYQFCfUadAYDs89v6JorI2uF9tGGgBb2YN3NsLMH1LQg0d8ZnrpS54qQ7lWioM194GoYPhNhzAC+oilqQSDkN95Bfn/ztUbGjWs8Nvu5AwS6QRXLHQBA/aWGNijBn4BpU2F51Aq0tSbqo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786796573; c=relaxed/simple;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWBZ3UI4cvdWDpbXOmVMxDY0eczZ1FQATBQb578sq94CW3BHgrhlsakU+YDMnoba8Kewk8t0Ot768niAdul5BCng8uCFfwrhnBZ6eMTGX0VbtyIoUsB1eMfs+3gdNELTZnwWAZewVlbMlHiC63fn2ZYg8nx3cRHYzEvEWNBsmOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZK/bNBpO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZK/bNBpO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4955c545a94so2305605e9.3
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 05:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796570; x=1787401370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=ZK/bNBpON2DsRhhbvo+q9r5zq3x9GSkd+xOYIK7Nzd+HIBqleJ0F3LA746nGZiDmdR
         riBq6wzP94hrto4sB2sbWmvLVj/mUVHKHyeqj4K1dj+omCM3e1xhnhdH9GNOm8yh/P71
         N4lJ77Zu8xbqtzj1liwY0MHXyRisMmbEfp1dXOqQOKpGuaHQLrMoOjVyB83z/ZAEwaVO
         ra18YqPf3syfGeHaoaEQjsNWb5D9U++QbJlkjtRnyWqKJab9LikeSNoZRJ+nMhjA/xs2
         zmjm8i9F+/alG1+UHQc5ov8JMrojwtX3vkz58mYHP+RWYD7tf2nAfq27lm4ER/ch4Wso
         oZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796570; x=1787401370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=f9ybgK4Wi/R3+xjNPhmwXuFTDvXqEOHsI3VcjE5wKx7vMoE34oSGHkW7QBrpbUaWrb
         I0kb2nVJMc0d1hkcSffsoH3zKc3JFnwVxObibzb+QCYT4KSUI+qu+2e287tSfHGCSmh1
         N8bB3nHyTu3JdwFbZbX/rISKlKXNrVXHHx4u7IKXJ95JJTf1ryyVRkyFlirQFwjCsMnJ
         JHMz7V8gMekIjZZFm4udR7vCFFsMXv8eLuCB6vhUZdhyTeNM7KGAYztO5m7Owscba64D
         E+1Ojq1Kh1R2xYaAxbcLshlTSLP10OmT71Ncmjyv1tpDlV/O+NGs1LsjkcQzFAhfrUaU
         Edag==
X-Forwarded-Encrypted: i=1; AHgh+Rovy0f3LVWKP2BbeMr2q/GqXj6el70KYeqJxDwiUu2deeL1MOnuggGxrCSh522QPE+HeOqAyC4DD2Ni@vger.kernel.org
X-Gm-Message-State: AOJu0YwvknPrKvQ9qwom5RS2BzyeSZolATNIfCnBWyJ7RbwCrjZpVrbF
	xfuHhIM9lXF9c/2HGdbAugT6mXyuFCUaZ7v/GdGUZ1KHl3DSNhmIfj+4
X-Gm-Gg: AR+sD11XHLHmDId308lPIPihvFG6kxmPPSpn0qyhYWdJfz9NU8qEMPTq6T8qSqcFBK2
	AmbbKGEriAL9nVjoeejDEKroyErz+Abqh/TS+peDA2F1ncgRobaBTnSAYKgB9xb8PS2zt+PGa2I
	ab/EEB0SWNyduTaGAfInkWinrwSAh0awoq9mwnsdnJ7V1fz/b44tY77Vqw5HHcEfZ1LwXgYDs9g
	muorx6tOMNz5394ZVcRMGIry5/Vx3m+SynuaBdouuERNXmcZpmwN6VogjbS9kKxhWMdHviuWRXR
	6MYgMA78CoMrOg4C8pDNgj1dgvmCOY87FHBgAekL+saQpycBQBtK9hKKvuou6JCU+Kz6eqqCk3R
	oQhLJzeLFzJc5OCxe6Z8ClGkIeWEo7CKQLzhIiM7cOStdH71RwqgiishcnOFo7RSMEcTxUlVjgN
	DfrY0vwrJ/NqL97rYq6KfjKlqBkKtIo8MdjgOB7zIIC/fso078DnQESG4PkFZBnYm1ozQN5aTiy
	tuPO3SkxxlRJWziE8ExKOT2Rf7foythbyve7kj7O8d8CIU/KMDrgD3K7xM6vf5ghwkf0A==
X-Received: by 2002:a05:600c:a47:b0:496:bbce:ef with SMTP id 5b1f17b1804b1-4998796ca48mr90983305e9.3.1786796569782;
        Sat, 15 Aug 2026 05:22:49 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:49 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v14 29/38] usb: dwc3: rockchip: introduce glue driver
Date: Sat, 15 Aug 2026 14:22:32 +0200
Message-ID: <20260815122239.65405-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-29-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-29-b5ad9c68fa11@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on Orange Pi 5 Plus (RK3588), 7.2.0-rc7 from rockchip-devel at
ea51774c5c42; details in my reply to the cover letter.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
