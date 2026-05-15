Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197E34779A8
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842082; cv=none; b=DDaez/G+ciGRvzldDzqTlvXuKyBvaDUyOPTmMiCDyyKKCdzcl7gO95DMjAJ23CwoZxbMiTrnCKEdznNzPqYcgv88L7XaBAPMLiHDoGXtJFy3dMGq/A8qL047L9c0Zb+X0oA54g6qdBRBwvbwXvkSQMAoJRb4EEi4abeCAM/T0y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842082; c=relaxed/simple;
	bh=R6+dVh2XqI14cCIE4/7mO2Ktctr5Aljw6gefqysMyrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNxWBpCCT53PiqwtNV9+JoTXUqzDNQYlXcbAbxyODUx0Xr/bijrgosqMA9DP9F4K+hHjgEqCHd8ZYn78ZUI6NPAgYAXzwIRQQFSsGENlfz6192Yw02OzIKGRO+hEeYUp1I65uK68M0v3IVjZpxRrYRvafNbmqAbviAtZEr+J5Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbAC2wjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhzjRGvR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbAC2wjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhzjRGvR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5jaaV3512838
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sn8q1HdVYoRm1djZaFGYIIMjhSJus/GnfDru0Q1XOxE=; b=WbAC2wjMPFRP8mMa
	YEqF6A6q8KiAiX9qu9+x7bPT42+TdbHQGlh/ZIboZ/wyQ8eUqO6Jd8PI33NON3Bc
	Yd3n6hDEdQwsh34D+XRUTH9yJrNCqxRYG1rGsWkCDRdigjWw/oq+lblEbwe+nSDJ
	OT4UNNf9UsqJ6rQ9DfBs9kCiPJ7WSswgEoFZKZ6osV74OJQMVSoF7BMQ489CzgvQ
	dj0Wgpx/24X/dWDKDPa529/Vg8Ib8Swv0mwck3LJLjFN13HHhKGL9N11iAkWCzNg
	HowLgCC1LnbWztEMRQpTxLf3PRtoIAfvOpBGlJM8MQ6kYUCiPEpeCiTRFnpJXCZD
	51G0Ag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vawcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c828f0f5c23so3186052a12.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842079; x=1779446879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sn8q1HdVYoRm1djZaFGYIIMjhSJus/GnfDru0Q1XOxE=;
        b=QhzjRGvRpA78hi1mrDNWGxJlpBoUkTcHV6Dg5/CTiAowFjUIyb4ipdcuGSu0+zS/uj
         wIo4IPuKmQf9WBHyGhVXGIp6oJpRLu7XXWPS2/nJmGMFUGRy1KDDGde6HCig7dgO7bEc
         XcfEJsLEbYgnmXylfta5e+UCpsCQ0OVRlHhG37+5gL1Xj2yveIQmg1RCRxGkJaZ/WaX9
         GWw5N5JJq/0V1GQbccAW8tKtG12/AHakLwTTjc90u8AUST+8EVXwe9qcjq8CxS3480wk
         9qvTWmppLGmSK1q22tbAeRmVaiIGQZ0h5uOxkqd0e4TQf0g5o3J8D/oGCpmbo5bXFogp
         visQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842079; x=1779446879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sn8q1HdVYoRm1djZaFGYIIMjhSJus/GnfDru0Q1XOxE=;
        b=CpJAXTKAR1m58LbBShRs0Ynm295+4YJmqvGRGIcwF3zMGLp3yVOwV/cVlS2MjyNrkr
         gcdQT2/+2DExIzir5wKh0SRSbXRS7v9Jyb+2u4iv+Yk6mHgKnCYZH58BoinQ2aoSDx/O
         JbpAGNNopmbkTY3MgsaBMN36IUQbenvooLyAaE4vApxbNNsTHWmxGMwF8iRVay7kiayE
         urMWmswM4rADV/ikU3rtGKpHhP9DalQxDSwFJiOIZklrqV2sXK5TsffIneDM7q9N/Mfa
         hKZUq4ydeycxu2v+a0b0lssiJS3p5edgFHmW76JkT7KshDuoCHSLdt0fvWSY7yuzjGh4
         v1QQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Lh06t3V/tfYdt0zw6oVnLQch2FhRm46o/+Km6Y1FFDtkxC/ZdRTEMgICLP2nQ77kgnfZ9/OfLkRek@vger.kernel.org
