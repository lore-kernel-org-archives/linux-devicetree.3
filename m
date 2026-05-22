Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE6361DB8
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442120; cv=none; b=F0v2BbjxA9UcM2J2gVhpC4Nqo0Ik6I2/oGJBYyTsg7S0DLfUFxDmJJI45dr4a3ouuGscutjYIXjhkftdg2BGEYkSfT2Uwy/TF81W9J22TzuITESYqFmoJ1jAG+NbbbGozfLvDxFNWL4KdLz1EWJTw2I/vhWUXrWA0itR460IAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442120; c=relaxed/simple;
	bh=lBQ7uT2pXaAgBr5WCjJ/6qyoPhAHcYzj9z3qb+CUDjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cp7zno1esu33Kqoj4GSokqjUNzg+C8GHPQqPUrefRjKeqozp1tLMuzob0nLo6psovtQI+wxUr2pXOzJeGbIEGcDZ5uRl5Vu80H/glrnI0VOeRQnXteA86A0vkp7D1bHwFUWGcaP/AonwEBKSS5N7dgUazvEm7QH/j1T9/8/sa60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkfFc1Jf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TamwePaC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkfFc1Jf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TamwePaC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7AXLi779220
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOpwbG5ilD10AxWa1l2Er2Zhjy5C62KFsf52M3F+W+k=; b=AkfFc1JfvYP6u2v3
	tbUl0pXRgriopNhoiwzsobwEmYwhxhGK71VR85z6bGkdH+fF6ebh7CdvtALjdNfr
	nYYX5Z79ByFJ0VqUdRFsIBJ/6Yd7ySS/r/cxcnY9JhwyoCAOOWfM4a1FyQH5g7hy
	c3UnIu5qm6sFFh2v2YwsdX76jWkcJF/Zm+6gsObmuzODZHNF1VsnxjoDJcrgPXC4
	B+PKlmfyXzWR6O0Umn0vTjTW+Q2/aTI/Y0wLGmlwvc5mN1NWJCkmG5NGsFSESaLN
	IlOMRsGMPr7lvdqi21bV8hZAiB2I4sXD7ZuIHb9lBKPr75fgelwGdMO+JEfJ6hQI
	L3sQmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7at1qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:28:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914ae262b06so35082385a.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442117; x=1780046917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOpwbG5ilD10AxWa1l2Er2Zhjy5C62KFsf52M3F+W+k=;
        b=TamwePaCIGRnJqRU6ZMpdDLvSC8y6rCYNWpr8xikXFeIzO5Wvf6jsuf5tskI5kksJH
         RCxXHCtgpXRPF9F37GXr7bo1QpiQRXdDdlAMlHdRZujrNu5+J3ueF47Bqu5cJGzTJEWn
         dFOxQzKdLqHpf0KIWWds3Jj5d8HZqqtPEngwbBoEinDZ5omFbe5zFhbhGxvHr7Pei6lZ
         HuuB4q+2SaNkMiMI3xwnKcABacZ0rz9c/p/T82msmqzBs2HAhfxoDGIH1ox/+4dRyr3P
         3macfEOwPrgXq9D8LnCVGsUqiwzFQLfDvZMuy2KnscI51b85f5Gdo8zMiibGzB3Cjimd
         ZK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442117; x=1780046917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOpwbG5ilD10AxWa1l2Er2Zhjy5C62KFsf52M3F+W+k=;
        b=AYV1+uv61pJ/kO7KMsioLRO7nJfAJ7ZN0HiEmHnoz0bTZYrfAgmsr3DuE7NIY1Jo3d
         PTodMvoJ1GCRnINuH/laNeeQf+DWqMdpHYoMwatKhpBO4K7/i9LVnRE9eDHfIknvH04f
         P6yob5ZPy/do/+9GS/mpeEBcseNK0kMiNIeui4l3y93/KA4xc97UMDv1cQyCHnlUPJKR
         WK4e7uVn6oGHgZfZ6JBAfu1tr+FRHUI8EThrAsGVOdfGC6a5Le4RX4d3CGLxy3aYmbaU
         Q7SoX9JkIVcCNF9so755fzNlwqTr5jX3YhGteIXbU1UuMiymHVu+BIWhoAsZEOK1K7F0
         a7Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+tjbpEVL7kjZA4foAgCDlyJr9hiWEVpWa+A1LuEwIGLRrGcib+Y9b39cI7F63x8dVHic7TAjPevM0m@vger.kernel.org
