Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CDE4BD359
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885508; cv=none; b=X7dYzeXokKp4wyxPjMmfyqDUHXclbtrKceljiO3qr75c3gP5kO2rvD7NMlpDhhV5RNAFb+x23LrhWN1REZB/9WXkRXp3mqUsvdmb4giknPGJRiAUnfwu5lDqnYZE5IJ5atVsZmD0PMA0KxBTbGsyfEzukNNpUAYcJTLZwHmKOQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885508; c=relaxed/simple;
	bh=2dPTRel0DT3n+CZtpIwB+FFkdaQRRQzMwPcArTP1QWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtErZwWkauC9TGYWv0Xf4AA3M18LcW6IQ/8sr59eh1N4+FnyB6JLtf+k0IZ+s27zp8kfHn+Kuy/HNwTI0nFDXrrXD2Bt+Dq64Yi4NKX0R+5dKzRsJ9qCMNadbVOpJDxIJ0Noa1gGmxoBtPtlaZKydJgSbMGTmKgNY+1TbYeDhd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMFT0x/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=excWAuUf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMFT0x/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="excWAuUf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7Oum6015766
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=; b=JMFT0x/QhIve9LNV
	RmsGXNrDHU2YziJBpPE9fojAYA5Jlxpqia/OMl0DCTmM4Vl6Rz7z+t79fi9EBST2
	g15yrL/S6MtccbBV0xXN5SpU8BnQIUL6MEmSaC5IiiczaBxxa0jihurViwK+hty9
	400HpHg9UGE04+4QSpWuF+29YTNa57KpCLETyc8s1NOuLQGE1Qr1Im5af4fUGVx9
	Ht3Igqu6DWwFFxVMdjFn+tR3V/ezVw1kVP7GyQX70998I5/VFZDwb0k+DdP5g5Ec
	xNhrwLqRS+QiH+7xZjs1I3AkFA9PgCT9c3fJvLgq+gvYyvKBflej7rC2uJfH14qo
	UyPNiw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugmmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:58:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so523637eec.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885504; x=1792490304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=;
        b=excWAuUfiiIBGIxsiN1IfOcLviU2/tKZZlI+P2SxChi/xB0A772QrcNEwA0LxUoWjJ
         OpmjovHetBZIv6F7zF018T+wxnfIIqL2fvRUdSEoiIdEm1aDDdRYYMbahLn1s1XY8KnN
         dyuB8p1ymZxpELsMP6cZb6GDQs2Z2jN3WSLOauHvZRapfU9LZBKRH/hv2wv9rT5cw39D
         eCmpF9W3wc9lCjdM7zoIH2w2H5xrFSqaWZ9/i1k1yI1tD2/rno32WAjiTXiGYGlJG5qk
         vbwDe61/BoS0k+NErgbO+o1H9RF7yTBJAsjnW/JnhwyInHZYXnkkY05cVkrYKwcI5/3W
         caLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885504; x=1792490304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3ffTM87Chgi1G9fTBz/2oDG9xpCCSCvK3xemsC7/Os=;
        b=d8+HsOYSemKJcrqXQQySWZ/nNfxttfnjadxw2yGyqQY7HNZQjSu6MX67GEx9/8Cqw5
         R2wafiPzNZ7NqpbLSnStNJuJIDz2DKyAtEr+dcK3QPYh6jt9a98EQzVfh7soYoEwaMQV
         kz7Gb8fJdKOS6ToQMwaTF6SNEsX0Pz5Mq919m4cUYSGsvpLEZ17b3qAyyiDPzqN2Wtdq
         T8tnV4GmunNGFRhUqg2QKm1yL+DVdHNEHaxpiJRChE5K17eH/FWD83M6ql2oXqTAMmnM
         u0j7Wxf5e7B0AVCShmS3cwvJckCO8fD7GySOYhef5zEKwR3xzahlCGKFc1WXM6puki6k
         eEsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaZuPDR0yOyElmLkwItc7fkKHPRSnzOd+syVa2eHBIz+mTinSNN1CKtauc+WvvFSjDncEfpmu34QWq@vger.kernel.org
X-Gm-Message-State: AFq9FYJfrNpmoHNpCx1XGBaGy04Nzinsj34I7pJhU5vNFTHU7+C5lB9f
	h6mj5U5fcSEpfUCnbwB0wi/xyO+oK5d43ruyHb1XZ6AkvBoS+e4E6IZmH6+ERHUdf5yPh6ZXpcQ
	PykrBGHjcXaZracUfPK7E6yFzsbICTg6c+ih/HDaArPNGhxCnRfsiKwog7xo8rSne
