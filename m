Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91623A3E74
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 09:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123311; cv=none; b=GPaqJDMjVJNly908Symq2V/ydNM4957o5qU25w7M4NcE6Xy3FKJ8669OAVfzjhwvcZssvzEbOxBhY6f7B4LDujnf5wigUVoQWGuJqYGP2iYSmyFA6ggNTev4KO6vQr1XbLwqAu1PJamaVIBUJWN+jysUezrSLygj4baAVrJQ2yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123311; c=relaxed/simple;
	bh=K0KkIFUCvFyXnZFYmaPL1OGI41UHrDSOQfmE1E7QERw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=eqoeaIUtdHAlWOdNr/xOby6cqATUEF2SCSw0puwewx9WTNeaTxL81yZvEuLb3vIGBO2afXgfwCXNTRO1dDcEfTgnv92t2Lz1pNkYLYHtHS/+nai/91OsZ03GcJsANy3L7HmWRts3Hf9dH/fnrsFSo7ap8B2BpMIVgEqiAqCinOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3RpWaCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDetAXS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3RpWaCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDetAXS8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328Runv352293
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 09:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0KkIFUCvFyXnZFYmaPL1OGI41UHrDSOQfmE1E7QERw=; b=L3RpWaCpIFI1+Q7P
	A5c6BiVoY6X7zZkryrcZspb7q1PKgDaoY4+bEyotxL7n4eEcMRrW+S27uMtpb+p1
	xfUuUFMQjdrmlmNxYXl/e+/m9q/uknVEmhYYgrLVd8KFwkQvfXBjH7MFf4gEJzwV
	PntSn97nvBQL7KHJKNF+8sEaWQgYUBRHZZ1ylMZmSebFexCHnm3pzE6mkBt6H76p
	mErhX9r+lnNYBxFPW7VfFpcBGVHodacGEo7KowXwD7VeySvwHn79r6IQa3y6LC4f
	JBz1f9mMK3NaSJvUJRO65xSRhZMOTPo7489goF3BkiH4C1eYcrpPdhbaBvLIRjGS
	XoETQA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myh8a9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 09:48:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7414516609so555732a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775123303; x=1775728103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K0KkIFUCvFyXnZFYmaPL1OGI41UHrDSOQfmE1E7QERw=;
        b=CDetAXS8jih2Lizx+BSC+ZAUbnSzUyfnm4fRGepLVmYItqECTNbq7f8uWYg4W0Ub7c
         G26+urLm4DQoIEbWp9SpJpPeARzm5PiJV86dC1MvGWwbtBwNwOXAJD41gRjhFIixCGPe
         wwhkyEQ1Pw4/a0lMWrFAgA8wKHCCw3hU5j7By7I7IReI2bRhINOKHKgmS1lNp+ukq7ji
         eSTuAXC4/OdYD4XptW/mcBBUbMujaXrLLt0vDieiK8ZnAH0kElIWq1p1mRgFqBG2ztkA
         aNM5T22F81Q0RkKamrF+IbXQQBQK51WZy1XBOM+utvOcGh6WphYr9pk2kg+J30mtzrMg
         x93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123303; x=1775728103;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0KkIFUCvFyXnZFYmaPL1OGI41UHrDSOQfmE1E7QERw=;
        b=Y47qtQZdOqpwbQZkMHGIUh3gVYsay9gUCk5oW3X8hFPfJD4bObd9qJLY1eJtRWy+0U
         glyVIBdzlAkowVQjbpGVHQIplIK8n3MkBJe35Mnlth68NdsALtJz3AURo2qMhQxjv+9B
         KuM8lNdER824tyauwvhakTohJoGlbA71n6GbVUzuji8j4tj+/sGpAI63BPy/TDlHSbkU
         5srFE46vIOISm5rhnHxmxR2Wv8h/AY8Ij4kKxqUCCQFbdYa1AUtTkVD+amCiWHTfYWK6
         L3wHcJAaGUGLxHd4Ic8eHH31o5EG3wBhjzYqbX+7j9fw2R3ieFbGFGxLnLe+dB86qbmz
         GjeA==
X-Forwarded-Encrypted: i=1; AJvYcCX/78D1V3s94AFpo+Wdmp4V65UXmMIIKG4RdVAP1XqMmudPySkLP/SgyNtcNCco4599ZTvFyFH7hujp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Q7bjaKJLtxHeX0KaIr2/e7BPwE4+RUgjZUTmaiKG42PEqnxD
	kX5nfrsS+2/wKpz8SaxnMJNmn3q7T24/9sTVfOjM6KrWfeCcH6UuvGwe7MK5WXhsDOKs12HcUDh
	NLLJNM4c6KKrYUeoqiIpY/9/AlZaJ/Z0rXB1QYAWk8X4r6vZcM+SkadMDURDdz07+
