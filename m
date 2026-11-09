Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242745;
	b=3u44A/BYZu0fe8OeSRSLOD+rLh3rJgzfoyu4oD2OMspXK+ckOzQEAo9/PVq33LX2RMs2
	 i9tfDh3DTedu3OOYzQ07bppSPshR7GYf87brFx2AZeYfdhrUrQM5n8o1pTiT+gtB7EP+z
	 BHDgbCy9hhN+D3i7Y6+kb96ywIGXXf2vX5RAsk97xUFvFXsDFCQMIqeCfJQvAobZBttYH
	 jLGxouMB/4S1A/snl6fQ2vB2xm9Q0VlevQwHECdyv1AMt5A4hk9XYHy195mVPWMBkYQAP
	 VS8iiQHa9sZiWFv/yx7la8C6IpACzim3N+b6ZHp5dYkUVDX3n4hDq40bWssF9K6jXsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
	b=EnfgM8nrZKeQM0bNf09EL96+Yc2ztp73PVBobwxEOPjRUZMw46mK+ffc/HzAxIqzwOwi
	 U+gPlzwx2QTocClbgcfwbloQrGggHc+ERiw242yRUL1Gs41x6VAMxPQx9xpaaXsg5QvuG
	 yVMYWAegUv4prhMjMWR3UWbHLLOOzfdhV1ioIOVMPEMuemGMnu4ifq1fycWMLFw66xmEC
	 zMko+F9N1gRh8RwKZkLl1OJLxkDJ193+gc+/ixEfSJWUnghc6ssFEQLC/HYr3fYKW6Zfs
	 oZoVvviWsg/DgkR/UPa6TmuVvILZ+q1QaF+tL6JEW7RCw9TIZ20Mp58hZSEZhNkZJMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z9znmG26;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHrtfwZF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F8606A335
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 256F8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z9znmG26;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kHrtfwZF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFD0Y022892
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 16:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=; b=Z9znmG26EPaUKSEV
	VRmBdJyuq/dFZiiTn1J2Anbbvsi4om2vKXrB51eY2pi22iW3s7MXTtByigsccPqU
	rOTBswiRDzhk1/Pdgh/sPuXwW0bsjZ89D0S0Cueyfs2L2fxwl7NnhCrSulkvepbM
	O2KFLbserTnhvUk7KLKVorj2eQNbC0yS5EpJA8vDz2246cgugo9CWPKNh52oKoha
	QDc0a0ue27Y9ssBfOe8zk7IruUnT3Ku2hSp6rAcOtsCuy7by17IGXgre47d9HMB7
	Qu97Mp2Hz2vxE/OjDX07IPjKVnTA6BJ1JfSXxKZg1wWHYmEnNiqP0y+LOU4awjtX
	MLjTXA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydh8qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 16:45:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2381057eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242742; x=1794847542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
        b=kHrtfwZFqd47WfddUOdWZKA/pr9I3C0Mjh5EpKkgM5wYv+wYIdMAD8eboLskQ2D+OE
         R10tXlf+XCJ3U4KLHiCEIl4WJ0z9k/1rpPcU5sIpQveESP2qbB4AqO3Bew05Yqi6JE8c
         q+Ka8CBpY4U0AFE0+3tw7XK6m9mC5ystpbynrbOYm30NaWyfYNXmQf0OLHUqcDMHU3wl
         9TKdyZ/pQHrVlhpNdTZZmomKW/TTeDZDgq0bCYcHkffvrPve4iNrtpoqV+o/24XlUK/I
         LauKMk9O9JYrYRDetrmmhLEFrSgx7W7PGL438LEvR2bMVoRfOnr/erTr1pVWtZ/LDO2N
         mpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242742; x=1794847542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBx+pQ4H2H3adUQa50cH2AZAKCnEvci20+6PQw1MHT4=;
        b=BxRyROIsYy1ibof4WgGnMCvKeTFiZ9rCkLAhKx5p4ZTHlK0860U7S584yz93GJFAZx
         gfJ/uNnJO4L77zK7X44iLOQxGS1lr8D0ik5w8WMjA9NFdcvPawOC7O+sNbPcZRlInVzZ
         Lk+41HF3BS6pLZCTLIIx62i9B+rSlhNstJBQRfESvQJoKzO0TxA/a9F34i1VYH1XqEL/
         hX3+RDO1BTGD65JZEIbcKJq6JZIiSC4Q5uXRS4OXWm8hXmf7pFX3OeYPZK/LUE0AV2fQ
         hSEj2URZjhL5pmQqaw07AH5mYjJcwoQg07fU2PRw2pY/rY3DKx7zsKzvVZvJV8I/lMsk
         PEaw==
X-Forwarded-Encrypted: i=1; AL+hErFtsCPKPcY1jOD/WL7Pn+oxpXdwVkj247LAMubnKIqDUO7GmIa/EW+knR4JkW99ydhmb2YaXf9b9HUO@vger.kernel.org
X-Gm-Message-State: APuU4Z8c7WToWwelUVdu6vE5TSjSxAKdzCi1jdEqFAvTDHSTwzDfFgDx
	kpkeAjTVSuNEPWZ2xpOwI9+gVgd926Hz21p2QGzRHHd6nrsRlHvCX9V65WeD+3oqv7xC78dA/j3
	8FDmuZ3KIDThKq8ceQiAerdDXjEuSLCf8vMztoauTTuXSOd/xIn9BqK5inEe5KkZEgIvkOeCT
