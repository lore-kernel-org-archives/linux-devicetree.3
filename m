Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793853936;
	b=yzSrkD+7iFthGMUAYrR2d2OMmOJhVpHh0HycePOBOIPBPkKqWmpIPi7L499TJqYx4cMl
	 FbRKd+pgZ74toJrfmVybXFoDyLP/Zy6xDAc4pK2WztTSLRoX4nik6KRInnK6wsuoGn5PU
	 lY4Y5f8xT/sw1GGt16jI2atCY0+wGWa0s8IYx1Y7aDZ3w8Bzsa+9h/ihyKajl+0nzpH3q
	 auWFsp+B+HAliButaI8/PgeZjXAOTcR7bL7XD3bcWU0p/jAh85b5joEE34PGNDP1yL1bw
	 +VP62c2EI+LucSRUrEBoe1vayDs9QM9oNfdx6XwZveTkTt3a8lk7NBakFjN6Gnlw4Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793853936;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LC8E1JU+xlKJH/C7dKOwhVxP2QcBytjIO6k3NitYgsI=;
	b=3ADkWJdSk2avgXEgUnFeg1xNkBWmLkqiBw4NnOZcVyPhaTcxo01MYyAr/Ha1Y+UToNng
	 bTIJc/mvqM4FXF8X/e+3K1HXsFhhnokvKmpvmItwUV0aGaJcN3ktbl8zjTz35kRL7D7wE
	 rNgsv5ZOr40XsHHY+FU3oMHBOrVgK0oGVTIkt+U6A07KVn5baH4BzsEP3OC5qdBrqY6sY
	 f1flABZ8FufzOxXzP4M69W6wZkSQ2RXTpBLhUSoyy01q/lkVOTGUAC4P0rYK/PHlsbCW4
	 kwCuqqH/OgYeyyx0WF+R+xQkxKj8sKl7SnYmR6M6T7Iu3BQ7D51rn0SBTTO7X7HqRpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79F3606A32C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 04:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79F3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso762924a12.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 20:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793853935; x=1794458735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LC8E1JU+xlKJH/C7dKOwhVxP2QcBytjIO6k3NitYgsI=;
        b=nHAp3qkRYtYSqdCapPfkFrFNO/o4vnqC7eqXOxLyT3Te/Zy3jhCFlNXC9HcMbosq1V
         6a+AqN5N7ae1gOgH6gYj7KXUSi7ce6vU6KRM/NhaIseeNXLORfBfB6AEexZPpgp+M58i
         3Xq5V4AScxZrpruC9p/SVTN2Vhr+RyvWbIBoVQzJYZiyHh2ANaHwdJsg7kMfJV9D7CKG
         SglfJQRBhUXdUzr/vWRRuStmFK0ge2QynmtleR4sCZFqrP52i7bY90E6sX1hWEzVkgDN
         OTOgapthSssdSoRkBJd/nMGyQICfJbdpaOgZmxTsYoxSqKe0pWVg6PMAbuWJVjPPoUKS
         Ir7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMvqcyS9YR1SkjHtLWlHWEuv9mvPHaLxJx00JbQZ+gKD/eppB41PC1GUadpDgtwIZhDV0ccrU0t44A@vger.kernel.org
X-Gm-Message-State: APuU4Z/F5UerIT1HfdeEz0z7WYv6WsL9k/6cBZaCbBPUWa8QF1fB8Ywl
	Fa+zApDUZy6JdPlMni7768sTdzogfthnBJUPlhgROuEDRMiYAUbDXymW7DGDVXxX
X-Gm-Gg: AYBFou0eaa88s7mcujghcempr+cOioJPb4Jgob9d7hscoCydZn7YI3Sd8IMTeSveJzM
	TF4GmyT6mwJ2w/Ny64qERQwrTsRu3KnPMEBfKH1VX09FCcAU8SCcxFUFFknEAbAj/d6y2m4XePN
	D+nv1KFUeuUDpFHW2hyoAi9k4awpbAWmGSfrxl3CIKyafN9DIbt2Bm8p8H1qzIYvx9L3bmJogVB
	P8Mo35oRiKSl7B1qL8TLVxPjKn5OgJ5EU/aZgarsHfYL7fWhdDtDGDmWhXFFfteoejHUzHwKLAZ
	L+zKr/XPvVqh2UNN03zbdbOE0/rwxD5WsE71OtvaJDhB+n31fabec7Ao/jA+/oHMAtv7ipKXHQE
	fImtdswfqlULj/shMMR90SIn4/+QBTyRZ9CxRNvT+wE7qS7wenloAaTdApG6PpITNLQvbQVNMun
	pIFpAh5WAXp8HLA/ucna9YCrKe0a6SNvH5EGnjTToxmi1ZeuxHb0BbFmE4c1HdgIn+CElF3Gst6
	+ESB0Q641xVnJkVk7N+21OzQUh6RvdG+4oAVUv4DvmSjz3ZZbQ3/oyf4qKBFZrtnGJNBpLG1inK
	MAS8uDxqrmcSS4/ONsG2Gfr65sbxgYwZRE0T0Z2dVykH8NxKd/Kw8nomDyGCPpf7aGprVk8vBSY
	fCjC+nbcQurZv9vKFe9MQX7/ZrOJIzrrkvI9KCx0i7gs=
X-Received: by 2002:a17:90b:33c2:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ae897e076cmr13234439a91.54.1793853935162;
        Wed, 04 Nov 2026 20:45:35 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cf4b6sm1712336a91.14.2026.11.04.20.45.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 20:45:34 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a18fc7a38so1180711eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 20:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz8lt/Scot3LohNJei6Hgbf1hPyUhvZxN23qzofw52Y1WFJfpD8j3nBEBu5bEJOJ2+sGz7sKnkEwRqY@vger.kernel.org
X-Received: by 2002:a05:7301:488e:b0:35d:d671:933a with SMTP id
 5a478bee46e88-36a423a2dbdmr26720849eec.15.1793853934050; Wed, 04 Nov 2026
 20:45:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev> <20261104-geiger-handler-f6688647819c@spud>
 <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com> <20261105-cilantro-neglector-a4cdaf9bfb2d@spud>
In-Reply-To: <20261105-cilantro-neglector-a4cdaf9bfb2d@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 23:45:22 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6wP=NUM-vC6vadWk2sgsKV7HHBGzmX59SW_nWFcN6jsg@mail.gmail.com>
X-Gm-Features: AclHuK8dw6v-9VJE5UUbXK2KpxAN1TMyhZVbSc6sgeM46dW7QyrpEt_39Ek2lZA
Message-ID: <CAPY4CJ6wP=NUM-vC6vadWk2sgsKV7HHBGzmX59SW_nWFcN6jsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> huh, I totally forgot about that. I guess you don't have to do this if
> you don't want to so. I think all the generic stuff expects pins to be
> numeric.

Thanks. Then v2 will keep the pin names, with the driver's per-pin
groups and pinconf_generic_dt_node_to_map_all(), so the binding can keep
checking the names against its enum.
