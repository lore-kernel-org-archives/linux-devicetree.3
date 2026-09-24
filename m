Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7D492513
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246515; cv=none; b=bo7yZqHi0zMKNkGnzG8I0JScsMkM2tplNXKM3os3cTUQKTP1d2kd77Hyxwd39xreKzl3zomCze8moaYFClva+lcDD86Af509FqBG5wJ0n6qTr4CYdfSbvsownZ04DZc/gJ4MCDnFKUc9a/c+bEkUk5iwh79/wCcYN851Qdeyfgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246515; c=relaxed/simple;
	bh=yAGUlki6+T8DTlbLkETXY1t3zk+zRPEGo61GpAO/KKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5GGtmB5Xt/1esCFtPFozhXe1xxN0RekhdWzF0Cgq0nHRWBfeUBMbmK9XQmoaifa5ZIzcIXhQ+i1MUMfasbsvoT0SjipAbClQiYhHlfvGuOejv/tvC0KpxlxGS9Ty8U9sy43Yocxa4VXsjnz2qhOqsw6Gekx1ZpJq1h3FhN77pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRjJTKwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZPZplmv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRjJTKwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZPZplmv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PgYM1270209
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=; b=lRjJTKwN+ZXv7vIJ
	Iisq21cLO66nfXpaHf+swYacWklmPeLusXrRrRmuLV2hBPvxfxotwlppyTTiWqd3
	ziTQoGVZIJ/NevmTajJt0HFwEL2gmitOWO8hzBDR8pXEGdttYwGN5gpBmlRhEXAZ
	bS8pn8hR1X/jfAGa0Ahx8d23ulAcsi3ppvNW8auxhAz7r4dYTMfzB6BG20HB8/DV
	hcMJTgYOJdlk7lNi+DiNtUdHPO2HGvHz4g9QJmymuOro8n8ASjy4BH2HBnhvHV6q
	lhH+hjxCD1CnrtzF1sTIlUicjywIR1UCQ6u0ONX2KuoqPN+wHsZ0JRRLiiWVppeR
	y5meIg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90ajyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532e0dd7d9bso40368171cf.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246512; x=1790851312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=;
        b=XZPZplmv5z2iOCUWd76zL+EXR7anoTNyhIUUHt9mEbOMIt2W7aiH/cvlIRC1yTZsoT
         lGZTT1aolRCJP58EQt+lTkZN8hUBejqGo1gtvEdm49X94p3Dq/4m+31NNaypF9GgmK6v
         5m+r4Yj++WGCBXsEZFlg5v31F5zFNC0L9B1HtmUbqmajsp6bw6bSAPDP1pRpzn6oqLcQ
         yQEzREBg8YzXpWOPYmS6VCoRcwjdPHuPEDyW6llZp4nPy9DqlWOte1P+o6GtmfQ8W98X
         T1+KSL4SnB7FTUQfDTrDsXc8r+fKVFeUuMQeCcEkE1oO+CGCgZjk3ojYvE/KgMy9AEVn
         MDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246512; x=1790851312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=;
        b=cPo7wPHSP9aK2wxqLem51uiaPjXNV/CH/WU+qCQgG82z5NvpBQ0FFeZ+DhjCTvZzh9
         FYp0eeSHn11/ut7Id5eDlsxliJc2S0I/ybDLcz8+AewdTpj47RBFmJom6EwbqHb7qqrw
         z3fWIHhRVyHPTs3BRlI5U3361XI67TYH5CRxVpMuErqltoJ0PVI7Ou0KAyKdV8+V8gw3
         0L1F8HrU7AYt6i4b1QFHkZVmZDRH9SgpTNz/lSC/lo03RVsJVnRtCMg+dOgVEEOtRAzL
         aWENnR6zlIdePSrTIkwv1XgNYvwdmdexgeh8uAoZhw3Es7tsiPJ9sqd0MeB19oI6UwTf
         0nWA==
X-Forwarded-Encrypted: i=1; AKwUvBwEQsMaOlOIjAa/GQyi53RMu+5ZPbtDpOCsvBBzUzc9vJh12u7dQ6etDXzCHertsBmD8mFfWp/RXTDD@vger.kernel.org
X-Gm-Message-State: AFuF++mFfoasvVUnB4BFG6tlujYfeO5vVvZaD2buDyvoOCs37X0U9a8C
	+LFA5XqI+bcNKHwlH8D+3JfBvHBaWv4dUCD89UNH/dYRibJyBCwf5dtbojAv7GM436MybJkkVGF
	IiFWYdndxMZp8+7xsqycHyQwtI/0Lypiv7p/3LYz4imlOXvvD+0/zs6XOaYcTQG1p
