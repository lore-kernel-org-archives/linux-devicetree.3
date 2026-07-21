Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ECD9475
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658639; cv=none; b=MdeevKinaD+ntskBz9jzNiwfU/qATWYPTfZGPeykFLFt+2j0Cn8GjbILACtAhjZqwXt8IozZJ40INz28FD1rvwjacsEMHJcM3RMEFrvs0JwvnnU2PKvF/KBOxyqmupjKyES1potorxchaZloZzqTNBR+O2orKUrq7y5oQd4e0iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658639; c=relaxed/simple;
	bh=1Pqkbn5hqyaopJdPtLk1GZ1hiRSynhXLrLidzGpt6kA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skYJZ0R7B+xg3zzr6A20FE7rHNEy+KTzUNt8CmhjkOO4L7Pb8CuDe85BntGvzm71i6ZPlbEuWn3hImAlaRbH2w7E88fi2KF1+hmwN3W9v39wQpI5Kbx1El/BUr4HNTwz0garp6MOCor/htHjun47nl3jEetaRYQJnWDgPanbyqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrxigoRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHckUvZy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrxigoRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHckUvZy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHROqd2446214
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEidTGfd350NiX6LoG1ghdp8DPr/Yhbw72CSSnvfE+k=; b=mrxigoRUd0QEc7eY
	LecMBY7uqL3YyHm5Vh6n0Xx0ubg0glPl9ChemIeT5G558r7Je/jk30nYm8EHrAe4
	KqplHgp0NNG4pjLk6ahsXtNH4A2/8bEy/EFopVKLABgpJ5PycIavLuyIMf5qywrm
	EV/kNWTzedceZH7XL9OZb8VadDu4BIxAVetijYH5MEazFyRwpeDoZ5eNlkwEqdYC
	ZBHO1PA4Kkc6hOysSNR+7UMnb0n7OzeHlars+dwU0LaYhhJXupBIG5m/7DDj9ikb
	qQUKfDz6J+U4PmIT2NDstelXXrOtoCuRo7C22+9/bl3TfgJNWA+2spHCufMp81NK
	3LAcxg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d09ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so6205151a12.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658635; x=1785263435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEidTGfd350NiX6LoG1ghdp8DPr/Yhbw72CSSnvfE+k=;
        b=jHckUvZyv0Fi1RYElyYMIGeaeHJ4PA5sMI8hWq93U5POYDITyFJ/pKYRp3vCHu6iE/
         HKN719SM0NqEmk1jdGhYfADOY0TnOMvKhwqMXEVH5cyN1cTRkcRtg2qLazCRs+4Hs7QG
         MKfn5s1n4M8y6CxienyH8PoPzzfT9vnXqLnonFIbBqvZuJNP/XdPwYCJS5HTH8Vu6FMa
         rV/fd5XvVDP5HsJLwQtpwV/jvCYLtnycsgXE+KqPu4MbFwCbQi4CLYkunjQSRP1LZUqa
         OdHAOk+5wNyCJ+pwdGAQsSSetxuPu4MLZ+E8y/djDfIK8uqiX3fFwvthyBAz+NN1wJoY
         HkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658635; x=1785263435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEidTGfd350NiX6LoG1ghdp8DPr/Yhbw72CSSnvfE+k=;
        b=Vsm7llRGsD5b3cjUdVUyUDpVuu3SGg9V/3TnmKtvJPgs+cP+wAgvAxwLGZrFXyx/3x
         J+2qPbJHd3ECXm84q8K4Cnyo1+yTL8vCvUD6AUCP8s8lhbMVwyrDHN0UVC9TxVBea4uH
         ss0GiyQ2xvOXLUZDW14oByhd4rcE+E4/zMNG1kPFZ8HrVH9OYsKxi4u5tVMbJx6oMaEf
         VWYkZfjN6NbtbyDmwYWrNZRxwG4O9qwdpNjNnfCe1Xmva90FTlk0IxUZd8t4mSFgERzL
         zOPJhXMd7Q7DoQLUHthPKQomQ5b1rg8Snm+lYKZjHwCyuAdUi6rax7LO80iJ/TQo2ORZ
         hLSg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8KtLTTrxqSF75VPxLSIGx8t0FDPQmBvEwth6X/0vHDTOxN47TtQZqQC7swHIoaKRv3K/qvMHOSXDo@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfPZrKREWTwNbpa4xXbId6cNypCW1e4HIt+SN4KYrDJZ0TGf9
	qbQd8F6nJI5ojr86EtllPXCUrccOislYdu/gzQk87OUYLksYm2rIw/kP1s+2Oxw6duwEgYg4aIX
	Jt+r72lX/TLAJHg0nfOzhQ6oArZ1vO/abJkECrOes4Qm3lnb4AAcTV/iQnyBgXMOP
