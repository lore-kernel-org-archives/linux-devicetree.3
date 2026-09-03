Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0DF4EBACA
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449946; cv=none; b=unymFNJiE83Rn4GgMmLN3HTuHgj6miwRiHp+bTcNGp80LLsSrl2c5SpBNorZWhFTe4YIOdFDdHcQnxyuVDRddM+cQ/c2FtYD9K1JtP/sfjKBx+9SysCWvbdPHkI3jmYFzOY2j44ICI5DfxtXt5r27Oo7eHzScal3bMroU8k8q1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449946; c=relaxed/simple;
	bh=mst0BKwNQI5xzsAgPU0b63vSk4pLGpAaOz+r5wcrQHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H51f/5lYPeLjSJXud6LhViwHMBJN8P73HZf0w5+1YEGRrTTnGMyl+gtU7I2OseqGK0klSoRgrmDNW5522K0CdLK4HknBGiHt6SaqGPynrvBu9P60pqaGui28qtGc0rQZxA1zmXukj6OwIpKZuUJ5NZFIxDsEyp1Wds9pd9sAS9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKu1Kj8h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhY5x19W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKu1Kj8h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhY5x19W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DALVS539077
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 15:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h63WXqFvCbF
	y3gKLgyxNvCWEvPKYpY2mQIKN7hO7nws=; b=cKu1Kj8hW6VbYnqRIufNTYuaAj5
	pCFmfEMHXoUljJlOc38xxTGDhXwL5sIEQJJnmzlCXLyfegABjH98HPWawQhrDl/Z
	3F9VZjCzu03Rqt+vFMUrkDiJ4t6hAfHwQ/sIF/eTNOZ35rS0lC7u6zmrNNb9QLcH
	08trlMbGPvCpBhP8ipa7pFbdYzjSaJjrctNotK7bNP+9KXDYx+njuaT/UoLUGMbl
	UM62QqtzCR+FNi9/9i0JtqHLk01dcFEgBe5IhSG8qZXt7iKFUbq3Wi+8QXUWkW7F
	LljxuGOpj4ydM3+dLQ0y23LeRWo8NYEhz4HZnvZTAnQQsDN7QYuqNCLXrDA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx1cyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:39:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc39363cc88so61577a12.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449942; x=1789054742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h63WXqFvCbFy3gKLgyxNvCWEvPKYpY2mQIKN7hO7nws=;
        b=fhY5x19WcYuT9lbgwCDUAECybbd8xdLmiNUhqXlwFQtMmg4JziZZJUmWBXwj2Wuiq5
         R+LjI8oBw5O4+dejuu1/NoXoisd5lB7MfgU52b3mxvhIGPp7ljFqCIbMN89V4O0ftVO4
         31IvX0m9UAPA6BsiLOxC1flrR/CZIk+nkKWfcVNOINtllMnIcb23JEvl5p6qEFD57rwB
         2n2+z1ufpQ3M5k7FlqFrmb9KLvDYlizrRKlgtL5VhPK67VI9HhDsOZxIu0/QKcqCfjdf
         uLqzgj23cixYRE7JwlMy8EBxDMT8gYjzi0Ihga4OiYaPoZnitwsjBWuEBaG6bOTElsb8
         M3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449942; x=1789054742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h63WXqFvCbFy3gKLgyxNvCWEvPKYpY2mQIKN7hO7nws=;
        b=Yn9fzGmqpgxXoe8CpdV+CrvleW2fsHG5BQ02FP9osLLpF4sddewO2yRfiyGAm+UIGA
         sNmzNm6mFwJ48YEp/Nm5EwlPPveSEIrqvxR/ObGDMWpWF5YDPL1nS+xhnrDcSA7vAWdQ
         nxv3uvLF1qQBG1sGxfI3QYDGCkgWudTRZ1AiHZWYE/lHG0jwNRdn8wNNl+b0JJfqJUhg
         l8YYfAYvJc6z5MQMILpT4odfzL9mWJHjlGL9BgQh2yx+u8jCJ/WvWPTXNhYSt+CdpDaa
         ws+7yLsb9DIxV+GcU9kGOhkNSog9tBsyNQrWOhzsogKyEo7ljdlj9AK/NrLzRdJMcr8T
         M4bg==
X-Forwarded-Encrypted: i=1; AKwUvBzS/FRGrvioacbqG1vmVIU+h5pP2sQ8SUnxBUWHqnPjbDYKzi1c/WpcjDGwfp5T+VOkMAzhginqwoYy@vger.kernel.org
X-Gm-Message-State: AFuF++n9/sJc3PUDHsafjVDYkUwqqD55WZJk7J2548YqRQK90mnKnH4S
	kBy6QIc+fyXERCzb2J7B2GX6Jf8YkE/1ZD7S93qE3pJYblX/rjsURYXUPN9aTYJNlkqdv93P1ma
	7iDUfOgXlM1ZUSot/Bxqbwx0b2U7FmllQIy44Q4o35+w78kCxS+VMHKydqBWetKLf