X-Gm-Gg: AYBFou0++/cwLJb1lwbnEceHYNoYGc4HzrknzLcLQlsUxocsuWl+UjC+ID0dt4sS6yV
	tnMZ3cFHce0sRxOo6UdbN72avxJOO8b84v1nsx3B3bMfHslJz8uiioXf8EeAOG9IKWvGFr7eR3N
	ORHeUVn/S8uEpHJcnnVid5CctQ9A+h/wGvWaB8xo/EX8x+WQFOwXAqx41SsTAV9q+TRnDiPrPEo
	VtsnDuMDA0r1BF3ROiGLqJPmikIBZjdJf0cw4cRyqmoiBqXdaq7wPsN9jN1N5x0wsxeLgVMec6f
	4nUrrMmenpC7Xx6+RKMiEJcCCHv/G3x+D8BI7qeVvCykkxPm70UHmUcpcUcc7NL/Z71P+mhkoHH
	kcUh4famtAEfv6RetHBw=
X-Received: by 2002:a05:620a:40cc:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-93c362d13e3mr214521985a.23.1790246511500;
        Thu, 24 Sep 2026 03:41:51 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-93c362d13e3mr214516085a.23.1790246510730;
        Thu, 24 Sep 2026 03:41:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:53 +0300
Subject: [PATCH v5 37/42] arm64: dts: qcom: sm8350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-37-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yAGUlki6+T8DTlbLkETXY1t3zk+zRPEGo61GpAO/KKM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP39ZvRqRESQpet0hv+eeeTldHR2FFELbQd06
 5IR6qLYz9qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/QAKCRAbX0TJAJUV
 VjevD/9JslzkyvWXLtC3dWMMxtN96omHxR9ekIqMynXnEu/gcrYWQ+h6nKhv9rNJRqlYxa2pjNQ
 nDQcM3QS2Xk8pMF7L6q9YPbaxKE8tz2LuHMUmXgDB/56dpXtIOsdtjAIgZ66WtJhyDRuQwfwyuV
 TjK+JfF728gLMLMmXa++Zs3ytJo9/WnObGvTIgDMk4T/ABP/9StU31jKDDsJdMcXJRtzDxJJ29o
 oWTRum4DMps0W05DRlLZE9l3c/KfePyMyUtf1O0yexIE5lrRcSNJruR8Azhqz8/qWMKoX2ngrUc
 9k8S0WuowgM152WUlhbhbuE/VeLBitP/ctiK8v7aLacciknxnQ7VcmnnLSrV+aHfYZCs0m4gvZU
 9+nLTH0eocmTz768kjxuKRHJxHw+kSQNwQs9QP70mJCJKf/B3APQwuvOCiV5bm6gWBcEX+iiylX
 kByQF2C791hpTFTrcM60AMOZkQGunwZDujD2nuGw9SBzDR7LU1zChC/pAZXqtkFNh7QyBjZ3ZwO
 aszaAUvWXcdL82loNQrWxovHFhDAxkup89K8CkrSkwydMoZiV6XfkA8gqTiwwi1XupAtOQ7Lxqe
 s0s2VoSNShh0jiHO1QovDKkXwtJ7J58lfrH9K5pbnjRG1DCqoq6nnY39xNsEQVSOPdWJoJrFqGQ
 N8BNQvusAUNQE0g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX1BuKEp+T/AjQ
 dbMsh3cvs4vRpCX/Du7G2stxWIO22co186QAdIurrR1QMWzZffX8o+Ynzhh01E0wK/jxCVEytB7
 3tutUO0q29dX6RT6HXqXum0nGcjTDao=
X-Proofpoint-GUID: 8hb_TyZmLKt6XqmAvU6A_qmryovG2Gan
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9wNcrPB6rR6m
 09WescjfE+qXTNPngtf2MJtC5og6lX5K/Kd5iBYdV+p/LejtEYcKveFNrLQERRSsQMPFsEP0bLi
 2f2mX2u+AAt3qD8Aou0WT2z+waoW7b1HPTMeyNbp8R+cBmFCNkL+0xewS7KE2WMtkinXSqBsPpc
 /tQbF64xqHbH7tI7pk4zUZFtddBEXE4QLiyKqN/1oZBbSP7MpI2WIcG1Tv9w/toP2izfDwKOuXd
 32DKz3GVtxE318ijtlYA/MuXkdx7owPyKiOWLSEThG8phzECC39H2fM10NAJ+BZGu4ynJkygp9O
 F/6MKKXol3o49BwmI9URSJLnNksCeoLhHOQeKZbSDFywNzZJfQiewjnhiWVJSRljWgf7lcuwl7h
 AT6ky9aPI/f79nyaCvNnSKG2JoGrWz4qMXup7zCjkMuqILipRS/iTaa6zTJMldQrHveJ5OSwulV
 5GuMy3DMXQBGTxtnmmg==
X-Proofpoint-ORIG-GUID: 8hb_TyZmLKt6XqmAvU6A_qmryovG2Gan
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4fe70 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 100faea925a3..2a7c6621ece2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -698,6 +698,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

