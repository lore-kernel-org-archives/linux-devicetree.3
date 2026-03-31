Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C943D47BF
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943588; cv=none; b=E1hgwAk5H5tpIOugIU0suyjc5ISn0Xudx8y0HZgKV+6kD99J/MPDOVPKdY9ytgOqRnx5THyZdpwVfWdr+H6lG0ZnHgmQsCKXMkF17cy5Soai7dJVafp+ipbjRHQIq8LgFL3zgzj5xwL6dTrGjjczwqCnA8Di7ht7atukhajPRvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943588; c=relaxed/simple;
	bh=qTGZIZ5pYHVhTxxT8rY99txvIt8thrP1cyvCU3KjLgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rIoA3DxbDoebF0cJf+lf8DT9fEY+CW5jfmuYIxRmQq0YD3ICVp3x0czZ1qc938q6zOES5IqU054bXwYtPMrAKFeQmF/X2fC9BnewDiIY3niFLUJ6QjoSfZ2BxR9/l0+b/OPZN/6OyAiX285UKXBGs+EfBAeWezVe/ZFFwPDJU38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qah1C7rt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqJkY3j6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qah1C7rt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqJkY3j6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7HvUN3174192
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcCaNywhoO/yYlctyRM+MkwAPEaj6J1g2KyVaz5Pqwo=; b=Qah1C7rthHdB5Qql
	M9YcyjHF0nmu9PsgUQGTOf4dUkdzbGt8TpqOztwkG8nREfjkY8juung8+rVWqCnY
	3mzSrlVVhwG5kTCG1qIX3pIxsZcCDcnHPCWT6XbEry1yoP/JUlZF0zsl0P2SCKB3
	0e9bGOIGE8kQCl2xXxYTU6HmavGnrrlbmSJvZgHIXzoHFawOaUmegE64jPKyg7WF
	L0aYwZ1WP2nchtw2BNeEBiAe6Dpgf0XhMIlV2uBeyt+l60t6OzpzZD1ngSy35N5E
	xcfXb/rpSepMuUeLe0X5rwu9g/4/+a11k6PGVK+UgAzXE7DMHzJpN3WF98RgiHKx
	y91XSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h4b14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:53:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b27636835so20148021cf.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774943585; x=1775548385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcCaNywhoO/yYlctyRM+MkwAPEaj6J1g2KyVaz5Pqwo=;
        b=GqJkY3j62ApELXbF8WTpgOk3Tvjy5ILIhKSHGf9RTXtytUq72769j6AXhOmwTtFlzG
         ZKXQ00LIYkKeu2wJbskGdnfKFhrjBrXDSY0DVrhhX99Zq8gpdjoyoSuqrdO3D4GTOsnr
         ZQY5e4tb1U9NeVttjcle9pdl4NO3ntVjgROlmp+cl/8GG7EE42epvYIDrjl1tzndJcxI
         lsxvXLgr2hDm6FgVIAf6TGjUGfmDCTwdMjSeOQecmmOxVCZ9g2+ESgzGR5iFDjmIupTz
         8oidDwt9vtQhlGidpo8jfTkJSyh1XftZKuVnvVyqxx6P6BKV9zEkdmvt8eYq/axcPyFu
         61sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943585; x=1775548385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcCaNywhoO/yYlctyRM+MkwAPEaj6J1g2KyVaz5Pqwo=;
        b=oNsmZhzS7MeCP3QYGYgcHhzK24O5uZrnG0O8SJe40SzId+uAauTEZxk6WyGU5yOjiD
         dtSxILJVdEmJtZImpqtiQDwPuKGwSpe4emGYSfaDjQwtdTUqLRHt+xitaJ+vkNDGtWKE
         /VOmOrWFlwsPzYuAqStNcxJFA/JnMw3nWjcvQ3f/urCH6okVig7INXvwRh1xWh76YX39
         H2O2axThuKy9VQU6QcKBqcma3sQo5XH74lFBQIxoMHW2JhtoPADPfphjbkoVs8/ltm1z
         Up7/OU3S8hDnT9ThwnHgk/coE4qSRzqODAK/Hogt9qMm2ya9SmZGgDj9zHAPB7/Vvl7M
         vSfw==
