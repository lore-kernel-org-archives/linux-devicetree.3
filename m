Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1613A1D0F
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614335; cv=none; b=tb2bE3Eu/Zy3HU1oVpBHx1LT2rbDLUmi8Z48N6govr2P13mLHYbOZIBzo6rsqmVNkGF9muhyk0ZXMMRbm5XorVcnTLsT5ycuRxC1oUHj4zE7ESkX7TzkUvxHwN2hd7ycy4vHdkFGKKl4o3xjHYTh34LAMKUCJpnAtwXd9amXt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614335; c=relaxed/simple;
	bh=cJYXum6MxylGt6d8OEGYQB6VHofL/77zcDfl09y6BIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUrSr5Qo0DjFWG1C1NcaqWuSG0sQlhupl8T/cfFSGjFsh3n+JseGeVixWhcU9t8Hy7osu5YDLS5l9pBGJQnroBYWjzE1/p9WLvga84dWt+0KHD7pMWxbyqtXmffyESSN+ASgt489BQosb9Ju3HzZtzIGkvAa5wC78oyQ0GbQgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNQhgU31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAyQsqju; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNQhgU31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAyQsqju"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wuTu2846152
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZJUaWKKLy7fIGvhQ1mOhekag/nz1OSDsdqdjemihQY=; b=LNQhgU31cE0h27yQ
	tSSoqkdrmG4QU1Ab4SIpzHj8eRrzgxEjiEeZLEWy1FEIadKyEAfZHrAi/SXovz1w
	LRQPOC3Z4eLms/mFGhHVoDjptEFvlxa5L7KwH2UCKOCPP2njPyYFaJ2tW59ahIWT
	976WgL4SiksrCnEz98A/dTu8H6hV+wQyD2dhrKWVf/WbvDuRVNYVSwP5UO38Djsw
	4xwSz9BIXJk83ji9qDntErGczzAUZ+CgocYlvLV4Jxf4qKXf9IJo8XhrfAX+Owce
	IoyENFVc4FXkFYkdXNaLf5/3VlLV+bDK/kJlTeCyWhc9r+Cor7RIQ1U06n0TuFyy
	y8K/7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqmyqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:25:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so69012785a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774614332; x=1775219132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZJUaWKKLy7fIGvhQ1mOhekag/nz1OSDsdqdjemihQY=;
        b=EAyQsqjuZZib19LtNbivWZflkP32kwWmcH2WGnsXWAFYVxvB7U47889GS4kyrA9NSq
         AWCrZ6cQsrDNvUj1W9oeDh9chYl10wWAAqrZCrXig4GTxSQG66odz4CvkJJ5UQTSWmFG
         yqlxrn/Sv4GZpY98TgKHkNsT3Wtu8QZtPT8sYBU5VkMBboSRwgwB7kb5VCfTQokJxOQz
         P4bAGRZDzBzY7jb89qb0o9JTUV/pdzz+7t0+2wOO6tSs2nEmLvujWhiAj+aLhVPKnu/s
         C4E2+vsvK1BiOBKvHy1cw4w2bgLO/VxfWT0SeGlckOI60/vgVXHMARsmRbQnBNYi4JTC
         f83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774614332; x=1775219132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZJUaWKKLy7fIGvhQ1mOhekag/nz1OSDsdqdjemihQY=;
        b=TWW1ltbRg69XDiVJ4p6pUGZX7yYe2AeqKPj4fjYDuOqa+3KpCnAnguXghOuCPlSuLw
         cI/OvHvXtEVYXkH+jzSf6ZSxovs/DFcKoNwZtGYj2vMvi9BrHqahw4p1kDetkg7R749Q
         TzSflStmnYv8qelDHE4M0/XLgEPo8mhoDAfNCbBle9ltKSzRi/Scf5nD7aihAV5mfXQf
         woYs5uyXcLJMP4ATn/FFLnMHqU0JKYkM0I1wksgcw8vzeKpcxytMp3bknljXgPlOPSpp
         Hnl5d0AHxLSCpdBp5f6SNE28+DftcnyjtOZpa+tmaAGC3KK8J3z6twrLoxrYNGKMrf2S
         l6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUnI8GPbf+rRcb4o30sn7aKiQQJ/AKRg7qqhgm8YSLIqGclO7rtCDnGjMsnGayt3w7DfuNJxHdqxhge@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLnRjsUeYj+g9FuHy+cZ9XU2pzbBPe0gJaX8jEt4JSP8PNCxe
	Nd11+MzWN2l59T67bjMFVs51gbiF6h8ufTp4iDZS8//mZrwgS9YoUm5JBROpHWrayK2QYdiAGMG
	eAN4AL6NVUn22iAFF525s10uxdsO9jkwhwZ2U7HY5Q8iC8McSGW7EEUjGcTO+Eomq