X-Gm-Gg: AR+sD128tJ03C5TYdjf2l48kn/tTyxPUzuz3zIICHi1h64rORgcBylT+JxYhHuhNMnh
	HEKmPYOuF2GtvpUXrqECBslDr58DJcGqZliTC2u4rIKgVBFrgQApCglKX/V0uhUT/cbbv/aiCS2
	X11EAj7GH7KFUbzpOj3GfIHrZcI+G0+l4gsxt2MxxwQ4Tip7zUWpnX1WhjwznwI1wsK+fIfGHxi
	QGVjyO/RFj7Qj99O+/MrlBPMmfPliFgaXbUQhyHk6Sc9M8+wJyR8rHg6pd1kL4LnTCE5FqwQPKY
	9plqk36DusGO0ZaIjdSHIQXYyDmUxClVkkmgEh7HXNmc4CUBMPOqv/PgqOx0n4GBHoK3Bg36/s7
	xLR9VcUPk9Jy2lTUBl413gVuBba7SLh654yY=
X-Received: by 2002:a05:6a21:1519:b0:3c3:a168:edc3 with SMTP id adf61e73a8af0-3c3ad9717dfmr18425050637.38.1784658635044;
        Tue, 21 Jul 2026 11:30:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:1519:b0:3c3:a168:edc3 with SMTP id adf61e73a8af0-3c3ad9717dfmr18425002637.38.1784658634346;
        Tue, 21 Jul 2026 11:30:34 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:34 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:08 +0530
Subject: [PATCH v2 03/10] arm64: dts: qcom: pm7250b: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-3-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658613; l=1061;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=1Pqkbn5hqyaopJdPtLk1GZ1hiRSynhXLrLidzGpt6kA=;
 b=r+mqADAgAa8soyrr+zhORuKC+Ata4LvpjcvZnshc5slhLBFPR6j6Bfx+Ks4Zt4cc2Ik/QP2Gd
 MSioR7R54YzDtYEYJmrUjAwlYfg8mQ3u3HkB/cF1Yx4JRaRgyURrnlS
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: 05UwomdlofwI0YTDyCvhPXlUQhNuxdZ0
X-Proofpoint-ORIG-GUID: 05UwomdlofwI0YTDyCvhPXlUQhNuxdZ0
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5fbacc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX/baZrvONu1Pr
 Sffwxi1xNwu/LQ6CJvJ8NyaHyIK2XSzRxAr+oWX+B+CKxPCD0s6QYKSAcnF+ZeAzmgA2rw2WLnW
 J2GsKZ5oZ+62WE2dqsTW7vnOEVkrwiS47+kGjDxiVZwGQEcyZi2myObS3kUm+1P86XXF7RlRvRg
 GAAHfgH+HTs84s9nQyg4NlS9GkYm7Gf7WUyjs9lS7CZ3IdrMt7nJL3UbGglydMYYjMh1kl+/ObI
 KerAI8vr34ewlmLBrnjEpMymcyS5/Qmm4EJbLJELtUqSI//T/wIKVLlPJ11S67fY6RgsV6POUQ7
 U1868DlGGDtQm/HDEsCcEORSeDTcB7TLhpWAUNVy+zMMjkO3pjxFLHM1OuzwGR2q+Nxd6mz9X/8
 bTyC8NhQrcpCWcxYrKc6AhY4kHJp9xK5S9i7I4oI4s10YRA9BTMXflmW0Qxw1EEyXTx/Sen/pzZ
 wK1a3PmbKKyOeOcEo6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXwwaOwiVw9KkU
 PWUuVjXd1AgSdR/MRuLh/sFH4XYt+mZdmefgGGPGJwEkbkUHdFHU2WVPQ4pBNd6GAb/O3XcjAfo
 tPzZ9hS8vIxkznwQgDZP7ljvCs64n5I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..1d358aeda9b2 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -89,6 +89,15 @@ pm7250b_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		sensor@1d00 {
+			compatible = "qcom,pm7250b-bcl";
+			reg = <0x1d00>;
+			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.43.0

