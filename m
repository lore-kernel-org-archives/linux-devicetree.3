Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0551E0DE8
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634533; cv=none; b=WK7bR5KqSVcyi2YKaQxDU2EauVPyBisKptmU9Xwzfs/9PGsSVGqfnRecN+hVGVHn4RLdmo6QKXhtTDPmriJ6rMsu7aNPvX192tIJRinRBQxQROKLoVv6fYsNvQQ89EFPn92CV+tcsy+xwqcxCWZvIEukWHLcte95//utXNSTOg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634533; c=relaxed/simple;
	bh=qBYt6yhJO7+dHZiSphodRC2EaEeWcgp5A0hPgNDah7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJzrVILeWDjYBsUOIPS0ejjTd2al6pZ8amijadIlilZu5FwmlrD+IQChf60FGjCx5Az6vg/Eh8WCC8D7pNAlPj0NMSDLmazdcfrv232sFFNbFF9MupbYVCggl3BBzUimEWUwpWdXtVVWmX1Eb11SaA78bgjzPDNi/+c8u+Jw+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNZh01um; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CS7s8cjk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNZh01um";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CS7s8cjk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RFC2500046
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	82xy1Uf5ZmmpND0/4cvUbUKzI4CCdqyHRsPzLUg4lw0=; b=eNZh01umv4GdOVwv
	wCTXkPyXFSYWDH/36bn66FgXDWTY1XbSWM+fqLlqYheDN8fIse5m/nCj8AMIlzej
	uiKUxQpH5P2SDTJhZMiHVJ2jpZWukgpDipRREoFBewEsyxibF3jJlwBB2DXBts1K
	x/4RoQutqdVYYuV3j6MN879/cAKLlREruQRKrhHc+aZg9VFIg18IKDL1OY+zweR3
	ntdQewXqWZJBog2b5XOsyAkPBH38aywdaN1sOzkK4XQ99nK/VEbLaTtQ90L8T9w8
	U6KwbOW0aNqrGwCJ/fcKPRB7lA4ThwB/p2NzQGRQ5YGdLjCX8eYzWwoXT9aBACTo
	e4DPcw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s24nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:08:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7523418a91.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 22:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787634529; x=1788239329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82xy1Uf5ZmmpND0/4cvUbUKzI4CCdqyHRsPzLUg4lw0=;
        b=CS7s8cjkzm2ULrmq0NgpSDuHaGyZKKntHW4hHZdBFPWy1RECvg2FLz5rrtnHtIDGKd
         OMuTzRw14LJ8jGk4PAA6Xkz7k+6VPXCxv8JUWWIsA++0p0NyEzGfBxBq8wpalJJ2tsWL
         vtl89D/Vrn57drTtzzvCg9o2RT4OcBXWERsLY+gDVD+0MFVT2OHwhpiti8RqI8myBo1W
         Hdg/KsMEFUmqRMk0OwWaiCR5AY0vG6FgiB/tmgCa/RwRVC6ajTulxRVF0FkvfuGw926l
         3wLNTv0f+5F6x/c/9ODhQHHfBp4dq4UXuqGG4T/5UZJTtKHzgEo+qm7NtCc/3/TplqCc
         MVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634529; x=1788239329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82xy1Uf5ZmmpND0/4cvUbUKzI4CCdqyHRsPzLUg4lw0=;
        b=Ho+aO3vhHd3hNLNGhzI/uCPUljLe+mXxxCTqqiI1yhEe2vjdlnbwLWFu6eV1tONyoU
         9QFkceQ07IIUrauvlXDzjeeNlHgzCuHTLRQCnt/VEe4wHxLdmIf7rNW0GcaW7GDDOPP7
         tCdM+qkJaCBDpzVaipYEMqgfjDvyUbifOQTQqaZIn5J7X6GlgjlbAM/ov9c++VwPfLbW
         9jy+vvHzQDxeel3J5OK778sSNGJu9RovddSglpB06ZxH6TLCXzCAtu1LSeJ2ICWqxKnc
         1aAP6xHHciG2FRFSoBrKDpq6BCODICKXtDL+IN8McnmmBJzRXrW9GAmbb4bu6gHIKvHF
         Wb+w==
X-Forwarded-Encrypted: i=1; AHgh+RrcwCFAFEahQ0ME88TAyPPAsLLFGvI3TqsGEmG8A97yXkZngfbP6Y9noTHIAd+Q1cE6hdUtRKP6x+zD@vger.kernel.org
X-Gm-Message-State: AFuF++nLdlimDCf/VXRMA0njreeU+xh2S50ZtP3TdR0VgxBboH3syK0I
	TM0pV8gfjjQzF4miKzBAr3RM7h8GFxsqYnWCmiQGwWB+afVYKrZmapE9lNRdQY5HD2haollxdoD
	VelsQwLsFPPqdPJIC6z/hXg3Sr72f6xPIrftyYfRBTyHDb4zntNXB54odWv3EpCP8
