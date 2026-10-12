Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEADB330B3F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819248; cv=none; b=oM8WTdD6wo/er9eYRvyDTOR1OpEjjjOnIw2nkGJeEVzVAGGH7KgNaze8kZLkq3nh34Gy6DStZlktcXwiwrMuAnffHTM0A4fm6eFF8a3HPxPPLtg8oxuYOILP/M6n+93/L8a4cGbkDGwn4fQ/m9Mio6V9rh9n8ZWxQPY3GEVHKV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819248; c=relaxed/simple;
	bh=8dASgvAeQFXZ8Qm5V+syp94x7IID/FvtG2KApiz5+hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZeRSt75XcrIt5udnEIefwus6Pp0ss8yTaTfRI3G6YPiDG5p70j9+jEpsZddE/EKtdnpSjfl0OEA+wMRbJ9oClFaWfaKvnKReszpzzNoQcYZRxszcWeqausYEi/KOMApXeegncKjMj5Cq1u2kOBKGsqEkrxyt6TGw0hzZi4yA/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFvzY9+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E8MLomp4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFvzY9+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E8MLomp4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0JU51686600
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHtdP5oSiwaDYUou6J6EML2gAJdq+QdIsaozFMsLVRs=; b=KFvzY9+HNJ3V9Usb
	x6KdEDB9a5K1rCPv5xS+tAR47nsIJBRMEXMrgustFMXsqOoLP6DOq00Wbt7obKUe
	4fEZGcCGwFKVCyYQk9DW0Dyl95Jg7U31Dnhqzgw03diIk5mKx0kg3LqqGO73BlRP
	iQErrB+EkgLTzmiAXLqTFCVIdwM7+w1TlQ/DLLg8UnhsqwBhOIHbN6W/5sDZAr2v
	U5oL7OsthCre+oT8wk7RN5N7jUmpin+wLiH773FL47lt2bQerxXD75wG537YZ0KV
	MYdyPSiMj+g1NiQbATwQyoh515nj9nQf5oygf4LtutnA+FS3KrHTt48g4gtnBlqN
	fNOcyQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1gqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:34:06 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so8472537c88.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819245; x=1792424045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHtdP5oSiwaDYUou6J6EML2gAJdq+QdIsaozFMsLVRs=;
        b=E8MLomp4QwYimgS/PiHc1XU0CD0KNOrc03YlTH3vYdHYuzuj4uGFBpabbPdMxYiuE/
         qByJ/jtydpTkx61UpPG1gT31kLdEXfECGvy8IUe/IfKbtGLT3fBrQ6l7ErttGM++Bklc
         yxWT9c75Laf/NjLfw/mMD+Hq5Lyu2d9UxDbK5Zu78uDQJ/Oao2RbOk2GtatHVdon0h1A
         SNlMIhYetjWFOiBW5aMddf9CHCivDSNC9DMXECtJGnDZjLIkm//jTXvZQMEYF4YMPAsr
         75w34BCniLDkZXc7vFL9yD5bwQKqkRrHe0B1wOiq6d4B1xROKLZzLUbK7YMcMaKVhZTH
         xtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819245; x=1792424045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHtdP5oSiwaDYUou6J6EML2gAJdq+QdIsaozFMsLVRs=;
        b=CNT4mTv53FkDlq13NpkfUkRDRjmVWe0RF9QcBJdmf+5KMOyTKjAh0oPVFUbVd5/ZGR
         dUri3zabadxUECCWIPkJ1G74/Qke6nPX7ewyqoa1C3IJNJQaN++wM1Tfg63Bf+Nx93/S
         gnX1vwW+M2nKwQYZejaLaT/BOZnKCdv9AuxmN5UinQa+4laffDQd3jnG5qd61k1l/SkK
         jJJxXuQmsaGao8FG4MaRy3N3DTREHszRDmkjaphhmIL2Lcr/RmescbmzVSeNPdOLH5uB
         bV/oPnnBxGzgbxum5of6A5cLYHL+ol30pfWWNBLqn5vu31fKjVuMyyCl131tl89mc5Rb
         8MHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK5N1nB7K/xnJMI8MAd5yYjU8ii393EZWIZWNtu0l5OZkWQH0R8zrK4XahRQgYFflJTl7vcpZDWzeN@vger.kernel.org
X-Gm-Message-State: AFq9FYJKnLvvx+m0oYAu4GPdPt1vqZkF12fgN2reYCiagRY72/aY+EfH
	P1sBQLIheoKiTznG2phZIwRH7tfk96YKaVInV/8ouHQK8Xfkr8sGMoZ3ZpOkOKaL8rhyGw4XMow
	zbnKWgNVYsAKRpuRJnlwk/JY4HXU15IOP9sL9V3pPmNArNHddzIC02fdE0rvd1E9Y
