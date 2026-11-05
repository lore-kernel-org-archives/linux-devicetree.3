Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884071;
	b=Cw8tUZtpXDtt4yn1/URB9tNtlhEexgEEzinvpAf/miEC+kLBK633q1QxiuEbCtlQUsNq
	 Msxgeec4hXUbiWmgcan2+WVosTccJjysBZkZ/7BpK6WKF4B70XHtpVFD0+mJLDN39Jjat
	 niO8MDDp8WAUKapLgK+v4pKThFQCf5N+1T3tU8+X5R54G1lNXGFfUYiOdiY72zUjLj82M
	 K0cv2h9t6tRKRk0jVsZ6jHESSKRAVcAy1woKz6khQV0b//3wI8LrBzBE/Rh+Vy+yyomu6
	 gqeUuBuDtHHDC+BYNL7eRuGLyq4D8brYpCIfv1JjRbd0GA9ndNlaY6G9dfcA1dPsiLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0kaq2eX5JhBwGzI8FjgMD7kHw+EoZ1YtEVJNHdDTAco=;
	b=MjKScbJX/SxR+fXuChOMjUNJiQYFyZTMvn02CaChbZD8+BBxxFEr/IgKW8x+f+Og4Y1K
	 tlo/jIgbV8z0EltW22NmXu4h3oPbIqTqOaB8RZYBPhiA67bzwsboXFgOm5k2mjgdDi+wT
	 pTzHJx/nfNPDjDEnqR/FPc43p0gC/wQlqfMrEm4AzwGSk4awXQGm/5dJkmRSXsxm/IDmp
	 AEHSaoIPsEFyVgLatJdHNjycmXWZOUDM5h4S9hm9I3vVQN0tPS4tSZzZrxiba0vDlMLtm
	 fWuNync3KDc9jAZC006B4T9eioTYxd9kg7YIfgS4qf4UQFdgYQjJUJSWXwduNErOOVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n7HkO/LI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wqjt+DRi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5110E606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5110E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7HkO/LI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wqjt+DRi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tkid3532147
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 13:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0kaq2eX5JhBwGzI8FjgMD7
	kHw+EoZ1YtEVJNHdDTAco=; b=n7HkO/LIWLbIooaXKMNlyOgDVocBx1Smgvx+Iu
	mcOk4BtfrroQoPPbbcbJi/PIDgYJH3tbDpBTE9jfLrWZ6yLUGyICUMAXg+sj9VMz
	wx/ctuLPp1ba88QcNfLbn2eaFrEbmkGIiAx86PjShv4aT+SCjCU1Jh6RQ2yBlFSA
	44MX5DzlWP35eP8ijX9J1qPWAkwe3i+Dmv/tiuxj0PNrpRkmft2tupfDMqSKLmBT
	DZ4uo5B7pb0LoCS3QtAT4R6yygrkAip5Z+EmgWIVbfWXvh+zNxZlgg8T+/w6CAo5
	TVgFd+rN95yyQ8wmjl9zh2iKcvyHBc+fkse2VU51h0z1cCNA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq9rxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:07:50 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6790b1d37e7so1218532d50.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884070; x=1794488870; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0kaq2eX5JhBwGzI8FjgMD7kHw+EoZ1YtEVJNHdDTAco=;
        b=Wqjt+DRid1edpBwCvhFmiBZ1NV+2agKZn5xroDAu0syH6VmrCBKYZ2XlQLzbtyCqXp
         oe+JrU0XaHUM+AQhMb1/MiQZinZAgpoRktE35Y1O4TknNkuZlFoMVNob2whvdOcI99Jm
         LWLCqvBYsE6qQeTmqThaszdoWUlNDjpB/oczUSCWdC+B/YoUG8+zdGXDtJPRz3TC0tdY
         6+1/Mx5emugoCvmyo3h3qD3+DRlH4K5fDMson2m7+hogPqgrIQYqIxrlsSer4idjUQgw
         rdECnMXuFgSLfixkU1Bg6g7x/NtZ8mSAHmErNvABFkJG4EBYJiMxlzlthWpewB02J036
         AyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884070; x=1794488870;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0kaq2eX5JhBwGzI8FjgMD7kHw+EoZ1YtEVJNHdDTAco=;
        b=Cq48WCs3DdLettM4pP4KtEGYDRyWIDzCPtt55GXhdhDQRZ0uB7n0/iLyXK6GYa9oxk
         N3EZ3w2IA2km1VAArJNSEjyj399pf00NwycAYJWWch/2EKItmjGQ030BtbHgO0PcK83y
         Qn+vjV5Vg3XJ8rOJzuaypsZwsxMPAfm4gmawXep+QMj/MBLNyeL9VZN7t18I1VqxZOd9
         QMqxTFI2HB/5z8SQOezJ87/foqfCVFybzxaD9e3csAv82z8+96EWeXZOGiN1CDgj5any
         4Hy4N2xdsUok0bBIoeCLX4fM2CVCypwBcDLV7nei43seJe1Fji80FwtA8qgNdpLQRD/l
         TSfw==
