Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152943803D3
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479681; cv=none; b=f23zvwS5FRHYcB2ucsBm+QTvR7i9fCNMJYbQpBRHND8no3UExZaFgXI7xTJ2GwYTREHB45HNFSW6P3GbWsSaVhspjtuhrPBfG9/EM1mPHhNITGyeGHTT/rJQoQzrYKHOT5eV+Yda79GvRaAtuAq2qOJ2q4RyHh5CBbZ86FJW48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479681; c=relaxed/simple;
	bh=inmrcwAHWlNyHPjaFqgBLzw2MtnnZ1YMmIybancc4ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDzyk9ekBoMIbJCW5yKc7FMmy4HWPp4oMDUGjSLSakqbWlMzno8aMqxFzFsg4CIFwQIQrDy6WSocxRPucQ/EphEyohAlXpccx9cHV8Re1lDDrREnOBfaCsCnqUHIwIdILPsdMI+ICTRDzUx14HTFdtspVtftWcX/EmDe28NXZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ps6vkapo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsBS0rHp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ps6vkapo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsBS0rHp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MI9dUx1800948
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rPXJ5mdxZjg
	R/OiigPIU3sYJdeoapA6y9mpY1t0kQEg=; b=Ps6vkapoMZLzl/citYCWY4P441r
	FEWw0laBrTs4lMCHwEs+RcmGQwroRNk50Px/CdH2b4h+muCxGVWvlWujSZuSQ+Dm
	CelQY31qVa4AFSplk0sFKYBHV0gNWW3Y1U3tNyA0zFUpBYKm8EL1aiCmAkGVMeL8
	ovBwG8RXy2sFHpOL3pseNf1d61kZEVqMh52yeFpdJqJyr6zzgTjRp90k0K+0TIDh
	7soY6/6bf50+GrXXuEjPPyL15zM3aH5fH44kIN56SZeAqpg6VoHWMVV59QK1q4Fb
	ilBPbOvOTkXJ0ELs8idMALs1j36VnGfznlz/S+pkmIdG5YbsDP6A/fNa7kQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g25k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b99eb06178so179635965ad.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479679; x=1780084479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPXJ5mdxZjgR/OiigPIU3sYJdeoapA6y9mpY1t0kQEg=;
        b=VsBS0rHpIZOUm+yBEMQ6OUj/Z2qxia6e80BeTQQfFmgibO+eA4BJWvrGiK8mOZ2jbt
         O7NpWRf9r+6DR6mDFDYd1ZqbwVI75WWJRTMtiVjfBI0q9VUKzpJPYF4voJ1WMbBWOx6c
         WW7oF+sc1FUuw90QId+Yzq4mY97lACmfM2HCp54Kn/Po99ruaHci0D4nszrQ+eZaDBA5
         pkYdluXtN8SJeU021Q46cR7pB0sPKRpW1vBEXGY/Sz2pBNF4bGNdOZxG5ZiFdGXfQN//
         gSejybpcF3aVKhJIytOoXivT6YkALdB5zslV/CpmMKunWZLUxODIAtciQrLcjA16bIMl
         Nn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479679; x=1780084479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPXJ5mdxZjgR/OiigPIU3sYJdeoapA6y9mpY1t0kQEg=;
        b=Doexid68cWx1TAKG37DF/xrM2/FBwIoVOhtztIwCm9Lf192iKF5C4R7NnJOe/CU+Nn
         AR4GTwZ1bvmw0ex7eKYIG+fD1ZevpbSLDW40k54knGqtOw2lzQMK5JGhHRjBh0O2VXH9
         +55qp5mbwzBhtVVIDwb5qhpqgXylP6/dCADYiE5+pb/p+Oc8yEl4y+VLCrg1zJ6rC3ec
         Z6Ds7LWBZU0aH86bGB5lW9AeW2CdNjgqOxESIEtrV5aopjNKXbBKeWLKQcm7hKBFBzpc
         oYedVTDMUQECcvNtoC9fH9/I7KzlDBhoadBZIzHFLa4YLsgtey3B84j7iLhe4AyS0kSO
         c5rg==
