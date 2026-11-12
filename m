Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495737;
	b=Ccp1cawNPBhRcin9lMUo0vm19fIBp9VsmGyA3QEOhk2NJaMNQOkncYCNp0miz8X6NXhX
	 UUCGWj1TkZV4Pqgg/ZCiuZI0lkDzHhQgRnpLL8CW2zm6ppjycNRXjKo1jHsBOXLxPyiJq
	 /c6eKecXcUL/zibgs8x+NOldM94LcZ0vCO+D3hj5P8/+FKJHjzPZzq3lrk75B/qHKnfmZ
	 LZ1XyaRSweE1ZuNMY1KGYWUOqOmtlxVpDBrg0w22KNCZXmtFl39uVnWYZsE9SjTTzXNlO
	 qESURMgF3ICqbQ9QBJaKpDdEBVgzXRJMnjus3sf3dQwczKr+xhNIMJbXVBHlMEgQCow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xWn5f0LXvPfccgqP5IckP9cPc4GfBcu0p1HOXp4x4hQ=;
	b=mHKABE/hRTb7euDTXIA6OTu+kwbOY8K6eOyOrqn9C7HkrP8idIFYfTwOw7d9x38gdIAi
	 cxpeoTCjFkI1dhmo7htyBea6AghR/utDkl47py7e7hBSR8r4a0wZBqrgkrS50/TLISIWX
	 SwLlZS6Bx5dtdmc5x+S0fLNvTpf3BwRyc6/RDMlBlR6lABZFYctM99OeITW14WSlGVWgM
	 erF+CMZQ2otZj7MTDxs89GAHYSX/YlTvEPThlCDORPYY/ndjL+KyW2ORYqpZ6AhUUF/uL
	 am7dHTD95FZfkOWuXrk6xBqUvVw7mMXeRREq8Hc0RylncrO5onsEQd3EM39gE8z15Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VSBgfG3B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXx3m1q+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DF7606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DF7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VSBgfG3B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XXx3m1q+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACERc5o2818606
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xWn5f0LXvPfccgqP5IckP9
	cPc4GfBcu0p1HOXp4x4hQ=; b=VSBgfG3ByO/PT0jOgTQ73/OZt1HMy9/MF91MqT
	NAjQJBrr3b0qa5YC7EvcIPtLs5JJbFiRZ6yxPvUUqXZst9APtwQgpICTwcmv0NXy
	iRJSFW+P83x+XPz0h8szh8r4/2iG1U7K8fzvUU4skuxFt89H6fW0S/LKm+XIZvvr
	cvSzOJ25/0yPaRTrD9DrPWkGlglPSoQvmnwuCM6Brrk0OVmh2bMJqFwBi5ksFi+H
	WKtq8xq4AyB1fX9d8dBXWqgHM+aZK8yPaXaifMSoi3oUiK3mWil57viylPPGYShL
	mPYhNXOPHtVfCYw78FtMAccN3iPzs9TAYfGaXTY8GnrqfTjA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e19hg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:02:15 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99870ee564fso3297204241.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794495735; x=1795100535; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xWn5f0LXvPfccgqP5IckP9cPc4GfBcu0p1HOXp4x4hQ=;
        b=XXx3m1q+NWsNUqDluY1zDk9Sl4qDqViNMn2kr0DQu2CVA1EoZMkcNMl3c4LjrFI/Hf
         YXCMWL5Xfkta65ygE6AKHWbVZDKB4NeeytIo3pA2H9ZLT+SewBDUS5Ho9aLO48JQhfo0
         Zg+Gh6FfDNglQk7oPkPVBosnwLZKDDs6uLmPBB/+qQm/+0JCctXuAGoLSlBNa4nKsU6L
         1hws8bMC2Gjdd3buuulUCMlx3OJqkv8tDveflRAd7wQ0+H8qXKAFaYjqVzS8D2Nde9fJ
         oiEdnTtmtitdgSu/M9skvn8G6f+GYMQcIwY8eKGFNGmw0bBcYsIY5eN5nc+BbB39kHnl
         KGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495735; x=1795100535;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xWn5f0LXvPfccgqP5IckP9cPc4GfBcu0p1HOXp4x4hQ=;
        b=JAjul0PBBnHG9aR4TzuQ2Kq/s0PBlAjCh+VZm14/6ui743v12MC1Nz01L8ko76fK9H
         hzXDxS+2Q6Z/QocQjPu3NUmCq6HhE4Opweo3sXl8SV66iZxePvafIt0Gus0XXMxdpmll
         OoObCdVPdS46KWZXKtRsSLgq025+oNqNsVd221VBoKgjdP0FEiOgZ5yZC+RD7cuJKbXc
         WZ1tYRtbMlz014Oxi+M+qPDDShrh59BhpCYxO9748XD5j5dwMpH8jAzvlAjwLrVdPY4c
         3xtXVfxOGa3++igbVDNN0ieiU4qyui+fotvd8CEzJhyt6DCkzjiHvAi/D5qHyFA9LzPX
         n7ZA==
