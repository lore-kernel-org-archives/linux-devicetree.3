Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106735;
	b=JUzO4cKFbd1eDv512cCmCffjt/13T4bUy4laZstWKZe5fg+jtzt2mCyrjlXCogRXxxky
	 wdS+mFgzzrGJCDZlmy9+IvGmxsHx8x0neI5/+ezOtAhy7ZhDF6GetW3WF6/Q89NygH3ZC
	 2h9IYLYMky+GtGIjzEqiC4lCmRsKKS2xBUCNUSkWJUXBGdUHXQ1/94olNVgsho5YqzGIK
	 xb72oUzEJG0bTx9f1EVehjjHjHSBuDdyVEYJ1oyik67U4GYUHMYBgPe5UZsLhoKRzFk1E
	 XDzleo1Azy7plk+N1ihvucF+junefbN9BFRZfjfvIOMXmpVr+tMrXoRWFdxmvjJEPXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106735;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
	b=oLXPuh4J+V284A9fd0QbNer+wOrfybpgC1d9Um/pkdaV3ccxgBHA1bO/9+sxS4q/AjMZ
	 7vNzx5XDDHxepEEEWRjDQm+l3zKIhWRYQ5Zb1mQjW7w1S39AoSUF6ATcTjP3856d4IhMF
	 P2qz5mnjvaRbB3i5eQOaUd/lwtSdqf6ThkJDk73oGZXpjKVKYbhxwsgINmSiyLSWb+4w1
	 eeCkVdvNauASXqqiZE/v5ANFa8sPwSGgEl1GOwvwLHIUGnnaOPHwdRfzBScUxTimwqq55
	 Zykyy0P+nx57rppDcsWqR8wkgcOBK+oOpGs3uONbZNej1d8zila2hlFAHCbirtwtaXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0i6sBX9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AAw42nz6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FAD606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57FAD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d0i6sBX9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AAw42nz6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCWL3026392
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=; b=d0i6sBX94Z5GJjN+
	2clrqpaZZ7pFbAJQv+7lWo2nSHGqPVYiQlDEho073CkcRpPw9bdHwvp9GzRYLtVi
	LHoXA1E0KX191jlWuNU3clKwM1s8GSCj/0KrC3sin4lRnMg2ZBvUULT3azjVPLXD
	vl6SXZHU9lDtTsU+4Kxc1yaEB5KFYEWzbT8BvgexbhzqP1oP1qlaAs9Vu+I4VyOU
	0KZ/nYyBoexKxMNakYR2K34ZA3pk8ksn2KXqrPZaohBG7HSjgUGW1jXFHt1Eb44v
	icRpKvhrdWYKiE0ZrJsMTYSYW0eHb+mCRkeMv2w7xRr7cVjUwMHsYkHhniqbKULi
	SdKubA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91akvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:12:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso8569390eec.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106734; x=1793711534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
        b=AAw42nz65DBqkgcxnnscduH+TFqi5eW2svsImiffOsPl8VzpQMssa7Hm7c+YyL6UsC
         wE1Axf/BgpxPAX9eiO/LbJmVDbmLaOAAkg4t/I7zAo+6lvcksa83LGW9NCy8TMHojFd3
         aJhUijSq7BKh1PPZFoWb/Uyy9HI/9V/xBoOpzQ0tvXVuNWVuGQlfXHp5hzq5jziLB+t+
         yfQSL6b+GjCabWizFv41qu8pU7b0WcJcqhXxOTgX16zRr+Dc+XTYawZs78hHpkkJDWxq
         eqevOcyHKC1ysxWOFGzOvq708UqrA1ajEhyeHhLjkmgsd7Ss3nT0uUT/B/qsX9RBaFdP
         kZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106734; x=1793711534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UapQjdPeDJO9VRKD4DDhYTxpcbEq19L9L6WakZY6BIU=;
        b=VVWhaJ9lJOBATCzYwjo2r1AIkKCt/Bej26yN6hKNLWCSHuK1n2MynbeFxd0DHgHPhi
         +YYgLx2UDx2okazMMZoWor5FFHkgNGSVbxGc2aY9g5dVyV2wP80jCyqA3XTvueWj0CDw
         ebSY5sx4MOkyniknrl9TqPCKJoqlf+/nOuJpT0RdyxUVJlWxMPkRBVhX91xaVXZ0G5ZC
         BW8DYXoDSYI9lwqWdbSlqfc96QxtZW90lzNyPS1qj+55p/ii9CLfQ6d6NiBuhYyknhf/
         ykkS9puBcgr9AOMPsH5hYg6qUdFT9Qx+Ap1pggl56P/ialPDfvW+uoX3WFbloQPOc/sd
         S8ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn4/F3AiYrZ3Xo0mLtF4q56Zr1UnLMWQjKJHcCFH3iSMWCcH+2Zw7j5cSq6FSNu5vmNiQ4dVl0wCpR@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ8E1MINjhV1N+HRYL+NRNW9VMx9oA4XQ2IT8GmNQ6wkeo7pZ5
	KzMJqQm/DSJv5SvXS6Sa5vadXkTR69TtfwYAjtfwPvnBVP+OymmdgsTuE+8sVZNsJsD56h+J9nj
	ALyGzQ0W5b0tIRAw7lPfsAB1sXwtfyF5gsx2cUV+QIrUWjJl45kUJOZ6mYW3kv3NS
