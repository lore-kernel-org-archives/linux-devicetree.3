Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A59242D9D
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369779; cv=none; b=qreCv+Mh6CEFK3DAG9K1OyPSvIXWWY1a6yeZqzbBsD3NipcKR+25Lq859YOU2fmlsU60+ClAnJC9utNr230Wc52hRLOIyJQKvdLipYFKx1zniXZqiUEj2qWzSd85anwMQFjFlgEquL4hwKCrS8obF3n+3XIp+E2SS1p9ycxiU9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369779; c=relaxed/simple;
	bh=3kCSpWp7FEEe9qEqd4X+TLbKQl0Y5QozlIhOMd/nusA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDCHwIfSY+WVot5idGfjncHfCQmuM+514D5xpyJrGacX7siA1h6QOJ3vcaV/+C1l19pyjUxmwMitm9tjXW7x025+OarGq+opXJhmek9pOihE/8pH9eMWZ2rXs7xe4tr80nrC18Dt8pcJ3XcwYaLIrxxND1ykT//x2Te6uyCqksw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Japs4Eg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtkDUmID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Japs4Eg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtkDUmID"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99vlC2491830
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zaKcAvTC/3uFVMXucpCSenq3MlPmMHSE/2mwevUrtlc=; b=Japs4Eg2xjxzbrVO
	3xw2jfDUFYsCwMs//V9CP4nJqTekalHmUcQX/GOyoDo4NLOPkTe0Hw/s/CnZt1ya
	J9yH2slPZP7r3ji7HkGp/cC9fxZrNgJfYmODcxZ6R/WKE6jIat1OZAtIifFwYd4B
	i/Y0xuy7QtafwCiYDWwOxYhZgYpUhOCZnbpO1pbtu+oSp9Ifx+em5Ir22mcEWxo+
	HFS1yBxz+Hd1TtR/678TuML+4Q1eTNYD85HiPAO8+vQqFv49GbTMtQdNRBwoLKa3
	vxtmSlVgt32/nkGNFzyqzJPlNRRj0EyrCUcTdr4PBcGGF5ped1wvKNa1wSBRm5PT
	oNmX8g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j5557-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:22:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82ac893940so3027540a12.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369777; x=1779974577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zaKcAvTC/3uFVMXucpCSenq3MlPmMHSE/2mwevUrtlc=;
        b=VtkDUmIDaT7IoCNhlNkCbbu19ezVCP2U74VOm4hGNw5FYjdTY1KsWglp+925cRzLAt
         iiD8ybf7CIpB3CSh/FcRFWGfrTB0VLs78IO48JKaUtEbTZE94BhpOjpkOw8v5SozvpeB
         TB6DrJmA4fT0Ur+HKXWTE3HNW1/6BWmW2b3GbYATcpWHIywWwqOIsX0vulji2G8Ha9Bz
         7CQtJgITKCnG/ZfbJQP6UuAmJgLYJmVw16hX4BROmPqANMD9UBZCzfrHI1Pk8lU4/7X6
         TCPnrG6gGPaHtXFAy9wPfHu0tCWglSWBf1DM9I4LuBjUWb9ci/tEYQ90jwFxXFAc1XGZ
         4X9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369777; x=1779974577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaKcAvTC/3uFVMXucpCSenq3MlPmMHSE/2mwevUrtlc=;
        b=LPnUEQQDM5/mQfeiCbZX1lWPd3k89gM/1vrHEORb/ZXILpvbEhq0oKmAiIGmBeIyBG
         2fqF5mjlqfLXCOHNFOdN0U5Ww+DsxHMYWmuOlz+o4A3jkWtQPRYxce24411fE0it2UmE
         MYHG7V4Wqew2ckj7zfFJ9WmckXlM7b+uNnJPhOSPBd4bnLFQbBoKKu1R7JO5KE8Vi3c9
         5v7uoRrvJLqE8kNu1zVMo0BSzlF6v90CTv/o1aH7T3C5AJjXphyH3fYfqUNG+iha3edw
         bLoPihI6zNPkLIm8/Ss3SCtA+nujchg8BVAvGAp7HWBqyP29Pt37yQgFTMcc249JiI1M
         KOLw==
X-Forwarded-Encrypted: i=1; AFNElJ9z8Vw1YKaPZuLD83WnBb9Ehc4d1d0iWK6+hOBi1IVINIyPRDMwOrlNAcK6YibhVUwgpVUdlzXejEsK@vger.kernel.org
X-Gm-Message-State: AOJu0YwJh97yOu+ooyt6kWv12KV2gt31FgukbcmbxJZIWF6Dl4+J//HV
	5Faz+3+urOpjpz9u1XMKsYtgPwy7GcGpF2zbwVSK8o6/HXo7tyiXa6nMTvaYRYi89mPu4PjdUhd
	CeeJGvbsiO6PXK3gLEXl+HqUiiBTK4YA74TRABYBt+mXryhDGoZwLvDENX4hTSuv6
