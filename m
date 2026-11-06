Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953541;
	b=KkowvzUWsG0sUuxwZMoS3vRL/CTiECjoBxP5nd30V/henalXir0zHCiQ8DSQCPXJfs4G
	 xcT3YtqhFHlL085bXu/C5c2XwD6c2A37QmzBSFNkNw85P93EpPckMt0LewcDdx8EZ6ia+
	 zLBIJYVLOTsjLFirxjCt8PYu0la/Nhyubh9Texh4pRnHkS3MZO9/DNZ2Yg1EBMymWf/et
	 5x4BZhSawcEbZOrTY7GGy03L+QcLmaGZ5iuT6gp56wsbCN5C26sIE3qXpHtj3MBHrtkqQ
	 LI1M3l0DdHlBcjbh6TXyeeTwm7e5tVL1Lyd8QoqdtoLtCV2nk6qv2CcO+svk+aiH+NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
	b=vbwZUvRrCYqadOnqcXwkWtIhqXzBdjswUGHPx6GVpjWGs7MPmJZwmRUNzoLNvHCEhDKK
	 do8hCiElbN7eUsx4QiIwlA9EOyCwVp0qbQZig046d9pDLJEJoeX3hvdnv2wjw+RH/RtSO
	 GByirWAVFPJ9LlbmCt89NQqZQ6ttOcwmYbcDo541F4wZTRTrfZcxApBEpxYCOqSWzTaZO
	 0hbr9N/Fog9mp9FJyUFRpPHXYxcIKzSbVS+7pTMEQteu8V/7wYn10r8y8g4W8liEzKlGa
	 lmAnUla//LaP7Y+B5W+h1SnI2y8He1jpzvxz37ItyvHo0vw3Ug9GD7jcccqzsQhb3FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4dBQpc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvx9t0t3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D00606A33D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D00606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4dBQpc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvx9t0t3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RUeK3284479
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 08:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xtBrngpMGCe
	Q6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=; b=nb4dBQpcclDhdFZH0+sibeHUTGO
	TQqHVBm1saZQDojMKIWH5sg7pqbDZBmpqp4G3nu58L2s0l3r9nn/w8lZgu8wZ6ci
	9olI2LL6MDGIsy5VtkAtShcbh6T/eHFWdSx3gyYiszIOG/eL4Bb9fb8KPAmcbB1m
	jwigN+hiNKyFtOpczbHyANviKXFFHr4s3e6da207ft4B/1WE6+fzc6Bko29jfFOc
	kwvGfsYng+CwsxhOfzlnKZaz8gzEE3US68zmEnPy8QFc8KVqDBF/yxcePFzNXVTT
	BBWY8lLRiReV1U5LYv1ohK4gIhuPn+f5yvh135MVXj5jJDmIZCGquz2Pr3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1up1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:25:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso308975585a.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953540; x=1794558340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=Zvx9t0t3INy99PSqbz8YgF19vLw60ALAmtA2ESpaHKS29oDotfcMcNPL6IfYK5CIRr
         g3ITS2ckuXPDS7Q/EDTHkfppKoJkoYCNeS/9h1/vzvvzhFbcNmzp1HkgaHamUloMtQED
         BRgCaNAQyWDbQPgM9Paxwmm/I1MwzzLeFHJxY4q1dfLfkEG1qZ9qIpySEksGaVu4etLW
         82jVNB00K/a3Cffw7C+ATyaJ0Rj9UFWDj+R0/LnCwRbqU/Poj1D7DRmVtfNNLfB+xfGx
         8BNOnqwGI+oelKpZE4/gW7P1eeKMLdvJogR1FRf9vGIuEVln3eck9m0kdLdwRboEt/IF
         H1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953540; x=1794558340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=jeaeAYeHNXumc+2H5lbWw04YOeyyBpm6zPVHKg3coV90JMvPTesnDRyh/nduTMEfmv
         or51EsWRjFa9CLBJxbzVx/H/5tiROdxVxCRE0f8MdgRphnMnUCVs8Wx9mXwCG5l/0LS7
         ig3KXtZNhl/uOZCSkYs1XFM39Sz9zUOWkR25OD5cgqGVzVx0udNHoT1Rxk0YBCLPWD6T
         F81lAMJr4NBwFCwMOszL7MSaxdyG8DmIZJMC2+of4FErRmgQcqHNbR0/tnB4Rwc1UeyQ
         x5zcPVYWcsMYfdJ1bbBV7RV754FUlTnImt27B1kSP8T5H2kImARLWZFaItWhl9OeMdHv
         3OlA==
