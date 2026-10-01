Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F3952D2C9
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867502; cv=none; b=TYOvUJE7mH9tAVh1feDgRFm88rOv9STVl+LcfTCHw6OLKkVV4YPPyGwpOtYY8nA1QZwNgoPbnsTgMSvCH+l88FSY2BiK2j7Q0ijpyoaEp1+i8HGocYrYZ3yg6laPBF7WGFTenDtJPxbEddjkpJEUTrXc29a7SbMJYvyiZ5I+90Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867502; c=relaxed/simple;
	bh=/w0aJOH+xoiyalrUqU9wOK5XaE/NxE7TbLjMkHrYZPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAJq8cDsQrY7nXAF4ul+Z/Bz8Gsvjr7guZ/gtS5coKJYH4FuxtaTjKrZuz0iv5TmhONeh/wzc5ckJM7h4jVTRJ1mY5GLiwoziavnki7o564FV86HMxeQaUbNllFP5nOlertAxQ5i+NqS75C7485ToO9y0fBlApX3XhWYdtK0hgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPwL6HVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fB14PEpr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPwL6HVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fB14PEpr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dipoa3228255
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=; b=CPwL6HVjIyHYBAZj
	8baBNSMXxkvSi5M/GwwVHOr99QwszEo+nBgRMDFpZ1A6rnCUMNLqMVI9qwZAoKKL
	5ocBqZIdHh1s15Q3NgGSPus7tmvFv9sDs6uwCOAd1kAkdVucaeGHK8/SQvBVjFuT
	3i88X5rG8m0Ws+nOqlTQ/I6PN68ZREuxuuwFrFPznz+Fx+DVMcW8pl3ajcMmCEdG
	HjoJ9BKVXbLYJYMZFEaYutZUw46L/zNnYbbJKLnaIGUt6ZUZv4jQYt1JxD76MlLr
	ZxNYM7h22x7TE71DI3j9mnON63zOo5KNzkWLJqPl4xOWTcocLEHylfOpkRSfMyKY
	5gTYQA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1quk8mxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:11:40 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438719cc1eso7885938c88.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867499; x=1791472299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=fB14PEprU/kAjIwpY2kdO0MOxpWTzYrnW1dxbKyEq3crNyPdouZCIIfI1sh8E/vlzo
         6C6C4kg/0yFx6+yZOmn1haEYrNLKalKRo6dbi+xpEy0z61GGu4ptMJVrgHDyYJM4jz9+
         nddsvpy53BNZG2Zv9HcecvjGBlf+4iFR9qpWAF61rZkqCy1s1FeKUlOfIdmG8FA/MNAC
         LMqssoCbUebqLLn26+6gI/vFAK2Qaw9bl1nwC+wM5xT+U3CYwb/2qN/HuGIquz1kddNj
         yCh8oBNii27DqpKoUXypPw5y9reNV6yR2a91/brhJlBBD30GKTa7M3GYo2377Zqlu+PM
         Qm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867499; x=1791472299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTzWQCCMyGuhdhfBCadmrc99Mjjl12xgtOGe4mlucRc=;
        b=0wr0eLXsVGdZiI8Zrt9O0p5VrN3BuRH8hs/kqTvkI+iIyEM0+mltS9PRcHnXp026/Y
         8zhXFeBDT+npbGE6YgeP/HgnNu6VVSjnGctuebbX//2x6WUuMJEndWVsiU5a+EMoSwdN
         SQGuWsAYvk4khB+ISM4V1JINwvvwQq9dAYa438ZSuxyqLf8mdsZarm+5mRfq/A0yQSOz
         KKrsnLuJ4sOPYcCll5ov8SGzY8rq8QHBDGhA3zD69cm6kVi57u/DXdp8Li9Zykl6wHxD
         mCJSf/POZWRApdVIKdP4fyb1XhJ92ebnTzJlBr6iGE1WFdoR89/Bcprpl1Qt8VrgirAC
         nCmw==
