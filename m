Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570FD3DEADC
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082339; cv=none; b=GNELgWR/12Dqq6y8e+lrMXrBkw13mEwWq7XczR0gMubeEkAp5X1/xbqCcMCNp0+Z2GUgGYLXd9AzHwYkxZi8dR5/VdP3rzUqWhFTHbNWgJBC4BLOUrocoMaSIzszOii8mZjf+i6HepT7L4x3O6/drbEOgyz6XFJJxw3NnTaDyks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082339; c=relaxed/simple;
	bh=yrcztr48bhxuCH5lq0JIaPikaCvhdOM0GKlWIoBGDZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5DkTpyeBapakAiW0usXoYL2y7UJtlWxDSZXVOW0hnD2lyvXTwC+CYQJ8nyVQ09SVx354Ar4qKtwuHSnltRIaYo9ke/Gd11tuQJf3abZyLj2sjGF4CjX2U7cj0oNbjcZ9p2ybY5+jUPRHPgNPabMQk2yjEQPd/lyptNHTp0iWgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdVHys8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OLX0OTdv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdVHys8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OLX0OTdv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Bqha04091029
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 12:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfLl6OpM0eaLATdEjN7bgfl16l74dkGT1KH6fUf6XVg=; b=HdVHys8sym8Vg7Mm
	8zzeZUxm5qYja04JADLfYUJSMSK5mndXbqDQPg42YeibCCIdyUUWKIoy2+O1O/9R
	U8hs7l9bME8gYwwyfNuaAzAndI2NtMDKL4dlFoNlASAWcNZsvlSlvWLw77kaZyBM
	u/2pVsiAJIWElmsqnJARXkJDxpa8Ggw+8t2IrUwHRHXVIeRDAhgLroG5GovNUshf
	aj1WFWRlkIV72Pzs7rav1GYh9nu7s1f7/RCrppcfMmoyPlZ7P/B/VucyPNUtXkUX
	BemtmhXxrqA4JxdvaA02e7t41xw11n8oOPWQ4R9twnYrYKfUo7Aadw3z48IR/ETI
	Ql/+XA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj066f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:38:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c804e38c65so10675545ad.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783082336; x=1783687136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IfLl6OpM0eaLATdEjN7bgfl16l74dkGT1KH6fUf6XVg=;
        b=OLX0OTdvdnAj+5myuk0nBDGph1JaNPvOukkh567O9ub9TzTGpD/JWRGRjqQ9m3wKUG
         aPz7vjoqQfV7s/8pWu2pzVTjyyYmj257G6KcAfkvd0Ui8wglbW0EYt1SXTUsK4Uuf5tX
         kny9i8yzPqQugJBr4TJP9DdlJYFJCJyNddNS2a9zsY9pORzGd+WU5uZ6Q3ZSIphrRZ80
         Rpqn3cN6jXYcdkJ4xdJLaXGZmMXKhzB92Sy65ARNWEnE3ShF6/w0OlELrQtqYh9xp/34
         wQ/H06rU0DM1Zbe6vsB8pTLpSkf0tjuCnQ0lCcgY832/0KXMV0oGFYP98DqqbznQoFPr
         PWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783082336; x=1783687136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IfLl6OpM0eaLATdEjN7bgfl16l74dkGT1KH6fUf6XVg=;
        b=Fz93xcjqKLVdC8sq/21L6fMz5lbdDY6/MUMu16haV9qT+7o8B53OcQe49JvwkJp2vS
         8PIjMb6RrbeecpazEGaErHOK2E9y2db2kx0/kNGv8yxHcfh0KZJgiuQB27viIrySCtNF
         /If5uc61VpR16HE9nXXljEuAv5+lLQvWPNSM4vkmzypTEyWahaYpnQZOxn46uwc0crLb
         JCPWdF1teBOTo/6/J4HxWuA63vOutcl6jXZqrBLU2D7fmz3+35QSPEGGNouyT3okNnn+
         mvBKTiFvkG4RomYtieC2Cx3s8a5VcRJw2K315xhPUqK888NVEZWSVR5sSI5D+PW0LbaQ
         ec4A==
X-Forwarded-Encrypted: i=1; AHgh+RpiCtU6PiHIReiTYkGYvvMn/MgDdIhou7fne+VWjBqlqtoYCwEtz3Lz3MFbrrpfH96cl1YnUJPocPnF@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQTNtkN+UjJP7kEsaNuIdxuojF4f6MA2Y7yEim0n+BiXk4+i9
	cXQT5pl4bmnvanknakmZKyUZaxWPtVrRP0ccse4CMAz7dmUYG69+3NEEdSklRugr6SZy2y+LXt5
	IBOJ5QXtO337ONBJGtLzlVBMnVgwj+fQfqfwZlHGg75PS/VJ8RZisDn6ir1zp4stW
