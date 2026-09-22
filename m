Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A33F0750
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051636; cv=none; b=Teyc/JJ21sBJPnkF0jnXCTcfcfNYFbuvCbiCB305wSpVjgSC8B/7c3hlEEJToNSJGEcMHnJJxILvUKH3Rc/y7X8+dMaTdRXjzggSTYEeKh9xbTMuF/MTnyzmb4cr4+PDALvHdE34WBKi3wXSSHka9S1DjbWhCW0Se5VikWphDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051636; c=relaxed/simple;
	bh=+CrABi2X/StxEwnWst3mUt/1ibBP9K16D9ajzjNs1nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ah/nlwdWSQXsfLMFDFAHRj2RSLzBgtzN5Q7YIN6ePf0/iXtcLBxw9r1mjk+dHceqmv4J9AzlFVqC1QHzAz3vbyLT6qva+vY320UU4lAYI+ESREHsI1TxlT/sPaBQ+mB7b02UaX5mF9tMkeIKJBU0PJHKCyvmcTU/iI85E7eoXHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdK/lU/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eajmPJay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdK/lU/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eajmPJay"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M4MblE3382630
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=; b=HdK/lU/KCvOIEeVB
	b8eXQ+pvxuQFs4/Fr2r9BmulpGXozcQQwxEsZZNsPVr0Cs6N5cW9rxH3AOgg/1Tk
	jp8AJsJ6a0o/PNKcUs0ptbqnt1ZK+Nup8jV0mMtIPMi4HzmUyVMNApvIIJOo5o0v
	uyPlB+0GyBiFTMV5jWdXVQHPCFCwSFLvOb2HH2/j5R8rZT71Yrq05VT1Y1ud0WSd
	oCdOo90e5egi6xAGcGCuncWz9cvM7o7TqQoBKKP9SzbZEgLhCygII7q3u0aBGFy5
	NAz3U1f2C/tOqo0jJSUEXXS4i2PUS+Ja2R+xOGD0yPyCgJeNb9HoQKDmWC/ftM0z
	FR1tvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj813f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:33:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso6570748a91.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 21:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051633; x=1790656433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=;
        b=eajmPJayqslaM8h7062zPfs2F7yDcfbH60Lsb3u7Zw9DuH9ToQqn3FrGNO3WVCqfbS
         1qloFmlhOn2J+2Z1iWc2LWhmToRijtqC2fL4YlQO4pigamWIrWvgPeozlkFhhcQ3BVut
         BkcPAQIJYPtkXDi8RRSbnhSPMjXhsbQiElqUTbYPpr7UQeEkY1tWAgp27zQtj/tzaZ8o
         m7K7bsLz5A0Na1Wl0OUzxB5yWwxIE6VBeqnuP6m7XwaCo13W16TSjBu+7qdZifKkIelU
         tF7jpPsuvw8vdLRkg674lmR8NWT1/N96rlq6dYZ05dSSlFTKIVxyPdXdO45dWo0Z8uda
         hb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051633; x=1790656433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=;
        b=YbRxNdLIT9oxgD6fIzdmzPu3vXKcRm1WpOPLzR+mdGnmb0PKNuK5MEmqPxG8i8wwjv
         s3NWTUKMAQhsDJWHUuBeW9KeRg8+oVXGHb4V3Pbf9oSEfqlIfE6YXeNGLOWyii6PLNaP
         u/NgaAoFBMNoX7RzHRw0nMt63cvGOdiMTwSOwLBBFJauMY7W1OyGTi7S+pXqa6djaIPj
         MLkgQM+t89eLuYcjEix7Lp89RpukcybYtk7t89otIuZ4Y39tLV4nXB7qlr9xgGWA+mun
         JF2zxh4z5Ec7kZiB1N4lp3FJpj6nNy6MI4iOm+PX3ysPLdr5qrfzsu8l5daa7c5eUywQ
         j4sw==
X-Forwarded-Encrypted: i=1; AKwUvBw9Ts5pfFdBWSPM5F+ZAjph5vwY0OvxNz24ziHj5ssntQLNyTW4+vJF5ydCdr41nmEDAcG0r0FJlPmK@vger.kernel.org
X-Gm-Message-State: AFuF++kMIAhaCMcfkX6+b3UI/z13nOt2ad9kYHLQmv/QJbP4nbWyPu1T
	tF89DwbxDCsZEJo7aZEBhdUAORaoz4mQtoxeeomtz6Bbd+BcHfZrSrmqlPJ43VE1Qng+qbCveD+
	GwQ46r8RkiSkugJIPQxOex66z0rWH4v2/C+ZiFXL0AAwHPQmnKZhwU34YwVcGAnq/
