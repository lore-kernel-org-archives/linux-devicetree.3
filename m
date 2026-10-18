Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19288265CB2
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304330; cv=none; b=NaHgBduUjxMYxjktdjirR8Hn9ebJoH3Tv9pwd+CrXIeUURH01kPZ81BEjJWDvwwkYshqj2wtefZgOZdhFwBy6qQf5MiTpBveY/uwyvjDj59U+IzsHYwivYILqY0I+SoOCLwHk/4kAUmgb7JuDUqzxdaELOmfYJlT1U1tlEUGYqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304330; c=relaxed/simple;
	bh=fh15zWcbwdQBf541KPLG2838Kk7bkHLlto3XyHFlOwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qO2yiHb0UdPG2VlnNON8YlykfjzROgpHV+9DSTiuqbdR5o62cXef9Ul8tTK1sgrhjkMk+9FyBDUCc9C22Rv+jUCV9p1/F74nq8lo7ZYwcJgtUmhM2+PhIIJzF85eh0KuecI395xp9hWVPizvHjScisuM9K2CQ0aBLrMe9DgyJqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5ob6j5t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZcxofxJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5ob6j5t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZcxofxJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5t9PU2110354
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2flQ9H/gIbTtycaEqJj117FdmKcgUiVqJCxdODCoPc=; b=d5ob6j5tw8T3hUIh
	vdr78hQE81CBb7fwWJVs08crENiz+37KmNDEz8I9J29YV8sER7u8h39oVmLJuc90
	2xvaq8SSZTaBbCMwqC6QJzKqkjdcJ+636GOYpT5SrXUh0rbVDPJnj1OZwyuzIDJO
	jtxTqRDQ063tmZlgtq0oNzOsL/S2n+CQWAjHoRsv9FcG/HwRsuds9x9x2+pJkQtk
	E4eBZhY1FlculdUZZWVhy8slmDNE7O2T8Dc8sKoo9Rm0k593luQRp4tXioXDFWUM
	rb5oewJ7AgPJUU838VGv7EJ9NdjG2hiHZdEw9wgwNsFvHeARmguVKfzJHOZvW/jW
	t3jPgA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7tfd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:18:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso1925228eec.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 23:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792304327; x=1792909127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2flQ9H/gIbTtycaEqJj117FdmKcgUiVqJCxdODCoPc=;
        b=VZcxofxJqCqqdFIbljZ1WnJv/4x1Qi7tb2FeRla7IimRhWRHKnRizEoXMtgls4kQhs
         cLcN07s38fRgUTxYgYr+uH4O8tYs2PgHAgeVnzJVSDgB+5hxaTSqiufy/4T5b3ji1UFH
         DXLP3+iGQT2Gf14Y4cAOYxqef3ahe4o5nl1noZN4B/FF8pkW8MR2pFq0kAhLPDzBKIGj
         KyFG6JZkmbtxEqGgho08D56XT3mDBGna9oNRHxSzoc7AaRJI31L2OFFd0Jn5XrHHUmmp
         VrE0yyfG8XNSObjRYhMNHB3g/TUT5SksJKWjrKh0CK5ltzUwljufB7dd6lqgWABqsvyF
         Rqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304327; x=1792909127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2flQ9H/gIbTtycaEqJj117FdmKcgUiVqJCxdODCoPc=;
        b=aT0RTzZG7greayzlxhDqogY1BTbczxnKQ08JEE2bSO29Pp4XhbnqYkvDCUExirQAD0
         AL+rGvVse09exzJwcHMEKZvKwdsIubGJ+JHLOtabEcfuEO4hxFoGEOAZg8hZxy12vSA5
         2xAUTQ2PuuPi3BgJGNNym1mzAPATrw0EFHYUWpPzcl4vux6mVVUBE1O/tZ+vxpSBSLxa
         W3qwnjGqyZlo9etl+/g7Fi/kNBNVu+yVbI1D+r/ApZjIVvtBUv/brI8TGDgjOGMOETWz
         6roKeflUPNqHqEAcfzFQ4CUVqovWx2LZcaNQ2L4xNUzQph6CwK0xjuIvLpPZ76gt1E22
         oz+g==
X-Forwarded-Encrypted: i=1; AKwUvBx8E1StPuwr3wTm2r1u4w1rAdMikk1RBLQIGCumfybijwjojAg9uAIzzkgzPnYMXBr3DVyq02LpXbUi@vger.kernel.org
X-Gm-Message-State: AFq9FYLVxGRvNI7vz+iKbhLdmbPoGjRX/aO1bvou3RvbwsjxBdD+7xcY
	pQG8UE07j/Zrh5gp6Mp7OqIO1Z0vOB8abBnNuAy4ST/ftPmUXJ5jcNEENwZZpPNSGvAzZ0pU/VD
	FaD3aVB/mdyMSr4VC4JVS+PHVQG/5zfUAOuKQ242MxNKIve8xqmIR6H//2OvgRR8M
