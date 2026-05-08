Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B532D5926
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229905; cv=none; b=G3kcuN78bAK7gop5ztCW/mrcxU6NWHHHz+2p/ygqhLf6Ah6B9CSemePTmOgrtUuqX+KVQ2+kIDJYbR8nHbAdm1v/W3PpB1kt05xSYQgVP4Y51lZhllxXOtbfmChkwqFqDjaPV9rCujeF8RSg1CvPgFl9UpTASqfj7f4wEIhme2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229905; c=relaxed/simple;
	bh=NX25TNRxK1f5CIXLrEM5qUNBPfm9dkjgT6GR10JYE8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=la9EoqNdja8R6GvaLRjk9YLbE55DoXyoJcToJV5AArATOMpXqq+pDQ1MITKBdrvAvuIgzuqeVv7Kj1KvMhqWYmBdP3mXHbq19xw7bCBjY4IjwUPEqW9gj1uvCfLr4AMkPRqXbB/KdMGHwtWThIRXo+wV+oWJTF9IfNOhUNcc4to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOJFPO6b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FujbfTyF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOJFPO6b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FujbfTyF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485ABc82199545
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 08:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQdd1/08YPTwCMkeEQsWN2sR4GrpO5kA/rz43di/igA=; b=QOJFPO6bf0SmH2tP
	IlK6+I491bCZRON9TopR9ts+Gz1Zeypz5rByIPauFEkJYiANDRRbVSTaaPu6uUUX
	VIlnmbziZs0vdRCqfF9B+H08ffnCu3QVUh1516vCSUEXvttmhmZICJEUkVRq/nJN
	d7m1ZrRGyyil3/BfOOIa9+WKODuhJo599AtxA2Z+xdIQaVHoojTOTNNsMWbm8cks
	62AF7NFfDr9OzIcDpgD6TK3Ou0kACB32V17hTGdeY5OxOws9NfhB90W/OCJd9qQq
	eAPROkOV4hlinfHl2tzzsn2LDxZMtmEAdTzsjHX+WvmMv6ni9fAQffcLkv9F54g1
	4cF7fQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sjf0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:45:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f777e3856so194426e0c.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778229902; x=1778834702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQdd1/08YPTwCMkeEQsWN2sR4GrpO5kA/rz43di/igA=;
        b=FujbfTyFIZXAYK2CGRu5jVPtkunTlV6k0nJKZKFC/BZZiEEoH/ARiXkvBY196LFLnx
         NpS5SYuiIcLzuRGcKqXGqJeNZcecjuiOEYL03oL0K0I68DkHJK67EToHtrCqjhBPDn5u
         szcHa2pT6Az/0D7/NQrfMv02vyg1YvFjw4UUEWgpXAts5XdbNrKGiYFS96vfn21CnRP/
         AVlkqBJvS9qBR9TwNozXpSh/JadJG8CCJ6MlkN/7AVFoM3Qfhp79V9Ru87jlrbL2stZm
         DQ25paTXbTLrh1c2cZOEf4tGy0Lx92NNCyvNA8/Fl82ohBzDujMK1+kiVZxX34e/kET6
         5LMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229902; x=1778834702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQdd1/08YPTwCMkeEQsWN2sR4GrpO5kA/rz43di/igA=;
        b=lxbc4TLd5/28W6aaEYHOKCRKDuGMrc5X/YWQAuLPbiB56YZ/yczRCOO9NAddLaM6Vt
         m749ef2boxmArn6bKWFSmROqaGD4AuZQcuL6Cnn1L27lWYZKRfs968a0lmKwbG92yxbI
         IQDZrT0Fb0XJJ1AO2tx9ku7oyb22J/wt4dWdlZUob/irty16UESUnRyMu6VvWzn6Akjk
         pWlJxBv+F/wbt+ruEQOqu3SGCslUA5E9gOtnJNp6qA3nFOvjzbnBeQ9603v5JrQOH+d0
         u1i+/w6F/NpVUSq8nabWTg22q1AxSpiWoOm6NKTl19X27Yk05htWwE+8HQg+nl+CXNEi
         AWbg==
