Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27113446B0
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840190; cv=none; b=Lzk2S7qGOdDu3iWGKavwDq/5LLzzQRUGhCYDUiULGV2dZn3pRGefzUcEjvmmgp9fYQB4USQkIOna+sMfgEbfwYXKy2VGM2daxtfqveZAsH0YmI5uqj1nhQqYWmIDgnxrxaqeu6l997ECqCgnPLlTN06krYC38jAkuHDCqnEuVfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840190; c=relaxed/simple;
	bh=5RNLJN8AJzw6fjVfWgwivKLRztqBGW/eZA9V93wHR3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4PBpwjCUHZvLQDUjI7LDmLXogE0C41bUa0HwdJbjS8v/o081aSAA92Ac1AVhrSfWXRsrBVsDkgWv6c114qiVIrvrHCm/AFRYmfDuM/QCVtzkZb0taexksGtwpCpQlnM6kt9NXXkuR4sruggPKgSNWA/jDZmUS7WGl3C5qqLDpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cthiAe9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6uanPE7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cthiAe9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6uanPE7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5TMJO3200288
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TiXhLV4sh1qI46Qb5IcN4GJDJ3oGJtOcbBibb9xI8c=; b=cthiAe9Hc3MuezbM
	bMIx762YbUKazFo0bRNHi6I6NeSASHsLqced0RpNxre2eqACHlTFUGUplrXDX4AT
	yA2UR5fUTJV+Lty+/nuKqEumJQ0iHyiERlDlqWu3/ktDAZfLDrwyTF5ZJMJR6VDt
	na89+kK94py/ncnUsREcYp1FT2ufe7Pj2j9qpVbVyf8S2OteWRY3SExGFYk0sTyp
	hLi9iYdaeXGyK90oN1e+o3BHKAUyJ1SQlTuOMXBVUGxCF962qbladMJEyLA1spLW
	0XlJPHQ0gZzsxJ5OrcImgTfEIGwphVsciGNbIMVY7/1SLJLm7kYxHWEiwXr4x0+x
	B0S6vA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtrs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:16:28 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9568c79b893so392680241.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840187; x=1779444987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0TiXhLV4sh1qI46Qb5IcN4GJDJ3oGJtOcbBibb9xI8c=;
        b=J6uanPE7kyPzE7FSAPSDm0ySZ4rTIV8K7iS1sIwO8PMy/lYMebId2OAjlPfLxIkgBB
         U9uZnkSJlMU3A0k2/tsHaILXGX3mhCXVFyDwTIgD/LeA+MHsY7KZwgJiTSsSG5sPnKFC
         7EP2NUmhcGeALbdGGDrOFnMWXjkyGaeMDwFrgZB3c5IfcmJy5uwTapqABjZYzSHhpx4k
         dl4R/PJa5hcbpFnIsE129eidnlUa+ZbBcsgnKw0heRUHlnmEFO2uhY4biazcUTdsCgpw
         hY/D6mqTlEkwglpOfdRJcYtw7JOGWbGf99grfjZmGdIcH5ZvlfpBYnnjSZCyAK4WeF+e
         Qvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840187; x=1779444987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TiXhLV4sh1qI46Qb5IcN4GJDJ3oGJtOcbBibb9xI8c=;
        b=ciThD0LwBPcYOvQA+iqIHUzliMEaD07bAkCIeJQ8dohpnyIPO8SpJbXeLF45vxJ6NL
         ZHA2u2phGYJ2YbpKmeKFqIqcfJON0gYYApqeO1mDaFKUJZkjSKxbs3dohV0fkXvjLgoz
         Ol8nxUfaOFz++chx1DIDon39ENwa2RuTBEESAkTm+vOx6oy7052Kouw0iSbxvqgIfVaZ
         lTlQF4QoQ/lh2GMBvuAu23NsJRM9DIpchnVhi178y1blWoGpx7IQm6fDfwXLLLw1hbM3
         9or8nKsF6GHLU3aQY4QLO3DBh7QiiA6xR7Edt5XFxEBkJ4kdls8VAbu4eUqe3+ICdSjT
         J0MQ==