X-Forwarded-Encrypted: i=1; AKwUvBwqfxudCOpUgc1eOBKYgVHvhl5cnB4WKaAr9uPU3RzmWq0kd6mU6QAjogMOM90Ek08NAZmIGCT5aNoC@vger.kernel.org
X-Gm-Message-State: APuU4Z9uSjxuoFTqwoOr7bc9nFkJ/go34iEcDRBbtOGk7j0tHu5W6p9z
	R9CWlTdwdNFMTjo69QXl11RADhomd6lbZSfZFOOablFoVtfsZws2oZ16Jm/WRGtShsC7ChQq+sZ
	rGbmg358wNrdfAuF2AK2HSUBx0bJFFmvIA2Iugk76e/E4rvvWeNEgXVwoq2keg308
X-Gm-Gg: AYBFou13jByvwZXaTW9p6AdVOsciZhuHHwSiPrSay1U128exV9T1k4DqeJCmGG74SWo
	O+edaA+kzJgJxKCmORPOigqthJYwTqm36JscxvyhjBXYbSLQ8T1Qd4Vs1cfcojAJn2Cz+qaHzUJ
	6FXU7d6d8I4chU4nKloANdiun4U0SrpYyW7KQDuTmatxMlGgyMfbOabCgH6ZUYz++cdYBROo33W
	QocD5LKvCsoCmy7WabZAfirKT8KIhhs+n9zb9Yt0Ta69JFBO9XU5JsvKVagcWkRH0uzyiTWL4hn
	DqeiW5LAyE/axBrBEOaactcEuNfB3SPKdyeoJdWUKBp3ouOAXXUtHqEvjeMPrxbz4Xamqdx6Fuh
	cYO88Nh4KCjdrQg8I8iHFBRhHWK02pRxu2TfDGIMCtN7MKAzocT/fdvvX72h53SsOhuYZp59U63
	IXPUJuT/KQsNq6n1M3
X-Received: by 2002:a05:690e:4810:b0:679:cc49:55dc with SMTP id 956f58d0204a3-67ba50d5686mr9599080d50.92.1793884069728;
        Thu, 05 Nov 2026 05:07:49 -0800 (PST)
X-Received: by 2002:a05:690e:4810:b0:679:cc49:55dc with SMTP id 956f58d0204a3-67ba50d5686mr9599060d50.92.1793884069087;
        Thu, 05 Nov 2026 05:07:49 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:07:48 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH 0/5] clk: qcom: Add NSS clock controller support for
 IPQ5210 SoC
Date: Thu, 05 Nov 2026 05:07:11 -0800
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAH9/7GoC/yXMQQqDMBBA0avIrA1kQlrEq4hIMxnbKRg1Y0tBv
 HtTu3yL/3dQzsIKbbVD5reozKkA6wrocUt3NhKLwVl3RbTerDRPgyzrxaEdkiqRGdkHR030ERs
 o4ZJ5lM857fq/9RWeTNvvBMfxBaAEMQR2AAAA
