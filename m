Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FD83A875F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501702; cv=none; b=L2F4hQDeDyqoTR/EhwPS9EzPP02rwwV4gTSk0i7HaHd5UwTPgHdLdHDW+2/KHSx0dlVQznTccFXPVwUTxOBClglcXRiZDXZwyZYqSHjDz8wUbm4ascHf0fdlW0jxZiCqOAqdQUaQUv/Ep5Hdg0NjAVOZcOxL20MuV5uio2oKho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501702; c=relaxed/simple;
	bh=RxblkpIC033IGRqSz8PzKM3bfvj7YHZDH/KxCenMQsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLRvKiMciFwrnAD7Jf1rJR45lYCQgN+CTvoR6vYlhDRIey5EmlTvPVh1Oe4K+ZNWurg7zOgQNkh0xQGXsgKfkW/FRxtIhqxe7n0Pf+M0hygkZ/xTzcyCEJgfMGC4UHmsN991fWYIRfE1JYfN7k60uOVyMNehE+OGbYyshhY63QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eq2KrgWa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeI5FSfc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eq2KrgWa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeI5FSfc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kxQ63109081
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x05aYQlMjFXE+lV3LQNFzHhZRxyxeXI9gIkbFls0RTg=; b=eq2KrgWa2jv9+uVX
	2E3loq3TYiLyTL87k0di+sAVFMxakWN1rvT8IEQLc55A2pBxMezivKRruvaUOOZG
	j+39h9jUPvA8MYB04i9LF+S03P+s7Id7l2pLQuteSc4QaWodh8QlwTthP2HtnAJ0
	fu5BWf44w5sT7Sib7u7dsW4RCAcHCI66kBGvkQUM+ODuCNddx9ius2CEC8AdcE6S
	789QJho9XQ1e4E3r5LKipM35JVCdgRuRyVBSJWNHlm+EHONcpFT3JNZWZPY3bxvj
	MKWVOc1XpJML5uiy6r/k3xnb3nkERKgZkAc0oeJnbvsbhCKWml2h6beiT9WWgGam
	5a0KCg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery955n4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:34:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so4814866a91.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501697; x=1782106497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x05aYQlMjFXE+lV3LQNFzHhZRxyxeXI9gIkbFls0RTg=;
        b=CeI5FSfcSqJqEYcxeszp0/h0TgqjWDF6WA0q4uSXyOaxxgmzDalTsP7pS+KjRYMaHV
         5wHsE8iQL5nnxkhUSyowFgJm1Ek+skFSrbBmhkehPXLJrcPkrvK9gs5URAXI/h3JUNgX
         7RV3Ddmyq4KZ3Roakt2YuYv/wObEgy4zUJP6r21hYs4l76V0pKHbEmb8LK09Zm1Y2yQH
         v3ZVTH6OyKcrhlqIF+LylwyA2I5Lr2OW+3/3AGXaJtaZKoJCopnP1EUNMs8D2x7aH5eE
         Hi6qM13wvTe8NiJXkGrqeOuwMhdtefpiU0/Q3jB+BFV8Pl5LyT63qjFtc27DH1SNTgrH
         oujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501697; x=1782106497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x05aYQlMjFXE+lV3LQNFzHhZRxyxeXI9gIkbFls0RTg=;
        b=P0ZZIkkYjr2+3QDpbGs/km5k7gmJRe5S+vm716IYcSersoAJnMPGDhv5hfhpxdbdfH
         J/qAZmK0KiBtZwr4sg/8vn6WJI79IesDqe4qU3dmKi7xvO8VUNX3kGo85UzZqPUeFkyP
         u91LSQrGHcwMflpXeFUbnSg4Lr5BqsRyD1VqivklUaqBC03K22y9NnYBi4BKgqJK9D5m
         7nUnMvOXdQJyLz+A24DHY6MI57qctlhlT/kHFuW3PyK7lBrkq6ySVySK8WBJoAQjXgkl
         uMBX8+NiUSHLcYdkX8qo3VWCWfNLNJ76/XGDN3qzZYsvxzrHo5lmxFY6EXM+k6KEYnwm
         DpKg==
X-Forwarded-Encrypted: i=1; AFNElJ/9AQbu1aQ8xWrrF51TFi27C81/afYKUG3ZiY7CH9fo05ecARpKsMY2LTz/EHY8mWfNvmzTyhRVm0TI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw86gz2D7sPD3PU3pQkSROJxbOTF7Lx1IjWlQsLdeKSMYwDoADG
	EDzvGCr2htnTaKJp+rUtrX5Udz/tc2UySzZ5AFjym4aSk4oNBXRIxHnq1PzXyfVFgY4oG5GTb/7
	trj+VbaZQ3+bNJQgPnH931xfNq3Qcepb5x5BsRQd4uaAGDbBUf6jT4KK4PaLqz1mc
