Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3211848C3EF
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390194; cv=none; b=d7ZqUnNr3kYRaCBuadv1AIB8a4dzar0OxjknDcbXoVtzaC6RaKuoVn6KC3L8nNWm17M6+EEjmQk/Nrrh/EdY2kW8tDE/a3/SiSe3n9F3RjDcn225pt+RKuWL3lBLDxdQs/vivVNGzgLdUOiVmMv+s4nyu9Xxt/RwAn7qKAOlxak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390194; c=relaxed/simple;
	bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsvTm6/AsytuMz/4v8gLkKvLkldilfS54n/K/ymSx2G+PakhtAUosq8himf4yUcE3G+4Be7LpCTNOBZnwCQhwP4/jI9vFXu15LCSwUBqwSQuXtoiCNsG/PDougCHTtEOPUH5TR0kZ3dXcUpOsji+kJSx6zXjCdqvRth6/LlBaN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zk4OqhB6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHZxune+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zk4OqhB6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHZxune+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmLXa4032469
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=; b=Zk4OqhB6sbEhwU/u
	q6TPL3/K8OenQRLsN2JqxvvwUh/NiG/Ji8B3cxf4Ad8d88CrNVwTtJ2f+Z6/H4aC
	OAZfiQETKTW7Ko4T5B/y5VGo8on8odD7a1cIie45i7bZRmO8AxSKOjg5bVdKpVeL
	ZR94jrdJNgksbofeXgvsv7BsfqnCNsoawLe4MLwtukC5r6BlbdF3CGkjh4efbS29
	Iw85XGclR1q26z7Dd/KduJ0vqTnp0CA1kM7ZMWIb5to5jMKzYEIex1ip5mPEC+KH
	qbVvrMld0zo/sJajXXQt33mNYVl4CyPshPn2q3gdQf5x9QhZ35mVSB60G8K+11BX
	uYdHDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8kth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a07b5b5efso305271985a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390191; x=1789994991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=JHZxune+oZMHQKtH9R4P7kr89KfjtUgz0AAzjmpObDdGSNn3IoXBjXKs9pSjofgpXL
         Pxi9QITXrnpD29rrT4dYj0E2fEJxyihzffD7sW8uijG9auSZkT9bYxSWOnXrprnYdto2
         pvMbPVocZayPMSD7xOmpusUJlT2fUYlo9jbboCLy5snGL3mqA7pyvxrSAg3PCVu8qITL
         HCv2Bae6nl+N5F+Dys+araHRh5kaQCLEFwD62vzCXqzBVn3HZ2saw6TmobefXLmHsnX1
         /psET0i/yMo95rn3HyrISh9t4kp2MqkYiPsISfaPqR1NzRsTQXhO3IToOzpkZ1Nw+4mO
         yWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390191; x=1789994991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=cb+sZyTOQBScLEHpGd7Lid7L+Xvf4BUjz8a8gXGe8PJBFP6Xgp/IqvZqCuiXRPBayN
         pdpihgl0FrjgLv6C+yJ/cA43ai/NeShUBlXlvYVf/o9bwowSOEKsFS2Qgx7Mi1UgiBi7
         CKM1zYzsgo19MOvfNjCYnhz/j0GYTG1lTeOXWZj+wyouY1VzKIQBJeZVBVAnpLIRYrsx
         WjQBls3+DdqMoF1QfSMGXkHMAriERKDsbbMtUgYnaIwrHCSBPPDgSI6s1EUlxN5fkBas
         sNFri4pAwFC1VwUAc0UbY+JiqNHmgZq5S9LuRnPPmB6wEBE+UQTmmGtUT6g/Vox0qRv0
         06hw==
X-Forwarded-Encrypted: i=1; AKwUvBwuz3NCZhu2Gp8+2BmH6MzOq7WzRBuA5A5ag/QGLyFo1tLYXjfJlA5xI5wrX4qUuOucWfeblEdZCpUW@vger.kernel.org
X-Gm-Message-State: AFuF++mAEPjUeWT+Qce5ObxIX9RjOo+QsnhycpW6w9D8rVU/4zqjjhlw
	Xi6FUeUAJ9FbLcZpaUJ7nEx0lN33J/2cjccU+PBSAb5Jbcgw0ZUJS8bUPvNWwfttkv9EH2200p6
	6fYrbLwInMzBgkd/ddJpKQrSADF3DQRzeRQP47coyt9vhmIyAieIZiseYMNaGS8eNkvpI6oIW
