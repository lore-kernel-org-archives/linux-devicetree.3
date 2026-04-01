Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F33CF67A
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034942; cv=none; b=R5aTgQOQ+DXKfgyqfvgq6ORujPzD2UoMC7sRpFXj5VQOsXBlJolUCfffQ/qhnZokqpLcTj5Kw3nkTskZmMtlVQXAylFHnRB+lkxtmYgY1k3RMIWsXAUaj1f/6uLCb1cZV9MXRNjYzrYsEHNQxqyod2HolWPbw6qCU/Ih4O0xOaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034942; c=relaxed/simple;
	bh=tx0he3/MmcRXd/XIsxErZQP8p/i8WWMq/f0HSUslY5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2Yy2nTIwo196YgdRT3depm6gkjsGnNchT6xxyrNuE0g5kZcey6KVkoRZWURJWTh9iSA+wulACH+IJv9DzNHXkEmSKrp0vF7JnQT0y1hs7iO8NoKHIOQYEuuzdJ5mNdsQD8A/doK1OAxMH7rhGxZeli45A2tCyKt54NZYoHRUNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1hNxi+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgLYwplU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1hNxi+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgLYwplU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317YNYx1004301
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/BBPB/FSLYg0K2Rdi+KbCC4Oq8XCYRTZKAKMV1mBmtI=; b=B1hNxi+x7UJMlbqX
	IF756CFx0sPtkld4EmSCDviV5XSMECNSOjv1IsExBYVjnh++8cDRFW7Alt0g+p3+
	Iyk8CavOw+A1McYfgZhC4oKsoiyFBJ8UpSdKesrlA0ZMjA2CZKZqRfBBcQBOCbvO
	odRApzqCZkburuTjb6JqGPuDkZmkEN+iE+DDT0w53lT98nuS4FJUr2LsW2UDxdTi
	PKx+pAv902e0kn8g95Fk96LpwemFPm7hfdfLU05wkKX2iLw7nel82ylBP162CTEP
	SYO2fHS56gaajfRzvuYkEo1CQ3DFnJz6CPDV5k5sKCkciTPYSVdDEo9a3l9HWjp2
	HvCCdA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhh0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:15:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-128d0b690feso16054465c88.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775034939; x=1775639739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BBPB/FSLYg0K2Rdi+KbCC4Oq8XCYRTZKAKMV1mBmtI=;
        b=jgLYwplUGGP0erSTU3J8ZBPclBQ8EKPP3FvZqzEAt+j7T4MCF1UD4q97ackhGB5eJ5
         G7nTs3IYdnwsFqo34NZQO1U2S80Go69MaYrq4KxAfm7eF5FmD5sOMqmad1bDdoUKwViO
         eDJ7eIRreR8RkUmrLrNJhf1/2Mmmn6tOPvSbuS9Ow6JcLTfODfbAyjNXeg80MFqeNlrp
         H3T67ve+XqlDOZUsYkLIWTr5nx2f+T1ez0eyKvT5BL0t+IPNFqjUGwCRmYx2Kekms9h4
         SckGtH+Rzypp/OPdkJ4l0DMSEdEVxMGoK7JS+XRIqnEQrdkeWsfCio8yDCPBL/pviIsT
         cE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034939; x=1775639739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/BBPB/FSLYg0K2Rdi+KbCC4Oq8XCYRTZKAKMV1mBmtI=;
        b=JEDvxHLJ/qAAlPse7ElijClJiHdLbm7sWQZ+znA5I95CQFp5srsId8pEAmo8SRzYvO
         pCejx82eRTyARVD/dPN4BcUW7ZCOqAGN4Y6I/M4NgvymY6qAK5bBf3NBBW2F1UFKrKbi
         rYn+Uq5APw8sv7MkqDXRqoGrig5Kf7vim+ODWabyuUWjsxMPHqUldu/EqMlv9DU68Wos
         29ki5bZpbeI19pEL1GflKZkuG2d77UiZ/JULT2FXi5ziqHDry5sg6lT8ANK0kawA0P05
         INk28swJM4ARGEECkFC+XmfJ1dRM3/ndjboaZHWDD4Ba7ouL9L4wWwpfQjJw4qr0/xWV
         2SFg==
