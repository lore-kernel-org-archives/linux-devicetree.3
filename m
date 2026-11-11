Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421026;
	b=29vhj1F7innR/hlNe7KZfhisl424+ZVwVaJvgHcgMlA+wSDNjQUXzlJvrA7pOsgk4YX8
	 5QRB2B/avyH2e0PpRtp+XIvdfGdLgzVlrRdAUyOyFmA5ZUZ0tt708sHPNNiVGqUwVuNVB
	 xFqR0qirqrJQ1CJrE5hDtqRxkNK/iZFEvGKtiicg5T2Du6ifbzOBgjJBMj1V3Ncl/niCr
	 F6dTXve5o4s9nPZRY4Zr/mW3+P9zhU3vJZiJDbDfLbjmsPnpu0gZJe42vMvHRjMlAbiNC
	 jr/Ccfp+I8w8y6ud5m1v9nM1lpDyiVnQXK9D95MU+zkh0CAYUFeMjfiZhLi2QKewDvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=II7bco9p8fhDUQCPqmsP9jpHQQ09V6ZfyH/4O3zihOE=;
	b=vVWwf2CTk0ARaXYLf1qSFrMZ6kxKSfgUnE1WI7vtw9UlNsLzi6qRbKWb9U7wPZzxEp6m
	 gm4dsUC1ltdds4dGT+/U8G7C1B0wcU7I50k7gon16deWcWi9rnY21zKa/X7TB7xLrHpGU
	 LgP34sh86hT8rmUEqYZ91jUAPv+Md7sRJvl/qm0dxJbfPxneiejtOHnIPNsxjL4AqLAJQ
	 dtKwCuIjHE5ECHnVIFB2mnUzWg2+Wi4m/ObrGqiQRoK8XR2q/vOi+vx1jnKItnz0nYk1E
	 UCWAwmY+biomRJQu2I31KabICIrTs1LZNy/XDuqyJLd3hlKyeBoo+u0ga+vWfYIHsKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eYtPEukH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OemP55rF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB482606A896
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB482606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eYtPEukH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OemP55rF
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtIp11952788
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	II7bco9p8fhDUQCPqmsP9jpHQQ09V6ZfyH/4O3zihOE=; b=eYtPEukHz26BB/Uu
	sy05Kk/r4DlcBghXq/2zBCJ0QHiV7DuFhG13VEHq0NLaRfFNKpWwrgpw7U2NHBms
	MLYVGakbADzm6yEkTy2Hzg5q0LAda7ompwpIOyf+f6n1Fh8lqpA5dOl3zDWWz+rr
	gAeurkVXF2QGfO+NQVbbRewU9EFOYVLDS36Jrckrwo3lA8ZDCEZ9Y1CoHMfmp0Hz
	SBmlS4HeOrmiRWsOm0J0Eymx8GDXdxxLpu6k3vc44yg1ulN01eP13yp7Vfx71Axl
	OI64R5eBauV+e6Ghbe4wqmG6gz8Tun7C9syFfYJVHuGnnQhqqrbXkdjqblDJWSVo
	N9pqGg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m1c1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:17:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b206156cc6so2352658137.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794421024; x=1795025824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=II7bco9p8fhDUQCPqmsP9jpHQQ09V6ZfyH/4O3zihOE=;
        b=OemP55rFOuqfkLoc1yt2Zz7/tKJbj7EDaFwzA1FDf4+s7fKBfjLoM1neo/C/wUfvKe
         cUSsiJkAWvqY+FwpePlJig5Z75z4oRoOpOgBG+yecVg0hhj6OtWA9yUmRqeEP3xjtXwi
         g3kZUntHNp4tT7A8cp9yKUog3BN+zuWMxGQcuU1rLa2Q7MuDIK+jN5/XbhxJmwrhZtle
         /1J/HaecHj3Dv8fJ4wFvw9jtI6ot+eBEIWGoEYPy6zM8O/V7ohtwqLltazCBkIqfQCkQ
         +5Dek5P7VBzK6JI1FEtJDiei204AKdxM06xx1AOd7h2U7TGek3rlz7wCP5wayNOgRBOa
         yA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421024; x=1795025824;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=II7bco9p8fhDUQCPqmsP9jpHQQ09V6ZfyH/4O3zihOE=;
        b=aygiD+rASNOyhtih7n7w6E+AgRAOiFCndbj9a01P4lN8fRrsJeFQVcOXzkD7eCB8FR
         Y3t90+/4aM4oeRIg2lPjjBDuacB/S8KRtydLJN8PErBf29C7q5Ri8kCFWW64jfkQJVVs
         W/X5blGk6NWwga3VRJ4qyBNBhfnhsgtXf4c0QQPUl8bqjE8CqXF+SdTgUudGK0rxKxST
         wjfwUEQXqV3DJnfWIoCAxSojhVLgoZQB+Wvx0CDMrwXQAj3zQwB4JaMZS0PaPvrXvwT2
         +Uqz2MwPWS0Rdubxa7VFrJmmbZXY2BlzF8FCRLUVz0uRd1UKfvCBoavX9PGZfMZIl68L
         M6bg==
