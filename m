Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028204;
	b=sbYSmqJTSIg/h5GmPnIOyLDrpvIXWFCTQI6nvwMx6dPpMgBFwInyd6+Q2BzdaiLB13yh
	 VghczOIolLRn+l70pysqnFYaP5Xc+mDsN8LsX2TeYIwNcLfwHh6+fNWQqPLbfe//a6cCO
	 gPR+YLG8WfoQLiBM57vzAGXEfS/bezmXlWW4pHRWHByq69mEyhWvdoPJaONtNQmVvYYIc
	 SPJ7jFLpS5AYDP2SSnR/dv15DovR/m2JpZiIhffUVpsH6IXbGgdNsr7ihZMPzXzT6nnYV
	 Pstfx6XAZTKjOv5n51OfatUamzUXNDmKujHTbdDbS4qpVk3daLQ6Xojp6tWy0XrXc/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=;
	b=X+FYjq1eJdh4taVFwnzd0iEq7w1RuTgJWf+/7/YpEMLxB1Bi87Xgdo5NO77mjePhcdFG
	 +B1kPkUkeLqTcRH0B/2iBjNR8qjVD23y2pRBLjjs8k54RCEdQ2gG6wz+L+A5YuNhMoU28
	 HtPR4DDKvFDPYYFrO6ES/rKfRo2fxkTN8TqyPoA1gS+g9rRvoxZhah4Mq/DLE0C+vz4TQ
	 Ny7lt4GupH20PU3vPXMXd8Ydd6ktDYDrOl6Ua1FA76MyHY5WAw/Vjkd0bsHqPnfoHZag5
	 pXomBHQmcYTMjekqbDPwbSTqDVsuyycNHgUWYWgjDvvlkEs4hdoCD+8WGfzdQv98Gug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8Yh7B4h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWAx7qxi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA0606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11FA0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8Yh7B4h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWAx7qxi
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvvnZ3567417
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=; b=X8Yh7B4hAj0G/9xe
	ICC4+VLiYMkTqBhIkJgiW9x2LBO4LhbYRQlByj9Vic+fdyMqxWn+RvLBQGPiJKOz
	/IJoivyTBEYmqF7B1DmHSA+r6hg3E0XZrL/+23i2OsAAjF+/e6DoVLhdKHSLcMBJ
	Wm6/xIkhUir1rcNpys8TTtrsiRBxP6VjXDHcaax3JKpFuJnuxpoPEmnWKb6tjLey
	8YTWnhbdHQdTSHkxAyV6BvuCQ1myxXsMb1uImUa/8NrAscuaeYL14xZuPXoSYW/k
	kzRez+zerfHavCv1F3JCOGGOoaosES4BOUu3xkeHwvzxxhB+gWFpGyaPCNN4vIlS
	B3LNoA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y12sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:23:22 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98c69820282so37448241.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028202; x=1793633002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=;
        b=CWAx7qxi96ibgnYmEOPfuJRnb9zoK14LGae6i8hCzDNhCHd2l7YEsJvT12NLQG8oY5
         UGJsJP/+U2K5SMrMjLI1SoYBVw+g33tc1j83wM6Sa7OwbfbLTlwFWXoiY6EnmS1YgedR
         s5HIt9W+2vYs4KTow19BQypt9slUZrQIyjcSZy2UgQUF6cxsUnk86OMN9avtPL6aeYND
         u267oOxO/OpcSgbrPXi586G8RY3+QmXT1bEWyi5yCMO5MrnOUcssr0D+vY86BfT5bwbp
         Rn9gHNmIjCrrtkxVmmXPr+ge/it7M7kJjnmSNEYhBb+eIEZmjz5fuBAfUYF9I2NlSJtD
         L6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028202; x=1793633002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HZo34bqBzVSqU2n3F9/3lZgFEhwjmaDcQkxl0p8mbg=;
        b=z2bnsc1Tv8Km7cyq8b4PPCu2QzLOy3zLCEuN92Md7H0ziCV938ZjvJYb8or8wHN7Ll
         ORB2MNM0LaY8Z+GdM5yuyGv5KwFS4V1q3HYojh6hLQ1KW6Rib8pj1NmTAKES2CsVXXxT
         t7fiPHrY0pLF8dGlxF/FpumDocLIvv9DnOnc0AxQ2RvK5n7HiOFmTRd7K+holmh9SCya
         rfjJCZvFikvc3Ru/GHq5rvGM3JWasPVeCTJ5PuxEgN528W52Uap8OguWCNlxi1BmZQyK
         A0i+aQmfPW+6NE5VFAf33pMfYDOupeAtRqxr413CkQKLmox+VkNQNIsT7tMqBILp/rOG
         VpGA==