X-Gm-Message-State: AOJu0YwOFobAHY7oAnHjehcVE4SsS0GKrFbe0sDyssdek25Wrhb7bY/K
	2yX6pKgEkqxoA8quZcqtbGOaxQybuncqw/Q6xpZd8HpEFVB1wx3wCV5iAmEaCXTdKuAeNeYHdoh
	QioxN2BrkXxtwQeGmDptnkeNZrfTi7kvpMyX1HDbym9ZWnarogr/qWPyRV7963mJ7
X-Gm-Gg: Acq92OHOVQw9tSlB/wb37aWE2tHzf6jxxXQ9lpOq7cqMi2IhqW2tqxOxtV2CGE+R0nx
	ZMHBzyNAoGkjyNYvq+oAVHkfyXfH4Waqdyn60pDOM3EC7Nmr19cPuxC35dbDdLEOT7qzBzJ2Gb7
	b6zQT8VuLSbhmo6MOSzzi4IQxWnf/SyydF0u/Av6gMxt8Tx3fgGjhyM4ATRPxHuNu6Gjq/U5IOf
	7PyP17yXO0xGnyOrXOaJ9STZw4bX1gQQDHaP0vv+7nKx1FLf5kdNopRJ380QgD5Hd0tCB7MBb6q
	FqcIodXVrV3qLOTeU5kOefec2FoFgLlmoSdC7xNBaUHPonhC7g78EowLfSXZG63eYykNxymOsQY
	Qrm18SRGcGjKTTRUQQmE/HWmzDZDQX8hyayfhtsc6FJmaKg==
X-Received: by 2002:a05:620a:468a:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-914b49e9d14mr292563285a.4.1779442117053;
        Fri, 22 May 2026 02:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-914b49e9d14mr292561285a.4.1779442116624;
        Fri, 22 May 2026 02:28:36 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f50364sm473973a12.8.2026.05.22.02.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:28:34 -0700 (PDT)
Message-ID: <7e435e8c-ba0e-453a-b95c-450446dfc0ff@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:28:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/dp: Limit voltage swing level to 2 for RA620
 bridge
To: Graham O'Connor <graham.oconnor@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-4-graham.oconnor@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522060645.4399-4-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9zGF2z1Ge68GbbDXiCTgRw7mmLfJ9L6K
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a1021c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=wrdFt3MdCHdAHujQ4X4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9zGF2z1Ge68GbbDXiCTgRw7mmLfJ9L6K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX/UmCZMPhIJ0H
 Y6LKxFC5UaGOczTtVsmlCuRFQ8GwVcWBekWx83lkPj/t4rbQu8tlS3WDzgGV1BeiJ4/IjOR7yu7
 eaz2gxeiBF2ATrdZrvXQFOw2usNnRJ5V2pTRZKwNvRaRBaZ9BeIik/xDk9HXpJBoaJn8ZgJCbwZ
 wcRgnogZJjFYYi3GJ6rv3+/0jJgvrCj0jXOBGLzq4I/Fl1g7/OyqEnwglVldDLIOOkElx30x/zV
 Oxcmuv0/w7ZM/gI8gw267mCwqWQWud9Z+Dwmagzip4AfFLTRR0EBfaZQ+xRjQPZTAkuqd8KCNKz
 b8dsLyYL4yUTfWJhMlE8/urz05Z5dxD9q67fA3mvigvOEqtiYmedIqz0v63YhVVSQOXQy2Fumyn
 bqcIeCNxIJd7cN6ezpu1qOsGYOn7GrFwaqK+LEJFhVbfyGBxCzJq8aec8/yB2cBVRQB8/5YOnJJ
 jAyZK/Y3+e0hE3IXcBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220093

On 5/22/26 8:06 AM, Graham O'Connor wrote:
> The RA620 DP-to-HDMI bridge used on the Radxa Dragon Q6A does not
> acknowledge DP link training at voltage swing level 3. The bridge
> requests maximum voltage swing but never completes link training
> when the driver attempts level 3, causing HDMI output to fail.
> 
> Cap DP_TRAIN_LEVEL_MAX at 2 to match the behaviour of the vendor
> kernel, where link training completes successfully at level 2.
> This allows the RA620 bridge to establish a stable HDMI connection.
> 
> Tested on Radxa Dragon Q6A (QCS6490) with RA620 DP-to-HDMI bridge
> 
> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
> index 76125e9c0..ff0d8e99d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.h
> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
> @@ -24,7 +24,7 @@ struct msm_dp_link_info {
>  	unsigned long capabilities;
>  };
>  
> -#define DP_TRAIN_LEVEL_MAX	3
> +#define DP_TRAIN_LEVEL_MAX	2

You're limiting this value for *all* devices featuring a Qualcomm
SoC with a DP controller. Instead, if this is really an issue that
results from the bridge's capabilities (which could potentially only
be a symptom, not the cause), this should be somehow limited to the
specific bridge itself

Konrad
