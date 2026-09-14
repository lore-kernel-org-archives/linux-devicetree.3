Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF11647F77E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390138; cv=none; b=Iof4NeMlWpjjJJKUfZxAGb2I9Aq2aQnQdyeJfRVoB+sxEuT4ASdkBEceOjkl/Hg/NVGs0mxv0rKrWBzJSeqCm6xRVHslYFktGIa1aAXqfUuCnv1HpTTedkpAce44m4YTHlwmPalvm8/YMHQ6FXa2vR8aHxSWKtcUzKeY306GGgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390138; c=relaxed/simple;
	bh=qMYu/HE8xyE+mu99RlvMG888zm3uHFneAxycUzJGp+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAqlQxmnrtBzjjNMHq9TsIf3KRXzsdvPiFPgBNUaqFSBLuECdiWuUAWpRGUr1Cr8r/kcrjOb2p1L37auGFI9n9abrSg9XlubNQg8+9bhgptMjneAmAuBNu1o1Uf5izM4Qp0TOfQTFtSum9+J16vpXvVlh965RQEdbWrRjJgCsOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lc9MRZwr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdT09wF4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lc9MRZwr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdT09wF4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1sh901859
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=; b=lc9MRZwrSqa/MTc4
	O4wJylvJl/f3UNjh3DpSJ97EZ9FzEAuPKL5paGJgCNE/G53q9DrtNTL7kbgLxVtj
	vQrrpvjpY1QtpnBVl4ZfvsNmId3+ul7ETdFW8yccnVaeOaTyx8OKActHxQl+Hs7b
	qnPIYGbr6D8bWkKxlRnjtRzTJvVVB52zesj/X91KR2wsb9ZzeoLun2b/0HS0vhxr
	R10r+sxgFmWAAGLQJpSawl8DY8PqFiR3m1RfWjtt82cyXA0s2INuUH/Ntu2ZTOlq
	DE3EEoVyeaUtgen9LiNQ3kOEpwp4ag1i0ce8UMNG8GrTp5LJYXUAre72WoW0asHi
	p9hvXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrwat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f27c80a3so638650485a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390133; x=1789994933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=;
        b=YdT09wF4a1k3UGnrLNnSKOld6zcISW3QjIhbXlc4RupZjyb+zTDT+6cYzLl9+CmFqR
         IUpdHuyE/XghlXqN2g1xRXtUr7Eni+TAb2Omtvsj4XTnLhn8W6jbyPobn1up64IGacsc
         lihFNYvJGhGgFmEan8ubLQtyBQgS9Y+skmsEyxmXPRprfC3QgO09v9Os2G5kpM0htYJP
         cAUGWaLLw7VG2ktpNjQyrUZpGxCq2xzJVYkVbdMzlxWgxKl13FR0+19NCDFVFgNBVZGv
         Zc3BG1oY5KC0M1tc/JGVAycpkJBJBALW+qGuOjGzThgmSXPhCFtT9GZ70of5j5U0tXrZ
         eg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390133; x=1789994933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=;
        b=b8b0+ONX1/vqX4qptUL/yWQJMVr3iF2D1vUMCvohUAnCickGfeXElkbF95EsByNVT8
         fXWToq8811KXA/Cj8SmSeXnQ8/UOntwmNAhFyGrXmxwUvfXEiqe/yuPVk+6PXbYwRNay
         ZT2CyZjBBrisp0X/4Dn4b5WWWTynqaFET3KsMRpBgABtOA8AdS+oBF5b57Bl8/XMqsPk
         n9e7+KsOwjY4dHk59TI2Us1XdaFg5heRfVdOrY89871FBH9cx2yTCkNYXk/UFXPeOdAQ
         OBNG3sYKA9/d679mCsF6kGUysuqYTTtgjYEhjRNnV+chJ2TwFRg8brXll0AsD2r+hg4m
         9f2A==
X-Forwarded-Encrypted: i=1; AKwUvBx849niciqSuKMzZzrb/z8iOqb08Uv+3/jbxQ27ECXI0ANrUFlya8RcniWFtSnsyF6lrim8sPMuIfDf@vger.kernel.org
X-Gm-Message-State: AFuF++kGRLwdJlI+2kOhzzvVC3a37grN6u2o2812XAdxbAeISonwhrKU
	Wwa7CUuevJ228SDpxdGHdYbQjmpTJsYSpYnw1sN6UkKFzA5DMrs21KoC/tdFDHzUeVf9dkX9NVP
	IAezomaLCgcAKzhhnGn3h19qRaBfd2wa6899cnpccdALA08OFAYLewxn7Ht/bKIck
