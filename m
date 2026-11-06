Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957851;
	b=GQKBqE/ae6MYs0yxtGbbSNplBIUCPXygOiTaxh6nkI5ZxbeQoAylbKslmkLWmwiyugcp
	 JWIXJGSBgkC/CYd/dKjbotjabuwgFVE0XRD0VdsAVoUNvsm4ISs8WJBl7h+vjYOiMSNdi
	 rzq7LsLgERX4LVpm1Ocw7wa8UolIKJi6OQ8o6Pfz77gKAcr+2z9imwwrV0OnorTlTPJkc
	 s9l4FfSxjPeBX8Em2lUBd2cWFDjLsIyTd7rBH6iSpzzQrLd+OWFEIONyvRa59W9JbZSIK
	 amzczoqu/hVGXolCybJ29yLsGEHwclZXL4qWiyltdM4KZ7UKu3ujAwMlkahf3nP5FBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
	b=eJm1hsnyaY7X7HplGruu1qttdprtNIJu+rciTOZzawJ8fyZBR1vLpfrMPeePCyhwkDoG
	 n/Cn79pdQAa0RrkkC4wydabkClRigKTs/25klFfUXBcPXXxPWeDNksJ9oV+Ojfoau0OdA
	 p8Ybnt9ROTa23haEJo9q1kBknJvzde71GwUbpnt4Gae3qqhRmM5+sLK8FnYWpEqNIV3Be
	 n2E5PGx32FA92/h+0+TZchS6PS0MwIaxH0cD9EinDqSTW6UwVbq0gHWp+gu+x3W/HOlQO
	 bmtTBm6xsMgUgDuRbwuS9XRRmHZKitxr5uD2iL0QKZ2+G5x/PPyhh3Q9j23zQpAtkNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7zHu4ds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3u+PiwU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EF2606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7EF2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7zHu4ds;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3u+PiwU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R9Ef2333818
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurE
	LYImyMjc=; b=g7zHu4ds7H3HSU/ADy0o+QM20WAsN2sOChWdy1FcSmYrOpDbZTo
	4TzRMXxw/dCzY1eqIpP81aSGCvcG4hx9xNLkm5YWoQ0qAPlpmg5ZHqLEWeGkC2gB
	biyGY+c2ysIDfVQPBoNWr5QXisR+74MC5N4BoP97F31Gz9i+H4IxvE8WOjIWkY9B
	3iCxXGx9jQjCTt9qPjLkQ6rUrQaYeHrmU/+wLhIPHQMF6mFZ/9e4AkUL1KpQ1MYZ
	tg/S/vVB8JRo3u4vcPhmOkh5m5P9HE7cv0+MQC1BDGYZrKQx/oSahxHU+beW+f4d
	oSAD/82avSSv3i0VRyobW/OsqHbITB/wIRw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9a7rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:37:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1826139eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793957849; x=1794562649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
        b=S3u+PiwUSZcNHHw63LW2UckMuz2zFqSAWWQdqOpYPRjVSkJvrRoZQTkBQoaq6aGSXr
         c7RSavgVKEvdAO2U6ZUvLwLFtaJ0/+bhblt9goAE0GlJ6rQz5/Yl05s4me/AdTd0Dcj/
         WaFjvB11eTs5N/5+6fbSDkKFI8TNlOjibsLS0FuVIh4WJfvUK5wKSeSGq2KH5lQacsG2
         F/nZ7/4ThsHCYcduYR+UrjMQHl0Dj0MigfM1RZZ1FpO8IrB3sC2gk1E95WKASWo/GGO2
         dYpTFPaL6l6epmTJbtuX1afG8VyeBimthRaTjXtRhU2XhIsLAbBTt9dAHrVpLH4eMvkJ
         mIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957849; x=1794562649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
        b=eNFRVFuSszKsNMfIRRH3ToXnNQa9Cm9M71xTLM4qzPlorPYzGhYOUfSFD4pomq6m/3
         tfXNMrFhZURoPSe9UQGgL3/t8DvwsGcPzLN7r+9UAEu2flIEq7Cx9rxLjAmQ7rxw4cc0
         fwpfTzp4lZb+EGLqVkz1R+gp7p2DjoeQ/blvWAQ32Egrexosd2LCze+NgW4bC7ZTcu8s
         J7KvsE4s7vjROuDnMMeOXojqlNji3iKhpdJebrld/SKIaTcBKTbKcgmgAim1Eeilpn5t
         TeLSIzzBqRJKcoEmBm92aTMQkqOROHOR6+FjscDpyANLGXuYwchcGj+0jQiakzNWyvj4
         UJVw==
