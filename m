Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793924321;
	b=kgH4D7joCir8p+mtlqtKgPc/IrNf+R7446ML1yeSt6Lar2S8IXTM69tFrZkfSjQGqCi7
	 HXD4veURg4Q9oFg5OUVofeokwG8YXFcb2s6G3QAS6iCzbbgbq3tMlGQzWMXcmJg0tAfWB
	 yoa7TNOeEH9SKG5psZa4EtDWVQ0FY2nxBz7GFyTZHZHIqd7L3YEORgEPa2MtbpZDtwDrD
	 fg6WEEJpXx9uw6kJC+tl+ORmJ0IzB+Gs833UFksgeky2SI2JFok4KMQJzk7DdNfYr9EHi
	 7K8tIoI23jQXKQFJXCY37E9tMspWMb3p9xyvkXkKTdGLx3M2a6i6Vrn8kstWvujeECA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924321;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SGxBcvwVnn68G0KUIWhXj4n7e3+LPqUj3vgSEpFFHd4=;
	b=tER3omB3bs4uWj+6uHpz84bikauOrSf7fRj7qHeiG5G92GkDZMuOCgs65IcVjYY97tU1
	 OwuAQ4MzgdCHcyCX7HDvU45SlLRyTRae+Q7TAayokslT1hOe1g0TwmB/5N40ArKeR0xWT
	 Uc2xAa1MjhCb/wbuEAG7CZPMmWIJPxS19xgINmAfdu2jeosf0ErO6Q1kHy3E9wi3OS7Fm
	 CZSNnTW8bLH9WMuWtPq7kvLXpB99If/sCY1H7Ucb7+HZrxEPjzQsAFu6yJl9bmSCJgv0C
	 j+bBWaTSgyfxZyZ17VLYMn/DYeWDxSP22LWc8hu8qOVzbBOI0I8ShuS/CSgAJU2o3Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210FA606A31B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 00:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 210FA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-705cb6cedd5so762837eaf.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 16:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924320; x=1794529120;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SGxBcvwVnn68G0KUIWhXj4n7e3+LPqUj3vgSEpFFHd4=;
        b=CX/1HK83UYwUR+dqwLKKN8j2FpUpaZpn/JNAm/VHcELQmpY8BQ8d5YaeahlyOUcW7W
         mVPSda+E1FpbhdvB6ym3wTddPsaCIXwFAua4QEJlVDLfrTp/dgYIySluHG6f4Hhi2K/s
         BRiFsd57AS4rJT02uwB4QC0RouyHzq1UW320U71CpM/hZtQ1TPo+iFinF0vxY5E9lcmH
         ezUoHMjNB2ew3sd65p8vpIFasPlzEluPU673MgTKfu+5jTW71KtHLVvd5LYDiqgQ0jw5
         qwceUbLXO/1pU38vqWi9k87it5+Jx9FQ0lretCp4TEuvDvT8Bijsvf3pBGpGYAuVKQ+N
         qXMw==
X-Forwarded-Encrypted: i=1; AKwUvBzc85qDFL9T+W+jBgndD7d7JNmK43sWiHnDiH3s+ITKvMMMW9UEbLdE3iNBKUqWOgkEVPZgk0dlxh0N@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rw5e1DxPqJMz6e1l6VB7owWEQLSnI3SUsAe0pVoDAV/8xbWqB
	VKyU9jcqrfKp68C4h6cx0Jv74bIBLlT6bR0MkuNznrjpsKz74lRumcQC3UBWItIU
