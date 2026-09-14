Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6688947DD43
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390130; cv=none; b=sBQzVDr+a0tlocrA2xnemsjgVpRPgfJtX0xT91eTFQIAhso4L61hRqMaPW4ZbhNuqg+9r4MFFSES7d3AyHjgthm0u6hfaEVM0nMisk5N/WfIPdCLrnOKD44HSByXX2Yd7pN2nKiLhJoY4Lpr7qRjEevtBC4Or+19dI6r2OhJPSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390130; c=relaxed/simple;
	bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6cmnJ3HB36mIy3EX5J6Xlrxw8p1iV6xzMckb7BvkgLmoUOn53/pu85UBnej86zRAWXrdd5bxYF1vYRDHdxveiqH8N2CY2CaNd9UEIwfljGIO1HSXmvgTRDFiKOch7tNMDlEHAj8oFNxef3SZDTLrIdwCc7Q2pBtBMn/YjrePJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4Cn96sb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M55bXo4+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4Cn96sb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M55bXo4+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6PK3291510
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=; b=k4Cn96sblhboQuy5
	cMxuQlHWpeKIrddXA5BYdoxP7EiNIy/MWbzNxaz38GpbkcmW83cNcwLFRn0fGfLE
	VMG4TJvlXqn7mWaB6naIPRXxP7s2OS3hlx8cR2uThE7pdKhzV5TpjCrzxgd+1zqP
	R+5UE1XNjiWWqGfZFN0LgTA8uh4o7EJvrtg7mgoV7SFJ8Sb/lt6qn+QJi5cGdWMr
	zPKypvz5/Rg2rHnVe0LjOwr9PWbqjDlOX5IKDUr92b2uwE1S/M7o5/4pq1z4cu+Q
	zLAOEoINSB7oCzZGgAKlNzEAwZamoIeYNvCDZNoaelTl706YkeGgs03igpFdoD/U
	uUjozw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8nf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cdc69a7b5so68862226d6.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390125; x=1789994925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=M55bXo4+OPAw3QFHS73Pq0K6TQ36N1nfmZtiuNSz2IZNZWNJFRuSEmqADyf+knmIOZ
         rfJdvz2FbmZ3CIEPahTf1+aNuQAkC74qlEQz427IHDtynyNmOb0lEOzGAmCRfFLxMJbK
         mI3KiWBxCMpAeRSecvWXfTKClDqoFmVZDsVl3IgrlQuBBEJ51aMjui4aX8QxMSGsHUb7
         cgsY/tNGUm0RKSVteCyk2AyTtxnkEiFUPX9hJucb7YHoqD91nIJtLcHWR7+sq7leVACF
         mCvRfypF6Om7wWIJlkpsDfwGuSNe69FBYh5ooxoikkLpOV/pQifo0UulINO1UARzDNH4
         h41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390125; x=1789994925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=b8H9ChzlGhxDWGwGtmwTb+YcRdJviZS6sMt3ofqiGeDdub+Vh6JFz74ybBmOuNGtRR
         b3gS6nk6YoNuMOynHZAfYgQS9Vv6CbESMYRG7mg5y5S0bJhjDkv8V8bCh39noFLdVxaO
         JjcaSpmuktaHOmV4qyPxIxdBPuH/ybJRyipXtVKC8wbPBXUZjbbfGs85nOGBiKI2yrXY
         kCERSuKfbg3uMg301/QZ361mgVJb0XFEzmodwqQjwSoAflfnVxwONcj8HKB0H9NYhbv4
         2XNCbR7ac7d3imIjxw5XT6Fxg3uPLABYW/EjhxSMbDlJclCSA+BRZUzdEs2MFHxvepZ9
         xKCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE5uqWNl3GwMgtXysgnSyrjwixujc49rSIyXHlRDeNYGEyvYxyFnNztzB+JEPXgZXDXZstUckAxflC@vger.kernel.org
X-Gm-Message-State: AFuF++k4gSXT+W1fR8y/FnKcm0slkxnBJUQPd15jdYm0KN4ne9rjzWLY
	TLt3XfEUAI2y/GTEk7UerGUMbIaBNZznTlJzxUUwOprlKKgDayTEs3fgs/km0h5duWelzWaBKpR
	UlCewxkAYXUomRuUxr6sNTX7YCo8WVdz/mtSw3pNrbD3isTOIh5KDQx40ddXbywlp
