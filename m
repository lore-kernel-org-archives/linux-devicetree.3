Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4770839CD0B
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915089; cv=none; b=oKEuVHr3iKLHH5Yw2hYThQG0YymAi8Q2c7nMSywAi+TCwfIxD9cMmeo1iLqqIOhh9kv+lk2A/lIT7zfjufrKTfG7/CcrJ4mi2GPCJaWNMdTI5WQrTCwVvf32NtDj6fu7nc7Vu7cBdLV0zHtV8PNf/rypisnnGaWYgodk+etdiz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915089; c=relaxed/simple;
	bh=Frn8F3/WSjB/2UM38//Jz9U2YswF2AZpqHhW/mkWanE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U75sL5lLEWvnmHAdMEyiBFZI+ogeyB67ajznw28jVHxyoawvRms9TklLQR0ZgdeaAhPrOAoV8YiL76+l5hys7+O6JaYbTv/AOrToDjH8qFE28mTWKbQl/ayZ4JmjrUIUun/PFa1EYmx/qAPT+HKvHvz5/n2Pd0lz/Ge1yyWYPe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGqixn4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFZaPWly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGqixn4B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFZaPWly"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoOac2288613
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rOtJc6KOwiBetJpPNrfLYP
	AYSiuWhf9sniFGWhrMdfM=; b=UGqixn4Bv8Ozbg3dLs4C8Y+ztZzI2apKW2R4G+
	3oDCn2tEMFy4i9smgnC4hEbPEfpLn5irBYUy2d2pO854GMVZH1rKfofLeX3aBm/t
	z+pCBdtdGS0/z9JLzZRY0QzwjuxDMCi93vvi5exK9kY/FCWNgxJgLfe0bxSALbe5
	PlcQPrQx1I+ovWlKj+sJq23mBx1xtW56MYcJMeU5IrazIZ1Zo08lMsniTk7uLvL/
	lbQLPXA+LBGfl/nUz8PeLw9vzKYVHVSCa7yDOXlcBC1BDJMC35ks0sdteAAxg5h8
	W7qOodtT70AoFOHHvRJuAnrS14u03eUUbcqMu2jaHUEyALcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnuh62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:38:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1b824e84so488952485a.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789915080; x=1790519880; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rOtJc6KOwiBetJpPNrfLYPAYSiuWhf9sniFGWhrMdfM=;
        b=YFZaPWlyQ7PpJiOtLQCsVbAKIADkhFtotgnprz9Pgn5K+/untjr0AcWuHTYEAlGq79
         iyTNdA4kiubjZ92mmmfTAdszwVE3Rs0wn5EhI2GZDPyl3BYJXEIsPkW9KiGorn0nQTIF
         xP5VnUGfbZ54ruJM3/THWpI+ONImKNR9ix2OX7qLqcnc0f64jk22p8SMkbnrrsa275NO
         vpN4mqyWGEd5rP026vB83rJ2H+kfYnwhBe6TUNS2xmNfdSi8Wa+I9A0a/c8asXI8MoeR
         yW506+WwWMh3bUbgcskTeRVXNIt/TXeaOxr5SS3L+lXZu0HQv5EGKM26kBR3XNNLTO0r
         eUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789915080; x=1790519880;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOtJc6KOwiBetJpPNrfLYPAYSiuWhf9sniFGWhrMdfM=;
        b=pbJoTdUbeiBD54nd36s1BlaECrbM8iYyieqXkViRaNHuz4br5fCwCHZ6t6Pn1G7xO2
         pAezOFOtjpLB2cJ1xq15q/ajYxsF4tBsXQjkkcE1lmBUvZ90V3EYIHLqOz6ldL9CfJyX
         G14nag1iYQCLcERdfNkyA95z43FC651LiP8SFj1lZJeNP8lZG5s5Kjxc+NJmNljr+JBt
         xpwFBMzqHvZ3tKNpNqK97gosyXfw3crLYsaLlzyjfMl7iH9i6x8KymufCvrQ15etkUnS
         QVwxUe67J2+tiP/xz1PKZVNatHNoDBR9axqCVaxhbrlJ7J81WR+azC1ERJRgJvMzc5aH
         xYaQ==
X-Forwarded-Encrypted: i=1; AKwUvByVtec6DTWZM9ljehW5y7OXFhX+g1CZOlOnsFbONvhqgKD2Vdu9gH+mWcNhCiqIK0wpHvUC7RcyYIbe@vger.kernel.org
X-Gm-Message-State: AFuF++nH1LbQUXljOE6Bh0bOyHiLaF3SlIppMsczyOCQKNNzNemB/CAi
	nhbzTvYDT7gJJmaBAca36kKhpj4L9xtBEUsVkK8sGO/W6/Zn1bOrzLuPxMhRbh+t3CxsDL/VKcT
	zIF+9NjPPIFdn7S70Gzi84SbPoPJTWcj6/dhkmHzuX2CH98hYv7mOv6RyDnL6DjkJ