X-Forwarded-Encrypted: i=1; AKwUvBwcHlxx51j+nWZMHXz7WfEylq9hjzAdVvocQ0L68t8kXI5yj3B3+PPyOjz54qFngWXFc09rNOKjJtOW@vger.kernel.org
X-Gm-Message-State: APuU4Z+KbpbNQFcw/WOkd3OqwG0seRVXaPyirVoM808IY00KNucOADE3
	uaRoSW5kOJgLK00+QoggY2a7TIPaP+LsFLmReCrU2WTD1DNXWV2vIFGyyd1QTFrHD/WCAWj37u5
	71lbszBGcPfLuWl5nrr8nL5Q7Izdyb9dpkaduCXwoRiJXwIfyhFot6eqyrQO/wEAh
X-Gm-Gg: AYBFou3tY4+/RvcrnFF7deiAgAQrWiNwfTWfvBQ5n1aD03mGoFKSO7rv12WcEgOo2Jp
	15YlGURJsDOjOzvyRIKTdxRikWa7OKpgSOB1eFjPFAY0XVVmPRQk/NIMaLm3hcxEk9Iv4JKQpJA
	2OlUKXbMXgDBk4IezaZQ24Ekrie9oTI+mSSjrA1nVwL3SQN+LjMQA1r8FtVy00LumwUqi6F4YMx
	YjD3Pht6g05iClOVtZNQDIyPpHbxbS76vdfAexu7dTR3B7momLrnRSB9S0RvwxsD7yhnd98Qnhh
	0yF+jTNsIyiR6PEEggJB5Y+4Yj28wzNgqiEm7TLdML5prRHsH5nd4DOTMG8bz6q5BWLIwwHS4Im
	Y/BtRZ6CF7TiAxmEB0OBV6bTH9F7scroVRccDA3uInJ61Bj3Bg+orddSbBkBne054PH3dLDvRdQ
	==
X-Received: by 2002:a05:620a:4407:b0:93e:5677:317b with SMTP id af79cd13be357-945e174b3e7mr852292185a.25.1793953539778;
        Fri, 06 Nov 2026 00:25:39 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:93e:5677:317b with SMTP id af79cd13be357-945e174b3e7mr852290585a.25.1793953539438;
        Fri, 06 Nov 2026 00:25:39 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:38 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 6/8] arm64: dts: qcom: qrb5165-rb5: Enable JPEG encoder
Date: Fri,  6 Nov 2026 10:25:20 +0200
Message-Id: <20261106082522.1448390-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: VmYn9V3ZEgtOkkx5vTdfDJWTCnsf_Wsg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX7vyBzxgjMX7Z
 lbl5oJD7YTcYMh0qikUMp7V6Uwf7jvGEwzkhS8zvTslK/qc07IGts1n6hL7PGNTaH701ZGKBN2e
 xUtr26kVYbE2YiP/eT9gj56HDbIvTRQ=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed8f04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YFy_RbSkoLDF6nbOkSQA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX1F0fhximepVf
 8p9iM8riFxRewd/JMY4Zi8L1gw7jlgeNxZ3Txz3Ht2Uc9sx85TAVm2RQit0pBYJw3Mgcqt+GtHF
 3EnbfT0YnLajGxt3duXIoihbtgRBm0jCgkkoQr3qjuhl/kQyqM15qcgiPXPxt1+N+GXf+ZuVPj0
 sNMchS1hehQPoLy76MCnmT18e2ptuIbRenwnJauVhxzQLla9FQATYJeHUn/cJy4qW10ZfeVSk8b
 gk5QADu4sXjDqj8fejZ8G4oW1cStUxKx/KnOrwnzC1ZnhXERFwbyGrZEWbM4Y3Su3Kx8AI7tIU1
 dOQp5x64jbfmT5xgUBzCIYgwCeqhK54w4GCpG3wWA9gd1Pd2M4KdpAQa0CWz/TTaIm/VjvSDHyG
 YfKhZwUGQP0Yqfp82ppj69s8z2Z5SC/OO008yRYyu0jzcmWpkh6niiuAVfcYC+JZlkdI8n20Rp2
 pECB5j0A68MTcfdszog==
X-Proofpoint-ORIG-GUID: VmYn9V3ZEgtOkkx5vTdfDJWTCnsf_Wsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Enable the JPEG encoder on the RB5 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d6af679abe1a3..949328806a9de 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -668,6 +668,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.34.1

