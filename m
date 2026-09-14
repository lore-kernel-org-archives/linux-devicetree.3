Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73812480953
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390147; cv=none; b=BwJ0hxAzq+gs6KcGjSpKVjzxXw/60xAUL0JKlZ7GA2gGWBSZU31fAkWK7vpPegCnPpRrriyKyS4Q7C4MSWq6Ror9PkE4FlHz5zuq43lHzog/Q5xBT10sniHrw4c9Zy+AXh/m0EcMFlUw5p+WDULRRaKjGqaBYvpPpAhGCQL8ScQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390147; c=relaxed/simple;
	bh=3PG+8pzZrRsl1xoLIbdwVtCtK9o6pwfuixMqEuKn8n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/BmZqFXET869yLCNoC7VDZs9oKL7ylCTnbD4gdlHMFXA7BrNHxpiFd0IM1L58ksHTfOE8B6Ruk2vQpVU/1V4hdOtigtUdPXexcdRACz1oeqdw9FV9+nnYEkGQORFMxArgmda+922Bb1q3Xhy2B3C3ueTFYsQ7iHCA8cmQhaTrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6sVG7wz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYfosXkw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6sVG7wz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYfosXkw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmLQt4032470
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=; b=o6sVG7wz+gYfZ45G
	bGAojeeRPwvrtQZFVP9Tdu2uzggOlvL7kfoWxrB7ai/W7fEiSJA5V2lO2RJBcLYV
	iwsDeR4g16ZiqyyTyXTpWDjXKvbjgfQfcRnAUGs5cXiQxoWClzX3a9K3Z73fMhfK
	HsGRo3XS2s4ANEphBXlvcompT9UMXumdEeNUGnczm3j17j2m40bzUqgOUVBezlxI
	26d7LKg/OmfzmWCgPGbwlqMFcaS+tgWwe807QDS4/ll4kwfEWNQi7ZKYkKDrFmtl
	gPzVNN8qi+7tUoGjsXsz2WpHsjXt/wUyITZOQ84B3AlkauTZLskmnI/iFyFcUPdm
	60Udow==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8kq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-792f917d31aso2705494137.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390144; x=1789994944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=;
        b=dYfosXkw2VK4ul2HbBIF2oqRrPNfeR20LmPwXuNftxzPjXAFtNMjTYyFEKeTRw3pcw
         Zo2paX462PgtpjBFmljCJhLn7PBESXZMxcOhyrLmjoBdMV7vvYV3gapMS55sBKqW46Qt
         AFivJCxcVyb5dMxDWv1a+CmoN345kSzJlLk/sUhRDqc5QtHP2+cvMN33NAsMZNbwyFfv
         bQk0MLnhwhwqkw9vEvrOPXfsMT6hlKKfsjbVY3YfuEvsbsHG5OWKrysWoDzot2XYOex0
         GFyB+L2g95sRer50c8bI8+x8X/nCGNXpNWAtqKoKhgK+ChdFrVv+aS4Wy4NY0FVdA8DA
         qUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390144; x=1789994944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/ympg6kMeMlMMAtCOGkGblawvs88Q3zczsXdXxfpSA=;
        b=AIkcf6liReEqnS/s7DTARMYRBMGPLe2qFbDHULQAl9YtOhiV4d2inYWlv7MqyJf4h6
         tZrq8riZHyu1T/YDMLE+cKz+CgTTl5mPw34lk/VMDjj0TmCpAH288wdpeVn8a6Djii9R
         tQ6e8BsGmxshK3QLBDBrYyZ5rf8dto472YfZ2ntAAQalBqNE2EM2z+bAKiyQL2+/VQRX
         ElLKflYGJheWlr8ej4v8urMDwBckfPTJeCvnUArj2UGNPewXBF7nTtMoYjUQVReYza+B
         99cUymFRJSV7d9aIx/5FmNbydMtdRD140omZQ4XcGEeK01ByakM7vNu1MpupbQEkAwrw
         /fuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiznHcokiX9mYVk6mco3Tc8go6k3igscjxP1SuiU4OWeJhXkxhQUcYA7PFTerNnmgwi0j9faLuI3Ok@vger.kernel.org
X-Gm-Message-State: AFuF++nG9mumbMzfhWjsIPEp5Sxn0e81sbbDe8186dRMTYYymogpWSxY
	UA8QAqbLKJP0tij1CCKMr/gc9bH58JScf1q/PDpKlg2y7Ligy4x97lwYYSEG9xcarlMGxzqmY7k
	h/JB0PMmGOILlSZW7hjNPOy2cSkv1WHLXk5u2p/Mm2WILj2w6KQwnSrwReKL77vl7
