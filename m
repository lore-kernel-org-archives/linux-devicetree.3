Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806880;
	b=vvh+GnVYqAj8prpH+IXDzW6OcSJvdEiUxL57cSN4qMi2gLgnJJOo3XoFewO+gjdystyP
	 hABXSGrY/8l1MhUjfKDn6v0Z2/lwWhggtWqA+tS2ZpsMKxT5N5s7yKhWlS0CkZliY8SBA
	 aMBErRETS/0TfwJBmdhGj+ad9IfODwpiLpIGj4Dnz3E4GlqKFR17po6mhvdUDCp11b3Ok
	 IOENCL+ROQYCc22JMLnBako43coO7oVYudWFEiQB2ZbYBhWbfS/lySRD+DO5DAvNYK260
	 bfwti+wzu5uMeACVfuUKU73zf/Q5z+CZ1uW6GQFYTKNrY8Rz2pou2vs8yuzZ6M2MToA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
	b=QHEhBD4+bbWxsaapif+I2K8XY8i1ul6qI5xmnesdQNqeSduZUs9XuuYWFTLOGmB4SXZv
	 A7E+9DVVU5WAd7BQ6zmlJjSE7Y03wlGQG0eRHI+VUOAPgtYWauycasKl8KngjJ8Ha13G/
	 VNy1hAfT3YPbn1cs1AUrVfZtg3MdORVkjR6GNoiYc+8fiLoRGW5KV7K3jPgvDWnUOxmiU
	 v1MQee0p3FmsdOVt03rApULgc0amuiEIAMx9Msqr8Xj1Vzu5+BOFd1uuhkedRv+t53dpa
	 OtwtVoS9rako7iJTbhX7ni7sOjFvp4uGIgG4ZwehRZd7tPTuGvUSwFPgKhGNTD9hzVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hnu0e8Ca;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRQh3tXW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD025606A331
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD025606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hnu0e8Ca;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRQh3tXW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LBHA795956
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+weSNdgV6tyUTxoHk6wCxY
	0+uFMGSPWr+uTDp0Ozmq0=; b=Hnu0e8CaUWlDnfFFRPHUq5eArNphCs1EIWdpQu
	9Xq3HonxFTlBt8kgDrV1w3cPlOpIHUC9/ehVqHV4r/yKKcuP5MVPesE2XAlZtOwV
	WZlOgTvtisKbrAqvYhEkBXt1yCKFs1vb/gjPy8hxOazAv7YUud4Q4v4NHgg5VM5u
	aiYQ2K/ZcLPjh8OcmW+U/CciXkJ7w7R+1JBhP1e9G7dtnfoA3K8oxNEkT0BWYcIW
	SYc/NOirU651yYiGlGchxcF45D9q3zPTpALOqtcUANfDZfNinZlYbYfNgkpgNiBK
	yAmI6m06HV5unUFj7MPiY/c/0nOT4sz7gD1KpgI2UUun4KeQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc0khs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea71803effso26965115ad.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806878; x=1795411678; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
        b=gRQh3tXWDi19GaaY3LckQIvctxQqriqHApjB5+26o7s/OEBIYUkCAoRF5HRDCGR0te
         iYMFa1xg/Bq1VS6M3Sx8xPOrE8EmoKc1Dj+vDxdKJK62LIsMuEp7tUs0OhpIpAIVqA6K
         ly6JxBZ0VYCoOqCvYMCmc/6CHlm6LTeczDwjPz26yoIpyOEASXnRncJGvhOeX3Larwx3
         BJB/CNsszg0EehCB9huTGkhJ5MY6AjGyHpqIwhQsV6BL80RwlbD4GdPPd8+6nNkTpk3D
         gd877+prVfX2oAUPqd6Agf/hlxkL9xh4+y0aoGAkqmTzHp9mt1G9Y/WYYiG+6LByQXyx
         CYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806878; x=1795411678;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
        b=Et/MMhqXWZmVaTg3cZ/Pesn4eT3+1dzfr/51YeJuPA66vuUR3nN9idsLIXGR2SLyao
         JQDnutT3I5H2tUw+Gu3jXC3FQQsH42MUSOWHxJF31LBauBT0s6qh27EKudwzQIni0Ojx
         BsyyrbvcuNjapTP1+20sKq8W/c7ivxImhx0meuhyWeNYZCKEw9L1D1/yRAGJopSfJver
         k1L4npQ90L14l4FQUTCdUXtFo7ezuQWnzfwbeQEyzlc4SqcUl4e3PscrxH/iGtJIVZhk
         x+0BMKqA2dXuZ7tHrYKDfGuZ/5Pfn8AN3nyvjn9v3xAtvDSezraQTaaIYLe0SCexHk56
         W6Sg==
