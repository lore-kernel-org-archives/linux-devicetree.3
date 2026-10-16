Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059DD3E7BCC
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143821; cv=none; b=I3Gj3Qw/U7O60wwf3PcKN7c6VnBqJfRZ3VtGn/b2Kkbsd1auKosIxsLVLZbiCHFtx28XPIehoc8wgFqefYYn2k2P3FjkWkt8rA5gc9EQZnU7JmF0S+ifW7DgFwC9AUYyQe0yyjpFJMRl8zGWCkEpBNtL9PCWzmjI9etgkO7G/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143821; c=relaxed/simple;
	bh=1D9mv5SGRa+IFU3D7tfHuRGEPhtf1iQMl2p+LrBh6fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZzYg5b16AyUAnSPi187YxXJqAVtPVZyxSGpbt++21N1hBI2fkNESlt/F+LISaJMvpoXmWLgGaRt2Ik9UctcrWxNyf2cKuNy0vmLgi0I8MgB9Sx8XIQofAbnsd7cdhHD+KuZFCiVN+Nzc1eMLYkSbRCTzUFfA8RpL+yw1e1ONKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGZVjZyP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCD7zrLp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGZVjZyP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCD7zrLp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lgSa921330
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xOMz2w7velsYwKXfya8wXK5ooPMNVK0K+i3nKM/esAA=; b=aGZVjZyPSSM+5Mqw
	RL6BjGYpsGD/b5no9qmxy1EyFLcq1WqcF82/4OV6zv0NrYXAV7XUuYV+QV832/2Q
	Rd/zA4mvzEkR2aZC3QCydUYJSqg3XNQBDilVKDz6Sud3EpNnTK8r8VA5p/DUGnXY
	0jdXEEBgGJLH0UVM6Q/gljkCz1tIJwDvnO9DS+HkgHLOOBCbU+4ISQC8gQeAgnLd
	84JHfTfOL0kjwHDjRXfygtxYJZD6Bi9nuw+73i5pujuO9uyWkwWt3qOQHhF0RYSQ
	K4MlV7PIPCPipT8b0lQmQ4kZOx52vV5qFZZDjBA+Ku9Sr1Xqp/HxamUrr+EKsHUc
	YeZ5JA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3b648-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:43:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535d44e2c23so11094011cf.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792143818; x=1792748618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOMz2w7velsYwKXfya8wXK5ooPMNVK0K+i3nKM/esAA=;
        b=kCD7zrLpoyqFxEIFmAOyqDBILoxvmBvZ1Ku3YHvHzRG+roAibqOwlWGVwcrkaxvl4Y
         O4ztF+1CiLQM7x1gag9BY/Vv042vbi8vns8qVF3AdXEUJT4MCFLeDiObKFuCtcIj1N+9
         tLOJpBxymw1XSw5JM36hiRep11b+payg71wmEW0w1jGW9Bb37KuXKafxC0efUTNmFZai
         Jss3HLNO+zkSp4JeupUv7WNj5bEhmTxIxkrWA5ytPbioVFezyXWriPbokPRcu2U8NdlK
         Orq1Vou/S/JH/cjYnTD48IcNqqEOjrdbQD+TGAyHIpbykRFIzFPRx34QgikQygcMk2J5
         JSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143818; x=1792748618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOMz2w7velsYwKXfya8wXK5ooPMNVK0K+i3nKM/esAA=;
        b=KU6Dli5mi5wLzKIBXmPHKN0Xj4qSEbHRtJyPAdpHjkkUN8u4sz6cZ4KQpadrQq6z4t
         vuWJMzbfmkoepxCJX5LsblyP4HsMwB5soUQN3jAQvhZwkdaa7jo3UYBVYjho1JvpRPj7
         ALz7eafubMEmidtKlNVQfMQFU5ohDK4xhAWJtG2SobDaTgjAK1VJSMGQ5hCscgbRhAqX
         2IorI6xREO9gLpUJ0XQY8Cvcb2X6/eCYBJGMSaoeMhpSrA5p0i/DH4Q+IxV7jmmvDvHc
         T12cmCtqOKhXhYWIpsjQy+hlz3HfQfYm5ugjC50DU9oqKIKcTG5V4T2r17jLzS9sefm9
         krug==
