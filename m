Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906844;
	b=pUkIyQcwLoakngikQslZzEeoOGdyiNGA5eh05RFuSMEMyWN2gJV4Flsbl/zB94QkCabI
	 IcdRYHLIS5LBhnQDfU+XuotkmRj122Eqan4vESTBdf84XpYo1L/e/ytsvxPobKzJD1qfv
	 Syso8idl0k+HgWdDJ6zge26ROaFm53v+UQzf/iYS55A3xWungrq45d7cYPzpRs2taLU/r
	 iuawGbKvxRINSv83VxkdyajO1saguF0TS9IUVmfIU7mfyybKjYxDIn9KywxEpVaYNetbV
	 /2AXGg1HkPZ0/6MH5+JwPhQzH3bjmoR6jRySlcRYs+hDasCtanX0ikq5/J5HzoxAhmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
	b=ZxGarzRI2+Kf/j09y9yRozD6ndPDggeerjVJEOUGf9jl+v7dNai0zcGfzBb8ydmLVGkj
	 K15U7XQF/OhfKekj9ZMdjWrBmepva2CXS3ddwEvqkPvMPUcIjByx1pi3fu3M4Qw+rDtUJ
	 gWumC6ZG11WXQLWD1c3+zY9ljkT/ZqrdwOZVRxf6sJxx14fgjRNFWdNwp+92K8v+dDqOo
	 rFIFgtGtvnMwVQhwrY9To4PUnOVzDBVCK7NHmoJP36eYQ5cE0dNco3EF4F8g1UmD2I4UI
	 /V3faWwGkVLsi3uPzUT7izbv9HKSc1AJ9r1A0IvJLaJ7IF/VrmBoqXz+LqR5S4YtcaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hZVTzDz/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaXqZMR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710E606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7710E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZVTzDz/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaXqZMR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8WtFR3624157
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=; b=hZVTzDz/XtTO4viP
	FrXqnBfgsXE8rhjwexNMBxTEZozKv8tMrH9ZciFDgdjBJeW0OI5F4vcxAM3iAaDD
	hY3okPvDHyjGDImGxeNQQS3iUZ0ma49hba1JTDK626caUjM8zBPnWapjKZfdaIZ1
	8zXvVZh0Wj3LnI+WRwFFkF4HatLVTCXSpkFllwN4YGcGkJ3M2gumTxv4Vv1hW0lF
	v2epjszqr7uwBMeamodpZMdfDmrh6N9WhAmhhnp5Yn48G5YjJ8eVQkyWVeM9OFUD
	71kUTgeM8sW2j6YEq+v+9Ldo53x6nQbrUN+uy3Aq2fM7viIt0xwrA+slYyiTT0a6
	gpVXCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejt01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:14:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131befso542629285a.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 01:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906842; x=1795511642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
        b=TBaXqZMRTpNeSO6OLDFX8q9T+ai5snOlWnNAmVZEQyFoz+bYoleAHGWIgAQvaYDbV9
         NzXKpJz6e76UoZC18oS4AEv0rpHZRE04Ym7cGA6qF9iEm2ylCUUc37bM6MVPoaX9wS5e
         8KLxuHxhtk0JUmWmTLBcZ66eIPwm7tyui/OvBFrvSZhU8O8+CxlJcpxn5Y2KNcnEDrW9
         c8R8tx/bCtSCHByvR2kANqxT+ZSnFn/9w0z+HFTi1kDKhp8bTdLEMQ/15Ez7gCB1C2O6
         OcekxhrC3Z3YOGSsZQD64BH0UqV4dt8rAK6FSEEGOdFgwoJhyjRZCTtXPBixJjc43Zox
         dQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906842; x=1795511642;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
        b=AWhBrHfqwDs5Ym6MBv/JdIDHnLr6AmCGDwe6iryG5o/E4h4WwzO7p6DRx2aJ3Jvufk
         rxJY3YrvUhiXUdR3mVfh+Bvu51Bizisj40Q6ABBypJgnW55VP4Ucn20HB2ao9NZzDVl7
         HeN2tME6DT0t97XryV5SeNlPTsFQURAuBLwMqlmAwOnnvTAoJBfSU7cM1Bn08MA4nbv9
         B81nFLuK0mS3F1wNeUC/XP/LpYtOrizdhqbOuoFFdoZ587AGBAWpnXQux5Yog537sTfx
         +XPP/FXaXKyGFPHbrIofuDqlZN2J130gx0mdDkbRHkdNMPANywkFE+csgTDxMfvv22cb
         ym8A==
