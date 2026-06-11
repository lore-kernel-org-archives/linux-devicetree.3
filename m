Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97906368D79
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165087; cv=none; b=BKK4O9pt9BIvHK0GBfWBMDzH8LXSE3zd1waU6y3Yxu4n5niEVsSVcg1tT6DIbL6QRkv5LrKKzECa3+HfHDc72oBi0P71vLPX6rh7hIol+b3MUxRWtuaEShK4ax5pQq9zmHJXiK1ET/JTUzZ47zJCUwxXDbujozo/Gf2evi63Yi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165087; c=relaxed/simple;
	bh=+SNiFYWYeunpdTDNpXz8CiAxvcMkNdwYzUo5XyecIc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=reIPPZtP/fJHFZa7Z9YZlTjCccMKcTy5O4wJZCCnyEXj6m0BvALRJePPqJe27BOUlS2QUdmHBfe1jwFMtdFjsz91O50iO2KkurI81FRzBfjOsIOcrQuirzpjpD2dG4cS/f9gLdAc9tgdVKTLEFpKwJXyAGRaG79B63U/Unn8sV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSOyVnmt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0M1DOGB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSOyVnmt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0M1DOGB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GTcY3835238
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcPoGpvWH4s+yFG19JRwBR20hHx4EyKKXYhWPVnP30I=; b=FSOyVnmtaK8OqCiq
	XgwVJV/fsPgqUQ2Zjls4qlq1ShFeVnieq2s2vOhSzvBkCfOTGjjAtGiIJ7So0gDQ
	3MVndu3dMgiawolPs1ovDDI7FQtD6gzIYQ58gebHB2yLcpMkh6cC1h68240em+mH
	QSf+rzr3O/mdCK/j+/5/CY/UXGMGGvLJ8Q95MORIjWu0qhibgjhmx1UKf1Vc5JUi
	JgNxr887ZHEFLKU5Iwjsz7uTIrOzM11IBrKJEWQPeFw79KUzSb1rVquxc0PJXl99
	Uv4o11XTx3UJn3Buikyx0NDVMcmDbJOxiB2+xzRYCd4gisgoboRGFjeD0mdpGrzm
	ruGw1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tjcka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:04:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915737aaf0bso170635785a.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781165085; x=1781769885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcPoGpvWH4s+yFG19JRwBR20hHx4EyKKXYhWPVnP30I=;
        b=g0M1DOGBl9W6eq7I3WNKPoLSCB+/FN8Yl41Vc2MtweNOrpzyjwnljATe9kDn3Jh6gZ
         X/S61qjQlesOvl25RTt6MN6jp1Gp+3XI4Pcur+3KftrJykFLS8GqNYABLS/juqijwyuh
         hF8mp47P7x79pCk9nNeNsnknGCVh4y+nmN/1o+5ozbFDhntfYb9A88CbYfGfl2HAtCS0
         yiA7Cz0i9Zbdt0YMe8e4c7KFcbRoMtsXSZXnVmJK6UsP0FbnSUmXVzq5R8cZCOy+iTjF
         +GPW3ztnq4UCHGLdTwORTkhCNVeUQSRMsbabg1rtFQiqQ72Ka5GhEwwYx9U90feRmJ2k
         cGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165085; x=1781769885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcPoGpvWH4s+yFG19JRwBR20hHx4EyKKXYhWPVnP30I=;
        b=kWyynGc/jqje2CXgQrknqDE51DrlkQhG0ijlHpUGm7UGYcEzvYkRTNTHcQfkI1n/ak
         zn0WoMfa0FQbazg4aJ3o/aWy5eBcaSn8o+MwkuuZsfDsVm7XbJQQ7mu12VONVPO5iY2O
         UBh1aWZvYZAEcBqK5h3RCfdz7RSRnuM90TcDOUOsI5/DMuogNL5guBCItaVhGAQc8+MK
         6bn42LzH5n+xt3XBkh1KW76vpOw1t8hLFqZ8H5RqjUE+YDxmkaEkaj9vex99SAlD2Fi4
         2rNYzzgmk917TmDY6lnXveeXRpkhc7G5Wukv3s4tVW40xA/bsg/qmbNZdTx57tKvfCG5
         UEsw==
X-Forwarded-Encrypted: i=1; AFNElJ9tJFJys3hClrPlhaDzyhcXEiIa2m7JKBIuJMgCuHxiZDBkEjTOtE0T+1f6AtFKN+fiQjCx2WFYPVTl@vger.kernel.org
X-Gm-Message-State: AOJu0YyvdNYAUT0ME9NwOS2Rvpd1Y9nj/rwxbEhHFLA2A7Y6nLID6oAb
	r9mbKuwTSWkDGpmXCd7VlQyjq9wXPvRpVdrPW/LqO1p3MWYh2ddTJCvmexi0TaqBjwGK9WYIldq
	HClhEliIdM18VS+3zBkNoQ/U1O/OQRpanevHOytavXZJRyH4hHmTbHlZYHKPiMFnd
