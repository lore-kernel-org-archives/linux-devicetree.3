Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430910;
	b=t0U+U/HiY8XY2DSgtyywsfTyJM/z6TO7PPZpvgnW6grAaVkEV1Lyyic5aIP2yL+yKobt
	 vRy/NYAT8ceauqUmJ4dEV5psULYDx4a9XUW35hs5PosS66uywqwvsEJBWF3zKkhy0yA8+
	 Mg1OdtTUC7v512C/8pFb8xopKO193Qf95vGGwcOP9qpOA05vpE+tgXQPL2GaC2HAGqj8/
	 tD+tTOgwY0YZ/b5pjcgyUr/nSOYsupS6TjAkPRwnLeTBfgHnkVcK5kGsAyKzG8hJOsn+t
	 An/q4AHpwWiSp8u/EHzsG/mR1KGzvFamPfKolGSz0rxNi2ceTbfRkwX/ndSOa7t5fTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
	b=AXYfUuFhDVwKyV7/U+ORuZyVyot5ZRSCuMGFlpsvTXOicVEp+06mAd6A1MsG7DnSstbe
	 wZzc/WR4jcbXE0ZIUj1JZc2ZRGbppLfX4DAILrQmo4kX2NHRjqof6ueyM4Ef6X1EjTjzO
	 CVAJbImPkcFXJQ71bCiyGiSXUAZRldmWbNenoTORIxr4nDFq/ZcNyZ+/qUcAKy1U54aPK
	 2nMgLtPN8p1uvD9MuSJ4AGWpf0ghkIayOLyh6gt5zKQn2E5bcqrA1cCs2aTXFyw5Bv0Ft
	 ZTyf9NibOZflLbWzBiQS7NwGrGaasMcX7gdqVwHnH0pSjitbhjvtOKizATSYTcZN34w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ng0D3ywK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdFiXysp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6155606A33D
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6155606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ng0D3ywK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdFiXysp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fsrm1543936
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AxA3UDwrCLZ
	0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=; b=ng0D3ywKkLAAHR6Aox7XLN7nmk8
	Bu1oLsf6n6N/Wgma9fJOyBWpRo8paRypnY9dTERefkI15/tPzJGOUemNzw63GG9b
	D0bkhnP/qKymg/iej1DeAZYxVfTJsFGJPIvGK0NSugljDjjvLkwvilS+fORTaUSJ
	WdV+7XJtez92Bq5Rn4qJCFGUO3XiJ7ndfuITQVpRalCjV7bn95Cfe1H7Om8i7TUI
	caMg/sHXfG68SPPH4YEdJDNTUzOg1Ouq3VPBkGu9ZiV8dmUVQ3siJa5HADQYiqKK
	5fnE+2ZkPJEsXzHK0nLk3ccIZfzwsMUsN1+eIHO8b1z1eWz3lJHYeBJOEoA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy011q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:48:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b852fdd55aso3573604b3a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430908; x=1796035708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
        b=bdFiXyspaspYoUarUwQXLCyZEiW6uuH3wWijc4CfHakGn7mURPUmwykQPArC5U3IUh
         B3iDdX0r8qSwlNd0btSHI2Lmo4O9kfv/7iKvJds8FyYNGl0PRkaRWtzSbcjZk2gH0ioB
         Vm16JqW/W4F4VTQ8f1HOhDrurqDSJ5/ZEmPfvMaATvxUdnoPscBEqon9RH30+RemRRUd
         QQpx/BlXbSEe8WVOp5yCN1XLA8skfKp/N/HIpZMcymFvTpprCUHkM9ziRJPxfJ5r9cpX
         b+LiANTyv6QL1kqVHbFw5MB4il3TKXww1yrCTyPOqsPet5YIGkGZGA10zRRPRHQvlwUf
         rvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430908; x=1796035708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxA3UDwrCLZ0UoGL5laAO3ydVWCTpmg79oZ19pW+sSM=;
        b=DCAiz4EMS5731aBVJ6xiVFtXsc0vcwgykdV2GV39cZ1oMuEN0famkK3AY/WdD3Ioh4
         LdNvakr3kTEz+akA833KgXDdPlpB0parTCHSzFG8zSVrQu/VKvQqvxnF/AhcGgDbLJqO
         xS4xgpjajttZ86hEUeh0ZOs2G5hfJ7sGoWxri9sF9dqBf4b3T22mP6tGbRWDD7g8XwSS
         anM/GDtsT57n2Jim4pCpvI4LR1xVx3GtEQlBNSQgHrSl5DfVNYLIm+SQUF8AXL8OhiII
         pYuCqfR6txYZI/feMvWmZ5Hrsi7fc2ECr/ZQVMQY9nU6ea9830xBxdDVdVnHh5JkNTpu
         aumA==
