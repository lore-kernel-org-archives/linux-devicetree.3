Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE83A9D8D
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260468; cv=none; b=P+nyOhcNRwkv7ElfX+Qg212XftrWmVy45ejPRfEY2WmaYyxjDW4/YVU0m05mJPwY/LAzTK0uD5GK7aHl7Qt5+71h3shqh0OPKUwaY+mH+rqToc+qPMj2QP42ArsMgzb0nG9EcHuhaX/In6GO4u0F1LvEkggTHV7Tds1NEEa9hx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260468; c=relaxed/simple;
	bh=j7kvLZyfBPOCqjXC+BDepJVgM7m3/VcCTgkhkXmjsMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0rhWNA/rg7adL2nKpzwhnN5OCWOZhOpT6XehaJkU8NG8sizkyF16aa6T8LrIui/DR9i4rOcfd4kjoWTnvhBBq12RMpYZ1oPMKdSq0nTxFjloSqQ2ejR69kAR3UcFw3isTX8TnR/1YUqaMFkwSOz/kvuPZdtviiNGKGbsvUGUEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZ0Z/Ucf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPABi+Qj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZ0Z/Ucf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPABi+Qj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795d4YU1915541
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tPicA3rc3no0t8b09/hiQO/EbRITwV69iZQgGvLo/I=; b=fZ0Z/UcfLTkIVHFP
	Z01Vb1RRQggdzXWOz7qeF+0sJdNQjpfKuQOhhOCmhyVk5KsISNgOzgjX/zK02lhD
	/WuSf9SbWULCYNjPyMSOvmoqva8stW82AdzEksgB6fZdtDgYKHrm+5sslcWoba/D
	RLCA1y7EnNTQl/M/j6B3gr1TqdanydlGiKeI8uLU8T5kSRta1/GqtDSQx6HVDkZ5
	z5jW+dIQCpldl5JJ7jpmTOVMCpoM37PynbznB8L3DoCn1MU3r/jC/K/cCqAF039A
	lgLcEUKb8eJ5LdEhoFMR1HZnZTruv0FGPXRQbddi/rs+KDqyhXIVBbR5uPZjLkUc
	DFgNWg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp2s96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 07:27:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso573707a12.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260465; x=1786865265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tPicA3rc3no0t8b09/hiQO/EbRITwV69iZQgGvLo/I=;
        b=GPABi+QjGxPBKvzjSegKv+BfVVFPX18mfR3wgzBWULB4Rw0xmP3LeUvp18QKNBlBrD
         AgCGU8hO4Xq+j7C25Rs50gnC1ycKz5KP7G/uYJR/e9RO/4ntKiXOBK3C0EdfOFRKvbPh
         fSfsgnwY1xlmXR0BPO07/61Pi5Q3S97X73eIn5CaK4wkAH6NxUM1egiaI/cJnPso4bAw
         IlBtKUkaJSWGghlZ/tvpqCYB8NGeoMsnPDx/85dm201uTx90WUPTy7yhMNC+yzxmGu2o
         NhIfjiySWxJmXaJIgZTlFIf3ed7CY14jLsR41pzEFTjInjBEMEqM/HJIK0IppgUZvPq0
         LF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260465; x=1786865265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tPicA3rc3no0t8b09/hiQO/EbRITwV69iZQgGvLo/I=;
        b=PcDBp0c+l7O62QtApxOS2pQpuleUi+6geUO7qJ1WXxm9UREHyHLF7+8kJbs2nJCJe5
         9YaY24S1Vga0RwKLBvyU10nfJLuwaUfNErTSBKP4MXKvIiBscvWRVnCBa6b0V7S6KKkv
         m3qK/BsjlBqJyHr/1qORbk0EjL+eRAKJi2ae1DF3AALTTQ7Vpi5K1MjC/IUyAbLzwxzT
         XcaOtNAEa0q8+K/5YgtPdgS0wkWCq2wSLv1G5L9BbPA6sa9TbIbq9x8DsmhzfILpbRb0
         HsceazNnuJXK8+KofPLZTBpIFsllkUjGkkMKgDmvcU+6o/SwdHdg1/RCm3j9j6cyd70F
         3fMA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0fzpt+nkdtbjrG75IraW3tM/xRWe3CBPuaSvLujWB68QLSYtoO22OpXQKa6UFJ9He4XVRnsbK7zlZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxaJE6cA8Du8N+DJoI0d9tawb5+9zEZLIxEl5ZQG3XVQauAV6Ud
	LEP6Z6nAEoRTy6kBc1Yk6kOIHyP6BAZ68wECt/z9GnuUzCqAyRkISE95Ju76Icp9HHMEEUWA6Aq
	oYeibiTm05xp8gzlGdO0oK9csNF8V7V9xIpP6FtjW8KJ70v2LqdFl/DrKbtpIdsu2
