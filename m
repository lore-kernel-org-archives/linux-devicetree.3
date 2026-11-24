Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507338;
	b=kkub6Pc/sd01P41yRH+zeaQ1EegV8FXTgPV3/utcTx8DZtDl7qTVeAamnLH+7AJq9EmT
	 9+leEPOFHkgkDrjvGu620NqGrig1i/LsPPC3kziQWArsZ7rXlG2k5MtLsNNQHAbJ7C+TS
	 PguDbJTmAlTWfQIl0+b0Abo+6DxLCaJ4yk6mC1ILoRZeNIrYmK6FaTdMfdaXUzs3F44hi
	 FrU1emHWB+wcOVehs8p5hgtozhXgiJ/+FcQggcoEfoSE+RnV2rxbwzTYaGKtNsanKx0GP
	 0nlrR0LY62KfzG30l6WKHoN5TTQCVTj+18olzFIVOUu3Mco/nEOrvockDz0rkKdTiWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iNF8vqJ/5ROf+iwizzo0WHfuQJMXjmgqANoV1I9erPo=;
	b=LMazV191Tfs98FRCHCq2vzSmdi4Ri52tk2Q26L3BTScvJecw1emZsoMIxg0tie0FHCAP
	 fdakcZoeoYPd0qDARZQzKa4b7tP3is7XJSrEv/ddM0q838rXIEeDDZ3eeQeBYBDihTw30
	 MXI95MQa/Vd3GykPMlzgkUz5nBk8UbMbc8IKudO7ZZdT5AwMtKFRG8CQo2kfPoIXTZPS1
	 u+KwXpmNqYJ+Z4GF0Dcyn21fUK22p9Zbgk5DMJa7JkWg8qVmCPF3RG+WUjYLUbtRenlQn
	 51VjA+lxuDsj8K2f9pAdwepfAg8GXei2559ggy4Y0ZtN0uyZTnkZpF+E3YgOhutZeyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RbMOHzuS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sj54s8dQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD630606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD630606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RbMOHzuS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sj54s8dQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kCma646415
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iNF8vqJ/5ROf+iwizzo0WHfu
	QJMXjmgqANoV1I9erPo=; b=RbMOHzuSF4FF0iOx9riFqu+D7O0nztByayyUsTJB
	8FBW5tanuFcTlzgNymchw72/fn+0eQ2VVtPjm7lNykaWFu+5mkkADCrWkD+dk7qU
	32rmtfIbkOX6XEQqMNKR7tgaTiUlmWqbL+N0SJxbsqHMjwpiDCWCA8ji7xwGzsF8
	ctnE0hQQz9OKwHGimI4jE37J6bSFam2+86DhzWaMKhwt/UtUFb9fSo7/zS3RBFaS
	LN+fr8OISKx3pu0ROqUkD4zrNaH/9nxNhaps79GTZ8Nj9aryNFBA3tAngDmmxRCg
	hvtJNHT/h8wIz7SozEX4SdfYVif6vXZh7wUTGMa1y98faQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd1hnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:02:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5297707eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795507335; x=1796112135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iNF8vqJ/5ROf+iwizzo0WHfuQJMXjmgqANoV1I9erPo=;
        b=Sj54s8dQNJUD56p1jcBPS9SWgWAnwfGVb3SHx2k4g9CLK8el18Dy3OhWXa6G5GJwbO
         TKYyup8W/RwtoouLBigUVdKdjQoMNqkCyK827ncp4JBivdIiYxX4EbkmpBZiw2j5ywOg
         elHdM3Kjr0y3rnh9MJTAwsDP+XpwdghxziNKf/oD6doDGfzVI0rJQa4ut1q09V83Lolf
         oAVIVzedl2YAL3U60SQExs3gxR1yaEgwRmOqFvvW3FeXc7Yjisg3f9yHfQfiE1tw1hBk
         ym/QpsbCmk5FMdeOHfiDXkFzEW8FfVncQdA2hVLx5ICoevq7aIfCpRcPUaLp3Iagr4V0
         Gfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507335; x=1796112135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNF8vqJ/5ROf+iwizzo0WHfuQJMXjmgqANoV1I9erPo=;
        b=BZefD4ZWlBWZDseXvxJYyBqC4vDj+xu0Pjrfh4rZO2FhiVuft/I+HZkXabQPzPtCXn
         S74v7HW7goMAcU+8FhXEYn5CdqlHSfzvuXj1zgLeslUbd4qKbi8kKfCwGtF/dLRlDvyr
         twBbPVJaTd2nVKBT2OxvoRmQvr/pVlyVvJTLlPSigr4xOu1rzkvbYSm9wRYv5/Y1FlEc
         HDJubUdFW968XC68zuVvu2HP3T0XWL97NxaRA/OYQEiqHJyp663Yxr8sYf/vENNJHRvH
         8zVJLVi9688hsj8KYjx1Eh3p6W0Dkwi9pJLKCERIFtaraYiDOkOWeuD0qwfJmUOFpE93
         nhCA==
