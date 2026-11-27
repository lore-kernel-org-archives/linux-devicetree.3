Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779713;
	b=X2QwlbUM9rygH35vNlz90V4UMDQElONZMiGoXEbMX0iYuKFZ7du3ECtsw46PV1ICFplO
	 FOAl2vgBJHhLTjnXeX8DTgRiHPSv6GkFwCAmhYMDG7bvT+PDXe7oS7ilqqZzHmrNfOd7+
	 9Mf3KU7T3mLd6Q+nAt2/8VwQ9n6OL2s6KvcBmVhAmUK8yQDPYkDjDkeWKaZLHHCQrZYPm
	 lyrQtv8uoYysAEr+MENfGB/hj996SYhXUeaE8QhzWSNVanTeLfrT8G/DtCU1Ckz2KatSa
	 UDOnAHEaBV5mJFIu4ysGjNvpCAebLAHY2VmNbkEgaYzcX8lNYSpO9VYbA4nyONWevsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=;
	b=JQtqSdXpKFoBY4C7dK7ot4PP2LqzyjV5pfm7XXx6rwqXYjPsO9Tmdg+ZXdSjDmQ15W4D
	 YQdnRsyenk7/UMMz6iE+Xwa8jk6GHEAlyDal3apl3uPlxXJj22PNOs+IN66ef9jHteFVV
	 ZD2jWQei9XbomzGSmKF451MDnwy5+2sAiX7dyvCr8fPyN6A7e3RpsxY95pTXTyyP8Nl8P
	 J59mSuPYFZWvaXK+KzjaKZlaYv134Ou2CiQ1SCcFLSH+MqZvvHrwg3/zudHV8XXm5nj/d
	 qLy6qnhWUXYCoGaT/168sGpIHeSDW13se7GF0Twq5gtWw68Hd6g+MzQcIr+5hLkRufw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEI6PL0W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ4muU+E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B68C60A3822
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B68C60A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEI6PL0W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ4muU+E
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp8EP1376861
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=; b=YEI6PL0WRgRqSSAN
	nSOL2duNrmiw6qAIfg8y+vWyvITyfNtDcPeAg2bf4mTfOdS+YzokLAx7cXfoJViV
	9ZJRP4uwRfFQHI3686ENV2iKwjhq+vh+j7ddQBrgXSCsrTYzwUEaEuOfZ7TIOfUu
	VwNAnvME7KlIOW610SYdAt7V4QUNk+oXDf079UXDwnFdr452ayo6Rkw/hQIm8Xut
	mp5UMy2xAHYOcA60ixiRH6VDFpGzwxDN+i2r8VhPo2Gqt2zDLX5QoohHpoOs7zfj
	fLaYjmB+mZg7IY/AC4OUE7v1/3Wi4OOujW9hvQ4+OOAditConMbVYosdKuzlyQCJ
	vxrxPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3abec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so1313264985a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779711; x=1796384511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=;
        b=iJ4muU+EVTr/3UFctMn21qV7TcpXv73+u/vfgLFw8wV1Jfh+P5Ko855PPJ5PN0I1nX
         z66+YuuQl9+TaKE7QzFm70+rGEFVit+7XE47yBDVVP7roe1PF/+Jxw3v2mLgNSOxg5RJ
         FC7XZF8LrzaPLdrvl6rE0cBYnDD/Kr616iWDj7E3iseXaJyT9KglclXI5O6k06xnBxbk
         VB48NJK33DppznyjbeUxHmvoVHaRTLbSkxa+5Igwpy9v1eliKKPKvog6U6m9WyHIF+eM
         QiXmr5LdiE5IewEg6IlERgoZ/dfTN1Ptvp0jW7cLHmXHlrwkY8q9wnNdD0PzIH2iQe4n
         QGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779711; x=1796384511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbK4llwd1PhFlKCE/m8ohegsse3TXcwA6KPNPzmjdlk=;
        b=Ew00k5i1E/Ske6CjCj2VveWHflhyXdKhUnTorLsB5xwYK1cKr8kU6JBWVkBZUA/ZHa
         WMNMM44KcoEZcrWoPPFgBeQg+pJLyJ3HnZEG2yvjOsww3drEH53tPPsw/qBzCMC1aoa8
         7U5WZ2MVZxQaicav86yiEyXRBeLqhg/IVPxYuo57/UBk7STDQmAOHkfiNo4jlpQvQ9dX
         OSeQrbLdU/kTTZyPv0FfSGEUkaKzEKcDiW1l1flJEFYjmDHigAcG4DtKVXyzPvyfN3kY
         nGXuAKffxA52eToKa9yVqKKrTWSO+aanTZcGqtXhs662DWlmMyAL4ZpmSQSUQ1nO4nT+
         gMyQ==
