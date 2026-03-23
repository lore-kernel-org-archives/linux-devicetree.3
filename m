Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE74938759C
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259789; cv=none; b=npm7yeeG7R61jwU0r8Y4oKskLEtH5njzmdw0Cat9zG7B4FbQiuMeT6nh8S1u8bzCiy3zfIrYRym7ZvcfrA2ZPP97CFxoVtkFc5s5ZeIbsVFFoucB+Gw0CFO/i5I09YaT3o7ACv3i+MKHqm6qtLs0O7rCSHH85LG8UiQI1x/RnzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259789; c=relaxed/simple;
	bh=jZd1elVC2jwr1sG4IjCESKA4jXTEcio3gFjTMjPuVxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BdDPONAd15IPktxVHC+fEfbXiUu2ehnpTylHVT0q3Ink7xiFT3q3VA+ANgNsXhKBUxkLqL7t+bFbThxbkahDG1WIp+Wl3ir7GmntzHgO7qbE3yVqzWinD/arqf8/lygj3fiPyn3U64ySciJEgeOe5mwRHzQncgxMM1cKACbV3Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORjHQ8aj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXefMuhX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORjHQ8aj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXefMuhX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7H8tK1301211
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GoF7C+0OzvK3HZkaEk+SFwd5SJVOv6KxC/HGxRU3XUI=; b=ORjHQ8ajLR4jVPrU
	Y0LhdWi+fwYbnrjYkp7tuXLLS2KivJXuP+mWaL2nkDxoey4qNMYq8Ztfelda+O7n
	p7vN6SvWxJFsvIRenSHwByvvIXiy2w2guy5CsNEsvyX74fFcF9p4xAc6CPabcgPR
	5SpT3U6THEc6qhvARViwnsh0k3weT9MfavtjRJanepFLio4CJ3UiFXPAuT73/vM6
	8Z57pEumqXGlQXZH5kaT31TZzy3ZPCSChMskYhNxKmiIYfjrQJ7ebRf5ErZOfS3I
	Q9eSU7+bRiQ/eIHf0R3foDiTAdlUdRmr+LCDplWyHgn41fi4CKahmPwfqUZumpsu
	TC7PYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcpy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:56:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso37090051cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259786; x=1774864586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoF7C+0OzvK3HZkaEk+SFwd5SJVOv6KxC/HGxRU3XUI=;
        b=SXefMuhXqUIulKgDKgvVRrsmh6mgTNE2H8LSXaAWlqd8R6ZXxIGgun7T02cEHnMBMh
         OLoNSc+bRQz7otV7FhJmoV4JdYdbgpapO3Z1tJ78CSVVeuwPNlHZtmE8qQp1FYpWBHf5
         bgsQ/znXawJqrY8UBgJJmTXAPI0v+zNgSbtu0TL8t7HcFLEBcxauDHnnOQ1kqzOonp6x
         C29SFVDWrdQpmTqXeihGMKnAtoXQkyCTACGz97XGTRkxHfvgm5h0tSI2rv/otMQ+f43P
         KcSvTrKQcpoD/ll47qfDWsSoGoOXUJiCuu1p6Zl6Llv1L4rkMrU4MQPFL/gxJuUPyk33
         rn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259786; x=1774864586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GoF7C+0OzvK3HZkaEk+SFwd5SJVOv6KxC/HGxRU3XUI=;
        b=kzTpyJstKEDOQdcCPe2RfP0an0Wxac8trty0rpohQybLJ5i1rty/m4UIoPWRq4Hhgw
         sjabQNKF4Amsp2JlRGLQIKg9cvgFCwbNjW5o0y4ADZbjCJ2p15CMT47y17NM+MZaInEG
         NxS1hspp4BD0QStUG7c7mP1OhnCEjm19IRocNkVmUzfFX6bw8Lfp594CpOQholTGzq5e
         PfJQ+dhgGVAeZ/jIxIKy/yhQ6+QDJm61KlBd8Hags2pt+8OeTLdMGKKD9yBPOQ6xG6Ya
         FnAdObfVZ5SKER2A/SGU4zUEnKTuFUwu3K6pU/DALBRDIWbvhUD56Pyb56+BBaMtqoee
         oZ7A==
