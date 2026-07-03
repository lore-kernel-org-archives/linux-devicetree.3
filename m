Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C6357CFF
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063712; cv=none; b=t+BVAks8+7moriYBFASELgAfJUebgoa5qZfr69bHRIrsUkOXu9JuozWD+RR1IvZpHVA613Dx9tMEU2T0jGETEUB1yU3KVHqWHqpPCo+9etSD3FoKU127CiLjcILEedxMEu4hVxbBz2yZE6Yhq6xW1OwbxvbyGQGQhoe8XrAAJ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063712; c=relaxed/simple;
	bh=G91wVvJUuLS94VJDX6lLVmIRI4FU9naa3LbezLYsZqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FuljzZCaPmYu3h0P1dGM/MPv3P1j7QRmlm5dGO59LB4YEqiGZ0v7p1D4y170OtKuC5vOYxFShTMVhDrEinK8dpZ4XIwi6kVXvg8aVE0OQPPLbNiE/ROsCe42ew9h3acoNJ0FjVrFmf9FJAxnmOdhlmSVkDq5po+24eiBhIJAfWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjhSE2rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apgWzzN7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjhSE2rT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apgWzzN7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663683kC3053230
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3s/Lpz8eS/XYwHEj+6SabC/L38ujp0lZJpz7O7TgEs=; b=AjhSE2rToalKwei1
	K+dBtfqm8aRKHIA3gniRHtGmn9r7Xp19lXMN5YBjqsfLGJjX+IdHIpRS0qPBbRvq
	xr3wyTxeDIjk6bZFvIxbuhAxqeLOQjUQ2kYVagONhUeLDeC0GZuTEyY1ufd2DuE9
	1/MVEaxoYSGr8OIypbrC5iuO4ypxnoT9cxlRl0P3pfxQe9pLlD4yBtTLEyViccGo
	DdoaFNXDbYq1o/1mP6k7Pjjn1lRO/Ke2yoC1Z3lT3jseRIFIDX1aRSH8z+rDxta6
	2+klpM7NvIzknsxMN22ZIOIpEoW7+Bf+ZZtcRsHfBSO7KdhCy1Cm0SUpF/mm2H7l
	CSLhGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00a60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:28:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6415f279so5117385a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063709; x=1783668509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3s/Lpz8eS/XYwHEj+6SabC/L38ujp0lZJpz7O7TgEs=;
        b=apgWzzN79VwiP0K5etY1JAVXATtBnIQvA/UmZ+q/sK7QdDHWRc/CR0mR31ZW8r/0xP
         i2f2KxxkdxmpEJSoc2DiuCwKVJv2rD33FGL+HVaIAZMhp0QuYa/M2ETxsV+BjGtgv02e
         b74+F3lQ36yUh++57qEG3ju7TOln0FcunActgds/roH3lbJE4R0Op0DWMj81+ar/FopH
         qSFpWHc7f+G9xjVZs14A+C4hV7DnC0qNi1uDBuAo1dKc0I7hseX3EABcHLaRcrSOjpOa
         w7UJTkr9yXEwtrreRfEFy77daf4IYDZfMHK9WMnKICbKDKHMwdXyqo0jAZPVeAkebhXe
         fBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063709; x=1783668509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3s/Lpz8eS/XYwHEj+6SabC/L38ujp0lZJpz7O7TgEs=;
        b=GXislIMnhZak+34Wn7w0gG1i0u9huX1zE0L4PEPuRFQn+XFJBr0SnGugKOP3qdtck3
         YmjRQrAbC7c+1lOpnInFVWdM3ebyP4WUoA0A4Oer9vtDYWrnHHB3hrpHEev6mpL566In
         aC01BTyvwkM/sB+LZUgIxPd4peoydeMcAcMyENSjv0UhRmbpwlXIxFrFABQzgQofnDBQ
         n9A51Y8K5pn+LKrbBeC5NRQjY3ICZOIuTuXjDvdhlb7tREbQXF7zEJ+qlFF3JAggDcya
         fiWt6eo5KnqrAGUMFd8/lzmIk6GZsEOVAvtTN40G9wioN8GIQgQetxGcZ/Ur5Ix3eBOC
         02yA==
