Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152268;
	b=t7dutkB8qnSZSc2Ku9gS7b4vUSskzlClij2zdPakx3v2kDrBbg4NwRUcLK18YCPnNon3
	 bml/griAA51AmvpJTV+2Ri26BYxm+vJUOtZDq/BETrUG59lOMOyXe7+rJdQk2h5eSI0vn
	 ijyNlfDCXwgHGYvNptVR/Ebx3Qn7T2b8pvRSGS30QKqE6XRSDCzvwSYiLhTl+aNPuXg5d
	 saktZJY8bPgsKb1ohX/ET92IC8MlWiFaCgXuZgEVkZtur3LTX2/JSV0gTLqkwNuuCToTp
	 VjeEh3T4uPXi1IaU8oQmAkXbnslkL5XblSH+W+wwZLdpVRskv9PSy+fFrB9JDL1ZXqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MeEhGL9p74hRILnxnbLIZTyexKrQv0qHFAgQnNnxF4A=;
	b=azykq+pUCgi0oQTQhuvtdV+bOoIF1Uj/FGY882nevRy5vrjy8VUHI9SHzqXGpV7NW9r5
	 Nd/95LKowUkjtONBnXZT1DTsFIbiZxRl6t04eCTUdNmx7AKRzQZjQ90ZuALi+Mtjrw12l
	 3t2K7WSX0C542mqr7zrg/ZJbLUKMQHm8NiT8CoADSIIlgJlW8ABww6rE7Jdj4FYe8A/+F
	 VswRifT6HJKllQrLMc40/W11JFnw9DQOgnw5mHeAO3mkqgDDmRUIWnxJV7uaTxNO3NbfH
	 XWvyG3Bnj8bWaSAdTjtRMVilP+kt8UJEE9DX1XToeYanNHRZ0Y8lk3GrfBMD0K7PsHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KIkZ6QDg;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238C0606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 01:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KIkZ6QDg
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2eac4936dfdso829775ad.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793152267; x=1793757067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeEhGL9p74hRILnxnbLIZTyexKrQv0qHFAgQnNnxF4A=;
        b=KIkZ6QDgTd6NH2lqP1JBAh3452j+DV5AwhPbY3rKyqVYzWa1umSaipZOSA0M2AKUNV
         k1tmP3VG3Df2MZh95aRyoIUB/8L7mlJGPIY8fkpdKwN6UYptV3ndWJoPJwVpN22NjKHr
         2t1pJY2SJhnlbOVvpFMp1TEyrSxhPDYcnFjjBu/lk7TWwUO/5JydBh6SXeOEc25bACts
         DXCsZOYuqOBv5SOQDVZl6amZLlbATwsTCHz/kqZJlFqkCO7oAuM6scumTXGXQqIXUNwH
         yWUo0BwRW3baT4NmRmKL+KbHx5FdbvFvjHzcM4TqpZdC0qe8GI4pP9EAP+Gpx32+2Dh4
         cweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793152267; x=1793757067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MeEhGL9p74hRILnxnbLIZTyexKrQv0qHFAgQnNnxF4A=;
        b=V8hCLSANP+0vqujuaFFzHHiWWte4mgYAryb4YIZ/srz46ETCTyTDMGCUe/YrkGRa7M
         F20RW9OUlazgaxGo2TZOlAHn+77F9BgwoJPs77/Cn3sM4cNa5bA4gXm+23VfMxZ3Rx1v
         +UCci4ErLXr7xCe09b/ssC0EEtnvTrbXr+MaZuwK/IXUw3/4fewjD2NnyaZ2H59kO8fS
         JCP9JaeH76ccuijczQYKPG3z/TIr6q1vYUokMcuPE4qdH3hU8bRGCPuVM5Gts16BpC67
         cY/hzxrSJOMEZKzEWqIMOWkCf34x1N/vKHfIXlgtaDgn+Zvt86aRxD7i/Tf2JVMx9UG9
         bOvw==