X-Forwarded-Encrypted: i=1; AL+hErFv4eIgguLaAnWOZjk8VQtyE8nB46Lm304/IU2XPe57h8qhk3KW5fElUCRD9DSAGcC/oDwjYzrhQs5M@vger.kernel.org
X-Gm-Message-State: APuU4Z/TI0Uz6FPMhLC57CpdkVv3SZBBliWC9GkG0lytqeNWmWWyWlRl
	R4aZL6Q4JE03RGFs+EAbhwXgCEvZDC2/XJ8tcsfujDAX/M8ldxL+KvGvHFm75AxX1Pumq7uk9aV
	QkLhwQ8BAE6H+8aHLQCQ7rfvYusZ6V2jp4dUB9USbn+hv0YQVh1WZxOMhbltXv9/m
X-Gm-Gg: AZFdTZfxM5VRSW3wgOg2bD1m9bcnoUrERy0Xjr0NEnJEJoUaoq9gnzkg02OsHUkmxde
	K9ZpOwxXTvUoNcQwwy7GX0WgY+K5Y+/0Ma/A8+wBzWXh/vkXraBMkx56U8JlQ117QeRQ+9AbdjJ
	xgp3hnzh8m+wpnU/X8hTeKhVTFvAV85eNIRdI6jGOTTm6dONmmLmopJEhHKE8mcc4gtWdiL+d64
	D0h1/MjZXmUxB8FJeH36mcqBfuSOUlWo9ey2szkHon5PaU6NcVT6cEu+flgC4jz8wcrWxcyeeoW
	+5QCgbxcV97Q7FcJXX+C3gxAWzIIGZSvMYY15DPAo1GUTfudUyh+xUTLfINbAnKu9T1M8ZS7ng0
	2gbBDNY0EEGBlBTI4+wnFNRPAV4fTkK0t44lIZmYxuOgyZtntviGZU/2zUtIyiaxuG6Kwx3uH+/
	ZHzBfvqGk57xQkly9K+50rS/AUEeTi4KzV9uvwZG2fVerZNEjpPTLQzr8tg0gZ8ss=
X-Received: by 2002:a05:620a:2585:b0:949:7058:dbcb with SMTP id af79cd13be357-949b35723b2mr4487218185a.14.1795779711392;
        Fri, 27 Nov 2026 03:41:51 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:949:7058:dbcb with SMTP id af79cd13be357-949b35723b2mr4487214085a.14.1795779710945;
        Fri, 27 Nov 2026 03:41:50 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:35 +0100
