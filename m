Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBBE4B04B7
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321090; cv=none; b=QPmoL/jt/Hhb2QaZwqBuSoYeV70ykIQrpFweVb7n1WtjVw9QYuhJQUVcb25S2ziK17lzida19MueijVjx0SnNHlUAqpNHMDHhGO9VH9xkt2Dh9X4DcVl4QJ4kcci1wKpoFQ8qco4HMUqAHUZcSVwq8xk2WmwGA4H9ZcAIOK7xNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321090; c=relaxed/simple;
	bh=c/DbwxB00h4bCHsVWfXDLZ7vX3Lz9v0Rhy2xTpHLGyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MmSAWUk8MLxkwauyKDejdiyo90D8Kbdo1yAk+SUfc7nWxjrjIjptt3bnPHLpLJLvFlGkwXfQkGnq/vL2kHa7BvHIZUtBQbNEMkshNKiZcQlHF+IiGnY0Sfi6h51h9tf5u7fBh7952fOebdGjT2NZ9bKtmz5qSnN/Y4F7jXmcJl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCshpbo8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qh3p9Mvj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCshpbo8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qh3p9Mvj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCobUE2444242
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=; b=cCshpbo85Wv2QZuI
	NTN4+1+Kyw9hs9iBPlqLfuzc3r2iKHraIplqT4n0XQUj+5foLdfjio+NPfgAngnX
	I2BK+oz++APhQ01jwv4H4HbH9uiukhgETZCt6JlYkyRi/8YbKBpIXjIjx0IAJ3dV
	0x4p/vt9R5e4MNc8ifpbFEONWVRboHpdcylZCIZ7UvRWyBdUC5aDq/FuE5sGCxEq
	JKH2GaBHV8dzduhHuHqM5wLfOrd085KSe1vxBW5LWv3Ye20WUlyqxlSITifeCRP3
	H+gCaq9ggCWFxY+8wStOZW80TmL9BDZYsUL334koWKmtJhXKOYSOAueEVmjJ/jVT
	2dWtFA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsjpah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:04:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so1613233a91.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787321086; x=1787925886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=;
        b=Qh3p9Mvjh2EfxHU5owKXhMxYjFyzlmfMIm2d/KiMCZZ6dhyag7dSdbrNFDrUFycWoY
         yvOuP8UivuC+oDXSQj02hSAcGJIlmec6YSNwOKyFxJBGYWDX+8WL+ozMOsxLBuHuxpA7
         SUfRnhOtYJE99nf8+YVZEq6y6QCnxG6lViAG159Kb/MHWmwLdgArnidthPKlcaDYaEaq
         oqjmJ1f+cVxfojZb1SNxPnsnulcsYVnhAZfBh5bb9R57orA1MZShQ8aI7S2ZLrjitBg+
         ztsUk+God9IXMlM47dFjq6AZWmlWxmjGQjomEG5GaywGUOeO73SoY7tSRP57no1kSXyQ
         1uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321086; x=1787925886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=;
        b=HdR5VgyAly8pGoMZcAgpOEdjFcFfiLq+PGv2CtXZUebgrN1Fr4eEyBNrmySI/+xeF6
         ui1gJbf1Myn5JN6AHoIL0E7U28SAdSPmXYI9EMXyV3HUp0aejXuHLdqbkyB4X3x+eFm5
         jM6p6yNvmftA18NxAVF+xRCd7sqyqHVjR7vZna8muKjggdMH2k7+CdKJXlYOd1k8S9SL
         uL1WYEysQAk7fUkeH8LUwOsZetN5PRMinw0uzelM/uDjcnn6GWDR64QEFlZOuWZAZIzU
         mB2nZoOxIXjJRAIgAUfkUgDGaYhZSBpVCsx88Dq7a2mVbUIGniL0kSBTgEwVH3cfPB6Q
         E2oA==