X-Forwarded-Encrypted: i=1; AFNElJ8u6rScRXvCpzzE9+pujI6bYarhhbOQgOpj9H34CyzO0Hx4B/6SbKy6JBJhgdSTWwyXtwVFdr4u+4p+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk7C4wFnUM5xRkQe+mpBcGhHLizO81Qgdnu/iQTc3yihrE3FY7
	TLp87HipEWnYpqf/mA9wM2BF6b2dO8VUKUboUxutBf3DqXojqOc78125NbrjzyLsz3dRCypCB9N
	KxFQPw76xDm+piqINw6qNh8rSex3EN38N23ioW/1kv7pbHIPHh4ZP2UhDxltQW47X
X-Gm-Gg: Acq92OE5AI5z/OYabsqMHCBY9y4BuEfoQNfEEr8LMdPlQqRS4IbJnI3mIL3dbhEKCdo
	in09eeB+hdIiWm3BADW+2oSStU5bcxBk7H+ifSxxlU38VAZBhVOyYFSsqBJGHO5A4yfM1u4H7PP
	6PyHeJjI32gTpect36Z/aW65kxYyO9BkAonBmdNCLjuH462nXBI9Xg6E7DNwC4TIdWumm/jT63U
	+BZEoAuy/lA1VITg+XB9xzuoiYSEvamFiUZ0hNuhICVWBstdh5XWPOTaw5QZYajf6lG86tvBm2/
	dvHHaYONiLo5DQXXpi1hZHueWlmfPv/EDcf7yb5I4tXnQPGwE+baamsAG4rFYpuwa9cKObd3q5Q
	TmamHGbxWp+h62y9TU8D4cmYY10IB2z0hy188I6H83PL2UNAIYECng6sASchM3d9i6ZZGKHOPBI
	3kGqUtKjN8Pu6Vfg==
X-Received: by 2002:a67:ef86:0:b0:602:b87a:3524 with SMTP id ada2fe7eead31-63a3ffa8809mr406961137.8.1778840187286;
        Fri, 15 May 2026 03:16:27 -0700 (PDT)
X-Received: by 2002:a67:ef86:0:b0:602:b87a:3524 with SMTP id ada2fe7eead31-63a3ffa8809mr406951137.8.1778840186863;
        Fri, 15 May 2026 03:16:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ebfd40sm203360666b.61.2026.05.15.03.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:16:26 -0700 (PDT)
Message-ID: <39b2311b-b3e3-42a7-a97c-fa190c9dabfb@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:16:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add reg and clocks for
 QoS configuration
To: Xilin Wu <sophon@radxa.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
 <20260507-sc8280xp-qos-v1-3-15135858cd98@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-qos-v1-3-15135858cd98@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06f27c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=7vROA1eCcShV3ZceFmgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: I7IqvAPEhkwaEtCu4udrjdJaTdPEFHzn
X-Proofpoint-ORIG-GUID: I7IqvAPEhkwaEtCu4udrjdJaTdPEFHzn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwMyBTYWx0ZWRfX7xo7A3UkmwJl
 Xxc3Q5OmI9i8WcNMcmUrEKoQrRXFNKMSeaXPGQs8YpTHM583mjkO1KRAhb1EPEi9wJUScsBXN8Q
 6R+V5m+16eNMar1AoT1/CCbk7FQAyAWwAPzYqhgcaYqaTm99EXrUMDDculXd53W/VL5QzbCphZM
 tBmxP88L0cJfZepCJ7u611/xBLypkT/BaK/CaHWYKyMN2E6HlidS3u6N0KaM3/sDKO0yxEtTuhB
 njaNdqPWN4yKxL3+qihKr4LjkXE7OroA10YVO7VQRUUU6qivZhf5amAPm63dSvFQsQEpJ4pMGqe
 GuYP2EVo+kfGlPITVPu4bf/HbOhrTzOChULrnmFMu39hnu/+I687gxCFdkRVr5rsujINeiZiW/J
 cF9NZEgPfliazFsShE5J88msxDTTHRDwEMWN7ictdHe7/jHLdWaSJZIAxFO7L/lkYVuyipzj58+
 0CEHAbXHSE8CUKPQ7AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150103

On 5/7/26 4:25 PM, Xilin Wu wrote:
> Add register ranges for the SC8280XP interconnect providers so the driver
> can program the NoC QoS registers.
> 
> Move the real NoC providers under soc@0, keep clk_virt and mc_virt as
> virtual top-level providers, and add the clocks required for QoS
> programming on aggre1_noc and aggre2_noc.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

This looks good to me

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

+Odelu please check if the clocks are correct

Konrad
