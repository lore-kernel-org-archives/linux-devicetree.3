Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E664562A1
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246455; cv=none; b=ekt1hHpwCMHwrdZ1e62kFsctqxWByjgdSheeSFGTVLsPltIqIz9lLsYMaFpDuRtmC1BtdABy8NKk+ZED7nFbHBll4VVzTYHNbor+05r0I4R6buB+xqRq31qRQVYE9ulropXuhShMOXkJW7eQkMm7kY/TPDXHVsIW3qHlQK6l8N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246455; c=relaxed/simple;
	bh=252SuBWkTFQUaNmgwEjoBdG98eVOzYs/Rbxfl8e3N5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BA9Pnn1rdZZ45gENuDglv4/fJsxo9mdrwUrhwNOT8A2W56KSuMREGl2iFkVMQcXfEmcwQacGniJB7Wpvvy/1CLZN8uazZPUJ7Lt5Cl5m8wwGGr0eEkWfukg7bhOs1y2mJAGR8K9/a4CJpYW7KQOI32A3dV63zEzSdnMU9tHY/L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfPGEmZb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxi32fh6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfPGEmZb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxi32fh6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Pmwa1644184
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RLcXV2PFUspAL4t5UC6lEmS7T7l3SwUB8Kze/pYkXI=; b=YfPGEmZbrLraYFiO
	+nSKk0OxZj5L2NtmiOFgVV2jc83Zvqlrj4HsA2Gw55QYPNzjkEKx5CBmjUy/i07w
	Yol/Ac92nagbK+rQxQARtXKLWW984OMnedZ5w8mZBeEXFsueB8IuZarjInLP+kZC
	6I3dgl7yPV1GlqpcSr9UuowW3ji+QfEppd8Tju4/5QT6cRcBVB16uizfZJLbOU1+
	dK7zBtTCHJT6495AGUm+LE8kRAO8ivbi6UFvw8xElMNilBk/4COMYJy2QodtCqB2
	Ba6glTUKBMElwtt/r9dS9weG7uImfCsSVp0jH8KacPRC52y/nxHQC+SjhVt0T8Eo
	AlPw5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrb3yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso401682585a.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246451; x=1790851251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RLcXV2PFUspAL4t5UC6lEmS7T7l3SwUB8Kze/pYkXI=;
        b=gxi32fh6c32HJXiVL7B2M3IKvB/RaciLPtvXvQNM6BxIKz1PabDAexf7F7A5rvA/PC
         crPBLVqGlnc4ZhNnukiQsPSEET+lapTrB9Y3oaarnauzh61wLE7bdfV+7YWbyVxqOKqw
         W3+q20mydRs4el0G/O7KbHZgmDDZI1rlEYy2QHeTaV/LxgqegbeTRhy/MIcJ+ypZrKRv
         r7ysPnbfnn/hbhg+Kp/pAGmaMo6vmx0e+WA1AZqHZ6tYRrKtrtuR1O7Z6aQ//HSGqDJF
         I8o+SLVZ99rV+ggYTGSSJj1+1Nq1U3G2iQ4ezDjvQBHpQW8CbdbM4ilNaSz5Vu2M8HEG
         uuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246451; x=1790851251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RLcXV2PFUspAL4t5UC6lEmS7T7l3SwUB8Kze/pYkXI=;
        b=xmMjPBz7q0dM+w4o3ySBur9xfOgAcsAhyJ0BnUXMB1EAXr56NfrPywVQwnltUvRIVG
         A4qtOySfPbzCAKibkRd5kJuEx86WIwKBuUjbmyixMKLycA8Fl6PmmyutNLME7B4phIKS
         OZF7tOFLr5nEDX3YNmgCb1CGhqrxaR02PICUk3i5lHiYEkJCUSFq3OwaFvhoWnbUkHD+
         Ar9J9nvYjTv9LSJ4081JcTcmOzFXai467jiZlZ5CvIbXs9F7NjSTzpMSMsfYSF8QOgK0
         cbFOntSt6dbxV+SDxv6zgJBCXdaETJjj85b9VawCQ4UmLgln+5aeqIIVEQMAq3u9U6Fj
         2Tjg==
X-Forwarded-Encrypted: i=1; AKwUvBy9+qVNlEitx2TLd8v92hi8EY42yBI2EALN6WAPA4BnZsFPSY5KCdr9S8PS3ixyvK+nUIZHCm4Dz0dO@vger.kernel.org
X-Gm-Message-State: AFuF++lQIcsTbMha1JQ3DLMlVkaAZj3XmmjHDJ7QnY2oG1zkjXjQ7aBP
	D9D4d6BSl5wd/hgGtaKH3C9iKlPtiW/i8g5AoxbaPruMCfbZmdc5ASBaNVTsMht4/tOI6gkd40R
	9PmReJvgUnKuSIBBCmptJVzfGjKOnEa2BEVtxXAue2tGsFFj8tedopIkGkndMMpaG