X-Gm-Gg: AYBFou0z3E36+cuXTMzzDRefUqyThs6q1J43dU23WWMSSj3kk8muEoLAMP5ruNyNnuy
	Y9dAN+anxjz6tL1UekptewpC6AdOQTrYx8T4EXiHKzBNSzKIyK+WX7AYlnG4MVo4DSg6Ql9Umzv
	1/MObNXDjO7QzQpIdal7rO95nwMf9vyeVMgkvcuxJzuSIvV2054G4F3S25zmyGtbblFMR2W6f55
	vvXSrKD9DlLuR1AA0W82dTYFVwNS+hT5F0oZIcHV7vUDocoyBk/G2pDTf4ZO4x61m/Ma80JakE/
	EdfNczSCbqghl11e0zLVYd2FFohL2zFgO110APR8DTsFwLBYxpwZZEp/htyM6RDzLQO7zeUM7A2
	ZvUMtgMrh7Mi+ghXegXu+LsyolIqWXC1PI0VhDxhsqIBsmFLPUKGCNxRTEx4zRhXQvOdb7zA5Ym
	kgQ6AbV7fNax/cy7GrkP3YdJjPHjBzgKNlJJs=
X-Received: by 2002:a17:90b:530f:b0:39d:fcbe:c1ae with SMTP id 98e67ed59e1d1-39e54ff2f17mr19428376a91.23.1790051633396;
        Mon, 21 Sep 2026 21:33:53 -0700 (PDT)
X-Received: by 2002:a17:90b:530f:b0:39d:fcbe:c1ae with SMTP id 98e67ed59e1d1-39e54ff2f17mr19428342a91.23.1790051632870;
        Mon, 21 Sep 2026 21:33:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1906375eec.12.2026.09.21.21.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:03:15 +0530
Subject: [PATCH v2 2/3] soc: qcom: socinfo: add few more SOC IDs for
 IPQ5210 family
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-ipq52xx_new_ids-v2-2-4b1a0f3d04b2@oss.qualcomm.com>
References: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
In-Reply-To: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: XMGVsxzsjxkSl_ykhPAdI6jVRtqdZeeJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX9Q6ee8h+VzCm
 v6HS3Y26F1puyjFrB0fJ7UIOSQgk5UT7jllTQkyqjXFV4fTPwhhste9fTy4uz9cjZc29z2RkWwt
 vs9jPRamlRoIOHaxntmO6W/UfaYIjmPGAO6DYDSA7Z0xF/6lwekl/YOABUH+Qd19I284Nomm9wr
 zR0DHCSeW2YZoEa/VV4mN30yZvkxcBmKerVuAtAGTIQ09Eo4XnNYoS3uGpaubbzCbIPRdvHP292
 beFNM+SQi5ZSzvTZ9AVtfekrJT8YRfTZsbDUFk4hAFe/3Xg4xtZsqJanPBvBs9VqLa7y6WimtVQ
 wF1lhM29erSwISnfc6z7bDyHVbs9IsCZEw+r9AeCqud+VoOIDtKe95pmOBHs1F++PnLiQcJZ8Oh
 lIeqNMndsnZZoAa3yVLdo9hXY9yiUPsnOLPQok6GFGRRxF+i9rlSvIYOVuCWryaozfYLkzsfcsg
 Fs51GnxsRj8N5VTdwJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX3aFuvE9hfYmg
 Za8czIdKrrAmll5/zaKUFXSSPrr6/RcFl3FSTRsbQ/PdtHln6nnXsxotMH6ABW1SBnvn1pf/ZOv
 r7MdFkTyvJXqHIlrbzTwZXaPpuBs5zA=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab20532 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PP8aMIA6NNbLyI7UcOwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: XMGVsxzsjxkSl_ykhPAdI6jVRtqdZeeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220062

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..4e7e14fe7231 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -558,6 +558,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ9630) },
 	{ qcom_board_id(IPQ9640) },
 	{ qcom_board_id(IPQ9670) },
+	{ qcom_board_id(QCF3211) },
+	{ qcom_board_id(IPQ5211) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)

-- 
2.34.1

