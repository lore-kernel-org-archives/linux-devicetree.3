Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315484;
	b=lG1hJmvjIQoAUkj1EMDA8Fl6OLo4ZmoVfhmV2VsWgR2FZS1LN/emkgKo0O6NCGkv/9fs
	 1vfjDETdV4RgNCvP7klV9EMLtjankmHLBBNOyyq4n+jUqATVlo+gSv0xG9u9crG3UIZM4
	 ZUqDQYMCx+Yh08WZh0BSP1xtSEBPoAoO1FjMAHWnK2Eees7yvQ1NbSOydaUU3dzcjtuLe
	 eX3+FrnilZMJlswcERKmwQjGCCdx0Cf0aoyg+UXLOqsTLA1v4dFaqc57H59J3+kZ9wSYS
	 xmzy3ybmsIS2nk9TE/eBMe9deMhhuef6lDU6/cNWt47eMGdeFTz9CoL+L40mxvPMRdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=;
	b=Z0iN9UszdpQnFD4zixXHJhHE12UVLdQ+Lk3JFtxle+gfgllyY8A6CuQsm5hSyyW2zrLF
	 TBJhwp7Y4dKsqPo6WP2H6K2pEUzsRR/QkZoXpla4skT8RxQTro3hs2mkWvcLMi3Eb5uTC
	 30/4Sdm0w67XYQaTh9TNJdcHizmpALeWai8AZMFf8yavPUcfm3PkDhGmKCdQEuTvhqX9t
	 ptobqL2lZjoZ/FquGf0TINaYjDmxMlWuM46+h/EKCnuLf1lWqVGsjVZkke1beuiaZ57Nw
	 /pS4YeZCyWkXVadAy2YD+mShBVY7vLZd54xv69WKj2RifCbUY6NB0QNiEZrHWp8yVcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ej7q/biG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kStwgFTq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1A60A383E
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B1A60A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ej7q/biG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kStwgFTq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAIoI3839803
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=; b=Ej7q/biGRMdxc/8K
	26SADomgPfH7/zN0Bz+Wg02ndgQG/eVGnlUb/1+O9MBiI2xSMNFpRDKvCJ1Wkwlc
	akY++Rr7krpNp2RHoZiyjXEveYh5wzbLhP9c3BZ25RnOQSNN7yUVbquuPeCuYozZ
	Iee1Gq+XFKbzFPtXW8qSG3VvQx9F/pejVtu1RoRrVeADRkGgzQ1VnYOCOcRNSizk
	uxLOZWwWHTyrnz2GKRt8ym+1y6uCNDVfV2y5UTZackoxfrkXZhT69aGDvQOkYX4D
	yQVN7CL5FiCQtp3UWLmQ1SKhHNT48+aADLE3G2zJfgVqNUzmdyC9LUmf8EKxTgmR
	hQVt9Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg3g0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:58:02 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so245852241.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794315482; x=1794920282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=;
        b=kStwgFTqzUi8BGwIfr4Hp41RYzM6lGJhzucooM6jN9TN8xBOJANaUHdV/rppAhpOdH
         KUlgCJcfyV8in2osHrbly28MriK6tc4UXDxf+pgXUAzLvZMVsB0ZdR2F1Z9hwr6Dc/af
         s08mxm/LeDTIc+rmW4WSsQx/DtOFjXwe/GGFjlMLqy7fGMGm98izkBiFhhHIk2dSFE+6
         uXVVd5mQypVUEKNsZ6s7nXvqSVKlO06VnvxtH8JaMep3n90xD0lhW/s7Kmh+93+c7RR+
         ELraBqyXF0f5l4cdWJtI049TfCg+YnR2LWRviIRMVE6wTLpMhT5gmAjKvr5fYwyE8Skj
         x6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315482; x=1794920282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xM39//LeNx9JjD5To/VljnT8OdI2vlJ2LgADFVsT1Yg=;
        b=ddSYxQwfAJFgzo4wFyn+rB6MxmtNDxAMB5ASf7TIr7ggqLbnx4muSwim5ULvrxzCY8
         /7jzREozFlx/np3mENc49nSbIfYCK+zU7iInPQDDs4apQ/LS7GCySCYeFxOdVZXfFMy5
         l0mlzQ4f0x4OB+yDv0tikm/cTupkogyO6d5liAUslyTdP4KEzWFo8CbkGMmmY0VOmqFW
         ON4sakQguvq/cvNQhDYmTJ0AygsrcS5bjb4S1wDNma2hvHCi/8iNYf6vwomJVg6MbnR7
         KwXMu1vf1XUovDC9I7pLkSRHqShcB9PbRtUVbrrsZawu3497UGzjr8lY+h37+bJ0R/v4
         wA4g==
