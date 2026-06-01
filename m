Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE183E8C5B
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338177; cv=none; b=jOwOeWL6z8BvQdzgHhfKsC/WL4w61XFHvtddxJGeD2A+lm8xxPznYH7uxY7QMMN9DvXNUw1s+jbzrHYbXBLplpAvoyjg+4NGwPG6cVDcHUI+ZTLJhIHjwKsHeDpYlkrzN21ui5Ef0O/N0z+dwRO3ENW7wwbM900/Mtq//PCeruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338177; c=relaxed/simple;
	bh=lVc4njKqOhZzn4+GH1LiG7VTyYhJso+ZprzY1j0MwKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3/yq6ha4zxmT32UXx85wBm15n4EuIhlpGaPSrPfwTuY0PhXo/ZejQ4htlLQHPOI129ZD6yuF+iJlM/eS66JwwCi1Efm7IPlDr8CwJ/LkNnKagUUlC8p3heuGLC4i3/WO4YratnQte7/w5zkbmhGKb/8eq8qqjCgh4AhF45D1E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enDhJY3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlmEtrev; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enDhJY3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlmEtrev"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651HjsHb621967
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 18:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=; b=enDhJY3nHMuwcrb7
	Esng0omk4mP2rjtxJqmAKHOWjhk9pjxDhsOUFtxzrLOXlXGYD8SyKXQtY2knXYTN
	ZyODRmQNOdJvZqWXBcoyX7574Yy6PpMldvY0x3SkQ265TjHqT1xUWbm348CNoq3a
	R6s3TB5p5DETYjS4bJmOSg9eMWB1gtDAmkgOQlPZYoJa2L2QDFV+7K+MpVFnPDZK
	sRpt+lkuLhfZsinfMfE/ECU0A0B0rDwoearCA5BGupHSfI7B4WOMuBsp3+ZMu+GI
	PmjcpJC5GaCuUYsqX8GTJpd22LIQ+u3zpy6Q6fMVbitOofa7Al0n0mmWDuGKYQhf
	rs+J1Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954hvt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 18:22:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso2234181a91.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338174; x=1780942974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=;
        b=SlmEtrevp7ph0h6UgvUv5tFRJujjJZemsaIfHBcpASkhg8RD+0K4kV2chwllE9DaAz
         Z2bDE2nhoGFWW5i2gh5WBmRtZtp+vsLVwPyK3GiEN73jgcoFHYWfaUQU9/W1rPDSXdeI
         B9hiWZDcQAMk7OiooTUlmognmpOOGTdUL3BO0apvu9W2Nji2kV4HVeE/7COVFz23lZYx
         uk7TsU+gg9c3D8c5dYw4tGQ/KdZgz5aBIFLiyIydQufDKPCuqUJKdr6N9XNadJbEdN8N
         6Kvi7MCLQDe4IIusiqdRAkuh6Mo0do1Qx41GUWLtGFcUCf4uRVSUhvBZrDuB/g/Mq6lU
         nKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338174; x=1780942974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=;
        b=pChNE2X+UoaYvFZonTLKb0ZfSuJMofun01mZvzsLTVPaYLjBqvkah2aKINj4d62bUN
         cCE/eKKFvxBAZgzIkXGpfgO0qyTtSZyQqGjcFlzUOvCAudSHQbn9i580JP6r6uYYyvDK
         0nPiwPCvV8WyclLmdfG+H8sZPVHu1sd9OGDgrv0B/JyAVM/LGU86OO6Xcf0luMC9Qgm2
         Ur+Gns7/Mwdw6vSJShK2DVffNRTOWfBusjhL6OEy2ariZx6DhfDzqTjQGiWTqpgJUUYI
         gy3Q4Ee/BKw0lefN7YSBeSvu74N918LJBGhubUNdp/YOP8Fvo+xbAed26ZiNv/YWOcMW
         j9bQ==
