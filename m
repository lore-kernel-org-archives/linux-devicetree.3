Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991DB39DBC9
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030496; cv=none; b=G0S6NG/uLZpnF6x3YQg0FZUqskCrbfU7MjKnciqoq/g3bvhbidPHVR0CUub2P91tJh5E4u4jUHe+mKkdgFZsl7FdDKcXSFsc8QtyyQrYo/4zGhzVcNui+jWV4WF/cX5dBLtRYoEef9rl4p9cDTzdydaMGEt/wJvnAF6QRbhyiMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030496; c=relaxed/simple;
	bh=W2p1gqkX4AQ8Th8f33I8eROJT74xXZVBij/fNQ25/NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9bNzzJgp33NvyT/QFuQNt1KVQ5BQSs/QD3XliBhNptwY/C6Bb7voAFr1I8UpEpHiIkfiOqsb9XChDllz7d4FB8EsYFnTizzMs0/PToznZy+uTRKlzn8Si8BdnjtcibMkC3yxTPOm4QXP7uhlzyMlvNHZ20e05xPCjJrS4Pm4GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4itGM4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHXUOoaF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4itGM4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHXUOoaF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx5vn1742579
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=; b=S4itGM4Oy/04gOgP
	9lGTxN2ed98QDBA5y0Jc7Kme/fmTAlzReOESiyvpHVl8WNAXw8FleIH6yDgpJ1yg
	qkUI2O2n7vOrCNJ452SZKlpr9BbIvH89QjMoXWCZoTRKNA05GDP6lA+UqvYvDDUh
	n9ORvaRx8AoBp9uD1R/KuvHJ3iWpnpw6fhWRA22JYfLKFYo+sxvNdy0wFr6An9G0
	np3eiUClSEo1zH8G9Ww0dZhGNZ9DO4P8Uk6VpqTyGePJIvy3JDmJCAadSmB5yehr
	P/bTTplglHTaI0e+r+RaP5JAUlJx0vsDM1jYrdUDzOlLSSeoyzOSRda1HfxgoCOB
	CyAeAg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq81ejt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:08:14 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-836caf085e0so49409397b3.1
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788030494; x=1788635294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=SHXUOoaFbcyCqiCclPf27Ll86fDN0ZS+AYGl8/qetKAeKseL1Ed/QtC6VGDvRJz8TU
         EA8j15IyAkfMsqm9PxNlKLOX6jjYVP5IniNOSWwRgPwkZjTv/IVpp/inRYrKOzH0BuC1
         uSds6eISZva6vEktXoSNN8S4/hxwIIh/EsEnJ4FEKaPoTvaHINXPKqKpz+sNZFs85uEt
         zxvGE1dB+o1B0P2AU+AZAEKU0ixaiYweM+RHuY7fzAgS/RdMPm7bCS9niEE/eC96Ffcq
         B6htZ6YSkr59Gr2NdZ2B2snjlhlwTdnCWPmyrHN3aQpwlSzi3NxuuW0uiR7sJOAGbgEO
         nQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030494; x=1788635294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kjs0JpkjceaOXlcdB95wR46vNOivhHcjPSAD9oYP1aw=;
        b=aULovfX34lsroswo5OmzpMWU/225FsMCClGQXvQtI58hg3wEorkAozn2nPkDSRIM3H
         ne/HngLLgzJkARSbCJ1Z+ncTYQ7gxtlYzMkg/EgIIWufDiqebEdon6HYyO9MvQPfvKz4
         eTBgrI6SRIbuhPaA8gAxL4c5P1xGzXuC3KaA68ld0S3zlFcRok/jMt/YrK1SUJSm66bi
         unf0mm9aFBHh0a72D8sXSH3ArpJv5U+nAocujecLV8CAhWru/9rFwzt1DpAMoXkCEQcw
         jxYxXr4K5s7ThFdUsc/wcdgYQB3Th3aJ0EjxM8PQjIGrUEswLm8UFaT2pgnR8U2z88NU
         vEhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd6+Bu1701Ho6cSAl9LotWJRtVmhn3EF43UYMQj5HYHMuwfMpnxsRW872TDXX83AbdESqufMdbdby8@vger.kernel.org
