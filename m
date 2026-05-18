Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3AE31F9B8
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099068; cv=none; b=YoZJPyQmyV8NV+onGZDQuTf06IVLJRfiU5nYw8FRFr9r0iwIjjKbZ9ZrOzj4k3ONWi06QJpxtbsI+6W8+LKw8Fw9aRBIRn4E9cLK4J1bmF5Y0ze32POkwSNY3H7R1+sMGI6TyPPJZaNYeods6tVocblXjUjtddp1oj7rFAXmgds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099068; c=relaxed/simple;
	bh=vOpK0d37n7uwbArZm9MneJF87h36WMMxKwaiCUgcXFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M7aefG1k25ZJQlGR3XLI/BqlSyX9dhdewhWB1MTHFlPFKuw9WUH7+03nCOeUXP+pvOyKA8qkmF4SXQ9PdI/LznlUoHkxtkY4ifmvrSnh5WEYMbDEG1CPm1pCZS63eXvKV+qzdJlH4fGejZYfxvj/btLBkscmRuYiD3fqXzY/Rco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoBhrUBo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGoJBMbt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoBhrUBo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGoJBMbt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I8VDCf4083987
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+1Lf9eV4YZqdx7I47XP78GSMimosryCKYAL1WX0Oy0=; b=UoBhrUBowGkTEG1r
	C1VBYYcCiGYIy962I4qBvYqv5BKSBIPNpbgrS0w07LNnyvSe3/xraOl2vlehAuiR
	9fO61lp1ljU7aRIAil4Bm1UvMXw0cXSF9TfBIuyJazlw5ZhZBRFNytINTW16lEaC
	k24WPT8uUlizJn8oivNdeCBU7D5fZTWlNmfV3a79cQOAog+e62DfS7pvVahrPi+H
	dhbVtE1scFxE8jVDJy9IqJJDCh5a9yuWzMLR24clRRbltopUhSOkBhkdW5kizV2T
	LQ66htFJ6oP1JaHCmqvedJo2uhfvfdKyEEjGkwKsZX9eiPzeFyS9CfeSlz2aQgD4
	1JD3Ww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qdxk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:11:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d840206c3so8126371cf.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779099064; x=1779703864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+1Lf9eV4YZqdx7I47XP78GSMimosryCKYAL1WX0Oy0=;
        b=DGoJBMbtvvgQNgA9hOOPj1tXwq72RCUHpjmNiHM56nq0Lh01xNccB8j7sELcN/i+Yb
         dFbxcdYpG/a2O8ogagaCNXZTrLvOyvWknJo4SigMPW9NS3kJ8tjHHq5qdVvpAbTanpez
         C5pSurwpqg+bVMKqhT7BdQrf4VloCtrKfJEzdrhbVm6eLVYd9kcVi2wPYnmoxXIqeusY
         LUoIONKKq9bL9Fsk9aHFax0bY3cKNVJCfI1EGte1SYfOwbRJgVgEKZ28YCGBebZGWqeF
         SzvlwiA2BryGHScL1jIcChnYokzCosKm4Gm9DU9pqXaqlxswrDgyDXwRfllbjehuMdO+
         Wgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099064; x=1779703864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+1Lf9eV4YZqdx7I47XP78GSMimosryCKYAL1WX0Oy0=;
        b=dKVNL8UPV53AkAmj0QAik8LDysjY8LZmxRyH0l3Bzj8BK/PpXXxOz/ea6C0tHOG+mT
         8W3Ig8z6r0j7Nr+jbherYEbr+zRhNNV56j+ELob14KMxrE98LakWhnRtEJJYnIf/FAVa
         BoxSyrt7+NLZDhX1/tBOripabxJwMzOrBP7cdTBcfVpBdxI9rAQUwKFzyJ1IDSJls+Ig
         dGmqrctsqV8CpzYnDgDhvgKWJBN3o1MOVx+3uv0FMLiQ84rBiYT/uA4YbvL9XvDTOQtH
         mXJRPWfpkARAz3nP0dMSxeN8ndUVAC+sCUuSm+Yv1gggduAwwHAjdJJqMZiVH7PGtrmW
         kf8A==