X-Forwarded-Encrypted: i=1; AL+hErF/4yvT0k+8tfli96oGejbqhLJFzizaC2k3TjPZVN15DBcDdFmaU+XHMe+mmJ0EL014BexhI/o7xxWV@vger.kernel.org
X-Gm-Message-State: APuU4Z91vf6AH9HhvJQCX1RwRQUPv7AxbGrVsABhQUyjNdZ6Y85A6AQP
	+Ll/T+RZ3LXXrjy7PRUyMkyvZhEhlNi5KOLAz65l0deowNa0sMe0joA0eZ72vPpVFEIMIek95FX
	t3SVv/cnox0c6ChtG/gvaVo7KNnCfKq7+KQ+fp+AyHpmI6Jxy5yraitC9T0OLo1bx
X-Gm-Gg: AZFdTZfKjJsN59bDnS/VZgvyvvnN3eaWgc4VBMda4mZNot9dAZufIc28iMJSUDZrlD4
	EgAmnoeDq41gyP3RwLSYIuspHF+QNtwTIzjEImqqmGVLWFTrNwxkdidp4xEKTPsalGLbp+3Od3y
	nghScIDiiN/tYRztyV33cDwsvZpyKDnuhX2LHpM7ixY4RlmkIU7sIkkp/BOy3FzZQ72baRb16J3
	v8asjF+k5O9e0lzZ4WWJsTZxdeBGKFvBvMk58mDcVkIXuUBOFQymgHv1A6KFLcgcP9CmAnxv/Rr
	WuBSCyNsnfBdMbz2b8n+PNvn7ETybybfXXl1xKWY0sYKjHT34dX7V2r/X+9WVbhLMRUJbWc+EFr
	zSk0Pzy0iZsiXibr1d3UGne6vqwr7ayFhLhIm7R1UIu9lVfP6uNnas9MQQkIMPIKSkqfLmy2r21
	U597ySGw==
X-Received: by 2002:a05:6a00:1255:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8c87c291f79mr9890477b3a.31.1795430907637;
        Mon, 23 Nov 2026 02:48:27 -0800 (PST)
X-Received: by 2002:a05:6a00:1255:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8c87c291f79mr9890454b3a.31.1795430907176;
        Mon, 23 Nov 2026 02:48:27 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:26 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 09/11] usb: dwc3: qcom: Assert controller reset on remove and probe failure
Date: Mon, 23 Nov 2026 16:17:24 +0530
Message-Id: <20261123104727.1539149-10-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXxgVCZyTlwRV/
 +A6XnRuFIUUOBJ3XmrkMsoZb2HTk4b3USX6eq2MQVjfB+UxtNv4bd2P9bqm//ueCOUjSO8Y68Tt
 4B/9SqOV37RQALh/vaaz5BElxd4nGVNMI6xjpDN7RXSi2NPVgzqNfS/8afDnYgMJhRdT21THDNM
 SRZ75U5mKb0/xADmArN9MxTK+q06gUGzCh4KWfGyRLmj1F6Hbp9d2oohYL3QHhtXNaukjKwQxWp
 9/5bSO18pZnbIQ0VVA6qDGdJWpANlS59PYr9DQZgjDQJMCyKHSL3MKLq206amQ89TExWfO/Ljt1
 yd766hND5vfZmOIexHeCHVJkgkcywkclS75lsNO0oQXBU5md5UbjY5vg9bmRbVEDM7YgRZ20dNH
 lUG1o4xDYq+NwIH0jqOTqP5YDL59vQvdY3oSCPBrqYf4/dx20/OIG6svmNyTGzonXbJCORgoFIR
 smtwG4qm+gdH4AEpuIw==
X-Proofpoint-ORIG-GUID: NwUwTSFicvPF_vprqG4pxAOzCkMgZ3My
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0419fc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SipdNjeEsZ0rhQ0KXr4A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: NwUwTSFicvPF_vprqG4pxAOzCkMgZ3My
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXz2l7BWKOCS1n
 AezfNaYB6mukAIjMe38sKw7pYM0HgDFYOOM1nv08icJjqvAnNIOOUa18z8MlIZ7gfXT5DXajOmU
 /W34amR41TydN3W0b90ovIEUIFlCtEk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

The controller is taken out of reset at probe, but nothing puts it back
into reset when the driver is removed or when probe fails after that
point. The controller is left running when its clocks are gated, and a
later bind starts from whatever state it was left in.

Assert the reset before disabling the clocks on remove and on the probe
error path, so the controller is held in reset while unused.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 50fca06c83d4..61a3e3c38f59 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -804,6 +804,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
+	reset_control_assert(qcom->resets);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	return ret;
@@ -818,6 +819,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 		return;
 
 	dwc3_core_remove(&qcom->dwc);
+	reset_control_assert(qcom->resets);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 	dwc3_qcom_interconnect_exit(qcom);
 
-- 
2.34.1