X-Forwarded-Encrypted: i=1; AFNElJ8M62nM9lXx3Mb5qXY5q1HrLCJUCRwMRJ+5HfKEa2Ai9/iHOZb/wGJlXO1zfk5NpnKb9q33klrP3M+o@vger.kernel.org
X-Gm-Message-State: AOJu0YziAS9WsrzeZhjUyGPDPFI1JO4xAV83M62oAat8GLjgCWy3sGZp
	NPKEjYh1dusxZgUI0T7vbUBsE7hDYprb+3v47R5Ed1+Tx/DnPZdLko2LR0Z5CYv5STtBsnFumz2
	NRGe8sB2mcEVXnxmF7qRg2oCKL2stospW+PYBxOAcV/zTa3z07xhsO3XfFImawhHq
X-Gm-Gg: Acq92OG++yq9HuUmwu7b4IzA4hV8uA5lfaFesGMH0gdjXg2of3kaq63tMkZywbuHLiA
	NPadWOUWlcu7F3/VeRuAXHNKA7/TAHi+KksDcIJ+UISKgXnFX4gh5mpgr1ua4iT6eLYVMYYi3vy
	FB7zMCoN1v0IpKbbsoIGG/eNjDm81tKSm2WXIBAGMEcqYsNRdyQ/7ZjLL+/oc9OCsFogPK/szo9
	plYT9xF8zWZ6eU2YNzSkLrAeiKTPGpU5VKdlmmiq7DrkGPyuB5yGT8nt7vTIRzC/BbENBSgTGDr
	K0d1AeEgX7AlyViqkIrLTidDhTOVPlN9rYpMQgAS5fYPeokYm6oqnaCnFkol/npZzYIyQDlIY0q
	Yb3XRLnJBrZ4UcBNcx1SvL5eRSOhR9hVTJ4Lldq0KMxYBC3Y9YiyZlV6V252bilU=
X-Received: by 2002:a17:90b:2787:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-36dae6a23fcmr6141460a91.15.1780338174206;
        Mon, 01 Jun 2026 11:22:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2787:b0:36d:ae6a:22f4 with SMTP id 98e67ed59e1d1-36dae6a23fcmr6141419a91.15.1780338173748;
        Mon, 01 Jun 2026 11:22:53 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:53 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:32 +0530
Subject: [PATCH v3 10/12] clk: qcom: gpucc-qcm2290: Update GDSC *wait_val
 values and flags
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-10-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Q1Kq0SfMXy2vOS4XrGjkRl7svFvqbAZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfXzBCyA6yyrKUi
 iuW0g3AvCG7lRYC0CE+jpIqcSBlvAfYaSPoehDsMkAHTEkdXYSLEBAzGko0Pkf8zg1Gzhrimp6v
 TX2ichEy5nYigFo9uwuBqfAn2XIkUNCKtr106cEf0IVjveofovX7PW35n1sztsoJu9325w7NMAT
 s1bkxFIw1AkYPgYB7plU1KMpB2TvczMHw6x/EnzQvQrFM1I/vYithas8Czar7TuCfGUMK/R3IiR
 u7SXwIQQMEYIJ2KNBK4lAfg6VVnafGTbUea1DI82HHOgEjH+LlvZ4dIEjV/MiZRPGsZmzKyK9r/
 H3lYc2dCtDXMQW8uCMWsh1AwDkaDEwLU1Tg6kDNWsG0cH3VcXoKN8wYsEmiGsXwQl1KDcGaaHxE
 TteDs68goKe01qVYICFb6VgYs410Qd8O7oyJWToC6i5V1ECj4heNY+tMUM10Rr1lsUu5VLrRTOG
 bZ5BuafBFMvJYi1mBIg==
X-Proofpoint-GUID: Q1Kq0SfMXy2vOS4XrGjkRl7svFvqbAZQ
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1dcdff cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0JU4rCqLU3avs8DDqI0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

Update the QCM2290 GPUCC GDSC wait_val fields to match the hardware default
values. Incorrect settings can cause the GDSC FSM to stuck, leading to
power on/off failures. And update the GPUCC GDSC flags to retain the
registers, and poll for the CFG GDSCR as applicable.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 2150b94ad0ce5146c47ae21fae4deccdaba20673..6e696cf672923495c789055dcd2ff905d1761e16 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -270,11 +270,14 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -282,12 +285,15 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | SW_RESET | CLAMP_IO | AON_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1