X-Gm-Gg: AYBFou0YJw6q4QAPPVzGIyjIJ7x75M3EqoQ4d7aFABO2XohlKJHvxKnBrDUXLAP32Ao
	aCA174w5cerIQp+he2XxKI5UVqR/dXgQMp7LYIyAPCrmELFIMtCkcEb88gSdIKzPE+Lm3FT9kGn
	hW3eEsG3aMdzlBhlvWz7nnoLz9ogyXbCD6rFykj6MKgR0TCEBV0qFWW+W/irtRxTi7UvcXUGfeC
	mXW7LFucDo+z6WpyhyihTw2h6IfRncicVV3H+ixvBmqBbtcUywkEzvuO0FCGmvLfu0HJgGABOI9
	tPrG0bX8P5+YVFSs81cwcmrxt86qoBLImOqPy2c5Icx9E2k4yysdwoJMwlX7gVJy43mfqZ1QCzt
	2nZltrPrR
X-Received: by 2002:a05:620a:171e:b0:93a:1ec:748b with SMTP id af79cd13be357-93a29803c94mr322314285a.20.1789390133108;
        Mon, 14 Sep 2026 05:48:53 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93a:1ec:748b with SMTP id af79cd13be357-93a29803c94mr322304985a.20.1789390132535;
        Mon, 14 Sep 2026 05:48:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:18 +0300
Subject: [PATCH v4 19/52] clk: qcom: gcc-qdu1000: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-19-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qMYu/HE8xyE+mu99RlvMG888zm3uHFneAxycUzJGp+M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zetbPQZ3Dm9nRpJv0rQZRQaSGvSI0Otf6X4
 XVZn4bBMD6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs3gAKCRAbX0TJAJUV
 VtFpD/4p/u7Mw1156YQBr1m53B/NmtwRqhgQCvyqt4oaZ6EeA45oeQ3PjNr/d/rRK6uUUDVG937
 kPaO85kZsRdfGW7txbhT0Hv+5juDmn4Qq7glT1/YOKPyki09rYrzNveEFv3Vuf+OIJSrjPB3kCV
 pLuq7TBJ+89rXfSf5ILlyB8RNR2aQrWJWy0a1tKvlzDSkRo/J0xkf3TaiJPW1hubvmiuMUk1l0Q
 +KqFUaR2Knj/fEjw59UI9dtax0DEuO8GeXwRwwYySmDxISTZOr7IdLmEAYBKyXYvW1PBGvG6VE1
 S6xNrHT2exN3K+NLnXsyD4tBbMnncOecoPCA/M+bSZWv4uoHCRczJ/ZYujj0enw5RaNUpoclK5t
 KrrQkgkjlTR4eLX0/lXOJD0vHOAg9Sw0AD90h2aLopQAMHOog6+W/Okm+oVGW+l8PKjiZORAf3A
 kqs/NKozbMMKcrNXTDEADluazarAUVCobwdxs9gCLaeoe7ZumQFrIzO70qs8qZM4R++ADIuK2lo
 Rtz2R2al5kQsEM2ycF+7Lul7sfCcXaSikEWX69wmCNWFR+HQvtHBu0RsjmjkV6L2tri8TqEF9hi
 WduGL1plk9t+ejtnGMABAYJXjidslEqB+/jkZWXlGGvcsTfTXII70b8ab52en/qX3vJKW5ai3UX
 FXQclQa+AROzsCQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: ZCOrHGLo19X2Uhwg06JLZGR48dNqbTgN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX0hZ7UIGFqsN+
 6BZ+tEmMsVxa6fzePEUJoRlI9WHTx9TpGPEgrsAoDWsXngJtqqmK1z3wj05UFUrwbOmvZ2cYU9U
 Ae98qrIUXV6Ef7UCAYGKLgSD3+uhokU=
X-Proofpoint-GUID: ZCOrHGLo19X2Uhwg06JLZGR48dNqbTgN
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7ed35 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX+jctPCexMHVw
 BB24UB9IOZcEQnwh+afuGJFHUJ1wyVQd8DESBxmYS9q42az5rne8QFTtfk+AMjxGCfFyhx6kiSo
 lmmBBppQ20lvmUwOvyEqgEcsvH6jl/Ir06JD2U8EK6jqIyjnOl2YQbGhc9UT+Alc9oSLQE9lgGg
 gDSH02/4tsoMTLnIkOooyfSL1J20HsdilaK0rijaYmYQ6NLDnR/FxD9QciolP1ly4XG/I1m7ZZz
 1I7CgFDLquMZF5u/IoNNkuJSdXn4DaDyysAGlC4qgADYrhfPa17tXy4mdXS4oKMUzw4OBUvox73
 ZDlPY2QUFCo67fwHgsdMNXQxd9KUX/53kJ3WmcmyvlEgH7GtPd1sYNFEYtESGJ3zTN+vvrT4J0k
 Ff+c2TqUF+vVDgT8l2U/ZfvrJpkuI6PM0MgRXdVhHnJuX+CnCKPGy3iw4G1Kl5DpfGQ07wf2iuC
 O/Igk+6ITmoTDsWjKwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qdu1000.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 915bb9b4ff81..172303ac4c9b 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -2649,6 +2649,7 @@ static const struct qcom_cc_desc gcc_qdu1000_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qdu1000_resets),
 	.gdscs = gcc_qdu1000_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qdu1000_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qdu1000_match_table[] = {

-- 
2.54.0

