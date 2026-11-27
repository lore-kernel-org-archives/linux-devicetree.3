Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779800;
	b=MwGxi6pmv3oidkgV5oP6VtA0Oz5yCOynTsbdN3svtrfXJxDJOfvU7pTCjQRpj5CKaUt/
	 c0oQcP/XGjXwOLY8QxLhjLyoYMRUoE9ycLETmQUJxpFIBrfowt9YIsBXJ0V2Gg2DOXYFH
	 CGnaDfQi9GrBy2VqXx2RY1eKAloFsYc/eX4F2eeJHTroUOjxK1amYeNv2X12sy0mTWflp
	 zfxizUIrXsBzUpWF4HfvMlErhHMuYHIL4jWxCl2QXCi+fLUUTfbt3seQDQhlbjmhjmF0x
	 OzlGmM3eoq9cnth64/UEwZVo8KxGUppOkJvu3O77JSdMrsD3hY4Era6VmG4zOR53IOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+L60qjUW8xy9FlaJ+WlqcRIDFQJPjBBfFcMD9Et2b7U=;
	b=CnC0dNzTTQlfLNnE94Xg3Yxu1S0rk1MFmUM3jYlxdl7r2FxvrG5q24N0yWAU2woDHmW8
	 tLsRSr3dTaWxxTcKGDyvBTYVx1cm/QCNr8z7TMMYHcqtBOzEOlGcZXf0csvzOyHPVrO6g
	 OSSS7BgWU6rCQ0fcaqAz5VAKl9dXlT/puDRgFtwjQYzTmYfQOeX5X0jgeE0Qvp/Ny/w0v
	 a2N8pIxMCZ2rZuvZSvbejI9BDxlYuVzWz1/Jovsc7wgo0WbMqxosCqFDDqFC3OGliUT+J
	 D5V86MNx1r+FRVD0vHZ1tgWe2GZnmsB1zv2izAlYsSiOS6QLGYrSt89CrrJffe5U3nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VYlH18hg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=en8Xff0C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E78A606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E78A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VYlH18hg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=en8Xff0C
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp6EX2268588
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+L60qjUW8xy9FlaJ+WlqcRIDFQJPjBBfFcMD9Et2b7U=; b=VYlH18hgdnreoNRd
	QMBTf1IbE/dY9SKqvo5z+FBx7ztH3q7O6hTR6yIUPcJSmAV5AP8oAEeMBnXZD2F3
	e6rWgcOMmpDmz+twC6kqy+gNfqJZ89ui23TZqhtNdKlzV3RY5NNb8s734kDHLEM4
	hJUPOz7oxbXqJ4p6IRGq34kyY5FVgFgSPy1DlnegwOPB9AB6MxxpRz7b1QgHW2mx
	sV3a10lyKedpm3ZIUFFflVabQPD7GW3sIZhFFgiWdf3AkscmANOvdhC9Sp/u/kv0
	oyaTa2fu5JAW7mQE/hvssE+eJ3K0IXFz9tJMvCSYQ1ViiWidr1yZL5wgEW5ZwiVG
	DR13Vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhe5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9493e89d4f9so1078786585a.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779799; x=1796384599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+L60qjUW8xy9FlaJ+WlqcRIDFQJPjBBfFcMD9Et2b7U=;
        b=en8Xff0CV3QzlHMu+kmARwl8VbP4pc4CiPkhm4ofn6HTJvnPTKiQBxAqSK+O0uBnKz
         vbhDnUBGLR7X7454e073BIMa4iUUmKoyFiubyxaOxYz6uoPzMASbjeVtaef17tOllakO
         +BYHqY/scb0olfCZteuInter7ynNtx6ela+5Ow26OUsxYAj1dwzxATjfrrGd87mN20FO
         +pfvkKdgPIYHiZuIobeSYG4a+cwF1SRsjSuSzSflNBdyV+UXZBpnUlrPplWR3Tg4KnR/
         rrcRcsasvMRFCHBIylreWvB/xBaj8i0rfuf25hE8pp73WvIBvyX1kPza0upcLTPCZ72y
         P+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779799; x=1796384599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+L60qjUW8xy9FlaJ+WlqcRIDFQJPjBBfFcMD9Et2b7U=;
        b=jA35jKXkjKUQBt32h0ln2ItM997fZXIojSZquk81wHruEI/mZ5jOPOnaig3Dnvcr9b
         9lzxyzC13W6o/xkDyktq/T/MDoP6YyuRy/vdGN83KabPI9oOI+oo+7gPcFm3MOw6D9nG
         o4t4sxLnNV6QY+6PABkjekKiI6XCB1i9K1oO7zxJr7DJiZJo7UjrJ4LlpV4MBnZQxvvA
         YrBG4AJCaybMCbaTSf6cUzwRpamjNgfcKL0+OVnpZFO9EwS8ZCyX9dO7AqN+dcYEaXwx
         lsSCRO/q0187vF/BOOTEXVAsToGmyYpqDR4hSb3j/R/6JxpagxTE3YLVt/gw1oIrFzE5
         T3zA==