X-Forwarded-Encrypted: i=1; AHgh+RpR1qyn34yHqbYbcOmI3nUSwyFDTadHnaoCh2+5bDx9RjOpfGUAOUw3lyot9Qv89Jtw0tUAXvthVglY@vger.kernel.org
X-Gm-Message-State: AFuF++mXGhnt+Xzr3KlO1tqYkel0OuKf7jQo+gSYxT2Xix1OBfA0AzfA
	Y2oZTBio7+5rqYFM1vAfOeOXKKp57+SSSg6t1wY3xFLnWxM4Dbwq0guk44QTNDj8JRXrnfR4KdQ
	5jhEyboOvO/M1InXCWiotxTQ8d8OwZtbsmQZW1HbQg5pR/yr3xcX9EspR+MLqF7cX
X-Gm-Gg: AR+sD10TnK94sYXRMgCHDK6bnXGgR2rMM6oDXFCXXXmHjdvo5FBX6s39znjQorGgPcf
	aCWbUT5qtxXseXCXF8XVGbLmWeBKf1TPyhrPJc4RLL1grVLIs2i26KwvUCjyyDcEE5YyaOfUO1e
	nI/+ynycrSa8ZDHwpiy/fJtKysbXLM0bsPTow3tgI60Fm5cKOxi+WMfAjrzQhTayUDKlM/ohLyv
	6nhOF6AK2wBoc1D6QxxF7ig6eoGGbdPlLKbZrp/j7NUwlSveHKvdWcnxmc34FqhoVwvl0IBkSNZ
	LV3745FYnErfx2CABH/QdgZ+8oVl1AzJWnyPXcMVhvp0Fssd2SF6s1WkkAAJHpYoI/r81hIyR3U
	qjBfoafrbzkEQTOoi4p8KqyNxc+pi
X-Received: by 2002:a17:90b:3149:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-395c33ec565mr11897743a91.4.1787321086124;
        Fri, 21 Aug 2026 07:04:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3149:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-395c33ec565mr11897634a91.4.1787321085588;
        Fri, 21 Aug 2026 07:04:45 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c45530absm3331680a91.4.2026.08.21.07.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:04:45 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 19:34:32 +0530
Subject: [PATCH v2 2/3] usb: typec: ucsi: ccg: Add support for
 cypd6129/cypd6229
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-shikra-usb-dt-v7-apply-v2-2-628885fc1d0e@oss.qualcomm.com>
References: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: mYjUaWI_cgDWcTmYOeLc1jbiwF4wvBQl
X-Proofpoint-GUID: mYjUaWI_cgDWcTmYOeLc1jbiwF4wvBQl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfX/92vu96ODISf
 QSy7dEeU/rHf68Zt/xOJ4E97suvXPjiTzGKFVnd7cKvuVX3bTLYCDvIgMFyNK3Q0dRjB7SRzQAQ
 nWp36rndPk5FISFOnMHHx0rCgNkClN0=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a885afe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5ttfkXOUkHmYICtgt44A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfX1MsHIPCDiq9i
 yNcZAuO+NO/zR90DwLUv730MiSvv3l0K86kvxtjwouyQwTP0y8H9GlDH5qe0P2/nIAEqaeFpyCX
 EnFz/OI6CM5+V/5vqOgKZo+9ET+RFdIHjNl9wL4qLOIu3uauRyRx8K1tQXHgS+b34zg1uiHS8sg
 qHpM9Xf3PqkB9VUVbgnT+4OGL97tv9II7Eavwe+1tMQ4ISiUoPtQAPy2P/CEKGB98DWkftDDvd6
 5p/pBVHdjAg9esXjKCfX3CWaWJok3Ld0K7sJahiXLcrpdX5cY50xELsMRRv/YThxkrZamoX1Hv1
 2yoNMMENhTz8vu0maIV3HmvGrgSv+wLSYM333K/gALjX/YWvbOKwE9CdiWTCRpaTq6qSJ723+B0
 o3hvt9fAY+XpC5bOnrC9fK0567+Z9G2YRrr7rH7LEqCMIUbj0YNt6ejCLtTLjb5aofyI8dk2aAF
 OXlfWjU9g3oGAtUuVeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210108

Add cypd6129 and cypd6229 compatible strings to the of_device_id
match table so the driver binds to boards describing these Cypress
PD controllers in their device tree. No other driver changes are
needed since the chip is accessed through the same generic UCSI/HPI
I2C register protocol as the existing cypd4226 support.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index d46ca942026e..37b96d662e59 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1527,6 +1527,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);

-- 
2.43.0

