Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074815;
	b=SYTKqzhBbojCtdGjFCAoNftqknWeaGUPkzcgBYfeC/iL1WYIp9Bvo7L/fyd9plfCFYjC
	 IMInnkqFEIi8oklFGMblGurzf93kqHPuP2exMtqXP5qXTy9+TB9tTA1loOa/qUlWGtLHt
	 Mq5gaArwESxyUJ29GJT7gBUVkRbo8IveN7tMCXt4nDE+rzTK6uGP9RGJ9LLAdkSFuAKQ4
	 W4mz1Ti/zetvqWVKbY6IPHXZ4JtPR+JrZt3S+HLfxbjL42PnDtyO+bEbn/WzTHvLmlZRp
	 wYSCbBQ0McB/YV4r+AeRxTbwGMRKXDSsCedo2uOnnorPHSzA2ThuuzQVM/nl3KuYvJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
	b=ofPZCGpuerO8pMUHENhrH57FTsJfjjwoUGnhbw6f5gzvxL/Pt/epRO0JKf3CyBdu/Kid
	 x1YOclQlqBb2QlYEV9mrrjzB5PuXmajapYrfhk1Cg1BC9rIP3hpOLvSEvdne5g93Zo0FD
	 2cWDfw7swy2HXw/QueBaHWIL0Lz7A/OYffLFoK08QczuEc3t0CqLp6KBrSBL+jfcy+BRJ
	 uD+g44SNsMl/src9k3fWQgn33UobPdnsG1lRjs7yq54sTX6R//uTW6SpVsAa5O0hYPLXF
	 xbu3q8gK4J9a6moBqdgB3eeDC3BK7u3IW8mYau5XF69hc6Pzc3A0OljHpl/5c0MuwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SreeR8Pf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EJxR6hjE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4DB606A32F
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 18:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E4DB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SreeR8Pf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EJxR6hjE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7Ht1bX2471965
	for <devicetree@vger.kernel.org>; Sat, 7 Nov 2026 18:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KtXcfDwP0OI37SAv9nafNa
	Chy8uheMzqgS7OX1e7QEo=; b=SreeR8PfOUXFldSESQfVsX5Yqmkvp1ACbfBR5c
	nybxUPAOJHvDNI3VlvdU1kRKc/j2sMU/ae58GpQMhHw0pDCytxxWxAfoEqyEFTwa
	xxfp5J+c29n0rfMa+CwIAPxjsiv2+IuU+ZBtqHaKIPsSXWcYUM/0wT8lFk25e85G
	NrLe2cGzTBuWzH6gW5gZPpWS6tuHAGxlg9bw81b5gQ6cdK/VOhKEC7RXh6y2Dn8m
	cjP1hTRNLQxraD7/VgVwq7MpHeGG9X7Og0B4hHY2Gq2n8QF5d5EhjMvRuqK/cVFr
	O7zSqY3raS0lDW1ySkxUsCbT4/r3gZlS1ZDlhyHQ4J3ooQLw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99h8rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 18:06:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso2308840eec.0
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794074814; x=1794679614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
        b=EJxR6hjEpPTAq/Q9kFqBqHGQ99+GIL2Uc0vI+sLW2oXwwnbkZ8Gt7mx+ZHa1lLtro8
         izR0A5xatBt1crM9igbIjM8Msff0d/P5g3xFvHJsniuaA8XRM+Qjp29Sj60jCMLHdYra
         60Z2ZTC6a+lDScX/3kfKOeOhsZxABh2iC/hWSC/bAj0ql+IV7HruOMuZOvdlPT8D2oZy
         skuQNqI/V0lYxZQAHg2ULO5fYUadFi8u9/laFHsXUG5t8jfrMXxci2Ky5C6r0iJEdWJr
         BE1vnVN86FopAw/3sD/zRA00W4TLdCQO9X4X7QhpwOmbL+dnZU9LOIfHPrwruLkRy51h
         K5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074814; x=1794679614;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
        b=XXmBMDPJ+qyCWIHfLlGQeo1oeYwEL+PS6Bgct7iXJtcv+mXd7QABBbOMYqj0ZTZn//
         ITuZeaYDnn68rJdCiW4U70BkvkEt9p8e7XhFFlCxpdYZgnmEWVOFhYKx43RNTs+55Hc+
         boLEpEMFwJNeKNtEgS7eFAi0qdyJGKFf4a0DAN+DSmQyvEITs2lYpJF+05KdnsyI0VaO
         aBfMdsZ3oMpCTJsMg6PZsc7xrdhoQAmGoBDN25Dp2lIGpoR+59oN9eeAT4s7Iow+ypR4
         cwdhUDNmFQmWm+/kLxwOJ5s/Irhg4KofyHHEIozW9uZ84DjTcLGCbHUdffP2VgVF9BbH
         Mc/Q==
