Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213425;
	b=rVF6U4Sc8Tcfin94NBathh1iB/EBXBbGvZom/j39NAGHspTyeCIG4ASVQDR2RQ8aolsu
	 14tkZ5XFCRIDCGysE+y3H4OewCDg5tuWIM3yvMjUSCY5RVpb7/euCXU6xxK30/+ECPex8
	 0Z6PB3ZPG69e1mVCuGBGL14DTtRIR3pHmlwGo3qkATifpGQbt0IwI4omRUsGb7jBoYJYg
	 e6XTJ60AfzZSu8QC4YK+aWJOiNZBA87GOSJtSOjvVmEh1Utrw/utOyf9DxE8Qxm4btx+t
	 P43bGxZiY5YKf9obrTY386L3JtpfW3RnGZCsA5bQV5kWVFYffaXUnO1A5TJDVoZF0Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=;
	b=PfM1lI3F+uLVjD8pXilE5s1bMie35JFd/B+T8faVZTwZ30GzOCOq2HYBGg/pm7B2/ovQ
	 Rx1BAiott8F+G2Fyw6peMfNdOqEyeYQar/rYO0gjmtfva9zSjVVtpc17vhfIUp6dEPD4q
	 ugc6nryugKf3gdmYDgTU8tau9C7NXha00f4sDjPRp4G81sUBQvy04gXXF+eY4+afjKRgO
	 K13mm6UPzPRmKcQOn54FS3g+vSWs6RMYFiU+m3eIWDFzvjehIPEcA9ecrN7N+sgs04Sth
	 vWXy91E6iXbtXp1zdp5Q5mucBuTk0Mv5VzSafXV104Q804XggBIGxmERIPc8jWkfw7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnKMZmGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQqOh8sq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295F606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1295F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnKMZmGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQqOh8sq
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A3972668312
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=; b=lnKMZmGtCPDBiFDV
	O+2J3/bw25IP3lHVDXfZ+xEfGEQhOQfAE2kr9LyOa8YLzd+aKMP6uQKrpzHYdXDQ
	K+OhhRyt61g0L64vXr3sGCow2GbkPU0jGUekTLJSwhTwMMRCCdGepvV/LaLSPDDD
	VVujFEDpsPMVdVT0pb0YGUrTEknGGNFmTRE+HZyLoragy+4Cd5u6Y5ZoTnybjp6p
	Yxq0401Yo6/L1yap0VRCQzxQF2fbqOaK603Wv0Jt69VZHx/Fiy9G27uBvTgnLBu2
	/UrpqciPcTtr36VL3ZFADZVjLDwowhKDjVo08fBvXStABN8C3ZwWtshmRJVgWFsa
	XBqQYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99n8gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:37:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so58707885a.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213423; x=1794818223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=;
        b=dQqOh8sqsOjkWW2uSoXUxMqcj+Jwb0t+OR4h7QmDMWi3OElO9CmwVvZNcBY0zD8f6u
         iJUbcXzkqvrTg2Ic/DA20F3NHVU5U6x3kpyRFUo0YS7FZwCNNeNaEjOsqjdgJksv08zM
         u3PLVc3vg0/H2Z6Bx/Q795EujwASItEH9YthlP/3i4p2J0tyVSrv8+wnfa+vKMlsxdOM
         wd1ph9P1vV7+HuelOCYkCIfzE+DD7w41vhsj+/HKh4VLYsb+GpVg+HInxxL1nvuGvQDB
         5/MOTzTuWVxnFLxzaUC4dZ4U7n2Ell7gkWMg1a2EcVQ/5YLRCirT926HtEfXZ3aQ7pD6
         QQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213423; x=1794818223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=;
        b=oW7VuMI7oHZTj0rdGmslwfqbHkwG3z1rsf2zpa0B+XIs2pxAXEc+BikQPhBLvUz9wS
         jYf60PEOalXV5GX92y0sRGHR8OLFEeBeMt/L5PosHjlEgXRD7AXVUCA2QQgMLjuY9EcY
         uQUdST0Tmbjf6rgKoOXhMDWnUfokjjgpk/UIKxHeQh0jMAoCKve3ZCkqjvgeg64tLq5w
         Ur1jFzNUflUGlvNlnWzF4xH191N2BCqhMCqX8Uy7w01qiURNu7qjjecBZtXFLM8XHxb0
         Qa4PrhQ+GlX3uzIr4xg/VD4V1eKfwFkQrwWsD8b2St3wWdELjwtpCm4eVHSx6MmS2seP
         1xHQ==
