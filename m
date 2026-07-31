Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C24C36E494
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478500; cv=none; b=KyL4bn1K/ReNZ/kWqnaZkmvQzDEAFHNUkwmcUHkei52HHCYxmAVexW1WUa2FuQcvoAL2TubzN1Erq3vtYxbLoh1+tnrInzp97Fe4eW6FneG3UXbsF7TGAr/wv8XbfKCyMXjJQDGZEtQu8vwAKkX8sJD9X3gruuUNY7A7EcnrYv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478500; c=relaxed/simple;
	bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ky7imKP5uI4f+XSbLQtjeoYJzWcQqQhwnM5d93jQK1OPdxwx31ZXPQfniZzsZiuSS8mo1cj0S04QJQsOJtYJX8CimUZlKu2hScarENsbWVXXpnGsVX3YxiqXMmEef9jfmV9YyfSNXG1aE6o6N+oOnfy5lbinO+F/vbpNOeeDA6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkLR0aKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gv6KqldB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkLR0aKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gv6KqldB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V60GVv3131093
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=; b=NkLR0aKbHBJbWSkd
	epEzXWnKKZZ7rgq53C7kKaKv9IZa5szXalFAbQ7YmhSXaF7ePoSZP8F+Uw8GfbZ5
	+buhR1JionJBw26e2JtG77HkTGOjrn5sIcSPN+B9VZe/jYG8u/yVaRYVqnwHuYf9
	Qy7K+L5dt4vHvZTMyvjpF2qmysUAU5Xk0gkNosL7p/cKk2tBFKAJ9MsAdlESAAkU
	VRHxrzLdLW84ksbz2TWhsI5sEPIQOy8JcZvmBsIeaKgT0EL6Fq4cJqhrsd9GrHvp
	G9YT/dGqcJDj2ZRZILjI/XsGTlkoYxrvpHE1zjBWToqXP5g/l5gzjAlDubO11vci
	RE6lYA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp2ar1s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1205419a12.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478497; x=1786083297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=gv6KqldB435Xextz11/WbJckbmnI0vcCtzMEI9aQLAcvkHgZdYW3xBPYG53/w9wtdF
         JW0sE6z9KHKbdLFoto4Hdp0bRRvXvRCUN5JMuSsCJfb0V+3Od5ACcQIt8QeUjDoIhykR
         MvVy8HA/0c/7c9vNN39avUaLGqDdmeF4z8zX6Odlg/Eu5Ad/EGqZLE+xmd2IusIth9SZ
         ymJ+dJFQAp6UsG/QWwQpj746W1xNN3VPMe5S9SmRTCyT2e3nMkJ5T7q+JxrbOi15urYJ
         jy7m1S5Ii8rLt2xYmIwtD6G5OX2UreToy+7G3uhV1lAJ70eTZaXUS2DwzE45H5rwR1MQ
         aqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478497; x=1786083297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=llRFN9cI3/A8a0Xl14KH5PEyDlXdX5S5gUSqOqWAtKGsI1BtHLhOhUa+KkD/X0NlBN
         z811MDLrfIIALjeoHeIvGG3P1KO0bdVTO2wS6Ie33pujhqb9QWy2MZr0HNRo/1rP/QPS
         pNiAIDlP3LZeVFdZIx/SeD3jDhFdLhhP0bQRzhKlkjZSIcO9IVK621pJSUjrcrE0iJjb
         BP6UtXhU5iErXJjJc3JFOiFlax8pmn9V980SwajihbdcvcU3lewGkuR2TnjQ97kYV58n
         Z4SuMDc90BlxJ22+6yVK942jK7KazrwpP4LFSZaHKBuOM5nrGt2Ub3ycwoCT7jQrrp5C
         i4uA==
X-Forwarded-Encrypted: i=1; AHgh+RrIkSn8d4em77i/vXvXMneMazPVvHM/QJm+shTds06g1hgFEK3UEYJkM+qjpecN32t62UIpF+D0dSn5@vger.kernel.org
X-Gm-Message-State: AOJu0YxzspxOs1lkKBTuv404Q4Fp/O3Tt+uKRfj5XykR4XixsYvQH8rC
	rVdAaxmbYPcD3ZFJ8r+gKxW77TPIWTyU6lruUcxUL7+ocuiJulTl1Z/sJHYNQFjlpCCozHe9UAJ
	NrC/QvL7dcOk487ZqSPtCSur6cZky5myL6gAtFJiP3/xrpyNWe5k1wstSViXsf0px
