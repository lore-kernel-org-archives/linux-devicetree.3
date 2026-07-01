Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2799E37C0FC
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924690; cv=none; b=oQeiIZXqQMz//7MiWAO42ne2zwmHj6nJ7Mu3LvTmN6CjaGnsX3gLjn2KFfMreBZIijTdMeRLwNIkUGxWuBG6Npq3p7HQdV7ST6Ww3bdBcWtjw4ckNw08uZxvgcKXOOWP/d8Ar7s/Uq07WWtAW7lDF3ANacUfB95EuG3cAzcdr28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924690; c=relaxed/simple;
	bh=9HR3Xd4rmD5sUqSiHMjMhpAeSe2fKm1iaA4AmjsSxAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a7S/GZZaMZof5+qG2Hwu8Jcl4TYpii3n0iNl0JVhIBEaej6odZ998vJ+mGAXmCQVznPPbHTFI843zo5qmSTqeHaV/PzmQI5PerXl3LS4a/N6H5bXlVwGz1ieMh164bOaKraWvO6WA4cM6BJiVXyKeTa3T3/84V9glJpZhc5kqPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giOXUSKa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SK9COP82; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giOXUSKa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SK9COP82"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmUrr1630399
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j56RPVoQs/E
	HqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=; b=giOXUSKaJro+n24ejMoiOwvUF88
	DNqr+xgBKL0TYNnOoAO6RsB8hOBjGdZlCw8yjaOKD4OTSb35jfqnvpAYgVSgiTlZ
	5aoq3Fj42nrXd9sG1utSkYurlV1td1ymzgujUDp9eJcniq5liWTBZV3O2+CoGxnD
	dMW3eHzm1A/kabH0j4UDTEz7Pf4zHrO8lWM2qtPhJICbB4CuYxrV5Zy8s6yytk29
	r1/CQuZzhmtv8hlNacxlNLruOaiDqGGIkoX1aa7Pak+gZRCk4zCXE9IZgNavhPiT
	ibRjmhrfERv7qLu5966WIQUOggCBFIhhSI/dIv0l1fmzKchgOfcD/soD+sw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mg6hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:51:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fbdbc4d03so1053438a91.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782924688; x=1783529488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j56RPVoQs/EHqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=;
        b=SK9COP824rIQePZAQlaxmsx9SVrCzjYISUJLGSNLU2e6+oHzwxhbYA/s7IO96G8+I+
         ydWu7ORebhHJw3Nd7ASn0t/HhYt7y9dwT85sQzXn3tzA92enk7t4f/M4RTcfivNegBmf
         4VaFOH1rPQIEZCj8drSN5U4vHy5637QiEN81LdoFinjDwUvMl0nGvLi2T0Bgyu+OKzx1
         7fFjRJLE/6FNXPLF57oNRzdtyQmQ6hMSzP+VMiP6ylJes5FMJI13L0EfbH3OEZG1gLmV
         u69ORzJOVykL4f0p3qE284C3QFn/D+rwWm8n/zznBJvXM61Ku/ntLfxaFS0cf37RCDyA
         JA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924688; x=1783529488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j56RPVoQs/EHqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=;
        b=RIVV+U82eTkFhTQYgSGarkgkF47tKwHgVNDcZx3yLPwnaZqgIkeBDgmQjEb+Uvf+VH
         UR7KL1Zmg9GO3Q/shmfhVZWwjztuunMJDhFq9L2BepHOIDtt2fc3KG8h43B0u6mJs3rx
         4QwmzDsMFDFNysoe0Ax923foYzas0iutN/Y5QnGs08KJ3KlGyCu4Hv6rxpL8PqoXjZlo
         Ie5lkolVZWG8oeupxtgilBJNFhyOijcBXlqisNNXxLkFU9ZsFaBNwn5lqzV+fukiubqj
         9VABkO/fACpqa3cqvzjQbwxeESOs8JPp2dBAKMicPr7bzc2KQ853OLVV1QJit977EOof
         /4KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1IMJGExRCKylC+Pc7miDJTWsoy7POPiaF1C6BAq6LlP/7mxVH8tQjdult+kK82vmuD6HtbMQ5yqxo@vger.kernel.org