X-Forwarded-Encrypted: i=1; AL+hErEWXZL26W+9M9VGGHKUTeX1C19FREMW+zNB9K0KnV8BARbZ6FD/w4OpKOVqCycve/bYAwbg06SeuCcI@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ZjCR46aDaf7OIHJ/Uda4X4mgnAcNNUOB9GF3GojlLnSLO5IN
	n7+EJ5c+oyCN0oJ6meTm+rAzXkw1axqZ4VuJUmTl/XhLZ8JqUil0CzkcHBbrM1IiZEXk8SwF+LL
	992XuDmVAoo8G8q+uZ5oIeIVF0if+p0GubcdIklG7Qxg8702NitDalFp2gD67z4SB
X-Gm-Gg: AZFdTZfCU1Xk/HdirYj5OxnKGfdcEJqDPOIsPdYJ8yJiNBj/EfmPohdpYEBMcmYFM8Y
	z4sk3EuczqSe2IK6SXxcfdPtBIU6VrYK0GNAZjDBc1HK3BZhkUWM+YpCp16M5MG8MqkEllHcDrw
	cWfE+DYPBTsFYA4vcgu6OTndhZ8RUys7ZsfWnNiNsNE7Ztz7E7o+/PjGaXLWEiehseQYYGBfWLy
	q8UJayUN0TUtpJ1wzhvJ6lc6uAIr6j7PKFojBb71AHajA++r0POzYB8WQ1uneQEb8mFhk8DMMJs
	yBbDLPoYab8OVxGewotIWL1wN3Vf4kln41MNNzKvhBdLItcmAfyhB+tcDo5zjQjepUwQskNY+oc
	OGktRihlohqPqRadeQt3C4Zb3qYB/a8eimLUK9I+TgJ6xJtNa6f42v4n3g8nFhipUBvXtU1Ledd
	GwKCsYLo3DeYCmnNoKolRuJ8+hmyep8z2c2seVYube3YU2pQQ4jVH2LwDjKdC3bOc=
X-Received: by 2002:a05:620a:4453:b0:947:7691:731c with SMTP id af79cd13be357-949bab47e86mr4160816685a.65.1795779798769;
        Fri, 27 Nov 2026 03:43:18 -0800 (PST)
X-Received: by 2002:a05:620a:4453:b0:947:7691:731c with SMTP id af79cd13be357-949bab47e86mr4160812885a.65.1795779798339;
        Fri, 27 Nov 2026 03:43:18 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm716120385e9.8.2026.11.27.03.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:43:10 +0100
Subject: [PATCH 2/2] pmdomain: qcom: rpmhpd: add RPMh power domains for
 Seca
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
Message-Id: <20261127-seca-pm-domains-v1-2-013c28eafc5f@oss.qualcomm.com>
References: <20261127-seca-pm-domains-v1-0-013c28eafc5f@oss.qualcomm.com>
In-Reply-To: <20261127-seca-pm-domains-v1-0-013c28eafc5f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZY/S8jq4xzcaI0oRzyGVUH8xf+3xmtZAucNpXtUkAE8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWzRqKHWDNl8e8baPxMR5NXp95eEZ43F5u76f
 rg5ppTEYXeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawls0QAKCRAFnS7L/zaE
 wycXEACyAt2woKsrbDBGRNfHBQ/andcjt9vFnpMXezG6ktHdcv8bUfNIJKSdR2jlLjJ/tXZ/ByM
 Igan/SbKjBnfcjfFrYcFHzXsF8xGXyJ675vUs6soInJwrHxXPETg+QAan8wjVFxFTMXMS6Ywv/S
 BAvi0KdvDF+65AwFIkQoQbKXoihQyiIhkrH2AVvRJMhD/GKgYdeGD+lGLHMqLxqxSfjYiLtrrv2
 H06/MtwuYYckU/qKzJmvmauqRVxJ4ugSe77vXKF8YaIfbm4lHNOPrgNhCZ7zF1o8MSJfgulgVgE
 mnbCMwtb7bi+4zbpvxNm+vIAkYtebWdMOpWddLxaw8UP0VMcV4HFlEs9nKoWdx6b7Pf+n25jbP2
 /6StMaNnymTrKicQq+qWFvJYeCCo8HQ107nbE5XriANOuadfJH78ktMY1PTX+KLsuMmUik6eSx2
 lHFj9qdy1aRGuEv3SSl3y8sA8U7fKKIbki+0reHlywshk0WawK8+swNOzHgSmYJ4QQM8lEsS5Hp
 k66omyjee+7XU6et6g0QAiLc9cSuq8kbaKNmIrJDYi9fXrqf/SWj+k0xDvCwrPTzcK30uehXkzZ
 LJZZqE5vK/eyD7xoWmu4RqDNxMYXxta3ZvzUBT6tz6gF2NjaUiIiKh92FGd2fej87BCLyucKBEb
 bYZ+TyggG/ADx9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX4ARkNuk4I5lr
 j3EqYp4ql66v3qRJaZgoEYadEL9LyMuOFdyPbeGwRHx58u1ce0FalCJnqiAU9cXlrlliAqN3NtR
 sU7gNeJDGOOhZ+kZSBPM2FMzChKKZpE=
