Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621493F0749
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995583; cv=none; b=Gc3hXbM8d5XqKZIxeh7Dzb1ByUDGVzzM84l5y4Y/Cz2Ncqfp1Y+Xivo0RIiFlnjy5ooJ5rAJRPmjU+zEVEr1HdLhFpX5feh0h1znEnhTMQpz30dZtZ2hWlC+E+y1QnK3sf41k2+cWsclrMB1EXgGAgC9RwYby9f4CfGxgF7IsoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995583; c=relaxed/simple;
	bh=f5S+i3RVl0cUqmWNDjtmc/b/yyrLqBrgrSpRPlEOqsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uociqh44KNU6SNwEK6qYie73YjMmivtvyFatwm4jo0x9VcwN3R0B63kSz1GWv9ZS1LwTuM/BWLkWM75sp//L1eJJPYv19g6RiDXyENXi7PaZuwd++yplX3HwYJcFOTxZIoMVPaihfg5MenFAGfuaGShfMAFoHad3+T12RdheDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FoU2a38l; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cq0BaCuP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FoU2a38l";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cq0BaCuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780995581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPgszwVt4cFE4ELVefG0ZpctOAG18a7ufhv6a2Zqquk=;
	b=FoU2a38lJcL+uRzIBCzKpXpDGFmXs3dYTyND3fT/HHsakKyRDulzVKDseFNOAZmw7fQ/sM
	25tjuQkN6/ZJagigM/3ZqIWsPSVX9gq468b7evnSkv+RK8ywAgYNELjH0HtHWzsvgSd/QF
	QmIdbyNMQ1wPHr5FgHb+CR1IJG8SHcI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-a4I4oVkGPkiwbE31WoBWBQ-1; Tue, 09 Jun 2026 04:59:36 -0400
X-MC-Unique: a4I4oVkGPkiwbE31WoBWBQ-1
X-Mimecast-MFC-AGG-ID: a4I4oVkGPkiwbE31WoBWBQ_1780995576
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490b37e1ebfso25178355e9.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780995575; x=1781600375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPgszwVt4cFE4ELVefG0ZpctOAG18a7ufhv6a2Zqquk=;
        b=Cq0BaCuPiTvsTF+xmUMsCxNR55fBWyi+rCep3/zJp3Gv30I+Lpr9d8rPdPJ94gMmU0
         AgBekT0UE0aHxZCQ8IR5hruzvwQ8KwRHgO05XM7dsYn/rnuPGydDgWr5wTqMYUb3Sbzw
         kmyR4E6WZ3fYkpWwWoGV5wjLkfI01oTmWQLuIg5BMkIMQLsTEcgitMtVK+3rq18gthxG
         XrRsrQ2AV1fp4AqTKM7MsuVsTJELRcSTYoR1WwLyoVH+bhD3c00vsi2SYuwasg+6WmM3
         vpVzdPxUqLd+H0Zf0Yqp/gqJ/dqsdTeH2CQoGdTOoEss2rnQcf5ooaOiXfaA/Oo3eM4G
         wrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995575; x=1781600375;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPgszwVt4cFE4ELVefG0ZpctOAG18a7ufhv6a2Zqquk=;
        b=cQvOQqdPWwfu4Ki9P3fp291ifChI7NqwWhlsR8o8PEVdyWJAX19ZAtn2MJtXHC/B2h
         r2QMSpFwLnzDT+IU2LMQ7LArBk87RqxbqUQaKCgrQt2BkcCZjuqJDewxX1xlxzd/RapB
         OK3zj7d6AQevHSHkcuyVupaoYbv+FhNwzLvTHR3sqArPdRyxKs9XcJEAJE6NySL5YtoN
         Ab9hsP8WZPsO+koUKsPzqUswrA9eihILFQYSNRYQHpRMSeRjNtvpIZMi+jleqemG2R3r
         LqASm7NODM/Aw18MPGpwKlQHD4hOGLm2IYdyYRzCSA9JPBoahMw64Vr7Z0AIhk9wMY0C
         vNcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JxoTwaT7vFLpagRJBTNCo6bpsSZjA1JrPVz/M7w80C0o31ynEdHkf9304HBvVM30JerIBqhlLhanU@vger.kernel.org
X-Gm-Message-State: AOJu0YwdqmhON63XHS5Zqc1fKMLH0mdN9B9a39o4f5o7SB5lGQVKStEF
	/dp1Ip09k/aY15atgrvvahbcDdZzFai8MUaeBAZbRamk1ANsZKt0s0cueY6WmFjbV94NTlT00Mt
	1LVx880CJl6BwOao158ynpQRn6YL3IgUHbcgXfGTLAsycYXj/04zbX/f2W+LZ2yY=
X-Gm-Gg: Acq92OHvM3adqrNH3HaJ8zpW5YMBr2V8SazPm+oL4cYMfV6SM35wWnRkTEg3xu+0ybg
	zGGH1y7F+1mUU0RM7b+je516aA/3gbg8mWCEExi3sR13h3dl0pC6AIDIMG0cw9gQOAH+nlPE6cw
	QpDmcHWwztckov76zkyFSmRhr5PWTaiPAD0FG7747VB2QSMJINXkA9eE/i4R1hOC2DTmUwcUFgh
	k7KK8FaEtbuhxF+tiGCaovkJSeZjoLmUYk/SskDpKz+oBJJm4uM6Xj8k6697+Xn6EuTMXYQdN3x
	HaMIQ2ZzDUtjkxb4+hZcBBK/GwEx/W/F0BF3haSxuAEAhRlsJw8P7PNvp2uIIHb5i0St6Ct7Stq
	rumRKz5Qrb4VGl6GK3C2SxyYx3u7M1Um8qFyNMDO9uD+/6XlS6eCrSjDXY/Ix7EvcfQ==
X-Received: by 2002:a05:600c:4ec7:b0:490:b8ee:d6a5 with SMTP id 5b1f17b1804b1-490c2589927mr315117445e9.6.1780995575654;
        Tue, 09 Jun 2026 01:59:35 -0700 (PDT)
X-Received: by 2002:a05:600c:4ec7:b0:490:b8ee:d6a5 with SMTP id 5b1f17b1804b1-490c2589927mr315116965e9.6.1780995575267;
        Tue, 09 Jun 2026 01:59:35 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d6c65sm455288105e9.12.2026.06.09.01.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:59:34 -0700 (PDT)
Message-ID: <4e2fb478-1d37-47b7-9bb9-3553d5ca2fee@redhat.com>
Date: Tue, 9 Jun 2026 10:59:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: net: dsa: Convert lan9303.txt to yaml
 format
To: Frank.Li@oss.nxp.com, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Frank Li <Frank.Li@nxp.com>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20260603210929.3099363-1-Frank.Li@oss.nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260603210929.3099363-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/26 11:09 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Convert lan9303.txt to yaml format to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx53-kp-hsc.dtb: /soc/bus@50000000/i2c@53fec000/switch@a: failed to match any schema with compatible: ['smsc,lan9303-i2c']
> 
> Additional changes:
>   - rename switch-phy to switch in example.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Does not apply to net-next cleanly anymore. Please rebase and resend.
While at it, please additionally add the target tree in the subj prefix.

Thanks,

Paolo

