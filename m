Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906403;
	b=XxZuok03dvPSOTmKhlxl1AzW12HdRaAjHH5fe6zukfhU2j2FjjecJHv8MxB0Xx/gwIKg
	 UF2k25nlgy3yZx8ivSycKbUvv73Hwt+SxxHMMYGZIIRbt6cFYCuaIjD8NoaLjBoXV972a
	 4j3XJTlVotlIkHEHouU3wmuU5K+WgcvTcisKZDWg88dEVXXzgPQZfLF+sB87XMWPm3htp
	 S7Smchzqgs54xo7DSaS5+UPAE1MmrkA3aP63skBHy/J4mkkRbijRiTT4RqW8pdwcOvPCm
	 6VHMPv1b8vSTZPXA1GL9yf7wOnVuBykUJk0MbM/WKh5bAYAaQQ2kiQyecFDDnb9E59g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=;
	b=C4MyhF0AN5jpcVi66VnqJLBQxALrLlH9i019UOCBkxMyfH5sF+N14ajL8OlcipgCl3D7
	 BhZUblOb+JNRPVJBUEQR50dCBy5EyTl5FbkeWDeig0N+J6O5IC0vlHWTc7i3YfcAyQq72
	 IYJzOw6StgBx6Vms6YezAy9oyNvs/ep+CjjXegD1wbsUqrPlS+8QphpeA2T/ExPjBP+71
	 KiyGA+SJ4L4DGo2WqdtligFIRsiHTp6ezhz9PUVwFn6/Wug5p+OJy7Tacen7mIMw8uXfk
	 ogzzYe10wmOwh1oPjQLMEisNXjYb6FJuNr9MbmBl9bvLGRbYl/4KZQItRiZ4qSY2xoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7uFNKpY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XpYjlkaM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9054660A2608
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9054660A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7uFNKpY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XpYjlkaM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH533RF3457896
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=; b=E7uFNKpYl50J77JQ
	3v0ACauajqFZZ1L8KULdMKi9CWIClbELw8U7atXet56C/wQ9VsckYLASZk09w/Su
	1JCHW4CDv6IbC9qAvESDKqNa9rnfJ5qmaCiBkTtOEUh1yRV3+/Ew9lPOSvODioSI
	lh7cJGkb5Xkxua78e+KrZWEKNCA1Ekg7Q4egqG98hq/kan1CzqQwXR+9QTUYOhs8
	DPaysVIqjb+l/eO15qUkcZvmGb6nyGarX39qGnO2CO4pOcTXdFH6npG/a3Ub8F5Y
	220j98tmZ+4jsXlHq735m0OWWVIwJSIzcBdhMFiSvuOQrHPYdkC4RBJ86Qk6H7O8
	Rctj7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8v8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:06:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so853600585a.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 01:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906401; x=1795511201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=;
        b=XpYjlkaMhzpe62g1vNmghbL2k577N6VCs1uJujD7xnC1nj28KrDUFudp9nWYbaaALG
         NtJ5PwsxKDzBFaPyIiCtjeueDqc3Cb7CzoK80JBiWW7CGKNnU/jYQCyG0AsDQcYEKIt1
         gCtOYMIKd/OxsHgfZZAT37KmOmraA3qCn3tQXaJ51fMA5xUwD3kyql4HCOfP3a1MuNdA
         8F5YCQG0lXqxw9v6F4od7RN4OtL95p1yMPva+L6L7MIdTgG4kPO6mIU7GJKkTGBwwwzw
         sTn1sw+T6WCRMqYBXtwWLFR2hFvfNfmo/fd/4YNC0aEWIVIhmtLpO3Go2wEimc7T8s7W
         n4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906401; x=1795511201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0ibUOV8qb2w57M8b54S8KkbL/HbqzP6ta1cCOvmksM=;
        b=C5vggIxIFKfvIWrVzjFJfDrITwB2PVs2ku6EkqkuURYHPDSYwemnIOCfmiYUy+3fel
         sMetNV3KG3m1kKVoTruLxkKLt+VzSDEFjQUbm4ezHfMyAuO95J9HXLvsY9B+eZy2ktP0
         O5EosPKt16i7lO3j4iMtMBN6T3mdEsc4fApYYUYdN8EDPS63aIDzmJX58shlkxRL3jt2
         +laG3P6W2K79d7qkMboai0DCfATlCMnWzIHJWaS+3Bcl893N+C+POcFsGNHgyqtpQm6T
         +W6bVQ/fo+HSNvAMabrfhiEOtsYUg5Vn5+3qX3zkcSgSZBgXblQbojlNVaYEkHFqkLeX
         8Lkg==
