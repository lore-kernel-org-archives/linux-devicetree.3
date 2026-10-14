Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E565D5540B9
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993418; cv=none; b=D4htPxRF+50FARsPmC1lOzyMTrQx9asmvLKFxzrK8MPF2wbBPu2x9PeYjYow4+o/dVqRwjWsXDdcIuxyBOO2+JiYc9Jpe+kNqUu20BOwtMOy7nUJQ8V4rTSrtAh6mMSoLiR/t+MQ68GUEWK+pyaJtRJ4RTiXAq3zciO+LMZB8+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993418; c=relaxed/simple;
	bh=tj/l1Z8D3QeZ5hX3y3HdO8/L7MlfV3oYPsAcQ/h95ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7GN4LaAeSLsHyeMpT2Bngl9aUEk+2BFvgG25Q8eOOIyBfAFDGQxjiGeF34ZvMlBEu7cAzLajFnCXXGqtSydjDxe6Z36tTO1HYuZzhpnsgCwLG9jMtcT/bkC7rNbeRWrsa+qM2MAr/ss4H5kH/ro9cjJcjg/DmeHFwPGeot/640=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahNsOuAr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNY5hqrh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahNsOuAr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNY5hqrh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb0qc905402
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=; b=ahNsOuArNck9oUBA
	k7y6+41pWv7mHKW2P/C7Hp0xeEwaI9BzpicwJ3cIVmn4KLhfdI1S06Xj0puJc43r
	8c71y3nc6x6UCulfFoXoZIb+BhzfXhmk0sfNGYOjDNhfRsxS9SX8Bdtl2+2PC5wG
	c65T8yt3cjjPiucegDM2b8HEKzCgo9AgnxphaiGxHY03uJF+zlNGLcG0TbJVeO3+
	RYajGVYxyk4rchiAVRaiJt98ECrjEGJpY+V4klmfQqGQgjggkMiWtMO1Gh4LOWEv
	RVrWVvBaWeqgKSrP2tZ+IuUSoQ445yMqbec/B8LYCXflAA0KNR/7HqWsaaMA3xkb
	JBuY7w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p2dca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:56:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e5d759038aso9969845ad.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993415; x=1792598215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=;
        b=VNY5hqrhW0+/O0ZZybkuqVB0HzP8WQN1/2KMEHaqqiP1qZ0VoPhMrCLHFN8fX+uwIO
         aNWDwzu+5WOlKhIIFH9Trh51KzK9gi4IfFkjnxrPtknhwf9EfszG8RMoD5ulTph52R52
         baR6/r/owvCjWuTpGXoLqZwJo7Xq3JPxZCLBLalnlTwHym3vMIGmM04RngstS5bramQ6
         SYCUQN2NzoMw9bAMFkYUbtWIvlb13KITFv9HmZK8Kp6PrCsD+wYoZQ56FOVzV+YGWKh8
         nSftO2t9QcclTtGzTecuQ5ROZyBSXoA2Z8qUHRttitU88w9FYcLA2p9JAP5BZ3ThJGYa
         lQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993415; x=1792598215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFUGg66Ssl0ElhXSJ+mkJX4XOmcP/S15j8nEwshHQtU=;
        b=p/5Dlf1njn5WstFCx+aDabIWZjWwxNUWu3GE0q+yKQE6SOXXwsTOx3bwCEzsbiDsf2
         xB0yAwBGa4tSmd5Q2lrp0FajDfU915mZejG9LFsDKwcd05/IzoIJQHTAhQJc+RvIQMSi
         80gOfEz1NmvUhmGKRnDlWlmY2tTU476u0Dsp20YGDqTZ7Aftatr1xvYP+ZOvs3ldqsS7
         TukNcx420vqhiHMD25Ar+v2BbRAOsTevJnZZE6IvO/gxVNg1n1PToUj8dRiHP/7MkraI
         jghdWtELhQ0hc1i+gWb+Pp18DRBU4oDidWzLyNqLCY8f8HyFOlvdThDTPRmIf0Z6Uf7b
         tBDg==