X-Gm-Gg: AYBFou3QzaG42S/Re3AHNbug5fCIHjC9/J+3yi68Aeqv70e/C4JoRRccjVxiwJM6KBR
	YOrehHeH1ovFxClUxpF2BA/RKeIaaSH0YHPL29RuDxERVd0S9U64GabC9/oDYqTPhm2gDELtG/B
	GeHW8fcAjsz1B6S9H5PEnppGarO/vgzTpcPLCNLbZWQ+3K+LJea64bdUzUk34taSS+ZG5GYbUT3
	qevzRZzYV6LE5R98HYjT3U3xL4yygxvT6gNU3OTyk9404nTkI8/hVbsbMX/ql6xprX+BpI+yFiA
	jK8SQcP6NG8nY2TTrEEJzGxM9nYd8ZI2s/fyZjwYqbQJmJT4mKvPLnvW1Yv3QopmVn/Ben3r9a2
	ies7xcIKRFSBg65e8uJJ4LaHhoMD1P76lwCdEX+NQj0kHhECsqVz1XRmTfv29asEXvQfvnftkAl
	1y2Ewdwa7TXy/QmnkrY9/CgKel4BSSpzza+7g2YiU6oKQx6MVNLuNX/OZnxmhSBDyUP+Nbtha0u
	iLZ2oERwd3xxLyHKNLB33WLN/XP8aOl4WUFq0PUG1BFh8BhCIgyI9y7kwitSh+M8c78lWaN9Uv5
	YU2gtcExvkrF1SbRyMhT4ntv6l3F7ruigUTQvpGBkgdnDnfozYgBwgVbm6sxBZ8TyIRQRkuz8TY
	cYeVHrmHF2iDtmwoAEHV9LpcWL7zGDr8v33kskvhq
X-Received: by 2002:a05:6820:1525:b0:715:bb4:a36a with SMTP id 006d021491bc7-716d20b576fmr2670433eaf.16.1793924320038;
        Thu, 05 Nov 2026 16:18:40 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad973fc034sm668367fac.2.2026.11.05.16.18.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 16:18:39 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-846566246e8so111429a34.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 16:18:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx5k8K1iNQ/KLvHUE5UGp7yGtfwZT0lFKaXzc2t6bcwD5baA3lNI/XDkSciKDajc5urk2VLvMNh99kN@vger.kernel.org
X-Received: by 2002:a05:7301:90d:b0:36d:6a77:960a with SMTP id
 5a478bee46e88-36f73893ca9mr1104956eec.1.1793923970093; Thu, 05 Nov 2026
 16:12:50 -0800 (PST)
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
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
 <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch> <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
 <7b4ab738-85c9-4747-bf89-1a5532af6901@lunn.ch>
In-Reply-To: <7b4ab738-85c9-4747-bf89-1a5532af6901@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 19:12:37 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Pa1T4v6=3K+qN-sJeRivJqGbUeR2svJNcrLHtA=Th+g@mail.gmail.com>
X-Gm-Features: AclHuK9z-s31k9cdXUmtbrS436ZgZs9Mvql6VWlVAJgIq_YcqPSSmicfRgm0TQE
Message-ID: <CAPY4CJ6Pa1T4v6=3K+qN-sJeRivJqGbUeR2svJNcrLHtA=Th+g@mail.gmail.com>
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

> So i think we need a get out from backwards compatibility. We need to
> be able to break running boards with old DT blobs, in the future when
> we fix whatever is broken. Maybe the best way to do that it make the
> MAC glue driver and the DSA driver depend on BROKEN.

Before that, I measured from the switch's side. The switch driver sets
its RGMII delays on the CPU port in nominal 500 ps steps, so with the
MAC's delays at 0:

- Switch to MAC, with the MAC's RX delay line bypassed: the link works
  with the switch adding 0 to 1.5 ns, and fails from 2 ns.
- The same with the RX delay line on at step 0: at 1.5 ns from the
  switch, 4 more steps of the line still work, so step 0 adds at most
  about 0.25 ns over the bypass.
- MAC to switch, with the MAC's TX delay at 0: the link works with the
  switch adding 0 to 2 ns, and fails from 2.5 ns. The TX delay line has
  no bypass, so I can't check its step 0 the same way.

Measured against the MAC's delay lines, the switch's nominal 2 ns comes
out at about 2.4 ns in one direction and its 1.5 ns at about 1.3 ns in
the other, so its steps are only roughly 500 ps.

So on RX, 0 does mean about 0, and the receive direction still fails at
the standard 2 ns. That extra skew is outside the MAC's delay line: in
the switch's output, the board, or the MAC's input, which I can't tell
apart.

The DSA driver, mxl-gsw1xx, is already in mainline for the whole GSW1xx
family, so BROKEN there would also cover boards with other MACs. Would
BROKEN on the new glue alone do?
