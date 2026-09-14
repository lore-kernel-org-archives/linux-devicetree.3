Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C4448643F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390179; cv=none; b=dD48KKJU1Lf5UcH0ue8MFq4nAiKNAiyswToeNn/zaEt7c57freYA86v8SNhlkvv/czoOTc47/Qi0H0G2eFyg6L91t7e59ONPFbdLRJv8M53ME0pPEs9IXcVcKD/uYPNlfEyU6elMqgb52vN3qv99tLYEqU3U3s93ZIep0KnsHaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390179; c=relaxed/simple;
	bh=/QDZyzj1YhNu+3o+yIlkvjaCi4FUUlGCWA1/wOTJSk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3+n7U5DcokNEINiesvvfS5rl0YSR0vnr7aO2B5lRDggyVUyGnYtY6OfM3o3I6RH0xXVENGL+cTY3cmKfQPC2z3yTqzHreUk51E1C0T/T3pXSs71dvFoB2l1/oHkrW2XylQ/xmpa+jlifQsPUfo1YrjVCK+iaDmVnlKdAKwTQsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXebR4LT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7wAA7pj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXebR4LT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7wAA7pj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmB2e377916
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llWlb90xKeMxVzIAjSLd2p+SRlcwxJUGsCdo8hbjHIs=; b=YXebR4LTdLqrdMF2
	pQPXnDlgGpWtU5Vuh0Wv4GxqruLtaZFjQEAZmD3W9o3qwEqC5iC5A6S9QccSs8wp
	9hgv3RI7cLV6VaZZJ3ic/ieofDVKwJvPPatxzUXa3sgeC300kf6FSvJU+QH2Bqi3
	/tG/mSwQv0vzaQqmCrg3rqWlErPZzvGlWLusRBKQZ48+S4ja0f5sIPFwrKEjPfmS
	5hN3QLwrT/MtdfS+ZsdWzrSHYrC5KCtTNvSwxuJgz5jocrODXU4ItztRaEGJUL+B
	tANNvcgltbGzQIxRL1+LrNfo/zjCPVMAvKqBmCcF6+CV7wIf6rHt2QxW9MZMeuWW
	D3fl8w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8qgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso442967885a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390176; x=1789994976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llWlb90xKeMxVzIAjSLd2p+SRlcwxJUGsCdo8hbjHIs=;
        b=O7wAA7pjxEQelW3KoeSp6MUVueO6J6mhygYNhIKSfx1LOGgnDba6mifkHOWyvirqAd
         iXRej/4lXI4f3qAz8wFsaZcLR7AW2PigOOdA3SsZ/e5YyobBGw2IIArJzHiUsuqGumxF
         3I8Ri4Wxzk0m6vVwbf9EO1fxSc8soIUZZuwldG+yZDTTljjMgRDCUVQrNOVDqKh0PrNo
         VXhBirxVrOpNSmshgwfWTf9Hu1q+5hyq+4RUJG6HS71HCQtf9gC9n2bwfIihRoMK59ri
         unga9yyZM7jjE4nohD8kNW0oyCLw4qTxn3LlnijR6/tly2U4B7SYugE5kMhcRov07+B8
         QNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390176; x=1789994976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llWlb90xKeMxVzIAjSLd2p+SRlcwxJUGsCdo8hbjHIs=;
        b=S7iA1SFpm3IkEzBgDQEhf932Kgxv6N87m1Y3KNKGafQ6QHJCaVdnv7xdYjd97T87hA
         dPAQ/33VoELBHzaXdhFmshhptiBxhW0A6iJ7Bfsfg5oep9lkuLVulhamCqB1tiDA6IQ4
         SUNhYqUUI6EgfZBpeaINNnMuD7oQX73URuzt9o7q4ATs+foIMXT+IJhGx+RHsZVPQ2Tv
         IqogRP5v6pOf3psr1qqgvlqcr8T3DB58JlB18LRngejayf2iJ9+hS4QGyv52dQsqM/5W
         YBkTrYCMsZXpfl85O5twnCe2mmdIENUL3raZwswbQBNFAr/pqByDdKgvmJxZU9usrMg3
         qL2g==
X-Forwarded-Encrypted: i=1; AKwUvByOXY6Mlq7q4hDKnkpdUEOPH6MnREi2x/V8DDPaAHvVZQuLpjn3BET+vHc769sTu2fjhn3V3VdpNWm3@vger.kernel.org
X-Gm-Message-State: AFuF++mxkSPdLZj9nCDMaxqM78Y1ptHBEPKZ3YmfrkVXoRwqex9NjPMm
	GaaOwMuc7kZ+JU5o/cRm0tmyvTi0Yj4Bzf9V//T5VVfFQV3TKU5hHrR2Pl8OJz7KFn2IDYb+FnI
	tTH0Zg2Hp/BBUrdQ/JoapjmxsujFJtg6ASJ5SGB9pVlLrxIO7FU8RxD3wUAeTCSlN
