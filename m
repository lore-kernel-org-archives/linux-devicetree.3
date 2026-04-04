Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12B6211A05
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775299380; cv=none; b=R4n87Zm5vdLWiV5YhgJSVRSt0OJhXv5qYlnvbWJV9deK0+ZUlnPU4WZLUzPKuRhTAo2Gb7mG2UYREpI6CB9LZD0z/H6tFPBB2AQ33XQfbjqpijI2+jwVpMs30rX4PTU4/x6MtS9mtjKQsU7yWqVSXromtTeG3PLggkPDghxd0YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775299380; c=relaxed/simple;
	bh=pYfcGKdx0Rryej21BO+C9aP0J1cNhKpphMroUhH0wsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mCedYG6JhQRRXf86nvYPM9nKvx3QhHzpvZbYu3Q24vYRHKwzjvFTUlhvL2HNxcqDxUt20hv+INuJKqYiDWIciuQ1R2CQjvc7gYohT0NjgGsM9266rduZ66omfRFKnZrzDwuXeB3kc7K2AZHlTzcPFORClQysDmmsq/qLYFGjtz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bS/J3/eg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyoRvdUX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bS/J3/eg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyoRvdUX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340gfZQ1344722
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 10:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e84297XhT8HmGfOAGvVKf9pMmA+a1FqZAkjsY4N6Eoc=; b=bS/J3/egbPRXKEyd
	vluVPleDYVVweuaDNqrB72HsQf37Qocy6KhZhVk/8ZFalQ60sv513OllyiFnaDjG
	ify3GMbq5HAHrZqBIQe90a3atcPOtIWAzFEjRV/+IigD/vvsNcqMQLegK1oujoN2
	8+4xLXEcq/DT2+HD1Z8GTjP9AAIQYabw3PN2Neo2OP7mw2R/4klrZTf9v2VCYKoO
	mv7+A4oPgrSnSDEjaaSx2d8zJ9jw2Jz9NSEwtsDzAa1ndh2R9OPQT3p7cLnUJCqD
	0stfdctpdjZdjrReB4LvCp4ydTf8giNT/AzumXk+tOj50QampxPWd1lPORF3rISW
	I2+cig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfgvg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 10:42:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24e9b4d82so36506075ad.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775299377; x=1775904177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e84297XhT8HmGfOAGvVKf9pMmA+a1FqZAkjsY4N6Eoc=;
        b=WyoRvdUX6cpKmm0ZqrKXI0DEdpbjgoZa07jklNSB+Nd2obIH9q8iW0DcSXxNZhM+qH
         iEJgs66SB/GpmnZb5vVDNOX/YODi+IjPEpmDFkLurd+ZOkc9q8ZRXUsoiIJeqQ+eQCqT
         1hbzxRvhMDBZa5l/z7TcLQ5cO7+/47U6wakGRQ2RF5SC9ebz01NNK/BAat4xFRE2Jaok
         EbCizBh1rCfqxoddqQGz8uve5Z7Hm0lIXEqXqgXO0/bd1XvxbOYcQEd5CZr5JU95HzHv
         2yFEmvgW8ATv3w5wLcSg/G5nlV2A1QlljYRziughvQrWC/oF6TgtC6OLPBbcaN1VqbsK
         bYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775299377; x=1775904177;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e84297XhT8HmGfOAGvVKf9pMmA+a1FqZAkjsY4N6Eoc=;
        b=sCIC39PW0NjGC11uLlYp391VdeVElCiWg5RXi7kZlIvZp1EFYaMRwZn7lQc7F/r7LU
         FbcGf8xzpMafLR85fHo8z7xUiRtAF+cighgd6YsbcaDsXQ6WGPrcelxhmFuJ+LhjXHMU
         ZgYrS1fFlNNjKjQiSboqpX9is5pKQ5Bfm0TKFZMwY6KpUZFHe4lv15UQtA0j5R3zMhhA
         v+XhBW3iS5A967dkvB53rj4L1EKW4ahBn0ZQ2it4a1BMABhQdQYbzfbNXQKPBBZpUb9I
         +Af8JQKkcnf4f5UErSjrAL5dm3sGQEmXSD5GN3CBriceFydEVEAfaOWsf07ItDTJDH3V
         lbYg==