X-Gm-Message-State: AOJu0YxACrCZ/G8rDpkbtJZctTjzlVf/EvoTLQeDmLABKTJQ6FZNpNmh
	M+g1kPBXmcKja8HIqZ3Gq3W3zLIiiZNWQWeAWHFtCsJD24l9xA+k8BZ6fmMdD6RbeyCjfL9U4Wf
	CvYKZy8AQA0jhVlhTE3ag4tLwQvtZQDFeSNF22lcpYINGq75X7Gfz62a5x+JfHr0nM+HKqw7m
X-Gm-Gg: AfdE7clgABSONfQJY2RTN0IbKt4Z+iIXrs4TbvbEuIlgx3Eug2uNf9SQdU7uYaLody6
	teG59Yam8rXEVD7/IMxNg8Q0OikWqm3f6/7g6jNU0sZ6CGF7Vgr0icgRykF/33GozAM9gv+hRFj
	XHB6xUhvLF1Lch2MRx7NChe5kAFe8sEmCC/Tv0ma6zhvF+uAW+mK2V0I3v47B+rAq+D3rscUC7J
	TFWmqKvv1ygwtycdqz3sNhxkj0m1Z4fqi7WIenlFbn8wq6nWrcq9A0azyNP+9bq5m55ZGetl8MQ
	RgkXj+CK58GDZQuUI0+8Ga5HMRa2Yzx5bEqjE0xqraP9WgQElklUGnIJyBEMndDwbPwSIXgCIYS
	pKuKGbwfs0AWfff+W0iVpovKG7Gqk8yFYfUG+0ma5LXn+5A04D+yOrvG3trGKHY6MDhLavMEAaJ
	8CbYM2
X-Received: by 2002:a17:90b:2d85:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-380695869c3mr5471901a91.12.1782924687652;
        Wed, 01 Jul 2026 09:51:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2d85:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-380695869c3mr5471863a91.12.1782924687216;
        Wed, 01 Jul 2026 09:51:27 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm33038935eec.15.2026.07.01.09.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:51:26 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 3/4] phy: qcom-qusb2: Add support for Shikra
Date: Wed,  1 Jul 2026 22:20:50 +0530
Message-Id: <20260701165051.4122259-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dUA1_pMztK2V_JLhv481jkOLbzwsFear
X-Proofpoint-ORIG-GUID: dUA1_pMztK2V_JLhv481jkOLbzwsFear
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX1etS2Agh4XQB
 09RmN56RJiH4ZfgC/pkgF1mvCy5e2VH0MQ3d0XHRmdeURk+d5JgL4HjfQNSqeMfcBVWAApHL0CH
 yUuAHeqPJ2E2KVOICOaO9+c0ESEq8Tg5kxd1lxl1I4cv9nkk1NtAOQ64VJnENb/kD+43QvMM29m
 QUnxLRvpOOCNyZ8UG4HTwwMbQob7Ng1P3smzsi/l3NGLaYNH4Lddj3O6DahGMpHIeskXwFP6IMc
 X3onkraBxhT6ZknC7RCQkTCSQWRWm4bUDlm3F3yd6Nnv9+OlBlRVXHwv0DzlUJqAbR5wQKw0YgS
 Qq/CBsTTAnLDbzSxr1RumyHpfrNqgoBwzv0B8r9zMcm10SY91wXxUvuzyuGP59mL0qKmNLE1FfY
 dk7XxXc8vcuz7fSjSqjCK29KtbPK5Ee0uWiH27yacgEKmnV1nqlaRGI8n3rPDbciDpkbOKfblbQ
 O+vFxbS7DLDFiqMPG5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX2SMTCmNmD9u5
 P6Xknpv7TGR8Pc8nQsHzcY5LCUH1MuFB2GiowPJOVVfnF0/CFAP6jdehUGobyOWaLsamKaEtT/M
 B9SprZxn+goDqI3NaKm6ekWovOi0hDw=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a454590 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Fn7aRh_OGbpVAvsfffcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178

Add init sequence and phy configuration for Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..ab7437e7b751 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.autoresume_en	 = BIT(3),
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = ipq6018_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+	.autoresume_en   = BIT(3),
+	.update_tune1_with_efuse = false,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -958,6 +971,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,shikra-qusb2-phy",
+		.data		= &shikra_phy_cfg,
 	}, {
 		.compatible	= "qcom,sm4250-qusb2-phy",
 		.data		= &sm6115_phy_cfg,
-- 
2.34.1

