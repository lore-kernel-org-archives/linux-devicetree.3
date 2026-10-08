Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3C448EC95
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450932; cv=none; b=brVai59j4Gmo0yfDN+K2QuIf9IyZJBTaqNVp5gCQKpGdqV07iEWBKQAx4i2tbS8UPKKhczwmXMPt0ECggCIsSHU6S2XSYPcdh7auvhnWiZOSqJSuY6rPMQFjryAEZkt8RHbsxhWhv20ljjYV++CmzCzziZEhKXwIdiwjoyK5VsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450932; c=relaxed/simple;
	bh=3d9/a9jjN7GAxpxkt4zvvXZScodzf1IsGMV7uENdLz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRo4DRqXh5Ju9VyJItFR153gvM08eZmauTWsWLsmj89IGAtKKoopo8Ikb/i0UXxiKVW4NITzoZjLkMgr02HLBTCintpm9+qsMV9NkYxXBvBbPfuB5PVTKtdj3q+w+BJphTsJQc9DdjNw118RgFQAFP7M+G1JeThrC66XhKRpSjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKaV+0Es; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MO7o0bjU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKaV+0Es";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MO7o0bjU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K6NG1341852
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jif7VDWkcxpHWo5f464ZlO5jXohlLqKyfu0q1fOYDqI=; b=cKaV+0Es539E1VlW
	rWa79AnDt5ZucKUMuOdR8l7/V4gu6Pf3XoBgUoU5nSvFbfgTUHRTyCn05kgVPX4o
	sg2Kg4gbsM+skULywNPPR90bzmsDMkrkO368or9EIE+6T7/tWGm5VTKyYOL7Dh3I
	M+zmO+yMIEZTdMMBLz0J376RDpjhTfDX2lS04tZBhdbHXv6LTMHL6Ykmk+ovGRrD
	DlVmuGeH7Qu6Huj/U9K7lvOmMzcnlHER1a0URStPZnMkPQh4RVYlcvh61V61RnkD
	3BHzEL1P7CV4JPkzUuVyZVEB9txLahwoJan+TIZH/Hwh6aBn53C5SBBrT5GLXjhV
	NTGmeQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2t4cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:15:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35158d674e1so7687090eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450917; x=1792055717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jif7VDWkcxpHWo5f464ZlO5jXohlLqKyfu0q1fOYDqI=;
        b=MO7o0bjUJocWZLUz8eWv358WBVVktQlxS2+O4Qp903p/VEzj7ttHNULJ4RCdT4QazE
         ZxTed/UNzLChv8ZG+GnfFvtneSV7dqhXCWva+uaQwSAgnSzooV4hp+eOWBC5p/D2mkxO
         eveufqFBCqnfPnaTejnSQdv6Cfon895xdNa2lLLo1+qWc6B0rh7cBWGh7EpZGK7kpvFH
         izzruJ309l50htD9WseqiIUuYwYCvBYoHixLs8v5c5KtB49pvnWNQGMxV9FpP3YoXu3a
         NZgzqGYa31K1GAr0aytgfwcs2EN9bR99sjGccmzWLztPWvYZQLbDUP/j1eazyNF293LC
         BpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450917; x=1792055717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jif7VDWkcxpHWo5f464ZlO5jXohlLqKyfu0q1fOYDqI=;
        b=vbqKrn0ThJ9PtHR86h3Ekis8X4K7PxgiVSFcIYzLJBEYO3Wn9pejjW316O6tRZaLpz
         eUxA+pr7a6cqzh5NrlFHdlNCeP3v5qf7d6iCfupJnSoNxhF/YMLFwW/ya8zjkIzHKVEk
         jyTqnkZc10qUhUgmNu5LJFwx27/vWV180Jyn0IrXyQxE3xjWSJw2JUlRdx9PaE/d6yHY
         wXq9bgEa4JF9xNDpld7Fg3RJ5SlCTV6hiaOiXLVynzObFmi/XjlBEimCPHRI5mlYBUmI
         7HU+loX75A6Gwt6g/nURoueqiO0SGwaBLJEH8BO5Xk1jS8m0qEXkBFbA3/r3LBKiH2XF
         9mIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV+zuwDb4piEMn25G+5HFFe3Mc72fv60e6NYRcISKZ5vcyNuoP9UFtwjLByJNb3e/9S9bSwk+fjejU@vger.kernel.org