X-Gm-Gg: AYBFou3AHxuTLTCVYGagLSlSNAbQ9X05ljXeK85pB703QfCR1vi2uxIJFeijMrY0E15
	1Y3WOSYffZhmHOJX+mClNPQQnwGug22xS4FtNxwKO0yblGV3S5ZsHRncBioSypcfYNpd23JixQo
	F4TnTen2YtSMWexkgR0g2VhAyjmaHxofuwPvyCCYbRVgqu9mxrPFWTCKOEcXUshfZZSphYSC2jp
	gQPGtlNLavKrWfVXLIFJTf285O/ivsoWvkQKWqj+ZMRqF3k5a4QdI950NjOdM4cI5nZSLT/eQPx
	E+rcHR+FyKZh40YuO3sCSKj/lYLdsw3kOF3Vt3kuUUzlPKSWeRCwQmqx3UT7KWiMLsC+6ypBjt8
	KibXTCue7tJcecePjr2S7aVpFW5mZGt76mw==
X-Received: by 2002:a05:7301:1a07:b0:35a:a5c6:40e6 with SMTP id 5a478bee46e88-361a126a8femr5735208eec.9.1792304326925;
        Sat, 17 Oct 2026 23:18:46 -0700 (PDT)
X-Received: by 2002:a05:7301:1a07:b0:35a:a5c6:40e6 with SMTP id 5a478bee46e88-361a126a8femr5735178eec.9.1792304326355;
        Sat, 17 Oct 2026 23:18:46 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm22719789eec.8.2026.10.17.23.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 23:18:45 -0700 (PDT)
Message-ID: <4bd7b1f7-9156-40b3-9037-f909a1d02ab8@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 11:48:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] arm64: dts: qcom: nord: Enable SoCCP on RRD board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
 <82b96322-c6e4-45bc-956f-ef21ff4bed5f@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <82b96322-c6e4-45bc-956f-ef21ff4bed5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyNCBTYWx0ZWRfX9tCrY2CCs+PO
 32B7tnFVbARLtugSab3U3PFJP0dm4cjzWf/Yc+MtcP6P2yVQKi7ld0tp6HrpCBNXG63unIsHtcA
 atrwN8WzHFiGFFaeqNN7AV+a/on6G6Y=
X-Proofpoint-ORIG-GUID: COpUQXrU1sknr-KjhXG1yniuVLgATcU0
X-Proofpoint-GUID: COpUQXrU1sknr-KjhXG1yniuVLgATcU0
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad464c8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=2a2+ae0sWwZdsBobmU+nRA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1Kh7krj5s1ZBTWuj6-sA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyNCBTYWx0ZWRfX7uFkrXR0CLOs
 pQpPuzaOsG6j9Enp55dX52/tKbtV47KrwxbZgqqkNsZFBKEO6MBHPwguRpUZMnFsle8tOwxAruH
 daRLIPbTODp2jv6fpMNAuZiGN0Bzvio4cOTZ+cIsEvKwiT9B1irxQrwntrHP0+exyTjZqTWvhc6
 096rZhP7HEoXff6eAnDpM1k+foVEsGV+8LfhW9FFhlP90EVcPeNYolAmsSnQ3dyJy/w03HY5y6w
 poG4j5qCjMrydtoolgR8ELw4asXnQdae236YuEYTCho09H5LayRF8BG9GFXJYWBuPGliNLYr7SG
 nz2WZpTWodKxv8/0rkhDeqYSb6qC3LfZvHTfQ71HWSDPLrvVDircRsZcR5hepxCcuf6lV9fQbFF
 twfc0QK9HO1xcspTXYfd8m5qGtWFmpydBVwq0A3xaZmzXAJW3oZ6RHBEnALOzfGLDRBiBJC8SeK
 TGhk72r9yh6/DPlgZCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180024

On 10/16/2026 2:22 PM, Konrad Dybcio wrote:
> On 10/16/26 7:39 AM, Anurag Pateriya wrote:
>> Enable the SoCCP remoteproc node with its firmware path on the Nord
>> RRD board.
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> index 47978df0af92..9db94c3b0c91 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> @@ -434,6 +434,12 @@ &spi16 {
>>   	status = "okay";
>>   };
>>   
>> +&remoteproc_soccp{
> 
> Missing space before opening bracket
> 
> Konrad
>

Yes. I will fix this in next version.

Thanks,
Anurag
>> +	firmware-name = "qcom/nord/soccp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>>   &uart4 {
>>   	status = "okay";
>>   };
>>