X-Forwarded-Encrypted: i=1; AFNElJ8XrpXTa4ovomHdl097TXBKOZIxzU6xw+/gA40mU6XAM1X+LYN/Ktkao2xWM0JZfkHIyi0T32X9S0E7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+MG5R655NrMkovZ3wDaS3+GYdSffUZjMlHDBqRBU53R5Bsvdc
	/HK7MXTUTLgCBxwZpu9Qs8bXfvcjPTx5FpXu+LrTMYrsxxeJghhbRKvoWfVSpwq7ywG7/SqLnqa
	MSerWV7Bhfy7EWtSHbUDsGDdQ3ERM0T08kD0dSHUWZu8ArC3PQYrX2QhpSgCbOIe8
X-Gm-Gg: Acq92OG44ipUhSpPnt/Ff7P04aYMqcP65J53jr8mYvbQlm7bZFzl/4XZv+uldyi12is
	rhfPNGWJBrfaxAzYP35Mj0KLWdZKYZ4f0fjpWd1jvxVjc/gYOROV+mPIeT+vY5MeDzjOsl95wyW
	P71E6ORVdPmqd0hTUi33MUmfZkPeVeBX3rG7UMDRMR1vR+bxjqZTb7mptshnZvu1fNTdQC9acit
	pt2A4VD0DVZGqi9mB20NZfP1wSNF5rsqCZCjL/O7/BRMmPJolZDvj/1FqfdWLwJMModwIe0ScPk
	0HhFWGFJVRsBggI8fCvHqnpx3Hat30cIOvM7jR8Qqz4QZzm+BxyWjtFnHuOd8bRaoRJPv21AYJz
	SJYb+jB+e1CESqAEsbYsoNWQbKZrTfAnZpFDAEbTM6mQMk7q6
X-Received: by 2002:a17:902:ce8e:b0:2b2:4f43:b48c with SMTP id d9443c01a7336-2beb0381369mr55169055ad.14.1779479678618;
        Fri, 22 May 2026 12:54:38 -0700 (PDT)
X-Received: by 2002:a17:902:ce8e:b0:2b2:4f43:b48c with SMTP id d9443c01a7336-2beb0381369mr55168795ad.14.1779479678110;
        Fri, 22 May 2026 12:54:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 09/18] arm64: dts: qcom: qdu1000: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:00 +0530
Message-ID: <20260522195009.2961022-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rIUHo50EypnPnBa76JIp5N4NMv_gIriu
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a10b47f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7AAAc7QWiM0iNXn1Wb4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: rIUHo50EypnPnBa76JIp5N4NMv_gIriu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX/l/i094RI/Ke
 RGCtTTVJYWI9fGO1mjm1QfGM2+jWGI1ExnNgupD+xXBc2FbfWh4FpiyiTrrdHv346u4BttasLrW
 aKJm0ZmW4SjTC2yM2e6wbv1cAQhdy2xU6EucgDSi6gDeiMEW0Mks0GxoB5/ZoAVi1fg84n6I+An
 Cr96Zs9k9fjcS+MA2m1hix8qXcN47VXynzZvl8oWfjYM7FvjN+vCj7Lj+pXaDxD303S1odbQotO
 yGoWyaJQNcjGZjgU+HCAkL5eavp44gdz3kLEnTr6MfM9gD0VrFTPE10GMWKC9y8RFlZ6VWfQQie
 XsyvXtNWrFqxYhk2Uwmkin3Lid9jaG+a8ErVHOkaIov19l7fu44PWAEmjuKu1eMLDwS9/6LQri+
 eUckFVePkbhyEsBoaYKlIL7novwk0vVU7Zu4BOpPek/AUNv262i0cYf+vqZqhVarsgEz9Uojnuw
 jCd0fFHea/uUhOu0EIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 952d4270d118..0c6ae3ff06fb 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -171,6 +171,7 @@ cluster_sleep_1: cluster-sleep-1 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-qdu1000", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -1369,6 +1370,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

