Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7C446BF9
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109430; cv=none; b=T1iXbSAoz+pQjLuXfafZmeSqatx3ET/30+bcp78245V1rtB+y/PPKyZzhGmLUr3hh5vFB+RX1ngfQBf6ImrLPQJsxVbiSaav/0dlpeaQa+P0o/yRa3JwIxugw3zqXxWYWZ8grVr5R3bqG/o0+DPSsFYpzLn38NFsluWN8u5xFmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109430; c=relaxed/simple;
	bh=vXbtYJ/0QnNJmWuNtoAZa8iC/TA2rpk9NVH6xFuPuFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VT9Ni01D15998JijoN4KZ3t+/duUweKNwHslGfJzQzqGa1ufGNQ3GO+TJculzpJwXYXV/3BJ6Cz4HVQjnftSWnsyYhwradHtHoqscdrUL0PsrOP0hdjAchluaFcpHNYhHBj+OG8bigHZs1Jtf08p2HfwnP5rfVK4BvfNZD2vbjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBCoHoQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6KIcWuc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBCoHoQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6KIcWuc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kRh22696020
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=; b=hBCoHoQXZsdmquwU
	MnyG3RvMoGRC6xJ8C2QIOEMsfWTrIsq7s0zgy4yRtWro8YKXfBrJtK7LkazUm/PJ
	4pLdaoEYtrKZWgOfHT+UjHeLIZoMVF2Q8GAze8RAKUXzUqp9BZj+vD38SHv/57vH
	iHC/6//G6ySZLxBpE62KjmWmUm6V1k17ClHf5d689r5KT0x/5zyqIGuK7v01FGle
	smq9BEMXRSrkhTLfmRy2M4ZlaSnJUFuHFPool0g0uHiDTrH8NL3uNN171TmK/QH7
	uDdj1J1t//qzSMaMVrHUN9tKKqPgknu15t618n30dggXZK7JGlp+eoHUzG9QZE6U
	Q6cNaQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfg23n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so754885a91.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109414; x=1789714214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=;
        b=R6KIcWucZYOeLyKIf2NMm3IJcUZ23VRrYiRgZiCw6dmgrfrmp562HYJhTU3zXZSNPx
         soSwTnmvFMHJPLuY/Sm3OOSgML0IP1tlK32RfcMtn1GBU/xfi3pJFycIY+c7yytmJCfh
         juCRBDqZ/KtTl6zW8LHkKg9BdrXeSAbuCC/Z2nGnEhwZaFiLSAVRw3kVJic+Cgc8jYO4
         Tp/seC9codH1ScCTQRM37ZLRtL9rHkezoaI30I14vq38X/kqqnJKh7972bwfAIFzz035
         1v4EpT6GTAvqVGDRiClu9S3ITqgvJLEOuY90FvJW1YaXMSek8Wfza1g/7ecjtEFtqNUa
         j+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109414; x=1789714214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=;
        b=IalbJfSIHTV63yYTKjaRMC8Xcuh36m5MgvTuw5JRkOsN78jLqBUn4DSbK8iWnetR/x
         Sl+HleN6WLMycV2faViSQKVnip77ObXAwcvfVIvuZbzt9L1Ro1Vw50NRL9PXmY4hWBX5
         px0f5s6dJcLp0eVGYC3XWOLMT9jktXTqQzH46DyQ/1MgKC0Gh4VWEI4dTYejtdBexJrv
         HXpnZcGM6ASYqLcMEi/RJstWjJK3WmphKCdmoMrkR8U9GaXjXwiK/RaagLJQE/2WGdIF
         DsexrFNbJJiRKVRJIHKQyGSB2m+VHX2/3DBdxOvqR/gCX/EuNxPu8fNR/Sqbn6d+AsPm
         gIpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM6tq35OaIRqTzv+wnIKiGXU2mRVcJazgBPl+Uua7rtlMzF59Q+c6UOVZoWOjdOvZZzUjfvz2mapTZ@vger.kernel.org
