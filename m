Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522A37BE7B
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776253754; cv=none; b=FD+vjkZDBcx2ruzqyPNi5GImkIjb7GrSxpnBk2kbP+g8V4epDbAKukYWXUD7BHn5ULVNYYgY52t3e0z3wfzItz0aPgmmfeWFJffGj/YrMvYfMvJHvdlXa01xv4wlyT4+hiKy1oCNK3bX79kAPIFIXKjX4dLSsWnxmvGlLH5yies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776253754; c=relaxed/simple;
	bh=BeVIX3+yXifAg92JEMF8fUzLL4UnEBRx9jVpPwh7GHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lVp8nUtOMagtMJiD6jTeDXzwPwthUDacYmSqlQTWsNbekt/6uaadqsBY8CVfAI7iQ4/LCnv6fBLKKoX1hMDKRB/SiIEHrc2/xNLi2n+XXomWZaqz+M+vWxkMcZVVMhmH5bUhMKCNcRFssLRfRAMM0y8XiWNq87Le/oVSPiGaiK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExWWm9lP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6cVaBLc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExWWm9lP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6cVaBLc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F921DI731110
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRcoJaQFefkka3dgm84pE6p9Dhtaa4IjHa4M9jG6T0w=; b=ExWWm9lPlPQ/JcuW
	93DIZScSvgW45NLibsE/zelVjAxyPDiSWQzUqzK2pxSGN21tElvrsGfklWWw2l/d
	aePGDoLVsXRoEze9WqnaL6Npb2S4lOeGifV/B8igR70NISQrbepafgo5zozGhhtn
	ApWBSLh2Ka9Fj10sKEG6ZYPDK26iu+j1iV+jmqH9Zj76HeVQq6KI0nPdVrPepDfk
	0VoihgM+4h5JplA+Z580TeFYKjcRIPnyaIVoCkSxJ6C5PLrmWu4TakaqS2dILdpj
	KJo8n2g1ubuBOCXM60Z3QrFepB+JeQa9zHsPVoLQaeIX7J/oxhFJumGogDrVPemk
	NXHfXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruubksa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 11:49:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50dec198720so11707911cf.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776253747; x=1776858547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRcoJaQFefkka3dgm84pE6p9Dhtaa4IjHa4M9jG6T0w=;
        b=F6cVaBLckDn7Eo1URxAb3rHr1ZYWghCJAfL9QAWe6yQ0XE6+Ysfmq6xA3Iqlqkfuyk
         KkhUva5yEMA0L6Kkaw4ydlXUzrsjthX3UZRCMpuGnrzHCkEA98Hl+8rl9iwvWE7Wtcai
         FVD1bREZSJGK/Xg5KfkVd4MAIcm2+3sf5ohIH0UQ5ymIKViODr1K3gCoEpviiMyFz/Pf
         y6XSUyKYT8tnhbEkn/O0111rnYLzqQYYNAAeCPnrf8Sv8QoSiYRvbIL+oaRFVjHWW+GH
         o8E1ipTNrSVdBTkmGgKmDYH54f/CwkZC6cM8v5VvynhmioVyNrAUJGwx0LLNbtypzxFD
         kVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776253747; x=1776858547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRcoJaQFefkka3dgm84pE6p9Dhtaa4IjHa4M9jG6T0w=;
        b=TmSAhaRH8EJ5gjXr/EbI2aSNuEozCklOuGp6fzinG1W/wO8wSi0vDRLFYFc0jJkiii
         o/b15TZFJxJU+dZLHKUPjRcMLlVf7RgIUZ9gnelTWGf1Jd0RUHbDXOXz0/NsA5p9P0/c
         4fCrGshMAj88FZnQH+wiHjYevZ+u/PKiquxJo1tSqEvBtn9kj/dV6HiuHtzwoCCaCJaw
         4j6CPt0hyykzMf2FHEOGTmmHGpXr/SEvPBBTBa1anLUIaKAS7gh7qvrq8TrMbjy0ptZJ
         9nCoqbq+MBe9/7e5CWmqGV5eB78dN/rc+/janR2NBrQupqvYE0gxfgPFeMbyIAps0xS1
         vzJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8q8zWG5liF1FVaN2RQfY108HOo+nOe3wFi7tINW9cvDJpiYivfHmQRkrd4yvEqQxzQakzRgl2uMBGm@vger.kernel.org