X-Forwarded-Encrypted: i=1; AJvYcCW1g+Nkz1uaO5bF1A3Y9GAnhqKuka4zxoBuqoyXm+TzNEaHUgNb5fRz+4ICuEih6RPt587g79i3D885@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/3GEh2PpYeeVhNLta8eWwoLOeBGlSuAacFsNj3/w9XH6M2f+C
	9TNRZk0C7DR22FoYfol84nqx2rrVAgMCuk1CW5ysEI9GK6+yXfmJMTj3jcTvimSmM/75w6Yu0iB
	cdjvyahsAJkZ8bwXV8jQuivAyz5vaXNtdCbJQuVx29Qp5suOajdanYO0lmYjSOJuZ
X-Gm-Gg: AeBDiesrt8UJF+Av3J1iN2RCfW6hJoJ1f6gMbG4KCUe6vmFFX2SHHvaG31l9/tZiq0M
	O6RGzC+D1Ky5Ll7XmofSfeK08kN7sM7ibPxTZSb1iW8Y173ZDD4uEhSFgDCFGNRJWYxY0wiHOpC
	OV2Z/Zsc4J2GbU1RfxeHzieLxPMvse/P0SdKA9UYjxUYBm33Mpy3qC7+Qh22a0Px7eBgcetn71Q
	/hS4YErhRAj7FjwJTlE/sDzR4DM/LuTIXGY1P3EsSBQXJHLChNbDCW6wh7A77jqOYQBtIy2Nm61
	N0MujbCXKscbYqKQCLsDv8nZOy5APBZjKawyb5SzUm1imvBM60oZzsA2iREFPo9KGeoWjq8jBbF
	dwIRM9KE/JaE/qoA=
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b277e36491mr84232265ad.14.1775299377293;
        Sat, 04 Apr 2026 03:42:57 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b277e36491mr84232055ad.14.1775299376666;
        Sat, 04 Apr 2026 03:42:56 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:d6bf:182:1f3d:df20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm88066315ad.53.2026.04.04.03.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 03:42:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
        lpieralisi@kernel.org, kwilczynski@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260324023036.784466-1-hongxing.zhu@nxp.com>
References: <20260324023036.784466-1-hongxing.zhu@nxp.com>
Subject: Re: (subset) [PATCH v8 0/5] Add i.MX943 PCIe supports
Message-Id: <177529937123.12054.16299397232734906774.b4-ty@b4>
Date: Sat, 04 Apr 2026 16:12:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA5NyBTYWx0ZWRfX5upZBmZUDpVT
 qycXTClx8b+1Fm5RH0i5paeqZkfLXRdVOUfK/eNrstGJlC3Z+ciuIYUqSTZZpQMwhaGI4eqGFnj
 DaqycsvkHlat9PSor0smssivEb41WuJQBTLi35LFl8cb5ft1Wn6r5Rs2UWc+KJCW8P1jRUV9qlk
 wm3cxm4LsupfzENU2RKbq6N5QecFvu9FlyGzKe1vzjrTIEHN7rxRszdTH4GARXb2LpMKpTkGOlE
 uLtjXj8SN83yUJSjr15geVMa6QzlS63S2A8WBS3/Z0rQEPjd6EDgcOoHkAzljLGRDJ0abTVPPm8
 vSRlZgI+MGhRRFyfGwpJ70GlyGPwuSlZatCb935KtaZnFtpr940H+8OrTBHXtVziJ9zl7o2zaif
 T/1aFSwktEg17JVALBbsYOXz/lgfDcIIgPs2TMQkO140+cDoIXAgmx0xpykNQtT/1Md9SLTjtsf
 GuJzfbEym3kNg1eGtVg==
X-Proofpoint-ORIG-GUID: WezdT7VGIWoGIFQIaKTwq9B4lvKbloFF
X-Proofpoint-GUID: WezdT7VGIWoGIFQIaKTwq9B4lvKbloFF
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d0eb32 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=8QGBsu52YCFcfEt-ioQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040097


On Tue, 24 Mar 2026 10:30:31 +0800, Richard Zhu wrote:
> This patch-set adds i.MX943 PCIe supports on EVK board. Please pay
> attention to that it relies on the patch-set[1], and the PCIe1 port on
> the EVK board relies on the [2].
> 
> Both of them are included in the v7.0 kernel.
> [1] https://lore.kernel.org/imx/176649331066.523506.9443864112044699350.b4-ty@kernel.org/
> [2] https://lore.kernel.org/imx/inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq/
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: PCI: imx6q-pcie: Change maxItems of clocks and clock-names to 6
      commit: 401359ef44af43b6b775dc01bb7b31396db67aab
[2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and i.MX943 PCIe compatible strings
      commit: 4d7937d8cc32b027a14cb8152d9df64d17e9392c

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