X-Forwarded-Encrypted: i=1; AJvYcCWfdAjqrnOl3rYtcVzEPl+dbFOn5oxjhA/IHUqVNVLxweoC0aLOQBPCUeMTov3JW367PaLi1qpm5gdE@vger.kernel.org
X-Gm-Message-State: AOJu0YyRWVniAUV+rkRj2r0SV/dwEg38XE1VwuraaEv6s0rsOpOt6ZIZ
	lvoz6D1i9oa3sHKxhGAh3kTEiYCwTabfdYZA0dFw4N/PJdd+DbUEWdm8pITt7zB65eg6tHPmK7j
	+wyodjkY5Kb2OEphtdUQO9lpy23ffKY+u3rMyF/y+MYWk6tIa5xP7F+W0j3gyJi9ru11QTs5j
X-Gm-Gg: ATEYQzyjh5tEhMHN/E1fhJ2P6g2mhdO+MFo7kpqygwiQk7+oo1ot+zFYP2qz73sXR39
	8o7LRoGi3o3wIU4ygmvbOREMZ8Ue5kH4ZSYiP4kgjuhu6rukcB21Ck7XAMr+PoL19hVKcnTk1YA
	u5rqW6xp+2CIyMffhSvhTppgVRnmhJjgBIhVsIls7FUd39qlITkML3pw26PD5Wf+/HpD/Yf9n54
	4kN5g7xWB/oqLjzxslErNlDwZKeoc9dXeO+p9mcUjrTu2NwQNqRTCLx9wr2rD7t2fNOxceH9D1r
	fRX76OeLo3XpDdNvKMgHQsVT3eVTOSRNM/+TnG6woDASF4SOij9XpR2QDE/XxWDfBXm9XWh/p0k
	qyPrgNu7Y0BHUoNJQ+NiMeIrvFwefFqCcHqyZVdSGB3IRGCtaVn4=
X-Received: by 2002:a05:622a:5c87:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50b3746f5cdmr171184511cf.32.1774259786212;
        Mon, 23 Mar 2026 02:56:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5c87:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50b3746f5cdmr171184201cf.32.1774259785772;
        Mon, 23 Mar 2026 02:56:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:abd5:2e93:595d:57eb])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cfdb4659sm3688967a12.13.2026.03.23.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:56:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@kernel.org>
Subject: Re: (subset) [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
Date: Mon, 23 Mar 2026 10:56:20 +0100
Message-ID: <177425976898.21144.1074460491522922532.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c10e4b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=cqmKwl5xsonCTfQwjNEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: 95n1C30jmqMihZdlYce3rEOlcGFXbeXP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfXxfngsDJxyen+
 gCidjB7x5g/zXQw9VbWDUusTc4rMftcK6uu6Ugg3HXZ+mHpAvFZsLqoBD8flfJEyaTo2FmKuFI8
 A38Ww9FXxXcL6EYydxcazrfWlPLCy5swv2uhgQNBsuka6Ol5PwE5MlryBGpOJ+ZLrQ2QQS4MK1e
 uHZraBN0syRnmwkF2R/2IEVH8/hPl8Luhpy5i5w5mvMWEcLhTuXfVrS+c+Jf7c2IPd5sx9n/N5+
 sCWJldHCNGcFc/NgoAcz4eSOd2yvGY1Iekwh+Nab+pSYkK6XnJmhLGqpaTvQrX5QVASSlaSRPQA
 F3NZ5z1LpF7HC1OpFxWAJat+6+FbSNDZsVM/LJ+N+RAqznM0v81ROgR8dTR4iOo8tzp5kBhTyY7
 jnCqSWEIHmNzxkumsMOPe/daqICEjEZ42hi098YsW3uk3n0cdgqrOiKjH2h0DLFa4EQJQsXAkBw
 h9+8jVMHLReQH5LzuWg==
X-Proofpoint-GUID: 95n1C30jmqMihZdlYce3rEOlcGFXbeXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076


On Wed, 18 Mar 2026 11:04:31 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Here's a v3 with an extra patch updating the gpio binding from fished
> out from my old branch, fixing the examples and setting the permitted
> values of gpios for the controllers on polarfire soc and the existing
> binding patch's example fixed.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: gpio: fix microchip,mpfs-gpio interrupt documentation
      https://git.kernel.org/brgl/c/ececb46fc947705f22cc8c1f9182224e7ec4bb97

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