X-Forwarded-Encrypted: i=1; AL+hErEGZhJgejxW80p0m4bmLBzVJTMlp0cKaaEK0diqbyFiEMcucBHP3wXpbgatHXxmnXb7M4dsGieJYuab@vger.kernel.org
X-Gm-Message-State: APuU4Z8iXLJzMg9EV7vPuCfgLBeCYjgEuLRXeRGFgnuam+LzdVuzu4xt
	N6BB6QsAdi0QxCZCon48xUql53qdFdJ1+uJh92d9fhiAF23bd979BCaJ1M15JCXaVLO57HsbI5l
	PM8jHY9N1hQEBTxGO/7muzk+40VXsdZPFcblxI0mq5pYqUz5VtndBtbPoytD1YqgL
X-Gm-Gg: AYBFou0YhqJbfFuxVnyE++GcDXF5mnWNmjC9MowdWgHj3qjSKmb/1u+tCUYPSE/QlvX
	rFcigSes53ZT3MF7W8RJkZo1myLliXTnatqtMqRAWSWN1pftfmRtEnp+DhlNkpPpOmKGdZw+ec5
	DQ+O4bcqH9MEl7RYvHqwcUWlyDd9LMrTDuuRfrDM3lqXVaGul+eyxTN4eeu+R/R3kHnysMC/FAZ
	HBGCqEk8cAXgUn4Z0fXQq8mt1ZQAjvBleVR+fWezrOQTOpisyYMAoSvkYYFoqYXOhztotmtu3Ig
	eIfjGiZPdg6+VL9dj6+iwHzVkzakfeY2eqArmnmfi8W5tN7grhSf4d6raA/OAgIaPal5/TMjAqd
	itc+xZyr64DdMFXPwAFW7uUHh5k/e/egOXIkl17OFixowfpfFUzj6VIC6Kjw10eCyJPkPGU+Nsj
	8=
X-Received: by 2002:a05:6102:84d3:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d50624a2cfmr1137077137.36.1794421023745;
        Wed, 11 Nov 2026 10:17:03 -0800 (PST)
X-Received: by 2002:a05:6102:84d3:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d50624a2cfmr1137062137.36.1794421023239;
        Wed, 11 Nov 2026 10:17:03 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367b99bcsm12980486f8f.51.2026.11.11.10.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:17:02 -0800 (PST)
Message-ID: <a9c0ba3f-12db-4453-982e-25e34ac1080e@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:16:59 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: example-schema: Show example of
 dependentRequired
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261111111403.83665-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20261111172107.GA3839021-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111172107.GA3839021-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OiLWqiU9pJiEO88eAPrz-ajPHDgCVwpi
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af4b120 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=hqZhws4bIZN3CDWLS9QA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: OiLWqiU9pJiEO88eAPrz-ajPHDgCVwpi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX0hIYpLmDMGXh
 55X8iwGTxTQN6KD2UZHff0BwzQc4KyIcb7H9yDqEvbG06thplyGVrlvhgftunqZPNuqMA0aN82c
 q4VfZNa4xPOOytYQ8GQ5k8erOFvJnfL+XUQpkZUU7da+70X3/VCqwd/FfRfOT9O2W7aV5ae0guU
 0LoyoJSlRn91wj2vd1GlGruVYRQL4T9dfafa4kcehoOOO5RupFyZnA8Jz71p+OFitKNxFibPKrx
 BN/9fc0W/uTQ0K1pqjakPsY6mQt98/Zd0Jf6eWCr2nbsp2qKr8GoFmNvnUYT2tHdJ+vVGYBQAg7
 R+Pzut5BuUgP2b+QRfq60SeXDAYjQ4Lc7OwgITKK8B04DYGws8B7YD/dhzqeVEs+0Fn3Fobw4f+
 qduRazF9Y0MJQGZeTUZY+t/lBZDO1QsAd1A+OjkzB8K2rjm9wsVWV+x/73IYCLKiqzHPqUC94to
 Z5u/k3bvm9bKok9JSNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX5heWZ8BSzLjC
 obrBgDTJ/YK0Nr7qQnLT6OiLEygnJyIsbL42UL6Yw+Vqx69guPo0vZEAwhlAG5X4Qbw/C8RHaUa
 dTmQ4nDrs2l4/aORotP+lr0EK/qH4hc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On 11/11/2026 18:21, Rob Herring wrote:
>>  
>> +# Properties might be required only if some other property is present.
>> +# dependentRequired is a shorter and preferred way to express this, instead of
>> +# if:then: block.
>> +dependentRequired:
> 
> Update 'dependencies' instead. We can drop 'dependencies' for 
> dependentRequired. Would be good to add a dependentSchemas too though we 
> don't use that too much.

Ack, I'll add also dependentSchemas

Best regards,
Krzysztof
