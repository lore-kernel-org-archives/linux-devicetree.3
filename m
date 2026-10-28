Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184907;
	b=SopUEMbG5SD+KUVVCKcxsT41apxiSYGYJIy7Pe7KQER7FArvg93+uMDHm+rCK/X5nKdh
	 XGnoaSEbfpS3vVaf7iEWm/BwWj4L3ynHHDYfQamGHTGnjTF5zC9eNthtnSRzrE2lePkBB
	 5Yo+ff0H5ChRfWQZdnRjBqFWKiQVCI+43Rr1NWiL551nI1SVvazC6J9Im7jC42IYhHrBC
	 +zctgEQofmlFpotD24K5X5ZNAuS7CghuEG4KsBZh3gBy+/ZCuu8LX2+W45qYRR7vkzkQD
	 PK7D2zU2ki8B2L56D5ba+KI2VLhEjefXhiV93KTUdB9jggUyIch7PXQozGHJ2IktRqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=;
	b=OQeaFSuzZgbJ95o/5MydJbrOPylM7Ur6DuBwqCEfNAOYcDXRhJNvCDQLN3CV3/QjOjnB
	 a2CsjkUFzPk/TCIzSAu7Rme8EnBIc7vF0FOq5IGq1VHhRBQjTQ4myOMkOs/EBrqgkbfPO
	 Ees+wzgmaYfeb1NxpbojEqazSp00OcrCfcNt3SjcaAztVYd6vpLVE9Iw1zhBRYQUbINSJ
	 8v0rK8iyePZJenmITblTSHtyUGjlp2tOlGAz3uTCcZxDUDQA8G7IrGPRd6sk9cJ8tNzbj
	 mfuxIjgTx1QDXyh7UIysjM/ZP2aIfyr46w3Vg5/W41G35KWDG59TwlPynxzzp8gfuKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkHpxOTO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZTe6TtH/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84B5606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84B5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LkHpxOTO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTe6TtH/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KNQx3265016
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=; b=LkHpxOTOYlUHfJx4
	m2pWz2moAC8FSgKdhWL8dLH9HZH063WrDP2GJVcoYj9j+G2e3MiWdtAKzZ3jANtN
	nrPq3kHzAO+v18Y8pSVPJwxR19WGifUpF6k9ODQpKeUX6qDZnWsX8wkKag3purRG
	fR0smHR7DNQJvnVx5Iz0k+jjkLABZewOxaRG6YxuDdOliubxiidVvi9gojGoAZ0F
	95OgeDRQsyv2V1gH0cnBp40QUNe9FtKosmIb4m5eZkxSa33jbYBE4RZIqw/VEVLf
	JpmqGfMJz4vYAY4NZpDk2jXHorQtKHOF5FEDD2UI3IyAazoR0dl5xBim0awNxSPu
	uMBaRg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy713t7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:55:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so3519700eec.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793184905; x=1793789705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=;
        b=ZTe6TtH/HBt8PFk/jhdzrLVkWXp4wjcchQPiYAKG4FyUdSxjjnzCuXLZux6+7ynlIS
         RGcTqxaGryTrN6MAB1jMv2I8obntPLvkWvJvk0TT3ZNa5nxcMQdqXiF5DiQeoayH8mJb
         3H80x6yhEJrp9dDYN46kZmlLhUrhQvW6UJ8cuNdMdgWZuScQ2ne/SoErYulP8pNhdmml
         14pX8J0XdZHRdg8ZqtouTXOSXEVLyBFl9IP5p953WDLNn9jisD1QmMCdOSTjK/76rYLI
         /jFwpeDtHdU/xN+r74WWxZOOZQGPK5A0JV/m8ITxIGwdM6uHCaBY5Wr+6l35rZIpY+TM
         1mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184905; x=1793789705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRSwszkW8iD3xY0tmKtYtFhq8IKTNKbbXaSkFyhF4NI=;
        b=mJu31DN9zpA4AEE+t/B2ll00QVpMgfZ2lW34SzXub0qSVZnbYoXQbAHVhDy6JyM0Xw
         Vbzaq+0VOoD6lufDOLNQcMrL5MsckJ+nwj13YT3tZ8vgCzETRrQGJ3DatNtfBQQkaL3U
         39HM80Wn201iLiyQOiY60Ju3h86BpHemHMS+WX7piTuW/EMRRelvBR4His/VpXBQAMVe
         1FhFm7wtad8sxwT/om6E74B7cIeBWhZp97PTnUJ8wNaxuWWHtpXIYy/j5QXJNP/tCkt0
         8f2+JRQ8RygMaVACJTJOa8QlurZnKrXnUsgkAmAZoKND4TD/Zn6r9V+jZDEUX6VC1Ii2
         xtCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbvOTrKvGjLiVTSPs3vkO2E05aNy2BCIc2G+Ysq75+yxiGpmz61OAmqp/qMcjuQnceWbxw80UE3uJR@vger.kernel.org