X-Gm-Gg: AR+sD12JFAeyiY8tCkBUlPHWUzma0kwkRMszJP8uWgFdV1vjeFvLk8rmaBUeDAHily8
	Z5KGZJ5xzxNtqZae4O0v3Jreor+Zx9ZlHoTsarRRzNYLJZNYarFktteqrDYqSYDZ+ikNFAkQSXi
	7/rwtkMmKRn3Qmr7I+QalmmWX3wX85MnQURHdMFoMa3l7nZDNFrbKy7AeXk+qtI6+KtAXGqoLgF
	8XwEq+w6TCsO0WzUcLPTL0XPAx5sJ2Wg0u0kR2GFT73NxKpAvpdk52dzFkFElqevomQPsoU7KIY
	QeDSkixsxcGWk2wJB3HWEKJuKdFy3X1GKrnViG2dxtgT00o/0aaBWxAdyd1sbGqxJw/0oe1I3VM
	IUgzR9fuEexVgpKdgRE5J3YWNhtAnJjq/Q7+q27yd4qhEXRwoq3NBseZgVU/2DUsl
X-Received: by 2002:a17:903:2c06:b0:2cf:b23a:3e68 with SMTP id d9443c01a7336-2d047e9cee5mr6443855ad.25.1785478496785;
        Thu, 30 Jul 2026 23:14:56 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2cf:b23a:3e68 with SMTP id d9443c01a7336-2d047e9cee5mr6443605ad.25.1785478496338;
        Thu, 30 Jul 2026 23:14:56 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:56 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:14:41 -0700
Subject: [PATCH v4 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4-kalambo-crd-v4-5-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
In-Reply-To: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
 b=NMJ633lye0+QqfIMC2BHll+k35k+yOYUDlQcLNhrEoNYSzWvLwG5jW3M0qyJJQFabfnS6kkcx
 dGc2zQ5snb/BunZ0aajfVR3uWZkq2jtlGTbVCMsSHg6h+LxHNWUFU+Z
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfXz113x9B+Gcx6
 7BdVTGut7w/PX2U0N+oyEJ0AmgM4u7M1vWRl7wKfmmsVZq83Zg0Gl8lRpPRpbNnILJt+91NI96I
 h8O6N41iKo5qAXXot5s68hGL+KtNkwQnzurF0cKUtxw1xCjZ9Q08A8vUwQqGAlc+DQ/eM6c9fd4
 +t+/r+54BTEKDw6yFJd2bbHe+vehFl8Xx7F5b578EmwHwco3BJgfZTme+e8q/bhXd8FKGvrJshj
 pfX5OOJmW+lpJOU1iEJm9xzxVuMssmq2ztHBWeNf+zuIecD3rLc1XLu3vY5KomrLTVPEAm8epOV
 zYx+bq7nCzGYTFfCgiR/ELAnEus6hcHi21VdoM3GPaDYiNQlmUD8DS9iePzEN46Xf/GNEv9xHng
 foimgk9bL0NH6gE7+j/YJiuRDsnCM6INuRzLmLogt1byEfjp0Ta3Qo7eeo/2lbYcL6g2ua5Gwo1
 LSZbrDW5wWimsmh43Lw==
X-Authority-Analysis: v=2.4 cv=RYOgzVtv c=1 sm=1 tr=0 ts=6a6c3d61 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 5_4YWCXNc3kizWRR0h9XINzoav-Avwo5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfX805kle/3SvUW
 77E3XaKwvB4ixzGteCHLJDiCh0LpPU/ODfnQobiARUtYt6Cu84ua4Db2R19F36f78tKM9+ozWyD
 AEIkrloB+RExJjlZdosPuv66gvDB7IY=
X-Proofpoint-GUID: 5_4YWCXNc3kizWRR0h9XINzoav-Avwo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310041

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 0209a02c390f..c5f79210ad52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -112,6 +112,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },

-- 
2.34.1