X-Gm-Gg: Acq92OGKOr+X9nRkQmKVWN4T+hee0hQIiafU1q4Yxlr2Uwo2fZi8tYV0ZU2XfMN2it6
	lHO/E/hNGjY0UpI3PgQI+le98VuAx8MWsABTN7CwLMx35QCrntGEFaypzvkHGk9ipys3d7XZ0pt
	LWIglL2gHK27E35aQc+iN08FiHqCyJpss+fgRHOKIT8Db4I1wuujEMlvXs9PihFT3JpzLCklfgp
	jjswBf2YPKqotCehoZiQxRdYPxIkrV5zFFKBmsXVwiBBQgRFOHbNVuXMywCBhAptg9mxk8jxk+W
	uuNZ/mi4Vr1CPaIOhj5Yjzxqtqq0vkAv9XPldGqwaiVRydtONgIXSxUYhpWAE2TYdTtSvvYH3GN
	fEjteJOBTTtaACmpAjIbgPsJcSkyJq7mXV54owvGotMXa633muUY=
X-Received: by 2002:a17:90b:5102:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37a036ea6c5mr13740050a91.13.1781501696732;
        Sun, 14 Jun 2026 22:34:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5102:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37a036ea6c5mr13740026a91.13.1781501696316;
        Sun, 14 Jun 2026 22:34:56 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a233f58ccsm9379806a91.3.2026.06.14.22.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:34:55 -0700 (PDT)
Message-ID: <fe0c4483-3bf2-4c49-9652-87afc91f55ea@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:04:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <ahWLPy8vg_neYgrX@linaro.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ahWLPy8vg_neYgrX@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bHVVjWdneCErkytM_Adw5Nh1O3BD9mJ1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX7j2C/HZo5kmH
 qZgjzsXxYLbXjPOy2FBA1fWTIWYnFhCa2rICSWQ3bmRBn+la/I7vbLXfSZHsvfoyqSdsfFoit73
 k9Sf9RoBAtC7l/XyFf7P+OigT3ChH+g=
X-Proofpoint-GUID: bHVVjWdneCErkytM_Adw5Nh1O3BD9mJ1
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2f8f01 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JbAvS3xc7vGkN5pBbYkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX2XUoyra+jsUh
 NZpWhg9Zz3m7rTmbSPAeQB37JARXsWIiw2yU3mrl/ROaYRVqU9Vvb5+VaqH+u1pOTkh9Es8ntWa
 VEgHUlohXjgJgqKlCfnkjQkk/BzBPFeE1Ja3IY1nYoayGaKudvjVEyb29bAs3Z0rowUYtvjPwQN
 UcqW2Bt2umoDSh1Hce22BiElrYi6o4AEv2KQE7cQ4/b5I2reJLtshc3oXcy0fyRi4qb50kLqDvy
 91OqtRNa2fsklxXGyo3bR7V0ozhYfZiKhXOsLtc3PaKz2xveAC2Hu1oWP98Pfo53zMtrhCuWu0T
 bejbfmzLKk9r7Frh4goemiHIGiH8GbdiIWEJWlHAal4N7y3dVEH8P9gRIwLr+3Xvrt98f5M1yWV
 MViON9EUvMfwiyzPAturTLiHzP1D/8TS0EyzBA8vjJuDcQR+pd0xnS0sdDMjgXZt9r+Fq08WZgr
 +/qdoUWqyrIVdd45eVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056

On 5/26/2026 5:29 PM, Stephan Gerhold wrote:
> On Tue, May 26, 2026 at 04:24:36PM +0530, Maulik Shah wrote:

[...]

>>
>> The series has been tested on x1e80100 CRD with both old and new firmware
>> and also on kaanapali.
>>
> 
> Tested how?
> 
> I recommend testing with the tlmm-test module Bjorn added, in all
> supported configurations, to make sure you don't introduce regressions
> for one of them. It would be also good to provide the test results here
> in the cover letter.
> 

Sneh tested via tlmm-test and figured some issues with test module [1].
The test module fixes are merged now and I will add results in v3 cover letter.

[1] https://lore.kernel.org/linux-arm-msm/20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com/

Thanks,
Maulik