X-Forwarded-Encrypted: i=1; AL+hErHtvn2FFI5ajiO/upI6GsbL8AaSpgjt0zk0XfBQkDSvhiJQGGVTjvNaceXSUpdUwbQj0bR8QH7wCeUj@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZGDbnh9x/jb/ytYHO56PeqLWsS7f/y6zuEqfyc9CgSG1l+A0G
	WgVJdQWzhJmKH4jQri6eqfaIwT/+GgFJz7T293/5evij7kCBK0yudH8dLt/8oR6zLn8fLyzpCje
	dQlBjZhEADr12Sq69kGAA14QLo1w49O3N48Ht95w7quW254V3aP9thKEjcLcrLw47
X-Gm-Gg: AYBFou1P1kh6gnNvzr0VR9NQ2p/I5AboB7G4keVIAOpR7r3INvnRk5LWLr1oKkw0nLb
	zYzrn98zv/+S/50iR10krlfXJ3xCKK1mJsn1K/K4VacSUOimZ9vTynDTb+lFC2l9vcc9/de0lp4
	tt6yeMf+HOIGE+799UW2n4v6gaPTYSy4p97n82MAmYiCkeGHXMzjb0AvSBwSlvRraaUqPfk9uu7
	g7Wa3aMd+tWOHlDcOahTD6Fh4SGjXjnzogChB7MsIfLZf/Jgl62XKTTuZ5jHUrqP05Cng2XXEJO
	PbUQS0jxU2qRoJUzQ6JJWSo2N6RX+IOQfg4DLbrD53wp6G5HPz14dsNO7WzLarlsvfTn9ihCrED
	kGWOGuHJz92O6mzjoh9eMsTSwbGEA+T5VqOGp8z15hLvgt267iDzCY6DpJdyQfem6ODKD523W5o
	M=
X-Received: by 2002:a05:620a:4109:b0:93e:fc4e:c490 with SMTP id af79cd13be357-9494bb849c7mr2069482985a.15.1794906400694;
        Tue, 17 Nov 2026 01:06:40 -0800 (PST)
X-Received: by 2002:a05:620a:4109:b0:93e:fc4e:c490 with SMTP id af79cd13be357-9494bb849c7mr2069478685a.15.1794906400136;
        Tue, 17 Nov 2026 01:06:40 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm27310657f8f.56.2026.11.17.01.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:06:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:06:30 +0100
