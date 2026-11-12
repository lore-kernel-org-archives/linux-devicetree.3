Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523160;
	b=FiknhzFmpcOMwB6fVSdgwe4oEciUeNPN3YtOhPZoU6aINcm1+YaxHqm7zY5tq8HdjfWK
	 d9drbCBnXqzZkOUGFOcIdlU9GweFYu1kpsQfAAay2dcrcviG1SAX+NJzl2FyeN6okMZC8
	 HAvM8ZglC4vxKfo2q7uhksNh2/YeQpi0Twp/8gFuBR8EFC7y8zluJKyUOoNGr+4KPjuBg
	 dcshwvWWDmDUEbWTy8t8yteTIWwFbCo1eLfFdkQF4zAX0fqptOcGhIGsghncU16jNa2YQ
	 1JkFB5jDMW6TWp+7OA/K4wwDr6FjKahZHeKiJuy49qhU42HwunBhc9xGuVlTYX2zJmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523160;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sGGcy2KQT/yHVLFw/oNaZ5cTVhBQ4bGJXIg4frh5/9o=;
	b=IihZjkXFCOTA7ghn0S2ZqIzCqNq9G5gnYu3V7ZhXCDbGFvPw8bGWosyddJqnxXI6BOJR
	 PP+YBOlzPanP1WGc1ydtq5Fqvm+4ZSq6H2FUMAc8uMb/+M8Sk4uLwJel87eBypFo9R/Oj
	 ZVkvTnbr8nICSwTz4x5++J3vAyMvX6z6aIPRmW2LHhqxKhfixj1fWrocAnzOPd8yFg4vS
	 3P1UvHHjE2DdeyfBfdH2UFujRo4XM7+WaWRcTqXOVsrT5X1R1pJY3aLyYN4hig0h0dmEq
	 bjUUSBrXxCdzP/Spp3ox4msI3SvmxWwbdARlNXSdTvnbn930kbvbjC2s5kCNwPWqlCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lFdGgymK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TkFMentW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18B606A32D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC18B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lFdGgymK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TkFMentW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZioG537251
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGGcy2KQT/yHVLFw/oNaZ5cTVhBQ4bGJXIg4frh5/9o=; b=lFdGgymK7lNB1gPh
	AqCApXcN1v0eRiuoeCk8jkwYRPAMOH+R/tnOJkFWb2e4+GFm/Oop4e+gixzbAZTo
	cedgeE2GpVV82a93MUYgS2PQhqo9C1E7hfZybw/FnR6gIWsiR90PuJnoCcH7sWQW
	8yTlHJpzQwJWD5yVIwlGBXuRi/XinY9mn+c++FBTnnGP4NrUwAL86uuA98c+ZF+O
	HsfbKNALYAvIkHwHddd8BDY4Eiqm7HmZxtjTzDIZrwsUvfJxvyISVqkhI4TifYHE
	4NdxFdpEo0O8ALPBRq55+DCi/M9Yib8K4z2K8GNEnF1WNcpQYYGP/JIAWCTUwsY0
	XvQvXQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1b9gx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b63b9665so67442c88.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523158; x=1795127958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGGcy2KQT/yHVLFw/oNaZ5cTVhBQ4bGJXIg4frh5/9o=;
        b=TkFMentWElLK0LJH5w9orkjubExaybeGzMhto7e6iFW4iF751KLUlR5ufm3JUbACNG
         Khn2QUbFUV595/I91Ax/ftCm3s6QWqn5olnthw49JSL1ApBGCOfvkVwjaS2bNcp1MacN
         CNlyfZZsCIrcKg2/XC3f57V/NzobSFo7Sxk49bAFHo8WK6QZ37GlKG96AwSWNL5Y8zp3
         hGwTqHx6vQaE86snsqgnqJPzNCvi3G73c0B25bx2PCEXAUTZeX1J+K6xSjWMmMkhfMQg
         DmckrYWIDTqvRw2hJ1S14TNLJ9dN4xyH6WDW9ooKhKRVuZ/pIY2B93/OCRluBRkK5+/v
         3Yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523158; x=1795127958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGGcy2KQT/yHVLFw/oNaZ5cTVhBQ4bGJXIg4frh5/9o=;
        b=ggR96XpLgryE7im/CZaS5GWFF/ndt3mkFyx/6Nv8BY/dAO9viaXKXM76+MlkVpDIge
         Nj5ov4HcVsFIsBZnG8O81lYHuy2dADx2fepb80cRMmEtSxLmX4B6Y565UasWbTRBbD1p
         XWdaaFYTv/rYpYcMqgVcpLc9IkLT6yw9Szx7+Fr/xUV4KKjsHXoInH/00lT7APr1yXu3
         uv+r1Wb9n3yN7buSpAHabz/4o0zMvr/CSTkmDNqj+V62Sv/A3V1jd4lRPtD4rWOoXlB6
         3rURRdpW9kaCRO5cDU2RuKl4iNFLbqcVnlhSSb3Z2wg7Ex8DVSwNzfY9Lxsv5ZSqOwAu
         EWyA==