X-Gm-Gg: AYBFou2g0WVteytCUxIN4v+C8eFCUef7lCHwEQ8RgjRqtVh5QCnrs2R+q47P1Gpl0BX
	3/mScOlr4DU6TKWXKlrI+3FaZ8WCWP+MTt9LQ7BiGyZXJvXa4HUQ6TPzY0VlYJ0SXcfvVMYI2AF
	39bXpyA7oKVJ4Ek0pZ3+ie0oYdqeMgxxHZWmBDUXVy3dwY5WoH+nm6W1s0s6Pb0Ltx8rZrH3Sag
	cARAWdlfOcENR7E4e9W9b4GKma1BPXK48ld46Sh8FKXeeTQJNkHi9f0iY8hL7z4IMYd5pXUEbYB
	Yl0/0SkPVGFqSCUALfKjzCN8RVFbNU52zfRfCZ7BGPeF+6judYOoTo4z+dyI9IdRD3ATSiksMX8
	nMkmKEDd5
X-Received: by 2002:a05:6102:a1d0:10b0:79c:23df:6fb4 with SMTP id ada2fe7eead31-79c23df76famr753383137.5.1789390143679;
        Mon, 14 Sep 2026 05:49:03 -0700 (PDT)
X-Received: by 2002:a05:6102:a1d0:10b0:79c:23df:6fb4 with SMTP id ada2fe7eead31-79c23df76famr753347137.5.1789390143142;
        Mon, 14 Sep 2026 05:49:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:22 +0300
Subject: [PATCH v4 23/52] clk: qcom: gcc-sc7280: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-23-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=3PG+8pzZrRsl1xoLIbdwVtCtK9o6pwfuixMqEuKn8n0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zhUqYL4GQdIE1epatt//sFU1h1mpbwQp45O
 Q+dHaoYhjGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs4QAKCRAbX0TJAJUV
 ViJPD/4i9lM9z6lsNWsU1lZw29d4tEOhihEsXsZDJsNtUhU3YQyYyTErU1/22/czSoTWxXXNBU/
 rfZYgXjw0SOx9xCgEXIMDflKqEAZfwhqrqZqQ2K9PfEIN5+u7uYHmekBikeprvdFvEKynzwrX7S
 Xb/jnarpw+GKculPKBrU0B5SCf07nwJ/gI2XL61tXkODCU3fM7l9C3vfrHuN1FYstZOquw3S/Xz
 xWlUQrskkGKsY+JkvUmygSFODhJDiGRZtEQTSW6seeyOVNl//Eatoi/AiouubUfUIcReGZ5MPJ7
 c8NNW8RICmQ64lp7GdCfZGQ0XGaYdOTkoartcI0be1tojXO2espTVpzvkrDMJMslKNK8uSg4l9x
 Nhz4ooJ1FQ6bgPgSsglXuB/Quyaf8HHY8xBp1Ac4C/l8IG1UOlJQx2O/7e7FgoX6Up1MLSIPwCK
 3vT2qBX+FdAeqBa0e38s58QNNx1heYmdzG/oqXwmzZPOi7Djok4SZVqSv2YK4Zpzpf9sLWzv3F/
 a/c8Usm0Vemw1OcHZLkVLlogCWfjitffUWNCtcap/nzawWjqNZQPpW7TBENTd0OTfUUwx2vSsPu
 SfKOvQ8fmn8Bn7CyIeuovIp5qux3tUjEHRzFZNSF9xkxD74YpPfnQxLo00V5laF3F4nAf6pbOiI
 Vvohb6bDN3MiBoA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXykHp6h8sazmL
 mAOqOYPYHWMw+HPJNtPTNm56+XSmAOfUQ+V6x+bwj9KwpRhJ/mfklAKWAjXEmiKuTtd14ajZYgR
 xhczG5qcw//nCQa+e+92KmtxXGOFNXIfyPTOiEu5K5aNJR86DBCyuwCXnsGMImhWDhv81k7LebQ
 MxxBgdo5qQWljKLAWycMzCTHshgEakMbLCZ2yX1bO0utPMDo26dGtHFWV3ntPQuaD1vbdXNQoDo
 rbeiSBxkSB8Pd6dQg4xhiII3/KsIsubycQPBb216s86WZI81j3Dtr5WLK6ebAQ/dwK0vd83rhWx
 +RrOSu6QFZA7BWNdnAj1TMlLwhqVBu/25+Sb3TNjKl8fTsMSwm2QOij7eAabTsA5SG/46EXRksh
 IKY+ulcdBAk6o4UKO1BAxQNsE3dl+ojGmtcPenTKv/xBbWJFEPOnrBdqHn3zolYAr51DoZPgH6K
 xbKOlQCPxA/IphsYHdQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7ed40 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: ABqFBX6LzpT-E2pbU3Yi8hbY-vOo197C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXwJyjs/Rb9TLE
 5kgiGyAnVmTRoa8bwlE4DmhtVmDbFoyueQDPYOvLk3zZ4Aj20zyw6ApoRAXvjq45XA/dIu1n7au
 VQZ3gVIA4lQbFFzjwQ1M3wEREqu/uI4=
X-Proofpoint-GUID: ABqFBX6LzpT-E2pbU3Yi8hbY-vOo197C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 4502926a2691..bb8f6efb88b1 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc7280_resets),
 	.gdscs = gcc_sc7280_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc7280_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sc7280_match_table[] = {

-- 
2.54.0