X-Forwarded-Encrypted: i=1; AL+hErENUzDRcvlcCnLonT5u7ox/quiKdN6R6dLRwaOfn1qAWSyWY4WdKMAEAV3+PUuU6o44DOH5dkgxNWxO@vger.kernel.org
X-Gm-Message-State: APuU4Z94O+UxKjdR+oCzR9Kqm19vkrpiPaxQEWXh4gohuL+b/AXOp1sj
	VbQKaqp6lcscBhT8iZpqfI9pVUFVKSghMz7n7ykiNTmSmxNEE4TkslYS1Xw1zRKfUeltYkkZfIo
	lGiHNOuLvetubJZymjRhjUZI37PTQtxOTPsXSZnGNm9+frmjfAwhji9Mnq+brULnT
X-Gm-Gg: AYBFou1+LHdj3Z9GIv2w9XNwl9q4k/A5U39JvdcKTD1l4zV8G0IUY87KC8c92QEKn3E
	3lhftsENQcmHzzyXolpWOOgFKQEjbhSgyzmu/2plMNFAoJ0cDsHcGdMwag7atoUP+eLDUYS0DM2
	1VaG4GJH7lcGq0/h+Ovc5qW9YCUNwZhIPcpHNt/itAwundgU7s/SWb1JStOK1dZ/JBstd+2Il7k
	G3zBMsY6a4woWgtDIcir/pGZO/DJiSLEgEszUrO1mTxLx2hCoEoEQzgV6Lf8vgHgcTLlQuYm2xo
	QJyNzC76B0KMPg1GFImhq3waUeRZz2SqoabI9WGNsfQi/GT0qnOg0WhVQPWspoHffaNv1qNW2dw
	jpZ+wnJTFJxpmCsvcOGoLW6LPcyhVsqVazmenKjgIkY5lT/l87BXKf8fIBklr6R727ckRXt9HEP
	DuXw==
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2691307eec.16.1793957849286;
        Fri, 06 Nov 2026 01:37:29 -0800 (PST)
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2691259eec.16.1793957848748;
        Fri, 06 Nov 2026 01:37:28 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm10548494eec.3.2026.11.06.01.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:37:28 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sa8775p: Use retention for USB power domains
Date: Fri,  6 Nov 2026 15:07:06 +0530
Message-ID: <20261106093722.3261172-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: V_S-pRCAGOyUymlyAU7UFnskGhPmG5qS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX+5G15jA8L/Vs
 4ZDDz18kxfNRYV/1sf3269y4z8GzL2ll0Ttou8NSqh/8unpOlSS7E24po+TLDgA4903daAk0DPE
 qzN4qY7oZLgMv0OD0T+cAC0cJbP1WjGKxRDlei2AS94FkTSPXoOyADZBAkXPJURGykl2cnlRe1Z
 YUUKDA1qXiXMhvGyG16+UBOD3koALXcML6O3XMw470pw7FiKdYh/xMjL+61A7/CcCvcMflqAk1u
 wQjSs8Fz4unHV9GbgJ3P9OVQpvew+uSbb5BdanJ7JGv4ClnXkPUdCcekhBtT2WLj675yM+ntdA4
 a/heuHxMDZMehNWtYa6GbYtfHiHLtR6r59solDxwz0HfY6xbyfWc9+AKaiFhK79w3eo6pjK4JXI
 ORdcPFeKGeM26VxD3pyXMHABAknaj5iHDO3JOn+QKThHLzWoGEG8tWTj51os9e4IT7YrdFis03B
 GsUVZOguZUkTlWrJLaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX4s1uWOEVBTeJ
 ue8qvVWU1kg6KjTxywTAN0Ivbs5QE0lFQNwnU0+DfbdFgMQIySJ412ctiUApgIf+SpdlQS7wXwz
 eLdwgqGNc9H3l9W9jIn4J/pCpOSG1ZI=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed9fda cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=rGLbVbw0NfjaWOq_wPUA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: V_S-pRCAGOyUymlyAU7UFnskGhPmG5qS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060038

The USB subsystem does not expect to lose its state on suspend:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 0e02af686614..47acd1b58f13 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4260,7 +4260,7 @@ static struct gdsc usb20_prim_gdsc = {
 	.pd = {
 		.name = "usb20_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -4272,7 +4272,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -4284,7 +4284,7 @@ static struct gdsc usb30_sec_gdsc = {
 	.pd = {
 		.name = "usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
-- 
2.43.0

