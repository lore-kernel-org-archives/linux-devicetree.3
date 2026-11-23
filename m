Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430920;
	b=XHa6H67SfGHsfYAnTHV65/CkL4XPQJqF2VTXLhfy0TKoz4nhw3Ck6ra5bCG8Dx58pqcI
	 hO25QYcGrI2j/n672kgltO5zVkukWdO3YkFUMuRVy/FZO3D0R8JwsYP04ek5ozKApxRr0
	 hmdef2wA4/BtmHTyQFhjZcZpUwOOXFTGL/U2oogFGkj8dJM54eRvvN2dofn6ADxx0IOXj
	 GUtIGfMprdes6ONR0BU7V06Ionlu0nfnKrhXsXQHGZCAL64po+M6QSGLqGHDhaH6FPH43
	 MLDx1XaLjnQPx09963T1DGvIxPz2qm8yRwRYumrbPXdgUJKtE1ls2e81gxwQ69E0R0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
	b=pSxfI+nzRupyQujRrGkCjbCcb4ezKx57oYojq0e/+mi1wnO4/t6G6aJXegA696YfgxXj
	 qJZASawEu5TjCgCkQ8u2s1sHmkrVrX9h5vV/51yScxtn392YMkyiS1LPrHnUfXF8SIlyE
	 PIal0GMa2yNvMOeryI3UI6KAPDZggqHY7GBLpMTc1Oft/CW1uPAZpXxdDQyCBAhU1BC+L
	 WB3UPRRuff5jNqfIFjrUBgZaQ6oT4HtF/iX+DLiyCBGF+J9FoVYdrSIHNCExJXpBEXCxT
	 s0iDoM46LsVkGqBrLd6m0HJvbGVTz/Z+CVB+3eFHlq9+ApdYTcAk+IWVLNI1uNSMpQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aixyfQAA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IisZDukj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19BC606A6AB
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19BC606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aixyfQAA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IisZDukj
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G7AJ4095711
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9DuQUkmVsC2
	nbsYQKE93igh6iDE3a7mvoD13FupPHR0=; b=aixyfQAAzTnHzCSpYwJUdInAifh
	b2IADcOH3PSgNZSUx7AasPdz54I6rkfwVfngJTrXwqFyaDqOboApeP9SDebMpPL1
	XxTQBmWkh0UR72NQxnER+Yt4ACfDMZ8Mft9qfMxRcyS69lBXiYWrwzNRSO3RamZs
	F2ndQoYFG36HjOqV1q60IbOz6W/BjN/peiesUUhbA9VGd+8E5hYUvxEzM9u8utUo
	oVOcDX/SjuGB3boCD3zvpFIFxypBbvtHtKAISIMVvn7SJvYnOacY60FAh+r7Dmi8
	uuHbsm1jIdTpt0mEbCkLfNeipz7kvaRgO8qgOlxdWFwe4RR0t+AxSFajrJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7410mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb90a6230cso1498967a12.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430918; x=1796035718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
        b=IisZDukjgMdkwfp86ri11ABle3ubHCz3FAZ3ADC20Hm9v8onFzDT+xBveZqHy1RKwS
         51+9wVTm5WZdcwHU2+YTpT0PkyA6g54jHM3rj60plaFeHaLOeg4+yJvHCGrzTNOqkyDB
         PU1gTqizZYD8P/RtDhF69ZFBhtJA1Nd5M+w7wH9RLUEQHho9ESsDPxLgiesmzsm2N4B7
         inlGQurb6NSaOq3ufVlLQFd7puA5VWNtVAjIdb4ApkF2ykIFgd9lUTYDi52DVk5nHZWo
         cM72XS9iP1zO+Z3ph/1Xk5qYY5/zcVDilIYxyr5fzuhQQ3OiH9UE7usoyYalExnwEzjQ
         JExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430918; x=1796035718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9DuQUkmVsC2nbsYQKE93igh6iDE3a7mvoD13FupPHR0=;
        b=NNP5+qzWufmetqM0Gbvne2ewl/io4RCL2jmIw20ohyaI5D8juDYLoeFTRTEzu7zLRs
         q61MC6fV7rWv1EC/7Mn3LcEKETyAHRxP0EiNxfA4sYhY7VZ/WC6kQKLT1pX/aBhfEauj
         LCvsOFxcgDzSqbo1WD3ILcH8RndR701fBCJis7jHObHopNpEknCpUuR50v40iCtfTNCx
         0LmQt2i/qGP070k0/1PL8axLY8vLMLIrPo2EFqInyAavYHE3EoBZ2z/hp1iz6SZ4kvHP
         mbQZ1JUmsfd+iwjAZrHWxkXIpFWXZLd/WfvfdvkWXeeZ4dzPesX8WGxBO6YghgvY6d2j
         mHXQ==
