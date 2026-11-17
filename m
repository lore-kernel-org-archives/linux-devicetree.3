Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922675;
	b=ngJXs2EEqk02plEK+jiCafeyyq6mIMavlRZFUR6CuNOv5sSXekn5akzJ1qc7YgDZrMWO
	 G/mbEWgyimJOUVPZT9nrN/5+WQD/oe0qArDb3xo1SiTothAW6zOKfG9EZYDPIT9yNrZTu
	 jt49IvobP4ed8JJAYiltgYYadfCpqumxluEFHY2uIMt1KG+Gixpe4F+ZTR0h1SyJ/WTo5
	 r+SfQzmMnKQpIkOOGyP3bTJUtzW7VjuuxmId+PMfAz5LNLTs7JuMq7A6CfX97zL22iwoB
	 IhKqSrYKHnJZh+iO/hu/1C5vGFW+biHsHYZiOERWY1m/L2xb32NULO+/0LLhoF2nE/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJlHltnUqZI=;
	b=ZNnw5v/10VBrO7RCQFSECEgC7eT1VpsvN5asgxgw0QGLLABS2eQVCPGoPLCVkZ+c26ze
	 DieqIBid8zJ/g8mVIwMBKomLOl9XRH9sBZUhQiDhEisr73nlGSII9FlIJ7nr4JAz2I9eO
	 qKjV0/giJHuGbIsh5dHSNngthgzHwJl9hgY+C/eW0SHUDHZmc9HRVHnHiog5f0nsCTbfc
	 Jj/lyTwnWNNnyp5hS6N9zi4mtpS/PUMarqUvs1+ZX1Mvs+Cii+0OUxp5d1AsQkFJ9P6OE
	 JEfzCAWpnKc9GLDnxl4VgdBKvdpOYnBxOjtJOHxMovQPhMaa3kvX9uo6DrZM17KxFhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+7DdWah;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U/JnB7nu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E73606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+7DdWah;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U/JnB7nu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1Fqt198567
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJl
	HltnUqZI=; b=Z+7DdWahleE9zjEReBe+yBqicGp/8SJ25VPhe+igSR1gfb//QV5
	dt64SIs4Eqeg7tkO+qUWxMXx9wXAao2jrCv4kiHrk8SLv7Uh9YR+DLgd/8OvFjPt
	vlRlfymql0SRcE4cL/7pZXbJW8atqjytfoJTzFVwLMCZzku7MjiiXftVY9aVPGmL
	H11XiTr50Qg/LG68uX3dIqWuW86jTV1CIU3J8IuQgLGQfexphBd6LweagIg++9Mi
	Im0aJUQwMkXqTeaQyd7fydAAAfelBU9eViRHRfAiMQCP7j68qs2iC8CFuvfHxoms
	Rk666fHoxPhoRjrJyhVyBbMZimtXPnSjYlg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh9yqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:37:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece5510b79so2316968e0c.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922673; x=1795527473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJlHltnUqZI=;
        b=U/JnB7nuSKfnueK6CQzNzq/H7NCm6l/DOWl7mkxn4n12d+zb+i2zwrYlvHsjd6NYMq
         j+l8RUM39bPscsqx22D3jjSK8ehavrWf5SrmwYPcgWJl6xoEeSZpa4QS2bvbTvG4nemx
         MxUSyxy4VMCYqGhyiP7qUpPheGn7iJasIzInJfv7uyXAUbkdjXcA08vNsnAg17GiQFd1
         qFTW1B+aRyg4M8+kbX41aDKLQG+8Fpf2B549HMz3cYvYwbd37knXf36rYRQZ7bNRSOO6
         tmp+PFJJg8ZnwQie3okisKl6pfuX/0pbtejea8jr99YV6rquW2owIqxFfnxmgQWUxUY1
         kILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922673; x=1795527473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMUvzOZZJBryyd1K93VbSJK1tLOpup9EeJlHltnUqZI=;
        b=OvSiaSmvr0n1b84nd4KAaIpzLmK4OxPHQN3KvSo1IQa30FKmeoDJsIWmnkD6i7sDGA
         Sc1S2sMfkhR6stWG0NIUgnf0lk4SYuTUirb0RhzLYG23ZFGKb+1Q1H0zZjDmnXDvNKxs
         2hRYkQgUUkFIPhMRWvK7ff4mtYLfTrWt70Doj0J7GaZW8K6siDEnUghInjBJkU/05/8b
         As96pdQhNMoZGawm/z20VdFraxz9YSzFrDDJ1WqLY3y4kBdcMpq5wEdCOFGfDA8YD+v1
         Y0ade7NwEAuHt3qUV/1K/1HKbLBvZowcgL8GCkubl7F9OwR/CBH6lCVyoluvg90AURtv
         ufBQ==
X-Forwarded-Encrypted: i=1; AL+hErFmx7o12ZZVtY8n2Aa42IjVyBTGCBWvrWRH+Uk9uE1g1TRX1sVxxISH1ZbGuxBDUBGiTebtzy5lLc/c@vger.kernel.org
X-Gm-Message-State: APuU4Z9G9dvfvM02CD7O3SvpQZdTZE5s9W7p2l2/Kn+AYM0tSlj5Z927
	Toucp8sImHUEI8Ht+LX01zNzSfaSTwcOAdbX2o7YJZKmmYriKm3kDv3IEZjKYsK7Ll3RN0oCqLa
	luIVyTEMBi5zHSdP+KYoEf8J66FawsVY499F6bTPkprtcZmdlg5nO8R2KrjtyJ7RD
