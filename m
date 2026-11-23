Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448813;
	b=ISJ5FidA6ZBMVloJ9QZK6ouXyL51P+WnHPcBXxC8CD4X4yUNZ4EgcbXWnQUBXSLDGPwH
	 GrHBPH41DlU/zyNgkjbRwuRaDaKhuPE7mNT2pInlcmq3L/BGB85Kdqq9Cq9vmaeNuwFIL
	 CWVr4oHnQYZtrz0FXQbd5Q7nw3MjLbtSWhDwUnLBCwQjzt/2R4LEyz8rrQZs66IjOXYlW
	 NrGOFt2ezbpEJ2Qh6pMwmJf4sS78Kdg6hfXBl9PjW9llBvGU8WFR5w3654MWNefmiizKn
	 4HcNkRpmATNbzfgig0pxc6cb7aMLWIxG5oFKwIpnhKQIQ1rcntqyZtsrlFFcx2hmhLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448813;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
	b=VFT3yeFkgQOuNGGCetodHZGiL29G08X1zTZCFbhHm6B4drQiAh1sCzsQwaCAThFwJfmJ
	 d2C1r5KROPrUMDE1zRnL0uqWdwBzv5hXC1a9LDFrN4NauhsFMhBLpaaaWulrdm7Sb8GSy
	 TvGDxYBqZjHQnBhtd+tpDltysfuidJYwEsGDfDo7HJno+naryNAowhldbWplBg2tefNLV
	 6yfDOuZMQ9BGwjbRWq1qZ+WvrqeVeKE2LeCT+Je8dFCPnQYlSKqtdMWfAfpbspi2Bn2j2
	 zHut16NO5o94d9TZ4wEmNWOsPRIe4XYv3NFEvr4lQwNzj18XyOqdEXTYWwL3Fh/bfNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqSY0Gh1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fGwyLJVd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC43E606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC43E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqSY0Gh1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fGwyLJVd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKxsU694009
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=; b=PqSY0Gh1fTy0p9/x
	thCR1UDcwGizzcDS4cNyR2czaiCliDa+oDfPVvpnWMobkotiE7JwsMPh1N7k17K4
	UIBCZdJi3RxRPSP6idQ7T9twRX6i4l9aHf0G4Gv9dc4CGp419YlccRgJKp3hXikF
	+xIyWDuWjnsWtbAhU7lpKq682R0cEdvBKMrnF4NQnHwjo2dismK+Nz/f/A1c1ZRW
	kmJzENg5X4dEYjIsFUj6bdDgMgN+JjGLveuea6/evWWdK0lLYqGn0PkEo/KQHD7e
	jc0uz96eC5vcpBhJ6lPHYzqnxstppijENZNyJdgR8MTW3jJGFosA/wuZ9AT5Tf60
	A8AZnQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0s3cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:46:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so952541e0c.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448811; x=1796053611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
        b=fGwyLJVdlDoTopazap63Xs3WJ3AVdinWRq8SnD0GgDlOhBtvQR7zW8YZ5V9m+KoZcO
         eDbv7NAQibtKD5paq/4iYLUOr7UuAwsXnZeJm+JKh0mqQlaWb23B/uNOXjCfjf9UI4LM
         BjCc1O2j1z2x7h6xIygsztnsI80lJCzQi6hmY17gWrVTvdx62XHCEKf5F7ZAiretL01h
         I3zbRrfLABvw++UlEsODBycXLfcRWUVz9i2VGj65hdJV+EXJrBbrl5av1tm62wdwV1Wx
         q6wm75M+wih8uD7I6VUuUhn4XFZVvapiV6YDh+8oDOQWUmthqttXImIxPee14Q1qiLCu
         61aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448811; x=1796053611;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
        b=dzQebGTJueZIM8HgNkyANyVfqodgfQvHsNCkRzQsJOpfEsEUYqTN85DbDDCQO45ZEq
         rxAGBq8g7UXrTW3bDBA1Qx10SoqMXR5vwUjjOno4fqn6ShHgNw1jWEpvte6xb6/b13M2
         WyNizN0ojjvFW4+BChBBLyMg3u8s3XkCVT+JhgiBG8rQN9YI3dXXZY8j9y1SaVqlQwzU
         h8IMkTct+vCE5L6BQWy4T20cntUvUhgxaeCa+gB9LvEcj0Hl3QumWF3BDU86Wf/Yj4H1
         HqKLdUjrrqGPG1VVgIqNOEUa9HsmOJJfYLQmf2TR3IQhz5fQEweQCD7SJ78PqCtka962
         /5ag==
X-Forwarded-Encrypted: i=1; AL+hErEOJHQqfIZ1CtANf0/g5WHmbUltxjm2OJPnsniy+kbMjsNc7sl5sAWsZjlUOpdgt+EUw4hB8Su1huD5@vger.kernel.org
X-Gm-Message-State: APuU4Z9shJouC1sqOWBeskWi9PiMgmOtqMlrQRtUWh6AAHpDfgjkLzEJ
	t0BheUcTk23qr6u7O6vMm81WdETQShChgRw1VWQIY6D4fbDPRE4sVY+7VxMaiCvsPpQ2JFJVMPE
	TcZvSsDlGaZM2gAERuef9lH+JnX0G/4deE4fFRI6CtNpwTJdYCh2kCsCocKmuL3lycgYQArs3