X-Forwarded-Encrypted: i=1; AL+hErGGSF618wKWtDlU18LcThaf6//spaozt7BDJvROhyAtvurnbBk0Rp0nX6OrHPwwkqQDJqwo9xRV0rbi@vger.kernel.org
X-Gm-Message-State: APuU4Z8DQdoTZJ8Y7qPBFjuTgm6s+ktKkT9A+uJNuigy5RNG8m9yfVJf
	Ppi7oARre5XcKgHB3uwFn8c1yjH9sG2/G50h/xmozXVLXA2QaRuckjsUUe2PuagyDg/6ctylCQa
	tc5OFiWdsAztNjC9mH3ZV87luX4XYaNUpgFtC1rS8gs9KKXsvInTsVbXpzIAMjA1b
X-Gm-Gg: AZFdTZdrae1rLI1O3g+CzoQkXEAYmbrqxIdjBhXYB2zSkxx/NDX8XH8H2oie9lsoJcL
	7NTUfv046iBd6Qd/2t+eDWzxiKmYDwrZRqNTS2CPIPK8J25rMnGodAYl2yUZL9dfg1EIvzY4Ju4
	dTMyDbwi9AgWFEfWZPFPHqVrBjltNeAZGwAkN4JgnISp1HdstYA4QXICYJmbH8YLdE0dMw6dDbb
	ZbrUn+GkaNi1iIs+3GGakNoDaWMzr2W3Fp7l5xlzF5kVCv7YRRL6T/RmIH2+v9YoG95GNURjCa5
	hefqj+Laj0zIdbOKcQUzncLkt9xMY8CUGYxSlgvJDPKccp+IneW9M7R7F1sL5W5WEGGUmjXerz1
	FgtRmCGgX6Rrk+jQpv5DW2lPr1q39Yjc2LF/cxOqKPzponAVsFoYNnepPCtJQlM+ZavznbOQKqY
	Iz03NTjw==
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr9462415637.63.1795430917719;
        Mon, 23 Nov 2026 02:48:37 -0800 (PST)
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr9462402637.63.1795430917261;
        Mon, 23 Nov 2026 02:48:37 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:36 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe for default peripheral role
Date: Mon, 23 Nov 2026 16:17:26 +0530
Message-Id: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: Inw-JTaNocnp5dEqJdaYejhG6E1CRUc_
X-Proofpoint-ORIG-GUID: Inw-JTaNocnp5dEqJdaYejhG6E1CRUc_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX+XXUpf4g+5HD
 q0HIwgrxnMSPhi/KdBjKWuo3mO3EM/GMI25z1gkBXZT17NIi7ncOx299cqXpBNZ0hu/6oOC5SN5
 xgjkMcuq5t3aBb9w4fmxt9JIH5cOOWk=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b041a06 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6vjEpHyq_EskaYpSVAcA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX0l/N0wI3Ma6y
 nHQ1dX+iJzreuGBEkuDNbxrevbD/006l7ynQ/SSrOTNlxWXP11Ja/D37oGzPSPAzK+hpIinGAb0
 xzABYr3x4kGc1O6oJWpSzbF5vKp44qfDFDorIGVBgaHaIEZbg9rpPvfwteeRwVNhGb9Sjm5IL0o
 Gjzt6wy+JmjM61sLT2/S9RApCl0rdJ6d52h6o5wHrB9OkGacVmyYjA0sWhQkm9Aib0P+9yzIjRn
 XufP7LpH3Plh+5CqX6BBYJIjkzoQKWpVQ5HTYlYRZTU9tQPGKWthbPb7EtsAYHIwYAwKcyFs33q
 H7MZPaW5uZ60MOBABn5jBS2Ed5dJUY0u9yqpZVXFMgQ9G3tSubOmyYTigAmMqSaXLjiYpMCkcce
 2cHkWoGv7CduKEkj18ikmxODodZ+L+RfGqHwEO1iEtn60KzmcYowJ/oJ1Y7VafWVpnQHXs1nI0Q
 QotCVvcHj3ttQ4vXdwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

When the controller is in OTG mode with usb-role-switch and
role-switch-default-mode set to peripheral, the role notifier never sees
a transition at probe, so the QSCRATCH VBUS override is not programmed
and the device never gets a session-valid indication.

Enable the VBUS override once at probe, after the initial role has been
determined, whenever that role is USB_ROLE_DEVICE. This also covers the
dr_mode = "peripheral" case, which previously programmed the override on
its own.

Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
suspend/resume iterations completed with no failures.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 559de5172e61..22b6c7ca0297 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		qcom->current_role = USB_ROLE_HOST;
 	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
 		qcom->current_role = USB_ROLE_DEVICE;
-		dwc3_qcom_vbus_override_enable(qcom, true);
 	} else {
 		if ((device_property_read_bool(dev, "usb-role-switch")) &&
 		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
@@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 			qcom->current_role = USB_ROLE_DEVICE;
 	}
 
+	/* Force the VBUS valid indication to the PHYs in device mode */
+	if (qcom->current_role == USB_ROLE_DEVICE)
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
 
 	qcom->dwc.dev = dev;
-- 
2.34.1