X-Gm-Message-State: AFuF++mP16IbRFwZvkLVueN8dR2pR8g95iJlzO5CYjr03cpU5z76O5qb
	gfh7ncdPtJvmwQeBqhI1CMQEAFsY94v7A4G85pVy2o0nPG0mCL3eJ8XdqGssmepvP7i4twiI+uz
	JYW6E6AFe0Qdv0T/lPIHfBSRCb81Trs40TjWhx4GutGlqWuRdGckjhZmfmQQIC3Cu
X-Gm-Gg: AYBFou3Zmtcj4cRJayi2NB/74coUaqPMP1NJfgoE70QFc00yCX9roZ8pKCRyu9WW1PL
	p6N9mIU5N9Ct7DwTwvQ4ZwSzs40QU12oCQGBmr+oYzO0dBzhBEEX5tAqlMMeyVeSuRR5X2uuv25
	qSxgODW9rEdEzciNwJQb5na/U4kOBGdiKmPckEO47cFcPDEQiF8cS4SLRAlkKplg6hnwtXcQHWT
	/PfCyYnJNu9doLYIbnk3tBKr85fSs7NNeLbvsrQOzqr5yXa++wSRAaM7TrM6EB06Z082cf3l9iT
	3IdtKPo4FUU3uC2jqwNf4D7sTMVukEEqAaaUR8FEaXm8mYRHf26pxeSISfLaVyTkEK73Kb/Ys3O
	hBLhkIVH6mVtm2q78chymNZ7H+YbzFuP0nL0=
X-Received: by 2002:a17:90b:3d4e:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39d9bd8f788mr4863074a91.6.1789109414449;
        Thu, 10 Sep 2026 23:50:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4e:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39d9bd8f788mr4863009a91.6.1789109413867;
        Thu, 10 Sep 2026 23:50:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:02 +0530
Subject: [PATCH 1/8] arm64: dts: qcom: kodiak: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-1-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=972;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vXbtYJ/0QnNJmWuNtoAZa8iC/TA2rpk9NVH6xFuPuFk=;
 b=V/QjQ73NA+Zxxi3EPxnngJjNoeGrZFJhj+/yyYr3kmfD+98g5tZEGBYgE/yxDmW1wvHKLr3ew
 FgzQB+aIWePD6GegNwwisY+IDrIkKOnaEJQK4a25K/k0bRfuBIisaI5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXwQ3dVq0mPv1m
 dGPA2S27s4NVx4AE5Xye2FZ+kWGQg5HZRUT2O2aq2X6nZ68nw6+ZGxAnpmQ1CEENhMABgpuZE9i
 Uhl+rZmRCKXnPEOVoQDzFORj/H+zC0AtlveueSlY9Yb7QUJEGKsJ9DVZEpJdk8lt+VfZCXEHYhC
 B5GwfgcE3KiL/OTuPuqK3DuKpcZi4H6CwB5xE8C/zEBAHlkzn+ee3vOg1+IYwhwx6OIfIKZLTpr
 45D3mBVgXuQ3pUwktyMpqLGVU6Oh+LqM32LATdQEaiSwdOmL1sKwdvTS1VRv0Mf3DU5NtW0bIwt
 6sKAvNm2fnAeC6waAWVlWnaXHdkeH0XYpSgYY/VEWKQZ5z2AqKbZn5Pc+9bShNi6xhgvrIsj+oG
 ie/QRIP3ScRO0aOEKLo39hLoLjcYrcLXdCXWvGrE8CycEoyjbvjbxFTpGrlY+yS+pHGbZCNRKGm
 fJ/BIIAk6JLvKC4+TSQ==
X-Proofpoint-GUID: PfO310yYYHSXDpOjCwD8WX_N3aqKi0MA
X-Proofpoint-ORIG-GUID: PfO310yYYHSXDpOjCwD8WX_N3aqKi0MA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX/U8ARJGzVx6Q
 q6hyQGQVioRBLmOqjNCJXiaioSgZTOJIoS9JocitKXRb7DvBOGcVb1NRXbMCb4251OyvsOVfbmh
 aRmkDYZ/YnqNu+Rcoc1SpxDtl9hviww=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3a4a7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..54acc7d9bdea 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2306,6 +2306,8 @@ pcie0_port: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -2439,6 +2441,8 @@ pcie1_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