X-Change-ID: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=2682;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=FwCPPd43C9+UFSP0VeeVecOu7OTjX3+26VD0c618IqY=;
 b=SCD5tZUyjWGsUIgi3dbLM6Hphh2nWi8p4z9NkYkuElvybRF31+EhpUuN0eDq9i/1HpT9fBEac
 xn0MMm22K2lD6Cir3JolbsuwxGvtY00njX2xbn1QaYW9yk3A1bVZJJc
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX7uBycqwXRItu
 kf1xnfh/2d1ZrzS1RKvxk342XItdUfr1oNtlgbA7XvmR8lDMHPiIWNT2D6nqiIPpnIFdbXc9DJy
 XDA0wo5AIDRyIp2CI8foiXpIXq3qYcjtp+gOMLVGxny9Gm7yJSkT0n7879pBfhwQzA5pH+EGGz6
 wPq3OlhLSn36jbC8D54U5hEgUkpDqZAW1pUlN+Z40W/l5b1aywdtcfU5bxL618qYXeHpXxJjnM6
 o0QJB6E0/CO5LlprHNglPbcU3e7yJ1wvBz+ga+BgEyHVvSpaW/m5Jiw3jSjXm0xOTwst2Oa6ACi
 JYWDbVKasbjbObV6dWkog6jStkOe2tm9DU8COZjFW3gSgONPUhQFbmZtcYfVYyzK4F0YwUJICRY
 7wlZ0Id+yWPkCiugenJwTmJtC7pndE66aQl0AG7UUJ3lmCnomCFMQF/h2Rf+S6i8SYSNiG1b2Zf
 q6W5txj/Z972GUMyqvA==
X-Proofpoint-ORIG-GUID: akW00PGLXXM7H_GZN4ixoNeqBtivAFSf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX2SPvc8bBtikV
 741aY7Hs6e+IfKl6+MQi5tnp34MkG1qBtAY5R5GfA4poHmcqc6VhCha8keRg8JBMAXpY/f+LkZL
 l73Gmu5s/H7wLpy/0J8ErPXKXBFRxNg=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec7fa6 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8DxjrM3GApEK5qXUAGkA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: akW00PGLXXM7H_GZN4ixoNeqBtivAFSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

The NSS (Network Subsystem) clock controller on the IPQ5210 SoC provides
clocks and resets to the networking related hardware blocks such as the
Packet Process Engine (PPE), the six ports, XGMAC PTP reference clocks,
PON, EIP crypto engine, and the SoC-integrated EPHY (2.5G Ethernet PHY).
Its parent clocks are sourced from the GCC and CMN PLL blocks.

The NSS NoC clocks are also enabled to use the icc-clk framework, enabling
the creation of interconnect paths for the network subsystem's connections
with these NoCs.

The patch series is organised as follows:

1/5  dt-bindings + clock/reset/interconnect ID headers for IPQ5210 NSSCC
2/5  NSS clock controller driver for IPQ5210
3/5  DTS: add CMN PLL node (carried from the CMN PLL series, see below)
4/5  DTS: switch xo_board to fixed-factor clock (carried from the CMN PLL series)
5/5  DTS: add NSS clock controller node in ipq5210.dtsi

Dependency:
The NSSCC DTS node (patch 5) consumes CMN PLL output clocks, so it depends
on the IPQ5210 CMN PLL DTS node. The CMN PLL bindings and driver have been
merged in v7.4-rc1, but its DTS patches are still under review in:
https://lore.kernel.org/all/20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com/

Patches 3 and 4 are included unchanged from that series (v4 11/12 and
12/12) so this series builds and passes dtbs_check on its own. If the
CMN PLL series lands first, patches 3 and 4 can be dropped. Patches 1-2
(clk) have no dependency and can be applied independently.

---
Luo Jie (5):
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5210 SoC
      clk: qcom: Add NSS clock controller driver for IPQ5210 SoC
      arm64: dts: qcom: ipq5210: Add CMN PLL device node
      arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock
      arm64: dts: qcom: ipq5210: Add NSS clock controller node

 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   47 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |   22 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |   67 +-
 drivers/clk/qcom/Kconfig                           |   12 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/nsscc-ipq5210.c                   | 2203 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5210-nsscc.h     |  106 +
 include/dt-bindings/interconnect/qcom,ipq5210.h    |   18 +
 include/dt-bindings/reset/qcom,ipq5210-nsscc.h     |   60 +
 9 files changed, 2531 insertions(+), 5 deletions(-)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