X-Gm-Message-State: AFq9FYKyf2dWaGxwTdF/nmbpWULxstYlaZTGCnjQpOzos//uVsk9RbL6
	PUHck0r7BdPjiL6iHFjFCOw8B049agfKp5Wgh5PRWfvk8n2fNBA9WfzIiAib2DmrrNiLMnZ/6Us
	dTO5iTQ6Qn+PoRphz8fq6+CFFoKqzsnerr61MuNfqVcjzTYARdhTrWOA4n/bJSiik
X-Gm-Gg: AYBFou2UAdTKjMizRrtrENKaysL6dx4zQ+AOuoAbdxnMXOqe/jmG9clT9q+Dbl4bJon
	ck4zLrp/of5e0w179pzdL122Z0CuaYvDgE0Rbcu04YtwClryAUAkuH5bacwQIVQGJq6YLI0Bp38
	2Xvt7x31bVhkrc9s86H6A3vtPVxvNH0BTgY8cOyvErxNwUOStTbm+XQQieAXhncRlb01Sd6vhrl
	MNtKlXpW7OHsW4q9sjDkaUqCtmRYONrttn61I9gZtwdJSqdz1t5VQYMDXAFAb+kXtGfAMx9NsbT
	5yrJY7FNKJ29xf436u1o9i9YSCTQZvdZ2ywrMODOvyASPQF54uwdVWl9tgkZvQDL+ZoOLbjszcU
	g6du0u+k1GOj895rkh+c1y1CVqmegMdZhpqAEXxrquXK+Djh8QF9LsiuV6G9hf17VnVKc67LS9P
	c+Myh+O3senmMiw1U=
X-Received: by 2002:a05:7300:f894:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a202bc3f0mr3393206eec.1.1793184904737;
        Wed, 28 Oct 2026 03:55:04 -0700 (PDT)
X-Received: by 2002:a05:7300:f894:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a202bc3f0mr3393162eec.1.1793184904020;
        Wed, 28 Oct 2026 03:55:04 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238dc80dsm6335086eec.9.2026.10.28.03.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:55:03 -0700 (PDT)
Message-ID: <1dad9241-45c0-4405-8d8a-2437125cf8da@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:24:54 +0530
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
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
 <20261009-glymur_ufs_qcb_enablement-v4-3-9a6ce83195b7@oss.qualcomm.com>
 <feb43c1a-9f1b-4181-b663-eab9e55e4831@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <feb43c1a-9f1b-4181-b663-eab9e55e4831@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfX+d09+AT9XOFp
 5d772IfjqMkr4uCvxr/DBPmNucEd10Tw0IEiO6KCODWD1dvR9tDGUwvTBsBBBJJHdy5yF358Fk6
 lORVbQ0LlR4VLTNFo4rTITvaFAXgMMJeQ6uHFdexPD4VCYxrR+NvqiOjPg5esiWpAqVpMeH/QXY
 kpv4zNSq44kCl0yYrE/3o71BkdVcLLaciA/yXyzSbZmC+T3vpoBT6iRpeWvQuufzMJur4c9Ka8w
 5ZxzJYW19mUF4zCVUQqvZjr6t4W2FJTcE475Z7oWuuksrVjeh7uxkrNImFAyAeScJW6CjPE52Qp
 9C2Z7A4gSeyDnjKswPAwIc7rZRCEBh5eYLMZrSLM7cj7saZcOiHJO5kBzNtwto/Ta4Rji/G1g/L
 m1lzY082DGdSdFv79i9Pz2+3yRidq5TaCPvwk25FYJ4dlWXgwHt/Op6UWCJ8/THtWhKMaX3Br/7
 yejcDQpDejCLWXtuJCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfX6QZ17bhDhKe9
 efIXW1I8lsH1YNUAAs8p/eR2ZgyR/UMOigJZTZpNKTQDlVMt7ocZCW7KlE1dzr1PHpxAu+WBJNd
 7J9/RedRz4GbGp07z4VLTW8NQ0ZFGLU=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1d489 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VHdet6GdWXRFFbjuATMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 3Ani5-AxGeA8uzGPUR0bXxGsreq8cevS
X-Proofpoint-ORIG-GUID: 3Ani5-AxGeA8uzGPUR0bXxGsreq8cevS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280043



On 10/23/2026 5:25 PM, Konrad Dybcio wrote:
> On 10/9/26 12:35 PM, Pradeep P V K wrote:
>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +				opp-201500000 {
>> +					opp-hz = /bits/ 64 <201500000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <201500000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>> +				};
> 
> ^ this should be svs, not svs_l1
> 
sure, i will update in my next series.> Konrad