X-Forwarded-Encrypted: i=1; AL+hErHXDHRVkiwYGvdS5ArzZyjlAUF2MoOOUWqBnQRKN5ply6DmLTBDMPkIgKwA4fDDjvC7GXKc+7Oud6jl@vger.kernel.org
X-Gm-Message-State: APuU4Z9bl7vf6LrB9lvjE79C5Y3KoaZCwczRVM+2202DeRhN1VXJRVAN
	zL1Oyo3QV0sZqOd29CGt1ltht6xnal2+aanmNV58XY1+mub3PDhGXhT1NB7+LcXc5jOqA7m4q2q
	vXmGAd67QIuG2QQHf6k12iw7VPBXrBgqOowqTQAIxTAl2x8soK4uuhSibOUMdbG3u
X-Gm-Gg: AYBFou2setIoABus9AHh3Pfr7EEljf0Uy9aoQY5GMWqEjkBihT/uJmhAvHpPfrepyY3
	IDIYVhtqbO+V9tqX24365EQsKEnuudLeGiFObQEvL+krCQ9R4VKvDJ1V5CqCsdePYsCHfpx6/Bw
	y0zZUx9BpqD7Y87zNK9WOn3GRC6+t0bdXX1FzFoADoXDE6dGeaq9KS3TwKidnlvNu2Vl7Ei2wCp
	DAc5OXtoyCGAkBiYXWNw2++lMiyG01BODH/hoK5Qhjd4aOCPL68TR2pkDMJkXhtJzF1C3jMzZro
	O3+6fo6yL8V126q3YeV5k+4k+sg0Dp49A+PvuOj4eFl5mEE/siIEhgxl9MOxohJRl2wth9cTZef
	0WcJsO4QJT48CBD1Cqnfv7Vp50c1nHZAS+lwKHKzZElbUqBQPydeo9WmODkXEzoJTw/DMwFxp
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr8095934eec.19.1794074813485;
        Sat, 07 Nov 2026 10:06:53 -0800 (PST)
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr8095877eec.19.1794074812701;
        Sat, 07 Nov 2026 10:06:52 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm24710212eec.6.2026.11.07.10.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:06:52 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Sat, 07 Nov 2026 23:36:35 +0530
Message-Id: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKto72oC/x3MTQqAIBBA4avErBNS+4GuEiE2TjWbEqciiO6et
 PwW7z0glJgE+uKBRBcL71uGLgvA1W8LKQ7ZYCrTal11akF0bNAdgk7OGPd0qLb23jYm2EkHyGV
 MNPP9X4fxfT86/JO8ZQAAAA==
X-Change-ID: 20261107-gcc_i2c_tsc_support-64aa352d3b1d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: f1G4u-joZP0e4DW3mTiiaI45tcXA5n-k
X-Proofpoint-GUID: f1G4u-joZP0e4DW3mTiiaI45tcXA5n-k
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6aef68be cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=L8zgO8z3qB8kSUkvw_kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX68hmzFRA4vHZ
 sIfd+oxefH8SJNd18QHaFqIrv1dSXQu5JyqO2rHRwyli/WLM3ILjqNuEsYUoYxgm5yfAZw8uIIL
 aMFOJlfNXauYCpWtegw8TcKiuwMeqNnw7kienzkAXUCzduV7WM6waRY9zW3StzrcoEquGWVxS8F
 V6Bw16iPJcYgfdKt/yLIq2UxBC/wjejFYoBASHsmWp2YEXm6/45AQEbF+FZsvzLvSM1u7877wPB
 nuY/HJCu9dyYJMHXisTVd7ex9vVGGU5C003vXmBAg8obIAOe1Y60dnhlEi0GTeTbuXz4cuZFbX8
 ayhEnr1rEd4L59gEWs26AnqLy0inN1Ne0e8pVs266xpu72TeyohKLI342UpLr64lXAVwgemwvwC
 U0UILAaiHpXJOhKVtpwkdvzy/gBu+t2qcLSBTDkdFNt8Sa/mu2U9rSIP0XKcSQEFcVfkb5lab0x
 R9IKlEuX/UH7PQsqgsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX+WDfu+jtSHW9
 Ihw8dDCXF0XbkuV68ZDxqycuGJjaE247UQ7Qci1r9UKPoCCm1Ol1+2ZjR5a3cDtdS+dgxkO3NkC
 Y+A1GWJbvSBhIR4JwEbcwMe0vxWu5Io=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070072

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add I2C and TSC clocks for Nord
      clk: qcom: segcc-nord: Add I2C and TSC clock support

 drivers/clk/qcom/segcc-nord.c               | 187 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |  11 ++
 2 files changed, 198 insertions(+)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

