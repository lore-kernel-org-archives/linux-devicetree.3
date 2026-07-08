Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D282F43F4A7
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509617; cv=none; b=b8W3LZC/4h1Fd5ERPHRN0FaqGaR1y+98mM2hZC/KbOgGKcD6SFqTq3WfkddbsORz/tZVQnx0Yobzv+eXnh+aGcrRIL03cBFVkP/XcJoYd7KBjvPmlok8DLtIpiL0lav4/SGn4sPooG6fJWcEA/uZL5yJJRuD9ovloU7Sj0AQ7vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509617; c=relaxed/simple;
	bh=RPdmKLekRxNdh9LfxzY8Qsg5bzPJ6v1a9Z6UXOIW+c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekFP843Ar9W0f56I4ZD7bH3WYWBs71CpO7YBP8UngAC3pjl47+VmwAnnpgZyoq8M7TC2tbTDxDN87+2gspVE2rKLX9zu8vT3NuXCXhmO/oqmtzgHJ2+kp8YtHpD0Qp27T3RU8Dya9VN/HrhRxWm9R3bfRs5V6LMMYEVGselMrIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggxFf/Bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4F/xYT0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggxFf/Bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4F/xYT0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66888s292204654
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUJJPgMA/tWtd8hKTbcK7n548nKEExeUEZFWObt2z+c=; b=ggxFf/BhJiz6e+0R
	CyrRq0Wu76Xd5ubTtqtwz0kpr1+e7nwze8aes8Cqupt8xc6ANnJwicF8PdJLahoE
	3AOkFM2Uv3BIQOdKKoXDQ6VdVP3KQHgEfiNQz/fX75d8wZx0fyEf8QGayp3TbUkS
	Flam3lsVZoJsr4GgzcquuXm3a/t6uL8GaUyBQ65ZmDorNCA4eal79DKpbabGDWgm
	/QOeVv9IpjBRFNMDs3T9Y6gAgZ8Xobw5q1UrdoZWk7NGCxzBzn87zCZd1fQowlfj
	htWIDh7jLjwciCtZndLmrurCVa/8CmJYPkhsHegra1j3R4akTyWdytsUwOFHCg9p
	j4M+pA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv11a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:20:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484ba00601so234650b3a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509614; x=1784114414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUJJPgMA/tWtd8hKTbcK7n548nKEExeUEZFWObt2z+c=;
        b=O4F/xYT0SYD/TbR/3t5Uz1ylBXvvq0OlPgB0xH8s8nVah9meRgk/gz39gle7sVgR75
         aMFgEa4gC3qZYpzQspcJLmkWmswhIpZUxyGRYxIv84a94Y2cPt/e90+lHxP5XSBwtMCp
         dYJofJnPbQmTesKauIXG50Y6JP2czTtOPYZ85GBP7u8Ye9C0iayqsGKOuJGdixGXiXxh
         gVAHCJk8RgREVVtNPurqb2FpVIPCPsvNBao7ZDHlvkxwW6pQ9EbPVF9rPn0xtMBVAB3a
         lZS4UncmLDRDTRF/MPFQWxsSFC62JiglM3TL8e5nEbywjmz4gl+pLwLSt/OkUtJqgzjW
         HlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509614; x=1784114414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUJJPgMA/tWtd8hKTbcK7n548nKEExeUEZFWObt2z+c=;
        b=JXQgRaWByy8dtralav+RTa+sKwpe6LYBx2MYlepZQOOKhgNP6+8asBt2lKM3W/hG2b
         VMAEDWH0hD6LiP3yu8RF5hL0pA57E+okdsGhZsrFTtHqEcm98lTY9KUqIhEGDVEYFbqu
         R2Nr6CeAdR9oOYG+QMCjqSkJPPor4T9TaImhcHPdY0Shi3gOq+Nzw3lL4MS/pdcFfRj0
         denIw1BmgtB9gbeZAW6vEWt1pGanjBYyQ2kFbdQVZJdliWr0p8pfiu85h/rY3QXrYCdj
         vPePDAOyLs4CsZ0OAkgHy0SjWJGvkDgdhH+O648fGREM0OoswSTD3K5rMFKzz0eaHvf1
         5DMw==
X-Forwarded-Encrypted: i=1; AHgh+RpuoZnwS1vIjC6G5tSOynohoxZATZCWtBQaONwoJBcitS+Zky1fuQRC4SCJ+HeyDRJ/2J7B4zkszEq5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5L8gsKk7qnSZltkLoAgDgiYtVpsOrFejH7pxuXwNzQ5Ad3CwJ
	sFps53BfFUC9OiTiGP4QWoOkgVdTfDVwTE6jaRY+rwdEXBqXojjuZFpug+iftnBcE0UxqCgWsmQ
	Z0n2ugK6fM9SFlAdrJ87hXtuhWFlq98GTHiCW7FXoOQIOQIEas9fuHDVsNtpahRCA
