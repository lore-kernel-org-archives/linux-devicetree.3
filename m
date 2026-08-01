Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6CA278161
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593656; cv=none; b=m/0TpTcSYfcnbfucFzguDSXZC2gFqJShAAqCIyMYynpldzAH7rKF7TamTY3I/MK03PJNAJ7VuuCXPP+Qkd60taYpkVN4VXoT7lAGvJPXZBJLvLioahHQpT6woVHJ8F/mrCdM2C74nCHnaGIbf5aZ2qUvZuu+ikdZBOGV8m1uYjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593656; c=relaxed/simple;
	bh=+GkyL++ts1tWFcTIc097ZAcnH13RcWiW5T9SXWNf6Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7NWZf0ytIuINhVZO+J4Tf+aV3taPRCFc/5E8wxtpPFxBxg1gehX3SO9rC+iOlHREPmH07fR2ui2fBHUt/I6UyzJvurdba4hZBaG7dyiwWTQVxLxofn7YnElhyBzX6E9DAIibQYOxsGhn/DBhc/H9del1dmgr+2oUU4C7G8Hhf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJO23uF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dx7dJ4qu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJO23uF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dx7dJ4qu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CaOmn2394028
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 14:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCEq289oGWPSqWxeEW7ACdtmmWifBbU77U9wvk09M3Y=; b=IJO23uF3Y5xB7Zo8
	/nghVP+6wxAm0dQYENSMm13rD5rWjMJIz+7hcqNjkmJhaV7vczLgyTUzlzSh3Bg1
	MexqT3N43iiSvFCCUB6KeGPUTdoiONT6dFIYj73bIjv7X+PUfh78CD79YfrfIsjv
	FP7Rjrp80n3AAdyZz4SvLBIOPz43nXGjnWIiwuDq4TsFgs9Z4J9bdkmBXP12DbJP
	L4BkSbGl3JKNIHDP9WBPOm3qA6RpD4MX3lmK73aU9jMV3k42Xp6YX43EnqqYEx6v
	8TeKjhXN/qdZyb1ggLxdPdimMq/Z1/SQLlkoi1PiJvABdAQz1C8/rW8xEEdrUbv2
	xWI03Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yggugn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:14:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so3166385a91.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593654; x=1786198454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCEq289oGWPSqWxeEW7ACdtmmWifBbU77U9wvk09M3Y=;
        b=Dx7dJ4quLFU/MyhMn0jd1+MWTA+VZb5k0A/T4F9juSM4jd8uLiyHdyhKM+wKbFzTT6
         t5BEuLRGxn0L3eZLVtvK8KKmvNjlZ91y4ipZzeKPlueLFWxfViwXWNQRdvediT9qpKKX
         x/kMk/Y0cr2uDxGGlWD8UtEfzuovnhzd2aXKu4BiaadOM2WHn1UMubWtIK6EH743U5Bc
         +60AvBd/7tbSQFAIFaMd9xYw5ozSHE3QqdCIzAfwKzE1gNKYO5dGLbBbfNwVUYLOmH3s
         XMerzYQRXwH27bZvyW4vTxzNdtgaFkj6f8hXxBfXgXywbBiaH5Ll07dS1aSsOJnRTXAr
         AFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593654; x=1786198454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCEq289oGWPSqWxeEW7ACdtmmWifBbU77U9wvk09M3Y=;
        b=iYN6GLPvZIgbFg6ejMB3YR1amjL0H7b373zHxZQ5an+JiwPrQWVWal+IANVDJdbCEO
         Yaduvj5s4E4bgBhpGWwG8HbgNXIlTB4Bl/X21iZR71tmEcmYWSzL3mBIntBEb0fkdpbi
         +jOkOIdNmrcD15y3qkLU5gPNDjYCNphHelRbbTbbmHKOdgxIDFpB6p5NMx2Fm5xtzAIs
         zvqZHdcXkl6h6nniajvBqN9az52fN0skJwaBStXMm8nKfkf9h6quA4UKA29XuOCzlj84
         2Az5d733rPiKEpmcIuZWP5snBanG/2SrKbCuZ9K862DqX3sgHyaDEg2CAdeo8otIUV4H
         hvtQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWeDC24UCbrdVCsRblVjB+3B8uidbrJFD1GTQxZkILspeZt28k7lYBE6V/mJtjU6ivGAHImRN8NJuE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/xUqODbb3irN6+YCJd7mn0P5rEspjWCgaKmJnkad0TwsiRe+G
	9beU7PgfSOVnUAmDbfgZQT3tCBo9vpk9k9XauTs//iSpwQWyeN9rt5MBbnN0L7cMkyV/f1BZ4/5
	ax9qjQJ3biakIUXLTBzKPwMPabOYDRFlO0jkR6yiR+daCR4K/CWYVJMijaEvu5Pp5YTYtlKQI
