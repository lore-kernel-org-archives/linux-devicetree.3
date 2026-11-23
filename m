Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471741;
	b=LVMGEbylkYFO8mZLSvu88Sx8w+LPfvIM1HkDgFJi4lBhxqQwaDwU21mKShwAqoBjljaz
	 W2dj2rkPste6dUrncdePZ7hHu490PDgjG/CtYxbpmmiiafb5/PzzMG7dt/KqYea5IjCfD
	 W0h8jBBCkrj+TpeUI4Mg9smCXmM4FSZIPS/ziyxfn7/7l7BqCYrqK58GNqGHWQwJB+TXj
	 kGNHOS/X4g8yW7nHmeSupM7m9tpdyhsj68vp84Bn2cZ45976lU13Ks3DMn084B/1KeY4/
	 Aip5EYpEZMhg2lhLUOEtpARVk0CTjXLNEbwE8gy71fzlk+EGz4+uBh6RC2g5f+1OKSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
	b=Jj9Nui0XvpvLDFn3+rdnnnraHThXAG/slvqNkdUSN8D0hm6qf5Rem/FF7hPBRwXgdtCS
	 NuxJS7M+oYP0s10YJH6ZFvdLd0IkkOgqGMfG316YNR9NZvOpEzZVPRclXwwT/YD1tmrv+
	 SxhDhbGEanuLI41UsGcx9Mn6Zj4S88e+k7/w07fepiNadu0gLiPIXBLDn9gq8UhSvao+Y
	 T8FPJ1EkaDey+Kk8uVLvLQj98mHz0KLZ6W3JH9LyyTnlAt9Dztv93CJFE9vZ1UbC5oQfC
	 bekmyIG2P3IPx4in1hDygnPEXIG8U/TeYF43xQelH4dJR1pI4vA2rDjyZ0SzNWCyNRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5fen8zl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4YfQGzt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6561D606A326
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6561D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5fen8zl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4YfQGzt
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuSLj1332564
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=; b=S5fen8zlThJ6oL5v
	9XBb0bL0KtRCHm2GWxYG65Ef8xgZXSabe55j7G517UjzDE4GwEwHVTg9NuooKp2A
	cCfM+ywFd8syQ+XDtTJnvgMGWfIem3WDxbUWsajAJAvUAuj79copV80rurNKFavT
	YE3/pfA/DzJ40PPzbqGWEBQXRoKcsXKCZLfZYLNE3Y3Ebdkc1iqR+Hh3+rZGpeS6
	fxqlNHkwgUGFgD7/9Aaub8KdNk08GrMxMXj8tchQsnt0LtuJqbGF/yVmeGxCMAMa
	SihGfuybYwqntjlPuXjOrZLb6dVRigcmNMhKlM3keJFWv94c/zBohRAl3dYUyLzn
	ObNeDw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g743pmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:08:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9213c7a506fso11551666d6.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471739; x=1796076539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
        b=A4YfQGzttkYmEgzCKJXXcVvapu0i4W80QgJLO/Tg0X54JUghFuPBnSmtxjDMSQkgGP
         Bltb9TEk0CZk96v2E+9z9HAH8WGcs2m/HF03hIR9lqZJVC+Zy4KDv2bgM2U/rHZP5q6I
         Ly+ybfvYxsQZgFfqL+Aum8qp0nEbVM7erDX+4VoQNA1mVvf+eQz12kb0Zf4u5MAlzHZn
         au/LHq2s9HbUqaafXjVj3QGFzHLbsvSaQj59LegxSa7ZduYOi296sUVxPoYdGHW0hyK0
         K6zmlzR9LppYCghC/K8uqqqZPD0jmia5OYVQcrIUsr5s4b/azcyeYsYbAPtR7i8guIqn
         JL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471739; x=1796076539;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
        b=DrpuoTDZhp7JY3BxC+M5nXxS8xJvnapcQdJYst93kt/6YCluEbYzME9nnMGigDF7yY
         GTonOfiM4ATq4lzUxCd5OEOuiVFhmfVLwF6RGiYMbc3c47ENFfXoDJvH3V0DUbbtzUoa
         hob5dIyzV21x/DBnwDzGPUOYPMg6NHhf5Tt1Nuprbzf8WDc/nhFElGQATbJyueNMbTBP
         8CbQpr0I1aFTcR7RNRTu1xfBUHnShrFLY7CyaGY4rBemyGnBHJTGAUPdaj4aaVWVHecU
         ahIfwZGs2X3SKIW6vn7IAnLi8udn09wsAfTTgdf46aIwv8tioGz7xY32irpgw8KL5A67
         e7YQ==