X-Gm-Gg: AYBFou1e1nktrDgjwUWEpEhJoeZ8xpUZSFxKKDZ0/F8ieGyKmrwiZLRKhpeG50BtxTA
	bKq+dI2exlZYR2JmyilAoyZ3kge4D3aegqmGUh/2SYytrG74nQdxG+v/5p0HcHO8N4/GlUUvfA9
	oQ062akQ21uHh3sIc0wucVo7Iaan/b3SWxaL2yOIqyO92ezKl0E4l0BykQTJz44rioCrwos19uJ
	pOxIdL/IVlELrzvFpsiHCJqelshLwTyIyX7UNE4pwBBXRTdkYSa6DwDVd3wkjOJujFwDRehgB/4
	ZTQEblVv6t2VhadoDwp4Z2uXlwz98A5n+vd/hVhTd+BqPXpL9bOkPpBFBaZg/ZypOvLrhXPZHBX
	HC0HZYCdF
X-Received: by 2002:a05:620a:43a2:b0:939:b482:d474 with SMTP id af79cd13be357-93a29a027b9mr343039685a.35.1789390125361;
        Mon, 14 Sep 2026 05:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:43a2:b0:939:b482:d474 with SMTP id af79cd13be357-93a29a027b9mr343032485a.35.1789390124706;
        Mon, 14 Sep 2026 05:48:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:15 +0300
Subject: [PATCH v4 16/52] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-16-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zbcD0xKA/Ju9pSsxhdtvsRJtdpsvCuXdsnp
 nC7uuOrWxuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs2wAKCRAbX0TJAJUV
 Vpv/D/9X/wGaKFTwUH9gHBr7eIgfLBBvU/XMS0A0qyQRFGTYu1usAnL9hNgwgFGaZdwbH5MsOgz
 nD2vwenLgPfilxhv8UQL6ziJHLzbv1h/P9dnrzfZ6ZvQk59+mB7PJ8eFPLTf5Tuoqb5E7vzUkiI
 BlDRRwaEcRYA16eD8ZdBKMGg4hdPCL8nEqsv9f6Pr45LNOEyKvgY025lmXE4P9OePSIyVuJ1Y+L
 /cvcfbxXQZRWHCn5nsRVBF5EK+Y9chOxuajT+ilZ7vaArg7EQxFW3Ziy8DDDgg7WE52NWJNKxdN
 4va4oO4L5ZxU5MuHEvVOasJrqQgz9ZxjiiGdYCkaV6E4SdApIRSAfgCCqx2Ucx58M9vRfu+gp8J
 h+LDyhdAtPGlvQlKicjmoA+n+yFFGUMZno3K/SCS3Ed3eFn8ITbRr+JZtbLBYu3+YrddKVbDj8C
 R0WNwIIda/otgJyqIY6xz158DoMga7gZvijQtV6jj5tLSHRLqE7C/ky+O40nYATTH3qo0tnrQKz
 9UKk6/f3LeCkYQOUow807NzoqOr0q1eUVkt4ofv0qgRpgdt4vTJTOkJ3vhTeuyQjWMntyfUWFkH
 ONKLOG6eYfGh0zbib+sOFDQ6rN4vFnpiQRXXWQIixLsE+AXY2z+ruDI8HcycNJQ+RmBbxXYYeXp
 BDPNX7MqatqmoTg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed2e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: tguYNV_TZIhvkO7ODczrrTXHLcwt1SFK
X-Proofpoint-ORIG-GUID: tguYNV_TZIhvkO7ODczrrTXHLcwt1SFK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX9j7rsu4xDaM0
 //DhbkPj01ipsbBL1pHmL+iO1YdifagF+RYKDWZeLS+9VS/BKsEC7LjR2pShiJNDxG9rs7S2Zij
 LLY9YCAbNQRd2j6/3ifX3HiNCN0bTeyv70+5wvkDTLHNYkp9ZVpdE4/B3j/rrISkCscLHmJW85P
 NKAsdyhuXp9naGF9w3V9ETTv0ibwUtwpFHvAVkvuqHJixPB2ux+GDdMtWz53lQCu+Mqz3/dcD9+
 AhyKFjzUo1AwzJGCmEAe4mnNMDCV2HLhC+w+KFvXTeRpER13Ye4BH29sDV4wmwEaqxzLP9wKRXy
 tMOrUe6IOybeB3njEWV3q66azxdK3oxJj6vbVZIQvuF/QRcnyc2C//m7HRo4GKzudrXtvDBLoOe
 zfJf1sXxxx58JEapa/0tfkhpLZPuaQYGsnO3Rtcxf4qsEDOECjPqDxmm+oX5y+84Fx+9pNfwNud
 b8KdHWcJOqWVRYiuzTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX/4KuiOqkHlFe
 46rUm/ihvcfQvwH+5borfaOD3jr6nWxptOp8fTPPMrPxzJY4kFHEGAIqo2s8RqRjWrvu3Lf2bwM
 jJWf8eYIPsQoVb3PE5/t3H+jX1YlWGM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..c40d2da1086a 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