X-Forwarded-Encrypted: i=1; AKwUvBy42lZydhBavoCg0DUctkPwrakxw7v11+G3oPqdN5i8WTl/6hRQbaA9GQEac1SVKqFPh513vjOnDUps@vger.kernel.org
X-Gm-Message-State: AFq9FYLMLOClTc6P/9RCuCoF9V7JhEBukouk9ETk6261peqjXWPD0qDi
	P0KvCbMNDf4iJOqjrvG4l2fXzNpbwoUhTLeIesQ1/+QJlU/wO72NeGiv0QWwyLJ6LogkJs6bwhE
	1fftkI5fx8PhDTrXlXdwoViFkfskHvk6I6JfVt4tT2jLgi2hURozr4YjBBmKEAF0m
X-Gm-Gg: AYBFou0CSiQmvpVDE36lba4ew3X3eKbKrj39eWZJ5j0G7jFtXmbk2cFyi4k83kLFsKe
	YtYvt4A3OTIjIdQmr+DkzgHnGt1fclvJgBEKW1wn3OWmyQ9rxawnzB7skgL7cM4azBt5CyAhGoO
	CpHC8kOh6xI4oXx9q4KJeQdUTNnaphCUJnbuqMnHv1xa/ayprIJISTz91LsdgiEQtAQZ1tyEyks
	/9UUAf3RR33Fptiz/Z0DTc+LVv481I7b6w07ovexDpn9lGr7YE2fJqFBGR4s6EC+Sun7QKy9mfh
	/YpltYvyteyJBW1vASZUrw9pkFgXZLf90Us5n5FoXZFhbS0OhpxO7gHudQk+oKSUgr8Zx1bMMDh
	0WoyU6uOAp8AIiAZflQSEfwNTkzd0tjFGkg==
X-Received: by 2002:a17:902:e88a:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2e842d030acmr162945205ad.49.1791993414809;
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
X-Received: by 2002:a17:902:e88a:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2e842d030acmr162945045ad.49.1791993414343;
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:54 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:26:19 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to
 LLCC node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-master-v1-4-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
In-Reply-To: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX30mp75EyTxrF
 gedRDPr8uATs/I3Fht+vAu1eyIqHy0kxY/+OSbJZXRO0a6Dl8Q/9R9Fy6bCI7BosGIA96UgbPfV
 m8AtKcTzqtexxpRvy1Oh7l/1R2QJdKc=
X-Proofpoint-ORIG-GUID: 6HVnXcsB_djswKdi3uZXbPeCP6FYAH2k
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfa647 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=E534aFlItmYAAoDkEE4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX887oFnrcgW+s
 TfXNAuidvNecwWU94Av5K/kQjnBqqMrd2EegIDJDgsJCU16Z+M1PlkaLWkOl4H1UKav3Y12tyIq
 b1zXHEXSJG2JWN7cGF5lUnemnY9HGKLvj4iDctSGJG1kbz6VhoQkWXRidd3w5Lw/BuA94nbmvJu
 fcVTeeGZuJwCNBL81p6zV/Y0j/TESvCXn1VNc5xBcvY9zmgmbwqzcpZGpDL139PGrxMArx4xiT1
 C8b1uG7du+LrY43oGnVjooT2TYCEjorv1Pkv1IhUGkmaEFC7zVEV4rGttx7Q30669xOQLPe8Ggu
 2Pt2BBECWu0MEtkVqWaM9+6eTKMg4EZMQ4nEf6klKWWHTg4+22YH9jgdtm11RooOZrYZiIWUxg4
 YE5qYyf/YgI/T553puo38RH6v0VKNEGBQV3JrEiCwN0f0dWzoRlYEHdOKNaQxK7wDGi10YLMMO1
 Ze3A1J9HzGkfyca3olQ==
X-Proofpoint-GUID: 6HVnXcsB_djswKdi3uZXbPeCP6FYAH2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140063

Add a second interrupt for LCP/SRP DDR DRAM ECC reporting and
interrupt-names ("llcc-ecc", "llcc-lcp-ecc") to the Shikra LLCC node,
as required by the updated DT binding.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..ff572c003b39 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1108,7 +1108,9 @@ llcc: system-cache-controller@e00000 {
 			reg-names = "llcc0_base",
 				    "llcc1_base",
 				    "llcc_broadcast_base";
-			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "llcc-ecc", "llcc-lcp-ecc";
 		};
 
 		gcc: clock-controller@1400000 {

-- 
2.34.1

