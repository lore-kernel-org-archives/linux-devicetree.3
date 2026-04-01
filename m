Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D831372661
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043665; cv=none; b=deeZyKk+cCjiN3XW9eprpK0/lL1oGxBUYdydhWCI9jCzn8S7o/IU2rc5KfJVAJTE/GVEY4GpaK4t3DmUKhFcVS8eoH0X/kPc7wF5yb+s7N60yCiCB5kHA8kmtKkcBCTDone1gmViWF32lXawG6tAmYRlDpw11TjdZC47vqjXU4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043665; c=relaxed/simple;
	bh=9+wmrLVVKTWSQFvNMtg3IxNd0qr/4JOuXA40u2uRsgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2PosWgQTBQJNa5+y0EL1IuLHZlydryIneNuLA6QG5CmUgf1IPZDnwUYmFuqVh3B02Ml94/W5UPI77XiAUShkL6CTT7EIs5JO76+pMJ1tXFS/CzkmpBi9JPRmJkLOaczzE7rrTUVME+v8w8maKFoqZID0XCfh6t0GKWk18Vz+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pj3fby0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4hNjdc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pj3fby0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4hNjdc9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318MHdJ718548
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xv5fQeIVFcuEhKMqH26LWCz9Pa8e6RKtrBukupBsfME=; b=pj3fby0Irgn6cFb5
	wKDjUOf6IJo1vkaC+dyrvZMtL6LKczqA+0o1O7D7ubjImWEN7PMAJglXMwbfm5bB
	NBcigQZ0/RTlK0xYcKyndO+NHSahhjzTMvJbh4u1m/ZeeRshDualqVzDWzU8fawz
	7oJ01vtCl5tzI1Ry0JxfJTmaNKddro5oAx4yqs9r1RpPtq2QAJqM93vZjMl3VVns
	vDNggPaA7nhH1KIyGF8jGukZ7YkTkWBGaKWF4cAmZRmhowd+MNnHCd1juuDPykUE
	m5oCDLRWial0dMZr1/lN56gRDl10UGRMA/QYU9gJoZ3nZp2qYUdl+KKuDCxGNfQB
	rrZXUA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kcsus1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:41:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a016b99579so12126746d6.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775043660; x=1775648460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xv5fQeIVFcuEhKMqH26LWCz9Pa8e6RKtrBukupBsfME=;
        b=H4hNjdc9kPOnssLRmAv0xmmaTdRf8P96r2YBXiAfXhYijsTfNdhJifpT/XosB1wweE
         Gw09uU2sDAwgGMUobv9feaZ43HzpbQJQrKG/dIqWqz4+2e0Lh09aKWB2I3Vystdgp2RN
         gIzd2s/lAFcDi5d38C3AHMNWX94xx9LwHw8Gom1lTfJF00UDpyX9IE8rlR4XiTzuZkFM
         4yFOXGAShYynLTAET/FnoC2y5mtgJlHDeup5r1J8aaSOkt83X7bQx8xUyuNtYGja5e7s
         Qnq/EsTet5QA9MDQrNfPJ16H2+BugPpUundxQZNhiaZKdAHMVNa4LvLhCMhxlVPcPcNT
         kp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043660; x=1775648460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xv5fQeIVFcuEhKMqH26LWCz9Pa8e6RKtrBukupBsfME=;
        b=tAX+HisA9tqRHNWcGAEmZt83Po5efLZMvx5absviomdphvVazhaenjnAHLBJGg5gXc
         4XKvScLTieUhAzYgglBSF38K2e21mR4ZjQCepMd0KmxMcxo3Uw7OdELmqHeb4Sjppeq8
         k1fGAPY3PEKPFF9c0e1FpHyZa6qYx+YWmD3udOHTtjYg4FZj1KuvXyBwcDAVt4WpXerI
         KcejameJUd0n22HgMvQlM/CVYZy63zkpEbq7GODae1WJd8gcV0i/G5hPMsoF6Z5F2I51
         WXgYAp6f89iHToPBRwpagOMnbJzpxF8nGElEELZHzmnMUjUPI0DeBhXv+zBjzqFIlERx
         OHoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS+25kp87oEqscKNmxFFqFretarc2AL8obg1plR+34s5jcPvVTn+1l9ZMNXulhwM8I+VJ67vZAbIhd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu1dKlbtModzillhU+YMva8LKNniBMYQtHuu4kOmGm2xr2Q9wq
	mgsO2rc7vf4SRJqr3e0dLjtJHRCmYEIugCNmbWjsA3hiuDt/zLrXorlSzvWOvlVk7nC9C1LIyNh
	gpnW9ND/33t7bvFfwLgXUJpJkUizjy+SRI6k1BatakQr6gubblfgKSbWVfojWKmdy
