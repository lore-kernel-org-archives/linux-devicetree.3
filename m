Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462896;
	b=3jCeJzNpLfZDeMmI2JLCEPbmsvoio7InY65p8nlea9wdaGnWVm9ae23YoR6IwyJ9PIpt
	 hILIt8l2/E3jdEGlWZLTnxNQe1sBsSngWH8ASaVM0RSaxSlQffxCkUU0+OTVvK8lMP4Bc
	 mBWdTE4OYZclGlb9GUnf/3H4H7vcys/7EWzTICuAJBtHXCOG8UwWYlhbYQpCgBp97Jy1Z
	 K8V2wtQAgxmeM4LLD1LM/2EsN8zw4e2VrNqZRFeZCG7JHNo1x6oC5qow3n6oiSZ+84E7S
	 8S5xbqEZ13weEtqDsHScD2lHT/zZYZUVACeF+mp4fTxLEJO0xYD5M//R5VwnLb5mNhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
	b=0qKcLD4NHQP1SpDz7k/g+OjO8xqRcnxrkix87TkT48BxOtQOB410wT/qhBzR1qJqqWF0
	 w9ZF3G6jFdTVagxCVbtp2mBum+fvlzrpO1YU0nQu2u7IvQ+VXUEn7eAFQXjGwL7OcJjL3
	 v37c4+tugWi+3nazkccWv+CSA16xp9/nLT3+PWxp3FSHThnHoQmbIEOT3QNoy5k3Qi90i
	 1m3Fj1ozOFLXkhSRoxbvSNwtp6bY5E4jTs7C0U06G0cHHgdF0IVsWr0KfbwiAYdR113NG
	 tHiYSZIwtO9zHv67sjZjYMSHz5KRWOMyFLHK51KxZ2VRty+P00VvAVbhhRrDlqAP24w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jWmHI/tX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QTDH6QgW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A48606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A48606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWmHI/tX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QTDH6QgW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH6HV1093937
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iWoAxW0ABYsS0zE9hrZD0wqa
	trqG4QOz/0q/ZQLBBik=; b=jWmHI/tXXYpGKgSop4Rgj1A2WikJEh7R2Zxyde6T
	0t9hhhftHUgi+qC6ulIhceR7XS6XkcMFifkOgZCVCu4jylzs74pybTY6K911PAXm
	k2DqlshdqwQZ8xoA3Wsra6zHhFZ6HExXgaCIKf7k84P7K0MWtU6R+NaTllVBPIhe
	aaDqmnwc1NV7AE5jzRv8/JKKRi3T61wBO9/pFDpJsmPZzPFN6EYJKqFnpSHaVF6/
	AU5FigJDqdkjY6NR6P+5NP9q6VjJHXSRiFcEvH7UEcyM54/sOkoiE5vdxO8amup/
	1H9Y8ANMNaZVklcQ4Ik6ReDEaSYt8Xhr8dsLsOYKsHdPbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t2wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:41:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960bd17b5so614824185a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462894; x=1796067694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
        b=QTDH6QgW4De0DHMryY0EH952Dx0qjdZBROc0HEeg8KKvi1sljEJ3IQmQuJtJtEpoVb
         Gx1jCi1NkQ6cST34Q24zLrfopjPT8XahTaYehTLP6l2+K4gw13J4uu+h0U0r9X5QDY0g
         dS4Estv0yYD9hjMWAY+ZKsvhTCvkQpJOVRSC4Jzy8raFOk+YUV9IbaHccI07miSPFzlE
         eODOfzVs1Egt0CM4a6TUxtlRWzquFf+A/Yc8La3o63MvVBN4nDt0LD/4EXxJDryLHirw
         aPlPjZi5noG8nb66h1ogtBc+EDFU/DVreEKhbUTMe+KtuRQHn75o1962/aPmy8xk35mK
         Hz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462894; x=1796067694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
        b=2yGwMHCqUvm4DMrcS8cFZj35MbjDjNAiQqG2bn18cbH6ORSQfoypaOMJKQJcHrnqNb
         huNwkmVOm131XHAZjasQ/OhcwMSA1Z+7eav/935QMddgowBxXbzcoym3YmiyI5ktHz9m
         wpQqMM33MSPCFarC/Es5DfO6jirMcjR3LjnF0gM7Sn8hfUzblWadxh44G7/P5++r1dag
         3ZxdOx/g7VUIx5L0zTVRg8AIlFSdRBhDfHgBv83YeIwAqByIAgc2itZV44XGDA24DX5b
         yoBgoNufHXLUJtJuihGAb3AeV0aqStu/9zWaEf3W0H7/oxucDdvsQtnTV6kGUQ+1OYYx
         VoAw==
