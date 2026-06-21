Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D923723ABB9
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 04:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782017458; cv=none; b=ksPFIMrs7xhByIY5odgRsrgU3zz/zyAEjVLpva/mAVIcZzcbvrg/j8oQtQSTp4K6+R1/WG6sN8iwIU6g61W3MJ5Bb+fxJ2gqRdXl5k2I/hvaM0Sjsk3q507DaCrFbBqdF/dkLvtKaarMdjVtd+VbfeRYh/fbkr4oOILeS7gyfsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782017458; c=relaxed/simple;
	bh=1c1Kt1vhMgfjap+7+BLI1rc339XdrNx+BYTbudyrh5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LfPthp5iUm2jv9/SvnOhC9is1Inj3yUi3VmSt8b5YWW1H23VtBPMyJLvts0fsh2fRlXWGVhNCD3ISVx3ntjKaMBn5DDNEhB+zxU3+eo2LIHuVM3zDi6VEIba+k9usRmCDlG8n+kzDkeQtyREWTI1XGItQNfbwkcaH1LhO/Sgz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTue4SPU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvxagoG9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTue4SPU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvxagoG9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L2DInp2202986
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 04:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVFdGjHEo2CMYavDiLCcPr/f5Nf9GwgzzP388KYM/lY=; b=eTue4SPUskFQ20N+
	VNbrOcGOWEPM3KrjBrwON6/FBoySqck/xc3lkoK1ivOlhPY7MIIGr3/9+yg63+3Q
	n/eXO0POusYf2isearheWanu1iEOtohI54/qSpweSLGpQTRnj/yz3rg0T1xMDmdD
	wDL9PIXRsAtOnOSa0HvJnNGc+9A6pyu0savVhzEuzqbHN7nBZu29osoWY5/Sb/O5
	q+4/4YGMM+Hn8qjIWqNR5lYNzJYIhmxarLdqWsE8oKDNpy8npOFDcAVaGsFoL/GW
	oVVp+suiOwG3ila/RT8RBCqXDFmh/vlahAjMiPBJmOUbu/gUr2dgDcNnO2J40F+Q
	f351rw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32t99n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 04:50:56 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7fec7afc9d1so68277707b3.1
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 21:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782017455; x=1782622255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVFdGjHEo2CMYavDiLCcPr/f5Nf9GwgzzP388KYM/lY=;
        b=WvxagoG9Mg/fR6W4YwA/HE6jV0tg0SenEGzEt8646v5tID6YahXjquYL1NHMwkMC5q
         uZNf2OkjBhCXUM8at9Mt1wChbZkhVFneOPVRjQbJLzKgFxOHcq1SAZkVOl9m5RFYbEqP
         7LbL9nXUWQDIQ2G5czd1ViRFsg8rgsclTMxU4oGhE248xZwDeD8FUaVOTEQSq2acCj5/
         u4TR8sYJLBUVGVUjuruuwsX++jb3UvNcgKVEVxnlO6wxNojxuZ6g/PH3fQQNt09cXTUA
         5Gqc+dwW359P1B0wKXPFEV5h60gAHQY3lqTCSEOn6I8XLLyeyhe2a2j/YyqrNnH+iH62
         7oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782017455; x=1782622255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CVFdGjHEo2CMYavDiLCcPr/f5Nf9GwgzzP388KYM/lY=;
        b=SOjAjfg/AnBIfnDuUetNZRAVcHEuPkOot5yfm+SM3QN0TTnN6vfZDawjis0+mFieB5
         m+xfb+VVOumTHPz5FxwzgfubLm/AzcqINKWY1t1BP0xbZQmUTmejnY6ioint5Uo5hdIz
         OKIuZ88U/iqEoPTt4AkH7tZa788iRxeJ36ZO53GbZUv8PwFeRee0jFh2dhcXLTR4R8qD
         OODjKSg+r8dSj+6auAn5L9RktajidIksg5rRFlOuonSZ495WalRm8XXRMVeRWjHbRROM
         4+2HaX7M74+wcfdnAMfpmlUSO7f7D53Zzs09lJbQsgpWKQyEAFg3EndyirAbDK4MOiDw
         PM4w==