X-Gm-Gg: AYBFou1Ukw2ZeYGApHCWs0R+zqZYEfXgPiAX6NKYS6SMhCl26sAPLq7uahl02y47ZIG
	DnV/DR8HsHgKE2yaaCM/OcdlTIQZ7Ent57vXqh2JBNenBnw5dxBGGYUzvk1QuQJqrqMbo9kPAG3
	F9kSNUpJUk3Tlz9JfsWQ619kA+HhmWaPqr1821flaz2gqSLjqXPFMvaq3trGSSaTq2CL5MrO4rp
	tFfiS4cikLGcwPIq/B1/Sd8+DkdCANcBDVB8sOPOGF0Kg8Z3/MEeYZ6FVqEpxnanu5DYYpVWptL
	Ik7uNqmOhpiWGN2G30R4jYsVVD736SMUeE/cs0X2Cs8DcYifYAM7QdbMdU04yM069S6dkJ3mFO0
	/0ZZuNqSW
X-Received: by 2002:a05:620a:4491:b0:939:a9d4:7023 with SMTP id af79cd13be357-93a18551856mr663156185a.10.1789390191440;
        Mon, 14 Sep 2026 05:49:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:939:a9d4:7023 with SMTP id af79cd13be357-93a18551856mr663151385a.10.1789390190949;
        Mon, 14 Sep 2026 05:49:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:40 +0300
Subject: [PATCH v4 41/52] arm64: dts: qcom: sdm670: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-41-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zzXgeiMIC3PdS9PxtHGEXnZzVRJ4hW+sh2v
 q6/vpB8LbKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs8wAKCRAbX0TJAJUV
 VnfgD/9hU0liESyOT9aMS839L4uprrxstPm5r3AgNY5gPQlIkDz9uMdu2WFNuP2XQH4mQlqgu8f
 zgWo0K1fc/hlYtDq/14WDhWtXlHOjN/94/DBuseamNdIrHTQ/bo4jxqpzMX0aa4X87CQJvyD+xV
 3MY9DYSS3GI4JmkoJxO6mQ8xlM7RK8Dp7KpVisa4KEhaCa0iua53tanQt4Jx/W15HyPQu5jJANA
 MQFciJtgWMnkVTV/1pZF8BoE2LMV4ZBbISa5YEOJLMtN0X5nfRgO9BXBFHc7mfStp9joWr6OPq8
 6sug0B4jujS4oc7/tyN2FqFrW5V+muItamJEhvPOTD+uKLBjV/v0Cd9SOwLvMv3LE06vpEcoZRY
 r9BrvHlt0HQz2oZdqO64snM1ZheQnOsdpChffRrJRpok3b37DHqmtLinzwgcohbE6ipC7zgqCVG
 LFGdwaJzCK0XH9UwlaqCuSjViKFWvDGa4P8v22XplU2/VE7Z0xa1HNQlAV5/wYd9buDoCIhbSbi
 avFBwjMURyOrUGZP0BbO35wmzoXy4KphlImqVj/bPsqNpUMwLzIl5dpF9eeCL2GX1wp0sTynvgN
 LNj+RFYohujNU8QlJk7w7IUm/jLNkAdDUPfYg1yqnN6nALCj0ZzwT6LCBC4CQ7TRpTKyVpo+v9U
 aYsptZwId5e9K6Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX/8bYYol+2adV
 rJFnsWae7g3UCVNXiwCrAly+bPIza3KGSKdBKs2nP+XEk7nEBONY/mYB/dNd+KJwTxdm/m+jcpP
 1tl3DQbk6PE97jLnoxFk+gMW92r3k0DYtrZj/VD2Ce/xSgwZXYlmqq/j7h62/7FuwfsFMZPppd0
 0N4EDU0fdYZBzjdXb4bMIdJJ4E4jCC1CAAJdx08/BS1XcnsLaR3lZR/PddoLOioej1zSwJUOmb7
 SqoSN5EaAEqjayfJudkIaSRSIT+GyFl/M8W1mPN3QQhy4GyG8RBeE/w+rzji+uvNCBSPOgdyQi5
 5xtNgd+RYAeocPRZvcp2IcB16cnSknG57HaYXPXYSBHj821f0zrltn/F/on5TH5I/PMbzOc9TXS
 +qXqqXeNTM76Yr6KoYVImf0OfRVhZuF3k7dtb+nxg324oP/GEVyP4jzmHQ4AR3Qd2eeEEcHXF/w
 v2GuKrojoCA0nxgCORQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7ed70 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=82sHzFGN3NSTCjlL1roA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: oExYBUMHp9VD8nXvtRxbb4EtQuliXoj-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX61kqq+iR8ahI
 /c6kmGVNV0IoRGW4P/CeNu01JMuEDyiCoL+yTBZIDuo9aJPr7tJHp75n8w+lK+EDMxV1OYmg14T
 d8W8ddov7nBEFuFdEcmQJTNgFdrq8JY=
X-Proofpoint-GUID: oExYBUMHp9VD8nXvtRxbb4EtQuliXoj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SDM670 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1978a54db23b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -626,6 +626,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM670_CX>;
 		};
 
 		qfprom: qfprom@784000 {

-- 
2.54.0

