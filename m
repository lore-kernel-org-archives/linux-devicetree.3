Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834330;
	b=sWpVdVlt5qmaUlQq+H5bHcOo/X05hUTx+TC+lyWGRFwGIkpgLfGxpOBXAmee3B0/rvrL
	 Z3XokA4F75UbriM04p2RJ8tS5+tQG9BaIm9G1X5ro6zjTL8qeWSSb1rSeoat7iG4DaZKp
	 sXGNXlbYXw/3S6VZTb+NWc8VzQtlgfV7CPesN0U6q82WPiIedZwqEEjQL6zkQ0FSRSxL7
	 TOiRq0zLbL3RW7Xl2RvagNCUL/k1so4FdTSyTrGRVko3oP9tWfYW6dexTDScNGvrjU9uy
	 GgbLzteuZsQJyzaGN4HUP3SHTctAqhxFQ7JtIm8vaTvljt4LfuEwPKhRGYxGjrFjIZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V3YUcBNu4=;
	b=OR0QxPLyVoFw1iDo5oF+sHYJGxXFGer2aATyFjUgEGe9LergW2GU4j6bTiQC2VtBaFkz
	 O3UT+RYQ4oSUgiYe3vvR3byvn+GwEr1J7OjD/G3odxKeNSP89dDpzHJEmXsP5/FQeqgJc
	 +HsrBDwLI6ipVG9ZAoPnEwkAhp8TFoRhydjF7wwp+Kp9tHH2lxAerS76qgw2BBkqDLnvp
	 aCRW+X1QrO5fao/I/uBW0IN+ItroVTwdtM/uXBIa2XhWZve+x21Fn1B7KWpv3R0YT3yEa
	 FZyg8CdxNPUVPvATIDig3CnLH8ebMGowR982RslpMHLguLnI8TOYX4Fq3Wb2goTz/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPyvFpnL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xfc1Fo/o";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A5E606A339
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A5E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPyvFpnL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xfc1Fo/o
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0nka1482579
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V
	3YUcBNu4=; b=bPyvFpnLgRKyROklELXNtZQ5kZezDQv1LObub5nqvucMHSGdO28
	mlwgUIXfsQ+t2SsrtcThzu9ume1EG6lshdi/LjOQcG1+onKmWL5TwCnDQeJcb3n+
	YYDALBsiH++ac/hT2paGFJfGjqP/G0FZm9jXbXAjht0KzuqTZVrCdWztVGKecsAX
	//HB/5el62HwqZIWpahyZvSbDhpbGZaW4o11S/ulfK3vlAViGmvzkYrIXQu8cirx
	WU2O0C1c64FNMhmWOZgDzNAwSo2DgVfED2i00nB9pkVcLbx2XxpWOXQPoTKHtGdn
	qkGXJhaEr4+DtakrL/5Xz2AD233PBX0iueg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgm39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:05:28 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e9eso4269214b6e.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794834328; x=1795439128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V3YUcBNu4=;
        b=Xfc1Fo/oSW8NVU2lqDz8umoMtSKlSPD/QCYq9VXrPvPnMHCUwBbBtHcmP7/iVpTOoI
         8BHxKBHbr4rQ2DUIyqKBP9mMXcYp+8t3VVn/0PleZN5xzEvozN5KE/XdUMoooVO0lkor
         Apz0xaxKjvMOAj/SaUOlUfxGyu/+W2RXldV7qAM0I8STu6UEXNqlU5q3z8lbsoCXtru/
         HpYoz2keKF1E/BSH873Db//9smYhWm8XB8J9P88thRUp7X/vIDX/hc0S/U6Hs5c7T13f
         KnzaAFdA1Xg8GmjrdYetlz1sKcdJGv50OTwBVEvglhSohWu9U9uLAx9ti4vIVwlHiaWf
         dLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834328; x=1795439128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wl/Ip32Zgsant3v6MVKw4Nx7EiStTie1Y8V3YUcBNu4=;
        b=R+mJpXsfsjZiJzycq6WV8IJHmLnC3tnuwanH/rqMgsTkb8OOJ+sV7qkn5ThTFwpkmu
         rPayy/vrDVBylJsV30jA3w5PtQwjoNbzws6dAEAxvjBo7UGtBweSv1qqrqJI17H7l00H
         Vlpqc45vFNeGOJKuH9yu7RQdVkbIroAnNNelcoe7PgOjDHDGJ61aYvs28GE8Jhgucvyo
         O4ZGz5QZjST8fzQleWiF+08A/jThapZKvCzxF9s1qEyOwWmPRwukHG8qwwxfJcfUzeOq
         C1oMHcsYDXubfgCNHFA5SW0ViK+L5nCLyGY3BrYRizO/DZZKSSYVYvA3JNq/YrzMSvWv
         Nyvw==