X-Gm-Gg: AYBFou0Bx+Bq40111shcJR2dV/j13LsJe/leOUXMXpRqQQQ2jYTwxkFYfEb1eaPDXl7
	jiKyCthBixXEJ32d709NRJjH0gdXY+J9kjNxr2T2GeBIPw59tTK51XjfhaPZYUjejVs4BWLKtAY
	n3IRsY/9AuWBG/1hNR5FU+d32qL7eZu/5yh01XtsFDFqF7ECTrOqVRKr+Tc4liqM2YcbUFgz1V0
	ts74DzQQZtQgpnCQ7C5LZlPIfnIsRk+5d1nC4qJOeHCB0DdazxVgtKWXWhyBb54vCdzORnRE2Uz
	+K6V/OT8ybDi676rQmWrDcXEaO2UaiKK1Z+LP9uWoGKMlLFqKN0Y2DjfV4SBLqlefvkg/TzcB6h
	IrOvcEb+3D9Y9KARok6483E9fsYjpuagpXuoJ2o6Gr41NIMMMcE2sX+ett3ISFw==
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr5204889137.32.1794922672926;
        Tue, 17 Nov 2026 05:37:52 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr5204876137.32.1794922672491;
        Tue, 17 Nov 2026 05:37:52 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm363557105e9.2.2026.11.17.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:37:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@nabladev.com>, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented, unapproved eeprom0wl alias
Date: Tue, 17 Nov 2026 14:37:48 +0100
Message-ID: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=KUARb3HaDROzrv5JSilip/gDz3du0UgzF+jvXH3wQPQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FiruQeX2tTdJV30K4WI1UvRRI/HmlqoCummp
 PBnowpwgNqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxYqwAKCRDBN2bmhouD
 16cAD/9Y32TUYVWX2itfzXqfwj+HaT1mKaqlNLyFNgErt02EbqE2d45iZRm3tYjOmGd7sSfurzB
 ang5KxY/ODKC3zCqv81d4GO9DYSRkmhMe5jPUO0dGRHrTM5gZS88TBRuo+Sd+ZRkEWxXQS2lyW1
 ZekLVtSiz4sNov3DDJVU+3TkMSjPqPRxWlCOueUnwIkBwBqfvp7sqc17AxKSSWU1cIFvUsrBWhb
 /wZ74/0sWzUh8TCXj0R8mRow4L6tcAd4qx2v1+zEsE4mLqSR1xVcHyrUDvl3vU4vuY5kPGC1YuY
 eX6SR/+rBABU5y1J7eT9Ew5mCzwC/lAWVzGfdTPZEutPUuo8H2JIlXu7FNcDo2aNt1lqdOp9mZP
 mgWFTUMQ4Ha7whyHHo0bkzSgFT4snr2Nu2YjHmy5VUtHzT9j0OwTWk4M0QnXoIXpeqLVjA4EIsg
 tp1M+LdQscKlhldX6JLm/qIq8m+5dJ8B9YrbeRFGDbDWfYGJS0hoeke53Be/B+vtSX4wpflQuRs
 FL725hDKrQZpqp/mh/GPXNk79i7mLQ7eEcV4VQd5kxuFlJo0HJo8PNPLNkDjbo0r/KkxuohlchR
 2SLxrA8Wh0a0+A1ExANJ5fnzJxK+YGRgjOg0HxN44xhFZkOTb9BIMOTyAD4KIsbB9subow5zB2c EW+DlVro+SvUoFw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F_tjQD6JzInZH-QozDJdQUnBOMpYVUdy
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc58b1 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=YQ1LzMIngL_xikbxVdIA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: F_tjQD6JzInZH-QozDJdQUnBOMpYVUdy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX6swrOrlFka9G
 Pd92SLd52CIsCRcVQw9iI8s1Yu5vTQomGdhsak6QvEQIak+3jMNCQN7hUtqKhNAYAXHoC5HaU/c
 UspLIat9vpFx8hpOMQSmVj4bKpMp1Y0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX3iBOCJkeStcI
 6Mp+NK4XYxPRYCRR1FmJCsrRM4pAywDK3gAOr7l38y+yxqlG3cjIH43edRpy5XybqaxjLI2sH7x
 QA2HOnW2oxkma+luDLKnURcMPiDmTvlghwfp+GbQkomDKau1NDggmRaR+0FeQNmeiKOJy7SNgbN
 i7qqF55Qax6jWcDVxZGBt3JJzjJ9iQ9hhYLDN92hGqIGf067XX98QfDXlLQJ+6aNn5jZ28L+je/
 HqSLYECgdv20KR0EdVXhTiB8LUM3zZI8Jh0hFBOYs1UPhHUjycpBd1zKkd9og894xyGm7vQH4Z6
 U3EFzy0GKPEDWoeDpqiP37qwMCRmIlBg9n9SGQC65yKOofGYTRFaFJIl+vB6v7j9p8Ki+iQw0QM
 sbDxsB7ddPoHyFlHabrEjWcP9ZtlPvzGj9aCCD/nNe7GyHHQQz6gTxwk0Mvg3AA5s8B6s8OFUkF
 qH6pqK7tVy5NPbWjSUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170054

The eeprom0wl alias was never approved by Devicetree maintainers,
because it was never documented as actual ABI.  There is no in-kernel
user of it, although there might be U-Boot.  External DTS users cannot
rely on undocumented ABI, thus these are pretty safe to drop.

No new custom aliases are allowed for years now.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
index bcf63e2ea989..5795b352fccf 100644
--- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -10,7 +10,6 @@ aliases {
 		serial0 = &usart6;
 		serial1 = &uart8;
 		eeprom0 = &eeprom0;
-		eeprom0wl = &eeprom0wl;
 		rtc0 = &rv3032;
 		rtc1 = &rtc;
 	};
-- 
2.53.0