X-Forwarded-Encrypted: i=1; AHgh+RoPdiLXtcEE4ftNDxvmi9L7tmZmL/JXJVXL44ruIYj7btwxnrjSc5XDy9pW45Xes8Fp5EBhhdkQ15vX@vger.kernel.org
X-Gm-Message-State: AOJu0YxfDKHadhB8opJVlHGxP6Yk+5Bu4K1BE7JmLGxQcshjZ9Pz1+j8
	H88XxssnsdTXrZN3sKJI3LgnUTTWE+ovccT5INKSI0zHA7u7LbeHN/y3nxXHmalEeH/bvUgsPhc
	HNdlCtn7iv4a8pZtFI3r67pWHfMFoy9sSnGOMnc6P7wVKfhEDVZDzyXi6pd413FIF
X-Gm-Gg: AfdE7cm80hC8rsZ4qdPEVI4UHhB7XB1caeInch7wpY3bENd1joNcYngY184O1py/M3B
	/B+uY/g7jmGcac2BI/btbx+NImF7eSKRrTbADm+m+WulwAWb0twHgkddTXvqTB31a93lB9rz/x0
	cz4/RBpUDcIGVctnLxxhWWuIRiuTscEBIzt72ULEmb32Vzq4BdLHy+7j5xrzUZZNrAxd5A9JDnE
	09kJdQza6zCwjsvTlccWUI9XM9iRA+Nm1KjjxZK6tnxG4CtxIJQXDP4Xa4VYn9IMAOPkRNe8GZn
	ISgNy/w3OksF5faJpSpwTTs6JkqYcePzqiVMKfKnd8mm+M/An6RNrEUjRYwqiTSkJHM32x/LA8X
	XHvZcuNRAvvCZOKRuAt48UJdl7Fi+2wBIR5c6xfiK0fV4iMBYe7BviXz8by+/Y3RmxBI4HsJCeX
	jtt3oENqL7GcBdNKkk0BoubOxBPhFeEtUyK2Yu/U7VntO9pawLttRFWdA=
X-Received: by 2002:a05:690c:6b83:b0:7f8:7e6f:f544 with SMTP id 00721157ae682-8013498873bmr95668577b3.50.1782017455363;
        Sat, 20 Jun 2026 21:50:55 -0700 (PDT)
X-Received: by 2002:a05:690c:6b83:b0:7f8:7e6f:f544 with SMTP id 00721157ae682-8013498873bmr95668457b3.50.1782017454905;
        Sat, 20 Jun 2026 21:50:54 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:855e:5925:800e:2644])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8026089574fsm17226837b3.44.2026.06.20.21.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 21:50:54 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sat, 20 Jun 2026 21:50:43 -0700
Subject: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook X
 G2q 14 AI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-glymur-send-v1-3-fc4a2cfd107c@oss.qualcomm.com>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
In-Reply-To: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: WfBd62PjGTqXv391eFiNXcF7HS6sugDm
X-Proofpoint-ORIG-GUID: WfBd62PjGTqXv391eFiNXcF7HS6sugDm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX7hJeKUOCxG68
 rkcH3bzeS4m36/b1Vs3kwxvyGnRBIg47IZqd0EsHGu9oYnTGGgcsD3lAvziA9ex6GlLBvIHDTI0
 +ALN7zSAZG9OAx/ZdBkBXcwcKQeL1+k=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a376db0 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UXNKUhSJZRFg4A5DIqMA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfXwdOV2iJ/UutD
 NiJqWlmzytgKpAj3o9g+GicpwlqpqqBy4/hsl9ZWmBbxciugfZLpnQUPGtyhzTnNojIm18Vvz4d
 md+yLmFxr/vXU5hMmSY6S4wEnF7maguEiYnMPAtZ4ALkCSiqz3RwbNdAZN9SawUw+Ht+mjH1XXB
 8Wingx2xszS5Yvl/Ai6pTzEt1oovO048uCcvECrJ2RwR6Pf+9NY1SCHnh1oIOKXbAe7Ja6L+gJ6
 eW5jnn1NQQximl1gPMYmBP8iMhiBMGC9NIEoMuCV954yMMStLbq6L+J+IqnpeDAQvYsh6EbmrYZ
 sAmOfe352lYUnOQD87Op2qPssXIdFmoasS/Qw89FP8Y2aEZZnsKncLpEYm15yYdNyGDwKtgVOIq
 bLdnOmQFXfNCid+aMO9Lbjshp64K8e8QNfX9YICWiY2LkhCeu9PN1e7Oz/ZWSjIr2Tk3TGNA7eW
 ak5il6F8DjiANPaCtfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210044

The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..618437f5aac8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2296,6 +2296,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.50.1

