Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949523546C9
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692764; cv=none; b=P9TpjO3K3cqA9FbyTkg8OOoHU1LdAoO+PCwwSoEfkdWyRBwMJImDcaDjmLDWjpGMZjcDQf/Y6HstptPmPE5mpSBE+PeBFT9HL8TQMUlywK+zsNxvPrVmFzQ2ggPvjC43K4BymplpbGfqOhvA63DcBk65sgWjCBqYNwX+YQQGmF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692764; c=relaxed/simple;
	bh=KipaZ7f4mPPcv70WXg+eNoIM2CY2fZVm54MKxlYcJC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQtXdz2DWClEuIXTf75DSZZUdBnF4+CUbiWP1d4XZlpoDThICp0rU+0oeKbBB8NOYVuSdw8xIJeQ0qoNRxc5Wjara/1BDn4Tp3pUnPaG3iFYFFEKG3Pp8VQ6HuxyNsvj6uDOPb+MS+66aRQqekC9F+wFQo25puCroqP4L4poxHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUyy9rIn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDjPtrET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUyy9rIn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDjPtrET"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QijS510483
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXlEBzajiJxYfo/PgAtKHciD8wbm1lPVA6bGD/VsF2M=; b=RUyy9rInWyBciczu
	D83Nts2aJ8bcd+uFbYRw88Ee82h4Mmc1YQ3LEpAFFt6Exb8viEB+y71OWiUyyBu6
	yczX+WWLyn7lMFIqGzrBa5n+572VYSlJ+8jPUQTN9vdsxqGtQG2OGEhchTiwQKSS
	pd/YVSYZvGfGUJV2FhqBV4Mk2PoE8mGA5fPFraBXYupkuebaOUQW/6TjfS/zJ3XZ
	oHnjCLvcVNbHwqqakxlquledZ0429PxmB+8S21s1h8pD3j5exzxLk/ETmmpXX5kh
	oVMPXZcHmHs7+Hm6JlTPDKsVZZ3Z1h+ri1Q86B7ls0S4AIpu2jmK2flOXTWvI7bD
	dykCwA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3usbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:32:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so505079b3a.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692748; x=1787297548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXlEBzajiJxYfo/PgAtKHciD8wbm1lPVA6bGD/VsF2M=;
        b=EDjPtrETUc+84NuoeS1Wo0r88mMvEkDBOGMqHHlyOEdiAP6W8Dh/sS+RFm0XAMFg/+
         Ip6pg80q8OeMivn5aIwfIwdc6f4BM8ZoxLT1FW4iVQF+7zGiw1IKLPhRrZOUUohhFMtK
         6N9pPcDWauXT6sKSqXTsL3vpZEvjCL+yK7QcACJvEwDk5cxdW8ze+JePL0/9rZ+GUr4X
         FaDsmgplW+4D1k6HDu6NPSOUaXKj16ynjYdOOk7LXgSRDDgQ3zsZZ6znzeC8aYTD3R0d
         TYWzn5YXrNCou7xBw2d3H71CJYa7DyVguP135tOrhDS4mw3c1SjJ2NBQ0aor3i/KxgnJ
         UYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692748; x=1787297548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXlEBzajiJxYfo/PgAtKHciD8wbm1lPVA6bGD/VsF2M=;
        b=RDPjqbY0XN9UahkY2e+dzvtxXzzoxQYSN9OWd5cGmNkVum91zzltn8tTFymWhPKqQi
         40Y/pUk4P3WtwZgPcIk4SbdTJ9H594BHKPd1lJG/dxZfMgoiADfKaRlH3sQm6YeWQABR
         dzrRkAhb+hUG73k+H6+Ri837wLU7gVuyXyRYE9bCGlqTuWRM5WFChE7SpMurHhC1PREL
         zhKI3PYwiV4ZJMz4+NfeCFRhZLmM/3RnjjjZxPM9BL2zW2Rh1ZJwH/CKwlAbJPjVgfGt
         UDUlYKo3dXcavGEm3RbkFokObRqEaZy3rJkXlFMXBB4s5mvT5WJsJI64PZFPXTNrJasi
         KtFA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/vZh/dFRfn/EgWv6usCzIxxPvIblnl7MM2ib784nVzOEqfW67wgFZx+ttQza5EY+PPnqF6ESKyo84@vger.kernel.org