X-Gm-Gg: AR+sD12nemZyWWLq7G7e4vXpPKRUcLdYx/iMxQG4kWOnw/Y2T+G4esiUlU63XaRxqLc
	ku8/vofG6kfZrfShhW642YOLnqXxbP74JFePyOPwLgoKfRGXyTqdpF0lP+MN9KZciLHEZdiHox3
	jmcyXNTpJl1YIR5srP/m9vwgzSJhI9SMa6MU+sZgKVHfsbRX+UJWGOT4D4OGyx0Aqg8OgCy+GaP
	AxSTQYWQzRuCeP0J3lUq+dQd3qyGvGlLA1gLKVcS/6i3Wzm00mTQnM40h1g1Uucfattz/BoNdmy
	efFjg4WXBRtp90SlbEIHqDR7edpyfOFDXjjzcT8pYKWM3LGIC9HSGaChPJYZcH83sm7yyG4sCG3
	dT5C1K6zkmpxGx7hF2tlobafne74nJMZqd9lN+AX5u6VKC/EfPQ0ydsox6Dm9mBr5H0nh6/28sT
	RFioqfBKDQRkMkaolPTo6fCXw=
X-Received: by 2002:a05:6a20:430b:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3cbce8d4439mr12430186637.17.1786260464857;
        Sun, 09 Aug 2026 00:27:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:430b:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3cbce8d4439mr12430159637.17.1786260464430;
        Sun, 09 Aug 2026 00:27:44 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:44 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:02 +0530
Subject: [PATCH 03/15] pmdomain: qcom: rpmhpd: Add power domains for Kuno
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-3-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=1687;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=j7kvLZyfBPOCqjXC+BDepJVgM7m3/VcCTgkhkXmjsMI=;
 b=PJ+/gjyRuoFT4vk1O5bPH2iIGC9vGJnxxXXzP3ik5u+BRgjGnzZJn+u58Zt/lAiEF4zMOjNoX
 wmv3Y4l50mDDBzfI2UpIlkwgpgrlB8Ef4csZu+m66sfF0Wik0BmIFau
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: 3YGJwe-1MrZo6f68jwzxNI1lzcrgpljj
X-Proofpoint-ORIG-GUID: 3YGJwe-1MrZo6f68jwzxNI1lzcrgpljj
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a782bf1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX73IDJpTrgQ+D
 U7o9QyxsPQ5gXxCVmQcXpmoE7HLzTmQJxmtEFJsoc3YLSd9jOCHaLBs9adVko996SyLr2HNj/Py
 h72vk0O1wDBHYPYvO1BO/Q6ysxmzk9NuLJ0gR0BU/TsS8Qvrhmtt44UY03kRIeRX+Do+xJkqJRt
 y7oM8cHESp4CzGjK7qGTvfZu9IV9gvDErrYlbkvTiKv8ouV8fT5treP69npQJRg4zYVqdiryHuh
 BSp6SUtY3j9VYcEw+P9i+fmb0moC4EMSBNcveRNFpQABaSlnAkEK7Qmonb8j0HkP42A3RhnKktV
 8dAAuSRU9bzKEYR4jTFJJcM2lpH/EJW/t5D8GJOMY+w/hn8aFWTUzuLPNSk8DQoZKKLDhOdV2Qt
 WYYQyyL1wK/5kU0dkVmwHzbxVmYnmln8lKk2AXvEtZDTkJHjIXpUq6BOA6ODbN9Rz9ap1gtIJFN
 gk/KIHHuqHikFqXObPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX7WqrFxuQtmT0
 O+dhnua0u8MEeU+h7K8Ls/S2N+fPMoYo/2+p+ozHbYdYyxUSlSzn3Ulr1Ytz/enaighrBckZV7O
 NQeRWEy0q1fF1Y1inK12a11ohjV+LqI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608090063

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 90743275942d..725ce802f683 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -681,6 +681,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
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
@@ -885,6 +900,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0

