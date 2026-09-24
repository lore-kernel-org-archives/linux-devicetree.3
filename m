Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796EC47F3AD
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246452; cv=none; b=DbInu9FOxwsG5+7Ucx180V0gkizwCX/KpXMMF0PsWWk+4VYkFfBLKojtrRm+OMb5MDMmqV7OCnEcYrnqcU5120XzpnJMRiAJRMYlKVAi4/8+iTQBIPq41vUfZzUQiW2vK9huMfVgQby1AiZcz63dnKQyW9vh3MCex6ItXFO/maA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246452; c=relaxed/simple;
	bh=1MzmGv7pYEsIWvqeCUGVRjIwXDIaZi9bQoFCu0NoLrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q2Dzraun9GMl8Gk5o+w2D+M8wl/7OM/9i5Ab6bN2DccLhKxceuSmvCbje8HEtSD9CdRyN2tcjcOqe8hReLM/+EBumdRBCLzaqA94KMQE0L9EmJ6dzRwozVuY0krc0dPXX7Lb8oJJJ3ZN5fMvbCr5H5Vf7ivORMc/WRkXjgRkBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fpl7Evu5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzj3qJKU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fpl7Evu5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzj3qJKU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9P4ja1064107
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXvjJ7kXGR8I+uINFXE7o78uhrHa4ykQOrza9il/Dq0=; b=Fpl7Evu5G5ca0Evt
	fqzYDL1gzzcGAc7Jzs8gmqOJFdV67XWTxGS7nN7QeKs2/F6BETHtbmOilkfHc8h6
	eurG05wF5BgQjbx+bkD/t26qpbbjd7Ep+cHMn0+5DFKcNCjTMA1cnIbows5iVona
	1svCg91JMRwlwxp/htaW0qN/9CHIDrDsmnhmqX8Gr35BflBmTOub5KtkEUddKNCV
	sXlBo9HTIiDKcaNH6bzMcqM/mw4X65HMwH4xZYS0T22o/ucb5HR5W8/wtIfzqDsA
	A1Y69ETALYaL9FNFt1NHmnmOfMa2ncZOW/zdlqKrVVI61l9GZ7yBZAAxIwRivGTZ
	ZO2q2Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9hrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-912330dd4dbso13932996d6.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246449; x=1790851249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXvjJ7kXGR8I+uINFXE7o78uhrHa4ykQOrza9il/Dq0=;
        b=hzj3qJKU020WZPYFCd2aKWLpB+RlJ2xeCJ/O2Tmsu8SjBKI5lylHFZ2dmxBvZi0E1Y
         IMVzz3RRydw3kKT+59VSsMBkEOMr/VWE/+LKgEHiXDhP6U3dW0jPSXy/BPEP4GYHwoeu
         wy/oifzcrS2iTV+hPi6mqrsXqWJ75CGrSwNG497GlIoatbV7Rpc2Bzo+PshG6ToeLQvj
         wfPNwPUpjKV1oN+rSeNzY2d5VLWzIpDv7TwNiGPc3Hv8kB0dhrVAOkPtPAvcL0RBaAVl
         oMs1olsInDPCEnKzFV4m9kbyYjDfZ9qia4y9+WloeSwJL1MVYgFpQDaKtFjaOTYfK/Lu
         WptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246449; x=1790851249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXvjJ7kXGR8I+uINFXE7o78uhrHa4ykQOrza9il/Dq0=;
        b=iQ63ZJnM8kIRmX+ED/oGMVrvaK2ahBPHemvQ0nMAybsolC+ejfRJXlMwoUbeXssnmh
         Df2RlYJ0S3WS4UzG2F/yoat6I+FLvDm9KKtE/SncASouKr/kmo/udMnYRfZZ2dlkguKK
         dtA0gDoSz3e8k4bm3fbWKQm8pAWPBCyFDH6xwC5uDhlAj48QLywnz7zrSY+WhUOpZcCL
         +JcIn6ZTI+wwTKTKu71HNoawIF4bE/T4WbqHOQONWQBLcnUzo7XyGHsiX7//YH+TfSc4
         XZH5itjHGarBntVfXfbCpNXpkpEYwJho4PzhHzE4r/ufJXcwEUaOks6ldvunDMmpNEQM
         NI3g==
X-Forwarded-Encrypted: i=1; AKwUvBzkVn7Wa4AvhpOMlkDB0aY5JGNT/z26cr39tPfBeLZEpdclGJG1+hBUTKzKeSVgZsJ0NmMi6DF+K04u@vger.kernel.org
X-Gm-Message-State: AFuF++lW58UejbZTE8yMj3Ab2FUwoI8M+E/ohUMEPSbgFGn5f5DkBb5o
	kUlMLqjjyu9dVPZXfqYSHy0FsWvdCNCqNttV/cG7QbjwRlyzy+Yg+Naj+28siZljCyKSNe/rLC1
	N1TzmXQoqHbl8fcZ5ZQqVB5wShhwpfnfUIHZgyMaXz9d2xXNxamWNUBL4nPSYK/5B