X-Gm-Gg: ATEYQzwrThlbr+ozDaD4InqSImk2dAb79NrlOI0gtfqdKr4vq2FFEfl0X3Ar77leR1x
	iv+PiYt052WZ56PWQQVD1BfVR1Ei/2Qtx3NGDjeQv0RYgG4fFt4Lu8glgrJcRCDT8V53AvIzn88
	inQGqzOEpe/tHgpt/s9T3Xh4EUpIaxnDsKrhYXANt5+nEsIjlRvFOv3MiV1MjWEh9XXcXgO4hP3
	6iXfuBYoeO+qEgFEn58VUueqv+pz0YanQBkWS8ydmMbx487tytkluk0jn7QgwFIjFvrb6CQPb57
	xCo8PL5cVrFlBefXTKapbwkt1pEm0VjJIqM0ssvZvQf4KYS6LISQQrirNVW2P5JOH8gZdEpQaK7
	1MbXQ8u8vUL/WfVusLcCQ+20vra/Q/G2edtCgz5Ohh64/6YpEA0wx68OnokSY5d7OVjE1rbeqTD
	tvfY8=
X-Received: by 2002:ad4:5f09:0:b0:89c:d5f4:7b2c with SMTP id 6a1803df08f44-89ce8e419femr22492296d6.5.1774614331991;
        Fri, 27 Mar 2026 05:25:31 -0700 (PDT)
X-Received: by 2002:ad4:5f09:0:b0:89c:d5f4:7b2c with SMTP id 6a1803df08f44-89ce8e419femr22491826d6.5.1774614331461;
        Fri, 27 Mar 2026 05:25:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b200206c3sm245110466b.0.2026.03.27.05.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:25:30 -0700 (PDT)
Message-ID: <de024120-a67c-4f4e-aeb3-29fa26b76678@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:25:28 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add missing CX power domain
 to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
 <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NCBTYWx0ZWRfXwfnNoZV60hsi
 O2mWjFaz1phxqPv76lISNkqDq4ZosP8mEGEZBm3hsRLVsSPuUhrfHM0cYmOnmMY6OrYrpkv0uLk
 kYI5Ragz4ZUHn7SWY6HTIGWaO8+F7V/ZTb6pp8E4Ihpd+596TqtuY8a3E3YsSQOb1v2ekosp/Qz
 lZkXJZNsGto1cB7K38bpV3GNgbMWmWc+ScAZWKhTEgvr/AYPx9lrE0Nt+EJIvVKni2ZGz2U6nL/
 8xImfEFHB2Kn7QNgZ5jppb1eO4DOCDZ+LBZhL/sg4yDMONCpO7CrOMeDBOv1Lg7hAvVdgaWvAG2
 bQ/dXNcp7OfZrbNtJBs98D11Z5dRSXLttaJKn9DJqqQvRDQDqW5BWtZily5HjYXkfjQxolKXpdb
 7FvzIbohSUxJpJIFsp5sqS2z9xdwFmfE3ODUSvXukBGCrYuEb0sA145L2UuESBNHHv4I2PPAO0+
 sbUjg2KpC6qLl7avs4w==
X-Proofpoint-GUID: n7PnnxZWws0WTvxoLEHYPpoCv3kD35UN
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c6773d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hvCAL5AnRklPZhNa95gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: n7PnnxZWws0WTvxoLEHYPpoCv3kD35UN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270084

On 3/27/26 1:13 PM, Abel Vesa wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
