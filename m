Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6E23BD63C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493495; cv=none; b=lxFqTeRMww7nd7iZr2z4BzNKk5NwLP5UXz5NVlJVDmRvpRuBP2KbQUYlnwAowTYzxuFyH/U9gg9XMC1BXB6h5zjeKdSX4FV/GGm8cDfmirHjzKSlzWf2F8V1ZSnAAEMfY0USt+HQD+SpPcsv0BKN7zwUo9Ig2PlBBQ+kYOBUR9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493495; c=relaxed/simple;
	bh=7GutQd0hEer4bg66j6HNdj3RnmvU5iow0kHbDL9cf/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdedwrgjiIkTZRJkpqI8dXiy/SuoTdbql8YbXLGp0h1C7UuDvbS9eEaUJag1GRYkmwx5xqgEgmPCqaoTkfw6VQyCytOVTAQbzU3esJyXMK8uiaShLntoZ+NkALlFm3yx18xznzG3aB51aDN/riiRsM4WR4skZ9rbV1U/B1sYYjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AG85DNzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnqj+RZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AG85DNzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnqj+RZn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B76e1e617739
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=; b=AG85DNzf1OvYu/Xz
	qNT4MZs43mnEuVdTgVcpk84JGph9P/5IrY8IW3ivBpxlNgpVtxLBNvB+uBipq+sI
	iLSiYx1HYr4PN9wqNANjVyfCkiecE4u3QAkOKeCam9Zaas4LBRsH/0O0kxcPwBnn
	Oo55na+6o5ChNaqTgnbF7nQ1B1nkeJE2CVUgWYHFuCiZk9brgHZ5F9njR9MfKkhO
	R4ECNEE0Nt3QvLtSOqcGejyE5+/ORAn12kwgdVL+oPAJWgMR2cM0mR+bpUjKv5w+
	jS+DdzgYutH7ZdwSSnKkOnHwNsluD2avj4Dgcr6BoaFX3DWZG2yPo+sfORxc2qd1
	4WXJlg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dksuq1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:58:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-57535a51589so401521e0c.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778493492; x=1779098292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=;
        b=Xnqj+RZnzCaE5xW0RVFZ5qIZ2cRXNGaXPYq+jxVo8QARsFMvXwW71X2g6sDdWGnFWO
         1/Y5GTtge2dkF7JvtbrUnHWO9w18aGUbPq0jWpdlY2/ZnFUlSV9QJ2YQ+NnvcM5hU1JV
         B8vKmmNDh6JisCLRGTizyeBXuJ5s30MB6HVBYCLp0Wgj3qneMyd8YbaCT+qTZF/HU68t
         9AHFrSAmZBVS279QogsnOPu+yU1PjG1MzNZTbyumU/+4bpIYmjJXNOyVaAmNC3jTaJzK
         UE9B9JBdxLTyMJtHbSnT6QUly/+pFowZmfxtQBBjPQKiwPWYBz1ymuiMSsEaE8KjwzVZ
         ckpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493492; x=1779098292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=;
        b=CqYdw7f6KXKqKn6nzxY2xiQYs63I/0CfzVhqdOYH8hKy6Ww2pQZn47eUlTn88EcDq9
         fsMNPOBqbFtChRVv3EKwpSXIMwSoKScemq/JnlDxudqGV8RQyaRLS2royLPtfd63puxI
         BB/0+bIeRXmfyaYadIbJRPCdrZ6Ndp1JZ0FZ5eh48uNW8Y4rw3u3rGywnwWPbtlZ+8Hy
         6jH0DIAGg8FB7V+GgHz1x2AUKd75IF1krJqnFnOciXFQfExX6FgOoZYJlwevVdoYiDx5
         K564H/L6AxctGcCqUZMrKwE8sjY2WLbwNqRdE1y49B+QlukV47fuUNyelJgjqQyoDbl9
         Ar3g==