X-Gm-Message-State: AOJu0YwegbhhN+FZEa7wlhF8TzL3THEuHx+tdEcsj0vFO3vcf0PsLKNj
	8O7cMwJA3Qv2qPlvs+qXRM0nOlWBn/qvHrCnef0Q6+NDNUllGr0brCKYjPGiChLLuH1SEewJ1JU
	fjsZHDhM9jv+dimnoYqMPTmF9TymhrCmyPQ13hUEbzPOXsTwVsspO3hS+Bo1vg9jv
X-Gm-Gg: Acq92OH16pvoSoSp2ZJxQvoeQ69uaTM2a0uSSVA+5GKb9tQSA1pW0O+ML0PYepHl5KW
	n07EaYHyRS+pV+IsYBSGpplUK7zzD6T2QyKFZrC+3xN0yk3/fIxlDOtdIH0ChLCgS7mQyQN6rC4
	ZBRHWB3x2vd3nFdneWh2DATkxm9rh3/UjizrwZTKm0/hFfVWOYt/BLR3NaSx4cn4LGHkFnyLHIe
	6VZSp5rJlyHwcNeovBRikJQgs69KhFEz4Oh5ui2xY6Ispfz815KkaIUpEPOOlgVdrkZlP4wyJV7
	fcOrIdEuqjUp8q5oSXugfDAcM8hUSI7mt2Mukyb6Y6XuzuOQ2YRmmUfX+/YceMhhdccaru57QXS
	53+R1OM6GF4oLZ7DTWnh82bgXIB7rTlyOj13bOZ4u/WPrWbNXK6pMzp5Pl0zbLT6gYT32zc+O9x
	YIK00lXcd8Bb/jv5Y0LqIcpqF30HGZ8Xpl9UIyGnUGhbs9pMP+cF3XDKNhh5ciZg==
X-Received: by 2002:a05:6a20:e293:b0:39f:441:493c with SMTP id adf61e73a8af0-3b22ebed7f6mr3895211637.30.1778842079033;
        Fri, 15 May 2026 03:47:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:e293:b0:39f:441:493c with SMTP id adf61e73a8af0-3b22ebed7f6mr3895170637.30.1778842078544;
        Fri, 15 May 2026 03:47:58 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:47:58 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:43 +0530
Subject: [PATCH 2/5] dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-2-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX4NUsqUfdXhu0
 UiLh5CrRbFx7rOQa5syvWvcUoXnFh0TuxX9mwnGOaMdvSf3k7v7IGkIf//Zlm4hg3muJsJwsWb+
 NRPm7yt9rfCN3DmMj3AV9zFhrlhyGHauneDQ6VWOK9iRb3/NUiTp4lMIhDdcMRPdwRlTg7vR8CB
 im6K/wTB07sY+hOLMLDsBkVPKjoKHoB5Tw4oP4DQU04iLuvdr6Jx9nUby5xChZF0zIWDilnQuFz
 1hG6FtkdiTuqTtYo5T4DKByOsPulF7CeVqRPC5oB8Uk59bKpaQL2566zcHNQhK+88N592fFi08c
 udaNfh7RlSMDNcb9bIyjc5TEBqb9cV5uoxR3fJ+hOtMHP749NiLY0FL8WOrqPHB1hADRuEUD3xZ
 4Yz4tO0lCKfkzU6EPc7kMgovLMlHwkdKsQ9+XKd2OzNmRd4hlnJv0DtfwlbCs4GrqbcZEtlyc+0
 i1fD5Sxp3KpuEmZuQ7g==
X-Proofpoint-GUID: rt5BFTdwsb6yu7XOw9tLI9QJNWHCIz4y
X-Proofpoint-ORIG-GUID: rt5BFTdwsb6yu7XOw9tLI9QJNWHCIz4y
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06f9e0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0GDvqmC56tkqaa0O6TQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109

Add dt-bindings for USB3 PHY found on Qualcomm ipq5210

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 623c2f8c7d22..bdb80371ea68 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-qmp-usb3-uni-phy
+      - qcom,ipq5210-qmp-usb3-phy
       - qcom,ipq5424-qmp-usb3-phy
       - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-usb3-phy

-- 
2.34.1