X-Forwarded-Encrypted: i=1; AL+hErHtvzFjIcAufrt9YFaaM09cROIckUPqfxQ85hOegJG5zi5YLyjnQIN6xGXdDUN/BqRlc80N3Tf0FZjs@vger.kernel.org
X-Gm-Message-State: APuU4Z9MHpaARkfwRju6tMaEtvboYDajR6X18LUlcRO2rNpVqcXiMVQf
	bX2EWUlPOTqSKioUBGcF7JZql1wy/UoRs67f1Gh+ITJX70bNVZBO85IHzWG1gKcQbcNwNk/NE/5
	HXbamIwFpkaAxaINGmvc5h8h3vZrCopgqpldF3mbYyuI5AEIa6jctIXqA/Lp0hfE1
X-Gm-Gg: AYBFou2WQQ0XeqbJeP473h7YV7UNZxKdz1KqGmiUnTxR3PLG2gRYCbkmx7CG3BJfN6e
	Uxfolz90uworxCqeDbOaAnlBX9Pq4HBfC3V2zAO9yDRHSllRwFWuWMoQlL0Uq1nSlaLp0ZfHLQ8
	GSf1f8dSez9JQdCXWCWNBxVfx46fT+QLs6mV719z35iaAdIkuIwI3rjYexc/ZFzKM2DB4GadeMP
	hAP6js/wukETo2mUJUCnwmnjHcIYrFyZrLgVhZg/PuPn9s7+Hfb6I+ZfG6Cc9etCpOe93hfypkN
	QV94zmY7qPREo/pdBTMR+YmWpYu5/ayDy771AZjRNhdTR4cwZH6A/k8AwMcO45qTBchmljFJafU
	dxhTMOBuj2qWkbjdYBdVJO1iG1MpXJCslsDihNyEpyom1epZeV6PVX9VEk51ddbsadi6+EiYGFV
	AyJfSckZiql8X7WPaZ04Y/xUxhePmoVlnKhBc=
X-Received: by 2002:a05:620a:a986:20b0:947:920d:3408 with SMTP id af79cd13be357-947920d3502mr120148885a.46.1794213423294;
        Mon, 09 Nov 2026 00:37:03 -0800 (PST)