X-Forwarded-Encrypted: i=1; AFNElJ/SGp8WeZv/KuJojufNjL0z3mpewd32WkKjjxHY4yNbPaJ+WqdeVBCDDwr/xZnk1nlxNQCYEPfaEEWi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk5LSny+yv4olN7YEzqU6YfUms9+FP95dl6EbvPf2v4eAqg6iG
	OF1VZ3hJN0qIOJHf3qTj7ZQx8liHoTqj07iUXcIaxFN++VvXqefK9iQQkbcccKWB4Nbf0N+CkP5
	IdC8Y/S3Xim7Nb/4i/CgDpYhx0cPR2rgkS7jJhimcL461gpfTV4ApZyR9K/lM2CCp
X-Gm-Gg: Acq92OGYTDWo7kw7POy3dSeURa+VOQtF+OTtPn5UhoJhmETbNMkiPjsFm/Ew1KYYM5D
	aIOLH27JW31DSCvJ36DRh46/PEcbvvYshpVLjTRFxnoaayyw3zyauggvU7cP/znFI+lnOejiz5C
	NaM7Vshv20HVfvH/SdpC4dK3XEdnIJyPSpXDvH//OBQzg0UEzp9LUHZrbkC+RQJf7uM5RbVuSza
	u/ihGcc9xzxnZGmwBsp1TRZ/Bba3p4metfZkixDcRLd3Jvp3FQED0G8z1YSVAloddxVyjxNAka2
	vBOFsE9iyV/uojdC9e8BgWfQ/ueI2bBTAKVNAcRDHXClN93m9eLZcG7GkP4BWle1inrflmxRzTO
	HLXd8Xx1G8j7EjipYCdmnWyniYbFx6ZaD316fh852xlxy2n8nBgGpZIsD8uM2su4QHDwpNbZbr4
	fyimI=
X-Received: by 2002:a05:622a:594:b0:50d:9138:3322 with SMTP id d75a77b69052e-5165a22d136mr145842721cf.7.1779099064221;
        Mon, 18 May 2026 03:11:04 -0700 (PDT)
X-Received: by 2002:a05:622a:594:b0:50d:9138:3322 with SMTP id d75a77b69052e-5165a22d136mr145842301cf.7.1779099063675;
        Mon, 18 May 2026 03:11:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm5085669a12.31.2026.05.18.03.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:11:02 -0700 (PDT)
Message-ID: <235b0c91-57b5-4c1b-839f-88cf9a11707d@oss.qualcomm.com>
Date: Mon, 18 May 2026 12:10:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix wrong interrupt number for
 i2c19
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E3xM8kn4n7-tXmE1UXPBuOHPtLdIcJy2
X-Proofpoint-GUID: E3xM8kn4n7-tXmE1UXPBuOHPtLdIcJy2
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0ae5b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YFrQUJdA0-VyeVoQsyUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5NyBTYWx0ZWRfX4lAn1tsReuXB
 YA/9bRSSC9yLBAMmcERdqGFmP8Y+YjFSZ4ioSyX69TiqXK4G855MKGMN81eqHUF7+Ygts0dMUvq
 89QGRMzqnH+RroZP9APeWJZ7zp/gSO5f65bqLrVXZz/Zi05+M6mwIr6hCbjO7l0LxtJ9sZSwju3
 uZ1k8vFYssoQ/KnMytus6uOVAQSAL4KK+k2zM7mq4jyl6gCWw7lzgXjURUhvGso3AqLqZpIzwSI
 SrBcEpVcDGZEb2ydYODK3hUyBOBT5wiUmT4XOBx3Yr+fzZAk4DeVivvzGfuR64Or6fFKpfyQW8X
 8S+SfZ1culAjq1Q/7ULp+lw/SWbbMHveLA2CZw1lPgTWYkeK+eZm3onN2hxSSRVEpwbkexrXDU7
 Ugn5lBXUpw+zeXY8JJMRp9z5unkQbpMBJ4Il5FMX1NHWrrD4EmdzKn0Uv98l269M3x7IH2Xtml7
 wCTTMOXoDBZTia7NYHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180097

On 5/18/26 11:52 AM, Gopikrishna Garmidi wrote:
> The i2c19 node at 0x88c000 uses GIC SPI 584, but that interrupt
> belongs to the neighboring i2c18/spi18 node at 0x888000. The correct
> interrupt for i2c19 is GIC SPI 585, as used by its sibling nodes
> spi19 and uart19 which share the same register base and clock.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
