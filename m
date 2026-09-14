Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5E542A178
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390204; cv=none; b=CiVNkdC+Ehlx5GelQINSNeJHSNCKM8IodMUveqh2hLV3jcL06Radr8w9g88SJoa8tzJuFELOGWMoRZc9CFzcPpNHF8pNfZ9wfjUp+sQir8ow6admL2n1Ik6eNLvQGvN3L1E67+bo6la2cI+Q6PYtfLcjTXt3kL5Sqt9RWD/DRc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390204; c=relaxed/simple;
	bh=kwmZWbieObu19HJwMat+En2+qUYDIaJNELdrcvjW9vE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ueT2PObXA7lXHYGln5J/5mpFvtdNv4vI2aviqoIEZR40cdXWrzGAopt2nIGBfIj6gQlVDIiItIDpTlIwqZPL1A5XVkh2VjiSbT5K6ZRbkmyiCjrw9vgVMWyiEiGiig5zmNBkDl5gHl8OHhm7Ce4Qx5yZbyu693lANeRfH5t/g1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEmDD/dn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoEWCnSA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEmDD/dn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoEWCnSA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRShU407302
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=; b=VEmDD/dnyRwC3C6w
	5IIWT3wScfdvXPuZESs6wMODG/sv7r2chnwFauJen4MlXV2JAyk/iym88DG30L94
	5dUjEshht1E5syqacFjxhhwztIwGcDfF0uq5y7nGWvp6QD0Nhcj6mYHu4Yu7Zs0T
	nU0YnAnM8tgirxYpMIPFdlcWfOUog/BhcK4uK0vr/DFk9V8DNm/wfL07oZBT8fID
	fT7SV1ZmqI9lwuk/zP3uA5fXguTuWQA/8EQndpNi21N18vGnHhwsEVnGKN3pnDL8
	rwtfbvMH8DOQmHzUmwHa8aYJG3BZuzuke/dY/UZ7Vn4XImME4STZ6fkYEISNSfCZ
	hxTklw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr8fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:50:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so601599785a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390200; x=1789995000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=;
        b=ZoEWCnSAez+smscY9jhbMb10C3rH9aTDkugQPMDMRhfOe6zSSFaRTY9Kz01Spi1qBT
         FgFCRwQ0YtjtCknpdXzuUO0V+fFxAu5NVGxNtuobCgOo1Py1KbaKnre1yuLaj9VSS/uq
         TyOPjpI70fkA98oZxJQjZkfsntMKRDjMxeWPh0/YTJ7UGjeFmZykKNpWXXNxDBshiAim
         dUsbQIjLdKcwDcZe1CRFbSOn8S86vtsdG4XS6vkQti6kYxBDrOlNFwgVGmZYB6o2Ix2W
         v5KHERbaC0kdkaQW5nYmCl6FUg1576fgsZppGYbHm42vl7hWaTPpHodbm8ax8joQaiqX
         fbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390200; x=1789995000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9udNqzS6075n4aY4trAVywiFn4/XhY5ESNd4vQ1FkA=;
        b=TT+kcNbg+QK1qDVrJmCEAD7sLkljgmln2bN4l83A4HO88rS62ng3Q1d2lubJ4z8pkk
         jWAD1m5LGe2pLyv23Egzk2GMUkkZwhgCGP9Y94vkCeicurR10mgk8eH4s8qavu0nBsRq
         0009E9kHvgubWkkX/CHQdz/A6BOwm4/d9uHqIaWjuRU6GkTIVym53gSqxemY7tr63Nyc
         Fum1a1vhAMXngpA84eT4ePl98/yq9YgLRvxCW2e04690EmiLdYGlBDnrZEtGFm+w+Oei
         muceJXH0nQAiFyT7XQCUKArKg8B7aFU2uE1qC9mFnf5hF1n5p05VQDrXhlW+AgZfreY+
         fnHw==
X-Forwarded-Encrypted: i=1; AKwUvBx9+a2ZUbT4pcJUI9ejR3m7bM9ZcGI+3xwTYoiyqUGFb40YPmU7FT1swpLIoqviseNjpP2OgQjGEzj1@vger.kernel.org
X-Gm-Message-State: AFuF++megoiQ5AaAKmjaAqdmgNxgfC0H6/F6O4MJFfyVisaG1f/8ALH8
	kY53uDpxrmPMd1tKGKKi68GcWkb4v7ue13uNS/MxJTXBMsXGzPkr/ifNzm8YorpxFRM/6/dpZUr
	pkhk+1ABxTfMBr5VmzXr4WLk/mPrJQ+D6zGkqR0+k6+2/SrksrMIk4EuWyfMIYOBW
