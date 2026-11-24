Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517652;
	b=Of2ebW/syl3/YJi8nkcleut8+ZBcrOutRbGYAFqvaxkz3oQsexOIgtsKkAjChpPArKvo
	 HKS5vCefxtDWCOlddEe/i8ug6nAvLqpyLukVGQ6SXIRKA+AEzF1lnnVj1CEs1bbSuokcz
	 Tgfa5hzMJuei46FcI82m17USEEx/NRqHgKVCakr67NQh9kBQn09WI6B4FL2hPzU4lj6uf
	 4KPpu9CZ97JLDntxxmzXZhx5Da1Z3FfPK/p1TXzAhD2exMV+oCYJiioO3jY0JCMhE9t+x
	 tKXd2ZVJ2nqKVlMwu6ALhrYA2lQGEM6meTza5CLSRlrJIIN2Scj1yBjxUxzAGalUCzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xtnMeRk0k0X/YY378KWkQdBLEz1neR4yAcGqKsNa8lo=;
	b=DIyFegO2NV/J7WOYFz6q6ixGD1zmFe/dGTYSdfBiI52lzvQpyEuQS3B8i+F1N3Hze+Ny
	 vjBBRTPdU28HYwq3TEgm106MuSO47O+E+hfJzwNGhezB4Ofux1VFMk9XDAT1TR0ZEMb+A
	 D45xkXr6f7XwAo9Xw9futDOIOVqyZEuRHBLyxgfle7VgfDO+Tk45VctS2UVtuUc1fZUPt
	 sP4PX+6isRmHgjvgEqKQ6Pu0q+oomvo0Igqa5J5Kdm91OJX4y4FtgY53c+3Sti1BTkM0n
	 w/xFlDBYfwpNWzhUMz4QhAz3zf+5Q1sDj4EAcRbrwTadCz4YWEKiZ7eJlCFv3Lg52TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U54QDspb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaXeqtW2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E868F606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E868F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U54QDspb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaXeqtW2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAg3xr2848316
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xtnMeRk0k0X/YY378KWkQdBLEz1neR4yAcG
	qKsNa8lo=; b=U54QDspbURrXSFvwLCDnst4SWJrgGzcewuAFI+pXYnHplW/6MFC
	a7u2D6vIyX1jn6NTv02kFtu5ljRnqAXMfnx3A+E/SnK+z6VsYLkFXsbr/wxUFAim
	WBy5B43P47xCERB6OkVo7WGc85ImIibAjESElACLlJ6iUwT4ARZDVdBPDRDsFQwb
	gZTrIofwsI2m8jEuGNr4UGIR3htH/sHmIYk85YiwCvuL1w9CXX3F1FadoMqJMxUh
	iPLdlu9fmu/UZaIQpndXY1mm/+9ypiTFGJ+vkDHvrlDbQ/H0gr40U9e1FLsuy/np
	ZU2NVlmp/wycRwq4DmFOwMSJO6geEo3i1GA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh982e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso5523912c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517651; x=1796122451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtnMeRk0k0X/YY378KWkQdBLEz1neR4yAcGqKsNa8lo=;
        b=GaXeqtW2vHq/Uove4EmQjeSO1Tg9bdaMxRIz2sioWAoeR0mn0azlFGLhmNkLmlfy1F
         XlN3+xS8F5/xHrn76OnG3swzqCF6dHV96Rqt2aioQy5L8X7w+LT72cWjzCs2rWuDC94/
         piVj88fWIWEJdzmKyFtr151ZvdZoNkxKU3oNb6Pa/hC372/0B6KuO06RzPnZruc592/W
         0PlrLr2goJTGLw1PQPvvH4WdHU3MWpC9WXV6dCOtaHBW8JtW+3alV5mt5sI8plVIT/gW
         eTs6RpWIEK1F5ofLb6EWdo+G+ASbkEOiNBnMZ8oFrx285f+MJouNYKGPYQH4L5MVyLBC
         MO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517651; x=1796122451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtnMeRk0k0X/YY378KWkQdBLEz1neR4yAcGqKsNa8lo=;
        b=Vedr9K3jAU1eTaB6TkS4WjG7F+/kS4F4YqkXdizlwobz4EL+MEAiphettCsTeetFKj
         UoLX38TlU/wtU9HIW5z9Nvaw9LEvn7bUd9eg0nuTEooyM4zuM5uA87xI/A/RoPzsJf2v
         kbeCpeXMIFphiG1bV36LAXf7JSYsW3X+IF3/d1g9EGjuH70sAMbXrhMSZ9A10+p+tU2y
         O3JYn5evl362bX/b+xYc6bxB1jwFJeGeJ0V6fDLrPFucCydwwUcdkV9bld1+Nwv6Nteh
         c2GrxZb4Ys5D1ZE1rkPzTibSCunXtOTLm8GEy2NYpnYUQlTT636jBgDI6MimWCJNlS6k
         m9tg==
