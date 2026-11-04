Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830592;
	b=KyRVVByYdW1iKScZa+PEPjEo5Ze5rBShY1GtKaOjRUV3CubwNVU2rW1VDdpzDrZBE7o8
	 tv6LfLmmwLOZZFOk+rSShh+P+V9rfy2zR8xTqoBeLp/DDYzStAgoQmK9SCrCeguGFLrnt
	 1nPYiQUJo13zHop0nPu8jS9OnB1xQg36/FD59Z37nkUIbx/uSfLqzetXo7Zb8911WoTjz
	 3Oy7o0SoQ0T8LXjqtEUDRNB974QdduwaLBsBjXmnBdn5Ln5w9dxtvwAi5d2Nw9uUbA3nS
	 yHxFbcZ8gmUTJEdp3+D/mtppThfHrzNZPgmnN9NYsmLG3DXjS9VHv7Ev5P8TWaKiVtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830592;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=4dUj7qtlv87aoaokSVHZlryaRSMAw8BaqO13OeSv3d8=;
	b=5oRWnwafL1UkkTW8zgkTk+CpWk2vqT66ugJt8vPjQsapXuwD+ONDNeHnebN+AMoPluN3
	 o4BMhKm335P3eCTfcbn9RnNW4URb/7U/OPjSVsLZrNYcewqUpAagkWjzDmt2KEDXT0Oce
	 8/96YIkUiM0GzkjEWbS1ClqJFYBzyQc1jbqLdPPVuw6hqCnhKuBASY4N9oq2JhluQfbYX
	 LJhBi5dqkhs06U0i0DKMp7AwVtgP73cLqVKFjtIIYktpdX0AB8v8TjuGSLXoiZ0nFKFWY
	 xMb+va4lyeWuGOg2djq09CSnOXVh7oig3EqVGITTg1HqKxS4IIF1tSzErzsotuoc2bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABED6072659
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 22:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABED6072659
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso32732a91.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830591; x=1794435391;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4dUj7qtlv87aoaokSVHZlryaRSMAw8BaqO13OeSv3d8=;
        b=wDcRVrrwVneQcCAnCkmnQXPPDYef+FMLlLMtNlKSBWxbg7FiqGQX9ats9btDcCmo7r
         Gaw3Ki8zZ9wpNjXswVGObN+cCCapWlsRTtxKCMMgkr5d2XEgOnD9V8enmZoUW/3nR/aY
         yNbpLQdO3ewPonX2HSht9N6ItubUXOiiWGWG2abXaQBvwc5C5DQhciZr0bWbCM+GKpHk
         JIfXPECXxzb3lLPFsKt5/629wQytOBTX0aVkJtys4NJWy3c7z6QGqqni6m7CdQou7kzb
         2y3JnVbDHJcVO2Rww27xJUztdIQUba72cdJe0SYU5sGsLQn3hKW2BcFKMvtJ5i+XBpLL
         JytA==
X-Forwarded-Encrypted: i=1; AKwUvByOl1n6VjVDFPmtz3D+g86sW+xb6Q3yKfX4NZkpIdU9xb5qClOWdUsTIAfeCyd62YO6DxD7qkNSWWCP@vger.kernel.org
X-Gm-Message-State: APuU4Z9EhEzwq0U1S5NIhMWcP7ND7GOzveCg1Ojk2ofu6hq3udWN0tKb
	5xsoCEwDIq6mUgK2RjqNuixDYO3tyOdU7uR4yrzTBuAupn27tPXXQ06D+remR7Cs
X-Gm-Gg: AYBFou0nnYNXUvXRwyylyMy+QhlxUatL8gQ/6PuxZKhOu6h4Bvsl5lVMJRqz5E95PQ6
	cY5TsHFd3xV5AqjMQsGZMCX45eQHnF11Pyemxua3chTr5BcL7HGyoFAXkUpJvF9a8jTYjgJ5p6c
	SiicSLmtK5lRSatk0ZuuE3MY/PCef8b9wLBrjHXPI4bkkzNfRsOE5ay8p29nywpDj6RfrizpraM
	+zvkkfAjZUOyBHYnh7ODFm9rq6cLeOrps+k3tPmunVOCoYa8JBCwVtTyPuNVPG1vpks86C/i6aM
	/KKbfAhQC7YmG86wfWWapLCdvRBx3l/bmXL+YVfBVVrf3x3A2QYYikrH6wIzWXgLc14uaOhfGCK
	69yTtxu2ChGFfXJ/pxn79p1nDcIAdQplg4Wdn2QLD+f4Rb0mOabADXIyceNu+VtIa91FU5h6g9d
	sHNLMHrUGrE0VZN5ouhBSRcfrbEEhzVaY6crO9ULJqDasDBleJmVpiMd8nSW/Y3OoyeWNvFGSX+
	6VSRonP6OUMRVbuuzNpQYIcFHDqaFqIA5bfi7Z6hLyRRa4DJl1zLTr4xJIThlCRK/g/Es4Cw0Al
	VLd3b4LnanAA2Rbd0urjpgUAgn+1PFCDFhZWdavF63O2NlMs2s4i60U/hu0qiEyssdmSAvgBQD4
	UHRsZqUVR6iu25cCLK81cIbZkXKt5gqF2DfnFi+yF7Kk=
X-Received: by 2002:a17:90b:17cb:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b0afc1479cmr470967a91.10.1793830591167;
        Wed, 04 Nov 2026 14:16:31 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3131f8csm783126a91.2.2026.11.04.14.16.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:16:30 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a315ed211so81744eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:16:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwNhh6kDNPv1fdIuXCMxccasrnyI3WWuPivs9C9QnCqRyjCuN86U753vhskRoopzAYzifrUw+BgDc3x@vger.kernel.org
X-Received: by 2002:a05:693c:80da:b0:368:2c6d:ddfe with SMTP id
 5a478bee46e88-36de5f6f030mr1017112eec.9.1793830585474; Wed, 04 Nov 2026
 14:16:25 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
In-Reply-To: <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 17:16:14 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
X-Gm-Features: AclHuK9-UnITn3qNlxFDVEt7-zpIej_-hzEuMRZnZQ7mZri5SrN5fWqpIt5XJGI
Message-ID: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Please add minimum, and multipleOf.
>
> I've not looked at the code yet, but default: 0 would also be good.

Will do: minimum 0, multipleOf 55 and default 0.

> These values are odd. The RGMII standard says 2ns is required. Where
> is the rest coming from.

They are the values the vendor bootloader programs, and I checked them
against the hardware. Sweeping each delay over its 256 steps at
1000 Mb/s, TX works from 0 to about 2.8 ns and RX from 0 to about
1.5 ns; 935 and 550 ps sit inside both windows, and a 2 ns RX delay in
the MAC fails.

The rest of the skew is not programmed anywhere: the switch's PCDU
register for this port reads back 0, and with the MAC's delays at 0 as
well the link still passes traffic. So it comes from the board routing
or the chips themselves, which I can't separate from software.

If you'd rather see this described another way in the DT, I'm happy to
change it for v2.

> Does this mean there is a switch on the other end? Maybe look at what
> the switch is doing for RGMII delays.

Yes, a MaxLinear GSW150 on its CPU port, with phy-mode "rgmii-id" and no
*-internal-delay-ps. As above, its delays read back as 0.