X-Gm-Gg: AfdE7cntesUceHDIR7LE4PajtyjlKilzXswkgRy35EyzNd2F8pjlx9gP0jPioAMsJCq
	FdqtRqjAxA4N8LLAghQtqupa3QOuLu/zy7s5Z6LSwOE3pyn6Pe0B89QOIG1AUpGpE4eTm5uzMgJ
	B2scklAZPVMcWPc3ZJ65iiym6VQiE2h+NrdB5ynjttKUKLW6h2QT7INQ30rXyeyXASjBeeTZelV
	w8+gn5zlPRaWTKjvxyasM+5+yFg+/0pMlbbJgiRvKl7Rf+p1a+EbKlp/4Yiy5d3/xB7fP3e0lQA
	oT5TvML+tZuZNQWvW3Eo1iTzmyuvKibMUfOjUQSvPnW0jWvEUnlOe6R7L14qTild1LCelHERJi9
	DIi0w5QdkJAp9bl8+QLKUGdqj6va/mPQd2Y8w6PJ6jPT3kQ==
X-Received: by 2002:a17:903:26d0:b0:2ca:5a0f:d0c9 with SMTP id d9443c01a7336-2ca7e8cb82cmr108830145ad.43.1783082336392;
        Fri, 03 Jul 2026 05:38:56 -0700 (PDT)
X-Received: by 2002:a17:903:26d0:b0:2ca:5a0f:d0c9 with SMTP id d9443c01a7336-2ca7e8cb82cmr108829935ad.43.1783082335987;
        Fri, 03 Jul 2026 05:38:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm24356993c88.12.2026.07.03.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:38:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 18:08:32 +0530
Subject: [PATCH 3/3] power: sequencing: pwrseq-pcie-m2: Add QCC2072 BT PCI
 device ID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-eliza_evk-v1-3-7624440bd76d@oss.qualcomm.com>
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
In-Reply-To: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082317; l=978;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yrcztr48bhxuCH5lq0JIaPikaCvhdOM0GKlWIoBGDZo=;
 b=O0fosvzU4i45T8cQPPruRKR2egGi9jQkA06AsdKRspZ7xBYL1Tlf7jgIdwoCUcOonXL3YHHj/
 a8AdApc9dDgDAe3OJpnNOLF6galNO2wunHGIdC4/o5JDuNeZ0lE8fIJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfX6qvgjI0yKCYF
 GOl9ezKcor6lr1tkcn9XRB1UMplFTeYYv9m5iVfsB2reHeofZFoGd018JuVHjUe5g5c62MXMjOP
 DMUAuxYpkr/l+rBdB1ZMxdPn9sDX4Cs=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a47ad61 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BU0hv6CmB1lMHcRhg2oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Za8vgAWoHt27ofFuWSAuKbw41gus0VQ3
X-Proofpoint-GUID: Za8vgAWoHt27ofFuWSAuKbw41gus0VQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfXxRp1ggDNp5tE
 sybVVMJugLDp0us46aniHR6JMkk1NmYE6FM9RUXnHGUoUnSRJ8I8xdTCJT/NcAt+QAM4sBI8IVj
 eaUFgnyPGtS3YxCxHANCAFLrPLPS4ju8hni5TE1SS7NjMC3SFroL+RgGUHXaQmnLpdicH3b5QD7
 79nS4IqrXzqBcwiDyn1mSdlLS1Oex/hyxSN5z9B8vRUntxU3GIHQ7YYGE58/p/Qds3N1nrdSX/L
 NYMUSyrOeJIwTmjJIRXFfy3oy6bmmOQgjrFUqAV7qk5mJLLXYiIaWqVlRbEZLu9T6CwCnrTYmxr
 B2oZCuSjBbWjlNcB/XqID1o6BRNnAk0HwaWsawSZcCun0I442WMy/v1fm5m0YLeXbwfBtHle795
 usF8ywwXtfi/0wxohakarCkcEIO4IDSn0Ke16SrtSXZ4GmkeYKahTa1klDZ7Tg0n4gjUMA3i/yV
 tfxUMz6sAjihfAasMQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030124

Add the Qualcomm QCC2072 Bluetooth device (PCI ID 0x1112) to the
pwrseq_m2_pci_ids table so the M.2 power sequencer can create the
serdev node for its BT interface on enumeration.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index b5ed80d03953..4aac52062fae 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -190,6 +190,8 @@ static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1112),
+	  .driver_data = (kernel_ulong_t)"qcom,qcc2072-bt" },
 	{ } /* Sentinel */
 };
 

-- 
2.34.1

