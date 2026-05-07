Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C982533B6C4
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135026; cv=none; b=HoNOuAcGB5DBKGb71lGWM8Jm0CaduEPYKY0qzu+0B5tilL0C4gwpLhLC8OI+9koscp4Z0SZyudA3tsaOSmd3Z5LeiM2SHaLkHApuL7kGxsv4QPvXA2fcp/e4TImscijamapIFr8x9LhUhZVItAQ5bm7zGR/XIRpKD3GOWaOQVpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135026; c=relaxed/simple;
	bh=UgfBCZ1rMfVTJev0k1z1NyPZBVmzJ4hpyWJ3luahNzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N+g+aHcJU1S+NOJ1XPmYt9t2CdULlsBDjxNa5djao3Vt8QRMEhMvbVkZfe4zfW05i3cY1hmEBrvc2MapmIguU9AJzmxXGVYYHp+zXHdkT2/3wIF5DGsz1iKEXMgtIlsCrWBreQA4I3j18pqiLjUmW3lRcfEPiQ5XsZqHMFIsp/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+GcArRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L17CyGdX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+GcArRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L17CyGdX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eERI1669703
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9rNAGIYUfdj
	1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=; b=S+GcArRVddDimIfm0VImbZsU8Jh
	BojGaEBTeO+nt1ue0Qo77p3y/UgonoABpbOevp9/nGuz9PW3MF8YD5gHhF3zl6D3
	hTbt6hN3PiAxkOddtM0HDKwxg/OVlFgQ3y+zFUoo+Ir757YYz0cSM3HdaX+Dc4g8
	JPOhe9WYHuv+8ys5rhJJS4AvMG1Nt/DiWN7ecMTuA8YRyDgBD+vIs10wF+mKJfPE
	sLqluSCWDcs9MXVlPhRwAWBCNFi0RtdqP0G5c3astwdk6iv7GGOBmCSmzCNXz636
	djZKA2peeZvhaK0RSj0lQgIs5gf5KcijeJQx9NmYIQFMRCOiydiW/FDeRsQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p0g29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:23:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso345512b3a.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135023; x=1778739823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rNAGIYUfdj1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=;
        b=L17CyGdXl5oALRBZio+6gdnW45ltkjie6m1tAsCSlJeGR7AmzU4zLK7jwr0VxzldWB
         Vbh6CDDLRTb35mirlagpmKganSckExNvg+Ytj4DkRwMxPiHJpPk7js+zMNOAN5ISGs0J
         fIP7UM8UmfFKHj1X41PRSmp/2gPrmreGWBh8bx3K7+bhJAZiS8cWXpEdkKD8Hw+bL+7U
         tP57DKydrQdrw9smTID9dHkxhWu835mCYmm5b8ZrZnrCa8wIkt2G2od3MhrDtEtmsXj1
         Sl5vcFC6ztND+zLlzArqTB3UQ3WmY38USmfYoBXrpPZ172FE8pS53Hd4ntZ0o6EXfPP1
         /2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135023; x=1778739823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rNAGIYUfdj1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=;
        b=MAWbZ+mJP+EXoaeP+evK1TUNUb3/7RTYLC/zNtRGjvXJ+dRjicA3ZGs3rHZkSC5G/6
         3BJLmGuyzWHyV1NGzRsquSaSuDHxZVzfkyNDZ8sLbvtD5ddIN6APgjlO8VQpd5BpDLL9
         w5xmA3nJdQoios9gflcVQYNhNGp4KlcqXX2WWowwjrvaGhyEw5fvQ/a5MiShJSBRmuBP
         NnlWBsFaqucSR1t+FAXNeHa//tVmQhDIKQPCtQuwy2PqTZE/ykSNuOD/snACLtvRSN42
         LLWlBP77jwzqSll3tiukftOCdDW+I/PEm1QIjtiSPLFLnjl4oOeXE5ufkf4ck1Kqx/rL
         ICCg==