X-Gm-Gg: ATEYQzxDigt4ARtIArji7haiS9HeWCknZAmFEroy0GvGr0XoWW8HkbeWW6lKCBd4nUY
	ueXa30BvheNFaFoEf9RstZn44uiLwF5/ABAhr5ytF0Fhr+yQF1ozl39m19ikARYDYL5vTNQTVYu
	T96ZT3xaeJC9QG55WrFuWHUm+BONzPnpxEwCLbu7ysyLr+YU+EBbxnpTTP8Vk55dEb9JHQhdRB0
	sgZDG7ShW3cbR7dE/Yvqm+v6kFW8DvMiyMymIJeCN+CZU/hp2ZWXsMCGFRg6Iku2X7Z1XbRYoaz
	55ZtK5cajbxBm/3J8dvc0+YuhISwradenq4lI0ex4ovKdkxwfjDyNGRGlPoBwBat+5oUC48EUes
	sNMKBkE1UYwA5JHne7g8nRHtGrZKVjuO9v9SyOGxmeGN9de033zfwZ3nC0EzQ6L5IG3mwvdCtpr
	RLNtmZkvtu69VTyp8=
X-Received: by 2002:a05:6a21:9996:b0:398:79a1:cb1 with SMTP id adf61e73a8af0-39ef779f9e8mr8023013637.64.1775123303196;
        Thu, 02 Apr 2026 02:48:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:9996:b0:398:79a1:cb1 with SMTP id adf61e73a8af0-39ef779f9e8mr8022951637.64.1775123302047;
        Thu, 02 Apr 2026 02:48:22 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6372078sm2226629a12.0.2026.04.02.02.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:48:21 -0700 (PDT)
Message-ID: <5affb7f3-30c4-4e98-9905-c09154711542@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 17:48:15 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: increase fastrpc compute-cb
 session slots
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
 <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
 <7b271810-c1ab-4d07-8364-e4c30588722d@oss.qualcomm.com>
Content-Language: en-US
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <7b271810-c1ab-4d07-8364-e4c30588722d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZQaMzYK5whwCqGX43_MJIyY4-LYSqpKC
X-Proofpoint-ORIG-GUID: ZQaMzYK5whwCqGX43_MJIyY4-LYSqpKC
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69ce3b67 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zrXMvOTigF7fNPF74M8A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NyBTYWx0ZWRfX3pxtiZPU9k0L
 5UFXwXO2upqAaigDR7uc4H0Xyzh09pGNsoj7sXBm4WiBKqvkZjEH+NBMAComxRcdOIyXkxbimPh
 7lj5MTPUAx4S1PxyeZOgRxG6xYLoL0H/PGWHou6zKYFh65hCC3NdG/lF+L0Q3DHAt9RC2ZCsYzT
 WC1DmcxCbypeGp4T7c3ExA4dvDYXBn6UvQUTd22Ar1gKVNeq1h7zxY2/k5VsANp+x+6+hVz+wU1
 QR0R3a5wWBeJ6FLyv8p6DZX7iLudt/LAM216CBPB5cEB/Vwa8ReaBsGKE1moldL6Qk3j1f/z2rQ
 5wLHxLEAOzDWI5pLoXtU0GJwu4uUdZlhkefcQxT27CfOw3q1asV5btql2rsh9jFv6y+ELlyQVkg
 vCrmVxpF6hwc2PttF4kRB/gKTaoAUXuwCcfJrLbUcn+K0cax0EI+SCLjtc28HkHocU02b/iKplK
 FhS6kk8k6LnaGzlihmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020087


On 4/1/2026 7:40 PM, Konrad Dybcio wrote:
> On 4/1/26 1:33 PM, Dmitry Baryshkov wrote:
>> On Wed, Apr 01, 2026 at 03:33:45PM +0800, Jianping Li wrote:
>>> Some workloads on Kodiak can exhaust FastRPC sessions when multiple
>>> compute clients open contexts concurrently, leading to -EBUSY failures.
>>>
>>> Describe the compute context bank with qcom,nsessions = <5> so the
>>> driver can provision enough session slots for the compute-cb instance.
>> This is a software property, so it probably should not have been added
>> to the DT in the first place. Can we replace it with the driver code,
>> allocating more sessions to the last CB?
> Nov 2025 => https://lore.kernel.org/linux-arm-msm/53644b36-2eff-4b1c-9886-591afee8b589@oss.qualcomm.com/
>
> Konrad

Received the comments you gave eariler, currentl checking them.

Thanks,
Jianping.