Subject: [PATCH 6/6] clk: qcom: rpmh: add RPMh clocks for Seca
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=srAZ71NXEA0IeXVxC8c9c3eQfWsuz9Tj4jyzkaequpA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxxSP0JWM2StVqCxtvfPFlaMOs/L2o/OlqMZ
 mR/x8oJVqmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscQAKCRAFnS7L/zaE
 w9ZQEAC4Gvk2dIigG7Dz4jzmH0Uv6hw1GzUWCpyE9glv2ip51Q9rbPVxi0q5zVO4znmxCFRVon6
 LM/BxU+gSXqWWKtoMWDFDA/nwiWmyJAMZ3f4+H2gNXgY30E/6dGZI/j7/e9wdq/NjRRiXbNvCC/
 FYBfr4OO1Wz18wLZXNKUwGKNoPk2knWpaditAWjt3f6xMf9putbf4nnLzOQZffy7NcA3Qs5rN21
 O3AexhbML21qmDcsvp2HPpwGAPEbgkT4TuQJJWWfy4Lx5iW3YGW0M3TT2FvUFbTwRJLOlb63nTH
 Ds/inYG5oozQLrm0aY8JYZ6naD4iQwDlgLz/WhRUlVFgqF2Ri+uCZk4vVboeAuheE1xj9lIeFWu
 60se39Hr010mwsf3Hej/s9mbhCatTnyhQE0SKUPeF3VwbZSsbH8uJLkdqOpbYRzceefH3xXcKyE
 dm1gjlguio3Nr48khgIRUKxzv/TSK+LBN8pyUwMlRdKBKG8ZNvOIZtyUWlu1hxO6xuXFhMBZSxF
 rl1srOqaaWcRN46yFPYWwNX9w01sniQRfPeNEcYTUnlBm/NDkNzkbs0ZlpZ2iQw/EaWs9N/nc8U
 EAAshUn/eVD8UFo01MemAv4SemoJl/laGIqOd+iLRYyi/+qt464sz2QcQzo2S/hVnDawtYhXzpr
 g9KsRA3AihjvZIg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b096c80 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=b_YBBtIZcKF_qvpD-3AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0wIQd8ni-Azp6jJj5gvNWSJMDkd5ogjU
X-Proofpoint-ORIG-GUID: 0wIQd8ni-Azp6jJj5gvNWSJMDkd5ogjU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXxMIyoPN8Fa9P
 RcVfFzKpLC1JOLTXsXIkuzDFszYqsasugUQccYYmtynuomGnn9b48dK5YFgyfOmSz7rndwjxgNc
 EPHzeLAd/VJi2m6mvgECw1UNW+ok1El4Xk9AR+vCw6hUSLd/J4t3W9X1XVBSBv9T4C/FIuwnXMY
 OpCwL638fKdCYVOzleZoRRHqRG0PQo8ISep+s1RO8jd6yHiAnwNnXotfq/19h3gVORfeRRccOe8
 KFSLD47rZF2ZlnAm4izRVW5DJo9pWBL1bb6n+R9hwXsRo2HSaU5MldbUKX+KZiNsHEm1IdLPWkD
 8Tbgm4JRfrroxAQhkAX3R+e6VtXZ4c6df6OxHOZjZBHtzgMEAUlwE5TibHEaBvWcvW3xQNpSKE5
 NkDT7fJXHYipDNlTCw2JoEpO7ySEyh9XdMZXaAXFrh1Mzn/Ivd4xNeo+bmD2q6T4uOT5mISW0h4
 byjQ4R2hE2LdWDZuK/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX2CJg+DWXn6j2
 Km792U3hFTSza4/j7qnWuiJ0Md20e07DM4RKT4jd41Bg5N3GfBFslm103jowCThqCUafAR42e4E
 1//1R2MxmWhJ485njeNMvTuHGL0/UWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Add the RPMh clocks present on the Qualcomm Seca SoC.

Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 68640e5904a6484a37d48124f9d253d15c9602e7..178f39ca3aef8bfffcde2b7065884d1408eb24e1 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -994,6 +994,21 @@ static const struct clk_rpmh_desc clk_rpmh_nord = {
 	.num_clks = ARRAY_SIZE(nord_rpmh_clocks),
 };
 
+static struct clk_hw *seca_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a1.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a1_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a1.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_seca = {
+	.clks = seca_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(seca_rpmh_clocks),
+};
+
 static struct clk_hw *hawi_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1155,6 +1170,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
 	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
+	{ .compatible = "qcom,seca-rpmh-clk", .data = &clk_rpmh_seca},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
 	{ .compatible = "qcom,sm7250-rpmh-clk", .data = &clk_rpmh_sm7250},

-- 
2.47.3