X-Forwarded-Encrypted: i=1; AFNElJ++nTJHagFoLvOfdeNQP+gC1T3GTWbUBkQzovHTAeyG1QNdBETKUI9lHlXoKVYOcnZtXY5dfdWbOR43@vger.kernel.org
X-Gm-Message-State: AOJu0YwQChruIfhqietjztHp6i2ci84XLnW0u1GhVwMiLbHQxceoc6qG
	5/wciL/eQl+MmHJlId4N43cLxA4Pp4rilRh8Mifxt11HSV7Z4uwKwPqQuWIDlOVS8k8NjH/OyJM
	1n1+OTdrkdmeqEfQqEj81/ZWkEhJ/14cH5S7Zlhc9r8pyv5RXCZEZQQfnAjIWHVid
X-Gm-Gg: AeBDiesU5ECEE0t3c3T9HBiDWXIA2sH3PxzXf1+YpAaBozzU1jP03g8I2gat8xxHyPD
	dml3QwZPWsOGHpb/o3FXrFVxsJvIFJ2iZ3EWeGqNCH/bAeXuiRBgew2k7JykCjairP/ptMgqAyW
	cHZ1Qk2tMvdqTMbW1jS8kU8gjskvNNtflrX2Ro7d7Ft/zq2vJeXFl4TivAgtanRPJ4HhXNvUV0Z
	+iyArQ0XSllMxZ/up7zjsu9NHD4nJHbJW7X5U/Jrx3DE0EkWQgHZNqE/4nrXKOn19b1Khv9GPEH
	ICou92TOiQAvgc/kheBeJd7URo3yK9bldSA3+sSBaFBzHapnmt5XaBB5PEPsoKGYIuxwjUQR2pX
	fDde2K0cB6/ipQc5aOJn3ENI+oTGBb2NVk5HTgIWb4suGd3EMTd10uybwCu0jnAIG0Rrot5mTFo
	/GQJk7HFM6zHCvFNUkbfPB2IihBupWx8N2yfYT09gqj3scBX4/wCMqRqdglA==
X-Received: by 2002:a05:6a00:460e:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-83a5b2d3078mr6499162b3a.4.1778135023529;
        Wed, 06 May 2026 23:23:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:460e:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-83a5b2d3078mr6499131b3a.4.1778135023021;
        Wed, 06 May 2026 23:23:43 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:42 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 8/8] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS dvfs
Date: Thu,  7 May 2026 11:52:37 +0530
Message-Id: <20260507062237.78051-9-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfX5CMvhAZBgFWM
 9KE8OIgh+tQYKg8BrS1AZA2lPbpcRTa/JPIs0jZijXG6IT8QOnXK6/33Uz/2/DrZxgqKzNfC4j0
 tKVOSAwqn92WG3UT5ILvSz2w7AEbgH6iCCOuZK5iOU2vfXPgj6rpFJNc8ObKyMD3GsDnAFgnO6L
 ZZpSOzYkNeEf0DFO9HTmD9OARmfXwa1WWby/nzdlqf8+w/kzYlHyPP2Rhb9/o0FXaMCyCnO9yST
 DQ6Pu5v0sMY9Y1HORegtZ7eW8/5LKDngZegRrWuyHfeCSuP9JSaVwFa1gUO+tK4uoWpL1uHFxV6
 WuK8wSi7QEdVl73WmcscA7cm/oGHfxMUwMQeCB2XuLfWperX2grjwf9lMpW84besRqh0rzeS0GM
 AIQ7bPCDuQKeGDQWV1Izth8WURfuaCepAAiyFjcb9f6AmGGfLefcDqeh2rhFIBhS+SnqbH0EDlY
 IPMMcyK6Y9PBZN34viQ==
X-Proofpoint-GUID: K2tQ7sNen5s_CScKJl_PYLZPV0_uS7wj
X-Proofpoint-ORIG-GUID: K2tQ7sNen5s_CScKJl_PYLZPV0_uS7wj
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc2ff0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gKi3Cb3mJvt5RuhTHbAA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070060

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism
to control the LLCC and DDR/DDR_QOS is hosted on the CPU Control
Processor (CPUCP). Enable the nodes required to get QCOM SCMI
Generic Extension protocol to probe on Hamoa and Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..a2d5c9db984d 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -338,6 +338,10 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
 		};
 	};
 
-- 
2.34.1