X-Forwarded-Encrypted: i=1; AFNElJ/DqnduQm95/4Nu5YiQ9GvCIzGq7WvoQaz+LUgkKGWk0+iOSweFOhy4xIhLDQpCfHSoQfQGpT19yzMq@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0q6tvkkLgTF8HqDum7wOx3rRz4T7nKMxEOuEEp5B8Jtx3bye
	4FoIPOBima5GBKJOEXfouRVl9qso3pEeUulioB7ralSc3iIhgJ7DwqduTXNtF3GcxkQ7xtjAMZ9
	RXhmbflzwt1ei1k5XMuil8t7AM/JqoEjCqOmXaZJPpO46FiZHBA3gQS3TIF+JKugQ
X-Gm-Gg: Acq92OHbm16rlD/TmVoE8ngY0LDlOk3+GlTMqvDqKBAJMYr4s7/K+c+N79Wx0Jgwvw0
	dvB/yMMXXHrkxZ0GPCDi/IX2wUftjgWJxIjbYNm+SZEzDCRbluQUEWmshTxRhfMz5+pZcOeQFbR
	N/1wc3fUAzMC0poy9YazfomKQ5rqTtEFkT64vwmvy2LTUa/6kA/X4DM36/zIfYTwRJhWihwCDau
	aP90m5wrhiOsSiFS8XDQWFC4Ymlibsy0CSb9LQJ5P25K5DvADVW6A4rXDkQJwOO8GL3L+HarCc3
	eOBt22rdfBznHMEaYMZdkeQzBDc8s5OFSWNtDE2lyCv1wvv9FzKoOM7FYXOBGs8klJP4/vLe0JB
	HXjv7caQYHU3fqrryPu8+epiv0mJe4S9mzufFe07uQGQBSP3zCJe9Pw7rpBLxZJJQW5HZk2t+7L
	4BBIw=
X-Received: by 2002:a05:6122:c215:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-57559508f4dmr2249171e0c.1.1778229902544;
        Fri, 08 May 2026 01:45:02 -0700 (PDT)
X-Received: by 2002:a05:6122:c215:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-57559508f4dmr2249161e0c.1.1778229902098;
        Fri, 08 May 2026 01:45:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcaf9af3f56sm35638066b.32.2026.05.08.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:45:01 -0700 (PDT)
Message-ID: <936b6835-342b-4693-b276-2c09e259defc@oss.qualcomm.com>
Date: Fri, 8 May 2026 10:44:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Switch SCMI perf protocol to
 use power-domain-cells
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4OCBTYWx0ZWRfX8b6/+XJGOUnG
 8labIRhh7Fel8JllssrQWJ4v+krRUej6KLZuyKROPofJ9RJmEQfwTFk+HesWq6lyIHRmdzC1NpE
 n3zT4OK1BKZVqYWWgMN5DZzL8LpYIanVArHgvs3imQ9lsvy+Cxfv4csKGdipghWYmZo5lsQDM4v
 wNGbak8DOXErO6YzvFQf4ElOD6uxCyYgCN0Z0eOCEdv3EiLlk7y7/ezk33vIaNf6h7O/VsARUCZ
 1/p52iuC6FSyKLbNErJwsdqU2vYq/Zo0DFgUCRZK4yfDqUFLh4RY13nMbD9fujzbhWpeZx17Mcu
 DA/0qC0ouVW+QkhL9IVbFXtTmkb8zFMOx9mp6/F62JSUCqha04NIkO4VxCs/3GAeLXeXzQp/WGm
 HSyexjb27PwChiJ8CaV57HZY0k3SA56k6TfEHfwwEiw+coEhgaGYTGRvvh0IN27n1o+CUgpQHal
 lLnBq7dUCeJ+jlaX1qQ==
X-Proofpoint-ORIG-GUID: kFvcosr7VspzsYhdo0zO06Ap2VLJTwRa
X-Proofpoint-GUID: kFvcosr7VspzsYhdo0zO06Ap2VLJTwRa
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fda28f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fqTeQLrJ5r4hnVr44MMA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080088

On 5/8/26 10:27 AM, Mukesh Ojha wrote:
> The SCMI protocol@13 (Performance Domain Management) node was using
> performance/power domain, not a clock. This was using the older
> mechanism for passing the SCMI performance domain index to
> scmi-cpufreq, which predates the #power-domain-cells support added
> in commit 92b2028b00ff ("cpufreq: scmi: Add support to parse
> domain-id using #power-domain-cells").
> 
> Switch to #power-domain-cells to match all other Qualcomm platforms
> (sm8750, glymur, hamoa) and align with the semantically correct
> representation.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