X-Proofpoint-ORIG-GUID: Rn_dtCjJqHIw17HySuM_I9tNVA_vg2Zu
X-Proofpoint-GUID: Rn_dtCjJqHIw17HySuM_I9tNVA_vg2Zu
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b096cd7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Em1930O1owdZqrsm1f8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXzN/xAsZfHKUX
 5+IgYvu7l8+zYURj7eOW7U0zJrL3wyDMaSDB8OIA4KuqJwfgWhvWbto1b8b2cd88l0jEtpL1Vhx
 q45kmlOijnhweXQHUoaD5SdPYOJSYA9n+H4CEsJSgFBkDvPUIhlT3b4j8IqcHOdgcGvW8fGi+Ir
 2SU9LpwHJ7CH9GdVwDTbIP+CKbvxSwRVOFGNZz8uE+8ilORlFkUIJDHYYMpHEEWVld9I5uUFWNr
 kHDGRobPDh60hcBq3jhigJC7Luh4Obso/PVQqeA65BWzQ8CLogxvPO4ik6FB5BVIAUR/apqV33U
 JCAF0h1BTVkm5SM9rb1Wdt2mmj1eBl8it3v1cPQQVNWFqEOlzzTPpeUhaLTpcsZ1VhJaYHCbOvI
 I9i8OnPgEcqfQsCLrmWbmK+m8qYUdmEF6pCH0RPOnMrzPqn6NpEV1qnPj1YNHGU1Mi+2AUwlt8U
 h57NY21fpzYMGKinzXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Add the RPMh power domains for the Qualcomm Seca SoC.

Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 3f50e7d5dd109ec9f6a28c3b667ae0394fa3b32d..a0ca4f0332243fb3919391e061472fd93be768cc 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -344,6 +344,29 @@ static const struct rpmhpd_desc nord_desc = {
 	.num_pds = ARRAY_SIZE(nord_rpmhpds),
 };
 
+/* Seca RPMH powerdomains */
+static struct rpmhpd *seca_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GMXC] = &gmxc,
+	[RPMHPD_MMCX] = &mmcx,
+	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NMXC] = &nmxc,
+	[RPMHPD_NSP0] = &nsp0,
+	[RPMHPD_NSP1] = &nsp1,
+};
+
+static const struct rpmhpd_desc seca_desc = {
+	.rpmhpds = seca_rpmhpds,
+	.num_pds = ARRAY_SIZE(seca_rpmhpds),
+};
+
 /* SAR2130P RPMH powerdomains */
 static struct rpmhpd *sar2130p_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -943,6 +966,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sdx55-rpmhpd", .data = &sdx55_desc},
 	{ .compatible = "qcom,sdx65-rpmhpd", .data = &sdx65_desc},
 	{ .compatible = "qcom,sdx75-rpmhpd", .data = &sdx75_desc},
+	{ .compatible = "qcom,seca-rpmhpd", .data = &seca_desc },
 	{ .compatible = "qcom,sm4450-rpmhpd", .data = &sm4450_desc },
 	{ .compatible = "qcom,sm6350-rpmhpd", .data = &sm6350_desc },
 	{ .compatible = "qcom,sm7150-rpmhpd", .data = &sm7150_desc },

-- 
2.47.3

