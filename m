Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3052A3CDBC0
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622324; cv=none; b=HU0tgiKLR9IIRu0EyEPwk29euUES0K9GkhBXS9YsIj567kF14IwonYJ//2U534LMY7Ze7tFxFrNlHjX9GOknnxEcFbd3vJknc8iUX5Cizqxxs2a7qrl10gy1o2UIYhI6ek62cEIU6ptzmU9p+PHZMvzCVy5L2g9/ZHIPJiwfj+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622324; c=relaxed/simple;
	bh=YEWEBJ/wLzBusDv7u986mZJkPr1sOwP5tXguBWv1j58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+7uifecfjM/EIXwmYtpDqvqHQy4/slCElwGNNogntwVaJ9wbrGOyQpzjXMVTnxmNry6HGuApt3PkaqkXizd+IJ4KPmjYqdvOMM2prTZVg646uUdiN6ZUNrvOQlCrMZteWoM2JfIUfpAM+dIUFS6/ZrIcnsQYHgYc5b3sNwrUY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTksQLh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmFxu/nE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTksQLh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmFxu/nE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SHvxhS819879
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aUQXcc91Nms0mMqzegCYthYDa1bP/Fd/lJEybhf1XvQ=; b=CTksQLh9GRSRU5aC
	RkNBkiHcJRI7vkuzbXUnrgkGoX8I7HlKIE+HdNX9yhy8EwaM+Q6JN5vqkdKpcHEP
	mEI7zCQ16KNdzkfpOsPNQfq6FywVtWukivJn18kHmEi0YBB/4+sQA0vXQf4HVz+u
	y4IDpGwo2IhC3f7svhevQUVXTZI7MXu3j4dxNaW/9WRmgBsSZlaOQEOLMNfs2PyB
	ViyMR9jDPVjhPONgnLMD2DyYyD2K1KhelVxixgEm5+wDvG1jDdoZ9NlGkQoPVXyE
	IbpR9pNPWNunK9qS7qVg8rs7hPnLTz+ax30kmT9hgqBt2HkoCcebmSSoe8G5kYNh
	vJMD5w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx39u71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:05:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5721280eec.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790622320; x=1791227120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUQXcc91Nms0mMqzegCYthYDa1bP/Fd/lJEybhf1XvQ=;
        b=NmFxu/nEp2y4CS9880XiiR+T7uqnENRaGLtS7SWEIF6ChviktVLq8tjBxJKzNFop4K
         LMaQWivCtCI2rY+b+8oVfLMRK5C56TCjkiCjtdqBXTVdUM6gddWBUXPfW8TsXVOAG8MB
         CbY0xxWm1E1htxggI3iKIDg0FWFTKvFBOY+1L0v1qjf2hqUm9rszD+XD9s3so/lcDT1n
         fkuIJ1RytTol4m8g/LHDdFtNTiI85UM5QsKXirv5QpKZEatoKu8xvJxyMHyH1eys1HRS
         bWJcsnhHT8UNz/aCIFmUyNhcW/rAkE6NFGM2hFi7HAITjEfV3UdWHoV/POe/9KBHpgzL
         1Z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622320; x=1791227120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUQXcc91Nms0mMqzegCYthYDa1bP/Fd/lJEybhf1XvQ=;
        b=RAdXgyGzevuMiahJnQs7zjHh0gdLAAqNKBbPgT1u7sOamM2pKWUE8WHIBaEjD9xm77
         3vUJ0q2t9nO95rrwJRYP+rX1QCt9SEsoUSLpFBm+uzGlMtsTYudSFXwMw3AmeNgLwTvY
         iJiJgjGFS8cgWLO/PVIi9sb3Ho8WXQL6nZ2jJ08pBZx+2K2j+C7YhzyBFRBc25FN6A/c
         e8m5qF7RZ/7GAj9LhrnZCwIJ3qzk5BQ5FofGSRxydx7f78nJWP0izc/eBXCaLq/k/g2H
         0silR1Q/xsuIdEAl90lMfj6sM4Y0WWTP3x9PwFfKhQa3fsNHfRjI+Bz97ybGMWWe4iB3
         f2Tw==
X-Forwarded-Encrypted: i=1; AKwUvBzqswExIo7KeKWtv2umeTJiZvEQy+1rBFfCpUmkFp+ro8PQDIRiCJopaPyw0Xnl7Wt9TF4arlJYwcLY@vger.kernel.org
X-Gm-Message-State: AFq9FYJC1EUaXXYuRKsVjl/fJgfSpn8KScXoOUlWsv5M4C7Lyrj0oso0
	vji+QOw1GG/C5fE7X/blSdkGhq1S0VwQCpG8Hp6Q9yWekAI9KpdPIvDHxN3adc0WquirHAjqZyW
	73tUMSgO+vkdhd661GhH5/LXpozITagyVrQBsHBhI8Z2mKG+DQpB3N3ra+180xLL7
