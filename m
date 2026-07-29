Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D1280331
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292353; cv=none; b=Pwg5zlbqdweg75fRvwnsRRFKeldIYQq+H6r5DUQ6OW5QmMwiGYRLh8gpil75+ESFxdVVHbWBlWAycChogAOHrjvpVmv5CwqtE44XddgDbUE1iRsJq7T7ftzBD1OhSc7btW00by5bt1sM3woviP9yad3vPnFFI7a8Z7VF9SIiGQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292353; c=relaxed/simple;
	bh=6yzLMpZIdPJWK9Tx5TNTEsubG24wwLW8yQMrvnKjikE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNkb5w1LlW4CHhcIuOLcoppRKZOUgp2TcKP95027eU1jX2XKAGKf106VXBzLAHGbb+779I3u1mugtm5dlq05OqFzwqfcPn5v6KdAopNyl8MJ4twTWJX1+q5n05vsTPz6lSzWspbneG2JqIb7UDGM9DM78RMPx0Nu36r9dW+nJY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgFdpFue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/NR04Cm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgFdpFue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/NR04Cm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1HEx7526709
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkFCA+A9zEAEhURVVraQS1e5t+wojCwkA/1MyuAxxkU=; b=JgFdpFuef5pjQihp
	eAhkxEPzRL30rBcIgBcLrsHs+eW99x3UaF4DrtUQbJjf2KkPx58ldhouLpZDOHNY
	zYjGQCoxwpjXP5Q7k7a3LJHs1WmwTH2GY7ZUk9pXNCEbTKp7ljpTlqcYCOcl0WkT
	sjW2tmojZEtI6jzUuOhCWh+UWCmHHUv7aib1AGyTxeHzHJLyxOhUQlhSDU/XPCUq
	zOih5Gfck07ds9MpHgaJpcpwk0llBdXuG/vjR/79NG9YzwElJsvC25fFC42/Zuz+
	+TCkQIPHM7YXZPN0ul+TWU4gAj3i3vPOSyLAG3uxhIHfYjEDc+G3EHP1rBP847DJ
	PgNsdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q09rm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:32:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-933023a5980so93137985a.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292351; x=1785897151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UkFCA+A9zEAEhURVVraQS1e5t+wojCwkA/1MyuAxxkU=;
        b=i/NR04CmiLdQIQ94b1F+9VQpcaJH7SyreeCax3Zj5ijlUvdh/PMV24V62tmG+yIXRM
         gNcjeSFVp+YRlr6eLRbjEJPHHxcP3mVECu9SNurQ39jnT2IpswQ7pVznaRQtiSJvapC6
         w62pP9Wu8yAWC/Y2nBt7D1Aym1izv+DJxGUXb3lFnaI/htCu5Ga/vV/zzZB8ttvSz9Cj
         FLW3znYciAgj1xq9lKQgGjclNzj1+QnzhFISWu1K3Cll5lKwne/QsXu2x0fo3svAsC95
         X13VkrUNYPeiN1dBkuQtocDPl2cQ/Yq5xmEikxkPP0X4jc0FSSO/Y0X5lZBOYppqq2tX
         8/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292351; x=1785897151;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkFCA+A9zEAEhURVVraQS1e5t+wojCwkA/1MyuAxxkU=;
        b=funu7BbKJEb/JbbNg7aLflGT/mOXR54W034N+1FRaTVFLzsB2gBci5C/mB5AgkN0Ai
         lrDPulH5zz2XJcIkgbHgmy3k8ZiziBfZKC8c062KQLzpOeTsVN/KnZBzqtqI1BAnuHVh
         h224hx24VM2Xc+5jtFgu5hecreT+3h3pfsNZBfS6TzW+q/pzg6GICBU9LkLI/rXUIC6j
         jk24LNdoanAjI975d/LmTPVwAu7J8YuGIoEqzjeg2VyBF2KTw0Z68u4DHSPey1K3wSwF
         EzEL1f+HX/ZUtLpKL7XScRC0/Q/Pres6eiy6C84Rr/1NQY1oSkiL3NENIBw7Lljbwwcx
         QRBg==
X-Forwarded-Encrypted: i=1; AHgh+RoXbkw+J9fYYZnz6s7uTiBVhsA1DslVe9MNjqiUWuibS382b/o2emWotpdrdG13SNcBpjTGPkVpBjRf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8BZUqmxSovzp0LKa21hOITF+t7eA6K4cCZpZCOd0+KrRm+etX
	5m44RWZZRMJ2s2kDxIKFujY5RlIbTD3rOwelTZXTrxrmlCzFViO8qAzQukBYgOpOsTiSDKUHie9
	X8elP1nzoQBPfwhnn9twDGeNGJwBDQJtwiCXPmk5S79BOaSH/UAyAMql/baZYtQhG
