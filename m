Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.21.61.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429283;
	b=fWovvbfYyu3qsehHRCUjabn3KP//TzSIRlGNWeP3kW2cw/XemKrIzIl/IFhDu1CTsWOV
	 JM8vxHzusOI7cVUHoVGVMXYiWmacTZdo19vBGa0wEmo0VT06aZbR+HEMth8+k3J6SW4cS
	 ikJIMiSnlfu4gEyq9lS+zpm7V8aBFY1ZW17hQPGWkhQtSzuGdH6MYk+XFlpOLZv0ha/q/
	 OgVFGZbSMWD+qnyE1YuHXqZyTRiS/rNJuNttiOwCgKXzblED9ZJFSWhiVzWTp7ol1vRKS
	 r6W9FHZitK0z96y9Bj5XMAFA8o8tD2G1xJxipJRnXZjWo4T4KXDfqNAXT0FNJlmB4Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429283;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=If2uBTwUtcsfMKQK/sfG9dFMf3mJdJUXPWloTYU+JZ8=;
	b=mXoxPj9PAK2NK176jWVGc5nhILwQYyIr1yVoku461JCUF/GUlJ6rgm07E+wS0N8ep0lD
	 NdTbXILscUps2Zru1jr0HgQJ1KS4hZ3T4C3mt3sf2ieUBwVEze9ccUAqxeO9dpefnrQTU
	 34yQu190SuuJCWOzc4ffJXCwLZiOHHlCLQWfET4Pz882DTVuVItyOtYubTZDtEJ7m0edo
	 8ELZb9WlDISNgA17jIIEeSLEpf4aLntvklCWwibcn7OhUSJDjPANmwKzNzjnYbm6Nx/xd
	 7MVrmbGBzY3J53oxPKEDA62JHgflbZz+hUZ3sBx6A74PqfJWiLxBIjtYckMqHzBLZ1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aliel.fr;
	spf=pass smtp.mailfrom=aliel.fr;
	dkim=pass header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=C2WNYsX2;
	arc=none smtp.remote-ip=65.21.61.41
Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD8606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19CD8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=C2WNYsX2
Message-ID: <54fb42e5-42cc-40d2-9e6b-de88c170484a@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795429273;
	bh=5ugiLH8lIxJwk2DYuuNikhUFR3FPn+L3PzjLMFkEA3U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=C2WNYsX2VUK9ubAkdBA8l0eMLilWAxyZlFEc2Qvs2xDobxtWLrufuX3r313vblNTE
	 eXjlth2bTiE2z/VpKnFsjdzX9O+zQ1LxfA3k3i4FSURIvPLl2qiLg0qZL3ces7qJ2o
	 HtKSU5feeEJZ5SFK19lakycAhR7lcjrhR43sDd8E=
Date: Mon, 23 Nov 2026 11:20:42 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v3 02/11] dt-bindings: phy: amlogic: Add Meson HDMI TX PHY
 binding
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com,
 sashiko-reviews@lists.linux.dev
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
 <20261121-meson-drm-create-hdmitx-phy-v3-2-f8f471788076@aliel.fr>
 <sashiko-outbox-227302@kernel.org>
 <2d8dd4ba-26ec-4b01-8361-09e6dfcfa5ed@linaro.org>
Content-Language: en-US
In-Reply-To: <2d8dd4ba-26ec-4b01-8361-09e6dfcfa5ed@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/23/26 09:06, neil.armstrong@linaro.org wrote:
> On 11/21/26 20:26, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue to consider:
>> - [Low] dt-bindings: phy: amlogic: redundant word binding in commit
>>    subject
>> -- 
>>
>> commit fbd4563b5cd10db3f75db052197f808e3b36bc55
>> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>>
>> This commit adds a Device Tree binding schema for the HDMI TX PHY
>> found on
>> Amlogic Meson GXBB, GXL, and G12A SoCs.
>>
>>> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>>
>> [Severity: Low]
>> The dt-bindings: prefix already indicates that this patch adds a binding,
>> so repeating "binding" at the end of the subject is redundant ("dt-
>> bindings:
>> phy: amlogic: Add Meson HDMI TX PHY").
>>
> 
> Use the "dt-bindings: phy: amlogic: document the Amlogic Meson HDMI TX PHY"

Thanks, I will do that.

-- 
Best regards,
Ronald