X-Forwarded-Encrypted: i=1; AFNElJ/J/lvuNp/9P/exjBZBoMM/UBrdKR4NLDF6GdIH8M9KL07iDxm8LFPMT9tp2a/s26SpXNQnP4+Kt+J9@vger.kernel.org
X-Gm-Message-State: AOJu0YyIL8iRnaus0HUnuJ1+/T8+gUGTWW+HiPNn0TBgC4bXkxgdfaUL
	+MKcYJCangaiN/zbjxBEr9S1qYq+N7npxaETZt4X9enzzf4unLcwwxmVEJguQjz4usaTGRsWjaM
	of1EiW/T4J7N09KS3ZoFM2wHpBLZ2eYykwO/ZfVIWg41AjQ0VdN+jTAUk69SgjdH7
X-Gm-Gg: AfdE7clYJh9r9m8AAxhpWw0b2DMoK1FPvG9nH02esAPQEtq1bNhKc7xsi4X8AtCkPm1
	cGy1os7/G0YM3j0evD8TiN5zKv1DWQ23YX0AOPEp71uqn5kv0B0PbuJ5tRN1+P61m4bTCKzg2eT
	R2xvc3kmIAvJigWaxswEWG92UktkcakC/Fc9MzrourrrXORu6TvHMHF964IVH9dFa0osNttDPqp
	1TdTGUjyj2+a5n2KzOUuKX936HCkt5xxr8CCzRv6HDUzsKt8b0fCK4MfacZTmeGKHFccyBxRnq4
	mEvNecQUgBYQPR6gXpaUrHlDA/ctTQ0ZiBYl7S74au9JRHUaRAmBHefGXNcY2DDyfQycPmzBRFT
	4/L7gsvJnumHLCO1PG2mf491DUTkJ/W1Tm/c=
X-Received: by 2002:a05:620a:450b:b0:92e:46cd:7299 with SMTP id af79cd13be357-92e7852f4d0mr764969885a.8.1783063708967;
        Fri, 03 Jul 2026 00:28:28 -0700 (PDT)
X-Received: by 2002:a05:620a:450b:b0:92e:46cd:7299 with SMTP id af79cd13be357-92e7852f4d0mr764968185a.8.1783063708545;
        Fri, 03 Jul 2026 00:28:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c779dsm237107566b.53.2026.07.03.00.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:28:27 -0700 (PDT)
Message-ID: <47a7d008-9ab0-4e69-8d52-bcf856f7cfd3@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:28:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/19] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-9-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z9BrpCqbV3xL4yOWAhrLFhNURPN5IGkf
X-Proofpoint-ORIG-GUID: Z9BrpCqbV3xL4yOWAhrLFhNURPN5IGkf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX84/awhSkP7rS
 1dzY9BakzIKFP5UYCaP+3HxgHelhePM69BhAHm2r8xnK3QWXv2rH5TOySzguAWw53O3GUYf9mq/
 Xv9KeDbYDQcZkWnuHlXlopbKEk2EgwU=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47649d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wvqeoAhrr6bvGHU06gEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX+9OoDnMo/89g
 d0w2HMZCr+GJkGqjSeV+h7bZZuj68m7X1yaoYSFsjIYcwGWMQI7fZWx68DHxx0fEd9S1kavGH2i
 00hx/LXm2Xa7+yeArqSilc+LeV57io/CaK7mDOm2SMqfvXU368vDnezUl4dJoEVyOXJ0zIrTE83
 y8HZyAne8TUwQYJBs74wcFWm04PcYR3OxZzkqGelYKpKJ88h7qGEMTUaa+cgQZpzY1Ac/M/hFKZ
 XrpLqgZJydDmHIKTdPy0BEvSzjYjKu5j0j+FIKyHkWu6s8uz/fFmttQJg1V9ADKTo87pIWyHots
 S3A2pSzy5qSaERIsYtBg/9xHPru7VOW/Y9C866nJj4YkMAEaN3hUz+Fhj5IAjJNzlxjZW1l+e/Z
 YFhhKGpP43FA+CF6csAnbOOBDD77uYrkuPmmHapoIZYSkAhkGrtRZjxF7AqDFGMzKy2BFdo3fHi
 rKvdhOw+pI4h9RAzF9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069

On 7/2/26 8:31 PM, Imran Shaik wrote:
> On some targets, the GDSCR status bit may not reflect the actual state of
> the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
> determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
> MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
> applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Downstream doesn't set that, but at worst this should be a NOP..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