Subject: [PATCH v3 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on
 Nord
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
Message-Id: <20261117-qcom-nord-ahb2phy-clk-v3-3-ce5ee1073208@oss.qualcomm.com>
References: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
In-Reply-To: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0QzX4LF5lSbbC5DnVnFoOIfhrWUJ8IJ91S32d9U04Kg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/BkXPVVw/zXDKGn/WN3BO3CD+t1o1itzre7fU
 IU2MWIFaFCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavwZFwAKCRAFnS7L/zaE
 w/7aD/92Nf5Ny8nlbehp89MHvq35uh9yLF+ft/kDShrScyndWe7PBoxVej9ssJCksx+LZPRMQn1
 AzJrGRL7AyyHeJqpdc878d5rcXub9dgsPX1mx1pLmKQj2z5R0xaFPtjtV/pRdPCsJlRqt7kmck7
 jsH5bClk9Fve/w8OYso8EQkKm1Sf9hjMYUEchLMhPZmws0BNlyukRSiXumm7ZwJUjnlZx43SRDZ
 n7i5/mWHeprRpmqhrmX33efQMFgeCiDR++1aE7fPwQ15fzoVF1Gfx57ZqFL8ZreZ2WAwC3KWfzs
 M3ej3IdxmnBsQp5YmwcL0mL/cVpMk0W2/CVTe8d1nVJm8oC5gahBK+IsdC1Rd6crib1h6y+bUmU
 7GVxDzsPbbQD4rz61DQThGQb+9HI/LG1+AIP1EFl8ua2a64qjuJeT3LRgVAgo4bnZiw4XzMud6B
 aV5wqVkv/pItbzS7Lpw4kWYBp61wNxJnQfZSMqb90sAn66bRd9flv3stmCseigCowLYIAncgUOg
 lTgSaa2a4UMlV8GU2KQ4AVz509zyMa6x6nPgrjkMurpa1srcTjJ3iZTUDb/8TLBdlO/7BfRFZfA
 dzdj2yAo0ks86w7A7PePfTaK49J5NvLq5A+h7bPf3vfwF0rocYvtmjFn9J23lm7QIoH8RQLMrp6
 +VSbw5J1veozpXw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 0KJdrZ74iqq7tDUZWIKiV7I7aXLlwZDQ
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc1921 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bNGo_Fnal8ggQfzXgYoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0KJdrZ74iqq7tDUZWIKiV7I7aXLlwZDQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfXxkh9I0kbMkps
 xx4XfzkmXGXmtozy5MeKuVYgwpgb7pc7veZDQcs9b89GQkIY41Yb3WpXqVZX4EMipC02hBmIDaw
 G3PIb5Vvx0xXg/tGsc4qCVr6RRQ1Rh8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX6SRNUMdmBUHJ
 SyDfqu0/1SwqGDIn4tWVa1Um5jF9FWDy6iA4Tv1Ih9KdnGLpI1x42SB7juGgezL/XH3hJ4z62lv
 rkhHwtZZ15QBQzeoFxdPh+05Fhh/BPrZVL9YU7W8ESs9StzCVBekzB8P8aW5sm4zFLwxnnGhSIl
 +pMB1GNL6LGlAKkytm1eZPjYBRn4ZLJIOs+NkC14Xp92QLbI+aYWYGu8DawOZEnMBf3DOhfwmEk
 5ACQ4z+h7MjUf0oWyLU4AJFYJPho17U0CMp6zboJwX1iDSKyCVBKdO5FfijILpwUnFHVdyZZnFB
 5nPACb6JagrssWzoFw2d2NS62he8UcmTPVXOTlJ9UNmnvcuCcPkGbL1Xs3F0egHR4cyXZPh4dLP
 oQ1tBXj/3O2H89m4k7t9GB6Y/YApic6GHea1MB8aURKXOgud67lU0X9xxZlfKchLEurRYyQwZ7t
 qW/uWwTvnxXCjhy8bCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170036

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
by NE_GCC_AHB2PHY_CLK. When nothing else holds it, e.g. on boards
where only the USB20-only controller is in use, clk_disable_unused()
gates the bridge and PHY init accesses go nowhere:

  xhci-hcd xhci-hcd.2.auto: can't setup: -110

Add Nord-specific match data that requests both "ref" and "bus" clocks,
reusing the existing Qualcomm init sequence. The bus clock is enabled
and disabled together with the ref clock in phy init/exit.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index ee473b32f116d..4c70d15210c68 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -452,6 +452,16 @@ static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
 	.num_clks       = ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
 };
 
+static const char * const nord_eusb2_hsphy_clock_names[] = {
+	"ref", "bus",
+};
+
+static const struct snps_eusb2_phy_drvdata nord_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+	.clk_names	= nord_eusb2_hsphy_clock_names,
+	.num_clks	= ARRAY_SIZE(nord_eusb2_hsphy_clock_names),
+};
+
 static int snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
@@ -607,6 +617,9 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{
+		.compatible = "qcom,nord-snps-eusb2-phy",
+		.data = &nord_snps_eusb2_phy,
+	}, {
 		.compatible = "qcom,sm8550-snps-eusb2-phy",
 		.data = &sm8550_snps_eusb2_phy,
 	}, {

-- 
2.47.3