X-Gm-Gg: Acq92OFvKy8TyQlsOjYgfhQHLXRKJWbgtwA0d/65Ew5eFxcc5aMEg8K36rJnJKXL7K7
	wgjVoaHLzIHq+TNm+71qf58yEhJ6DN9nQ5gvQWTWVpGocs7Pp1Q+lZYzAgz/d4ICB5y+q1JvBWq
	8pqszX99hmKUhPw+Hqdfn0t5nqRGlNjGCfr8PhdvpQTV1KavmD6KDj/RfcDvKDuGipUG9u7Lb7W
	XO6BrUI82MsCPpv/3odbmUH4tbdse28WfHYt8d5JYxkskpMGupv6Z4LyB6psxrLUBJvvEe5Pn9E
	wJyvuYvC8GNeOloCDoYBumcIE1QglO2IjgP5KWmYUtq/ftoA6iYE2/j8CbIKvApyyclNPMCLFeT
	LR3+lkyE4KWfI1zOoyY7jLy4+7ItSlQnDjw4wskVYygXVparcPLZf73T2
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr16745451cf.3.1781165084840;
        Thu, 11 Jun 2026 01:04:44 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:50d:ec32:b84f with SMTP id d75a77b69052e-517ee1dbebamr16745051cf.3.1781165084377;
        Thu, 11 Jun 2026 01:04:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb5abeed8sm24972066b.45.2026.06.11.01.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:04:43 -0700 (PDT)
Message-ID: <c37b4ba3-c629-42e3-ac35-dbcd69cccaa0@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:04:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] arm64: dts/media: qcom: keep PLL8 out of Purwa camss
 hot path
To: Ramshouriesh <rshouriesh@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
 <20260610-a14-himax-hm1092-v1-6-0c9907da47ed@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-6-0c9907da47ed@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3OSBTYWx0ZWRfX30HCMD/3fAzi
 nZHYLLGFP+Bhib/iMixz5hrAxSWoJyXKddOWX1I4dDQUl6z5apK0zOj0rs1f3jF2p0jR11fQnul
 xaZoe0vp7QfRu2qwKj0VA61FfOCbrdfM+Yz5SSUmn1i0JIooPQOC6Dz6eg02Px3N8t6G+dBOBZZ
 gxXPyQM1SuoOKx6JurWH2OWmpj8L9MCy9Hn2/I8iD6Fc/Dc5zrTq6ZIJ0tKW+fdrLr1ciL9oBig
 yKWabhXWos05r5pFB4KMkIl8iNQVZZAwGuc5lgvOeIDB91lD32Z51OdLNQFFa0AFNQRe23K3Myc
 a6eYvU1YOEvBlc2QmEWn1QyH4IpiGCd4KZXx+RoLlXCkzwiGJ751uBnO6Kp314Np+tI5nKeeXLF
 qVUO4INTFHsciOaDjch8T3S6JzsBO8tSqpmXbVRyBxV15VmQOoAq/YS1M2axZaMOX9cMutXm5H5
 k5ccVJRaDUN1j//Xeow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3OSBTYWx0ZWRfXzuFgpHo9Be/f
 n+GdblEjaWovI1pOhuSM+dH9Ze8+m1hBFkOpK9eNjuckVlvckMkWVmSuel2bCvMCPqqsNWeXiNc
 VaQ2P+iQchScI4s/Sl4KHhFjZRjlPkU=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a6c1d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YywNEx0Wz6o6_ceNSdAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _ABdlB5naZ1BCxtCa7-LGQC7exgJ8I2w
X-Proofpoint-GUID: _ABdlB5naZ1BCxtCa7-LGQC7exgJ8I2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110079

On 6/10/26 1:09 PM, Ramshouriesh wrote:
> cam_cc_pll8 (defined in camcc-x1e80100.c) doesn't latch on Purwa
> silicon. "Lucid PLL latch failed. Output may be unstable!" fires from
> wait_for_pll() whenever something asks for a PLL8-sourced rate, and
> the camera pipeline ends up dead with "Failed to start media
> pipeline: -32" even after the qcom,x1p42100-camss compatible is in
> place.

This patch is not right, seems like you're missing the hunk to override
the compatible for purwa, the tail end of:

https://lore.kernel.org/linux-arm-msm/20260507-purwa-videocc-camcc-v5-6-fc3af4130282@oss.qualcomm.com/

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 9ab4f26b35f298ad7c6c361b3e232edf07baf223..25cd547caab8fa64eb1a134068b77f5178f5c248 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -36,6 +38,10 @@
 /delete-node/ &thermal_gpuss_6;
 /delete-node/ &thermal_gpuss_7;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };


Konrad
