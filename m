Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B3D3DB645
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503515; cv=none; b=k2DfTA/UmSRiOiFtnEf+wStL/vPSI4nE0z1mPZAMnV/ZlcU6bzAnP9G4pPbauWQJjFNPiBV4GPpbbE2LBZOoQx+YffvpjzaJvkp30Jh9QKWQbRH9WpBtUEoABFnEERjJ6Ym2hMZcejIR7cfn3pjdUexs8A2dl1ZuxGH9OeGMKH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503515; c=relaxed/simple;
	bh=BOYXG53bdi2XjvZ92ZYJP4VZld7lbUMGFXpmLhK3Xv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kD9Z0kMrIkjkciKf9UW6/iHaQtSYBrVATJ6lf1nXn4+SkOMka0Mq8xUSXhWfan2258R9hi9MyBTlY+hlRUG5EtYR2Erd/Ny95hqJsR5JS84veEO/+CaoV0EAjxPSjJvlwMRY1I1/qqTNAqFWlNPLOVfFG1PJwFm4Cc54t/UkrMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipz16ZZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIhMTD9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipz16ZZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIhMTD9b"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9IQfb652833
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	as+Eb/DRPDzFIgx5gcstJyS2F7gPE3qAatW5+WlePd8=; b=ipz16ZZSDzK8L/7N
	Kjsy596wMnDZQor+IIYC7ATDhrl+n/y4fHk2P1JncWcxW5jn8l6EQmgMK1m6zHVp
	7fa/70sq0Y5YKvJvOz5I9AfMDqwBuAd9EmA7n1b7RYqNKHHEAv2wLct+o4qk32Qd
	s/wLXo6x1JoMIQcnIehLY85MM3s8hX12OacTmXILUgGtM7NP8CzYHzVmXGzDugdu
	1Rv6VxcKVma7osebl1zQ4/ljGrO6fjPhzyovpOr8QpmXwn3k4zSkl4sUrpenkiiB
	zIW/uhZGET3a2EHhLPEUp3iKHHKlkowMg6NesH38zWdlsrqFkHB4pEqFd4JQcirc
	La35mg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu9qvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:45:12 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7c0dea734a8so17403597b3.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503512; x=1779108312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as+Eb/DRPDzFIgx5gcstJyS2F7gPE3qAatW5+WlePd8=;
        b=WIhMTD9b6HDR7h7P55h5P8ooo3C6s5yU3JmxG5Yz5BOb7phoEPptCqFHKKx+PSSIRJ
         osBzI33vOhIj6tfI3otmfkRB+A+RMh34hRo13EOcEDRrXPcycEFbvVqk0yUONqDm7n4T
         0kyKRRNMfpQLB5JFX1wA4eKDtXa/PGbx6SEFOvJltbIdvsb6aX5ZNwFVf8wB5afKs0B/
         sYjC5ZgQyr6Y1h/uvNnsSlI+Q94o0dHqvSmzb3+uaXja6nuiYZQFDtRvBpbhDx/rvnGl
         hfMKEI9J/QdxxLjc+zUuWglE+h66pehHTeuwU4A1GqMIy8855iA2C6oBNq3YIgsM2kVU
         wycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503512; x=1779108312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=as+Eb/DRPDzFIgx5gcstJyS2F7gPE3qAatW5+WlePd8=;
        b=KerwduRgRipLZKxsIgw1qLZuvVoCFUOJ9wAwDUyTE8QZWGwYbnD3DZ26oi9iJ74AZp
         nAeA+PkmCBsDCezI9YhWnnoyNntvYTHKD4D3WLlU8F36FXYmLcWZ7rArFwO7x+WcC/yg
         c9Ybh9JH4Y5Co356wst0AiFc6FXewUDz5QRjjtRzuiO9xUBKY4LnnZL8zJKNx+EqasZm
         jAVSGT6jxkgtXhLGCKyTuNLUMWYldevctVCzRgAMpu5aGLeHBQ48bQmHEoIq1cE297xF
         fg5YLTJQwaPIIOei6QQsmTnJLKnNe38v09DFJJVMCf7+z3LpvGMN6mu1lfMiUmgEumfL
         ln4A==
X-Forwarded-Encrypted: i=1; AFNElJ/+FD0p8FLKyH0jSQ+SDNCIXD/+OAqlm8nGqm88DkNdzy8h2jSv8E3P5yqZbzv1lvq4L+DrsK2dqmF6@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjtYlc18GQadKahtpwrQ+If2eH6HEFTX4AfUm/wudWTwXt9Qs
	Kz0cxIRZGk1AqO+PSA9eaiMn0dMwQCA7QlqPf4FujNxctTh+cSxSi1kBxgx4FJ0qAj+wTQZtiUw
	6ec5QzffnEOnTFEWu1TT88lrWF3Z1Vnb2M6FwBkICo2BuETy5Lh6qnvyVW6+/+Vhg