X-Forwarded-Encrypted: i=1; AL+hErGNRINVZY/sXt4jUJXMBKM0bKHCXsP0FBXmJ046QOkgABXi3v/WykiD9HXS9XU8ppH6lpy6N4M0laxc@vger.kernel.org
X-Gm-Message-State: APuU4Z8dzkM2x9fpm3Fny+TFwWC8nBMW2OTVsd3WDgP3AbkSoqTr6UcD
	O1GSDkJYFJe2MVo/ta882hb670rjiKj1tvOMxZNIst13rNRR5vBCtp9WTgCHKU0Hc1FbhYRYvcD
	no8YPKoGrnjuAGGgjJfFCPGDpOc4JmiRFhtr0zMawACRwh8Ob1IePtHVKSBVp7k8m
X-Gm-Gg: AYBFou27z+qwQSzIQQf+l7G+cMH2ZCAvwqlgDzw1DQHFUbt2bIe9OxbhF3wwLa2PyLW
	BMNVdbOT6e/daDEpr5tnXyXHMw8Hcwtjnq10YsLZZqhb8HZxzo4V/UxPiT4J+IoOJioSSsjJ7RW
	kFCcoaU1zYgsGO20nWmQEqms40k//lP8XcXWrl0q3AX0myGXXAhQ0s6HtGpTEuvdlI/B07oEt4P
	qbrmDT8nh4dxu6h14F+VhVZNnNslVBtUNgMRd3suq/de/355do5afYSt34PqZbaJ52pfMtPV/Ug
	j3eKqqZfzGYfGYiXcCWUt8xiimktS+ZXppUmt/bjJsExsO81qZmE+dRD2EXxtFipvcGQ69kdv2I
	V5GjzU4BVwdPVbQXvLT0wmrboM0p8tMPWPnsXrBvroO9r4q80ThhXKJlNjS8zmHu6lEgG0A==
X-Received: by 2002:a05:6122:a5c7:20b0:5ee:3276:58d5 with SMTP id 71dfb90a1353d-5ee3276714emr21031e0c.5.1794495734457;
        Thu, 12 Nov 2026 07:02:14 -0800 (PST)
X-Received: by 2002:a05:6122:a5c7:20b0:5ee:3276:58d5 with SMTP id 71dfb90a1353d-5ee3276714emr20921e0c.5.1794495733786;
        Thu, 12 Nov 2026 07:02:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm106758475e9.1.2026.11.12.07.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:02:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm: qcom: display/msm: Require DSI graph endpoint
Date: Thu, 12 Nov 2026 16:02:01 +0100
Message-Id: <20261112-display-msm-of-graph-v3-0-7fd0c06ec6df@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNzQ6CMBAGX8X0bEm3VH48+R7GQ6Et1ADFLhAJ4
 d0tePGg8bLJJN/OLAS1txrJ+bAQryeL1nUB4uOBlLXsKk2tCkw44wkAMKos9o2caYstdYZWXvY
 1lSwDeSoTEIUg4bX32tjnrr3e3oxjcdflsLm2RW1xcH7euxNsuz+JCSijzMTAEpNBWoiLQ4weo
 2xK17ZROGQrTfzTBT9cPLiMMplReWpErr641nV9AT0FVxgdAQAA