X-Forwarded-Encrypted: i=1; AL+hErEJ7vlWIWBTCgbRBqlLKklxwPDb7iyN/akkozTmWD3wnxHSx/xAvlqx1w7fsnPdbx6CwppV3ZhVrZX3@vger.kernel.org
X-Gm-Message-State: APuU4Z+uH2XbEwQU8WcngKJ+nVclTn/czb7d1+Q4CefnPREAuzBgJVjo
	egWiXzeoL5jtzJ2wPW5vDcepE5MR2eQq+ktWKKy8oeQCiUXZ/GTMnaLQyBkCWs0DyKthRzkJB/j
	8xyon6Z23JwO9CGykWcjVT7EGudjZBVVo04nlVFGbVYYMzcmi8pxBe/7/SxodOjae
X-Gm-Gg: AYBFou0qRkMXAtXwQeA510oF9IkD8UJ2bWwA746a0LOoxCF+FdItZUI8P0mLCFcaXmS
	EZWYpvyHSG7TxU0X12GPzxh7vH+5IGCC89GoicCUmMGpwH4lnjxdxEIw7aWaCoTcDKEwdnn2H02
	eKQWbFtqGM1QKcjKcQeSTcaQBsrqCR+dWP0XzuckXoSo4xcHbMWfJ3vuP/MM2FZGppS5kEBOERt
	2O4dVKgXcercyK3+Pt2W5qnJH7Ydjhbdq6GviAQ9FUxhD4NwSaKnI04SmAUVnK3M2Da9qivMcmY
	vE/8aUfQ/b9SRqeMJe1Y86KnEb+fiMElfaSgWm2jUJ4R6eBxnAPF2iC2YsmmUP6a7oowXghWD5P
	9FCUBg7hxISG4NsvprCYCIhf0YPueP3dDG3o1xIMX2l7dchgfm+UWkDYs1Wb4JxlNDLG/PMRcBt
	cL6+gnWe3Deg==
X-Received: by 2002:a05:701b:240b:b0:1b2:6cba:7f88 with SMTP id a92af1059eb24-1b503169447mr760671c88.44.1794523158285;
        Thu, 12 Nov 2026 14:39:18 -0800 (PST)
X-Received: by 2002:a05:701b:240b:b0:1b2:6cba:7f88 with SMTP id a92af1059eb24-1b503169447mr760641c88.44.1794523157705;
        Thu, 12 Nov 2026 14:39:17 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:17 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:27 +0530
Subject: [PATCH v13 1/6] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-enable-ice-clock-scaling-v13-1-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af64017 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ncwwxt0CvNVXG9qWacgA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 5yjClOYhkK4BrsHJ7xwEfMeAu7FguI0Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX6lYe2ioD8tRV
 8JrNjpXG12JgYMAKhuPlHkbtI8ZUYog2YyxD1dbZiOjXivRQD7K0tAmlDGiZW9lCIPY+8I9nky8
 rPoVf1OR9IwheLB6CFb15q7Zxf9zBacftYv89V3e499Sjjq4Hl3BSqytsLo3wdAd46ojCMTxfZ4
 /ZGZOoRBjwtljkCXt+VMxw01kXXu9IYZWFV7cexIZX+3dtUNba3m0kLEYVg9SIxpKympubks7gU
 XiwddxvqNxgV6UDBtJ2688xILuZR3apib9XzvhDRecj+OBTVm5yYWr964ydPrVlnbkDdzl6B6Oh
 jND0lrzhpHclQE13d1UuRa5XohwZJILObJ2GPIu6zKbHrVWZSJUyDw8WPXstN/uKpU3k+h1cZYy
 My7XcQgXuf+HVwIGDZ94GjKsfKmrqf0/3pmo5mjRMJLos4nwwsaOGV4JXfSXxMLn+wENOUAlF14
 JEkLawenQH0H91LrreA==
X-Proofpoint-ORIG-GUID: 5yjClOYhkK4BrsHJ7xwEfMeAu7FguI0Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX/rDggp7TtQ86
 AbCfKxc2SD1p8i5+GqxV1+rutQK9b8fZYo8qgkeQhJ0993b5YW7HFllAk4/FiL5CIpeUY+YIow2
 Ojcw48fhNT/S/GTSNLHgwqpJzFEGrIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