X-Gm-Gg: AYBFou03wFejtLZey0dTHJf+ItqBYhOAKrCHEFASyd+MSUbt5G6YHr0N9qKX1+5YR1Q
	s2YQ5g4dpLOCp7JjQHbQ7Zno3gUlYLtaa18zF/yZRR/3+2ZK1KvkODFqAV8KVI+YZfzpKwkrR+u
	6MQiMJGXoZS6HaZ8R58d3sbjY2MRxKza+T4Dt6ppQbPWm1KL4yzVFQhrKFHckeuuSX+DjkHoYHC
	7NgOvao8HM1vBX4VTBVuveihVJpAVG4U9iaWMp1YcJoQso8gfo6z5fVP3Ks4z2zMMFnXZv0Z3XD
	oOO4AFwzr1Zn+GWzR6N4ZCwEI054MQ1ui0qsUO6rrw3iFh23hMeLAjLr2iOgNLoe1xSqiOptUXJ
	NAwazFi1rfjIBSywzy/IhXJUtcedOqO3kQvJ9QCGPyq+Yl4yYKnZ4jpplfbQy7+e7ao7t7FrM3U
	VACG67YiaICt2cecU9Puf4x72kIQIMDyKwGCSontrU8GJhyQaeuBc=
X-Received: by 2002:a05:7300:6822:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37256bf17efmr8459346eec.23.1794242742019;
        Mon, 09 Nov 2026 08:45:42 -0800 (PST)
X-Received: by 2002:a05:7300:6822:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-37256bf17efmr8459297eec.23.1794242741349;
        Mon, 09 Nov 2026 08:45:41 -0800 (PST)
Received: from [192.168.1.66] (164-34-238-49.southernonline.net. [49.238.34.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm15132197eec.20.2026.11.09.08.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:45:40 -0800 (PST)
Message-ID: <37560f54-ee44-48a2-aa33-5229a4087ccf@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 22:15:33 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
 <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <8015c245-5bdf-4088-bdce-7e81b3fa440e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX391mkVQgynei
 /C/U2JTQIhO9Vk+AVTHv6szQFGGzRmo3eCx7POcC41X75LP1o0CxksFvxwwSlkpObTmOX+ikPBv
 6eLlQyKDH0LumgYIqAwKftP4x0Mf2fM=
X-Proofpoint-GUID: K5GDML5_6gtOTZ328tkWaarsqPy6iQS_
X-Proofpoint-ORIG-GUID: K5GDML5_6gtOTZ328tkWaarsqPy6iQS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX/A6GqqIgzmx4
 IBjSR4BWMZaGT9z6XCNqdKoO786uNqZahHZvAk8SdapOiJ2KRJg7I3qQK0eYPUUYheh4Jxi91Qd
 3KsmxX9ppC6I59usyo0/Jkf7iAgwLGmcXxNo/kJjAVypyiMyhof1CicsOLfUzmgbS2SOOEDsdX3
 6cDlVafP7AgvUK4vYTh/iOnOWb469aZxdPl/d/g/3WZZk81tw1rFpC6lhVjrvOQg9vZGHeAXwG1
 2O1n7UiH8EircNk4Dlyp7J/EoedLo3O+spNdscxTuvt7pcUEOWcutWdm7TISWWP2VT399oiOLF+
 nc7oSgHy0iIr3WmkgPqP4YAqDsSsy+59mDYdxwtoU/ixjxTFo8ij1N/+xPOPDp17G5nKNjat9Eb
 2dJRuPeGtk+9bDzQjXRp9/IvIAavvizW4tBR2pKFK58Twi6UqXpPmx79wvYzw97phbsLqQfNI4V
 cpVJROoYZSgFdXVzzYg==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1f8b7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=rh678R6S33b4aGV2lqlmMA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rLV7qYPEkEEFJh5gh6kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090066



On 11/9/2026 8:17 PM, Konrad Dybcio wrote:
> On 11/6/26 4:01 PM, Jyothi Kumar Seerapu wrote:
>> Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
>> this value to request QSPI firmware and validate the protocol running
>> on a serial engine.
>>
>> Extend the firmware loader's protocol-name table to accept QSPI.
>> Reject unused protocol IDs in the sparse table before looking up
>> firmware.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
>>   include/linux/soc/qcom/geni-se.h | 1 +
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 873bfbd6b2b7..396f3d81d292 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -122,7 +122,10 @@ struct geni_se_desc {
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>   						"qup-memory"};
>>   
>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>> +static const char * const protocol_name[] = {
>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>> +	[GENI_SE_QSPI] = "QSPI",
>> +};
> 
> Please use designated initializers for all values here
Hi Konrad,

Agreed. I will use designated initializers for all entries as mentioned 
below in v2.

static const char * const protocol_name[] = {
	[GENI_SE_NONE] = "None",
	[GENI_SE_SPI] = "SPI",
	[GENI_SE_UART] = "UART",
	[GENI_SE_I2C] = "I2C",
	[GENI_SE_I3C] = "I3C",
	[GENI_SE_SPI_SLAVE] = "SPI SLAVE",
	[GENI_SE_QSPI] = "QSPI",
};

Thanks,
JyothiKumar>
> Konrad

