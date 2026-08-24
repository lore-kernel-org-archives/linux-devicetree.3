Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351333E7BC4
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554420; cv=none; b=BZIloWO1betEFg0CJHSzt9DtdouV+f9XRCX6iBmpE3XOh7ZmAoLhsHntXBbfdnt7JNAhVd/UTJGbyLw2Jd6oYnlxdMFlbDb6Jc5axdO5/v4wrqOgfn2DzPwZnWVBC6lb4ijxomZ1kNoTzU13eub+oXOn470iw0jb0hsAjjK8wgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554420; c=relaxed/simple;
	bh=oduGKbJOLcr24gnhycLadQ58p2O7SgVD8j6sJOHwpkc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E70aiOZKUfqgcLhNRjs5nhEupNYfomYH/N1bBMfzHsOtev3vylwCOwYaRIB3GATPIhrZnVwo+4Zg2Hc1BmAA3/T/4xxmpyJiNwdNWPHqhVmKwiJcnAVumRlMHn5cR2ubPZbJVtU+qJbF8vbkOFMKNYjUg91pYkuoMJYARpStCFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSUq0XPV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2DYDRyE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSUq0XPV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2DYDRyE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RKGL866806
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W0W+vMFnmEUMKLU5vP5q2Q
	n0itofpmlQKJKp7xqVfMQ=; b=PSUq0XPVDsjn0TsEKZhPLobd3n/F+HKCI+v9W+
	9R7fywgrT6+bbRgBAF+Za6Txa4m2/M0Lo94xUjjQ3+OPVBJCqku2CEWp+Ultx08z
	VyIzq4pO8Fd7cWbC56xpaAL8Mtrj040Ik/vcjRM7mVbwHVyHmTAP2siupvVTtSf9
	B0dnwQK077dVrU0jidHySK9vcORvheu3dDHqdgS1iCokDG++heDBryMi3bcbOjum
	MstC6KFz5XjHGHLi7ZKYw1FCwJZK3J61bLRaz4xoi19eZJINcvt5VVAiJGswttOW
	gHAxTI1e8tMbR+1Ryi2Bo1RNVPNa9B758DtrcQx7o2/uLrJg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwq6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:53:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so6773664a91.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787554417; x=1788159217; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W0W+vMFnmEUMKLU5vP5q2Qn0itofpmlQKJKp7xqVfMQ=;
        b=i2DYDRyEj36/IPW3JfmziwoKnQQrcY6TeJT3ItL3V6fJtmf8Z39ShnbnxQz7JbOEei
         ESeuv9zaF/K7hvB+Hdx+qXvdkjA14Ee3yAkkuJrtTkb2ldkIRduNxP77effzaieQLr28
         6p8NpUy4sSB/SwXvzj+iqemeqvkqwXZCJCWRT1I2wHUxl9GLI7MQu6Ea/lzy+Hi0iMIs
         shJ0PB6kp7mSx5sAPH55s0nfq1tTr/BXfd0vklwBHSmhYh1ckxwRbeEnYaVgys9VLBlK
         MMNE2Mm8/UNea/atbJY+4t6arIciNXNFXyH1vMyM9amcEaiea37QC/Lg3ALxksnql8RN
         nqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554417; x=1788159217;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W0W+vMFnmEUMKLU5vP5q2Qn0itofpmlQKJKp7xqVfMQ=;
        b=BJeIim/dO3O1qODnQNRQWvjZbID3AYvs4If0FOGcZMAWzcVPEXbrikqUEBVrBML3/7
         M2e26Tx+S6z31ICpFd9X+CYBkK+2CTqX2isK47PQndoZ1QhFDUhYCsH1mXXKDpbv7u78
         rtqhkbd9DLSOme0v3fuT54Yn9POE7xE5iWZnpW7kn1DW5BcctQOWxYMhG9XqEz2lP8lU
         u2NLfyDGAWtd9boXw8HLGiV4DzFWNWG4vfszYlM2gtqzqw8cQTkz9mtXszcOclkVMagP
         8cNBEBYZ01tQzK5ZUx0yJfRTFZt92uyLeJPhsQs+HJp7Sb+LWqSTBG5CKB+vxuytQ9fl
         7Rrw==
X-Forwarded-Encrypted: i=1; AHgh+RoAPItOcmq56etXbBbwWRAY58h+qZlbD8+1j97sQGtNBkYy4ckTCM8a4mtc2JHhkeymKwGixCmAs+uV@vger.kernel.org
X-Gm-Message-State: AFuF++mr4FbFeulr5BAQByQPTYgQMkaDRn+3G2TaWtSndWoncikRAwac
	8zN/Di+mtIQUNrA22biYUMCer07QUmPAXT5dAJZD3iQ7pfNp12QV4JfF0rRzBj3lcw86E/01a18
	QZ8Mani5hwLXT5xaw2nR22UWtwZ69gpEZagKtlzlO4DP27c6+mmZ0TZKuuueIQjP4