Register optional operation-points-v2 table for ICE device
during device probe. Attach the OPP-table with only the ICE
core clock. Since, dtbinding is on a transition phase to include
iface clock and clock-names, attaching the opp-table to core clock
remains optional such that it does not cause probe failures.

Introduce clock scaling API qcom_ice_scale_clk which scale ICE
core clock based on the target frequency provided and if a valid
OPP-table is registered. Use round_ceil passed to decide on the
rounding of the clock freq against OPP-table. Clock scaling is
disabled when a valid OPP-table is not registered.

This ensures when an ICE-device specific OPP table is available,
use the PM OPP framework to manage frequency scaling and maintain
proper power-domain constraints.

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/qcom/ice.h |  2 ++
 2 files changed, 77 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index f9ac45505908fc175f87098e9807c4642c3df321..2259dbecb8b513ff9f2731a969e126118dfb9b1c 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -17,6 +17,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/xarray.h>
+#include <linux/pm_opp.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
 
@@ -113,6 +114,7 @@ struct qcom_ice {
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
+	bool has_opp;
 };
 
 static DEFINE_XARRAY(ice_handles);
@@ -560,6 +562,50 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 }
 EXPORT_SYMBOL_GPL(qcom_ice_import_key);
 
+/**
+ * qcom_ice_scale_clk() - Scale ICE clock for DVFS-aware operations
+ * @ice: ICE driver data
+ * @target_freq: requested frequency in Hz
+ * @round_ceil: when true, selects nearest freq >= @target_freq;
+ *              otherwise, selects nearest freq <= @target_freq
+ *
+ * Selects an OPP frequency based on @target_freq and the rounding direction
+ * specified by @round_ceil, then programs it using dev_pm_opp_set_rate(),
+ * including any voltage or power-domain transitions handled by the OPP
+ * framework.
+ *
+ * Return: 0 on success; -EOPNOTSUPP if no OPP table; or errno from
+ *         dev_pm_opp_set_rate()/OPP lookup.
+ */
+int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
+		       bool round_ceil)
+{
+	unsigned long ice_freq = target_freq;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	if (!ice->has_opp)
+		return -EOPNOTSUPP;
+
+	if (round_ceil)
+		opp = dev_pm_opp_find_freq_ceil(ice->dev, &ice_freq);
+	else
+		opp = dev_pm_opp_find_freq_floor(ice->dev, &ice_freq);
+
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	dev_pm_opp_put(opp);
+
+	ret = dev_pm_opp_set_rate(ice->dev, ice_freq);
+	if (ret) {
+		dev_err(ice->dev, "Unable to scale ICE clock rate\n");
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
+
 static struct qcom_ice *qcom_ice_create(struct device *dev,
 					void __iomem *base)
 {
@@ -738,6 +784,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
 	unsigned long phandle = pdev->dev.of_node->phandle;
 	struct qcom_ice *engine;
 	void __iomem *base;
+	int err;
 
 	guard(mutex)(&ice_mutex);
 
@@ -756,6 +803,34 @@ static int qcom_ice_probe(struct platform_device *pdev)
 		return PTR_ERR(engine);
 	}
 
+	err = devm_pm_opp_set_clkname(&pdev->dev, "core");
+	if (err && err != -ENOENT) {
+		dev_err(&pdev->dev, "Unable to set core clkname to OPP-table\n");
+		/* Store the error pointer for devm_of_qcom_ice_get() */
+		xa_store(&ice_handles, phandle, ERR_PTR(err), GFP_KERNEL);
+		return err;
+	}
+
+	/* OPP table is optional */
+	err = devm_pm_opp_of_add_table(&pdev->dev);
+	if (err && err != -ENODEV) {
+		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
+		/* Store the error pointer for devm_of_qcom_ice_get() */
+		xa_store(&ice_handles, phandle, ERR_PTR(err), GFP_KERNEL);
+		return err;
+	}
+
+	/*
+	 * The OPP table is optional. devm_pm_opp_of_add_table() returns
+	 * -ENODEV when no OPP table is present in DT, which is not treated
+	 * as an error. Therefore, track successful OPP registration only
+	 * when err is not -ENODEV.
+	 */
+	if (err == -ENODEV)
+		dev_dbg(&pdev->dev, "ICE OPP table is not registered, please update your DT\n");
+	else
+		engine->has_opp = true;
+
 	xa_store(&ice_handles, phandle, engine, GFP_KERNEL);
 
 	return 0;
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..4eb58a264d416e71228ed4b13e7f53c549261fdc 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -30,5 +30,7 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 			const u8 *raw_key, size_t raw_key_size,
 			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
+int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
+		       bool round_ceil);
 
 #endif /* __QCOM_ICE_H__ */

-- 
2.34.1