X-Forwarded-Encrypted: i=1; AL+hErGMrMD5wQS1hyye1mN+cyS3x5f8vojIzCIPGpfCtednV4s0+Sx/fv5mc8FtS6pUn3z90Rq57ngrJvFT@vger.kernel.org
X-Gm-Message-State: APuU4Z/AQp+jv1ILYVJzFBYj+4255COgohOwmLHIzyge6pLGx9PzUf3O
	63aYYFxVkXMkV9KlEbDgu7GhziGdwpSK414EegFr2Gg05gbsdXBpXi4VDoPhDtecz62R4Wl5Phl
	L9QBLhAdgsHPYEaQ8kuGQbV+ApeBuq66d0czYQPOpVpFDnRnJGabH/+FYdjYRCLAlwr/FrIK2
X-Gm-Gg: AZFdTZdw9FDi5kTiLYyObCHBgVxTzgMmSCxwz7FyJ+UXn5m7PNHOlgD+S6oPUcBRk5a
	B3nY/cAu2Ni0pK/cOTPgV3twnyUHBZxO67XdJRqOZtx4QgWrT8X28olS4t49UIAynIbLXky0pqV
	waq6cCq9gfX1o551keu87F11f0uWBQxLuYqH044NCJSjcVccxET1cOEQo/qBblaNwmxmKYFX2+/
	FJSi9gaf/j9a0VCwuFd8H4dw7T2jmcOwKCx397b+B01AiwE0eWIEY+Jc1HvvphUQAIPATAHDDaG
	4guZ6shK0190VQRWTVha5iA8oSwQnIFJJRUjGqozp6fg4lTHVCL3X5uP044MqAolBDjHSzdKlSY
	qJ4RUcJd6oyD5s26wVOj2PKGi7bKUgmKN3ZJDCH/HZ2FoI07OJ5B2qCDRKphfj8w69i2PtTXPwm
	lYWhXpSPa8A6Do94sthGe+cc9HmeLF9+vvvAMo5CWld8Cl8he+yPtSGPY=
X-Received: by 2002:a05:701b:2313:b0:151:5d01:9316 with SMTP id a92af1059eb24-1b5568b0f32mr15389020c88.23.1795517650485;
        Tue, 24 Nov 2026 02:54:10 -0800 (PST)
X-Received: by 2002:a05:701b:2313:b0:151:5d01:9316 with SMTP id a92af1059eb24-1b5568b0f32mr15389004c88.23.1795517650083;
        Tue, 24 Nov 2026 02:54:10 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm39083831c88.13.2026.11.24.02.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:09 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: iommu: Add Seca SMMU compatible
Date: Tue, 24 Nov 2026 16:24:04 +0530
Message-ID: <27f6e560a71f770078ef26137207905870c6ce58.1795517644.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b056cd3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX4XB8shPYnFRi
 YY2CxO/YZaCUtRoaROldtB6M9r+uGU5cRL5YcGBNGe6/xuCZflKpwhAgFucXG75kx8phqeO9VFJ
 DITc8zTIZG8QsFLAw9deAUnM0c6Lr/Q=
X-Proofpoint-GUID: D91qnsj7YcHxFovdhRg4Zx_Ul5nnFoMZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX5on8yBy3bCXe
 ZqMWE4x6o5r+GlFqaBrxX+ldvH5/KKsMnaGA7JcqpJGXr0dQybEmm2Y6JXSopYivQTeeT3stKOO
 oN3btUHrEpvkL39j4O+Hj9bGBNOaVnwvbFnRUqJG6etwvkjrZQUzvjjKfwua/P+JSphCCFwv4hw
 UeZTnxhAd83tVvPopXxVXwTGu1NhRaGNlJgAJIxKc52/+SWDO47bJ4z3TfLWHf3A/xqTEO7h48w
 E4MgwHZUzCZhuoz3ScjmwaMbUzhqPsorbEJ/iY9UfiL0lceKYU6sU81zLMHFyplB1lsLCGSr9lR
 TGkkWPxwpZdHP4U2ya6SEgHYPcNYnlQUkIqXA8owvTucAFsFnzB0LS23zPStuVB5gsICPR8kuWN
 bmC5rqvJtL3fy/BWJskJFlTni5/5Aozb0m3KHv/I1A+AOAG3yEsp+nDTogpqcmViP8uFppPVOHZ
 ewMbvQPDsmVPx3N1CWg==
X-Proofpoint-ORIG-GUID: D91qnsj7YcHxFovdhRg4Zx_Ul5nnFoMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-smmu-500 compatible string for the SMMU instances
in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..6700d3151783 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -59,6 +59,7 @@ properties:
               - qcom,sdx55-smmu-500
               - qcom,sdx65-smmu-500
               - qcom,sdx75-smmu-500
+              - qcom,seca-smmu-500
               - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