X-Forwarded-Encrypted: i=1; AL+hErELk+Fg5SKdrAkToHFMzHNKkqYyP5cmM+n30kMHcVfM7rqDPjObtgSKpawlsr3dy5fZh2boL7dUqyfH@vger.kernel.org
X-Gm-Message-State: APuU4Z/oel6A6PspdMK1BaxZ7hu4iZ3tqsNzfGKg4UiLwrTY6xe1y5bT
	TuEPV2Gq6F0fwBS+8m6GnEhQr9122Z8cwCf5WiXjJNmtVDLOsshXA9VL/FtsTle4t+2lg62dgIv
	KwsCg2Tj6kmojVTMm21hFjsUi82sO/4nmflIhp+dDpTMXbctKFpPq04WBAc5TVKis
X-Gm-Gg: AYBFou3wCefCAiZJglgjQGWhsD2nSCs5ulhD8l5qetQ+QPQb4rdF9umdMInzFr0SPJi
	pOHtNx3/lTVc8lNBY3zzXPcHPiCKiRm7xkgtH+KqoF7EleaOL3k4M9EgVGnyBKEF3ejMqkTjf/T
	9N53L4LVB1XG7XbHv1fhEKie1s67i5R4lGGoGrEEKAfndfgaWTmLDdBRj4RfKhH2rIbwx+UMb9b
	IAdi158ogk5c5dtS2mLCfoF9n/rFMfQ0jnXbOULiZpewdy4cShjPgdFYAgRUskmAhjUn5IWqHyx
	i3mpujUVN95GlhKMlpK75a/ek+xUQn24/9Xw9ufbAnerbZtOEbOtEf969TLw1aiYaOjN63Kdy2l
	rOkCwIpf3KB7HCrS1bwzPM+UjsbeeGhEIXBVpc47U02gjFsEg7evfU/EnCMgtC3h2ZqeNN0CGnX
	k=
X-Received: by 2002:a05:620a:3726:b0:949:6b0d:7309 with SMTP id af79cd13be357-9496b0d7681mr1398323185a.75.1794906841952;
        Tue, 17 Nov 2026 01:14:01 -0800 (PST)
X-Received: by 2002:a05:620a:3726:b0:949:6b0d:7309 with SMTP id af79cd13be357-9496b0d7681mr1398321285a.75.1794906841503;
        Tue, 17 Nov 2026 01:14:01 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4dec730f7sm1177496f8f.11.2026.11.17.01.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:14:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] Supporting LTC4284 which is a negative voltage hotswap controller
Date: Tue, 17 Nov 2026 10:13:58 +0100
Message-ID: <179490683060.18860.17025405055140807603.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX+JB5mKUU8/an
 H+BpOhqN8Q0R5OwEvbwZFuAgTfKyM3h8kHIV04QQWOBbqgRMak7A1Frw8TjlIukk8J/XO41BJ9s
 zX+bjFaICayywfl1F95aJ9mDrqkGVq4=
X-Proofpoint-ORIG-GUID: Qdxe7vt4KYGV0_YJ9EkrhamdAGyoeaSL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfXxhCPJYIvEX4n
 DPLmfE9eoj/V/PLoDY+LEbmrpScKRgMOwZiApzBICwuPeyWYA5vFBb1l1Q+rboRV8ZZXGVHsKO+
 CCSDFFVW+ZlICvID3cpwWcF+XSIgl6hohYfPDneARrauIVGisPw2x3QavgsUQnMpw4urBTL7++Y
 skgSFKGl0zIBLGf7maq7jCkpoGpZCtXBGgnWXd45D6nfIwLICksM3XjdckbjfOjMgF9g1oVdVpe
 Crskfdakyx479oA6smIlVm3YXd+LlxCkgd2N2BhcA1VQ4Yxnn9fd01lKnAOk176oQk1bOVySLDp
 lVPD3dzfoFQ2yResdc+zs75aI/8Yd/zDgnGlpr5tPupT7o3VvNvpZIxSDLdf7gCZJwIYuvGSUYL
 6kXXgv1tSXxYWp+m1eaJz7Gk7Bue39Zcn3I6UZ8KjOrVLrZpOiYAC4gJHsInbmMOo018wccY+O3
 0Nc7hkTuSwwlmzJ1KHQ==
X-Proofpoint-GUID: Qdxe7vt4KYGV0_YJ9EkrhamdAGyoeaSL
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc1ada cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6zx4bRIOlK1EkWDDbbUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170036


On Tue, 17 Nov 2026 16:26:47 +0800, Alexis Czezar Torreno wrote:
> LTC4284 is a negative voltage hot swap controller that drives an external
> N-channel MOSFET to allow a board to be safely inserted and removed from a
> live backplane.
> 
> LTC4284 is very similar to LTC4283 but for higher power. The device features
> programmable current limit with foldback and independently adjustable inrush
> current to optimize the MOSFET safe operating area (SOA). The SOA timer
> limits MOSFET temperature rise for reliable protection against overstresses.
> LTC4284 also has up to 8 pins that can be configured as GPIOs.
> 
> [...]

Applied, thanks!

[3/3] gpio: gpio-ltc4283: update Kconfig description to include LTC4284
      https://git.kernel.org/brgl/c/c6d8ebd7324cefda867a701b4341605b681aa3f5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
