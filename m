Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F5943CEDF
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605655; cv=none; b=LSG0MqtE6tdzMsKsoO0x/O4+Tzb68Oa9994SDMdmbKkATXj3C69c8H9mB7z5e02RmyEH3z23yEC5DA21wccDtQwZ96fBI/SvWraQKPF1o4C/hbV1QClx1sBvi47dgWPwYjV9ueJoIgF1jk0Ydk3FR/lv/ZQ6NNIfExYMviQXVn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605655; c=relaxed/simple;
	bh=o5BsJ1d63lHRYY4XwHw2Wt/Lp9CliM2aWMRETby61dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZzdeSv2swaoxMbqEasm18DnyQIqrQiw2dZjmNUaLZOIU1bZlXZKlACvj+9paW1Pc6Lk5fKSVO5tOETHcBWB7FW/RuL7aoETmF0QcxPEOEh9mODzECB5/DkvvDbOnnxcF39pq/9uT+na8EY+4E5W4FjNaM1UgCG58Q7YIkI+mLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZEc27ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJWdU5s3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZEc27ej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJWdU5s3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9GXK248276
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+ytMUmOrv1qZfBjeDI+nLZ1ZFRXBO/OXE2KQoRDg7M=; b=IZEc27ej39QdY3oH
	Oap5GfzpoRIuYhQFkBMhhecL+00HybnNNAN+vjzcAm3+Dan2AsaCsa/DebPt9lzR
	eX3lk/DEiVcbShCVVLJhS5Mw8HL950mNWgYT9QR/tlJ0O7iOvlrjYtr5XQ2uGwt/
	8rwsq3FgTNjL+XV42Tx2Zpm6fgzv/35DHI8ogjCWwZS9prVepKyrKGG+UyghC377
	iIBWp25v54yskgGDjcTC3vq8un28xm0Vzu23zQ0EboHoH6NwGm4igFrN55mG4kAT
	G8+u+REOyLukc2+FTjGjM+qsOYzuy54h9wYtKMVt2D5TGgly0irD6Ycn2lzDV5UP
	6Vajkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs8fth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:27:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1845bddfso45896635ad.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605653; x=1782210453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+ytMUmOrv1qZfBjeDI+nLZ1ZFRXBO/OXE2KQoRDg7M=;
        b=LJWdU5s3BGtfpx2wHHXjviKPYLQwz3/wanQbh8I2sJ9PiDUHPsJcPq5G3WPoK9y6Fb
         3qlmMEkvwO1wcMKy+6qe8mbC5hNrLckixax3Rlp5u1URW5vYmTj77ocnzLlkAfR6eNIy
         JrI5AXcfnjd1weK+7glpj7jHuA5TPaPPCrVyK1SbRVoIIvrx0iQ5GbdkdeP0o9EZSMm9
         qsff8qIPeIQDS0bY2qYw8kZPm9PpYwsg2hkR3GkBZevpHM1+TOpNz96l3GCIBLQXhzWE
         SZW9dNBdY4p1eL5/1bf8vI3b+lbf+yL2+2jqpIqdsue00WBz6tbVyRuEbGZerSbYk2dk
         9Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605653; x=1782210453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+ytMUmOrv1qZfBjeDI+nLZ1ZFRXBO/OXE2KQoRDg7M=;
        b=CMhaCBN/RQqoRaEEuYizG5hKpAdDUQo3PuSlDpp+ajN1dz8Lq9IQe7m0pbDCLRsNIO
         Ko+lCJIh8uP+be1B7fhSI4AXTMweTrWLHiHRGoUbBfz2CexBrmNkHXw8nk260x1E73uh
         r3Rh9gAyICHzSOeooysckP6k0GORNXSWygJF61Q3CfLA8IX7VcdZQreWMWw9XsChU3jw
         VPqkXr04HbdIBxhTcn8ek8imNogZbeEtxXf26hcrkQrrUvQvqRrJb/pT5Tw+PQMMdmKX
         vzvwiHEn7PQBQLuKwrf0NFbXl5PupPk8tt2imlUPSfrzF1AtMh2BWkjdLg2yZ8OaCJ2K
         JKzA==
X-Forwarded-Encrypted: i=1; AFNElJ+bjryTD7kmrl6lkjC2w1t9EmmwiGrUzBKR1q1Z2ozD3bCVTnOOhca7UcOi4+CXCmmkbXsr/V+zn9qx@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+YpRXxY9ix7BeI5l2BUHQ7EiCtyLoc/1vhEH9poQMcO+8p4Y
	LFwsWDRXTf4khEf6SdAmAm9HrpjG7dP61cr6ZwcHuXXnmur7i2/J2zcJRtlrqPEMbZEANGwYIa2
	Z/7Xbyp9uPMTttbFAW1Ay6jiuRfI+qMbNJQ5RP9voPGeWM2caDEKcqGtba0BmxD96pRRuosgE