X-Gm-Gg: AfdE7ck3SIHgK4c4fdda/Qu5BFJ8lZJGewR7ahkq8kgB58DtkxQXJufYfoDYMXnV4nf
	LKFsZ71mMRWiVooKG4BpY/RnJri8cVnglNTFCMnNg1h6BhYIKAmeuSHmJXq7CJJ17Zbv+dqdsy6
	QhMk+FU9Yk23tEslISFnG68JS0/HM9vVCsa6plY2Nhpzm7OzzZxm9BrYjOjYC5kbTxascsoZFDh
	7dO0vH0nhpKjLLZkNOcBfdWQEMtrvk+Xl1erRWUnaTohxCHI1GItWkDImXSv1b4IgnGwCG3SoAn
	8af6AUOvTUAzoGP9WxQRVmBegjbEDFDWDQJr3zqMfiU+pqREe2Hv12ALDpHkxszb5om5cboHbjI
	2QKexo2okMTrmuge1/YecW7fxc/Pdn6Rx+c5qSvU=
X-Received: by 2002:a05:6a00:6c89:b0:848:2f74:d8da with SMTP id d2e1a72fcca58-84843012154mr2399870b3a.75.1783509614451;
        Wed, 08 Jul 2026 04:20:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c89:b0:848:2f74:d8da with SMTP id d2e1a72fcca58-84843012154mr2399838b3a.75.1783509614026;
        Wed, 08 Jul 2026 04:20:14 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b5e566sm6918923b3a.3.2026.07.08.04.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:20:13 -0700 (PDT)
Message-ID: <899a5964-bde6-4cf0-a3e4-f6d0036dd3ab@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:50:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag
 for DISPCC and GPUCC GDSCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
 <svxscdqhtkzkyitstli6srm5el4jexgefudrbdyjhvywr6qdzu@h5yjvz4hmmvh>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <svxscdqhtkzkyitstli6srm5el4jexgefudrbdyjhvywr6qdzu@h5yjvz4hmmvh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e326f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KQFNWlLbjmTlgseXzdQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXwe9lYY9jOvPM
 pDVgQKm7PHRARcc6cyrc93+Ia3I8ElZwWgYb8d53xnhTYwkwGrflqQIJyd4Cunf2gOMIt49ai4M
 jE00k83eLkW69Q0ifszD8kd6JFAQg5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX+vo+aC1AtiIP
 30UljXq2/fFaYaZCITzpYG919L9u0jbROe66CArkj9e1x0ufhBK/aTyRCAwnuSprRjS1AcBrvyx
 sMcz6lh30O4tAKjIyA8tXtgMfHpsefHS/NqZZ7khPUy3Rs6qqsRMBqNbSjWrWsTwfGNDi5fz1hE
 P//UGSmfcZUlnvP6Zk0APHybVcU816ix5tsOQKx4HqPkP4IUOylJSUkBYf/xj+O9fpyrqnbqqm/
 Vke8QSdmccamxI+XuI0IMltFs8iGufMT5VDoPnWx3eFWYL9GKZBK8sJVec+GcQQcKyIEQl3p80H
 beW+lMtJ1I4y6/z8IdLMlEtsFr2VlzomXF8xJFy1rcfQT+cZnYGeFqBFcdrEIWBfaebYEOKwCTT
 zNQZ/lw3ooZ+4iDEMTHAAtv8iizHe77lTwISlRxSKcz0Ut5ej9q7xxvK44TJGdDL+bPlLG5Anxu
 /zKKCTaS6BJYSh1IvXg==
X-Proofpoint-ORIG-GUID: u-XiJFAcwc-GIHRmG1KQJQZzup6AFRiP
X-Proofpoint-GUID: u-XiJFAcwc-GIHRmG1KQJQZzup6AFRiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110



On 04-07-2026 05:49 am, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 12:01:32AM +0530, Imran Shaik wrote:
>> Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
>> the register context across GDSC power collapse.
> 
> Fixes? cc:stable?
> 
> Also, while we are at it, move all fixes to the top of the series.
> 

Sure, will add Fixes tag in this patch, and move all the fixes to top of 
the series in the next revision.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>>   drivers/clk/qcom/gpucc-qcm2290.c  | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
> 

