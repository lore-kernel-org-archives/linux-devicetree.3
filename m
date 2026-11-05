Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912279;
	b=FILWsuDMcNXBqIhapqZWoowSMmHa+MmHmc4jQrRdyI4c3a7VLLBKmZfZSBgu4xbAW8+1
	 K6+RXhTGe8sjqwUnU3osek29Yq0bTqfSjQ2K/OZA6fSRzia63x7qxfJHkxNihTMuWOnb6
	 t6qvj2kEkH0nRuExKjBse0Ub9C/mScGyMdmrVwi/hjpx4h0BywptwxkWVlYrZ3mbv33vD
	 3Flw+uHBJ04Ade4TKOJc6za3vt4QR1FxUJL5Qd/uTW5qLxIG/JZfPfa5ERQ+JKbQCffm5
	 PzirK6bVumfNPPQY2qwZH/py4ZmXxDBria/Nuy002J5crqOst0FtbrDRyjiFYoJMoNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912279;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=y3OwD37SrGJresbxUK3F5nIZp/tIcgjb7IQgtuSfY9s=;
	b=Hk8dTmckX3jdVsc+nJld/YUPEyk018eGRqXJmJnP1KFvEel04SIAMuWxGDnz5y7ebGQ+
	 h2MB7wmVAxzlNNQjbWrwy0lTzWkUKssyYiWNqQB+1BEcXszG16aGb36xlqHD3FqUc1L6V
	 ULuVauXm7vlCxoL7yjak+7cmg+edSvHJcveuEYxvpsl+IqKAPYMGf+4nNh8UbeY/wFawK
	 Gs3A2WYEjJQ6kHtpNg8rbDHZ3/lxRFXIM/G/ggw67Z+UmdHcxDeBTqc0Yal4uOaUDkqvx
	 CAd2KKNO3v2aAY1L1EECXsAQRslUanQokuGjlGtfAGx3ry6tOk6iUhWWq84965wAcGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4423606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4423606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1558212a91.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:57:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912278; x=1794517078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y3OwD37SrGJresbxUK3F5nIZp/tIcgjb7IQgtuSfY9s=;
        b=xIQZr7ensvIEJ1FfCqEdG8FM7bsL59yOC1vCGS+oK3cOfiKhp3xgJlAM/GSmA0mc75
         sfA9aU7qEb94e0BWw442dLzxLey+Jr56JUeD8/2PhstfedePpc8lgbjnDRcdE6mHubAS
         SAEmN4IH/m0C0gRzdVbh11VTkA17MiXyFwW4RzBu1qP59U+ESgywq37tFfGwfLV33i9b
         PTBEUm89ia+rIOEp2H7ahPww/4NsTGqzyLyExeWH+IFOEihmoMoBOK5t9IKIz9OStJyn
         Ut+6n+lNptty/lSopp+O1YZw2zr+8OsVx7pJJxNcF4iuc1MRNZGs1mboj0cMoZlLwxge
         ghsg==
X-Forwarded-Encrypted: i=1; AKwUvBzcimXck3Xk81pv71K/NYSrWcF02BaRuybz7P+4UBdvu+PX8t5zLgEYpEvOL8ciR8DvF18yew89HKQY@vger.kernel.org
X-Gm-Message-State: APuU4Z9gXKdLkNQotu80o+2hhFPcsuUZ1aZ8BgdCPepGQZjAqQ68CHS6
	JHEjUsgTwFJEFEZws0/fhyHP71sXnZdf97XWoOjAyy/t8yzz6kNA0Bv9i1a5hqAr
X-Gm-Gg: AYBFou1feg1BCi5yPfJx/1r89InRo6MicAdio496MjYpe9r7u80xvk4lI4a2FfVpS+R
	ZVZfbwjGwUHyw+Rie+N8nsZt3cOajKV7+OnGfpMI4o1lMeuwFkPUDN10dCWy1LX560lyTHfC7kg
	ZtUyMnwmLsIpSF1Euhqp2H/y82apECeJiEyaOixxujr7+yNOFRjpf/vingZa4oLPUleUA0QhjmV
	akRkbE7ppmuvts15pKzLtXybE87d2Tkin+NSJuHKa/bDDd1Se6oeJiIuhB5RvfSXZt/M8fZEIdm
	RgqxqB37RRqFWlI0YW295i8mK/tLWXEG60YNfNmmf70XNgj8GuGv2h/nd/3sCyJfwmewjKXxhYU
	XNQNdCFO1e7cvsfLPjglgej2MSQWsEDGJVjW7uRO2NtQsL1YeHAcAP3svw/UMgb0kd9rnfy4QA7
	bXNNembJgeIjaPhHbAM5VK8hRrjaDDoYEkXFwb7Ivk+bYrtm7iG5TDTmJ5ZX9LZlVE5aJcq0H7Y
	s70aBb/lFNtNW+oZjkbmLRT3pq072kMIxtStKfulyocGYBC6fYReALDP326qciblK/MR8lHNL/U
	UyePNlHJeUKLmou+HxhhbvFTR6FBZJOJrDnEU8iiAxtFwKPHZuKICIw4bYTIdjZtti+4DbGOyYw
	fkpNt6Vg2WZWZupD8IfyO9KFpHJMiGF1SmI/ZIaqetusmYCNrO8MC6mBTL48DLK2e
X-Received: by 2002:a17:90b:5585:b0:3ac:a7ee:6770 with SMTP id 98e67ed59e1d1-3b0db60979cmr245814a91.7.1793912278214;
        Thu, 05 Nov 2026 12:57:58 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d77c7ea3sm689028a91.0.2026.11.05.12.57.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:57:57 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36d6765756fso3048971eec.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwSCCLUM4ACAM714T/0srALGXyYIjo/5GU9GHwFCv+CTxm5IxD4o7W8l000HYCzID6+lUiE3F+KsgbP@vger.kernel.org
X-Received: by 2002:a05:7300:ea91:b0:36a:6d52:e16c with SMTP id
 5a478bee46e88-36f75253924mr438929eec.12.1793912277153; Thu, 05 Nov 2026
 12:57:57 -0800 (PST)
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
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com> <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch>
In-Reply-To: <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 15:57:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
X-Gm-Features: AclHuK9hGSAdRKsJYKbyzOuaSV6hdi58LXaj_oUeX5Eo9bGiXxx_BR0j2WjKwyM
Message-ID: <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
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

> Do you have access to another board which has a PHY connected, not a
> switch?

No. The GL-SFT1200 is the only SF19A2890 board I have, and the only
other one I know of, the vendor's evaluation board in OpenWrt, also has
a fixed-link on this port.

> There are unexplained delays here. Is it the switch, this MAC, or the
> PCB?
>
> We need to understand if tx-internal-delay 0 really means 0, or it
> actually means 1065ps.

I can't tell that from this board. The sweeps measure the sum of the
MAC's delay line, the switch and the PCB, and I have no documentation
of the line's own delay at step 0.

What they do show, in the MAC's steps: the windows repeat every 8 ns,
which puts the start of both eyes about 4 steps (0.2 ns) below 0. TX
ends at step 51 and RX at step 28. So with every delay at 0 the link
works, but right at the early edge of both eyes.

Until that is known, how would you like v2 to describe this board?