X-Gm-Gg: Acq92OGKxER7X+iiqCWCI85j9k7ueT4MNR5lHqL1dtgCQx/0nNrz939E2AY3mykfSTP
	FQZkD5S2G4ApF6KRgmq6vw5GJ/MF7Q4i5gQeeEb9FQNa6plANJ7GjI8+l55K4Ag+CvQBC/Ajl8J
	nPGtGKdVvRm4ywgTJ+vF/GVIi612Phh+QpdJ0zc5oVQvO1q1WH37wVyN61PUJg0F9H+siRzhE83
	d7MnlL1Kq4yJYklC6mQQdzlfc4HhiJ18Cc3bB/rFb4NvgWnTuQNBeZ8pbwEJ+iMGotrD4jHgTpr
	q2NZ5aDhEyC558bvbKCDUvySUv8JxEXxrax71V1S1TVsm4CL4JGNd/yIxCA2+2ZKZxkD4YZcJHj
	eAz/Qa9p1lGXs9Az3SNfIkp2f4M887L9nAKRkB1euLnK3EaeTzQ==
X-Received: by 2002:a17:903:390b:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2c411d7b1famr212724785ad.22.1781605652939;
        Tue, 16 Jun 2026 03:27:32 -0700 (PDT)
X-Received: by 2002:a17:903:390b:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2c411d7b1famr212724585ad.22.1781605652506;
        Tue, 16 Jun 2026 03:27:32 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm118343685ad.45.2026.06.16.03.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:27:32 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:57:15 +0530
Subject: [PATCH v2 3/3] irqchip/qcom-pdc: Add puwra compatible for PDC
 secondary mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-purwa-pdc-v2-3-8dda7ef25ce5@oss.qualcomm.com>
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
In-Reply-To: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781605637; l=1015;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=o5BsJ1d63lHRYY4XwHw2Wt/Lp9CliM2aWMRETby61dk=;
 b=rv9mgXSnGYOD5BNxgor3l0qJ5G18o44KdmHx6l210l8TI3XtpV87JapyaQSO73xWB01g0qwhK
 c9a/CUJX/rNDSHHa7rdI1Hhc0HIfJHzuUOIiij0YuyeKW1R+1ytc84T
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: m_bFIUd7qWWgMmaOFkHXJ_Tq-bih7jBg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX4ih5dsXzxOjw
 wiF/4pNgfj7jq7l7UHynJHHilTEkj7c07NRg9+XpdLVrAFN2/PVqtazZ36lsbLOReiEgBY8x+Hi
 YHj80YuEz1r3gLtWXOmV2z8MPnPCG4eZCOJLCqtA0TX2FtzqxnE4OLpy9g/aRbkJS2aVsLWSQEI
 Uk7u/R7Qh9PjXb5YWE2wvniyi81O7+PbQR3nrN9VSya2/sMAt5EENb3npudNZNSr4TA1mULcMkF
 nliz54dAxh52Pim7CpYmToiDxJN+AxA4QUm8ooZhOpaTRMVrO1WR1C9B+YQulr8PP8Zl5u4vGk7
 0aEwacD+pT1kJoJO3C7hHCri3Gwgyv6i62CEHM4hCZDT1n30+y0cNS2EDlKK3vBziY7edMO4/Bq
 DlDqKe+MHDU8cAQ1qsvElkIloFewbD/ClIFRO3Bcwe9CM4YP25PdqvMoxEUYSwbqX76wXTyanso
 h0Aod0hWVo8YfZop8Hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX7Zb/nwaAByCF
 y38USruRhuJSaupORae1kif7wcM01WAqICdP9cs/00hcz4TP9eQz/ZcofKedczFTwQDEb8sdeZD
 X0EMNm6yii+hc6lRLQyxXUSsZrnMznk=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a312515 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7F8GWd6Rnz8ceMZFFMAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: m_bFIUd7qWWgMmaOFkHXJ_Tq-bih7jBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160105

X1P42100 (Purwa) and X1E80100 (Hamoa) shares the same PDC and windows
firmware sets the PDC to secondary mode for X1P42100 too. Add support
to reset the PDC to pass through mode using qcom_scm_io_writel() similar
to X1E80100.

Make sure x1e_quirk to workaround a hardware bug is set only for X1E80100
as X1P42100 have this fixed in sillicon.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index c6f2935ff788..0f638556d4d0 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -704,7 +704,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		}
 
 		pdc->x1e_quirk = true;
+	}
 
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
+	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
 		if (!qcom_scm_is_available())
 			return -EPROBE_DEFER;
 

-- 
2.43.0

