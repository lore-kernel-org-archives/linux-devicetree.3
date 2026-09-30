Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465E49BD86
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769681; cv=none; b=mnqq/CPQ1F8rq4Pw6xO7jxc3tA0asQcFDwKqHdWhrOcMAGjCLpUvPQof9Y8AQnYT1h3IMfsaYxdBR+YovPxFdWMxPenhOWznLm2glK9UGNqwaW5CZF/s+pes0vFsu2KCUGA9Tio2sODjMHC95Hs9gcxqneE3O82yRrEJCT0z8NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769681; c=relaxed/simple;
	bh=GGmvXNw6P5Vlz93zn1jQ+ofKASXpmhMvNZCQ4FY+P9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+f4njs36ljeOp59irElMuyK0YuV8x0c8HSVl8r2xJV6cpvoC500cw88+sFao0EntONOVSrluYIGe1m8Cmu4DOtTfU7bvRnhfjnaxTni3SM9J+IGC+pWGRsaE5IOYHEfwnyUKriNg3IS6CajFuYXB8JpOWgh4fIzhgaTNfr4DyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uc9I/T1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TefvtZvP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uc9I/T1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TefvtZvP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7O9V2019450
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7JPuT9XGq59XZP4IbyCjIJ/+oIPYdDeXhA4oj1suAY=; b=Uc9I/T1ttwViemg+
	GM48PNLwkmNDpdIAzf9oOvxkziWSdhyISIeGinhvzE0gADf5G9ZA3ErAqJlVrEps
	smedO6i5YWyRhfxx5junwUALaNmNK3963RcH/CTVZHGqj9vN1syWkEz+WI+0OoUh
	WD9MT3CcpxObwAhCmsa+ItwfwC9mJT9fJTCMCC4EUH28DwRKJnbN7yCc+kBoRUqq
	o5s/ky6F8JWDMFVjlpMtCWxwAIxsvm4lFHee2NS2bNjaUBHotLZDNlbWp9Yp2FKo
	mj6GZGwLIr+tcJBbVKblLn8xVG9AM2Q6dOtiycgNstdnLCQw+LmBmEYZhQwMmJ/O
	othQdg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c15qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:01:19 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so110494e0c.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790769679; x=1791374479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7JPuT9XGq59XZP4IbyCjIJ/+oIPYdDeXhA4oj1suAY=;
        b=TefvtZvPkK/uEzZpfRDy+HYmOMFfclE3MQsp/MZLOsGSSrb234AcwBuCNc7D183LMB
         y0lVx3UOMbYFvEqsHjo0lVgCl29bNJ17Bxts/GVl+e0D/yAeMQJR6yFFH9wDqZyhhZww
         rcgiOWX0gwmnZ457dlpM/tuU9+wldhUraxwfryaNdQ1Vi3IZWJYHOh1MURdqJkmuN7An
         446Cv+qZxhRefapItk8jQGUE7bGNxg5K8S5WgyYut5eU8sYh7l9fENhGAKeSFlK/ytp1
         h8Tl2W+xjmUjRd6/vxruyWUfSxwaOY82RLX6FK1LTKsyhE0M/r1P6bujoBMlmLLi5r9z
         NuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769679; x=1791374479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7JPuT9XGq59XZP4IbyCjIJ/+oIPYdDeXhA4oj1suAY=;
        b=J9NECJwpbsGfuv4HvQ4GpJzWlj6McBOUTUVjaS1VwXIe7fDuz2JVseBHnAzG3oQv+8
         DzTGb9xB20NaXSnW/wFvsBoeC6XZaKqHYVO2YxENSAX7bXdkNUBvm/pRQkkC5DoQfvTa
         H3DTv5QaPyRN0td+kGt+nhCnNQITB7MKOVjBjFCl/ftvIL/059B9qANnmMKoMEwk9cVJ
         ApBXkkOFIKBaqeYkY4TdJnfV/wx34LACi0BnT59NKWE2EpUMbPRkc55OSYBW9Fx+CELc
         vhztTyo2nAO68swUSTxLF/TEBCmsbgKfqgV0SD15Tc2w7zicsLwvbCYr9GRx0Z1YdKjJ
         RSrw==