X-Gm-Gg: AYBFou0/Y9TYiMAJLpxrHnrzNDdYUFd8hzyaMCrmSKQqEWGNxZzgEL0nNTQU0xW9OL9
	jhOKXdBEUlUtlhcIn25LNetilA2nsUgJNS/z+R8Af4N55cg0/rNMH5fPkDnQ2jnNslQfw2yQIhb
	U4FNTrhhC3Kgj9d+/dWHa4fs/Ck6FFUVfLWTYbLAdJkPaRHCCXg9RXt48zwZMTsN71xxZukEWLi
	4+NFRLCvgOs0YBubYfwQbOSgzqimTXc2aC+N6Bc6RrPoIUFa22T28nKSTaxjSCT7EF5L7dfnIDc
	lSemiNQf5IdlkcOf1ZoHl9wOVSeA4GNhbQhIwoJRoxm7t58H9wEaq+TXoWl1nJ2saXSsCRtKjvb
	O3VvjrLP4
X-Received: by 2002:a05:620a:84c2:b0:939:d459:4810 with SMTP id af79cd13be357-93c3628444cmr214566585a.26.1790246451232;
        Thu, 24 Sep 2026 03:40:51 -0700 (PDT)
X-Received: by 2002:a05:620a:84c2:b0:939:d459:4810 with SMTP id af79cd13be357-93c3628444cmr214561185a.26.1790246450622;
        Thu, 24 Sep 2026 03:40:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:31 +0300
Subject: [PATCH v5 15/42] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-15-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=252SuBWkTFQUaNmgwEjoBdG98eVOzYs/Rbxfl8e3N5I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3oWwfGp34JH03+eBeSANU6Tc4ZJl2nG2Wh5
 9XN3zLFBCOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT96AAKCRAbX0TJAJUV
 Vu32D/47beIYVfzSauka+DrKi0+iOEAPyWRMXRgMCZ4Ux1dcmlPATVAj3hSeSRF0WAdBiSoe02d
 cB+dcdhZQCGUcjEHiafbxb6dqUJDaKpJUB+F6bEKfTkDDwDfuvRyujhk2IXB0bPKaGGDsNky4uu
 CLrAYl+IXzvGpkodGZ7bf/+pAgCq8VjTwLiZE3jsNIUacCRdCR2KqXt1zaWV5uON5lpnI7ViBpL
 AcPykkQo6CzhcmS4UrPHvJo36cawlfRKfi3qFa5iwrIWiOKZVbY/6CdpsZPN/W2d21Ejvps7sd9
 XZUS9mW4HfL3jQ9vRv4hEEfEymdM7aUvVrbOsJ8BPZGB1tykZO3G55hlcKZ7OjaibHOZNuKRT2p
 ZyQXZ2yTS/cQ7ieIgvUvPdEBzQEsFP3iMLyPPNt9EbuaBxOwmhj+OB9sVr+1XCQvOVs1Av3TMVb
 wFOtaPRaqz6H7177ib79ZQtJA5EsnJkGi+Cwe2+FeH+2ghKnESGnJ511LVYYERyrXKNGoCawnIs
 WX5lL7rgy9Vqx3aZSjha8A6hp8XBuzRFwHJ6HKL+J3jGN+38biNLK0K8LapIl5Sc7xrJ0cDqQcv
 lZPCCAovmpnouVxmSeY4RRBX948NF9uH3FvtLGEkngFrCNLJabpMtc1xdtPlJH0ZOsALjkEo693
 sz406ntWVa4Weag==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0UQwt6wfzm2M
 OSgqIPWU6h+r1fzddaZ0CZ4JNicejS2/iNAgBQRGl1f316+lmMMumUXOB+89qeGcU2oNcE5EwVO
 7MB/9162CGgmI3fsIKTzZCJML8jXEJk08LP2RseGFLKjF+l17SK9B9X169cwMeoVuWfvoTfuMTs
 HqlJpjwIJBeoz6wZ6lZ35xfuuxHEoaoHPH8t0jeImsO7OQdDihnHWp67c9Uq84pvMWMQCwMzoCm
 Pocg9XdTO97ovG/YbWbGgCTgMREbTkOv2JrLiEb/MdjgyPHRcVnyGWahBlKSLE5/De8qd5tBs58
 5dsuVqUlqx+xWdEOGzoa1B9KjbokNltqfu0Q5kqCDJVc+MadzOszrhurcUDTUR5vkYDO011HuyW
 efoZrI2eAnfT+KKGK5RIdz4n9zzzm8A2py9phc2QFpv5DJB4GSnov9dYQ//z3tbFp/v9dkIlfue
 iiFi9bahAIfXFtvPGww==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4fe34 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0Ie7fISObS3p
 /Dw1dlyAUEJA1Zu6bP1f649Z33g4YbRVqOYuUxy4LQ78fNjeJzWUYIgYOnpPvRlWqx+U59SWvmw
 BlPadAYtep2MQfCSJ090zUNqOhSu4zw=
X-Proofpoint-GUID: yt3-dXTdv9v0Dak3lXdC2qjyITealgG9
X-Proofpoint-ORIG-GUID: yt3-dXTdv9v0Dak3lXdC2qjyITealgG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index e310b5c9b5c7..c9473fb79ccc 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