X-Forwarded-Encrypted: i=1; AL+hErHyXq2Us43NdhFsqyZn24cpNou/qKkPs9yQnpsavkTCbxjm4Cydvmfgit4hd4cO5L7/dOICUB5bjnDm@vger.kernel.org
X-Gm-Message-State: APuU4Z9QIoXUxO/pUcxxMRDyMpKjlKqCmO2txHm+hDvs9zJsuLBqhhCZ
	kERFhNEJ+cRWNYkb7E5/Qu683WemOOP3lWPs/7MXkW75dN4t9jNox4sNUAnIxYuilhXeNVlcQKo
	3xU/KOQMTmIL2Ul/Jn8weRUuQIxMb1Ze5piZUZYWabLZXJSoNz3t6dzYADhPS2hiV
X-Gm-Gg: AYBFou3gAqsj0ub5ysVzb2WF/gSuHBhlm87dld4B664iIfrkGLRxhg3SqB4Y8vM64//
	h6sCL2/Hi3mQBa3YsXsG1kDWl8esSMOAsIjsH4gLFiHzX19+p3cKPYWEx6ABOarDXKaup1xnP80
	8H8JiyD/FBTqT3G/3mNfxRzL081OP9vbcK2jJI4WpYgR0VOKv+d9CPPepMglehU8n8jRsv8/dJx
	+69OnCeQe++BYOpFUvRr8f3cWge+UOo4FfuiQm4XsGRR6wrcI9jz/oATMYawp95SXMMwK3fpJE5
	k1AQgL4C63ry2XdFZqyyW0x5uJS28NNogs8+HS3JXKfC1/juj6Il8K7iPsy0jJdwaqNdQX6gUTJ
	0hf/vYt7DWf+MAyFN0YZBB+oFCR6FKfVpUyPRuhfZyCoGVpMDYr3lYJkxIKAkhJjN1HV2H/xnIK
	Y7
X-Received: by 2002:a05:6808:4fce:b0:572:f1d1:d6b3 with SMTP id 5614622812f47-572f1d1e88amr4376809b6e.21.1794834328022;
        Mon, 16 Nov 2026 05:05:28 -0800 (PST)
X-Received: by 2002:a05:6808:4fce:b0:572:f1d1:d6b3 with SMTP id 5614622812f47-572f1d1e88amr4376778b6e.21.1794834327578;
        Mon, 16 Nov 2026 05:05:27 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3eaf6sm9895641b6e.5.2026.11.16.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:05:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 18:35:18 +0530
Message-ID: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afaff98 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oVCAav2c3y0N_-OfdZYA:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: 4dSjhJvTzAg5XziYPmchEoLtLS5ca1kY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX/5uoVKTLVWP9
 JyLMJD4drToy/DnKPtsZERfJGNVze6xa4GDz5CjiKv5NnZvbq7ZKCKeYPYHC8kMMsFzUHQu9J+k
 ZQWjqEjpZBq3AapBZK9C84046d/iapGGsi2JBLk/HVLVKhz3MYH8zqwp502LmxWRv540elI4cZE
 IBhF/hWrHUjBJg748I9sffp1Kcb8QNarNlC4q1x9P0fasljJ6dPjyDeFBs8bURbs+4Q+1LbAYBZ
 MqWa3D8iJOyy53p0q5Z/qdN5hv/JOc6/6qaQf3bjuA8+gPtI7TxYjOqZzaZyIouTxlqE+ys+xnB
 dbvpa6pmd7EpFqb//a3loLEfXyt2p+s4JcxJFqt4irqKVyHMBl1V4tIShBYApsoSY6vaP56e0/D
 fR0PaUhMhrr0rv2mA/uwK/HtoyVe20PwA1az1Q/xXpF/77B33lvvKoKy6lHG7Iu4cUdmcVOCDxB
 qO/Op5gdwiFBMZbXKxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfXyk85kht9g0jC
 4bfwX+ScvQJFBrL3QDO3g9qwUv2F4ehgq8BAkYZ84y0WdgbvhMmMbDmvQsLyrZedHUbPOU6Fcqq
 EjoB9PI5/Ke3toJnR/NgJz5ZObbVBCs=
X-Proofpoint-GUID: 4dSjhJvTzAg5XziYPmchEoLtLS5ca1kY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160051

This series wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [v1]. 
v2 [v2] split the change in two and addressed review from Dmitry Baryshkov:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

v3 [v3] only added the "v2" tag that was missing from the individual
patch subjects in v2 (only the cover letter had carried it, which
caused confusion with v1), with no functional change from v2.

v4 adds a base-commit trailer that v3 was missing, again with no
functional change from v2.

[v1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com
[v2] Link: https://lore.kernel.org/r/20261116114908.1701258-1-akash.kumar@oss.qualcomm.com
[v3] Link: https://lore.kernel.org/all/20261116120623.1726089-1-akash.kumar@oss.qualcomm.com/

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
Akash Kumar (2):
  arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports

 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 arch/arm64/boot/dts/qcom/talos.dtsi           |  35 +++++
 3 files changed, 187 insertions(+), 11 deletions(-)
---
base-commit: 87d33c3916a82e38eedec53f4afcf2c620add47c
change-id: 20261027-talos-lyra-evk-v2-v3-3-658fd5a7ec99
--
2.43.0