X-Gm-Gg: AYBFou38tis3/Kh3D/7yTEYi7bmDFOZ6CMXxkwAuWibmC6i7l5b+k+SNsadQyBzCWHi
	HBXT/ZabAWCbaZOSeNAZWfT+E3ClqWs+aqlcgFv9lHow89mWQ706XZCm8Vy1rC8rqh2j9072SbB
	7lZjrI0FhoshrVjYDfefyBAhTX34fEEuJFFa68sFyLC2w1pXdhaZdDlQBBXOprfyzpLjEhSY2+5
	SEgTSLiDrDNdQ9Dy7ycUOWG98vxT6Eq8sC6hKc3Fyc0WZ/8NHZDeNwijkn0jwGwPUA2RyhXnlWn
	SxV6fhMvCVsH0DFv769nfHN+vm8dpkwwL6l12YTNRDVJC1MBBW0IfcgQRxvGMFpit7V3OvSW0Lf
	T3N3Gs4YKxLVCWLEHlGxNv76/gw==
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr12973447eec.11.1793106733541;
        Tue, 27 Oct 2026 06:12:13 -0700 (PDT)
X-Received: by 2002:a05:693c:2807:b0:369:eec1:1d7e with SMTP id 5a478bee46e88-369eec12196mr12973405eec.11.1793106732892;
        Tue, 27 Oct 2026 06:12:12 -0700 (PDT)
Received: from [10.218.2.197] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a14383b02sm7325798eec.14.2026.10.27.06.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:12:12 -0700 (PDT)
Message-ID: <e2147521-c736-4cfa-b482-e534a2a11a72@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:42:04 +0530
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
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sm6375: Do not mark MPM as a
 power domain provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-6-ac7f1a0d5638@oss.qualcomm.com>
 <5ad62m2ix47ynkq2ikghkxdqpcyv2tjixtojdobpjpdwbkkab6@gjklpaosvpk7>
 <114418ab-dab6-4772-994e-5babeed72b65@oss.qualcomm.com>
 <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <junlahp3txwwj2bs6pi3lhlvidxcp3zgvszb74xbciv4n4ymvo@tfyhqi6tr7mz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _Vrk2fffWmAa-MtY_19VIIe1apNfweHc
X-Proofpoint-GUID: _Vrk2fffWmAa-MtY_19VIIe1apNfweHc
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0a32e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=hn2XikViVj-BPx_B1YEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX9/Tz5nmr/UvE
 35HGVApGye1cKuQcnEQczKUHXD7N0809pZh3qfGFMpG4onHlLKzNcjLLFlor9O1YsQP1Z8jt8Xi
 r3R5iBKuAEJ15z4EqwfYVOFl76vKAZe2N5NIpkHP0NYtNP+blS2F+a2W0xh28zO8FbXBG6LjK1v
 WUxLhl8hwWMTQDMxu5hjrhFGEmVSk+xm94OJQex8R048KLDjxrmPUj+jXE6s8u4Pg3gVHDqltRY
 n8KBMzHnuWgSebrIQ241qS8s/yNQ61bg7/fNlARjK6mTrRg2w144ry8a4nCNca4D4HMqngXhB1j
 Dqv3ZLQ4CvuP4sfIRbTIDa3i+/VE5+7UoGlTttlFRBuc3LDDc0TMpz+0zdRWZIiTOQl5nWN6oiH
 i7CGe8+54h9EqmkYEvWq41IYto6vYDaupe9QUsQDsNbZgtZ3r+KnNDpmsXylzHoZ/sCKeLivdQ4
 c5hszyCusN6fW/uL++A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX5LVry3ZL/ssC
 6pk4gdDxqFQVvMBtIQReYp/x+OAIyhDCZMEmhpHMD7mSANfDqZFtP6XlOxgCWvFVzGK0hWsTnkw
 kRJeG5KzMvbYVgphR884hkscts9fQi4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270052



On 27-10-2026 16:29, Abel Vesa wrote:
> On 26-10-27 11:23:25, Sneh Mankad wrote:
>> On 20-10-2026 18:30, Abel Vesa wrote:
>>> On 26-10-15 15:25:22, Sneh Mankad wrote:
>>>> To make the MPM design more logical and avoid probe dependencies, the RPM
>>>> notification is managed by registering for CPU_PM notifications.
>>>>
>>>> Remove #power-domain-cells property from MPM device.
>>>
>>> Can you elaborate a bit on how the two phrases above are related?
>>
>> The MPM driver now supports two ways to handle sending the RPM notification,
>> either in the genPD's power_off callback as power domain provider, or within
>> the CPU_PM notification framework. Removing #power-domain-cells instructs MPM
>> driver to follow the latter path, which as explained in cover letter would
>> help avoid probe dependencies.
> 
> This should go into commit message, I think.

Sure will include that in commit description.

Thanks,
Sneh