X-Forwarded-Encrypted: i=1; AL+hErF2KenQIGrrHPh3ktbNS8QdwL99Y3L0rCCKA+ol2guGpFElV/gx4zCq/ZH0gQ252S5i8nM9G1aQ1jix@vger.kernel.org
X-Gm-Message-State: APuU4Z/w7fUbZZW9vrCNtaBZQVZF3PTC2xcmvi69tnHi7Pet8Fe8mjBR
	4Rr4YBD4CKILwBqDFmxnu4zMgqfEPH29BRJlkXyTx+/WqHHLm0nyuiZQyR/+yxuwcqHDzP64HsH
	YzOivd0kyhwNgOh6llVAn7B2BT3nq6yOXj+k5ytCBN0pWCkP/nLJA5R0Vh9xwQnZx
X-Gm-Gg: AYBFou0htr+2JREVSw5KckiyRXd0trBY6K8o201O4kIvUROargGNX8VK1SmhgVfpBkC
	EXg4dgko0X6bDu9yCrJ7V/bsVm///sfTKKWUCSfaw8Q6jiTKEFr+PqqoJYHOQiwIVIY03oLjaAd
	0O+4yad7+bLhweIwcjUz0qT9xNH92QswIJ2Jddljel39NDm39a15kgwp+Z44vcuwKXStSROEkPZ
	OlT5glOeY0ORMuLsYFa1j01OnKsDZ1neNz62wvW0mPGxFBg4otZtjJqcvN9LSIuQU0A+mXBPr1Y
	xTYFttn6vgFvqDceRbxZnt2zypTtkwMPtb434nZ2wotBcbFcMrsLSKArJmox83AJoDb3KnQn3Zb
	5CZShyq/Bknub6RSHvSxk8r7Wi5iv/oi83RkpipKmrTKoYo3wAKTYpKMKdw5SLWOAQuavUQ==
X-Received: by 2002:a05:6102:2b9c:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d301ba38d7mr715679137.11.1794315482127;
        Tue, 10 Nov 2026 04:58:02 -0800 (PST)