X-Gm-Gg: AYBFou0V4ufwc6O4aBxShvjDzP5Vy1itwiNlAs2prYSSuHu31sVkSrRhTRXrwHRWOGd
	HEwfDL4Wo4DhG0PEVb/oWLPLOoafEkYkG+dC1Er/Uxs9oX7epqy6sX3OdSxEmgQptHLdhcTXvJy
	A317xFFldNTdWX6l08tshVlH5jR+3xXi7K0oSqttFSqR7EuDd1eyAMnLYc997fNnu67bIVKJBaU
	5DC1LGK7t9Mkuw6TPQVXWbkkh0UU0cwrjljlIM0SB/JkyzhoGqtuIYBE7zGa8ZXCaQjqYeeGYIZ
	FjwGqtUbLIi3CZoCGRovj96VJkLpUCwE1uc3uwYNNfkkMEU+hRySqWoh99cis0zcP6pQLM3wLTQ
	tkDFVMP92
X-Received: by 2002:a05:620a:43a1:b0:939:6db3:6cad with SMTP id af79cd13be357-93a2975fb61mr312435485a.12.1789390199800;
        Mon, 14 Sep 2026 05:49:59 -0700 (PDT)
X-Received: by 2002:a05:620a:43a1:b0:939:6db3:6cad with SMTP id af79cd13be357-93a2975fb61mr312427985a.12.1789390198941;
        Mon, 14 Sep 2026 05:49:58 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:43 +0300
Subject: [PATCH v4 44/52] arm64: dts: qcom: sm6350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-44-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kwmZWbieObu19HJwMat+En2+qUYDIaJNELdrcvjW9vE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z2zmUXCm0QHKUuJH380N2/WzBm4SBX+dCc9
 aKvCdEtj26JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs9gAKCRAbX0TJAJUV
 VhTzD/9EvyfLjevZjNur+y6tg8FyEyj/I/buwQFZcFclamb8CwsvW1GtPyonOvAkUIGUHy9t7NS
 X4ZUqtgoJhuThsTs7nJ1blYHpzzwv3g5UqPNCHNgNi8OSohXJXqgDSxfw92vL57Kgm1/at8yUlz
 YdY1EDJKvVEWQ155iLWyvs/YZCF+itM4LWeSi7d7vHMbCYNhndJ8BP0rUEWX3YzsKJPzGrUWNed
 3z8lxRTj/GU7+dljvy6d0S8J7lIchp58mx0pDOhQ9eKZ4ymEf0/SyWCJ8lmhEwjEyYm+39DNonN
 0U0qUkcEeFy7od4TUvMJnIDbinzDp9mRYMwIMFfiVefr8qemt6AjQNBq3ytQNau99qLz660YbM7
 W4xu68gisJEf1eUXc2xaCfZHwwao3aBUwhUcE7170I0Fh1NJOmJ2M/sBQmt2/T/u/TrxX9Lups0
 BwWfcw/PDw5O4ffnYKqBPVFthMkYhNPwa7da8P+oHJoIHiXd1njrWIu32sJaa8XSzgbpdlHgQnA
 WtS/+8WD6Xe3LMmL+p1TRb87lGVKgzhVO7ZWZQyqyPw0M4X7oKfznDt5pRpiwVa3irDWko/KtFG
 Ea1MboW4hwXiIGJXq2cZu4HOlNStzQ/GTYscFCtQ5TJ1wvM/6hxhPzBbJAv80j3wjbBVO9Oq6vq
 UMLLN/qZ3w4JJCA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: fXqGyHdYfKzgYuU-LC1IseCJD8dcD21g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2PtFKgIWr/P5
 lLECUbUkeeUjZ6r/+ApU8f8dpGvLH2M0BZm916V8gG0Tf2nVXPm/IMEHAJHPECAqtTLFLVbfQqp
 heu4yYu1w/frwdS8kx4pBLOlqUZsEP3zO6JaDzMS1HB7zRPVsxXRaIFafqw73fMN3dpumdGZ10j
 J9DitGCNYzNzoPo/LP2aRhMhFeC7ZVmJJCpYBKqGx5QTb0DJC6ASGX2wV7E6PIxaL3XogBNREQN
 HorFmJxCZvghJaNFV1fJlg63NpYIKUUDDOD0Zu3g+uNGQpONBFd9jl0wfbeB77SDfvnPq7xyOMu
 YS4gZqE4EUbDZgr6C2p2fD4xnKk15qpPF2Wl6fCMO3L9AeSfjrWFPvIF9yHH8zhL54GiNv+dDbS
 2p9zLh6rC36OCGt/UuhNanHcb0LicTVwyhUuI1wRmAQnwZsgy/CxwKmCCHfadmYmv5nX8wNnVcS
 OaeqmsX/KDxuu6oK3/w==
X-Proofpoint-GUID: fXqGyHdYfKzgYuU-LC1IseCJD8dcD21g
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed78 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Z-KR3oKqXnE-yqQhW-kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX/T4+IRdcJFnT
 sQQy3YKz8u7+OViBqXhYMDSe49MFJ8bc+X7WxB+gZM9tW5f6rY0PnOMcN3+W0fDebF80pNcJXSL
 lxzF/LPIbAUJ6EI7Nq8XOPgCLSt7eh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM6350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 15d38b7e803c..ded5c3a45891 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -794,6 +794,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SM6350_CX>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "sleep_clk";

-- 
2.54.0