X-Forwarded-Encrypted: i=1; AKwUvBx/yGnOB3W2kWK5VA4tjwR64n/NP0b5FtH+W0GJNzKuxx9mQikfFcXCwywKstyM2pOJLbsVHlhETnKD@vger.kernel.org
X-Gm-Message-State: AFq9FYLt36+0eO6Lkn3yjPoFvbP3EbJEArk4Ru3DAokIiyVdIK8nmbq9
	PJldOFwC7wyab2pOGNiifwmcZgVmLXaZZuNctyvleku/1wbw+P3mO4Mx
X-Gm-Gg: AYBFou0dpCqZCkH49t7LqZaM7Hjcn4vO0M6UE4ErKlDWoy+6jHpByzycb629OF4+48f
	xhtbBChtkjrMTnQ7u821KVUBBi+i0kl6+1MxRLN2UISimz8s8qzSvcYlO/DdgpG4eDMNiMmyyt9
	d48h+MdQhnGJfrAUl7F6tn5ii7XhN2fwp+Sr5p0PJsG8Jb0cZTx/wGFfZYNu5mui86LD5J301Ga
	2N1YECsGEserxe7MflJV0+mtvCL0lnMpSa869P7GdzVpl/DWPh3iO/cqd8yNLrhp1yEl2nEnE0W
	zciJB3qXEoewH2dVQxLBkIoD+o46G55/OX2WehStM0CZ2kiGkVLecT1j65qXVPFvte7IKjFl2SQ
	sYYifblDvEnl1exTCCh5YtnXBBEJULz1LQiUMqiKMn7OM5FqLCD5laUz5GZhiGAIGz3ojg47yjV
	pNCDGNwQsJNymSyFuSRBxOB4qQAoXNmxqhsDuPcaUBzDfPaaX4Pmg037R6UMs345376kDQS9PQE
	NuWBgb9MsFYSBtAnujingfyW4lVaVKJBT+MaOlNcm9sxNYgLWqfAIeefstFLOlRfSzzyrm0bjD3
	IdU9hD+1zhRqiWcJOybZMaqhPw9dRPKmLg==
X-Received: by 2002:a17:902:cf10:b0:2e9:65bd:62c7 with SMTP id d9443c01a7336-2eaffb17f6emr16531855ad.0.1793152267434;
        Tue, 27 Oct 2026 18:51:07 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c33917sm16066835ad.48.2026.10.27.18.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:51:06 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: quentin.schulz@cherry.de
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Wed, 28 Oct 2026 09:50:58 +0800
Message-ID: <20261028015058.11163-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2a1c33c9-8971-4054-a463-60f3ceddd627@cherry.de>
References: <2a1c33c9-8971-4054-a463-60f3ceddd627@cherry.de>
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

Hi Quentin,

On Tue, 27 Oct 2026 17:03:02 +0100, Quentin Schulz wrote:
> From U-Boot's perspective, I would have preferred there be a simple 
>difference we can detect at runtime and based on that decide which 
>device tree to load between coolpi-4b and armsom-sige7s.

Maybe we can ask ArmSom to write some OEM strings into the OTP of SoC.
So we can use one defconfig for two boards. I will check this method
with ArmSoM and current OTP support in u-boot.

>I don't know Heiko's or Krzysztof's opinion here, but I think it would 
>better reflect the actual context to NOT use a dtsi and simply have 
>arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts include 
>arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts and update the model 
>and compatible properties.

Thanks for the suggestion. I checked the existing mainline DTS files and
found similar examples, such as stm32mp157c-ev1.dts including
stm32mp157c-ed1.dts directly, and the ARM Juno SCMI variants including
their base board DTS files.

I agree that directly including rk3588s-coolpi-4b.dts would better reflect
the relationship between the two boards and avoid unnecessary changes to
the existing CoolPi DTS.

I'll use this approach in v2 unless Heiko prefers otherwise.

Best regards,
Jianfeng