X-Gm-Gg: AR+sD102PcxQL3UG7YPe0LaiDB2yHQ6zFVQxKbowzAPikB/vvY4n6u6rLNXH0jPdGHs
	IpjbkrPsubPCEYTFMrWJZ4qSa3u6f7Yd7eEyNZP8YoW+eD3S9qchC5lAt73wxiCjJWgyYB0cxBU
	sEkV06yhIivjggKiseZ4cLm2/sKxNbSSvaWcgtyNLTbZIC5R1fmthCggSLrvIGG10/wPw5kO6Z7
	sgHkvx19SCtpXcVnr26CD/IZSBX6TlEkjsUHeXOamtgFc7DCHmQyIlHYqFSVoh4sHIUthEpEyTf
	0aPWkCh4iMjttw4tUoIQDpQC+1iUgezL4aie97Jo+emupZSwudpz0pK+N+uzXPJ5ffIC9mU5u8y
	Sv4DL4lchXc1gqAS194kfxm6J
X-Received: by 2002:a17:90b:3a43:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38fbc4dd615mr3153887a91.30.1785593654154;
        Sat, 01 Aug 2026 07:14:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3a43:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38fbc4dd615mr3153854a91.30.1785593653718;
        Sat, 01 Aug 2026 07:14:13 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:13 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 19:43:53 +0530
Subject: [PATCH v2 2/6] clk: qcom: nwgcc-nord: Add video axi clock resets
 for Nord
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-nord_videocc_camcc-v2-2-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX1kngQY4F3hql
 lm0NctbHFSbd2v9AkEwBII0BbYdWPcnEYY88bqLpaoMNp7as5o1sbE4Y2ewUgT0pGJViHpRJful
 h9TOuGP3WpoZEgP2QnTbZ8ywAJzO3lg=
X-Proofpoint-GUID: rIKZvPqm2mExlDFlpUfYN6hdRF7DZYGN
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6dff36 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=F_NcwHkHckZFdKgW29sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: rIKZvPqm2mExlDFlpUfYN6hdRF7DZYGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX1ErQ6kc4BMPa
 R1NrKpmGIRtXcy1i+kLV4kwuC+f99u7aUlYsmMtyaqoGR1hK2RNI9VhWCvhPXU+Y2lwAKwU/Mqr
 OnZxxWD8c0wHgSGgBPCxkgRXy17IGBVdsMuiKcW1D1NZyvxg9mkiIunP8zMB+eBqigFsx/o3AOF
 wQFl6kzebD3p1CTL9KbIr3LX1FKkZzspjPAOA5r53Izh1c+zMqGMby2yro0cug+C4BiIULfr9fa
 nM8YMhJOskD9iKyi5d0Z33TwxsUwv0isTpUm+FZALjHVM454O/XBS5L10e0MPqgzinVtWCOOAdY
 95SebJv0A2luv9IlKs1vSHY9S0zdvDVRIl2YlDR6CYDENEUDmcP4yQwT8eeyonVyjQY5/US2zBR
 oOWZ/ODY/cFFCw4z+u16LIdBY4LybW3xL6PtXYG2j9xFhZ5N43R5m/2HloaJnnNVRuhuszw+3Df
 773pZSVe1TS30EMI9aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010114

The global clock controller video axi reset clocks are required by
the video SW driver to assert and deassert the clock resets during
their power down sequence. Hence add these clock resets.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/nwgcc-nord.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/nwgcc-nord.c b/drivers/clk/qcom/nwgcc-nord.c
index e061c0623e9a468b87153f1b0ccf2e2c9e06ad19..280558f15748c95cfb373c09141b3023d7fcec5c 100644
--- a/drivers/clk/qcom/nwgcc-nord.c
+++ b/drivers/clk/qcom/nwgcc-nord.c
@@ -623,6 +623,9 @@ static const struct qcom_reset_map nw_gcc_nord_resets[] = {
 	[NW_GCC_GPU_2_BCR] = { 0x24000 },
 	[NW_GCC_GPU_BCR] = { 0x23000 },
 	[NW_GCC_VIDEO_BCR] = { 0x1a000 },
+	[NW_GCC_VIDEO_AXI0_CLK_ARES] = { 0x1a008, 2 },
+	[NW_GCC_VIDEO_AXI0C_CLK_ARES] = { 0x1a01c, 2 },
+	[NW_GCC_VIDEO_AXI1_CLK_ARES] = { 0x1a030, 2 },
 };
 
 static const u32 nw_gcc_nord_critical_cbcrs[] = {

-- 
2.34.1