X-Forwarded-Encrypted: i=1; AL+hErHV99kORKf5xl+VKS1gpoFrXas44f0RDwGQ37Y2qldYpk5WDcL3UtZQSk8wtJ9HzhF4S+8ZgcaC+V38@vger.kernel.org
X-Gm-Message-State: APuU4Z8iNxnOSx5zOY0r6v1dX2cNj99E1L9KVINL6+G6G1refcVIY51n
	MGZpE+KwoBAO/4lgxxESwLboPbjS022d9gQ2V+AHVKt0c23ASZIGS9du6l1st1EAcu4E73XBPB5
	LvU/mNboZUV/3NWEA9nReZNrE6xI49xuWs6DO1PckIuzYGF4kKUIbMpyDLjkpnI4haexFgEnK
X-Gm-Gg: AYBFou3Rz139KyPd3OBPs1wBngjxVWw/AevEH2oVwRLymyrhWDnmOA1N8SMQlPpZLRZ
	vzkVCZjlXmQ0VONLnfQ63SZHiiNNMtsKDdAzaebZTg/mZObfIgVcQ6kbu3L2s2T5AMb6YrGYHRD
	CTCWSh6Wb0ZtzN6KWn2BEuZ1dZmux5gihuKkjg2UlzsOyQ/61tmE6O6qrKMwUVgMQBRf6Gl6yES
	2+UnAZ6AFIaa+yeraEcoj3f3H4W6SAs30LhZNsYOR0o2RLDC7ZKaN62WjZ3I2PZSDSd9VbDhzhi
	5WMhh9IIe5qoWwIdsxD7eCYa4hpsz00oa/OpJoMGDkd6b2zi1Lyyy3f8nRBIwL8MUj8AmlmPmV/
	UWUD5+XeHFe+fnV0z5X5otiBFn1A0NGgyz7WCWJ3izhJmDNLQeeSYrWtyzA1o+oP+9AUsAG+4eg
	==
X-Received: by 2002:a17:903:41ce:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2ee0dde7798mr94023315ad.68.1794806878442;
        Sun, 15 Nov 2026 21:27:58 -0800 (PST)
X-Received: by 2002:a17:903:41ce:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2ee0dde7798mr94023115ad.68.1794806877971;
        Sun, 15 Nov 2026 21:27:57 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:27:57 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
Date: Mon, 16 Nov 2026 10:57:43 +0530
Message-Id: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+U+moC/x3M3QpAQBCG4VvRHNvyIcmtSFprMPltp1By7zaHz
 8H7PqTshZWq6CHPp6jsWwDiiNxkt5GN9MGUJmkBoDDHtbZu2d2srU4ye2uQJSU6IEfmKHSH50H
 u/1k37/sBvwa3N2MAAAA=
X-Change-ID: 20261116-pwm_clocks_shikra-13081b11413c
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX1auRuIcuzld9
 H1LULOCASjICfX8LlsDIuOGam5xtWUKOlwMhZw3dGJ3aiOy49N4CTqWPKrXjxA3bu95jn/Zjd/8
 UAFjHcyYUYA2mgZs0qcyrv8co0VssBI=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afa945f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=P8prvrSLuabxu7ghDDQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LbFdORrltYM57Q9rOHKdV0Q4UtoU8RIM
X-Proofpoint-GUID: LbFdORrltYM57Q9rOHKdV0Q4UtoU8RIM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX/ba2a463inmn
 1wbQUwshOBoFz75R/djK6pTKuZXfK5at/Zosl1uyEdp0StK6d+KfG+o1s/GzcoGrEs+cYLqJowI
 /PdMlU4/KPIykQbN7m1WW228g29+O33mtsxxJbcR4fpP7dlidEX1wllUNczi+uSTcQl5E7f9cFH
 ZTQqrKEVyNX2ZXqIgeIbjvLHro560lQCFxtZeng/Xjn19pOn4nPqQytaoCd6e4zrYEvs310yXjE
 yIWFnyR5yhNWNyyylzYP17JMLGMNSYel61q6VtVaux98aQfLjOmbhZuBZhCl59Pi6a4oBDpkQQY
 h7xHeVVi4Ye+VCvymQJOBHr/OxjhugyxZgdgCBi88dvWP6tIPTVurp2pHjTlPv76w9nqejk6Nf5
 NsRcBvGxppoXFH1JCt+iEFBz3hOoUUZ/3+JrsFHQW0bPZmTCESCfYJOtNy43Ai/e3Y7aFJlDpVx
 CpFlX7eQSALO7JAnFVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160021

The PWM controller on Qualcomm Shikra SoCs is fed by the GCC PWM XO512
clock, which derives its rate from a programmable divider sitting
between the TCXO and the PWM core output. Model that divider as a
dedicated source clock so the full TCXO -> divider -> PWM output path
is described and the PWM core rate can be configured at runtime.

Add the clock-ID binding and the gcc-shikra divider clock implementing
the source, with the existing PWM output branch reparented onto it.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: add Shikra PWM XO512 source clock
      clk: qcom: gcc-shikra: add PWM XO512 source clock

 drivers/clk/qcom/gcc-shikra.c               | 21 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h |  1 +
 2 files changed, 22 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-pwm_clocks_shikra-13081b11413c

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