X-Gm-Message-State: AFuF++kK6lsPIIuqbE0nB6mNsL2b/mwd7x/b3Tcv6pxZHqXq1OFnAr8w
	Yj6MRGosMUrWsjUh4gNySx1bKER1WilhOWmbTdi+lzRq7HrhpqApxxJBO+GI0J2meJW89urRsX7
	zxhZv8d7fiVHucGJlpxL5CFnWhIqkWeFlOLLmco0e6N62e7cgtabcaEzjIb9XxALq
X-Gm-Gg: AYBFou1DXXFC6Akdh7aWAI8+QBobw/qXWy4uztp+rMUIj9L67iTKcceOBKdux+Ra1IL
	m9cIh4qLvdCiW4GijiXacvkAAlzTH4+PgzzEFzhuo+5okzvaOYLfaMcc0yhxErhBz+2MXVu/qK9
	Jl9Ayo7dtjU52eQPpdnXHvp4ZgyW8e9EnfOZqeI225/PB4z5KFN02L2rBTVHBFyLjzoyN1/D2HU
	RkS7k7UkbpVsfpKc/1HJ0pw/ap+WBV236DdqUQq1KGHubln67ilIw26rCsyltVtuyJhwah+ZhpC
	2TlfoFi+dB8PTSGUTXwbklm9TS3v1cSO9YdYzcMaykJty2j+goVzMpDYt4kPTIZK4vSorfgfXv7
	EDusfnN4iNnXOHgiffngKEn5VECohPuQJGsxJWUMc9DYr33zQ90lUWpGslbbrMh3FpC6loUm4lb
	xr7CyZWdN0e8M1NnBY9ANwz9WRVcky3uRmHA==
X-Received: by 2002:a05:7022:158b:b0:148:4d6c:201e with SMTP id a92af1059eb24-14d33f3abd8mr5346553c88.23.1790867499119;
        Thu, 01 Oct 2026 08:11:39 -0700 (PDT)
X-Received: by 2002:a05:7022:158b:b0:148:4d6c:201e with SMTP id a92af1059eb24-14d33f3abd8mr5346522c88.23.1790867498484;
        Thu, 01 Oct 2026 08:11:38 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:38 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:13 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: ipq5332: add the IMEM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-3-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX6BIFPgcy0R6S
 CdrMroibkxIceFP72jTZIUdCfDXzjRq45udRcXwk2mUAMhRsiLHec/2S5Z4kddNgmO56O7RLlbR
 hqsgaYJm/wNp3NSXZdUCoGRTHDPt4ls=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX0d5fYif1FSmp
 nlonVY2dcuXqH3ZRMa2shx09/KHPtS0jh781apSVgZHr6LKyeIDpitb1LmRSm1CFov9IpcrNsEm
 bxwQZVp4jHIXEbrUMufRSHiQFm8+CDt7QhITCvf3aV5lt68eQzgMh/qawvL1lPrDRTBZ8kNSdGm
 Uix7yZ1/+k0/2tm5VOpqFqP7OI2AvaTEVl4IgIBTnlLiPyEjaeHntph/bFO03+NzMt3yRxa1jzm
 orjQXg4lPAREP1IrD6lHDf9HrppGQueYbQddSCBqS+OdcvmrwHcoZRanRvu1d7Aw6kL/WUT8e1t
 T26+V8LrzHLxMXlg6aaMCGVJxizYk/uvqxrliMIW7AKxD3ITXGwvM3G0vUcMOZlCYXjVDS5GZu8
 IKzMPbJSgmp1PwKhlZTYRgqs+so2nokv8syz4INl+zaE4Fg14iY/MJMiWs4UP8/SnxoQ0L71usS
 h6RsDYN/paqHWIwEeWg==
X-Proofpoint-GUID: FuciHFQZhmChjVZpmm03_8qVYZVcrvNZ
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abe782c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: FuciHFQZhmChjVZpmm03_8qVYZVcrvNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 74d9de8d7641..3e10f45e182e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -493,6 +493,13 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5332-imem", "mmio-sram";
+			reg = <0x08600000 0x14000>;
+
+			no-memory-wc;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