X-Gm-Gg: Acq92OEDofkg++KsvOTaHs6eawYZdEmqoPInTP+DfLmYgXhTCpLdaakOiBj6wJuGRIb
	y65ZaSVeY/Gv5+gXcPpShxnBX1gAaQ1ghRU6ZNgu+6Qf2yk4I0FIy91lnGVkXTJCHP0nDSvFBPf
	pEOsgUGlDL0doyGiTCvInuOlbO/JF6jTVqTKkKouByLwoOH1I1j0VZ+GO5byP4HNb2iETGSjQqd
	kkUleIavwZiUtipnyD6I2ed8vZxFXTQpHt9Bpwp/suCcGu7qDiIi5pnH93d3xh/gOxYl4Gy2Woe
	kOlaLH90zTP8VXPwr22yuhlGgNUga8TunEN4OU7+CMOq3pHZoPHNhuxrUHafJY5mEPWCH8dcwXS
	vh/K9+twXhMEn0LD3WyXTFMC6Pk1UwQC/C+SlQZyxMSxoTOXH4QP44Ml1Qc3MD4clhC+Hm+NFEw
	43raIPKNy9seQPKEG4Y6qkQ3Jssl9XS+zmuw==
X-Received: by 2002:a05:690c:a012:b0:7b8:7855:4d37 with SMTP id 00721157ae682-7bdf5dc6f20mr203542717b3.13.1778503511822;
        Mon, 11 May 2026 05:45:11 -0700 (PDT)
X-Received: by 2002:a05:690c:a012:b0:7b8:7855:4d37 with SMTP id 00721157ae682-7bdf5dc6f20mr203542387b3.13.1778503511287;
        Mon, 11 May 2026 05:45:11 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:45:10 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:24 +0530
Subject: [PATCH v9 6/6] arm64: defconfig: Enable Qualcomm reference device
 EC driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-6-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=788;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=BOYXG53bdi2XjvZ92ZYJP4VZld7lbUMGFXpmLhK3Xv8=;
 b=+MyicJXnA4tzbG5S/Yus7WbBggmWS/SZ8DpIDufSxWI1PvyDWXpW6drYh4Mlw9JRkVAfDTGMT
 ix92tXPJrDXBJacUaH5em/tn005lalBL9XJ9q9WV0FeH+9VOuoQckOn
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01cf58 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=p1egL3lCMx1E4hDV5aEA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfXwORxANS09yCD
 vfjCjQL9b2SoLzjlCOeW5d2wozTxspgUHVJ8cDevKp3b53zYkWGIPyi0Lmt3nxRR9qwDEZ2AYcP
 BoiUoFpdKc/RkItG0upLGHWYu8lxiBxiOzw98NGFyEj6rIWFPwjHbZo15M0xsIyAICrhvNu3IX6
 xURZaPbdOyUDiomfBsJ34Pt1XcugNfCHkzOa8kiymhZsNyOAl2Oszw6nZex1A/pDK6DNpiLhLDr
 z58STShesabFuiCcUJapcCj8m5mZlsl8A43ahMT3cR9Vw1pSwn+WXh64xHD8ZeYWDqTbpES8sfz
 Bdb4mDxmX0RUSa+3r5g5VjSfXvliv14WwhRlSip4HXlNa15bFgl9Dqzg70/f0/WCBQQM3d3oQB9
 OXVpSXPqDKnavWDcj38O7zSa/09sjHFEKUEiepsFdmu3Fgr9LIUz1EZziXpbwo27bseG+mWuExg
 B8GyyoX+d2jaiw3Ucow==
X-Proofpoint-ORIG-GUID: PIFyIy3R9WfJLJyUueBon79V66cl6xPU
X-Proofpoint-GUID: PIFyIy3R9WfJLJyUueBon79V66cl6xPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141

Enable EC_QCOM_HAMOA as a module to support the embedded controller
found on Qualcomm CRD reference devices such as Hamoa and Glymur.

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e5f1901ee408..52ab5ffe29ce 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1415,6 +1415,7 @@ CONFIG_EC_ACER_ASPIRE1=m
 CONFIG_EC_HUAWEI_GAOKUN=m
 CONFIG_EC_LENOVO_YOGA_C630=m
 CONFIG_EC_LENOVO_THINKPAD_T14S=m
+CONFIG_EC_QCOM_HAMOA=m
 CONFIG_COMMON_CLK_APPLE_NCO=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y

-- 
2.34.1