X-Gm-Gg: AYBFou12xATzH0foKBCV3ZQ3uhO8Vj6yWJEIlB8p4BfNNpgJcj8m3E5CjaC4bRfheyX
	l7iAUI+jSLurMef9jnxEJgTtgqDTXd1k4TQxHo8jWVB99BCHvIytDc0SZPtJrNzekGF97y6J//r
	pocgKRaIFb+6KzL9bwdgBEs/oKugxb7Su5lHSYCTcG1slsmW5GyzaP5a0x3IV788zOxLe7SkB7U
	xXVGMwAO8ZWaJJFRjiFA26nvPqW1/6yZFzWuWDl+1Dyp9Bm2HmFaxPMGKBY5lUhWY0LOQeXsbt9
	XZwhcrA572Q4XermoZroyH/QOaoIKbCz0uI/4PpSUrmS7qCyIhXXlM3MXPxzhLvh0O6TBCR2Cx0
	kV65T6iFh
X-Received: by 2002:a05:620a:8811:b0:93a:ea:b00e with SMTP id af79cd13be357-93c3676b6e7mr189296985a.30.1790246448563;
        Thu, 24 Sep 2026 03:40:48 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:93a:ea:b00e with SMTP id af79cd13be357-93c3676b6e7mr189291885a.30.1790246447965;
        Thu, 24 Sep 2026 03:40:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:30 +0300
Subject: [PATCH v5 14/42] clk: qcom: gcc-eliza: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-14-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1MzmGv7pYEsIWvqeCUGVRjIwXDIaZi9bQoFCu0NoLrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3nRBTZM/XX2RyPm2MJxG/wgZ5erouVEa39m
 JbsAF7RhpeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT95wAKCRAbX0TJAJUV
 VhYKEADKuAmtbqwmNuZCpB1UZjtFV+oGg14tiZG0zd6QwWLOtnNEsPvlsrSbAnMdZrpZCwlo/Zb
 B4XmpNakB5/+Wl5DQJEbcuk7g8O5KkRuc6XSjhX6HxTVf4LPjpkkjPrY86clqJi1do9Mp7yNWnj
 H93jGPhbMdpXiA+FpxN2V+MbczLkiA+8GX7KaD1+a6jEs8+JcrbNWodXklomcaOfea57wWere63
 L8gQMc9U+mylF+gmBOXMRSTWRPVuSINGTrxd/MfGm6cG/dGX26pmNwapIiDnsLJCWbGHFxTJ2NE
 Vj2zVc3m5eJ1xVC5zTaZooLVBMZFUP0SuMxJLiro4HPTWqDKBAhyVMfuoTRgas8T8jUxXTDQZbR
 iEX7jP44xQNAB9TZWx3ZnLMz2MZFoATYVS4EZAYg4JJ4kPBz0GCNlMXQCLy87JTH4Ud08TCaF5H
 zx+0gtqvdnWv1FKmvUE06iHkgLDVg/KhuVt/YSG791y65kOfX4XtXuI27iIR3Ov+YdlSBhCoryh
 dmnM3taAKjE7mXWM9LihmPd454IznAEx8GlYh5usPcqYyRdkz0grnajGCJ+Fs+sNNqM1uupBOUM
 UiENGrqgWkHmCzJtSILUchrsu6+seMV4F2U7s7MWvM+BZR3IRdF4O9tCMI9hK+FWlUF9e+XSxKH
 ZHeqmwOxZN7jcvw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4fe31 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lgFvq8bPxKKT3kYZ0-wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 6M5wFmW4vBnQCYv17p_uuVVSCdE9j92M
X-Proofpoint-ORIG-GUID: 6M5wFmW4vBnQCYv17p_uuVVSCdE9j92M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6oqGbgTlSDug
 je0Ed+8UMcKJON0umn8vw75GAXt28cravizoiGkML290mR+eZORqsMJoQlPzl45U2Vo26mrsWgY
 NR3XjBd8vinxMjTPIChBQxRxfsQcvXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3KfhEPny0fiv
 wL60ix1l0dUUbY94paMaE+bcSU31XrHHLcW79tw02F7+fLHo0asqH7OigDih6hJX+FprHJAkfVl
 mT1dos/NIxnrlZB6P5prxWz8qqT1yoa00cqdV8oLkEOLCl3mjq5iBAJqMSKiUw+rxCRoHym0cde
 +pDlwUJeu3RGzc7cfiaD7UWHiqgJVAQ9Xkb/Nk1TNdtNCipexncuCd8I3vkqIuvX5iGPVzsJAA1
 BUEGp/R88nw7p1cQgNH4e+dkpXtgN5A0gAIwYc22g1PRomeVKG4V4Jxw0JE07ksq1n9S5v8XsQj
 scohPPD/EqDHBAOgwPPuzhhJtuFzs8xXLK2FG48xadYdQ6wLpJMJ83IdiQyEYXrZh1zzwhEmZxi
 ZRA/9mVDeCjTEzV/7MFMWWRu0QNesUqG6jixEVBCs6PLbDdt6eyg3+eTG1uoGiXmQk0OWb2QEwL
 77+IbGE3suBVhjiHViw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: 6393a36fe184 ("clk: qcom: Add support for Global clock controller on Eliza")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index ee486c24fe66..064771726e9b 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3068,6 +3068,7 @@ static const struct qcom_cc_desc gcc_eliza_desc = {
 	.num_resets = ARRAY_SIZE(gcc_eliza_resets),
 	.gdscs = gcc_eliza_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_eliza_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_eliza_driver_data,
 };
 

-- 
2.54.0