X-Gm-Message-State: AFuF++njuH3xN60MbBWdoblXaZXng+FPUTpBTYzqKQKCIN7fa8BwZ2I0
	2qOq3NV0eavN9na6rT0pVoencr1icyBUi2wf8RLrRift4NyzKvgX9r89y2uiqodJxtkDmeDflqJ
	ngz3ZlbOibXFdCAaqtr0Xsqm/3WfeEyICPGJRQpFdi9URIN0pDA+F7QlVSFbAIneh
X-Gm-Gg: AYBFou0PJUeo6qeiNMJXazg6US8EyqCMFxgC+fEDwBQzWvwnhIwcrj0+jpDysK6fQlj
	DlQjkUNudAO5gZ7EKBcxPsfulnoesT9SCaoxq9s2EXRG35G3iA2FThqdzfZIWmteQkCdqULdY6p
	dukE5mAXBnNVRTvcvVjkGgN3KWlRmOhUQUMUo36D2cJfLqzan/3FglzzLeyOYBBJTQ7i1Tn7T9K
	s5Ata1MoEXYdNfYEKIwKYAoJUNEDalpRpUKIgEZKyQyAnshq9Y4rpryijUPsM86hlxRkxDvySef
	+nyBPX3meq3FDOvzZEU7Dl2yOOf8yVVtdSvkwd1DU8DbUs3D9pYJeCgv5chWBz/7tuKknpaDunk
	740gMA5f3+Xi7k+PtYX02ZiWpW6APzWHPEvYMd7+CIRWIobICU19y96LlC6P8okmKdv5S8Mjf8Q
	rSDxTy9tJs9Wxdmuu3/WthALyTajk/
X-Received: by 2002:a05:7022:ed0a:b0:150:1cea:31b0 with SMTP id a92af1059eb24-16205cc1e56mr6233881c88.13.1791450917041;
        Thu, 08 Oct 2026 02:15:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ed0a:b0:150:1cea:31b0 with SMTP id a92af1059eb24-16205cc1e56mr6233825c88.13.1791450916215;
        Thu, 08 Oct 2026 02:15:16 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:15 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:31 +0530
Subject: [PATCH v6 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-11-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX0RcJgSLoQhDm
 NrGydah3UT6VAmK1yVhnV0hChvmJr6nVPeyMwdAdDTqJTSLXTYPdaaSlfu1Wh+vyk/JzAEzl4IJ
 cH5VcTdcq/ReY/NIcbJ8bYKYZ7e2X70=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX+kZYrQCSDLM4
 th67Tb/W9IpTtce/mhu2Sr4G3QNxXoHVzRXN8MTdN1mwo15/QKT0LCzdlDXxzlVATszDrUO436A
 l7c6UB1ZliC6O5f63GoagJbJxIO+5EpDjPA/bcXk9nrk+b0YCsEEYgdJlE27vTCM5trCiKq2tC2
 s6IFcE1w20xxLJU+s6jcWuWW3Aw30M/3M/3z3ntYPjGOVmhuydyqHSxEyTVmQMB3PD4ryjPu9IU
 Ne+4VrFMyRhsbkIdkZOIDAAwQtUN/hUvK+cFIZRDlgjFjxibSws8/sSHUlgmFmAf1d4oOCqoTc6
 emnOUOPtOJZljno/87qjeTcTGnJXd9wBuMhfI+wqpZnCODmw5v8S+F+FhRLFn1NnEgmddYBtFEd
 bN5HFbdXszFlaN3edYTiMTep4cxLrbU1coclhmBTzXN1NFTJKUlLUoTuapCoYK076j/xLXUmZ9U
 w3SnRlfa64SMgs8YUAQ==
X-Proofpoint-ORIG-GUID: A-gL3yAyR0VZvlUMNPIShkA_VfZOd0E7
X-Proofpoint-GUID: A-gL3yAyR0VZvlUMNPIShkA_VfZOd0E7
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac75f25 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bztaWnFoPO8Rjwv9oDEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add random generator node for the RNG block present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 23a2e27b70fa..4795de0c8baa 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -198,6 +198,13 @@ soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		qusb_phy_0: phy@7b000 {
 			compatible = "qcom,ipq5210-qusb2-phy", "qcom,ipq6018-qusb2-phy";
 			reg = <0x0 0x0007b000 0x0 0x180>;

-- 
2.34.1