X-Gm-Gg: AR+sD12PEDPZW3S7nzYnFK3RaXDy60UF5WvatVnFm5v+PodBNS476r1f5NWz8TnUac2
	NhOnOGSeY/QLpfh04Gg/zCUXTNuf8lJOv/aeJlNbGnQMQcXugaqpY/lp+b+py5+MAmtAeWNuKpH
	FllXlmERsiVfgGEwLXqHf+12untyD8NcVrCLryTXn5ivb2+PsJtvEKJ8Og8DbuZ9z1oyRTVfXLk
	Ssb5Z6tEq0iwxm3sokldu9qNGHWoFFQyo1T9ZA3QgUO57rpTigNzfxr8oJYatmBnThN9nTw4tP3
	RSop2vebaXUWuO/IgMZxuQ/cgHa4ST5OhTq2b5gxskJ9qYh8ACPue8WyGvF0oEjXj/vzqJSpxa8
	k2hWi4I/UwqVVifX4WZOPViMnaD5P7R31+Fi4HTbYnrlF4TycB3px3+Ye91kKt37RNUxhKJPBnW
	JEsvAYKPUM3tuVwpLk1oC1fDCAVQ4aAA==
X-Received: by 2002:a17:90b:5112:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-395dee8a5c5mr47102557a91.4.1787634528666;
        Mon, 24 Aug 2026 22:08:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5112:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-395dee8a5c5mr47102483a91.4.1787634528264;
        Mon, 24 Aug 2026 22:08:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm32335970c88.6.2026.08.24.22.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:08:47 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:38:33 +0530
Subject: [PATCH 2/2] usb: dwc3: qcom: Allow the glue layer to pass ref_clk
 to the core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
In-Reply-To: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: _QqBhtA72LNKhYG0OQ1WOi9jesMptwti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX1Oy9CR1TrnQf
 VgnKORYwsCwTHGFwzDmmJ2DtlHC6ltoltSn/fS4qx2W758/rdcZ+DGv0ISm+iRq0U3IIBNVoLeo
 PZFCA/Ebq3bjDK5iVA3LrxkysCYD1MQvrB2EhSSZTy29qnw8CiXOzG6DE1tsokNrzw0mh5cc/Ow
 yTOnmUzVVHPkLW9fBjTx39wDMpiQNOXQZCy8R+bstSluO4nnQW6piKgJcUwDLqMdz6Sa+Wa9Cbe
 RoWOq8kNwT3ZEVEfzp16CrG7gm5YAEqPo3KhAv+/nxkatLm1+kRorjBuu7NQyCNrjje+6GOv7eB
 LzEcu/vjRek+VrFmHrPCX9mzOGKQDGlrqHZzQXmRksIUScdD4YRxemQ89MTqrgR8DRggk/ewrDC
 km6vqhmzXJgmx1++UyKSp8McPi836iDIAmTHMSbGhqRUN6MLOYMCm9ec3SYEYmt79186WFaUf7/
 8trKGVpAtPyftOyub3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfXwg8huJAExgEK
 7Qsfn2zPDWXWKtgflr6aCCVCE/LrY0e/UBhBFL73G1onIBOjlC0txqFKn59ljKEPBUSICgJSpcS
 S2+ulDyt+7jYjhjvYJNi3fBN6nRsdIQ=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d2362 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nsXwHlzZWJbxCLJ-4VsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _QqBhtA72LNKhYG0OQ1WOi9jesMptwti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250041

The dwc3-qcom glue layer sets probe_data.ignore_clocks_and_resets before
calling dwc3_core_probe(), so the DWC3 core does not acquire ref_clk on its
own. This prevents dwc3_ref_clk_period() from programming GUCTL and GFLADJ
from the reference clock rate.

The deprecated snps,ref-clock-period-ns property is not a suitable
replacement on IPQ9650. Its 24 MHz reference clock has a period of about
41.66 ns, while using 41 ns makes the calculated FLADJ value become 0 and
leaves the reference clock configuration incorrect.

Allow the Qualcomm glue driver to provide ref_clk to the DWC3 core for
platforms that may need it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..2d6de6469c1e 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -705,6 +705,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	probe_data.res = &res;
 	probe_data.ignore_clocks_and_resets = true;
 	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+
+	qcom->dwc.ref_clk = devm_clk_get_optional(dev, "ref_clk");
+	if (IS_ERR_OR_NULL(qcom->dwc.ref_clk)) {
+		qcom->dwc.ref_clk = NULL;
+		dev_info(dev, "NOT setting dwc.ref_clk\n");
+	}
+
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)  {
 		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");

-- 
2.34.1