X-Gm-Gg: AYBFou0/OSkTyjGz585O0xrBLFCwel5+xYYb5Iaqzxxl/C4UupKJoDE4ASLszAD9T+F
	IJKeY2YiTwqcM+6sHjxmPvgY4n/wIjXFtCJypTzaIMUk7l/Hf0N4hfy6SxmSgZUUxmRR4UciJYB
	yO5J2ibzJDTJhYuxBYtTIfca2G9QVyurXZ6G+OoYZ4aYEQL67JGmZNPpd7OPw0Cf13vx2zFNwaa
	zAfsJunmpp9B3OBMQCVX44ZvRcsLv57m9ZhvExfn5/IIhLhIi/+cifrD0j9ae8e9Rfq/6+XkhZ+
	F88OQAuh/MMxufaO0n5cm2aNEVrc3LRxp7rMd3zbG6Jf2XvgiWsyWc5UTaigDGpMTgOuRCb4wJT
	ZJ18Z9+GNmmxtPeVWPVnVfA==
X-Received: by 2002:a05:7022:b0d4:b0:161:3942:c07f with SMTP id a92af1059eb24-16a660d44f5mr15641069c88.47.1791819245239;
        Mon, 12 Oct 2026 08:34:05 -0700 (PDT)
X-Received: by 2002:a05:7022:b0d4:b0:161:3942:c07f with SMTP id a92af1059eb24-16a660d44f5mr15640998c88.47.1791819244510;
        Mon, 12 Oct 2026 08:34:04 -0700 (PDT)
Received: from [192.168.1.8] ([171.76.83.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a620bdafsm40540655c88.23.2026.10.12.08.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:34:03 -0700 (PDT)
Message-ID: <c50aac72-edca-4690-84bc-abe7ade91212@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 21:03:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS coredump
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
 <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
 <bc6440b9-0226-47ae-9e33-594ab6b92004@oss.qualcomm.com>
 <7759e73f-58ab-4a9f-b3ad-2e8a42abc843@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <7759e73f-58ab-4a9f-b3ad-2e8a42abc843@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX/ue1G1uzQfEg
 b96DcY6ZBEn2JeQIAwezdksTrQh70LmKxdDZDnX4mT44rgqbw+J67pdPbWk5sh/onLh249ci6Bg
 38ygWJEq+rGEC3pHklupmNfSU4zgIJI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXw/659HCIsqmV
 UAVzM3QGv1qeH1RbyDW46v1h9fTh60N4ViMrU4uRGL4l1+yrwfH9vfQM/m3Qv4UpEYfo/FFF3lU
 eQt6uBgCuUecDYqpZd5A1wJUVwpCWZj37LMY6pXEfstu12a+QxR+LJcskwa75IipvPJriMB9xyc
 JxJZaMsyv/UY2R2Z64zpuc/nl5lqgC/av6c3SiAO02ng1SUgzwpDT3d01uoSEB4Qlk4bITdef0L
 VNpnbLGHUcTyMyA8+Ls075IyX6PoYbqcfxraR6SK/UCeDvj5I0OKs0N6DmxIYWw7GkKdXxbKAw5
 B8af6it6LZF8iWmrAKuVbM8+pOCXwcVGJA1sQo5StbCbOznXAj2iFgwqxLmS6UQcPjf3GsFG01j
 Uc4gMbcZNDsCMlPYG9cL6LD65jvP44Y4BUBX2csemmLesZoedVjNPKEO8pOmUmbdVJ+LnCKRenB
 TGURcCa/ZtAytO0ZhGg==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfdee cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=xT2OdWCu7OPer0wVDpA37Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WhK8QHrt5qDQpnd42zEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: W8BiFpNG4MLhHLjG97hFZGnw7tKfxpUL
X-Proofpoint-GUID: W8BiFpNG4MLhHLjG97hFZGnw7tKfxpUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061



On 10/12/2026 3:58 PM, Krzysztof Kozlowski wrote:
> On 12/10/2026 11:50, Anvesh Jain P wrote:
>>
>>
>> On 10/12/2026 2:26 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Oct 09, 2026 at 12:47:42PM +0530, Anvesh Jain P wrote:
>>>> Add coredump support for the secure and non-secure OOBMSS carveouts.
>>>> Register fixed dump segments at probe time for attached-state recovery.
>>>>
>>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>>> ---
>>>>  drivers/remoteproc/qcom_q6v5_pas.c | 85 ++++++++++++++++++++++++++++++++++----
>>>>  1 file changed, 77 insertions(+), 8 deletions(-)
>>>
>>> Why is this separate from Glymur support? How is your device suppose to
>>> work without this patch?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> This patch is diagnostic-only and is not required for OOBMSS boot or SSR
>> recovery; without it, the device works but no OOB coredump is collected.
>>
>> I kept it separate to isolate the optional coredump support. I will make
>> the subject and description generic for coredump support on PAS
>> subsystems with secondary processors, rather than limiting it to
>> Glymur/OOBMSS.
>>
> 
> Commit msg probably should mention that "recovery" is here for
> debugging, not proper device operation. Otherwise single commit, if
> moderately small, is usually bringing entire support for a device.
> 
> Best regards,
> Krzysztof

sure, I will update commit message accordingly.

-- 
Best Regards,
Anvesh