X-Gm-Gg: AR+sD113dT+VncZ+ao5q7zNXTUh91ATqKVRE9XpDM8You+X1KBEdnGdrPj+pxiUfiv1
	5dwx0jhcxOzzNtopxGXPdKtldWFIM4ulkb/9bs1OOGbBfNXTrhxyog5/4xrAt0ZlwCZcIKutCtN
	BYUuJ34pekMm9n79cG+5x1an67fsN++sEA0DfVma7DYjBQWtVMXSJxwFe5kvyoCOPLFAGxapuOO
	XzGfeMazgVOnA8h2Cf8Yf4jrr4sBwvpYmyQUoH8EmYbXLhhXo+4m9p3oUTSqeXqy8jtLrt+bCh3
	6BkHO7C26+bLFgMqPvGbfls770BzkBiCPRVq0n0rf7Yx00GId/vj4jetcyYk/saCBjGO6naWqos
	2QMhOj3yLglfe96CiE5n6cn0d
X-Received: by 2002:a17:90b:4ed0:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-395dee539f3mr31623084a91.3.1787554416847;
        Sun, 23 Aug 2026 23:53:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4ed0:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-395dee539f3mr31622999a91.3.1787554416421;
        Sun, 23 Aug 2026 23:53:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4b240e7sm8768031a91.13.2026.08.23.23.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:53:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add EMAC CNOC APB clocks for Nord SoC
Date: Mon, 24 Aug 2026 12:23:28 +0530
Message-Id: <20260824-nords_emac_apb_clk-v1-0-290767386bf5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGjqi2oC/x3MQQqAIBBA0avErBPUYJCuEiGmUw2VhUIE4d2Tl
 m/x/wuZElOGvnkh0c2Zz1ih2gb86uJCgkM1aKlRGq1EPFPIlg7nrbsm6/dNGGWwI5RBIkINr0Q
 zP/90GEv5AOHSh5hkAAAA
X-Change-ID: 20260821-nords_emac_apb_clk-81863e60d066
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: SfyDj71qow7TIUCYMXreFsmXVSjoZtyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfXwbdgHgsbTQNu
 1qGjQbQBaQnujZrDuXH9NIAqEQnGLf4BOmj0A3MrteVezrZgHl5ADyzhi073fd5EPgWXp0KHFup
 Cyj4YLnt7/jCwv21vp6mZB3grSTtKoIstbX2S/NJUCuzY22x4JZLogFD70WZ29Is2cVEzzipiyC
 LW0TWvO7ZT25ZBvwbD1DZTf1+5mACbUqS04MtTGaz9qBYx6JMxiy2FEZ5suuKiy/WoY0x6c2DJA
 25mO6nivalyx7gL/hztsnmn5jqLANK6PwVpCqu3M1Y6KH0ZvZlzhkIbIqNrltlI4hPoRX/eh2r7
 cHCDTUFgrp5Va7bWEO7myMg1Rcvq9VCs1D5XmE2IkoYiZEi8kNjEHqAkvnQtvMwhdlMy9aVA+Vs
 rwUJKwSsmt80zslIJW+KPZMYYuHOV67b9pwAS8tP+H6axJoRsLpEvyKfm+AiizL48OGOc5f+yZp
 k12/NUFAxiH3lqzxrWA==
X-Proofpoint-GUID: SfyDj71qow7TIUCYMXreFsmXVSjoZtyZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1OSBTYWx0ZWRfX7irlMVr0jbGf
 WS7LjuzYg8Hxq4OxSebn9sh9ZvNX9YmYOgUQcYHKoYjM6lo/qXAmdUZmu4RLeFWFuEwVnIZCR4+
 FzAsi0muw/nOh3Rkl1sJymfSPCfjo5M=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8bea71 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bb9TpexDCs7grXk57bMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240059

Add support for the EMAC0 and EMAC1 config NoC (CNOC) APB clocks in the
SE_GCC clock controller on the Qualcomm Nord SoC. These branch clocks
gate the config NoC APB access path to the two EMAC (Ethernet MAC)
controllers and must be enabled for register access to the Ethernet
MACs.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add EMAC CNOC APB clocks for Nord
      clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for Nord SoC

 drivers/clk/qcom/segcc-nord.c               | 32 +++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |  2 ++
 2 files changed, 34 insertions(+)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260821-nords_emac_apb_clk-81863e60d066

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