X-Gm-Gg: AYBFou0ASMA5MUMkzpxr4woP1thnD4fHk6XmlSiFmRr717GjK2Buq6c2qfegM/uFj0h
	VWbuQeHyUhzwhfhPL73QwWR7WgOdRHmm907MFk6IZv/l9hFo4omtVFVXs2PVr9YNoy3INVOI6Hv
	Q+OVLgtQE6dqZvDm0vjRfdJo8QS61U9naZ8MwJoCMhbYpNV+Iu3K+heOiJPy9lu+J8bqMbD1oXU
	/JC6xeokvzlfHGMwnW02VpCcfDmPfCM3OscSd2ktXnam0UcStnjky8Uf7/XA94FSAl7E1FnHy5+
	yWR93dbNLIW0ycXz0QktkOQbXrTP0Kh9RV6jQGIsJcIUjBYDHZLYOFWmqZxicTHCAbQ4cZaizoW
	Ww7bpYJbt
X-Received: by 2002:a05:620a:4889:b0:939:a9d4:7022 with SMTP id af79cd13be357-93a297592admr305442285a.8.1789390175685;
        Mon, 14 Sep 2026 05:49:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4889:b0:939:a9d4:7022 with SMTP id af79cd13be357-93a297592admr305438485a.8.1789390175179;
        Mon, 14 Sep 2026 05:49:35 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:34 +0300
Subject: [PATCH v4 35/52] clk: qcom: gcc-sm8750: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-35-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/QDZyzj1YhNu+3o+yIlkvjaCi4FUUlGCWA1/wOTJSk8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+ztZW8AQV7CHd0vnuLy38NWsArYKLUDxOh1i
 8XU+9QM6tqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs7QAKCRAbX0TJAJUV
 VmxXEADDbzJlzxRO2pY3gCWqX/oSN/zxbe+Owy4z/cy3yOiFM0fv1QGFFKMKHYhZh0Fwy9blebJ
 XXfJI5YQRgShzI9gebTPy8e2vxAH1XiuZXjwwK3sdzx9fzGChFJcLTRKSsL0Be/FssoT2Lx+Xcc
 IiWXdktjSe6gVDFC+SbbQBZsOhUXnzuh+FxaXf5I4kBwbEhSGzi+ygi9NWMTKIbvJix6g+C/MF4
 DU4xZc50bgC5vM9/0QRG9ayxk0Ow28WfL5i6OeAKiRlIvTJTybK//P9TKyB8kG/8DZm2d4wBC2+
 0VqPNd+93X8Il9QqZciqLvS6t1E5yRIK+v7OZqobTPLq9jRLEwT6WKexmcGGvw/JKHt/jHNN0RS
 611dgwF9ccpR4y/EoOX0wlc5L0qx6EXX6zQzw6U4297FdlLuAmUIFRVQw4irsU/3clHqMiVwGqe
 aDSwDzQ2mAmXwojlcq5czUNg48kFqimnY5Qtjy4/0FhKuqGhtM0WfW8QJcVg5ld66sbBL+etDtv
 dVRF30nwro5BGfHgzgK3pMaBMSdbN/mn+sceYVhKYCXRGDf+CVdinmeyTdg8O/oHDTK4VGW7UaH
 RRssJ+GKQmkYLgQ3R7+YrdrrfQxyYPYfVgycOQCH9oKxoHfMicr+xTKKqt9LJFs+oeSwORulzp7
 RMt1xrPH8LYXNwA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX5r932hoTD+vs
 ymvhYecJNp3oaVhjaI/MwPz3Voq5hxfnpkQeqC6mea5DW7kfTOLvj/+CDn+QlCi7c+dimvTz0MW
 JF+qOXPJfxn2p3No03PA2bSRPEaj2cQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+XwZqqEy6925
 7OGSwEhE9RkKBUr2HFpPrcW3eItJkrMaKbhGI+nnpwhwSdn6e/gmON/CTU66yws27ru2AGmG8XO
 dcIB4Ai7b6LS8ZNqjQzudrFMqs4ktH5YZxgHQH3kTMY1hOJh0sQBIiOGSTSfQLqEgBTSKl34uOF
 qqPbxNU+fwyBdlnBgVeGNztBZCXOIYZlHWQjJPgO7qQFugGb2eGYXgZJTuZP7UYIL4Rg0qkWwoS
 M0fEShCTOAGDxAEVx85SMrPWSmI3RdDv5X3TkQaimiiCgKU6z7B62tj9TOIv3mXkmfLuTDohBHq
 MrBkAkLXxr1JmYioGrVqcoEngkXRZndLyBTa0EPH8yADusyIvYOoNQ+JAxfCjTAHYA/WyHRNlVQ
 LaZph//FKG1gzI1o5GdmUaS/atHB3/muX9V14SPx22i4zasNU1UmSxCwEKFm5JcjnDARVfjdbAz
 LZLTVbJf65AwD5YlRrw==
X-Proofpoint-GUID: rz5upo-1IHA8ZTlwkxzuYjnnGYkRTwUV
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7ed60 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: rz5upo-1IHA8ZTlwkxzuYjnnGYkRTwUV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 6cfe90122268..f25926a9b69c 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -3196,6 +3196,7 @@ static const struct qcom_cc_desc gcc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8750_resets),
 	.gdscs = gcc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8750_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8750_match_table[] = {

-- 
2.54.0