X-Forwarded-Encrypted: i=1; AJvYcCUqrxdZT7BWA4WqOg+4BJG+cXUkU6FkyFaltXIXV32FDOrU6eCPNhjfGHCzVXxxxDhqH8/+wyY2whQ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ZnLLflUWZOVLg9jZyCMWyd28aZg4Xd9jwD1Ep3Bh+7VcmBsQ
	Kw/rIt2ZLQIHfd6bFUKXDmfr1iB+hzqwgVY7DTj2vDbwANQnsz5bByM2I2mwI+PsoeHPwR6G0XD
	BEwexZGaDtmwds36MbUzQGwYG8WJFB6D4m11gZXyxRnqUdmJcuh8N/ksT8sYIn97e
X-Gm-Gg: ATEYQzyxXr9Z58/k8UJDHquADnq6PGuTD+436RQ5Q+Qr0Oxmr7d444nGAGgaDFZhnjr
	veKvmxv8aD4Tlw62pAEQ5Gn7FS/A/rjndniRdg7VEx6+uozQUAZyveSiQL28IaNP77zL2jALHKa
	8j1Ll2RmHg/kjM7azSYO+BLFwQpFyEEUjHdM6QGcP312uLvnju7sWTah38wziOxpQNUemzuDkNy
	+U4ifbO5nG8ta7XMCPW3hvWGP6/eHL69WJzPKbk5EqZ6QYXlZyeHV0wUYLR1TqZk8ngL0NzT1ur
	JY1RZTSxzAUhd3iSCIdSnIPseHq3BRioyh9Noj8TaYcZmUabh05KP67FodIf7Tdr/6DKI9xQK8H
	49iGTKp5WhJKbOkDBxE9YL8x1/Tg0QL13OaSm3ilS+pHoxbmkzUvTF4yQQ7c6vH4H18eIqc7h9w
	==
X-Received: by 2002:a05:7022:7f12:b0:12b:ebb9:1c18 with SMTP id a92af1059eb24-12bebb920e6mr34947c88.31.1775034939306;
        Wed, 01 Apr 2026 02:15:39 -0700 (PDT)
X-Received: by 2002:a05:7022:7f12:b0:12b:ebb9:1c18 with SMTP id a92af1059eb24-12bebb920e6mr34926c88.31.1775034938658;
        Wed, 01 Apr 2026 02:15:38 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97efb42sm18285025c88.7.2026.04.01.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:15:38 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 02:15:29 -0700
Subject: [PATCH 1/3] dt-bindings: power: qcom,rpmpd: Add Hawi RPMh power
 domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-haw-rpmhpd-v1-1-c830c79ed8f9@oss.qualcomm.com>
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
In-Reply-To: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775034936; l=744;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=tx0he3/MmcRXd/XIsxErZQP8p/i8WWMq/f0HSUslY5o=;
 b=QesnCfG3bmd5H8wD5oO0AgsjYZw7/8oOfl40RuKe5J5FLfFsm6JMfe56Qs71Y9RBpeWBjaOqi
 KFxFmOqWLJqCbDIec2rVmRp3NgZTNouH+nI7qEf/F2mK1f+V2o/I1+M
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: 7B3EnCL7YE3peu5JvLgwFg0JEbenEc5j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MSBTYWx0ZWRfXwizPE5jMdT/5
 RnxfIFEMAmuUHYQJzfLnsuGLxamQMibF09vvIueooF8vJI6gBWQI+0QjBybvxiQg3HLy9GtFPSL
 xxbhRlh6cJIxRxnE54pNC/UWQwddYSpGAKOEhN0ig/eWnIqDOTfqMbOHyt8GGqjutaVYTO7Q0Aq
 eZA3KJjGewmPMzvsxnBbIQ8PnwxPzipY+rU3vKiAistAE25Z7vwpGFFF17CfGDfI6BoRRHYPOjE
 jtvkkbgEB6aCvbh0lqgNVVDu8H+TIhtiV8obzbaZOdsL4MjOluG5qH+imPbSVyNX44m/U8+KafP
 CWKSTqdt6QK9bkC7rSi8THI531qiw4aJwPg8yVhHAAWVuAVJYzgwAGqlW6Om9SdprKHsrkhxRAl
 obty9rGQNtVaCIMSdrE+p22KEUeOhCkq5ifwNI05xfUqF1ew0KS1s44BnxMJ4f79fRSWacsawsT
 2PMXiwvjfp6CiJUtRLA==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cce23c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hqjnkh-R_53NPVJCVN8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 7B3EnCL7YE3peu5JvLgwFg0JEbenEc5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010081

Document the RPMh power domain for Hawi SoC.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 27af5b8aa134..35a0e01c2015 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-rpmhpd
+          - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd

-- 
2.43.0