X-Gm-Gg: Acq92OGnJNnQmZPckwxredopLdcl47l495oiF+apwhl7wxpP+toLOKdmRm7sYQYXCCR
	r8BkxxXuHQwaiFgMPSZoqw84cmxeEPFEyvWW/h0vbYH0BU447s8sKpER3O5hqqa+KThzkh6SJ17
	OJAi9SH7j+iqoL6aWDBHJNeFfV51XVkmy2jEzMbcjIG+AUWf7znyTvohOFtiZF56Qx05zDiQqUI
	HQ7P2+P6EZ1bQ4Z2Cof8pLrcnGEnX9o0YZo8NUtG/eii/s3OVZc/KV+Iqz0k5c+0O3Qk5vQHPTK
	W8XirNNWV3SmKw6gxrm6DCJqkxz2YxzybgDi4AhOvlOSbN2oft0Kkn8WNMPBS6PzOAhANGctZYK
	ewFuqRLv+W9df4goJG5BfZ4jXBf0rZbHHzUIIjqkc5pSbKHjlYtBm
X-Received: by 2002:a05:6a00:4219:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-8414ae61577mr3046702b3a.46.1779369776910;
        Thu, 21 May 2026 06:22:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4219:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-8414ae61577mr3046665b3a.46.1779369776419;
        Thu, 21 May 2026 06:22:56 -0700 (PDT)
Received: from [10.206.98.135] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e02781sm1578340b3a.32.2026.05.21.06.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:22:55 -0700 (PDT)
Message-ID: <74304e0d-de98-4a31-828f-d8280e7a728e@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:52:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: purwa: Add camss node
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
 <20260511-purwa_camss-v2-3-22608ab9126c@oss.qualcomm.com>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260511-purwa_camss-v2-3-22608ab9126c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0f0731 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=CUJKaX_r6RFX-KylJRQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: JoEJv0UVQk8JosjYIFMKgWZdNO1ZDbgq
X-Proofpoint-ORIG-GUID: JoEJv0UVQk8JosjYIFMKgWZdNO1ZDbgq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMyBTYWx0ZWRfX+fncz46a3ZIX
 d8QWGyCEmSHUVv2hH5rV0dW95v5wLJiUmt0tflCpmql69Rsgw2xKM4iOxxa+gKn1ej1COmMBGyn
 A4b8toeO56JOZqnbc6m10GGdWkfU94lWP3AWZt5l6CslembRKr0/cZeQDzb8n4OrWUzbg9Tifnx
 lJ+k33kPCzLrtGQb3gilOmNd2dnb8iE2Ruyy6yXc2jLY7BVDz0rKnewsUHEufag01VRZkchbtrB
 +S7OxakI7oBhAFFAoHHqDvFpEgu+j6w6u2R/dAkOq8O5dRlWMcCzoebIy+/J1LhLh6AzwmpN9Lh
 cnH0clioKzqy9uwbg4qPSMZGttWXyI+dgSDpycbZ7hQE9OpNwsGsG0RowVxncpIubemgkdr3e/S
 0IekGfvw3Sg9ryBREFny72mC/197sCZCJgoe+4GwNIJjqR8soCgT+LGYVN05dupeBJjKX6ahnlY
 +8HT8GIuavc0S4/z5Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210133


On 5/11/2026 2:29 PM, Wenmeng Liu wrote:
> +&camss {
> +	compatible = "qcom,x1p42100-camss";
> +
> +	reg = <0 0x0acb7000 0 0x2000>,
> +	      <0 0x0acb9000 0 0x2000>,
> +	      <0 0x0acbb000 0 0x2000>,
> +	      <0 0x0acc6000 0 0x1000>,
> +	      <0 0x0acca000 0 0x1000>,
> +	      <0 0x0acb6000 0 0x1000>,
> +	      <0 0x0ace4000 0 0x2000>,
> +	      <0 0x0acec000 0 0x4000>,


Size not matching with bindings, Please cross check with SWI.


> +	      <0 0x0acf6000 0 0x1000>,
> +	      <0 0x0acf7000 0 0x1000>,
> +	      <0 0x0acf8000 0 0x1000>,
> +	      <0 0x0ac62000 0 0xf000>,
> +	      <0 0x0acc7000 0 0x2000>,
> +	      <0 0x0accb000 0 0x2000>;
> +


Regards,

Vikram