X-Gm-Gg: AYBFou20pXb3JLuWItD15s4hT+JOmYQPxx+Urwt107lLx/0RASsoPwxFITlYTG9mbC8
	Qk1L4QGnOVuZnFpljLNP2RaCAQLtyX5uzrWf2ksfulRy1NcLZ1HE/kMSIH0WNrcNqMAkbML+Mdm
	iPWYuKwGZXFmC5feIP7/8jvrNquAmbYvY+eOQ41x0QKT3yaZHQEclWEI80X1XN1hiv5RRCtQuG0
	1GSDhBlzZZubdELvYwlFIvyZ0Tg/QoJiqluQPPa3AClV3YBNA3eDv03+SNR8bLkY0gqv2vQXW+g
	siQcMzqUDNwzuRUnTC7wUO9zvkp0ovFh4nXLKVou38/pDA5Hh7ezU9eAoTIUCvtG/vqTvK3fKnU
	RF8THgUt0Iew0v3eNhgK/3nShcSI88VC1
X-Received: by 2002:a05:6a00:8e02:b0:857:727c:a1f1 with SMTP id d2e1a72fcca58-8613fc1f0a5mr1326536b3a.19.1788449941838;
        Thu, 03 Sep 2026 08:39:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:8e02:b0:857:727c:a1f1 with SMTP id d2e1a72fcca58-8613fc1f0a5mr1326448b3a.19.1788449941199;
        Thu, 03 Sep 2026 08:39:01 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:39:00 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for power-loss resume
Date: Thu,  3 Sep 2026 21:08:25 +0530
Message-Id: <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FbxIi4Fs5LJL1N3YZeccXPjMi2G2wzA4
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a999497 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7YzMA-XWCf9gdZAyNeMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: FbxIi4Fs5LJL1N3YZeccXPjMi2G2wzA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfXy3lX06wRogEz
 OmDdTR3HlDbeYiqg2WqnzsS/4QPEo9JJsPbI+zt4gfI8ng2irMMIgQdRQxaIeOWJ+6dRyStY6f1
 I3BQ/nQm6GplIUqP7uMG9IkcutrYSkmiQhgQpnXyZmpWuuseuJJT6ug4gnCfTzuVjdQZp1QjTtr
 RX/n/bDRhbv+WIIvcq5EumpSR9mbbFQ23Xy4is0syvwhFbIV8DiyhR8lGLdh5jUfF0PofGYxK8G
 3pYT5mxAl6kwFJPOTspBrqXMzFALQCdb0OAlkbEQGAlq2rRNIG1aOMAog7BP+QVPGS/xGFEuZUH
 u413vJgUfxIa+WB/ydeaJOQ6xxLbSooXciT7ae1UuOZpjEu9f1fZrRWTZlESw2lnYXHarrVz+xa
 4TRfVLdYW+WlKjMXqjwGo86FFmdSYy+eil8upyPY8TSQQeKxQz5EI2NWcdrf/D1hvUcn5tRzfdh
 7mFCGG4H8zqihOFKGgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX/5SAG4hYgL3V
 51JlcvCeW8bABauXyQdPQvDhaGMemDO2gAtGFxlgJaZD5k0YNUsreoinN+wcClIKHQWeDSGU3nt
 A843xVBzUJyi9eS72+TvZP40DqQh6UE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

On platforms where the USB controller loses power during system
suspend, like SA8255P, resume triggers a Host Controller Error
requiring full reinitialization.

The xhci driver supports XHCI_RESET_ON_RESUME to handle this,
but dwc3 previously lacked platform-specific quirk configuration.
Add a device property "xhci-reset-on-resume" that enables this
quirk for controllers needing complete reinitialization after
power loss during suspend.

Let dwc3 manage the quirk for the usb controller using
software properties.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 4 ++++
 drivers/usb/dwc3/core.h | 5 +++++
 drivers/usb/dwc3/host.c | 5 ++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..eb6ffd5148a7 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1712,6 +1712,10 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 					       &gsbuscfg0_reqinfo);
 		if (!ret)
 			dwc->gsbuscfg0_reqinfo = gsbuscfg0_reqinfo;
+
+		if (!dwc->xhci_reset_on_resume &&
+		    device_property_read_bool(tmpdev, "xhci-reset-on-resume"))
+			dwc->xhci_reset_on_resume = true;
 	}
 }
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..0ff23eb217bc 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1172,6 +1172,10 @@ struct dwc3_glue_ops {
  * @suspended: set to track suspend event due to U3/L2.
  * @susphy_state: state of DWC3_GUSB2PHYCFG_SUSPHY + DWC3_GUSB3PIPECTL_SUSPHY
  *		  before PM suspend.
+ * @xhci_reset_on_resume: Enable XHCI_RESET_ON_RESUME quirk for the xHCI
+ *			  host controller. Set to true for platforms where
+ *			  the USB controller loses power during system suspend,
+ *			  requiring complete reinitialization on resume.
  * @imod_interval: set the interrupt moderation interval in 250ns
  *			increments or 0 to disable.
  * @max_cfg_eps: current max number of IN eps used across all USB configs.
@@ -1420,6 +1424,7 @@ struct dwc3 {
 	unsigned		wakeup_configured:1;
 	unsigned		suspended:1;
 	unsigned		susphy_state:1;
+	unsigned		xhci_reset_on_resume:1;
 
 	u16			imod_interval;
 
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 96b588bd08cd..2170fcafc889 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -129,7 +129,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[6];
+	struct property_entry	props[7];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -173,6 +173,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->usb2_lpm_disable)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
 
+	if (dwc->xhci_reset_on_resume)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-reset-on-resume-quirk");
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.
-- 
2.34.1