X-Gm-Gg: AYBFou3r6QoJD0N5pLkVs37+lx6GcI91AzBJPUimwKv+4AA1KFgw0uC9AJux07DPeZt
	dnTRs1+564ggrHZyCiU6COsedRIWvXnHE7OL0if957QDnQs0oY+bkQooDREbYDqbbXDd/uD7Cgk
	X7on5bbXB1R2RMiZCrEhjhsmoF5D6rvvWNu83cEHbHf/pA5hY0S7Uh44k04VavjCuBypRelsH2j
	wAMqJg9EJZGfrAR/SN9KEeiA5HxQa0Xsya5HqG9Yy6NuhflNAZmiYQylxu2exl1tLWSIGE3cPVu
	YpitPQ/J7chECQ6hv7j61zvWPJNbkq8bx1QG1UGBYYhp6bXigDF3CrIycoQuMLqv8K9Z9c8Odab
	5dVztkHnparhgbtF3sSMlJmPjXISRwVx6s95HdmG0E3K7MLFvzQkbwDXBDM4Sgl07ZaABp71z1I
	umLhtq/yq6+TrQ
X-Received: by 2002:a05:620a:6886:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93bf576b39fmr570054285a.59.1789915080272;
        Sun, 20 Sep 2026 07:38:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6886:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93bf576b39fmr570051685a.59.1789915079858;
        Sun, 20 Sep 2026 07:37:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c78c1549sm1251055e87.4.2026.09.20.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:37:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: usb: qcom,pmic-typec: two small fixes
Date: Sun, 20 Sep 2026 17:37:55 +0300
Message-Id: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPvr2oC/y2N0QrCMBAEf6XcswcxUmv9FemDiVs9wVpzSRFK/
 91T+zgwOzuTIgmUjtVMCZOoPAeD7aaieDsPV7BcjMk7v3etd9zLm3McHzyFohxEGYddjybWTd0
 6st2YYNKveer+rCXcEfM3tBoJr2JnedWW5QMJnpGAigAAAA==
X-Change-ID: 20260920-fix-tcpm-vbus-bis-e83fe7c57590
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=693;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Frn8F3/WSjB/2UM38//Jz9U2YswF2AZpqHhW/mkWanE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr+/EB7HnvhDIrbk/6YKk+41kYownOr8vK3cUL
 PUdiVhEoCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/vxAAKCRCLPIo+Aiko
 1exVB/9pV35mxhnr1crJqWnl3F/iv8dZX4M7ZSGb8oC107Hx7eoFAqqn2hwrKnVRv8hGu7NB72C
 QamXoFER0NCWfvVpqxIFfq6nPCNwLUna7Knij0U0Dft58+bZy42qOmeGDPWztXok/uonzkKeMy0
 uXHcvdIf5Z+xDezZkJXJvFqeCdW/iOnVjJSdoP8c6wd9RqOm3XUv3VDUu+NGKCjtI9/rlXV8sAv
 VJRI4LaBvuXq/het5dvO9SD6faJ320CmUvvMJ6mw83wEpDzhL1K9050Zla0bfEXMK+ld4zFoolE
 dq07y4zXB+fqd2fSD6porLbCGQjVp3ymQI074LrCOapyzc9z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aafefc8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=nSv7VxSjxcQYhaeNqXUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfX2WKoAnrwSNC8
 MKfkKhZ23tJwVX7nzAyq+1d2leGQxTIOrW46RGohYCyBlIxiakc5rxdgi3fSt+BVSzckRK7JNBJ
 9GwRTaI9oHLim7ui7UeMO7b7OFnoDhA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfX1UdGWH6DHx9H
 jF7g+kgLVMFU1XnKdD6iXz9lYYRBFIP+EkHl45c3bd1458Vqe/lr+fkM4/UbpW5E41jkCa/3AJp
 FghXicmc38mftw4ZmNnR2brRKHLP9m5r4aDN+oGEe04INxFzCK4PJt7kBHnijBuyZMgpWI2ddxS
 IZFTcrWSQdjjfuHc5ZfJdp5mgEbKd+th9Yp7+7fmQawXzbgfUBf2Zo2UXVw87Bnx2YwAEaHYrhS
 nd6iNaiVoQTjPvItlWaQ4LgMGiGS0ZssCFtXB6GcZANeHQriTHj7pWei1nNOkKAD8kOj87HcbL4
 pOu0TbbC/smreUUzOZwtuGxemCWyxLRoqUhtj68W5GonVQh3bd1E/jf+gW6wSoUQPGrM2TTmu7B
 GppBK8oTgwH90owWqYu2WezJ/7aS4OBsZ9KfeheDeDD1pwBD4NbSEbw2UUe3x9CV4on9om76/sR
 s6U+3Zn+bSIXaZ6gKbg==
X-Proofpoint-ORIG-GUID: zNlBrTAT_yxT5o6icURsLKgzOc_SO5sW
X-Proofpoint-GUID: zNlBrTAT_yxT5o6icURsLKgzOc_SO5sW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200212

Two fixes for the Qualcomm PMIC Type-C VBUS rework ([1])

[1] https://patch.msgid.link/20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      dt-bindings: usb: qcom,pmic-types: require one of the VBUS sources
      dt-bindings: usb: qcom,pmic-types: make example use generic VBUS property

 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260920-fix-tcpm-vbus-bis-e83fe7c57590

Best regards,
--  
With best wishes
Dmitry