X-Forwarded-Encrypted: i=1; AL+hErEzM9syPc/4MKXOSCQ/2IxGvi6hEiSQCHQ7aEcsHonfviH/KV01Ee4+tNK94DycScvrqgveVRDfAlQ3@vger.kernel.org
X-Gm-Message-State: APuU4Z9R68NZuNw28R9btKkqRTuZpObcOh9uHeuhQZGgaXvQ8Ik+2PrS
	FHc7Tnon9Zy36kFA9ypmhhLVBCbly6FMrlM3DIJo0ExkpgmYoFMCJNRVYifvgbd3L1PO7DDFi5w
	tvb6iTHzUXv77ovJWMd8oLrrqJC3Xc4mw/lN/6uZrsVro/kQGStvSjmD6mnvvqY7w
X-Gm-Gg: AZFdTZf0EkGqQrgUA8yKmsW+OLKNu/WgZEvrPwGystv1DBYyoHYF4E9dtHVwKyiIGgc
	ASUK5X6Hb8xDeJyOOC8sXEmxMG2KqBEtQLRln45HZtWr2VpYdUednJHcPbBH1THl58+n46Gj5ca
	nnVr9BjcpyN5Qhe0uMJIBT0GS6lu7aVk+uDH1EUeeW4ilZgPJaEAHiuCXCjlE8eXE7hicCpiZJW
	gN35CmOzMGbyuwHi5jxmVqKRYZ5KhrozBF5yB76xq4+2G/cHu2VPaWVelv/Fs7O2J5IFOAuBRCd
	BZYyrZ7CM6PAvqR4n0eOunTN8ipFDwsMY5MaC59gRd6n1iH1Yta6IN/gQd0LzUMv0LX2PYdVsbi
	OislrR26ae4SvX2grFIRrAUmV/ZzKNOHmYCzzj/0Y9wFWE3yBeZ5qCbUsG0TrKW08rwFumQ8MFW
	s=
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr2297186885a.35.1795471738576;
        Mon, 23 Nov 2026 14:08:58 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr2297181685a.35.1795471738048;
        Mon, 23 Nov 2026 14:08:58 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm561786005e9.13.2026.11.23.14.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:08:57 -0800 (PST)
Message-ID: <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 23:08:55 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DbSKRpdwGLkiDbQJ1Sz0emT5zY-4vGHa
X-Proofpoint-ORIG-GUID: DbSKRpdwGLkiDbQJ1Sz0emT5zY-4vGHa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfX6FDfv4bXf5I8
 GBtq0gqDICi4rS+6f5e4ZNissUYXyFSvaalo9RsaohtV+ninzzwkDkbSkilRoQ14E6n+6cthw/g
 fh3XAnUYJRqs6UxU4+pGjeeSaJyMI54=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04b97b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-8XAt7TJbku-FhjSX4IA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfX/dKm+B1c928g
 N+o0+r5xvCxfMnAz0RtBkHcVMWg9EkNQ7jf2eXn6YywBwkaxE5VsKXv0Yz9aXG0U2smNhatjDL4
 0o96KinbpuyZykP+JiDCZd4HT3FQXSsavHCM9FAgSrtovmaAUCPTP2vAvr3g4S3gRXGdZY+6Igz
 lPwZTghsMsCNMzGtr42TaUUEBmGznDPQhu9ND3c56FXzeMKZiuTJN5jrpyh+wUAVIi0TiG1BnAm
 9wm2Yu16+LCq9m5Lubcq//bWx5OvE0mWjnQub0ZTdoeF1iH6Qasjo5GQLnS86c/JKP6XWi/ZQDo
 PkJHaE4MS+ju6wJD+jKx9RyccEWcaCOL3VQLw91ov/7cDpFI07Ub5uZ6szF5pfQQQ7hh14Edlnz
 X71PJtI6pk6oQ93OL/4PhRsOTczkYcnGUfJQCX+3TTArkzgKlDv9P1zofR4Oma1Z1ewjATKnHFY
 cK1sqFmD4/7vGIN5CYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230088

On 23/11/2026 20:06, Konrad Dybcio wrote:
> On 11/23/26 4:22 PM, Krzysztof Kozlowski wrote:
>> On 23/11/2026 16:17, Konrad Dybcio wrote:
>>> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>>>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>>>> currently used only in the socinfo.c driver.  There should no and there
>>>> is no in-tree DTS user of these, so none of these constants are really
>>>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>>>> that part matches the concept behind DT bindings.
>>>>
>>>> Driver have local copy of these defines, thus these can be dropped.
>>>> This has no impact on in-tree ABI, but any outside users would be
>>>> affected.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>
>>> I think we can move it altogether, to prevent a situation where one has
>>
>> We cannot move all, because some are actual ABI. I could try to leave
>> these ones only, but that's a bit too much work, IMO, that's why I cut
>> everything at ~450 value of ID.
> 
> If you mean ABI as in "used in DTS", I don't think that's quite ABI
> (again, looking at the glymur-ipcc.h case)


True, not ABI in meaning something agreed between DTS and driver, but
the values are used by bootloader, DTS and the driver, so I would just
leave them as is. I rather care about not growing this for newer platforms.


Best regards,
Krzysztof