X-Gm-Message-State: AOJu0Yws3pOwYt4hZlzAs4Wdof7c9Sdi8ifHiTEDeFsEQ02/QLe0Ichd
	dONleO13WWNoeyJRkkO4jxPi0RpSI/+edN+eEDhOS61TEwLkacaLky4iiu5TENCmFpmsG4l3Drq
	xZPx+1JmYqeRsCjNz5j2BQQHrtDBPYf5GjoV3Hdt6895RztOOfx3qzNIwVyx7zmtb
X-Gm-Gg: AeBDietqg9MAnF2rosYq8osVh6NGs0HuouaYRHr3pvHJOfncCkPdDI07j4zqAl4FDVh
	NIYq86TR3UwpOGA3yyU/G9I9GYAytsce6kWcGXQ2PCvXZ1EFdaohLSgj2JHChMkcy8ELPtyPtPR
	4SOSwbfSiFpDiMD9ZjYMiIPXBoL9+Qs26MlfLeVEC7NpauVYBeEEHKcxiT8Rlx0QkZpkZZsAdyg
	br9wwnuCObdRsbQV1uIV1YwKcIbsx4fbPxAGlUQ0/WB14NH2okhvYcFwk4tNU1xRQxXk5E8R27L
	k3zZzHRyilPasRfNUDxhqWbjwt78z3lQRj8l5EvEwzutWieQqSwwOoyrv7IjGl3cKAXmrGYDHg9
	rJylgsnepBa+dJ7q8M8HsX5qJkZT9WO6BGHS9ypK9NOoaVUHyv5GVpMA2R0L0hbqUuZbxTm+8jm
	p+XbwHf/J2ZffQaw==
X-Received: by 2002:a05:6214:d6d:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8ae6a8ff4dfmr26026996d6.3.1776253746543;
        Wed, 15 Apr 2026 04:49:06 -0700 (PDT)
X-Received: by 2002:a05:6214:d6d:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8ae6a8ff4dfmr26026566d6.3.1776253745984;
        Wed, 15 Apr 2026 04:49:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba170629d7bsm50353666b.0.2026.04.15.04.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 04:49:04 -0700 (PDT)
Message-ID: <de0b1b6d-caed-430d-b152-0342ae4388c6@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 13:49:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Introduce IPQ9650 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pttk4XooukmBKQa7vP0Slje43lHHTQef
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df7b33 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=okxuOKQQA2PoeQeDH9cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwOSBTYWx0ZWRfX9W9XJJMGUHUY
 W7iKuY/EPJWCxeqG59xPuV8y+zbWzfcEAfX4z8o3qul9l6Brt2hWTfNm/+u3CaPeOvt2Glrcxcf
 NGSagC41Y4RQtRISgnxxzF6vQ1xXVIZIJWobDW0mRctmgU3Eg5gh9XYxloSJHeLZF9/3ydE2Gt5
 5Nq+OUmhK83MfYNR7xJ7aP1pv3f8R+awQDteeNRph4ZXMHaQQwQg76iHG0CRX798CoW/T4hHp06
 fqLbKYz+6rV3fsAiqXZYw3wnXTaYmtZRUfjc0ZXYnN6Dml8l24ZFM/rLKxOU/6LSaGl1yE2A8lJ
 8PvsyhoXecXlxHrYKyQRZXzYnDifJg63sMnd0csy4o29NKdoHjcSOfSaG6cpG5ZEeg4bBCb5MWO
 AGHwizR5+jJVG9nFM1HwSr1RSoDuKkYfhbXJR/krYMMHXU1i7+H0wL8xRLHK/sS+8vTYdEzj6S4
 uwD4q84d/pYgRmJhdIA==
X-Proofpoint-GUID: pttk4XooukmBKQa7vP0Slje43lHHTQef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150109

On 4/15/26 1:29 PM, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ9650 comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
