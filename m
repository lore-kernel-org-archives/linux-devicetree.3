Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223686;
	b=xBrkL9UTs4p0KdOi/KTJfzmwGGGLi4dVeQglytZzcuhcMXAmVR1W8KS6oSWR6GwrD+yw
	 x3Zx5y9PE269A+wcyzRKkzpio3R8Noq6obTLNHijTRQuR1MnDWEggNDbC22v7ej/Nr20r
	 6uh6fHUcgAj58wiy3HyAiRExAZwC9AMbT56c24Az5+mEfpGc3fNKgMQCsb3p/H8ZqLoBH
	 qINQQ6r87XLmpHkxvAFWATtIKgw+peUUx4JNxGzskN0dsfWcszB7PLhhiqJ97qJmbxYcb
	 BYWCpMufMN/B8De+7Shf9w4kZsQTMRwc07oyN5GcKiy3GEjbFpHdNo2rf49A0Dq975g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2LMtwY4C6aN/KxUCI6Jkve194w5hR7FNmxTLTEyuVxI=;
	b=HkLjfyiMcu0fJuU6EB9E935GY/pUA+WndMvy4xsJTFfdlnXPdQlPcxpn7JImynwWpE0s
	 ph2BS4Gcz/eFTFzIBkyl7pecOXItITO4Wox22Ri9qaw0kPRmgCCKud/oo1kYdPiMk3t0e
	 QGxIxH5cwea+u5a9gQ8HSfupouj5JJq5JDegDEjNubKbPA8fRzj9q/2PemXTP/LLX6rwG
	 HpFoeGSGlfYbxQmOb5hJjGtOYo1vIovP5JLsHN+b5kCp/AgKdpvC+GTL0OkPBl06hSP9z
	 r1hj+DFOppp/3pNoyGvZvoDMaPKilB8reSMBSosDBdYt7Qik1oaa7cZtKPBwqR5IwhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc6BB5CR;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10B1606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 11:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D10B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc6BB5CR
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso328182a91.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 03:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223685; x=1794828485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LMtwY4C6aN/KxUCI6Jkve194w5hR7FNmxTLTEyuVxI=;
        b=vc6BB5CRIrMO/AZVgRPJBeu5l77MBy3l8CZmAjtmis4DyBj9tbUsRSyWOAScOK7oSv
         gtvAhlGPbsPwaVdqwE1h6gg4r5MMCwBRhxaSiwwseEnNN8dSNWUdQcDUflsamjhvAVdX
         cnbuA6gDEvmdMEodxRErhxFr4imlufV0pRnkhFRI/haVciw5u22bXXG6qXfCjetVsnxa
         9UkRY6e60R+kKgE1aVsg0eDBtHpcT8iCyZYNzvC8Nv1WhEEyiXhdSg1kqopCwUHO5sjE
         TeEZDIJmYUTuYO96mLXakj81kLRmTCVT8wJ6bbj5+P04VygEQeN3Vft/WU4b2BF/BWW8
         +AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223685; x=1794828485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LMtwY4C6aN/KxUCI6Jkve194w5hR7FNmxTLTEyuVxI=;
        b=c4Bv6RUryDGaOaEPNYNkag2eVsgVQI/KaUK4nVs+LuBr3JYEXrIYrt31ROqSX7I0Wx
         E7vdsRMg5+Vy73SUbH3jL+gmRoLYVk5a75ARTOzqnf/ApuFspcfUblfuje287TnjWvno
         UpOpp6/+b+uf1afaNUu8tzVoYV3I6fBlG+jC9tH53bTghQ/e2CFIINIgnJ2kIhxxr3nt
         2KXBwOei2nawLcs0zEjL/IH4X80YLvYMpgSkVVHxuEOEPW11rwNMgDlt4dWESowkfxhz
         cYm8ssXm29OrWFAsXA0nIGMXUADxTra8+iEtFFYVNT8bgvr5aKt0CqK0ARKYV5D1Ftaf
         60yw==
X-Forwarded-Encrypted: i=1; AL+hErGlPccLOncsXPt1YlLu0rOrCbBP3JpIVxHqFAEolwTqquurYHXGrw7dGVDb8eTBX3SpNpu8TP1GCmno@vger.kernel.org
X-Gm-Message-State: APuU4Z/1kf2Dw73B/POiT7BeTFZXdYtnKQuKehOTLDKkNFqmu/8S2vlr
	WCI636A+HL8o0WeuSfS9LHJ0P0qFN1UOIstpCzgnGxBvNuwKKPfkjFRP
X-Gm-Gg: AYBFou0+SADGpA9/dRwNx7CKnXL393WvPdjXxTZo83oGa3YWQLpzhkGHv0VmsZHjujw
	eo7iR+R+/OKkHEyxPhFaWJLoc/oflWRuHjnU2nK+ybiHA9hjwvbGrdYJZTGMxipxTXbGVvrwxZ3
	anZRMpMc2dTCYJuz9/1ScnFMR/3YvQ1MQWoKrgvH0CC1vro/jkXp72wRQFd+UDaka8FgPB2/lCw
	H4CXPBCfWkzU5R6OBJ8E6ogOknQGXHNadHboCrkB5UIBt/a9DsL1kG7Kufr1gZZNSp6ZqGmG6AL
	xF0pPxZLvXE7NDGU6x9nAIHk8fnMJpw6W8t4D4U4//VKU7ODKdE5tY5jopdSbUxnS2GQZI5iUpm
	WQAjPAeAY5uFjThqEVb2FpQSzzguKKtOpkgFt4N7B31FaPPFMUnU8pdMJMLH4+CrJauNF4dzy3A
	WKkWmjhMXQ+0lI9luDpOWp8Az71sf7TDGgiwP2FJRU7GCaOsqY+AGEGdme6lpkrvCrJnwoWU0uN
	oWHwB5uu8Dh+vuMhWv9nX/pLnRRGutnR1g6uJL3vTnbPnFtIIXLgMLmugJMrbtJ3Bz8HNNmRyJy
	ZNhwd33SPSwJdx5xp57fhQM2k7S/OxpOaw==
X-Received: by 2002:a17:90b:4d10:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3b12d570debmr3765652a91.63.1794223685119;
        Mon, 09 Nov 2026 03:28:05 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b1fa8sm10766340a91.2.2026.11.09.03.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:28:04 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com
Cc: sdonthineni@nvidia.com,
	james.morse@arm.com,
	robh@kernel.org,
	ben.horgan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on DT platforms
Date: Mon,  9 Nov 2026 19:27:37 +0800
Message-Id: <20261109112737.1081437-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com> <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
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

Tested-by: Ping Li <leeonion.muyu@gmail.com>