X-Gm-Message-State: AOJu0YwDzwMHEi8d69fA3zIJlc/E8JtISFx2to2DSmbzqBTBXwtH/fQF
	5lY/fLEFIvxM+kosTd0hPC7xSiF8g9Uw5Q9meOkFCu2B30yGp3iZ+zlPD0MMNxnJ1DZLl3Sj2+W
	p3Tav0ba28O8Q21zytL8Wu29YIxVOdZ6ycRu6mhjpJUpeSu6gcF3Hf+tffQ2IWwIB
X-Gm-Gg: AR+sD11LcSLKe43NDFqZhO/E/Z2MWSxUqR+9r3G071oSOn4bXSNCCBeVcV0qAmCa6MJ
	2YnpDzM/4AYKIGvqEE56OAJfEnJyhVFWr2Wd0/t9HO010yXE2S169o34rvsn+ucBgmxaRvt/BqA
	5YGJBnMR9mN3ZjT/vrKp3TNWqhYCqCz/Z3SwI7UflSOaN/TER71Ol19YxiBbFNTdFB7A/ecOle7
	J1QXPt8eEF5nSIekQQmoF0my+2FrwP3DsFQWI/tPKE8/GAWoVwACe99X3jfNagizl1xP71NxhVD
	lZEEFqixe/EoedqjfsEck92pCETHYwH5uLtZ5BegPPR7MDyXOH4N6++GGozrND3vM2ST0ys+SLC
	bg7aeAP0W/zDtMA8sJtKged4Iv7ZwZDAWn4OfEd3GonCNl9k635DHcQB46I4dfyHkEAKpCyiC3s
	69NNz7uqeP/aTs3QyZOYb/MSk=
X-Received: by 2002:a05:6a21:3401:b0:3c0:b766:751b with SMTP id adf61e73a8af0-3cc71e1b532mr4325560637.14.1786692748118;
        Fri, 14 Aug 2026 00:32:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:3401:b0:3c0:b766:751b with SMTP id adf61e73a8af0-3cc71e1b532mr4325510637.14.1786692747710;
        Fri, 14 Aug 2026 00:32:27 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:27 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:34 +0530
Subject: [PATCH v2 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-3-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=1687;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=KipaZ7f4mPPcv70WXg+eNoIM2CY2fZVm54MKxlYcJC8=;
 b=IeMzgQyVvcMMtvAxfcExuQ5BmxImJ7KS7ifwcfX8fgmRZDKNbKcdDGODd9Nm/GVl5P3uZaieX
 DJJyOyg9fskB33y4FAgAar4Tgob+7ECF8an3TdKOdsyS7BEsEj/4J85
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7ec48d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX0t/biFZgjm2G
 BQX3SUKV3UwEKE1bllWwjtPYBXZ1YOoiOzjejo0sxue+37CC4+GCukMFyIdq+nyOl2IZFNDRA/2
 lncYIMThVyAV9OuDM7uVeIqaEHqmym4ipEvWi3A+4x4ysD2C9d9hylflhV4E2BPtkJvqTWAyGyD
 1j4gA3cN3rJTz6EwU+imak0rXfuvMfB5+y6+gqjjOfxp2Xvz6BJNGNuDrD6EqCmg/Irxpp9pa90
 mZHiwnQ0bFoI7yuIebFR5Ad/QuxPhV6BMnhhcn6WQkG76RjHRfclGv8t0T3WPoH5+PsN92Ro8hW
 wzk+zF5IM+h1/PqTCI7z20eDQbnvifq614UKAwMRTJ5BIv8AyFIVwMLEf9xsDLN0p2gxeRvTNKL
 3H/h63/+czkD4jNvezngM4L4lY5sBLPGeY2qu8Uu9mpdHy1rShxeERu4a84sGD0/Cf4R50tFCte
 r9Scvw5bX9hzA0TPUag==
X-Proofpoint-ORIG-GUID: alURIgl-j2ueBbnIv_aaZpsk_mbBNr8A
X-Proofpoint-GUID: alURIgl-j2ueBbnIv_aaZpsk_mbBNr8A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX9lOYK3abShB1
 ByOSZ+7EbPRyCzU0M+fA1izRwENesGHesWVmBpTtsDY/bFyA/N2bx79dLLQZBPR4BOdG2D7NERq
 H+fHpNTJ1eT3vZNusVRwZrMBgckbxc8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140058

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5a14..3c7755735dc9 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -685,6 +685,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Kuno RPMH power domains */
+static struct rpmhpd *kuno_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+};
+
+static const struct rpmhpd_desc kuno_desc = {
+	.rpmhpds = kuno_rpmhpds,
+	.num_pds = ARRAY_SIZE(kuno_rpmhpds),
+};
+
 /* Hawi RPMH powerdomains */
 static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -889,6 +904,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0