X-Change-ID: 20261110-display-msm-of-graph-a081a5c614b4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3605;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a5k21sPjS0DUr/NbolvO9G7hioG0EUTtUwzEZTG6XNo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9dTs5tNTAu964+ctTeD9UFyfijhDnNW+6OLsA
 OAGmozIQkaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavXU7AAKCRDBN2bmhouD
 16xvD/9Yv0mSIUagFwLapTjq3aTkxOjE6xtjL2EMVjynsMVBf9ar5yIAEdRzEaSpHUkgDHVLcGv
 nUYzLhgZYbQqytvV9chGw0i0//kvdB6KwABtuRLWMKQ8pLu42Zt43BMWMZxiNXFhxpPV0g/Ap6n
 r/HG7H7F2/vRT7oHap10fIGXGK7TXHZY8Dlm3jwh+PWVpVkGJlt4nnqTHYFugb1N5JKU/D8vrW5
 vU+QCR0pmqhKaYaBN0ZZP8ICx8EWWHLNhMYoA6ypLH5ZPFGaLf4c4D+ulyyd2HSS/HyvTmfwBjG
 SCzXjbksFGnLH5W+58s9IN9T+4eYfqQSYUeOYhfBqXd0G4BgypO/PhKK4lvUETpRzWRUf3Cp34b
 PoanxrLmyfzQUCANNbvnlfPWpeAO3ws2YhdK7bUjb7UaKuNnDggH/jZZFAkmnAvXJlpuHEOjhX8
 kl/jxHckV2/M+ggJrF9cNCHGQjRXJoWEEEs0dNTVbP5+K9fUBNLNL+hltT2TUnJPrSGF+jS7C6M
 z3wu7xSh50f4DGxKew1cMSc3L4IuEGYOq8jqNMDJNlz3RzbbU1zHfbzCCVUSRmU5KGW5Ft3WSJ7
 Hgg6CRoBB5bXAtPV/NU8WIisEmz7IovjU3sdDoULK/0ihJVhM78ztO5wFt1P7ICt8onrUJrK6vR
 Ntp43P+bMY5EPAw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfXyMBk1Y7RPJ29
 aqxWjGSpcFWPzvtdIBJnSF2uAo0tYWQ+2Ty/Px7QDIOmEH8+Kcy9iwxUxA3YKJWleDvrWe+vK4H
 fh6/WjhsSi5EtZFHeok3IQM4H+/wWSya8fCEchVa0EkNIDlMWocr0GUzmZu/kJUjsw3aU2+8fLQ
 mAQ78GzJEaMsueejaTcd8JJfLRCD/cxiL2occ/oEPOBxOSX62P5EiQEc/1WKnGoPxDbDz83Cjqy
 5hymhArwe+CF6mFnVmvYWJh9jQecGBV78JmyRjUtymIGXIFMNa/SP1vYzmMnOMRnooiPoIWTabm
 ZODvWkF8oVd+2mUWxQMQhje/Y65hqNCfrB6owKx4uu5XKreNptvJw40+zSLOLvKSPz4QvajnO9Z
 Ecol2O0Q1dBFB0TJ62FSYGVrV2g/XPH0qG53D3gRZte3ciEhj8/MWv0JrZ7W7N8PJn88RXAe3Br
 IXktzwXaYuoiBWywFLA==
X-Proofpoint-GUID: TKynHirmYp17MWxaKsEILDYVlf-LjGOK
X-Proofpoint-ORIG-GUID: TKynHirmYp17MWxaKsEILDYVlf-LjGOK
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5d4f7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_iFXmH2w7s5zJ4zlvgEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1OSBTYWx0ZWRfX4QgRVlimMw1u
 Vf05Zn3nAAWJsySYRaS4siwnYMDt80mqhSz/C6iS3saCGdutQ7a6NO8M6y+wadK3/4JlKiTCTgP
 qY1tmJNsAKcpK3G6anHaMrIRmtK0kUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120059

The DTS can be applied as is. Then the bindings can go independently.

Changes in v3:
- Add missing mdss_dsi0 to apq8016 (patch #1)
- Adjust commit msg (no probe failure) of patch #2
- Link to v2: https://patch.msgid.link/20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com

Changes in v2:
- Patch #1: Update also apq8016
- Link to v1: https://patch.msgid.link/20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com

Qualcomm DSI display drivers won't work without proper endpoint, so be
explicit about this in the bindings, so we can validate the DTS
properly.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: msm8916: Disable disconnected DSI
      arm64: dts: qcom: msm8996-oneplus: Disable disconnected DSI
      dt-bindings: display/msm: Require DSI graph endpoint

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts                          | 8 ++++++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts             | 8 ++++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts              | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts                | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts                 | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts            | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                             | 4 ++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi              | 2 --
 33 files changed, 92 insertions(+), 5 deletions(-)
---
base-commit: 27b8d2cd13f68ac75f737a6f471a7247d2beea6b
change-id: 20261110-display-msm-of-graph-a081a5c614b4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