X-Gm-Message-State: AFuF++lOSEJSzF06FziuhRIp7yzi8KLpuYPcE7fTuTEK+EXeVN+46pyx
	AfwV2HKbu+KN7vgn71XxwbJ9E7hZ3jP+cL2USaGsnMOODaSC0ojtkQE79ujAR6J6rU5XnlnoWpO
	V7wezEOVWwsH1165jfqGUfMqMkuqC+f40T2AEdeQYR4JdJSEZ5BFqpE5T55yqJJY9
X-Gm-Gg: AYBFou2mGz/KQkEHj4vYQz3VosE5MrFMDl7IZd/ZH2LVYo7xdx2COuOpl/iDRBIJK84
	KotF3T91oX5jZlVU5RKGLJaeIgnfKt+arM1osJL/28QdDLJkuNFnGMBzR0AR+BAHIQbXUP/gnls
	j7T8MzTW44/5rXV69ib1crKK+5BjCXnlsgIJ497Vk9NjwFYFdIwkIuIlWctyAMi+RYwsZ6fnD2G
	CECjvXw95722WdVMwWiiuX+KMp9dxAM4NSsc7HAVVELeSg02Vc42VeKIp9z8Tp3VCNTZ4T+F9ey
	ZqYZFGVM3zQdyaHxvptEyQSzjkrFPHu0TndDXt47hb9qA0FPUOTkBCznGDNwbGT6pLe8rOxbnWX
	Dz4bNynPShdCdltmzLDIzY8u6R3x/Xb1BDf90ZCLjt0xwgUtX
X-Received: by 2002:a05:690e:b84:b0:66e:5dcc:1050 with SMTP id 956f58d0204a3-66e5dcc10a0mr1394766d50.48.1788030493933;
        Sat, 29 Aug 2026 12:08:13 -0700 (PDT)
X-Received: by 2002:a05:690e:b84:b0:66e:5dcc:1050 with SMTP id 956f58d0204a3-66e5dcc10a0mr1394750d50.48.1788030493516;
        Sat, 29 Aug 2026 12:08:13 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:44f5:f599:5679:b5a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1f6fsm3013945d50.13.2026.08.29.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:08:13 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 12:08:08 -0700
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-glymur-send-v5-1-a11bdf6a4b66@oss.qualcomm.com>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
In-Reply-To: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
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
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: OPJQodtxWqkJtCTmhlUcVQuERozEn9oG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX1bVvZo53+RjY
 EgNApQc7G5XiEciQAJ4dTMmVQ7gp+32UpltX0OmNUwYr07Paitrg350yoEq2bRAo/V8SkGAAKxO
 CfM2NJNj52C3MegmHvws1sQq1FpOua4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfXxHb5E6ONJAnK
 LVlgVAao7eXE0JN7GOqthfROvyuYLTxaA3AXz4wnPEw6oHvhGz6AMGJtSaPdIOODiYVxtFfqWR9
 H8WmG8/Wgd9Ivi3HZbUI6szwWgEq5PJeBwPd3YSebTZ11niST+lOSaO1o15sk/stRlttiVAIMpo
 eOSGacaq0vdMhCuKU9eEf7F8pZA+nHOSkb/rvkSWBD/K/vKQb36py4XDY7g0ERq0b2gx4+wGVJp
 EY61szTiVcsfAK80a1Ok0sZlVkmK+WLfqg8uYxDaW30jtBKM60W1zwnxHizknqz/Gw2+ZF4ov2l
 VXqD4GRo9m8zlRnWJgnBqbBkGpG2qNdLQW6tpvvJMbWaBEaoaNSx4X7A6FyGx8CvjdvtY9vG+a8
 IMLLtcHdqgBETqsDkcfy9wZGOQ4uhguYxMxsqp3DashSsBPyO1BfdG/DtYFCdkGvJXUugTY6Qd7
 35iOCgQfxhNAtAAF5Jw==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a932e1e cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: OPJQodtxWqkJtCTmhlUcVQuERozEn9oG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290165

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d141872c2b28 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1