X-Forwarded-Encrypted: i=1; AJvYcCWA1mzfQBCsEnApEJ3F1aZ4jS5gIFlDUOZx1rLY0PbCvlxAyeJzKdo+oWwXfbPBcqqB1qFZMvjyUQ0m@vger.kernel.org
X-Gm-Message-State: AOJu0YxU8Kcos0NAM0oUrf/wGYQxHBTxnm29+xuYmKmM7mMXdFn6Hwan
	rYyLtZpjPGbPi+dIdC2crkD/6Af3nZL06rfrZNDGBi/LR4uZ66OinzKpZvsBXaGPaOll42Z4tcr
	HXZLQPOwVMD4E/tpCM80VXDx4Fo6WyDo3ZhX25jJxlKfAX0ZMrBukdz6EQQq0dcue
X-Gm-Gg: ATEYQzzWQI7Bb9PzeBzWYa19onPWBXAKja/5Kaipg6SC50wQpaOVMM5/oI7M59kAdg6
	8VzmMtjB3q0CHylOx1YpnMw0SXAhGZB9KjK6G3V7lYCWD7IoyFCQmsgct5tMYNN707dfvagA2jV
	DhiK8cTji83o7SOQCQe9B6EtLHh+PkwsDFagbb61/sKAjCazNdD6/qO/fRCwvKEPBfi6NAN79J3
	caqyZqYfvYWFBTrDOFnfJ98tu+xBqIWEvhPMfF29rtpQAtQ+jDP8pcq+QSs0Z8nnvlS+JW3Ir3B
	9cF5CAXX8i7aYG2OCP0N/HZ3PLbSGeypp9xhliJLcqVoo6YQqX5++mlyc3Xxg0ecaPOD/6v6J2/
	UddC1mz20QvE1YzuIY1Aw2J9oflP2+jW6tmdbSqywaabes5e2dIWaUoVR/CChH1UO6qSD9zZ81B
	E7oo8=
X-Received: by 2002:ac8:58d6:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-50ba3970c85mr156759661cf.5.1774943585392;
        Tue, 31 Mar 2026 00:53:05 -0700 (PDT)
X-Received: by 2002:ac8:58d6:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-50ba3970c85mr156759381cf.5.1774943584944;
        Tue, 31 Mar 2026 00:53:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6744sm366425366b.30.2026.03.31.00.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 00:53:04 -0700 (PDT)
Message-ID: <28a83981-557c-43dd-aa7c-abcce638c2c1@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 09:53:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NCBTYWx0ZWRfX9GuvKBclgn9x
 8HzIfxQW7KN0qYcuGNKGNl88KEBNREwxNIjmTz6mPUagdx6fE6qnEPCzCt9vSvsoa3PuFYGaO6h
 seYB0dzn8iZS/0KQlLnoeRLXBcx+w7L4td4VvY4vhJKRKH1kFWXX6Mhu4QWbkH8kIAJ/drIGs09
 Qi428NgcHuOCTfC/qFB6qsfo+6uysdduvamF0rsZbVixCFay4+NRMvm/b1rYtiwG9qyNppmVShh
 cNVutUdL2C2Ug/o1huCOaKWM7OVtEj1XD07nnoXgpzEMpgQq9y1uwOVKvXAVY1na1QI/PC66+Oy
 IgrSsQLLtT6tOuoCGb8eImEIs8TBbCdxgYIuxBv/iNoC4cgf7KX79Ub8+1ZgLw3k5kWONr0hx3j
 rZ3O/cbgOYEuyazHxeWFGQCSptvA7fi6IRc1PdUS0SPuSxO8GGp7+YnaXkPgtf6tWYMQ07ceGkZ
 le5H7JO/VD+n0rbZ8Mg==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cb7d61 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Tay16fmJ25vNEHRVOVMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: nN3cAqKztncgoMih9n-kCXvqsLdBUFeO
X-Proofpoint-ORIG-GUID: nN3cAqKztncgoMih9n-kCXvqsLdBUFeO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310074

On 3/31/26 2:35 AM, Vivek Aknurwar wrote:
> Add clock operations and register offsets to enable control of the Taycan
> EHA_T PLL, allowing for proper configuration and management of the PLL.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