X-Forwarded-Encrypted: i=1; AL+hErFZOGrX86eFrE913CjkH5yBby/bsyKpLBn0kJ1kTbrqDQRhs+pgErWWf6HHU90J6n3bxpScxl362lEI@vger.kernel.org
X-Gm-Message-State: APuU4Z+ytzwrLd5wczJ+GAu9N/y3vcR25Q90BwENWtkOeA2v+gs8MJPj
	/iYLd2FsDpMQ8nZT4Zdt8B6xaUfAF2JeBm5qd10jCFdlqnp2rcx6HjN+4lhefDZoqff++rcCOZ5
	fmsSPMYC5fc7Myi7lj3D1KPc8t4/AO/UOxWE+vL9ZLRzN5mAvOddjvm3iZDGJiGBi
X-Gm-Gg: AZFdTZcJcOjiVzbJcX4pCC+bcm0cRhCTQoa8MA6mzTVU4OlOwEddw9eHxU/ssAf5Vou
	sqYFY+ocPtiir8Ix/HCPGRnbOl2TMcjxMSmE/eb51MK9EcOt8ANJwyinoiE7/s+cE47RfxhCJq5
	YgpsGOKF9rmg/MgUgxRkKfyjsOu84CqBLnl2ocmVYpKyoloPAAKFe9Ov864LBMC7sBow36gtzjg
	7tMpeKK9zgx0UE79CWXtVBV2vBPi+i2dhTloVOe834iLGSKVjJlJO90FQfCIF79+JjToeiyHdAA
	WGmxQzKK0UYd89dpGYNmMTrRNDCZMk8xEUrWhnolxh+DQ3Vom0DF+BWVFyhKI93OK8NLDPSbVEi
	XmHAGJC4bSPSQ7yMinfz9SSesKkdxMLiU+iTDume2P2JQHSgH6Hom0c0nEsoASO0i
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr2093266985a.49.1795462894076;
        Mon, 23 Nov 2026 11:41:34 -0800 (PST)
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr2093260485a.49.1795462893448;
        Mon, 23 Nov 2026 11:41:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm22227959f8f.25.2026.11.23.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:32 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <tll35ljrujo7sgz6fesshor7idu7ujoyhh76crbe6xajc2sar3@6uvambereae7>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: 2t4glvUHyqYfRfRejUvuLn9RAZwHw0GE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX/KKiM5aEWDYs
 ogXNos6WwGROA6kfJr3dqkSIu26NUOGorC6MIKf8EQ1JHW/JhaZIQea73i5gH+Rs6prW3atz/Dd
 sEplkqtZ6Jn9mN8K3BB1vum1FpnuZTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX58FMGQe1CYJQ
 hq2VHsAaPl+LqSOBK4AVQMlyigFfhEy34ol8Y3bB+s8WUTxPYi/ZnrVFRdHTJBD27N8PVspiSzL
 IjGhUd9H/d4vOsQF2QYSlD0eHrV8JzeNa/Y8VNonHlqT/hq4wyNCnX/QlkiUeS3XAbgB4qbLZSg
 HUIZojIB45jMWzlG6hb3/zR2U+3KD9rW3SoLblnQ/Dj011IJSOuaA9boH7otvwc5EWCBjLAWRy8
 3yS3kfAHwm4jSS0uQQWFtwuu/cYz185qfWQUQTQPDsILoHLANshPV6ECbi4S4Xum2XWpMzjOfaa
 2QCZDxlKQYnhzgW3efAoweFYUgEFcoRS/KsK5x66pPpNwp2mgHH0/eH4HYyLT/uFQVOFb/C19XH
 d6w+1PMktJiTTYQz+ETo5MSL+1A70V1cnZtsRhyQ6VQ54MxN0Rj8/55+52rZlv/glxf3LMuwjY6
 sZzfK/Smxzs2Lpo3Kmw==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b0496ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mDVvi5Pd1DWatKlo6wUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2t4glvUHyqYfRfRejUvuLn9RAZwHw0GE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:45, Bibek Kumar Patro wrote:
> On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