X-Forwarded-Encrypted: i=1; AKwUvBybZNu/HJkucgOmofhCwkkliBV+i1wdP1C9IfHuxgnbAWmIXNY6X8u2Nem1yjNpg7eMmXnVKOV+Kswa@vger.kernel.org
X-Gm-Message-State: AFq9FYKf4ugxgIvOKNF02YH11dhUrmDHaUTp4W9rMep3GReBvTGqi8yX
	4qgKJZN/FscrAKHFYplCJKn1OdR4oB+adesnttcwey610UkGSwLG4sgEL9bSFW2vu+EPIex9joF
	I0KOpsXuaxUgNLc4nUi5rdjbo3NTS4GbaNS+GE+AKcM+fjUornHkD6tODJbMlzQnX
X-Gm-Gg: AYBFou0CE1FopWmuigTBNEH/Mmq3spIQ34cVjeBXvbyEPba8FFEqN7jtgQ8aaAykb0k
	LlivhdzzCAOxC+nnw4TpT+wPldbHwHoIP6Xnl2HTdDJdRifwhiZ+roRPppXq/8Q2FxQljdY4stE
	aUEvmCH5DJFS2Wxi+o+W/z3iFMWn6ofrbPqoW1EoPmOXXEeLXrK3wnyOZgQZM6ld1ayCktRt3w2
	kFW494Q6Z+OKM3bflnyHBYtooKxa9Wjt+bq9OOqK/2QQgsSJmIRnJQOYueGDTW6rXxbvvP0LNat
	wyfufm0aHHumnP5w8vIRAg+qwpMv9H5bdvTy2+sWC+zdNAbsoVHzq3xLA7JmZ6FwzAwQIRmWaqa
	/ymIaV76XO/+Bxr/zEgXd+A==
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr2378623e0c.2.1793028202160;
        Mon, 26 Oct 2026 08:23:22 -0700 (PDT)
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr2378572e0c.2.1793028201524;
        Mon, 26 Oct 2026 08:23:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd64f8c4sm335085266b.47.2026.10.26.08.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:23:20 -0700 (PDT)
Message-ID: <a2477a12-6259-4e1e-ad4e-e2fe41aeae1f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:23:18 +0100
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
Subject: Re: [PATCH v11 1/2] arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2:
 Keep wlan_ce_mem and drop redundant wifi memory-region
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803121042.3313824-1-mukesh.ojha@oss.qualcomm.com>
 <20260803121042.3313824-2-mukesh.ojha@oss.qualcomm.com>
 <23370124-adb0-4b9f-a818-0a864a291099@oss.qualcomm.com>
 <20260920075457.ftpkl6bpuktom2be@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920075457.ftpkl6bpuktom2be@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX/f8yAAXv97IQ
 YUBZ131wZy7xdte4ZuGvQcpcOT2LjCiQlt7U7GahZhZFYNZUmx3L3Aa8dRrZ2Sgo2VgRB37pUbg
 3LqKaOS0mSnplJRfHVdD8KKotNoxGzs=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf706a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-OgLTNqWArPnvb7kmGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX8wXblBUvf+Mt
 oDruxI6p7cTn7o9v1VkONfKDSFB49mTPfosMMNBKG3rb2Niy8MqUhhQWgbpBWT1xcPugiFEHsWJ
 ytu9VGOafugbmqUBC3d+S9BzgJhf8DR+s8n9hhxxAcneEdSFI1tvPavF0XZcsybLJGX3zrPrvGj
 m/9aGQY1upuA+3xIMEcihtV7BhwXZHy3e1VGAizVvcFHnq5mBexiH/T65bbkXr/y/PWy1hXsXVF
 xRvKr8RDJ/EPJDHla+2yHAsV4m5wx1XMYvkvo9klO6JRd9IzjEL+Df1HMV4KkIXpQ+E1rdGaBZU
 L2lmvX9yQqkgybR4ZruIXHvJhY2tDqM4/fZlHPpubIgV2oxPU4S8MDsfFlww1eiQ4hrTJ64jeqW
 FGTfOOrK8f7UHmutbn6HZ8Xfm/607ISpX/7WXbVHtuOdhxkK5A11/CZWPXEhEr/4n32MeCvyA33
 Ko5SUa8uX2Tyu1sSaEw==
X-Proofpoint-GUID: IGoO2OjrN2gpx_gypnep95wB2Qmyu2EU
X-Proofpoint-ORIG-GUID: IGoO2OjrN2gpx_gypnep95wB2Qmyu2EU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260061

On 9/20/26 9:54 AM, Mukesh Ojha wrote:
> On Tue, Aug 25, 2026 at 11:32:49AM +0200, Konrad Dybcio wrote:
>> On 8/3/26 2:10 PM, Mukesh Ojha wrote:
>>> The reserved region wlan_ce_mem is device memory used by the WCN6750
>>> firmware. Deleting it in qcm6490-idp.dts and qcs6490-rb3gen2.dts is
>>> erroneous — the region must remain present regardless of whether the
>>> underlying OS uses it — so drop the /delete-node/ &wlan_ce_mem; from
>>> both board files.
>>
>> But it starts below 0x8000_0000 where RAM starts, so it shouldn't really
>> matter, no?
> 
> This region is used by the WLAN driver when Linux is at EL2, and similar to
> Kodiak Chrome, Kodiak IOT also needs to use it.

Right, it's a sneaky iommu_map

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