X-Gm-Gg: AZFdTZd8gWPKLqa8v1C1PKjyXE0O+NIPrRABSgr9Igk0nNOgRtUsMd82DhciuOlSYFq
	44T5gBDA4Ia6Vg+M0dNr/eTDOEHpSXwHGOeH8QTDiWYEF7UfkLrZA4+PJxN0DImtjbPmlj+PA8x
	w63ff/rgTf7X8ha2dTKbHdfx+/aANYagm5xdOTs28zfXnSGhZoUkcTUqc6rgII20H969CTpPZ1I
	NO/VlkClvJ3hWQrXaVBlB9TJQxSS0syqiDDaZt+z2znQayCOzIrlf0kD7Kf/3CYXkrPoB0v1cwQ
	43iR7MVekULzsstqenBb4EkHmyqoZumT1zsZ/xkMrMWZvnWgAAsmNCNq9KTA7mxUba8Vwj9eL0y
	oiQF5aVR8d/ut0rzD0QGeHXys9rM5UZDWT53LZ/wgDQ0nc6FaVhCDxae+FzS8WgU524evobnCDx
	4SmZGeF44P5eh9wgbDf7Lun1D1l2X3qN9y2p9vrsGyY98tpHurgrh+th6x+yR3Qg==
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr5860598e0c.16.1795448808643;
        Mon, 23 Nov 2026 07:46:48 -0800 (PST)
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr5860203e0c.16.1795448806310;
        Mon, 23 Nov 2026 07:46:46 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm133705685e9.3.2026.11.23.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:46:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
Date: Mon, 23 Nov 2026 16:46:43 +0100
Message-ID: <179544880105.88036.6302106975992553295.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
References: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
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
X-Proofpoint-GUID: QHiLJsNpVMSicDGKbBK7CP0kbKxmWx3h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX2oUNwQ2JhLJa
 CQihpF5oXDaz7TJsmoEJbAbnMDbXEu5/vbXw5pn7kYcCIM/312GG0cYEvtfIxk605+a09wsX9p/
 sNZrL1hj8gqGMZpP4aG+zjnm6fdfJwA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX4ysa7tqc0/MY
 c26Aqb5O2YIrV5vK96Y6prb5ci9AIllSNwBzW9+ZGJqZCE7vR53UCEgKr1XQa2N8Q44JUdeRC4A
 WkH8y4KVRyU905iHFtmArxUvZgjyuLQwZCMD6PUujGFrCJhWNz/qEOQqTavBR9OdUoocf+aw4NL
 Nx/A7MV7UY/XSh9oRPAWux8hVQ89GiNbm8vGkImDUKIWvB5IKBZ8t+m1Vhj5L2n7MBDHfLn/NJF
 EDr6thJY/CwMz5qVfxnxGkf1JfExlakpbUmAHUbdwkyPdlGVS0f4DrL8bcmBEiPnE2iNPSUqB1J
 kQm1l4VX7G3fXBPChFoQfdt0A177w5v/i3IIJeQ/HITaGRHJAP6+UJX3d0aqtV/bGoSelX786dV
 CDA8GdoEfOZEqVW5cYvq3jh6Xp+8XlA0z+LNZ323WAN+qjbYC97ooAMH36WjaUwT/2f8bBIV0W1
 EcgRVnYSRF2+zV2nVkg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b045fec cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=d7jqCbnQutjosXn8mJIA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: QHiLJsNpVMSicDGKbBK7CP0kbKxmWx3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230062


On Thu, 19 Nov 2026 18:09:07 +0300, Fil Dunsky wrote:
> The Cortina Systems CS75xx ("Goldengate G2") SoCs have five banks of 32
> GPIO lines, each bank with its own interrupt. This series adds the
> binding and a driver based on gpio-mmio; level and edge triggers are
> supported, both edges are emulated by flipping the polarity.
> 
> Each pin is either a GPIO line or belongs to a peripheral (NAND,
> Ethernet, UART, I2C, ...). That choice is made in the global control
> block, which is not part of the GPIO controller: as discussed on v1 [1],
> the driver does not touch the pin mux and leaves it as the boot loader
> set it up, until there is a pin controller driver for that block.
> Testing the reset button on the Securifi Almond+ requires selecting
> GPIO37 in the global pin mux before gpio-keys is probed; the current
> boot path does not provide that setup. The tests used a separate,
> board-specific setup step. The GPIO driver does not program the mux.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
      https://git.kernel.org/brgl/c/9413109c1005d207ec6cc3edad820d671c4d73a3
[2/2] gpio: Add Cortina Systems CS75xx GPIO driver
      https://git.kernel.org/brgl/c/26a9a31378673ae7da0f2dbc706e2c72628405be

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