X-Forwarded-Encrypted: i=1; AL+hErFu9iDf6E2lKrbtipg7Ou16MZrL+MIGkX/Il18jXwM5QhCaabQ+W/rwgHxXoifuHRM3AE41Q5tyygiU@vger.kernel.org
X-Gm-Message-State: APuU4Z/01bpe0FqZXGN9fRSg3Ftq8ZcCppNf/05tNadqzw6M4XYftdJd
	0HIovRjVMB0OzAEzOK7Sc+UvWcSktDXzjLvJvYyLb40u6BWp7iflf6IEqRb3MpaJFQXNAXLR/9Z
	Gvzr5d2J0tQDacVduaxOais+h9kYT61O++Eo5Nln6KMdYKlvvqmhTL8z7jqwFJlfTelqqQ3pG
X-Gm-Gg: AZFdTZeaxseLhETKqOaOEDAugz4WMM61tpWONNXJ+VfeMyeol1TAUBOJZYBHV21gNIQ
	2nM8YzfpLR6jNZwmftZdAaapx5aBHWfIxaI2Y/7oa2aoQUfZUVzJBVI5SYK76klxC9QJdwrGxT6
	rTCYZZr6aulkhvdHjPqxK9wBPFLRrMc6DRY01s7nnfEWKio4uB8Upw586nIdaF89sRr6SX19QZB
	T5QQW9QWmyo+BSLMBuXaz5TitBrqxwTqZYuyGJ9bdlHs2Q5/f5auIXrkjhN7atHo72rGrxhW+He
	I0l96ISOyrSp92eSZGZCdI7akvADeIKo7GDJBLgpZdkIJ8/PjB4xPq1bI/BOY5uo+iI5uX/NTdN
	0/y1dujIDaUG0p1PzdQOd3bT/YhEZLEHqlmCfiD0XOJx+8JE1B3n81mNqWTUlTTpFmCfVifaSxA
	UEmsnDcMoqC0izDOc=
X-Received: by 2002:a05:7300:f68e:b0:386:240c:19d6 with SMTP id 5a478bee46e88-386241b6d72mr12165665eec.6.1795507334818;
        Tue, 24 Nov 2026 00:02:14 -0800 (PST)
X-Received: by 2002:a05:7300:f68e:b0:386:240c:19d6 with SMTP id 5a478bee46e88-386241b6d72mr12165646eec.6.1795507334283;
        Tue, 24 Nov 2026 00:02:14 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm50432771eec.10.2026.11.24.00.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:02:13 -0800 (PST)
Date: Tue, 24 Nov 2026 16:02:09 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm6350-lena: Use QCOM_ID_SM6350
 from qcom,ids,h
Message-ID: <awVEgbFXWII8HtSr@QCOM-aGQu4IUr3Y>
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
 <20261123-sm6350-msm-id-v1-1-99482c9ecc48@fairphone.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-sm6350-msm-id-v1-1-99482c9ecc48@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b054487 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ecAgE6h4Pg4Z-y-LirQA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMSBTYWx0ZWRfX/xsjNosNXQVC
 PzJxsA9txky9/JlN3kifdVYZPEAnK/wGAo88SwZDaJmwkjW8NenM7MH+oKWtmFgZi1uPOwKvlAG
 DNhUIeegLyWx1o01RsuzxwkEiOw/LuKaxXlYgbbAul5Ra59+cCqodJXhHKBL3FpPSHNM7FC0auc
 FBsXvv2zkHhPJyVIddx3p6nfK4Om+UZExS7BUFJQhDAn5UlHaoXVGm7QoYUTPHHM8GR0Jn+tyPL
 3T8VZBK+1NYVcsARm0Wq/SCfvSeekkqnYb2na/HyxmMrM0akShUxKU10hgBeTKs5Jds1G4CL7eu
 A8ZQw4faVcc6Eu4INX0yia7PTtfXGPsX8xblF63kldvCJGuhtmv/XpmcmT/iOpZhEHnJ8PPtqD4
 4+RPHOXxDHqt2M7jMNDHnl2tBqwdO33Sk+8wRiMjAlZZsZi7ML/DVEH9Gjrefb/Xp+DHkAVg5t0
 VgB5aJyTTG7MNtA9srA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMSBTYWx0ZWRfX5b10ibzfzixB
 tRKMbohcR2JurCMmnqjShNkrM213Gfulzp4W5dU7HNVWQVBM0GTpbLnb6gpkkeAUzygI9w8aMZl
 ScmdLTd0XSXLBWfwdWqL9aDYFWwNnCM=
X-Proofpoint-ORIG-GUID: E9tS6OUlULiQe5LD7zI-99Ok29hzSf-_
X-Proofpoint-GUID: E9tS6OUlULiQe5LD7zI-99Ok29hzSf-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240031

On Mon, Nov 23, 2026 at 03:46:33PM +0100, Luca Weiss wrote:
> 434 is just the value behind QCOM_ID_SM6350, so use the define to make
> the meaning of the qcom,msm-id property clearer.
> 
> Also while we're at it, drop 459 (QCOM_ID_SM7225) since the Sony Xperia
> 10 III only shipped with a Snapdragon 690 5G, not a Snapdragon 750G 5G,
> therefore the second value of qcom,msm-id is not needed.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
