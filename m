Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88AB3D5240
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194252; cv=none; b=CcQlVtWaDDClVoVu8kOMpkm1CaEJyyClspnYdOFHUiZFYetIlrGhT3ZVzVU+rWFFqiF4A9Cq7gsNslerdXqvFhDoq2VawrB505Hv4QfsctOZP/DvLUUgubJQqozPcwIwx1btGTtPi1gp4fcQ2P7rEVeBZfkxJleBmw+uJYC5ybY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194252; c=relaxed/simple;
	bh=LHNi+12cboraoNbCzpt/W6iWtyjIVws+K21hs0+sClI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/hVS8YRuo21h/hId9CXabdGqcKNDvHzPLFJAx71kYSRV4gSloLeDB6QZtrEal3Mnzaox+xe22KUgYYO59bPjvwM0SzB11GADQxWk105OtMdBGuH0nhIH1WMmjPB1ywbIpXqKh7cW93FONUCocjxrhq7ls330Q0Un2xOrRxaZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQngIrc/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nsma7KOR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQngIrc/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nsma7KOR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647IBfHq2771025
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 22:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	edJue4htj1/6yA330XjSk4emEsskraGJVNTPDwrcKdE=; b=HQngIrc/io4BeD8i
	ZNTtsFiiaegrguhhJrfqFW/WFVa49f/NvGeqsrpbsYTbpmCKxYkdCluIH7x+mArs
	XW79CSSU67He9YmA3ncj9z9wLpwlNOjeInW4kNjhoUuhrKWXDJmu/croAIaloVf1
	7eRsys2lgrPJKnl5nshK5U7BFY2HJOD8TiuNLoCVDEgoEu4YuypDVH8vob5SFcck
	4+81JYTjha9UUxpamE6UA09JBYIEowvo+r2K1g155KTFaWYhREFB99OB+MpxU/nL
	uTyJXkn7yZmKr/BS2reSCjV//FfEc6fCYUXCCiY4yPXMAW3nOMfHx5Qoq8th6E0r
	isGHNw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5guq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:50:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so3246553241.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194247; x=1778799047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edJue4htj1/6yA330XjSk4emEsskraGJVNTPDwrcKdE=;
        b=Nsma7KOR+vLrGr+q/CtwlrYtpfX/353EdJlJzhQc6hqFGnu5JSTWQ5stT052Yw0Ovm
         tBWZhEJN6miwbWhLCgUxRMekM8vYU6Ojn8NLQXh8b7BN7c204chtCEaDnjYF5oEZmrQK
         4vtkzDD3EFdQheIOxBIiCawhTdewq6BXg5hyKzmQ5lPkoVZmDwJ3MvEQSvxUXKFfhO3d
         DqSLBKvgbT0lOQo/s2KUGSpwbL4KJI73Ls/a1OFuovFRQZifjCHWcdL+QAexfILsGxSe
         u76imxgcNsNrbGOLVP2TG1LgVMz5lKdsN7OytdU++jqJjip3YH8SnpwVIbxEJrqvEmqH
         ldOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194247; x=1778799047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=edJue4htj1/6yA330XjSk4emEsskraGJVNTPDwrcKdE=;
        b=qFu3HEro6BgN8UqJ1DHweyx6f3VtSomD5bzglLWZNSaagC+/7mshfJVug40qcKvtTV
         zRHki5X/xwsEARgTZGqkBV04PVRpQqnXmaOOmSYLG+pHW8pIZXsj7HubVxc07uMi+Yte
         Lg3lplHjGhNPcf9okQkZr7OucYS5vJ14Vp3ow0LFZs+Jbia9uJXWr6FvvqzUJXYt14Fy
         8KJRiMTDpRdD2rnrcS2yDoGqG2+5RJ1jlGsJSTs1evqiJGORLZ+xyhT7jCODR9Ncfio4
         k7RyhfzYdrHMptKBXQ8iG23gG15XJfso+FKLiklQUr8nJ/OUNf7pYH1HjIoRjzb96ZqP
         nBog==
X-Forwarded-Encrypted: i=1; AFNElJ/CS74iijfpnBcIAa7YLYIpPE2iVcSB1wwuFWdqgh77EfKS9YfGYiTb1DKCR9mvbwuQAWDaLDtz8sZi@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3QGFwgWprGxKttpzQ03uwHyUKOnS77wSCw0fGj8uzFkcIsvw
	vbVQkCm+Urz8bGm1rkQbyNEn5RokBuvXdrMyugooKmu39J5MC+sud3daoa0fH/zmloXtMeP7Hcn
	bpTJP8nzaPavgYlYgIhpQudIcsMty97T7P4RBCv4dbY/L5rLjxzazcu5P0net1Dtv
