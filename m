Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB1485CF9
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390176; cv=none; b=GM4r3ruQ7OOW/WnGDqvkc3vpJXf9eUKZ+kKTcyCb3muEeQvKGGrZFRAvXHax67SRNImXLI+ZI6NpWxf/u2pCjSkxqi2QmHl8NVZz7/aOcqbBmIhKNFDMxUottcQ0Qj4QQ+M57TSqsKK8ZrqfkHDiYtYPbxbr96l3zQVOdOlCg+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390176; c=relaxed/simple;
	bh=yBuBtpm3OcG6aRXCBH3xSF2TfevDO7mY+we2X2legFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rt5BEofyc03ZhH9x499PmK05v4V4KqrW+pWrB2CtdsbEl9aykE/28HHmbMSvUMxNC+IYi7V/uSVIrfSl/H9Fwne1G3E9C2nw3EjFJculQ92E6hvXUYZqiKbHgLJV8CriaGDibLe1EZDejmLS8jwrKnZayeCPcSYYASo7idbg+bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEcDTPGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxAHm+xM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEcDTPGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxAHm+xM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmAOf377900
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARJKEhL0QnF4Lfea1jnOcubZOcnMiLMm80SYgx9n3lI=; b=KEcDTPGRjaAh4Cc3
	A3GxBqB8ywaF9iFzB7VrQQvt6tLGyTusQ28WXlmuVL1iY3uqbo4GJkLhfoD9fYWj
	r/m24XmJ3LpEJbsOR1wzfc2p+4tc7UtTESmu+WsLRrK2isxYQtDm2SBnyefnBgFt
	SzQZ3Q/48E5i7bYMtMo7Qp4mXJzjzLQbkQW7xqn9utXcNuEjh7oqXAz+bwY8ySRg
	O6AmyK3hnpDdXZBB8Rl8GnNBe2oUXk0u6Ba9aWIQkeryQjtMcOpn/3NcE8+jyyEs
	AoRcCXXvcNJeZtDARgjEljk1Bzrp6PMWBMVqX/K3+y+OuwNK/gGvlGmg6an4DxT9
	0efIZA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8qgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106fce784dso81638076d6.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390173; x=1789994973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARJKEhL0QnF4Lfea1jnOcubZOcnMiLMm80SYgx9n3lI=;
        b=NxAHm+xM4D9SsBszuIVXhqKBH1E2d3Giyv6ygNdAMywjXaoltL4HtpfEg4Ki7JZb6M
         c+uARwUxtqWutSlvMFJfiJV1VhhNmUtEGUC0qa8Q33AwfeuJ3kCUokEScyJvjc5lA0Hc
         eqkfYmm+eeBmbNRh5PZV/wlUbxMXQp0hqZj03qls8gevJ98XYUqE921pHrDyRnTegiHC
         IHYmQqWWJAuEAGvUj5uDsnxGSWEznUFRQ7P6BBVcgIOoByPVqBzu+TwsYplD6Htu97SA
         fgWoApElds4YiOyaLwq/0Fyn3D0uYUo8Enaqts273axhcVKFE49RYUD3Renfppjl0OYC
         hASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390173; x=1789994973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARJKEhL0QnF4Lfea1jnOcubZOcnMiLMm80SYgx9n3lI=;
        b=lEwbNnvNH1EjU/OY8GvEqb3i4ec8Zd7yZBQTTx855BLXW8VqQwLdLbCV6axTpPwmgO
         B9wBUGLmMyuW35mer+KFgV22SaXOSE0NnxOZfeTlWVpA/HmQbk8Z/e0xKGNHX6Dveeeb
         smjzzXRTl4IymzaMdWQYTWmPshNNUs2FySDiHDbyZ1dsuxjpFCrLablqfpLysLi9ey+M
         mvNiD36eSnK/XwsLRiXui94WSHQ1H8gCzSDBmnhdyrOQgZyH/uu1wNldVQFnhLiJu+d4
         aFVHyZjQWV7BWJjBAkLmh1k0GA2LfbOeDNnYa7MylsN8JY1Jejz/LTf+vOBHjfiMpSMS
         ctdA==
X-Forwarded-Encrypted: i=1; AKwUvBxLNY/2EH/+rmX+tP7xNT836WoVSWRcIX81AO4MwGZESa6JWiA0bFFzdv0PigxUKJi6OlX7uTyXQUhf@vger.kernel.org
X-Gm-Message-State: AFuF++kaV3NJJeFHiCk8WWK0aGYShlVC2kxx8OLy9mIRzriuUxayc4nX
	n99TDNXqDA5RBd1FD58FRasiYiONQ+cJvoOaZpqJ4znv4UXDNFZPKrzsYN3vA9g6EPwbpMjTXZm
	u4qYCiWhfO/9LmTLSYDj128abpNCR/DvFUaWLs010ZaQ9kq0mMMuRW86IDtnszHyq