X-Gm-Gg: AYBFou1pndIzNQZyn5SJh9vKu7J2Us0jGFwhU3ffK8xBjuWJCTChqRLAWGmA1ixwgRL
	XeKi4JaA7itCQa0BwfvEDpHRxThjM0i3nPq/mCNBdY4B4qEGugzB0covhvL/ioQVwcVOD1GNrw4
	hnqdik5W2zdILTmivxFuCNupieIAvsa0KqzGSNP60MgCIY35E1JbJqY9qtax578bYE3jXC6dXi6
	hqZmEzVNY7mERFAcIm/yo2YKUZ0IdwgQq7cTsJZrYdoTmZu7ZrrIt2qAdfPWxiiu2JFOlopG39P
	T2mZzYT1Qp6iFLjDyT39QWUlXnhsKHe6uULarJBTwN0JNN4Y2gYYK8BY/0hFpOGweK+/64r9gwn
	B42x3U+i/09zcxNf0uA+1rpIEv9J9nAA=
X-Received: by 2002:a05:693c:87d5:10b0:351:433a:acfd with SMTP id 5a478bee46e88-3537e0796acmr16646929eec.38.1791885503543;
        Tue, 13 Oct 2026 02:58:23 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:10b0:351:433a:acfd with SMTP id 5a478bee46e88-3537e0796acmr16646878eec.38.1791885502644;
        Tue, 13 Oct 2026 02:58:22 -0700 (PDT)
Received: from [10.216.22.79] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35977229a6esm27114030eec.8.2026.10.13.02.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:58:22 -0700 (PDT)
Message-ID: <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:28:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
 <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX5hx8GEFKtsyT
 9p6dvwFD4xDxhMzmJzyxsnMj4kJjn2DYRW1DefpOPkFZHA0Jb75wwVlVV6wqdurImWf6fr4Dha+
 yGVsh+lPwQ9uGvHQmgixCCRI+vyx7uYZiISCYpTLC5gyUWfOvESrZGV3iqpS8bcPcLhn1cPTI3X
 9XfzCeLmal9a3QkQ97Ly1VAgmAZlQG3W9daUQDcK47TgtmJis5pQvnT17sEcpzL2m/Y6cpi9QlQ
 79Wbx79KUluum6YNkK6DB/FWfSdm6MGu/1HPSGtBYEJu8AGukqzNHJoTIxSqniPdR9vKLTyDVnV
 obi3yzHv5afl1h7R1ZL4Wn5ZTATFYKImCMcFL0EUYOaCj4XPcAlML7Gj65W+rSGYhF69Jn1g1Zn
 qg02CZUMfdQJlPYuAScMeAcwfxMMjjgMSl/Sn/GBzxEvvJTt1s3nQd+bZMNzRVLETaU4SG/hxkE
 oR7LmUt/e7N8ffiOtQg==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace00c0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bJu89BRhDEOEog6wxuYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 63rubHDYIbkoX4WNQJ6XAnmNWKoDA7_f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX9gaqVcr5wrNC
 rglCLFQPjPpb8XLsmsZbXkxggBUbix8u+1MVmHHel9qL6bZQ5y/trMwCTddd4j0Vlo5MfC2O7ZP
 EJkxiwfRYtqZDBwE3DkjV81YpxhQB90=
X-Proofpoint-GUID: 63rubHDYIbkoX4WNQJ6XAnmNWKoDA7_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

On 10/13/2026 2:27 PM, Konrad Dybcio wrote:
> On 10/9/26 9:35 AM, Anurag Pateriya wrote:
>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> 
> But that's not what it does on this SoC.
> 

Yes. I will update this in next version.

>> It provides a solution for control-plane processing, reducing per-subsystem
>> microcontroller reinvention. Add support for SoCCP PAS loader on Nord
>> platform
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index a005546c265d..6fa958044218 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
>>   	.smem_host_id = 197,
>>   };
>>   
>> +static const struct qcom_pas_data nord_soccp_resource = {
>> +	.crash_reason_smem = 656,
>> +	.firmware_name = "soccp.mbn",
>> +	.pas_id = 51,
>> +	.proxy_pd_names = (char*[]){
>> +		"cx",
>> +		"mx",
>> +		NULL
>> +	},
>> +	.ssr_name = "soccp",
>> +	.sysmon_name = "soccp",
>> +	.auto_boot = true,
> 
> No DTB?
> 
> Konrad

The base patch isn't merged yet for nord-ride-embedded.dts.
we need to enable for both rrd and ride-embedded boards.
I was planning to send them together once nord-ride-embedded.dts is merged.

Thanks,
Anurag