X-Gm-Gg: AR+sD11W/bX91HAtRAn+/KtDVn3VuUb9nRY4xvDx+zdIa4bn1G1iLiuXJaaWZbA+nUD
	VbXvI2F9eks7Z6X2O6LNpg7mocR4+xo39WeoVvZ1PKeQz3Lh2s4jRJSFTgk9Y54xL55sAdMeSKS
	zNMEbqWn2jU55LP6Co+O2NkxqJsXTiTwhPeY1o+KE6CEDqqf3tWyCwh2iU0z04m2TOh0mDwXUgi
	4bfL2o14V5S+EIf6FjXQhTXSohCIDZIZRL4hpCWeicngteXNn5Es2CPk4hYceRMG9/T6CvpGeIP
	EmwBAJ+H7LS8LhCIuYB0kNpZeSyb9BDKDnAyLm9E0UIvYKQlvO05jLPEgjKSDJ+eR8+FmwsrgzM
	6K9tUQK8EESR7Zps/38Ul5sdpMDarjD+Ex9eKlcCngvNrd0kH1oNzulF7cv9IRAo=
X-Received: by 2002:a05:620a:6405:b0:931:3025:e735 with SMTP id af79cd13be357-9330272c4edmr551510585a.82.1785292351103;
        Tue, 28 Jul 2026 19:32:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6405:b0:931:3025:e735 with SMTP id af79cd13be357-9330272c4edmr551507285a.82.1785292350031;
        Tue, 28 Jul 2026 19:32:30 -0700 (PDT)
Received: from [10.38.241.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e73181e1sm70530585a.25.2026.07.28.19.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 19:32:29 -0700 (PDT)
Message-ID: <82b91fb8-e220-49fc-b99f-81daa819e3b1@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 10:32:24 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver - IPU and ACPI
To: Alain Cousinie <alain.cousinie@laposte.net>
Cc: conor+dt@kernel.org, conor.dooley@microchip.com,
        devicetree@vger.kernel.org, krzk+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com,
        vladimir.zapolskiy@linaro.org
References: <f12c1344-67ff-4242-9c39-59ac208e9b35@oss.qualcomm.com>
 <cc697c8d-8389-4d26-ac3e-4dc51a247dba@laposte.net>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <cc697c8d-8389-4d26-ac3e-4dc51a247dba@laposte.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a69663f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=86shel-bPae3R_vHdxkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HRKmQOzKm1xNPaUeMXdC41aXBEIxuS94
X-Proofpoint-ORIG-GUID: HRKmQOzKm1xNPaUeMXdC41aXBEIxuS94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX2HTTxnXclwPy
 S1ENPwq8y8k66JxSxusRA6HK6S/7ResQ7WdjzWfFVzX0XaNkRryrZpiqy4EnSaZCaMwd4lQQPX3
 B35AqgFAtBLNUN1UPA2gl+/dZXd2rDD8c5R2Y78tFKxFv+Pdg4O2YJwY5PO9wdBJJAnIQS1MPru
 HtXYKOmi3mypmn8iXJJrMkAd8Rvk/os0nd7BeHRWqsAzdEH0uV+B7m5eWkqtOn3vHWXRzBB03rT
 do/Hq5jIw25S5uX+QmS8+08msNE19tCdA76WoD1tr21pFHwu4GRanp8vFE6VuQnTcVB2Rwnewcf
 33mfsFaJpVrrdhswrfIeSPqBLj/8AZGBC+ggYYy5KrUkKfoyPnly8IdlUhEO6nMUbcF3gz/TWHr
 snhObWBHkr0TrC6ecSnOOWpylSjYJ/offDiO7YOSh9+yWcMIFPTVxpF4/WpMIfO902aKHW5UUIE
 /Yi58Dq5kY91/rAL3wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfXwsf0+3xc0J8Q
 h6izGkmGqJZk4X7FuC5cQt0HCckHjvGbN8GxohrblcaJKFMWdDw9DTL4q8bbpkCqA2+T/skI9cw
 gNJOUVpkSB89qsoVQF02qAPEbhH1Pjw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290018


Hi Alain,

On 7/28/2026 4:27 PM, Alain Cousinie wrote:
> Hello,
> I am a novice when it comes to the Linux kernel.
> The og0va1b sensor is also used in laptops (HP, Dell, etc.) with IPU6 
> and ACPI.
> I tried this on my HP Spectre 14-eu0xxx laptop, and it seems to work 
> (though it isn't fully functional yet, as other elements are missing).
> I would like to propose adding this configuration for this sensor.


You can submit your patches on top of my patch series, treating my 
patches as prerequisites/dependencies.


Thanks,
Wenmeng