X-Gm-Gg: AYBFou2dkpHjlP98OCdhwVTMRKuUgwak78R8CrbkY/y8FxIqrF35BHmFoneT8B7DVAv
	taPQAYyT0ZwwonyE8Z5hShvvUO/8qPQ0EA9KlEAXXWl1CkzPXB0D4Tpsej+XXxcmYEBBqGogN2d
	9XVMbsGdeJGOU7o2b/xCzWP96vnqlJs2ecD+a9khKMhe6SyGoM/3049WAt4t7tm8OZWXToCi56a
	c6uCCujWUIPxRGtS2lEsIXRuWEcxFMHDe8cXpvNzdwhykGfYNL3XKr6WymWILo1NIzyjIgvGgSx
	daN0TIXdr+oQocCbRVRPhqYpzTAf6QxqRXwmtlfC1HOd4y6046/zoKtL7DGA7AisfarWIxAbuR6
	hBAWYLMJf
X-Received: by 2002:a05:620a:43a1:b0:93a:1540:a75d with SMTP id af79cd13be357-93a299dd0ffmr337419285a.37.1789390173103;
        Mon, 14 Sep 2026 05:49:33 -0700 (PDT)
X-Received: by 2002:a05:620a:43a1:b0:93a:1540:a75d with SMTP id af79cd13be357-93a299dd0ffmr337414185a.37.1789390172585;
        Mon, 14 Sep 2026 05:49:32 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:33 +0300
Subject: [PATCH v4 34/52] clk: qcom: gcc-sm8650: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-34-9d5a606ada33@oss.qualcomm.com>
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
 bh=yBuBtpm3OcG6aRXCBH3xSF2TfevDO7mY+we2X2legFU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zsTexOKj3FXDiRgY3Kcqed5FypBt+LA464G
 f9Q8RM3IT+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs7AAKCRAbX0TJAJUV
 VilsD/wOusYn0DbW0ettGa3KSwR7GO1Xc/tLDEg83/EfOVgoFw4WMxXY8iNzj3wx1P6Z+nDiul1
 YrIZb1dTQI6/oqphfyTVUm6MaoCpAjFyIKdwmvogYEuPxsYmkMJSsgB1GGePhYsTw/qeRkRzlcn
 bjXtWfXnlzILritX3m/+4wRohU8oseFcC95HPBrGXzTu72bgZQVb5eIEzd42RHKzWHeqoM6T4wI
 lPc7br9YEOUqXhUqphq1y2mbN1HEdoy3eHMgPTiV8uqfgq5Mq0dvX2wQsi3YKAXmuzx6oLPtoKV
 7Q+W+waNjcdg6oQ9TGjPFJiO9ec6+H8GuqwhV0e+LYZ7VY7grdz69y8fgAU4/frHY4PNqLsT5fR
 jO+8Ll+HCDmPyZbOT5Pi4Yo+xWGFFjIOMA8O5eeNXqSSeXB9JOk+6U8Soba78+vPQS3bKBzdGZ3
 F9K/ef8TsmNhrWiCGaHpVulzi6V1pim4e0pVRAVwV0AYp4HiImmKEBtHh4ujALxuR7IqvPNPtbu
 kMGM1cFwy80raZeMRF6R6Mv48M7YK1bAJhG1RJiYllNMvI0r/O1B/8TGqZT/7RmBA1RGZMfeAs/
 Dc6LMXPZhlL9RAfXMDJ7sXu13izP8lMOIxzWYN8qpFV/FkFD5zQyvzumCA7f3RLr85j/+CizK2e
 fVLlV0G2jGHhUjQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXy5lMx/t7tppc
 dEDnXmmtBsCViBczNMajRECR9S61sD8jGHDYj7RfQXvN2RxAR5qdor4ZpoP9k24lApR8XP9YqmP
 3B4CIuY8ebIMMawY/1B6cB8znwJiXXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX4YFD8GnV58ve
 6t8CaGKwfQldlA95gTR3YZxFcFqWyW9Zlcb4L/xQggygReqnGTZ08inPcTG4szodRm1bQ+WdCSs
 UzbAr22zMvfIRjI3riX6hMVdgHtlK3dweZHfmei7rHkAPKtDRXUUyByz44fDx5G6WMaso/+LmUL
 OiMeoZPBhQDEo5Za3UU57baH4EUnJJfjFK1j4jvic4UF6ha1mzmqiVwvCq/kXCrQHQkGdjt9T+X
 tV1DuaMX0i1IgCj5VoFxgCs65OU8NLWNRpukkXjKvf4ZVdUgMKLi5uckfrwfpV7RXEv14xuPMpi
 89ltlsV8pd5kPUouYit2OtGmNrtUSPdZM43fBX5P/iR86HAy1IW5t5sF/AfYHUAkXioHGnyP6xH
 LIWaQJonk4mgOmsbc0eW7JnxepmVjrN0CaUH70IAJH0LLP+lVYZKJLAXhOktIJW9t2a75eLEuvx
 HTOVNc5692pa7iTBWNQ==
X-Proofpoint-GUID: CuWwIA4QZu8vpDDO1wxVSIAyTqwbd2a8
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7ed5e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: CuWwIA4QZu8vpDDO1wxVSIAyTqwbd2a8
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
 drivers/clk/qcom/gcc-sm8650.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index f7e2d7ec60c9..e539cef33ecc 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3785,6 +3785,7 @@ static const struct qcom_cc_desc gcc_sm8650_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8650_resets),
 	.gdscs = gcc_sm8650_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8650_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8650_match_table[] = {

-- 
2.54.0