X-Gm-Gg: AeBDiesEEFYAbvDZaX9t2JRe3/2skN/O+muGlw0V6aXQ0d2liDec6EgQkLWbpLJCyD0
	xCAmfNj7RT0R6UnQeCx02UyA2ZZUffOBNzwKuJgPQxFqeEAIG1ytrU/GNaQ9z1+W6UHIeZdjKHo
	T+GCdJdogEPO+7pKBDOw0K8FDT+zassf6yE3CB4jtqSDMC4lLJ5aW+4q0bITE7pzWy/NEMmTWLY
	WCSfWgMWuK7Olydp5zwqqbelxQNLxeYMqoMRgVHV2fp8mYBUoL4rnbKP+C88bOKUFsnQvHRLvxf
	/cn+oHEb9vZW8BzuqRFMw755ZtH6WjezT4cki38M1NXx/rrthCLufpPhBISW557vhjcg4m1dQN6
	PukHjhWxhUQH4OKWwUMA5AVJelbUCRkfodoQ4K32x4ONVQTK8mXonEgEs/yMuNsR5c+KinSicbe
	21Jv71n03b/WVYPMZY
X-Received: by 2002:a05:6102:54a7:b0:607:f4e7:d2e8 with SMTP id ada2fe7eead31-63115d82c8emr2076954137.4.1778194247143;
        Thu, 07 May 2026 15:50:47 -0700 (PDT)
X-Received: by 2002:a05:6102:54a7:b0:607:f4e7:d2e8 with SMTP id ada2fe7eead31-63115d82c8emr2076938137.4.1778194246707;
        Thu, 07 May 2026 15:50:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:29 +0200
Subject: [PATCH v3 14/15] arm64: dts: qcom: agatti: Assigned clock rate for
 CAMSS AXI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-14-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fd1747 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: bkYoFZlKtvyThm5i-nk-n-hOyGlWk3C1
X-Proofpoint-ORIG-GUID: bkYoFZlKtvyThm5i-nk-n-hOyGlWk3C1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfX+40AsaX2/NXI
 1FXB7CX6H8PUs8lEWSVHXbUi+27fdWtVKeMsOjZdnfvs3c9qRO7wC28+wl13T8dAb6nfHLaeFos
 JXoYvRkhdmNkbzLRfGR0nNwrjG+fUvo4zcm6fvgDGYi2EquemwRR46jZBZapMRknaN4P7BRUVp6
 O+2nhwfUwWKD2JfW50ud/lgLktQ3QyDP5wIhVhEQOju5HWAwlb9MpglTonJJoJr8mrU/sXzBb21
 C6iPPqa/vYEZGb6l4a3gIzTI2dd/NcD0G4n4kz6452R+5/8/u9VB9wu8wsLQ+FFQKoZhgaoqyOL
 c/cuVZfJmEpOijYoNeu3Rc88dSH9m4zV9sjfRMvBsPFtTQtPBZ8nL7Ni1Z1hMN/RKSsQh6XcMPe
 yaMQVZPwVtxiyhHHWOgYodUtsKkYY4h2CkVdI5u7xAmyekXXb1E0HGZLzozOt+pTovrRgV1xzBm
 bPy9DqPgtg6WN05Eibw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232

On Agatti, the CAMSS AXI clock is not managed by the interconnect
and defaults to its lowest rate (19.2 MHz), which is insufficient
and leads to throttling of CAMSS-related traffic.

Set the CAMSS AXI clock to a suitable operating point by assigning
it to its nominal frequency (300 MHz) as defined by the specification.
This ensures correct and stable operation while leaving room for
future dynamic scaling support in the driver.

Avoid relying on boot default by explicitly specifying the expected
initial clock rate in the device tree.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c6462a89784429565e1636ce2ba68d73..6a6ab3f15c49eb1e8150f57198ffe2515fa9ae52 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1884,6 +1884,8 @@ camss: camss@5c11000 {
 				      "vfe0_cphy_rx",
 				      "vfe1",
 				      "vfe1_cphy_rx";
+			assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
+			assigned-clock-rates = <300000000>;
 
 			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,

-- 
2.34.1