X-Forwarded-Encrypted: i=1; AKwUvBzRsENI8vL16mCk36wEFhNczYWxHnqaxGUIJmCr8L0xSXJkrEAzzbsQ9W7k/KiDBYqA5nFan82oemj4@vger.kernel.org
X-Gm-Message-State: AFq9FYJw0N5Uw4hk2Y12Q2J7oHThnM2JONKcjGEEiEMQEW+je/N5GAjD
	yA5KGFc5Txa1BEdT6K5S2RSdc/FyJsmFkTS0Ih8GWED+LSkar5OWAUhJVLplnv2BaGkrG4Uzmxp
	ZrmvFOKZAXK5WwhJGb9/+en6NmnU4gHHOl4Sy0EOshMr2A0z5D5k7VMCqSg6AjcV2
X-Gm-Gg: AYBFou2z46m1gpD9UdgYW7V2Mc8eD8GGktctmsieGpqeeuWrCGrrvshYJHPZKAe6MfD
	8DttsgDl9/txQimrwV38VIKl062ojAh1KdeOTlWYzO0BXlLp/cCAqhWC01jebICxWPmhzlnm3G9
	UjGXpOgMS9NjHSDwDuN4LvZ4cC5eo9+vGju79OjvRgr67TYdraPlgbgerXMZXKz1gHltwMAfB6o
	U//nvp75U3KGCJcVkaiCa0FTuwq8UAY9fCnN3LX7F4vGhS0Ayu/Xx2au1Is981ZQuk2UxIUIURR
	2/7JE6cU0uuJjx/CAu1+QGR2ZufACv0KcI8QZB/uu1aRexmyrhG8o0eABdPFu3NZkKYozBG452o
	9zB3d0YCUpk5i35644modVw==
X-Received: by 2002:ac5:c00c:0:20b0:5d4:41cb:8936 with SMTP id 71dfb90a1353d-5d67c6d5db3mr137627e0c.4.1790769678632;
        Wed, 30 Sep 2026 05:01:18 -0700 (PDT)
X-Received: by 2002:ac5:c00c:0:20b0:5d4:41cb:8936 with SMTP id 71dfb90a1353d-5d67c6d5db3mr137614e0c.4.1790769678156;
        Wed, 30 Sep 2026 05:01:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f4368asm53713566b.16.2026.09.30.05.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:01:17 -0700 (PDT)
Message-ID: <39902ca0-a7a4-480f-8e4e-40713b111637@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 14:01:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Add watchdog node
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
 <20260929-sm8750-watchdog-v1-2-ea06d5dc7e54@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-sm8750-watchdog-v1-2-ea06d5dc7e54@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXypNoIp9muD7P
 sOUh87VoiufnfMYwkU6VLSskEAA9FXiU05j218FkhVg4zPMzeRMYpp2gIIWYNgrd4Z6Db5ytm+n
 ZsDarLHWN2LNwRpjKa7UDXpH1hrArNM=
X-Proofpoint-ORIG-GUID: S01mmdvuj07dQG_10FSylIkT63fRjlBa
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abcfa0f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NVK-j4C6oOT1ijtQxEUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: S01mmdvuj07dQG_10FSylIkT63fRjlBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXyOwhJl6Ev3NX
 RpTqKUYp6Fr2D8URQvuOA+jryM1lz9AwOt3Q8tzSyJxFv12MevNcHGMyueWYg27eUKagjdQBWHN
 k+1xupxMRtLjsISYiugHsdOprkh1sq6+fh2tgMtV/nt3zh7gIOOtPkhsaPvsWU/rYomW6oR8eka
 69EaYm+CRWS+xg1oaJBKUr9hdC9mvZYWlXXhZsQ9qnMFn49Zlxi1LbA3FtL0S8P97U5XhUawvNL
 W1+FqZqPnmMbfAT0xc6b8UzTULbu70nOwz3SbM/dThK7xe/IosLY1Tbo7kC32C6YDehqYTxoMIx
 6r2xlVHrmJ/U5lDcNiTWBGgLdKHwHhsb/qTUT42XnpDouvalGVEg13W0wQUhp/wJQAoM076l74X
 OJnb1B5waDFMKG+6U7y5S2NKVlxxDPWJSl5qJhYn0dUTjfDgbhpdRxTw7uD5N5RG0dH/QTbyYoG
 xWgaqCkxf98eap8bNMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047

On 9/29/26 12:31 PM, Komal Bajaj wrote:
> Add a node for the watchdog on the SM8750 SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