X-Gm-Gg: ATEYQzx5AbcQknkDoHGZgJhgHkrWlmblmpaaBnFjysHEBa6urv8Y7Zqgh7RpBYHNvBb
	6VhqVWpJnXkuALLaWTPttBBXC0LFuKawu1oYLuyLv6VAfd8QEhiUhQUGkzf+KnVqpzCczhXL1Cg
	9a0MxnSafsaQ6rD/6CsqdpQmZT+I0TqFkaMKE7ldCGxRmGjNGbYnkRWMcEdxEKQrUXzXgYGZ/nR
	7L15Li2kDVQBXiZvK6fRSwBwnijCCpO7AneLRUV6co5wCjQ24w7lwZutVg+Wv7KbP0+ekbayjOa
	+XCymZokn99l0lY4E/FHGEI268ZPdj5nzxxm5bvZOrJDJ674gt7MChjYPZCD5jgcFVlCDcgqiRb
	5/jIvf4+9x3LC1ZO9MkpN1LKfziqzyCWNKFMye7gpwKDY+B/ZuBqbuzW6upTwBpzmVYZlnR6UZP
	qo8VY=
X-Received: by 2002:a05:622a:1c05:b0:509:a3c:e390 with SMTP id d75a77b69052e-50d3bcecc15mr33113501cf.4.1775043660267;
        Wed, 01 Apr 2026 04:41:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1c05:b0:509:a3c:e390 with SMTP id d75a77b69052e-50d3bcecc15mr33113261cf.4.1775043659901;
        Wed, 01 Apr 2026 04:40:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c0219ed95sm137701066b.29.2026.04.01.04.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 04:40:59 -0700 (PDT)
Message-ID: <7b271810-c1ab-4d07-8364-e4c30588722d@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 13:40:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: increase fastrpc compute-cb
 session slots
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
References: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
 <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNyBTYWx0ZWRfX4EI6EYxi4Gqd
 HnzjXNy8bi9s7Tviasjny4QFyfluXPzBs/McydTmX3axxHHz38yNTJwcIXm4oHBp9xmzQqOIsfX
 0X16QzYllwZVN9mEK+5xS/pYcCcCkOtCJ122wyW234AinHhxSp7PiPM8Vh8SGO8nkOaao4NsA/v
 BaJRLrXgumn3o46US5iNr9H7P8AIfWE/a8S/YN2I6k+raC+qScNO9LEFgKP+l6EbEM+4BKW0Pbi
 PWRGDG2CMYuLuL0vS/L88WFMKksT3fNqD/72WyUT+M3mZezofEmr4slMryGerM6R0iy6XLmgqlB
 84B2hKBoVQt2k9SyQgr84K4Ae204l8w2royo4YD5mBYqvT9XtNzp+pM4VocWFHz5yAGL+PDYg+I
 VOYqghOJ5UxnhuCsXAhT7F+kcYnF0Gn3Z/CnUzOrDrnRg49e8o8l3Dj+X6Nb4gvgnmoD0YuAD/r
 9bf/RmyyY6vHGosyvtQ==
X-Authority-Analysis: v=2.4 cv=KNlXzVFo c=1 sm=1 tr=0 ts=69cd044c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZEI62NPqEYiQVTBb8BAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: UOc_Ty0TkTY11SL6k2gB07IiHrZiAAoV
X-Proofpoint-GUID: UOc_Ty0TkTY11SL6k2gB07IiHrZiAAoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010107

On 4/1/26 1:33 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 03:33:45PM +0800, Jianping Li wrote:
>> Some workloads on Kodiak can exhaust FastRPC sessions when multiple
>> compute clients open contexts concurrently, leading to -EBUSY failures.
>>
>> Describe the compute context bank with qcom,nsessions = <5> so the
>> driver can provision enough session slots for the compute-cb instance.
> 
> This is a software property, so it probably should not have been added
> to the DT in the first place. Can we replace it with the driver code,
> allocating more sessions to the last CB?

Nov 2025 => https://lore.kernel.org/linux-arm-msm/53644b36-2eff-4b1c-9886-591afee8b589@oss.qualcomm.com/

Konrad