X-Forwarded-Encrypted: i=1; AFNElJ+s0lvfTvrEXmZZ5FDY7UKQVwOh7gPFiwVBfjuw2OsaFOkMTlRt8hXiRYiBzyWo7TO2l660kOOSRLed@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdc8iKeQgQFuvktIEOmU8zS9BQ7O/7+9mpml9iljX+ThfS/v/q
	NZmQxBFWh652mKAvRsi4+/dLOVgviZTN/7nBS7cYxp3XPG77dyZKudbkvvTDETGyyWPxvtJmxnR
	2I6f12KGSlAkZyX80ri6dW4WPqP0Kci84Dy6qQrYPA6YWuDtXlVZkGGOLhwU6Ttk+
X-Gm-Gg: Acq92OGGCEZCMzPIa+2g+559BMxtle18dzYj/dP7w3y4CYdhcWAckxtCGK643hw6F74
	vgAKzKTbDbVpkK3H7bu+zFem8IdjQnfaVnIfqys7L1UyQ/gybSfwaKD+qHdRyLGaVIpdd7hsTvT
	Td8T5me1GKyTSKMcY+tXWeFcGeMFi8OmKSl60evEqT3F9p4UeKk9IuRxwhXNevQhIckUhlrXpT7
	C8zGkQ0VdoUnMLcvsLORpyAjII65p3vCjz/dKiEsWcrgRE7PTg+HHL6o5G4ZSjLxV//AUpVsR+3
	1l7oMNdl9ftYQ2wFpM9sKXRYq/x+1JntS149Vfs6LM5dIaVKBzhPVNBsPgevczKaASDDTadf/DK
	IglwbEF8wDLzKn2AAa9v+8cxXxsqMwsVlswX149Pkjyfr1SgziRi6s4jhoVJDReahHkNnP9fQfV
	da2Jo=
X-Received: by 2002:a05:6122:510d:10b0:575:a13e:b33f with SMTP id 71dfb90a1353d-575a13eb799mr762079e0c.1.1778493492261;
        Mon, 11 May 2026 02:58:12 -0700 (PDT)
X-Received: by 2002:a05:6122:510d:10b0:575:a13e:b33f with SMTP id 71dfb90a1353d-575a13eb799mr762057e0c.1.1778493491857;
        Mon, 11 May 2026 02:58:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm468593866b.28.2026.05.11.02.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:58:11 -0700 (PDT)
Message-ID: <774aab58-0825-4acf-99db-dd88df0366a2@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:58:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8bNqx_7IaBI66qfqm0z9jLd1gW0u2SNS
X-Authority-Analysis: v=2.4 cv=d93FDxjE c=1 sm=1 tr=0 ts=6a01a835 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZkPnaNv3TD41VdVxMYYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 8bNqx_7IaBI66qfqm0z9jLd1gW0u2SNS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwOSBTYWx0ZWRfXw0BZbbSu1+Hu
 jzq49uCk6la19qV01qnnM9pjtc3/3Pu6+P8wgBd8TSGHJZEPctopq3ikLO1ZmQbJPl+FbOqUaA4
 hEqWoVvXP7CiznwTAJFUxb2/KRVbp5g08LCBh2K6F4XgvsBLvm0p5p5R5yZkdGDCPUSkeJvLcVN
 BIUdZmrne+NBT3yGte/gScu5uGbtlva1GnYJLW5jVDVssPo7k2tD2VyWrNoE2wQ9Gs9dJ/VSmsV
 R/p8BT9zp9cax98pClUpg6+JNpBkjghCTrywjEpW0MBOWV9l11ysWeis5Ngd9pO9OIyOPhI0oCa
 zOTn+ble0Hi0K6PzCYSUUXrGZBl078EpAiMGaYfyJjjDvePzci9u0KGWRBNCSAbr4p8o8iWX1nw
 TCA0fkICZB1aQttdXhBOTOtMPRbdQbsZS05bk0Sykbn+fRl+GUUzfGwGxqq5Ur690bk872QUUVi
 SKkmB4o+WFUoRL3lvYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110109

On 5/8/26 1:40 PM, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on hamoa.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