X-Forwarded-Encrypted: i=1; AKwUvBxlGFA+MLgnCmxnao6imVYPSNt9YXuFsWMMgZkCJ1Aqq8FwyFmC3LxtgtjNLgJzp1P1fCb1kydFsF/H@vger.kernel.org
X-Gm-Message-State: AFq9FYKzWfHKVKN2LuXUI5/9R2zEbT3g3mtsLPZLAUs8FJhKf2mxZ3Ju
	xGTqY8YmdnadykVkGvS+RJFXWr97ImXPVrwPKaW8ARiXOueETEMxoQawnY0Q+ZTB9yilhCery4k
	PiDBmL/uLyLJurU/zQnqP9nXI4OomqsFnLQgQBVtW8MuKlGiLmiU8fJlI2isIGp59
X-Gm-Gg: AYBFou1BGUEreemijKQoqlkGhfs6rDuseSd+oPHjnmBpNqcoMBSYL0LWN6zgjqkISvk
	aVDHWPFyb8q8D4cyv/OdlY98Y7UZ6IU2dQxzGcgYu+uFUn7c6y9igJ+SQ7N6ZYpkIOACX0IexQO
	IUrbOke77DR1T524pncszEXIt8J8+U9rDPqOguPPdeEeFfnouenFKH1bARsWl75fmaqV/SsrLCB
	M6OeO6KgYpIRWpEmVaE5bSYNWKlQjmF8cLruD3lhIR5V04jE62iBpr3YUICTs3D/kiOD9xAVsat
	9O47UK+IiasAyih+mqc0Y5/86JysO193xk4u4mm+ohwuhkE7MX6v70R8xjKWfyafSx8FqBjTnaz
	0l/HuuDiBLJNCGXyX8fDynQ==
X-Received: by 2002:a05:622a:310:b0:535:6cc1:589b with SMTP id d75a77b69052e-5359f489440mr439000751cf.1.1792143818196;
        Fri, 16 Oct 2026 02:43:38 -0700 (PDT)
X-Received: by 2002:a05:622a:310:b0:535:6cc1:589b with SMTP id d75a77b69052e-5359f489440mr439000231cf.1.1792143817558;
        Fri, 16 Oct 2026 02:43:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce05csm56418266b.33.2026.10.16.02.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:43:36 -0700 (PDT)
Message-ID: <ec92875d-2ce5-464e-bcf1-8596ce0a769c@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:43:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] clk: qcom: fix SM6115 lpasscc register offset
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfX9bmohcZRx8OD
 hFkePxC57WMZ6xPVr60f+Y3Yq/c4arHwn9faSjQUTEcwWp6ozYDoKhz7KRVEmrEB8VrZ2zeZmOi
 /cfcJpg4GfeXIrlmlH71BMtXRDk5MUl6KF6pBD448qK6ynfAnfwvCS/RMKVb19lZFpRXiBB6Y4y
 DVKyxa6jKhCPYTUlJkCXAFMX04xWdlhA1GsHdKFTRnch7HdgIIa5NvopVa1uJH4Wpqp8tgYpGKw
 8v6CB1oALKuli+qto+XkR6uRq2oKNBbWkOF6fmx+tqmpxcpUtEObPYAtetmpfAmccWxkXhFvTr8
 3SncLJU4jvLRsm+ACZWBnVbxhm6W2ARXkpQW2IOqWMlYbqnr4uIQ7KpKqIXcIjhwxlnt6+cJxqc
 K9KZqMKslCvvWRhiy8DYaOzqHLNeqVRLBKy6R/U5vILFskV784TVMfCnmVNS9OPbtXQNoDTH27M
 rc6yOQ8Wco/5rPQP1LA==
X-Proofpoint-GUID: pJmeFibq9bj-cREUShzsr-QCsi9jnur_
X-Proofpoint-ORIG-GUID: pJmeFibq9bj-cREUShzsr-QCsi9jnur_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOCBTYWx0ZWRfXyJSYOCCSeGyh
 mLN7Zk0tQpD3gFUQ/TWbBUw+w/l/8kHSZDjq61ADsAWxHtehswdgxmM9kMPDNsWjT+H6FzFzdEi
 ktUxdLpC9rVY2hRD1MQst++NkWMNKdA=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1f1cb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=g9NP2d8Y7Qd1zHIpgpYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160038

On 9/23/26 12:11 AM, Srinivas Kandagatla wrote:
> For some reason we ended with incorrect register offset for soundwire tx
> controller reset and the regmap register max was also incorrect it was
> 0x1000 instead of 0x12000 which is full register range for this IP.
> 
> This was somehow compenseated in DT reg property which got it working so
> far.
> 
> Fix this by correcting the actual offset and max registers as per SoC
> documentation.
> 
> Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