X-Gm-Gg: AYBFou1uLnks1DNVQslLhzS4Z2UiA60T/ic5ZwZ/rwjjmyAWB0shfXDt2IFZaWo6Qbk
	b4ZeJsLt84Av57Q67YdJOZ9ujaZ/NTNoXU5n9w9updcAUDZ5kvbGMbRWBw6a+0/blEAK/o7nsry
	gsvluStkOteWAvEtp9Hf6vcVM+EIgtwXADAqP5oXM2XVYuJKRoTHpLFavDe6JrehydCYrrI78Zr
	Dwlho0rlHsdiUobZxbz5Td3MIe9D5FUp+Cgo1K6k8+hly6XaRyi8LPMr31MJXJ3kesfXqFCvJGt
	KR732gNT+saIS4Rih2Kh2v9TE69k591g2XLFYvgF2bRN4U7Ewyeco5FBcrLkxy+5kbzu/KbTR+4
	iLvpreCYCnpMEvStBE6H3Cmep
X-Received: by 2002:a05:7301:2811:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34271d8d7edmr12283290eec.24.1790622320469;
        Mon, 28 Sep 2026 12:05:20 -0700 (PDT)
X-Received: by 2002:a05:7301:2811:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34271d8d7edmr12283193eec.24.1790622318728;
        Mon, 28 Sep 2026 12:05:18 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3434958c3adsm37771935eec.22.2026.09.28.12.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 12:05:17 -0700 (PDT)
Message-ID: <fac7522a-a9c8-497d-8753-e8c397ad581f@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 00:35:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm/gmu: Fix Glymur's compatible
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-1-0fa0bfd8d315@oss.qualcomm.com>
 <arnTH0_tjrspIymm@zenbook>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <arnTH0_tjrspIymm@zenbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3NiBTYWx0ZWRfX7agjU1ieqknM
 1yfrGQt5Ajfhh/Hu5xVKprrxzWsJ5OmisrmOENIoHPlEDlaaVXtk4JYkIeu2q1N5RL+1a0p6ZW4
 oSqWMny5D1OKjYmlFw577lh/A9PryoUYodr36syeo5YPsG2acYda01IMtr8rH458BSU33+QQRpb
 lVqOEeCpNoSughhuh3NQkHZsM9tXqkA+whAqRmOFLOAFGDvjhRwdiiTdEeReiqiDiYJGp5jt61v
 5gORD6syLqE45MVXXmtYDP/TMRAxHF3DYc1kDoSgh9SwBxueEDJ2Sy/5ByiWrLn1+XWAiuKUYJS
 s1N+8Hpr7vVYw8LqrJBNJZCZ1/QSxPldEeb9TAzJ/i0d79B8phUZ6QhMJGinbVZ+lBgpESL/4WS
 okH8FFzGWsLDCXLF7PJS5KcJ99K8En2Nw+1ZKwNd7nrktWtHjEuNCbCRTaca3mYDcfNVAm084Pi
 RObTYUObnNm/xDyvFTw==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6ababa71 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QgEWrOWD1ie02Gccw6EA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ZKluTIhtzpZMnkIph8_aQ_jMiPLiFo4u
X-Proofpoint-GUID: ZKluTIhtzpZMnkIph8_aQ_jMiPLiFo4u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3NiBTYWx0ZWRfX+ckPHsqc0+g5
 muxW7BUTVYCO+BI5ibvRbO/nMRFd1zNEBEUoXlkkgFW1f3rJWzNhT4XOls1y4TWliWxuh7fA5SS
 juZhelUiYmLTzaqoI0o7QF+QtxQ99Fw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280076



On 9/28/2026 8:10 AM, Bjorn Andersson wrote:
> On Fri, Sep 25, 2026 at 02:44:32AM +0530, Akhil P Oommen wrote:
>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>
>> The Glymur GMU compatible string was incorrectly documented as
>> qcom,adreno-gmu-x285.1. Fix it to use the correct string
>> qcom,adreno-gmu-x290.1.
>>
>> Fixes: 7bc29d5fb6fa ("dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU")
>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> index 9e459f12ce3f..f22661447e7c 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>> @@ -363,7 +363,7 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            const: qcom,adreno-gmu-x285.1
>> +            const: qcom,adreno-gmu-x290.1
> 
> It would be preferrable if you add the new compatible and then once the
> dts has moved you remove the old one (i.e. after next -rc1) - that way
> my dtbs_check doesn't light up while we're trying to dance these patches
> into the different branches.

Sure. We can do that. Will drop this patch in the next rev.

-Akhil.
> 
> Regards,
> Bjorn
> 
>>      then:
>>        properties:
>>          reg:
>>
>> -- 
>> 2.55.0
>>