X-Received: by 2002:a05:620a:a986:20b0:947:920d:3408 with SMTP id af79cd13be357-947920d3502mr120146985a.46.1794213422839;
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782dc37e5sm418223385a.34.2026.11.09.00.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 16:36:36 +0800
Subject: [PATCH v5 2/3] drm/msm/dpu: Attach CORE and INT2 power domains on
 Kaanapali
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
Message-Id: <20261109-msm_gdsc2-v5-2-4a3159b5e4b8@oss.qualcomm.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
In-Reply-To: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794213397; l=2690;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=k4/w0ByaTXPXsf61RAe4GLz/Jc50aw9jLRjtqxw+Tis=;
 b=jm/6dNLOk9BQB6T4YigYCRGN5rjJDhn5xVlksn8EDet1BPVk3o/WxOyDPoNbrLiVSarhzbAZL
 DRv1xuJkC0MCjBgjnFntvfBf23OQYChfU4yNnGqvGROfVkRJOaa72Qr
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: lspA7GqotBCEf3xjEJSC2U2c_Dt_MgQg
X-Proofpoint-GUID: lspA7GqotBCEf3xjEJSC2U2c_Dt_MgQg
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af18630 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=hNyr2f_ZztDnRCZExOcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXyTKRddcHCV+e
 TWOk8kZdUKrKE7TAUr9hK1KjU7Wj+62Oz7FLmbAs7NFdgv9rXp/mHHD7V6AXSOltifiha23hZsr
 EMrRW0JUc8m4PR260EAIGzQkYQLDTauIUo6lZTtr3VJw502Nk4AOjtO6O8DCWuolaIjTbdPDoK1
 QCsZo3QnNuQKE65pvfHXrVeWv+ioDF2xOvVsEGCvHQewSbNz8c1V2C29oNTFLBtKLHkqiakYupj
 UhcQSnPy5dKc05ktANU7NI3dRuAWBlxCTiFtd0bmNTEipDc4TshNaWa+V0e9MMHO4XhcoKf7T7X
 21/8RFlEVq5ztwQokTdrKt0nH8kBgxI6UFq+BZ3M6MAM4HqREOy2+MnxxLxAiASi4dYe0AmvdMo
 lxgiUB2OL6nITmrMJc56HdkjIIdWpZXe8+oYNlB/OuJGOsWAbUSLwPGYPM58KCcPsjlgy+6xqNV
 WFKmpTe0EOCCKtqZusg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX1KhVNIcigiQm
 YNuIip+l+vJrVACkk5HRBGJcBxbYvkXM2DbD/j2S+ljLK6kOaefii0E647eq1BhEvie43qZXnky
 OCymVKIvrNW7EfXvCF751wiftRog9HE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

Kaanapali's DPU is supplied by both CORE and INT2 GDSCs. The
power-domain core only auto-attaches a single domain; with multiple
domains the device is left unattached, so both domains must be attached
explicitly.

The DPU OPP table also needs to continue controlling the MMCX
performance state. Mark CORE as the required OPP domain so its vote is
propagated through the genpd hierarchy to MMCX. INT2 has no OPP of its
own and is attached as a regular runtime-PM supplier.

Platforms with a single power domain remain unaffected and continue to
use the existing automatic attachment.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Joonhoe Kim <26rote@gmail.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc2..502e50ea5acac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -12,6 +12,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-buf.h>
 #include <linux/of_irq.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 
 #include <drm/drm_crtc.h>
@@ -1376,6 +1377,33 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static int dpu_kms_attach_power_domains(struct device *dev)
+{
+	static const char * const core_names[] = { "core" };
+	static const char * const int2_names[] = { "int2" };
+	const struct dev_pm_domain_attach_data core_pd = {
+		.pd_names = core_names,
+		.num_pd_names = ARRAY_SIZE(core_names),
+		.pd_flags = PD_FLAG_REQUIRED_OPP,
+	};
+	const struct dev_pm_domain_attach_data int2_pd = {
+		.pd_names = int2_names,
+		.num_pd_names = ARRAY_SIZE(int2_names),
+	};
+	struct dev_pm_domain_list *core_list, *int2_list;
+	int ret;
+
+	if (of_count_phandle_with_args(dev->of_node, "power-domains",
+				       "#power-domain-cells") <= 1)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(dev, &core_pd, &core_list);
+	if (ret < 0)
+		return ret;
+
+	return devm_pm_domain_attach_list(dev, &int2_pd, &int2_list);
+}
+
 static int dpu_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1392,6 +1420,10 @@ static int dpu_dev_probe(struct platform_device *pdev)
 
 	dpu_kms->pdev = pdev;
 
+	ret = dpu_kms_attach_power_domains(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to attach power domains\n");
+
 	ret = devm_pm_opp_set_clkname(dev, "core");
 	if (ret)
 		return ret;

-- 
2.43.0