X-Received: by 2002:a05:6102:2b9c:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d301ba38d7mr715642137.11.1794315481593;
        Tue, 10 Nov 2026 04:58:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba35csm58422365e9.1.2026.11.10.04.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:58:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:57:42 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: msm8916: Disable disconnected DSI
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
Message-Id: <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
In-Reply-To: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3980;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=65njRLBqDnUyMSob9Dpyv+KJXmakPkOeCvlHFYhe1os=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8xTQbHWfK+D3i/RoxLJyMDJ7NZJC8pDAy4fvN
 hxuG2J5vXWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMU0AAKCRDBN2bmhouD
 19TrD/4m1pyWaPmrdxKPoimQkBa9g+ksohwgck9+Sol9aIyua4pkoOf52KzBj81zXbXkjzV3g8t
 Y1KRFZJQmYwpCgVlqL1195hs5em/cOz4hpqFxtqjSNvtop23nMswZ7Ipdr106yztLpwwUP01Uz9
 mmnA9byL3NZ0Y1iPybiQuTdkdu2ScRNZE3HEmlnzcJLh6s9ERkDG8OlrJHQ5ojrkAiq+PxndJ/r
 E6GiY/9AmbEtN6Mqz7TyxI1ODYE35KqESKdF/dxZTd5/jnw4pc7tnKKrETRuit+rOgcxCtIp3NI
 8XAYo7oiEzmeaeOQyoPm3dsq1mtjf7FJwa34nzQbwwf+vN8fMWZ1F+phcTdHHBZQTSGkZrruCMQ
 0wUSG6eW8+yJJOtSDTonlnnXtvVPi26mJWaBFtL0dRGnTfuX6Wl0Dl23rNdfKOOFuX0kyOuM3CG
 QZKPqTbj5B2TQxTEtrqXovvCMKmlpzRlv8ME9X/IQmN1FiF5nTF3nrxUa0Aw66Oi294bhM6UfY7
 R07DRV5vWuxcdmV2VP/PfGIOB/Uun91n3ePgK5a+WnyhSeHT/z0lYM6j9wJdMkUkB99RM2XSZtf
 XAEnx2X9wun9XCBv7tZ0JLHdojtUXdMpaztffXJcgSw1/VAJ1p7H1vfzVZHZkQ4F3wzYBtvpjjc
 cFle+ySOKTeKmzw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX3DJv53NNMWI5
 kaIMmoM6fxe4PeiooZ6B0jcKtl+KNrJGkZSfzA8sKRIdPrjZl824w77IhbFRVLDoepKkfd4tcii
 G32Lw5Kyw7DH430wpevy90kSSC3u6U6NM8wr5h5uUMw3Sso/UQPTWcXLEX9aEWoqHKSBs6ZAH6v
 lXMTBwKHO7P1aRaEc1QZoMXco8HqFoKNeGM9XZxSMkg7gwrXR9wFm2ZboLWePFDwENoVBVA3HEs
 TvSQObeJ+0r5bWqaHDJhZoC+Od2oWUi2bDHs6YQEOYCJXBCXcniJpvTeuwcrchskjtjKDfn1uU7
 MNhtOWwdBcFEZOEjMIyKUponbVLXsfzFI4lOcYzDEsVwgO1rxj+Badtk3HhZCufBtUdgC/4h9ky
 IxsmmsnSQWhdq5ZdiLwMP3GGcF1IJSPXcrkXFrX9ts7NnBV6m/+Ifv2BDmpour7ebjgyqDPUHXD
 M5/7tKoGzk0/tzBhkhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX9hCqxlj3lW2O
 yMtceVhjD8ROWaMw1YGjfRqYeMfBWLNcBSHJJW+jrnIYNwCA79U2J+ORGLm5lZ3CwVz9W/QAN0D
 d00iE02a8/3DC+PcGT5dwu6MEbuLqq8=
X-Proofpoint-GUID: L6Lexhbns7PDOKvn3qd4WDW3wQBCXF5q
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af314da cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NuhE5ioKuPUxyzsrWcsA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: L6Lexhbns7PDOKvn3qd4WDW3wQBCXF5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100051

MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS.  Linux MSM DRM
drivers will also fail the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
 5 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 906d31f1ea21..d3adbc7406b7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -87,6 +87,8 @@ &clk_pwm {
 };
 
 &mdss_dsi0 {
+	status = "okay";
+
 	panel@0 {
 		reg = <0>;
 
@@ -109,6 +111,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &touchkey {
 	vcc-supply = <&reg_touch_key>;
 	vdd-supply = <&reg_key_led>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
index 5b34529b816c..fe333ed489b5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
@@ -133,6 +133,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,ltl101at01", "samsung,s6d7aa0";
 		reg = <0>;
@@ -154,6 +156,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-gt510";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
index 3d6d9dd3b8a8..85d1cae19a66 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
@@ -98,6 +98,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,lsl080al03", "samsung,s6d7aa0";
 		reg = <0>;
@@ -119,6 +121,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-a2015";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default &secondary_mic_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 71b5c98458ff..65de798201eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -337,6 +337,8 @@ &mdss_dsi0 {
 	pinctrl-0 = <&mdss_default>;
 	pinctrl-1 = <&mdss_sleep>;
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,s6e88a0-ams427ap24";
 		reg = <0>;
@@ -359,6 +361,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &mpss_mem {
 	reg = <0x0 0x86800000 0x0 0x5a00000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e39743e22043..7d351cd15f90 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1634,6 +1634,8 @@ mdss_dsi0: dsi@1a98000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1668,6 +1670,8 @@ mdss_dsi0_phy: phy@1a98300 {
 				clocks = <&gcc GCC_MDSS_AHB_CLK>,
 					 <&xo_board>;
 				clock-names = "iface", "ref";
+
+				status = "disabled";
 			};
 		};
 

-- 
2.53.0

